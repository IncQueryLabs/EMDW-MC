package com.incquerylabs.uml.ralf.snippetcompiler

import com.google.common.collect.Lists
import com.incquerylabs.emdw.valuedescriptor.ValueDescriptor
import com.incquerylabs.uml.ralf.ReducedAlfSystem
import com.incquerylabs.uml.ralf.reducedAlfLanguage.ArithmeticExpression
import com.incquerylabs.uml.ralf.reducedAlfLanguage.AssignmentExpression
import com.incquerylabs.uml.ralf.reducedAlfLanguage.AssociationAccessExpression
import com.incquerylabs.uml.ralf.reducedAlfLanguage.BitStringUnaryExpression
import com.incquerylabs.uml.ralf.reducedAlfLanguage.BlockStatement
import com.incquerylabs.uml.ralf.reducedAlfLanguage.BooleanLiteralExpression
import com.incquerylabs.uml.ralf.reducedAlfLanguage.BooleanUnaryExpression
import com.incquerylabs.uml.ralf.reducedAlfLanguage.CastExpression
import com.incquerylabs.uml.ralf.reducedAlfLanguage.ConditionalLogicalExpression
import com.incquerylabs.uml.ralf.reducedAlfLanguage.ConditionalTestExpression
import com.incquerylabs.uml.ralf.reducedAlfLanguage.EqualityExpression
import com.incquerylabs.uml.ralf.reducedAlfLanguage.Expression
import com.incquerylabs.uml.ralf.reducedAlfLanguage.ExpressionList
import com.incquerylabs.uml.ralf.reducedAlfLanguage.ExpressionStatement
import com.incquerylabs.uml.ralf.reducedAlfLanguage.FeatureInvocationExpression
import com.incquerylabs.uml.ralf.reducedAlfLanguage.ForStatement
import com.incquerylabs.uml.ralf.reducedAlfLanguage.InstanceCreationExpression
import com.incquerylabs.uml.ralf.reducedAlfLanguage.LinkOperationExpression
import com.incquerylabs.uml.ralf.reducedAlfLanguage.LocalNameDeclarationStatement
import com.incquerylabs.uml.ralf.reducedAlfLanguage.LogicalExpression
import com.incquerylabs.uml.ralf.reducedAlfLanguage.NameExpression
import com.incquerylabs.uml.ralf.reducedAlfLanguage.NamedTuple
import com.incquerylabs.uml.ralf.reducedAlfLanguage.NaturalLiteralExpression
import com.incquerylabs.uml.ralf.reducedAlfLanguage.NullExpression
import com.incquerylabs.uml.ralf.reducedAlfLanguage.NumericUnaryExpression
import com.incquerylabs.uml.ralf.reducedAlfLanguage.PostfixExpression
import com.incquerylabs.uml.ralf.reducedAlfLanguage.PrefixExpression
import com.incquerylabs.uml.ralf.reducedAlfLanguage.RealLiteralExpression
import com.incquerylabs.uml.ralf.reducedAlfLanguage.RelationalExpression
import com.incquerylabs.uml.ralf.reducedAlfLanguage.ShiftExpression
import com.incquerylabs.uml.ralf.reducedAlfLanguage.Statements
import com.incquerylabs.uml.ralf.reducedAlfLanguage.StaticFeatureInvocationExpression
import com.incquerylabs.uml.ralf.reducedAlfLanguage.StringLiteralExpression
import com.incquerylabs.uml.ralf.reducedAlfLanguage.SuperInvocationExpression
import com.incquerylabs.uml.ralf.reducedAlfLanguage.ThisExpression
import com.incquerylabs.uml.ralf.reducedAlfLanguage.Variable
import java.util.List
import org.eclipse.uml2.uml.Operation
import org.eclipse.uml2.uml.Parameter
import org.eclipse.uml2.uml.Property

class ExpressionVisitor {
	extension SnippetTemplateCompilerUtil util
	extension ReducedAlfSystem typeSystem
	
	new(SnippetTemplateCompilerUtil util, ReducedAlfSystem typeSystem){
		this.typeSystem = typeSystem
		this.util = util
	}
		
	def dispatch String visit(CastExpression ex, StringBuilder parent){
		val operandVariable = ex.operand.visit(parent)
		val variableType = typeSystem.type(ex).value.umlType
		
		if(ex.isFlatteningNeeded){
			val descriptor = (descriptorFactory.createSingleVariableDescriptorBuilder => [
				type = variableType
				name = null
			]).build
			parent.append('''«descriptor.fullType» «descriptor.stringRepresentation» = («descriptor.fullType») «operandVariable»;'''+'\n')
					
			descriptor.stringRepresentation
		}else{
			val descriptor = (descriptorFactory.createSingleVariableDescriptorBuilder => [
				type = variableType
				name = null
				isExistingVariable = true
			]).build
			
			'''(«descriptor.fullType») «operandVariable»'''	
		}
		
		
	}
	
	def dispatch String visit(NullExpression ex, StringBuilder parent){
		'''0'''
	}
	
	def dispatch String visit(InstanceCreationExpression ex, StringBuilder parent){
		//TODO use instance creation descriptors
		val variableType = typeSystem.type(ex).value.umlType
		val List<String> parameterStrings = Lists.newArrayList
		
		if(ex.parameters instanceof ExpressionList){
			val parameters = ex.parameters as ExpressionList
			parameters.expressions.forEach[ expr |
				parameterStrings.add(expr.visit(parent))
			]
		}else{
			throw new UnsupportedOperationException("Only expression list based tuples are supported")
		}
		
		if(ex.isFlatteningNeeded){
			val descriptor = (descriptorFactory.createSingleVariableDescriptorBuilder => [
				type = variableType
				name = null
			]).build
			
			parent.append('''«descriptor.fullType» «descriptor.stringRepresentation» = new «descriptor.fullType»(«FOR f : parameterStrings SEPARATOR ", "»«f»«ENDFOR»);'''+'\n')
			
			descriptor.stringRepresentation
		}else{
			val descriptor = (descriptorFactory.createSingleVariableDescriptorBuilder => [
				type = variableType
				name = null
				isExistingVariable = true
			]).build
			
			'''new «descriptor.fullType»(«FOR f : parameterStrings SEPARATOR ", "»«f»«ENDFOR»)'''	
		}
	}
	

	def dispatch String visit(ThisExpression ex, StringBuilder parent){
		getDescriptor(ex).stringRepresentation
	}
	
	def dispatch String visit(StaticFeatureInvocationExpression ex, StringBuilder parent){
		val variableType = typeSystem.type(ex).value.umlType
		val op = ex.operation.reference as Operation
		
		val List<ValueDescriptor> descriptors = ex.prepareTuple(op, parent)
			
		var ValueDescriptor descriptor 
		if(variableType != null && !(ex.eContainer.eContainer instanceof PrefixExpression) && !(ex.eContainer.eContainer instanceof PostfixExpression)&& ex.isFlatteningNeeded){
			descriptor = (descriptorFactory.createSingleVariableDescriptorBuilder => [
				type = variableType
				name = null
			]).build
		}	
			
				
		val invocationDescriptor = (descriptorFactory.createStaticOperationCallBuilder => [
			operation = op
			parameters = descriptors
		]).build
		
		if(variableType != null && !(ex.eContainer.eContainer instanceof PrefixExpression) && !(ex.eContainer.eContainer instanceof PostfixExpression) && ex.isFlatteningNeeded){
	    	parent.append('''«descriptor.fullType» «descriptor.stringRepresentation» = «invocationDescriptor.stringRepresentation»;'''+'\n')
	    	descriptor.stringRepresentation
	    }else{
	    	invocationDescriptor.stringRepresentation
	    }
	}
	
	def dispatch String visit(SuperInvocationExpression ex, StringBuilder parent){
		throw new UnsupportedOperationException("Super invocations not supported yet")
	}
	
	def dispatch String visit(LinkOperationExpression ex, StringBuilder parent){
		throw new UnsupportedOperationException("Link operations not supported yet")
	}
	
	def dispatch String visit(AssociationAccessExpression ex, StringBuilder parent){
		val associationDescriptor = ex.descriptor
		val variableType = typeSystem.type(ex).value.umlType
		
		if(ex.isFlatteningNeeded){
			val descriptor = (descriptorFactory.createSingleVariableDescriptorBuilder => [
				type = variableType
				name = null
			]).build
			
			parent.append('''«descriptor.fullType» «descriptor.stringRepresentation» = «associationDescriptor.stringRepresentation»;'''+'\n')
		
			descriptor.stringRepresentation
		}else{
			associationDescriptor.stringRepresentation	
		}		
	}
	
	def dispatch String visit(FeatureInvocationExpression ex, StringBuilder parent){
		var ValueDescriptor invocationDescriptor
		val contextString = ex.context.visit(parent)
		
		val variableType = typeSystem.type(ex).value.umlType
		
		var ValueDescriptor descriptor 
		if(variableType != null && !(ex.eContainer.eContainer instanceof PrefixExpression) && !(ex.eContainer.eContainer instanceof PostfixExpression)&& ex.isFlatteningNeeded){
			descriptor = (descriptorFactory.createSingleVariableDescriptorBuilder => [
				type = variableType
				name = null
			]).build
		}
		
		switch (ex.feature) {
	        Operation: {
	        	val op = ex.feature as Operation
				val List<ValueDescriptor> descriptors = ex.prepareTuple(op, parent)
				
				val contextDescriptor = (descriptorFactory.createSingleVariableDescriptorBuilder => [
					name = contextString
					type = typeSystem.type(ex.context).value.umlType
					isExistingVariable = true
				]).build
				
				invocationDescriptor = (descriptorFactory.createOperationCallBuilder => [
					variable = contextDescriptor
					operation = op
					parameters = descriptors
				]).build
	        }
	        Property: {
	        	val contextDescriptor = (descriptorFactory.createSingleVariableDescriptorBuilder => [
					name = contextString
					type = variableType
					isExistingVariable = true
				]).build

	        	invocationDescriptor = (descriptorFactory.createPropertyReadBuilder => [
					variable = contextDescriptor
					property = ex.feature as Property
				]).build
	        }
	        default: throw new UnsupportedOperationException("Invalid feature invocation")
	    }
	    
	    if(variableType != null && !(ex.eContainer.eContainer instanceof PrefixExpression) && !(ex.eContainer.eContainer instanceof PostfixExpression) && ex.isFlatteningNeeded){
	    	parent.append('''«descriptor.fullType» «descriptor.stringRepresentation» = «invocationDescriptor.stringRepresentation»;'''+'\n')
	    	descriptor.stringRepresentation
	    }else{
	    	invocationDescriptor.stringRepresentation
	    }
	}
	
	
	def dispatch String visit(AssignmentExpression ex, StringBuilder parent){
	   	val variableType = typeSystem.type(ex).value.umlType
	   	if(ex.leftHandSide instanceof FeatureInvocationExpression && (ex.leftHandSide as FeatureInvocationExpression).feature instanceof Property) {
			val propAccess = ex.leftHandSide as FeatureInvocationExpression
			
			val rhsString = ex.rightHandSide.visit(parent)
			val contextString = propAccess.context.visit(parent)
			
				
			val rhsDescriptor = (descriptorFactory.createSingleVariableDescriptorBuilder => [
				name = rhsString
				type = variableType
				isExistingVariable = true
			]).build

	        val contextDescriptor = (descriptorFactory.createSingleVariableDescriptorBuilder => [
				name = contextString
				type = variableType
				isExistingVariable = true
			]).build
			
			val assignmentDescriptor =  (descriptorFactory.createPropertyWriteBuilder => [
				variable = contextDescriptor
				property = propAccess.feature as Property
				newValue = rhsDescriptor
			]).build
			
			if(ex.isFlatteningNeeded){
				val descriptor = (descriptorFactory.createSingleVariableDescriptorBuilder => [
					type = variableType
					name = null
				]).build
				
				parent.append('''«descriptor.fullType» «descriptor.stringRepresentation» = («assignmentDescriptor.stringRepresentation»);'''+'\n')
			
				descriptor.stringRepresentation
			}else{
				assignmentDescriptor.stringRepresentation	
			}
		} else {
			val lhsString = ex.leftHandSide.visit(parent)
		    val rhsString = ex.rightHandSide.visit(parent)
		    
		    if(ex.isFlatteningNeeded){
				val descriptor = (descriptorFactory.createSingleVariableDescriptorBuilder => [
					type = variableType
					name = null
				]).build
				
				parent.append('''«descriptor.fullType» «descriptor.stringRepresentation» = («lhsString» «ex.operator» «rhsString»);'''+'\n')
			
				descriptor.stringRepresentation
			}else{
				'''«lhsString» «ex.operator» «rhsString»'''	
			}
		}
	}

	def dispatch String visit(ArithmeticExpression ex, StringBuilder parent) {
		val operand1Variable = ex.operand1.visit(parent)
		val operand2Variable = ex.operand2.visit(parent)
		
		val variableType = typeSystem.type(ex).value.umlType
		
		if(ex.isFlatteningNeeded){
			val descriptor = (descriptorFactory.createSingleVariableDescriptorBuilder => [
				type = variableType
				name = null
			]).build
			
			parent.append('''«descriptor.fullType» «descriptor.stringRepresentation» = «operand1Variable» «ex.operator» «operand2Variable»;'''+'\n')
		
			descriptor.stringRepresentation
		}else{
			'''«operand1Variable» «ex.operator» «operand2Variable»'''	
		}
	}
	
	def dispatch String visit(ShiftExpression ex, StringBuilder parent) {
		val operand1Variable = ex.operand1.visit(parent)
		val operand2Variable = ex.operand2.visit(parent)
		
		val variableType = typeSystem.type(ex).value.umlType
		
		if(ex.isFlatteningNeeded){
			val descriptor = (descriptorFactory.createSingleVariableDescriptorBuilder => [
				type = variableType
				name = null
			]).build
			
			parent.append('''«descriptor.fullType» «descriptor.stringRepresentation» = «operand1Variable» «ex.operator» «operand2Variable»;'''+'\n')
		
			descriptor.stringRepresentation
		}else{
			'''«operand1Variable» «ex.operator» «operand2Variable»'''	
		}
	}
	
	def dispatch String visit(RelationalExpression ex, StringBuilder parent) {
		val operand1Variable = ex.operand1.visit(parent)
		val operand2Variable = ex.operand2.visit(parent)
		
		val variableType = typeSystem.type(ex).value.umlType
		
		if(ex.isFlatteningNeeded){
			val descriptor = (descriptorFactory.createSingleVariableDescriptorBuilder => [
				type = variableType
				name = null
			]).build
			
			parent.append('''«descriptor.fullType» «descriptor.stringRepresentation» = «operand1Variable» «ex.operator» «operand2Variable»;'''+'\n')
		
			descriptor.stringRepresentation
		}else{
			'''«operand1Variable» «ex.operator» «operand2Variable»'''	
		}
	}
	
	def dispatch String visit(EqualityExpression ex, StringBuilder parent) {
		val operand1Variable = ex.operand1.visit(parent)
		val operand2Variable = ex.operand2.visit(parent)
		
		val variableType = typeSystem.type(ex).value.umlType
		
		if(ex.isFlatteningNeeded){
			val descriptor = (descriptorFactory.createSingleVariableDescriptorBuilder => [
				type = variableType
				name = null
			]).build
			
			parent.append('''«descriptor.fullType» «descriptor.stringRepresentation» = «operand1Variable» «ex.operator» «operand2Variable»;'''+'\n')
		
			descriptor.stringRepresentation
		}else{
			'''«operand1Variable» «ex.operator» «operand2Variable»'''	
		}
	}
	
	def dispatch String visit(LogicalExpression ex, StringBuilder parent) {
		val operand1Variable = ex.operand1.visit(parent)
		val operand2Variable = ex.operand2.visit(parent)
		
		val variableType = typeSystem.type(ex).value.umlType
		
		if(ex.isFlatteningNeeded){
			val descriptor = (descriptorFactory.createSingleVariableDescriptorBuilder => [
				type = variableType
				name = null
			]).build
			
			parent.append('''«descriptor.fullType» «descriptor.stringRepresentation» = «operand1Variable» «ex.operator» «operand2Variable»;'''+'\n')
		
			descriptor.stringRepresentation
		}else{
			'''«operand1Variable» «ex.operator» «operand2Variable»'''	
		}
	}
	
	def dispatch String visit(ConditionalLogicalExpression ex, StringBuilder parent) {
		val operand1Variable = ex.operand1.visit(parent)
		val operand2Variable = ex.operand2.visit(parent)
		
		val variableType = typeSystem.type(ex).value.umlType
		
		if(ex.isFlatteningNeeded){
			val descriptor = (descriptorFactory.createSingleVariableDescriptorBuilder => [
				type = variableType
				name = null
			]).build
			
			parent.append('''«descriptor.fullType» «descriptor.stringRepresentation» = «operand1Variable» «ex.operator» «operand2Variable»;'''+'\n')
		
			descriptor.stringRepresentation
		}else{
			'''«operand1Variable» «ex.operator» «operand2Variable»'''	
		}
	}

	def dispatch String visit(PrefixExpression ex, StringBuilder parent){
		val operandVariable = ex.operand.expression.visit(parent)
		
		val variableType = typeSystem.type(ex).value.umlType
		
		if(ex.isFlatteningNeeded){
			val descriptor = (descriptorFactory.createSingleVariableDescriptorBuilder => [
				type = variableType
				name = null
			]).build
			
			parent.append('''«descriptor.fullType» «descriptor.stringRepresentation» = «ex.operator.literal»«operandVariable»;'''+'\n')
		
			descriptor.stringRepresentation
		}else{
			'''«ex.operator.literal»«operandVariable»'''	
		}
	}
	
	def dispatch String visit(PostfixExpression ex, StringBuilder parent){
		val operandVariable = ex.operand.expression.visit(parent)
		
		val variableType = typeSystem.type(ex).value.umlType
		
		if(ex.isFlatteningNeeded){
			val descriptor = (descriptorFactory.createSingleVariableDescriptorBuilder => [
				type = variableType
				name = null
			]).build
			
			parent.append('''«descriptor.fullType» «descriptor.stringRepresentation» = «operandVariable»«ex.operator.literal»;'''+'\n')
		
			descriptor.stringRepresentation
		}else{
			'''«operandVariable»«ex.operator.literal»'''	
		}
	}

	
	def dispatch String visit(ConditionalTestExpression ex, StringBuilder parent) {
		val operand1Variable = ex.operand1.visit(parent)
		val operand2Variable = ex.operand2.visit(parent)
		val operand3Variable = ex.operand3.visit(parent)
		
		val variableType = typeSystem.type(ex).value.umlType
		
		if(ex.isFlatteningNeeded){
			val descriptor = (descriptorFactory.createSingleVariableDescriptorBuilder => [
				type = variableType
				name = null
			]).build
			
			parent.append('''«descriptor.fullType» «descriptor.stringRepresentation» = («operand1Variable») ? («operand2Variable») : («operand3Variable»);'''+'\n')
		
			descriptor.stringRepresentation
		}else{
			'''(«operand1Variable») ? («operand2Variable») : («operand3Variable»)'''	
		}
	}

	def dispatch String visit(NameExpression ex, StringBuilder parent){
		if(ex.reference instanceof Variable){
			val variable = ex.reference as Variable
			if(variable != null){
				val descriptor = getDescriptor(ex)
				return descriptor.stringRepresentation
			}
		}else if(ex.reference instanceof Parameter){
			val parameter = ex.reference as Parameter
			if(parameter != null){
				val descriptor = getDescriptor(ex)
				return descriptor.stringRepresentation
			}
		}else{
			throw new UnsupportedOperationException("Only variables and parameters are supported")
		}
	}
	
	
	def dispatch String visit(NumericUnaryExpression ex, StringBuilder parent){
		val operandVariable = ex.operand.visit(parent)
		val variableType = typeSystem.type(ex).value.umlType
		
		if(ex.isFlatteningNeeded){
			val descriptor = (descriptorFactory.createSingleVariableDescriptorBuilder => [
				type = variableType
				name = null
			]).build
			
			parent.append('''«descriptor.fullType» «descriptor.stringRepresentation» = «ex.operator.literal»«operandVariable»;'''+'\n')
		
			descriptor.stringRepresentation
		}else{
			'''«ex.operator.literal»«operandVariable»'''	
		}
	}
	
	def dispatch String visit(BitStringUnaryExpression ex, StringBuilder parent){
		val operandVariable = ex.operand.visit(parent)
		val variableType = typeSystem.type(ex).value.umlType
		
		if(ex.isFlatteningNeeded){
			val descriptor = (descriptorFactory.createSingleVariableDescriptorBuilder => [
				type = variableType
				name = null
			]).build
			
			parent.append('''«descriptor.fullType» «descriptor.stringRepresentation» = «ex.operator»«operandVariable»;'''+'\n')
		
			descriptor.stringRepresentation
		}else{
			'''«ex.operator»«operandVariable»'''	
		}
	}
	
	def dispatch String visit(BooleanUnaryExpression ex, StringBuilder parent){
		val operandVariable = ex.operand.visit(parent)
		val variableType = typeSystem.type(ex).value.umlType
		
		if(ex.isFlatteningNeeded){
			val descriptor = (descriptorFactory.createSingleVariableDescriptorBuilder => [
				type = variableType
				name = null
			]).build
			
			parent.append('''«descriptor.fullType» «descriptor.stringRepresentation» = «ex.operator»«operandVariable»;'''+'\n')
		
			descriptor.stringRepresentation
		}else{
			'''«ex.operator»«operandVariable»'''	
		}
	}
	
	def dispatch String visit(NaturalLiteralExpression ex, StringBuilder parent) {
		getDescriptor(ex).stringRepresentation
    }
    
	def dispatch String visit(RealLiteralExpression ex, StringBuilder parent) {
		getDescriptor(ex).stringRepresentation
    }
	
	def dispatch String visit(BooleanLiteralExpression ex, StringBuilder parent){
		getDescriptor(ex).stringRepresentation
	}
	   
	def dispatch String visit(StringLiteralExpression ex, StringBuilder parent){
		getDescriptor(ex).stringRepresentation
	}
	
	def boolean isFlatteningNeeded(Expression ex){
		switch(ex.eContainer){
			ExpressionStatement: {
				switch(ex.eContainer.eContainer){
					Statements: return false
					BlockStatement : return false
					ForStatement: {
						if((ex.eContainer.eContainer as ForStatement).update.equals(ex.eContainer)){
							return false	
						}else{
							return true
						}
					}
					default: return true
				}
			}
			LocalNameDeclarationStatement: {
				switch(ex.eContainer.eContainer){
					Statements: return false
					BlockStatement : return false
					default: return true
				}
			}
			default: {
				return true
			}
		}
	}
	
	private dispatch def prepareTuple(FeatureInvocationExpression ex, Operation op, StringBuilder parent){
		val List<ValueDescriptor> descriptors = Lists.newArrayList
		if(ex.parameters instanceof ExpressionList){
			val parameters = ex.parameters as ExpressionList
			parameters.expressions.forEach[ expr |
				val string = expr.visit(parent)
				descriptors.add((descriptorFactory.createSingleVariableDescriptorBuilder => [
					name = string
					type = typeSystem.type(expr).value.umlType
					isExistingVariable = true
				]).build)
				
			]
		}else if(ex.parameters instanceof NamedTuple){
			val parameters = ex.parameters as NamedTuple
			val operationParameters = op.ownedParameters

			operationParameters.forEach[operationParameter |
				parameters.expressions.forEach[ namedExpression |
					if(namedExpression.name.equals(operationParameter.name) && typeSystem.type(namedExpression.expression).value.umlType.equals(operationParameter.getType)){
						val string = namedExpression.expression.visit(parent)
							descriptors.add((descriptorFactory.createSingleVariableDescriptorBuilder => [
							name = string
							type = typeSystem.type(namedExpression.expression).value.umlType
							isExistingVariable = true
						]).build)
					}
				]
			]
			
		}else{
			throw new UnsupportedOperationException("Only expression list based tuples are supported")
		}	
		return descriptors
	}
	
	private dispatch def prepareTuple(StaticFeatureInvocationExpression ex, Operation op, StringBuilder parent){
		val List<ValueDescriptor> descriptors = Lists.newArrayList
		if(ex.parameters instanceof ExpressionList){
			val parameters = ex.parameters as ExpressionList
			parameters.expressions.forEach[ expr |
				val string = expr.visit(parent)
				descriptors.add((descriptorFactory.createSingleVariableDescriptorBuilder => [
					name = string
					type = typeSystem.type(expr).value.umlType
					isExistingVariable = true
				]).build)
				
			]
		}else if(ex.parameters instanceof NamedTuple){
			val parameters = ex.parameters as NamedTuple
			val operationParameters = op.ownedParameters

			operationParameters.forEach[operationParameter |
				parameters.expressions.forEach[ namedExpression |
					if(namedExpression.name.equals(operationParameter.name) && typeSystem.type(namedExpression.expression).value.umlType.equals(operationParameter.getType)){
						val string = namedExpression.expression.visit(parent)
							descriptors.add((descriptorFactory.createSingleVariableDescriptorBuilder => [
							name = string
							type = typeSystem.type(namedExpression.expression).value.umlType
							isExistingVariable = true
						]).build)
					}
				]
			]
			
		}else{
			throw new UnsupportedOperationException("Only expression list based tuples are supported")
		}	
		return descriptors
	}
	
}