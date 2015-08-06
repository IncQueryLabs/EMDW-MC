package com.incquerylabs.uml.ralf.snippetcompiler

import com.incquerylabs.emdw.cpp.common.descriptor.factory.IUmlDescriptorFactory
import com.incquerylabs.emdw.cpp.common.modelaccess.IModelAccess
import com.incquerylabs.uml.ralf.reducedAlfLanguage.ArithmeticExpression
import com.incquerylabs.uml.ralf.reducedAlfLanguage.BooleanUnaryExpression
import com.incquerylabs.uml.ralf.reducedAlfLanguage.ConditionalLogicalExpression
import com.incquerylabs.uml.ralf.reducedAlfLanguage.EqualityExpression
import com.incquerylabs.uml.ralf.reducedAlfLanguage.Expression
import com.incquerylabs.uml.ralf.reducedAlfLanguage.LogicalExpression
import com.incquerylabs.uml.ralf.reducedAlfLanguage.NumericUnaryExpression
import com.incquerylabs.uml.ralf.reducedAlfLanguage.RelationalExpression
import com.incquerylabs.uml.ralf.reducedAlfLanguage.ShiftExpression

class SnippetTemplateCompilerUtil {
	
	public IUmlDescriptorFactory descriptorFactory;
	//public IModelAccess modelAccess;
	
	new(IUmlDescriptorFactory factory/*, IModelAccess modelAccess*/){
		descriptorFactory = factory
		//this.modelAccess = modelAccess
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
	
//	def dispatch AbstractValueDescriptor getDescriptor(FeatureInvocationExpression ex){
//		val parameters = ex.parameters
//		val List<AbstractValueDescriptor> descriptors = Lists.newArrayList
//		if(parameters instanceof ExpressionList){
//			for(Expression expression : parameters.expressions){
//				descriptors.add(getDescriptor(expression))
//			}
//		}	
//		val descriptor = (modelAccess.createOperationCallBuilder => [
//			variable = getDescriptor(ex.context) as SingleValueDescriptor
//			operation = ex.operation
//			parameters = descriptors
//		]).build
//		
//		ex.context
//		ex.operation
//		descriptor
//			
//	}
//	
//	def dispatch AbstractValueDescriptor getDescriptor(PropertyAccessExpression ex){
//		(modelAccess.createPropertyAccessBuilder => [
//			variable = getDescriptor(ex.context) as SingleValueDescriptor
//			property = ex.property
//		]).build
//	}
//	
//	
//	def dispatch AbstractValueDescriptor getDescriptor(NameExpression ex){
//		val variable = ex.reference as Variable
//		if(variable != null){
//			return (descriptorFactory.createSingleValueDescriptorBuilder => [
//				name = variable.name
//				type = variable.type.type
//				isExistingVariable = true
//			]).build	
//		}
//		return null
//	}
}