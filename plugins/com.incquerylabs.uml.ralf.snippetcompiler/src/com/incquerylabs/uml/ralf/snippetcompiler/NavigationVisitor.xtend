package com.incquerylabs.uml.ralf.snippetcompiler

import com.incquerylabs.uml.ralf.reducedAlfLanguage.AssociationAccessExpression
import com.incquerylabs.uml.ralf.reducedAlfLanguage.FilterExpression
import com.incquerylabs.uml.ralf.reducedAlfLanguage.FeatureInvocationExpression

class NavigationVisitor {
	/**
	 * Visit an association which is the end-point of an access chain.
	 * E.g.: A::instances().one()->a->b->c;
	 * 
	 * Params:
	 * 	- AssociationAccessExpression ex: Association expression that contains the navigation chain
	 *  - StringBuilder parent: StringBuilder that can be used to add snippet fragments to the containing statement		
	 * 
	 */
	def String visitAssociation(AssociationAccessExpression ex, StringBuilder parent){
		throw new UnsupportedOperationException("Navigation chain visiting is unimplemented")
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
	def String visitFilter(FilterExpression ex, StringBuilder parent){
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
	def String visitOne(FeatureInvocationExpression ex, StringBuilder parent){
		throw new UnsupportedOperationException("Navigation chain visiting is unimplemented")	
	}
	
	
	/**
	 * Visit an attribute which is the end-point of an access chain.
	 * E.g.: A::instances().one()->a->b->c.name;
	 * 
	 * Params:
	 * 	- FeatureInvocationExpression ex: feature invocation expression that contains the navigation chain
	 *  - StringBuilder parent: StringBuilder that can be used to add snippet fragments to the containing statement	
	 */
	def String visitAttribute(FeatureInvocationExpression ex, StringBuilder parent){
		throw new UnsupportedOperationException("Navigation chain visiting is unimplemented")	
	}
}