package com.incquerylabs.uml.ralf.snippetcompiler

import com.google.common.collect.Lists
import com.incquerylabs.emdw.cpp.common.descriptor.factory.IUmlDescriptorFactory
import com.incquerylabs.emdw.valuedescriptor.ValueDescriptor
import com.incquerylabs.uml.ralf.reducedAlfLanguage.ArithmeticExpression
import com.incquerylabs.uml.ralf.reducedAlfLanguage.AssignmentExpression
import com.incquerylabs.uml.ralf.reducedAlfLanguage.AssociationAccessExpression
import com.incquerylabs.uml.ralf.reducedAlfLanguage.BooleanLiteralExpression
import com.incquerylabs.uml.ralf.reducedAlfLanguage.BooleanUnaryExpression
import com.incquerylabs.uml.ralf.reducedAlfLanguage.CastExpression
import com.incquerylabs.uml.ralf.reducedAlfLanguage.ConditionalLogicalExpression
import com.incquerylabs.uml.ralf.reducedAlfLanguage.EqualityExpression
import com.incquerylabs.uml.ralf.reducedAlfLanguage.Expression
import com.incquerylabs.uml.ralf.reducedAlfLanguage.ExpressionList
import com.incquerylabs.uml.ralf.reducedAlfLanguage.FeatureInvocationExpression
import com.incquerylabs.uml.ralf.reducedAlfLanguage.LocalNameDeclarationStatement
import com.incquerylabs.uml.ralf.reducedAlfLanguage.LogicalExpression
import com.incquerylabs.uml.ralf.reducedAlfLanguage.NameExpression
import com.incquerylabs.uml.ralf.reducedAlfLanguage.NaturalLiteralExpression
import com.incquerylabs.uml.ralf.reducedAlfLanguage.NumericUnaryExpression
import com.incquerylabs.uml.ralf.reducedAlfLanguage.RealLiteralExpression
import com.incquerylabs.uml.ralf.reducedAlfLanguage.RelationalExpression
import com.incquerylabs.uml.ralf.reducedAlfLanguage.ShiftExpression
import com.incquerylabs.uml.ralf.reducedAlfLanguage.StringLiteralExpression
import com.incquerylabs.uml.ralf.reducedAlfLanguage.Variable
import com.incquerylabs.uml.ralf.scoping.IUMLContextProvider
import java.util.List
import org.eclipse.uml2.uml.Operation
import org.eclipse.uml2.uml.Property

class SnippetTemplateCompilerUtil {
	
	public IUmlDescriptorFactory descriptorFactory;
	public IUMLContextProvider context
	
	new(IUmlDescriptorFactory factory, IUMLContextProvider context){
		descriptorFactory = factory
		this.context = context
	}

	def dispatch parenthesisRequired(Expression ex) {
        return false
	}
	
	def dispatch parenthesisRequired(ArithmeticExpression ex) {
	    if (ex.eContainer instanceof NumericUnaryExpression) {
            return true
        }
	    if (ex.eContainer instanceof ArithmeticExpression) {
	    	val parent = ex.eContainer as ArithmeticExpression
	    	if(ex.operator.equals("+") || ex.operator.equals("-")){
	    		if(parent.operator.equals("*") || parent.operator.equals("/") || parent.operator.equals("%")){
	    			return true
	    		}
	    	}else{
	    		return false
	    	}
        }
        return false
	}
	
	def dispatch parenthesisRequired(ShiftExpression ex) {
	    if (ex.eContainer instanceof NumericUnaryExpression) {
            return true
        }
	    if (ex.eContainer instanceof ArithmeticExpression) {
	    	return true
        }
        return false
	}
	
	def dispatch parenthesisRequired(RelationalExpression ex) {
	    if (ex.eContainer instanceof BooleanUnaryExpression) {
            return true
        }
        if(ex.eContainer instanceof ConditionalLogicalExpression){
        	return true
        }
        return false
	}
	
	def dispatch parenthesisRequired(EqualityExpression ex) {
	    if (ex.eContainer instanceof BooleanUnaryExpression) {
            return true
        }
        return false
	}
	
	def dispatch parenthesisRequired(LogicalExpression ex) {
	    if (ex.eContainer instanceof NumericUnaryExpression) {
            return true
        }
	    if (ex.eContainer instanceof ArithmeticExpression) {
	    	return true
        }
        if (ex.eContainer instanceof ShiftExpression) {
	    	return true
        }
        if (ex.eContainer instanceof RelationalExpression) {
	    	return true
        }
        if (ex.eContainer instanceof EqualityExpression) {
	    	return true
        }
        return false
	}
	
	def dispatch parenthesisRequired(ConditionalLogicalExpression ex) {
	    if (ex.eContainer instanceof BooleanUnaryExpression) {
            return true
        }
        if (ex.eContainer instanceof EqualityExpression) {
	    	return true
        }
        return false
	}
	
	//Descriptors
	//Model Access
	
	def dispatch ValueDescriptor getDescriptor(FeatureInvocationExpression ex) {
	    switch (ex.feature) {
	        Operation: getDescriptor(ex, ex.feature as Operation)
	        Property: getDescriptor(ex, ex.feature as Property)
	        default: throw new UnsupportedOperationException("Invalid feature invocation")
	    } 
	}
	    
	private def ValueDescriptor getDescriptor(FeatureInvocationExpression ex, Operation op){
		val parameters = ex.parameters
		val List<ValueDescriptor> descriptors = Lists.newArrayList
		
		
		if(parameters instanceof ExpressionList){
			for(Expression expression : parameters.expressions){
				descriptors.add(getDescriptor(expression))
			}
		}	
		
		val descriptor = (descriptorFactory.createOperationCallBuilder => [
			variable = getDescriptor(ex.context)
			operation = op
			parameters = descriptors
		]).build
		descriptor
			
	}
	
	private def ValueDescriptor getDescriptor(FeatureInvocationExpression ex, Property prop){
		(descriptorFactory.createPropertyReadBuilder => [
			variable = getDescriptor(ex.context)
			property = prop
		]).build
	}
	
	def dispatch ValueDescriptor getDescriptor(AssociationAccessExpression ex){
		(descriptorFactory.createPropertyReadBuilder => [
			variable = getDescriptor(ex.context)
			property = ex.association
		]).build
	}
	
	def dispatch ValueDescriptor getDescriptor(AssignmentExpression ex){
		val lhs = ex.leftHandSide
		if (lhs != null) {
			return (descriptorFactory.createPropertyWriteBuilder => [
			    //TODO update property write builder
				variable = getDescriptor(lhs)
//				property = lhs.property
				newValue = getDescriptor(ex.rightHandSide)
			]).build
		}
		return null
	}
	 
//	def dispatch ValueDescriptor getDescriptor(FeatureLeftHandSide lhs){
//		(descriptorFactory.createPropertyReadBuilder => [
//			variable = getDescriptor(lhs.expression.context)
//			property = lhs.expression.property
//		]).build
//	}
	
	//Variables
	
	def dispatch ValueDescriptor getDescriptor(CastExpression ex){
		(descriptorFactory.createSingleVariableDescriptorBuilder => [
			type = ex.type.type
		]).build
		
	}
	
	
	def dispatch ValueDescriptor getDescriptor(LocalNameDeclarationStatement st){
		(descriptorFactory.createSingleVariableDescriptorBuilder => [
			name = st.variable.name
			type = st.variable.type.type
		]).build
	}
		
	def dispatch ValueDescriptor getDescriptor(NameExpression ex){
		val variable = ex.reference as Variable
		if(variable != null){
			return (descriptorFactory.createSingleVariableDescriptorBuilder => [
				name = variable.name
				type = variable.type.type
				isExistingVariable = true
			]).build	
		}
		return null
	}
	
	def dispatch ValueDescriptor getDescriptor(NaturalLiteralExpression ex){
		(descriptorFactory.createLiteralDescriptorBuilder => [
			literal = ex.value
			type = context.getPrimitiveType(IUMLContextProvider.INTEGER_TYPE)
		]).build
	}
	
	def dispatch ValueDescriptor getDescriptor(RealLiteralExpression ex){
		(descriptorFactory.createLiteralDescriptorBuilder => [
			literal = ex.value
			type = context.getPrimitiveType(IUMLContextProvider.REAL_TYPE)
		]).build
	}
	
	def dispatch ValueDescriptor getDescriptor(StringLiteralExpression ex){
		(descriptorFactory.createLiteralDescriptorBuilder => [
			literal = ex.value
			type = context.getPrimitiveType(IUMLContextProvider.STRING_TYPE)
		]).build
	}
	
	def dispatch ValueDescriptor getDescriptor(BooleanLiteralExpression ex){
		(descriptorFactory.createLiteralDescriptorBuilder => [
			literal = ex.value
			type = context.getPrimitiveType(IUMLContextProvider.BOOLEAN_TYPE)
		]).build
	}
}