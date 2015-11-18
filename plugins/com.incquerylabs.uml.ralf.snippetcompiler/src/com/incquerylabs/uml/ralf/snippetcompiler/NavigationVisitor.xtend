package com.incquerylabs.uml.ralf.snippetcompiler

import com.incquerylabs.emdw.valuedescriptor.ValueDescriptor
import com.incquerylabs.uml.ralf.ReducedAlfSystem
import com.incquerylabs.uml.ralf.reducedAlfLanguage.AssociationAccessExpression
import com.incquerylabs.uml.ralf.reducedAlfLanguage.ClassExtentExpression
import com.incquerylabs.uml.ralf.reducedAlfLanguage.Expression
import com.incquerylabs.uml.ralf.reducedAlfLanguage.FeatureInvocationExpression
import com.incquerylabs.uml.ralf.reducedAlfLanguage.FilterExpression
import org.apache.log4j.Logger
import org.eclipse.emf.ecore.EObject
import org.eclipse.uml2.uml.Operation
import org.eclipse.uml2.uml.ParameterDirectionKind

class NavigationVisitor {

	// TODO: extract from here and from CPPTemplate
	public static val OPERATION_NAMESPACE = '''::xumlrt'''
	public static val SELECT_ANY_FQN = '''«OPERATION_NAMESPACE»::select_any'''
	public static val SELECT_ANY_WHERE_FQN = '''«OPERATION_NAMESPACE»::select_any_where'''
	public static val SELECT_MANY_FQN = '''«OPERATION_NAMESPACE»::select_many'''
	public static val SELECT_MANY_WHERE_FQN = '''«OPERATION_NAMESPACE»::select_many_where'''
	public static val SAFE_CHAIN_FQN = '''«OPERATION_NAMESPACE»::safe_chain'''
	public static val MERGED_CHAIN_FQN = '''«OPERATION_NAMESPACE»::merged_chain'''
	public static val INDIRECT_CHAIN_FQN = '''«OPERATION_NAMESPACE»::indirect_chain'''
	
	

	extension ExpressionVisitor expressionVisitor
	extension ReducedAlfSystem typeSystem
	extension SnippetTemplateCompilerUtil util
	extension LoggerUtil loggerutil = new LoggerUtil
	extension Logger logger = Logger.getLogger(class)

	// TODO: Temporary solution
	private int recursionDepth;

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
	def ValueDescriptor visitAssociation(AssociationAccessExpression ex, StringBuilder parent) {
		logger.logVisitingStarted(ex)
		recursionDepth++

		val childExpr = delegate(ex.context, parent)
		val propertyAccessDescriptor = (descriptorFactory.createPropertyReadBuilder => [
			property = ex.association
			variable = childExpr
		]).build
		val ctx = ex.context

		val expr = if (ctx instanceof AssociationAccessExpression) { // if an association access precedes this association access	
				val ctxDescriptor = ctx.descriptor

				val parentAssociation = ctx as AssociationAccessExpression
				val parentUpperBound = parentAssociation.association.upper
				val parentLowerBound = parentAssociation.association.lower
				if (parentUpperBound == 1 && parentLowerBound == 1) { // a->(1)b->c => simple dereference
					propertyAccessDescriptor.stringRepresentation
				} else if (parentUpperBound == 1 && parentLowerBound == 0) { // a->(0..1)b->c => safe chain
					'''«SAFE_CHAIN_FQN»(«childExpr», «ex.toMemberAccess(ctxDescriptor)»)'''
				} else { // a->(*)b->c
					val currentUpperBound = ex.association.upper
					if (currentUpperBound ==
						-1
					) { // a->(*)b->(*)c => merged chain
						'''«MERGED_CHAIN_FQN»< «propertyAccessDescriptor.fullType» >(«childExpr.stringRepresentation», «ex.toMemberAccess(ctxDescriptor)»)'''
					} else { // a->(*)b->(0..1)c or a->(*)b->(1)c => indirect chain
						'''«INDIRECT_CHAIN_FQN»< «propertyAccessDescriptor.fullType» >(«childExpr.stringRepresentation», «ex.toMemberAccess(ctxDescriptor)»)'''
					}
				}
			} else {
				propertyAccessDescriptor.stringRepresentation
			}
		
		recursionDepth--

		if (recursionDepth == 0) {
			val wrappedEx = '''«SELECT_MANY_FQN»(«expr»)'''
			return if(ex.isFlatteningNeeded)			
					wrappedEx.finalize(ex, parent)
				else 
					createExistingVariableDescriptor(ex, wrappedEx, typeSystem.type(ex).value.umlType)
		}	
					
		logger.logVisitingFinished(ex, expr)
		return createExistingVariableDescriptor(ex, expr, typeSystem.type(ex).value.umlType)
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
	def ValueDescriptor visitFilter(FilterExpression ex, StringBuilder parent) {
		logger.logVisitingStarted(ex)
		recursionDepth++

		val parameterType = typeSystem.objectType(ex.declaration, ex).value.umlType
		val typeDescriptor = ex.createNewVariableDescriptor(parameterType)

		var lambda = ex.composeLambda(typeDescriptor)
		var childExpr = ex.context.delegate(parent).stringRepresentation

		val operation = if(ex.eContainer.isOne) SELECT_ANY_WHERE_FQN else SELECT_MANY_WHERE_FQN

		val expr = '''«operation»< «typeDescriptor.fullType» >(«childExpr», «lambda»)'''

		recursionDepth--
		
		if (recursionDepth == 0 && ex.isFlatteningNeeded)
			return expr.finalize(ex, parent)

		logger.logVisitingFinished(ex, expr)
		return createExistingVariableDescriptor(ex, expr, typeSystem.type(ex).value.umlType)
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
	def ValueDescriptor visitOne(FeatureInvocationExpression ex, StringBuilder parent) {
		logger.logVisitingStarted(ex)
		recursionDepth++

		val childExpression = delegate(ex.context, parent)
		val expr = if (!(ex.context instanceof FilterExpression))
			'''«SELECT_ANY_FQN»(«childExpression.stringRepresentation»)'''
		else
			childExpression.stringRepresentation
			
		recursionDepth--
		
		if (recursionDepth == 0 && ex.isFlatteningNeeded)
			return expr.finalize(ex, parent)
		
		logger.logVisitingFinished(ex, expr)
		return createExistingVariableDescriptor(ex, expr, typeSystem.type(ex).value.umlType)
	}
	
	def ValueDescriptor visitClassExtent(ClassExtentExpression ex, StringBuilder parent) {
		logger.logVisitingStarted(ex)
		recursionDepth++

		val classDescriptor = ex.descriptor
		val expr = classDescriptor.stringRepresentation

		recursionDepth--

		if(recursionDepth == 0) {
			if (ex.isFlatteningNeeded)
				return '''«SELECT_MANY_FQN»(«expr»)'''.finalize(ex, parent)
			else
				return createExistingVariableDescriptor(ex, '''«SELECT_MANY_FQN»(«expr»)''', typeSystem.type(ex).value.umlType)
		}
		
		logger.logVisitingFinished(ex, expr)
		return classDescriptor
	}

	/**
	 * Visit an attribute which is the end-point of an access chain.
	 * E.g.: A::instances().one()->a->b->c.name;
	 * 
	 * Params:
	 * 	- FeatureInvocationExpression ex: feature invocation expression that contains the navigation chain
	 *  - StringBuilder parent: StringBuilder that can be used to add snippet fragments to the containing statement	
	 */
	def ValueDescriptor visitAttribute(FeatureInvocationExpression ex, StringBuilder parent) {
		throw new UnsupportedOperationException("Navigation chain visiting is unimplemented")
	}

	private def composeLambda(FilterExpression it, ValueDescriptor typeDescriptor) {
		val tmpRecursionDepth = recursionDepth
		recursionDepth = 0
		
		val lambdaPreprocess = new StringBuilder
		
		val captureType = "&"
		val parameterList = '''«typeDescriptor.fullType» «declaration.name»'''
		val lambdaBody = expression.delegate(lambdaPreprocess).stringRepresentation
				
		recursionDepth = tmpRecursionDepth
		
		return '''[«captureType»](«parameterList») {
			«lambdaPreprocess»
			return «lambdaBody»;
		}''' 
	}

	private def dispatch ValueDescriptor delegate(FilterExpression it, StringBuilder parent) {
		visitFilter(parent)
	}
	
	private def dispatch ValueDescriptor delegate(AssociationAccessExpression it, StringBuilder parent) {
		visitAssociation(parent)
	}

	private def dispatch ValueDescriptor delegate(Expression it, StringBuilder parent) {
		visit(parent)
	}

	private def isOne(EObject eObj) {
		if (eObj instanceof FeatureInvocationExpression) {
			if (eObj.feature instanceof Operation) {
				val operation = eObj.feature as Operation

				return operation.name.equals("one") && operation.ownedParameters.filter [ param |
					!(param.direction == ParameterDirectionKind.RETURN_LITERAL)
				].size == 0
			}
		}
		return false
	}

	// TODO: This should use a descriptor instead of string replace
	private def getName(AssociationAccessExpression it, ValueDescriptor parentDescriptor) {
		val contextString = '''«parentDescriptor.stringRepresentation»->'''
		val assocDescriptor = it.descriptor
		val result = assocDescriptor.stringRepresentation.replace(contextString, "")
		return result
	}

	private def toMemberAccess(AssociationAccessExpression it, ValueDescriptor parentDescriptor) {
		'''&«IF parentDescriptor.templateTypes.empty»«parentDescriptor.baseType.removePointer»«ELSE»«parentDescriptor.templateTypes.get(0).removePointer»«ENDIF»::«it.getName(parentDescriptor)»'''
	}

	private def removePointer(String it) {
		replace('*', '')
	}

	private def finalize(CharSequence builtExpression, Expression ex, StringBuilder parent) {
		val variableType = ex.type.value.umlType
		val variableDescriptor = ex.createNewVariableDescriptor(variableType)

		parent.append('''«variableDescriptor.fullType» «variableDescriptor.stringRepresentation» = «builtExpression»;
		''')
		return variableDescriptor
	}
}