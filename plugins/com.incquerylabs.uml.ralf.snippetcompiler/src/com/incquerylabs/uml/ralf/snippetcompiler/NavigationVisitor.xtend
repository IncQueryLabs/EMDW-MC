package com.incquerylabs.uml.ralf.snippetcompiler

import com.incquerylabs.uml.ralf.ReducedAlfSystem
import com.incquerylabs.uml.ralf.reducedAlfLanguage.AssociationAccessExpression
import com.incquerylabs.uml.ralf.reducedAlfLanguage.Expression
import com.incquerylabs.uml.ralf.reducedAlfLanguage.FeatureInvocationExpression
import com.incquerylabs.uml.ralf.reducedAlfLanguage.FilterExpression

class NavigationVisitor {

	extension ExpressionVisitor expressionVisitor;
	extension ReducedAlfSystem typeSystem;

	new(ExpressionVisitor expressionVisitor, ReducedAlfSystem typeSystem) {
		this.expressionVisitor = expressionVisitor
		this.typeSystem = typeSystem;
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
		val ctx = ex.context
		if(ctx instanceof AssociationAccessExpression) {
			val parentAssociation = ctx as AssociationAccessExpression
			val parentUpperBound = parentAssociation.association.upper
			val parentLowerBound = parentAssociation.association.lower
			if(parentUpperBound == 1 && parentLowerBound == 1) {
				// simple dereference
				'''->«ex.association.name»'''
			} else if (parentUpperBound == 1 && parentLowerBound == 0) {
				// safe chain
				'''::xtuml::safe_chain<>();'''
			} else {
				val currentUpperBound = ex.association.upper
				if(currentUpperBound == -1) {
					// merged chain
					'''::xtuml::merged_chain<>();'''
				} else {
					// indirect chain
					'''::xtuml::indirect_chain<>();'''
				}
			}
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
		val type = typeSystem.variableType(ex.declaration)
		throw new UnsupportedOperationException("Navigation chain visiting is unimplemented")
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
		if(!(ex.context instanceof FilterExpression))
			'''::xtuml::select_any(«childExpression»)'''
		else
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

//	private def dispatch String delegate(AssociationAccessExpression ex, StringBuilder parent) {
//		visitAssociation(ex, parent)
//	}

	private def dispatch String delegate(FilterExpression ex, StringBuilder parent) {
		visitFilter(ex, parent)
	}

	private def dispatch String delegate(Expression ex, StringBuilder parent) {
		ex.visit(parent)
	}
}