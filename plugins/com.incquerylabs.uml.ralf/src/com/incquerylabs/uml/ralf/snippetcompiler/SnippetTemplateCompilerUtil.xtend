package com.incquerylabs.uml.ralf.snippetcompiler

import com.google.common.collect.Lists
import com.incquerylabs.emdw.cpp.common.descriptor.factory.IUmlDescriptorFactory
import com.incquerylabs.emdw.cpp.common.modelaccess.IModelAccess
import com.incquerylabs.emdw.valuedescriptor.ValueDescriptor
import com.incquerylabs.uml.ralf.reducedAlfLanguage.ArithmeticExpression
import com.incquerylabs.uml.ralf.reducedAlfLanguage.AssignmentExpression
import com.incquerylabs.uml.ralf.reducedAlfLanguage.AssociationAccessExpression
import com.incquerylabs.uml.ralf.reducedAlfLanguage.BooleanUnaryExpression
import com.incquerylabs.uml.ralf.reducedAlfLanguage.CastExpression
import com.incquerylabs.uml.ralf.reducedAlfLanguage.ConditionalLogicalExpression
import com.incquerylabs.uml.ralf.reducedAlfLanguage.EqualityExpression
import com.incquerylabs.uml.ralf.reducedAlfLanguage.Expression
import com.incquerylabs.uml.ralf.reducedAlfLanguage.ExpressionList
import com.incquerylabs.uml.ralf.reducedAlfLanguage.FeatureInvocationExpression
import com.incquerylabs.uml.ralf.reducedAlfLanguage.FeatureLeftHandSide
import com.incquerylabs.uml.ralf.reducedAlfLanguage.LocalNameDeclarationStatement
import com.incquerylabs.uml.ralf.reducedAlfLanguage.LogicalExpression
import com.incquerylabs.uml.ralf.reducedAlfLanguage.NameExpression
import com.incquerylabs.uml.ralf.reducedAlfLanguage.NumericUnaryExpression
import com.incquerylabs.uml.ralf.reducedAlfLanguage.PropertyAccessExpression
import com.incquerylabs.uml.ralf.reducedAlfLanguage.RelationalExpression
import com.incquerylabs.uml.ralf.reducedAlfLanguage.ShiftExpression
import com.incquerylabs.uml.ralf.reducedAlfLanguage.Variable
import java.util.List

class SnippetTemplateCompilerUtil {
	
	public IUmlDescriptorFactory descriptorFactory;
	public IModelAccess modelAccess;
	
	new(IUmlDescriptorFactory factory, IModelAccess modelAccess){
		descriptorFactory = factory
		this.modelAccess = modelAccess
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
	
	def dispatch ValueDescriptor getDescriptor(FeatureInvocationExpression ex){
		val parameters = ex.parameters
		val List<ValueDescriptor> descriptors = Lists.newArrayList
		
		
		if(parameters instanceof ExpressionList){
			for(Expression expression : parameters.expressions){
				descriptors.add(getDescriptor(expression))
			}
		}	
		
		val descriptor = (modelAccess.createOperationCallBuilder => [
			variable = getDescriptor(ex.context)
			operation = ex.operation
			parameters = descriptors
		]).build
		descriptor
			
	}
	
	def dispatch ValueDescriptor getDescriptor(PropertyAccessExpression ex){
		(modelAccess.createPropertyReadBuilder => [
			variable = getDescriptor(ex.context)
			property = ex.property
		]).build
	}
	
	def dispatch ValueDescriptor getDescriptor(AssociationAccessExpression ex){
		(modelAccess.createPropertyReadBuilder => [
			variable = getDescriptor(ex.context)
			property = ex.association
		]).build
	}
	
	def dispatch ValueDescriptor getDescriptor(AssignmentExpression ex){
		val lhs = ex.leftHandSide as FeatureLeftHandSide
		if(lhs!=null){
			return (modelAccess.createPropertyWriteBuilder => [
				variable = getDescriptor(lhs.expression.context)
				property = lhs.expression.property
				newValue = getDescriptor(ex.rightHandSide)
			]).build
		}
		return null
	}
	
	def dispatch ValueDescriptor getDescriptor(FeatureLeftHandSide lhs){
		(modelAccess.createPropertyReadBuilder => [
			variable = getDescriptor(lhs.expression.context)
			property = lhs.expression.property
		]).build
	}
	
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
}