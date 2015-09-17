package com.incquerylabs.uml.ralf.snippetcompiler

import com.incquerylabs.emdw.valuedescriptor.ValueDescriptor
import com.incquerylabs.emdw.valuedescriptor.VariableDescriptor
import com.incquerylabs.uml.ralf.ReducedAlfSystem
import com.incquerylabs.uml.ralf.reducedAlfLanguage.AssociationAccessExpression
import com.incquerylabs.uml.ralf.reducedAlfLanguage.Expression
import com.incquerylabs.uml.ralf.reducedAlfLanguage.FeatureInvocationExpression
import com.incquerylabs.uml.ralf.reducedAlfLanguage.FilterExpression
import org.eclipse.uml2.uml.Operation
import org.eclipse.uml2.uml.ParameterDirectionKind
import org.eclipse.emf.ecore.EObject

class NavigationVisitor {

	private static val OPERATION_NAMESPACE = "::xtuml"

	extension ExpressionVisitor expressionVisitor
	extension ReducedAlfSystem typeSystem
	extension SnippetTemplateCompilerUtil util
	
	// TODO: Temporary solution
	private boolean associating;

	new(ExpressionVisitor expressionVisitor, ReducedAlfSystem typeSystem, SnippetTemplateCompilerUtil util) {
		this.expressionVisitor = expressionVisitor
		this.typeSystem = typeSystem
		this.util = util
	}

	/**
	 * Visit an association which is the end-point of an access chain.
	 * E.g.: A::instances().one()->a->b->c;
	 * 
	 * Params:
	 * 	- AssociationAccessExpression ex: Association expression that contains the navigation chain
	 *  - StringBuilder parent: StringBuilder that can be used to add snippet fragments to the containing statement		
	 * 
	 */
	def String visitAssociation(AssociationAccessExpression ex, StringBuilder parent) {
		if(!associating)
			associating = true
			
		val childExpr = delegate(ex.context, parent)
		val assocDescriptor = ex.descriptor
		val ctx = ex.context
		
		val expr = if (ctx instanceof AssociationAccessExpression) { // if an association access precedes this association access	
			val ctxDescriptor = ctx.descriptor

			val parentAssociation = ctx as AssociationAccessExpression
			val parentUpperBound = parentAssociation.association.upper
			val parentLowerBound = parentAssociation.association.lower
			if (parentUpperBound == 1 && parentLowerBound == 1) { // a->(1)b->c => simple dereference
				'''«childExpr»->«ex.name»'''
			} else if (parentUpperBound == 1 && parentLowerBound == 0) { // a->(0..1)b->c => safe chain
				'''«OPERATION_NAMESPACE»::safe_chain(«childExpr», «ex.toMemberAccess(ctxDescriptor)»)'''
			} else { // a->(*)b->c
				val currentUpperBound = ex.association.upper
				if (currentUpperBound ==
					-1
				) { // a->(*)b->(*)c => merged chain
					'''«OPERATION_NAMESPACE»::merged_chain< «assocDescriptor.fullType» >(«childExpr», «ex.toMemberAccess(ctxDescriptor)»)'''
				} else { // a->(*)b->(0..1)c or a->(*)b->(1)c => indirect chain
					'''«OPERATION_NAMESPACE»::indirect_chain< «assocDescriptor.fullType» >(«childExpr», «ex.toMemberAccess(ctxDescriptor)»)'''
				}
			}
		} else {
			'''«assocDescriptor.stringRepresentation»'''
		}
		
		if (associating && ex.association.upper == -1 && !ex.eContainer.isOne) {
			associating = false
			'''«OPERATION_NAMESPACE»::select_many(«expr»)'''
		} else {
			return expr
		}		
	}

	/**
	 * Visit a navigation chain that ends on a 'filter' expression
	 * E.g.: 
	 * 	A a = new A();
	 *  a->b->c=>filter(item : item.name = "John Doe");
	 * 
	 * Params:
	 * 	- FilterExpression ex: filter expression that contains the navigation chain
	 *  - StringBuilder parent: StringBuilder that can be used to add snippet fragments to the containing statement		
	 * 
	 */
	def String visitFilter(FilterExpression ex, StringBuilder parent) {
		val parameterType = typeSystem.type(ex.declaration).value.umlType
		val typeDescriptor = (descriptorFactory.createSingleVariableDescriptorBuilder => [
			type = parameterType
			name = null
		]).build

		var lambda = ex.composeLambda(typeDescriptor)
		var childExpr = ex.context.delegate(parent)

		val operation = if(ex.eContainer.isOne) "select_any_where" else "select_many_where"

		'''«OPERATION_NAMESPACE»::«operation»<«typeDescriptor.fullType»>(«childExpr», «lambda»)'''
	}

	/**
	 * Visit a navigation chain that ends on the 'one()' operation
	 * E.g.: 
	 * 	A a = new A();
	 *  a->b->c.one();
	 * 
	 * Params:
	 * 	- FeatureInvocationExpression ex: feature invocation expression that contains the navigation chain
	 *  - StringBuilder parent: StringBuilder that can be used to add snippet fragments to the containing statement	
	 */
	def String visitOne(FeatureInvocationExpression ex, StringBuilder parent) {
		val childExpression = delegate(ex.context, parent)
		if (!(ex.context instanceof FilterExpression)) '''«OPERATION_NAMESPACE»::select_any(«childExpression»)''' else
			childExpression
	}

	/**
	 * Visit an attribute which is the end-point of an access chain.
	 * E.g.: A::instances().one()->a->b->c.name;
	 * 
	 * Params:
	 * 	- FeatureInvocationExpression ex: feature invocation expression that contains the navigation chain
	 *  - StringBuilder parent: StringBuilder that can be used to add snippet fragments to the containing statement	
	 */
	def String visitAttribute(FeatureInvocationExpression ex, StringBuilder parent) {
		throw new UnsupportedOperationException("Navigation chain visiting is unimplemented")
	}

	private def composeLambda(FilterExpression it, VariableDescriptor typeDescriptor) {
		
		val lambdaPreprocess = new StringBuilder;
		
		val captureType = "&"
		val parameterList = '''«typeDescriptor.fullType» «declaration.name»'''
		val lambdaBody = expression.delegate(lambdaPreprocess)
		'''[«captureType»](«parameterList») {
			«lambdaPreprocess»
			return «lambdaBody»;
		}'''
	}

	private def dispatch String delegate(FilterExpression it, StringBuilder parent) {
		visitFilter(parent)
	}
	
	private def dispatch String delegate(AssociationAccessExpression it, StringBuilder parent) {
		visitAssociation(parent)
	}

	private def dispatch String delegate(Expression it, StringBuilder parent) {
		visit(parent)
	}

	private def isOne(EObject eObj) {
		if (eObj instanceof FeatureInvocationExpression) {
			val featureInvocationExpression = eObj as FeatureInvocationExpression
			if (featureInvocationExpression.feature instanceof Operation) {
				val operation = featureInvocationExpression.feature as Operation

				if (operation.name.equals("one") && operation.ownedParameters.filter [ param |
					!(param.direction == ParameterDirectionKind.RETURN_LITERAL)
				].size == 0) {
					return true
				}
			}
		}
		return false
	}

	private def getName(AssociationAccessExpression it) '''«association.association.name»_«association.name»'''

	private def toMemberAccess(AssociationAccessExpression it, ValueDescriptor parentDescriptor) {
		'''&«IF parentDescriptor.templateTypes.empty»«parentDescriptor.baseType.removePointer»«ELSE»«parentDescriptor.templateTypes.get(0).removePointer»«ENDIF»::«name»'''
	}

	private def removePointer(String it) {
		replace('*', '')
	}
}