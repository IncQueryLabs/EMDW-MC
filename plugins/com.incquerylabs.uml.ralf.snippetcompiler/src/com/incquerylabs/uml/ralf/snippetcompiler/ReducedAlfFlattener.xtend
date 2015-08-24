package com.incquerylabs.uml.ralf.snippetcompiler

import com.google.common.collect.Lists
import com.incquerylabs.emdw.valuedescriptor.ValueDescriptor
import com.incquerylabs.uml.ralf.reducedAlfLanguage.ArithmeticExpression
import com.incquerylabs.uml.ralf.reducedAlfLanguage.AssociationAccessExpression
import com.incquerylabs.uml.ralf.reducedAlfLanguage.BitStringUnaryExpression
import com.incquerylabs.uml.ralf.reducedAlfLanguage.BooleanLiteralExpression
import com.incquerylabs.uml.ralf.reducedAlfLanguage.BooleanUnaryExpression
import com.incquerylabs.uml.ralf.reducedAlfLanguage.ConditionalLogicalExpression
import com.incquerylabs.uml.ralf.reducedAlfLanguage.EqualityExpression
import com.incquerylabs.uml.ralf.reducedAlfLanguage.ExpressionList
import com.incquerylabs.uml.ralf.reducedAlfLanguage.FeatureInvocationExpression
import com.incquerylabs.uml.ralf.reducedAlfLanguage.InstanceCreationExpression
import com.incquerylabs.uml.ralf.reducedAlfLanguage.LiteralExpression
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
import com.incquerylabs.uml.ralf.reducedAlfLanguage.StringLiteralExpression
import com.incquerylabs.uml.ralf.reducedAlfLanguage.ThisExpression
import com.incquerylabs.uml.ralf.reducedAlfLanguage.Variable
import com.incquerylabs.uml.ralf.scoping.IUMLContextProvider
import java.util.List
import org.eclipse.emf.ecore.EObject
import org.eclipse.uml2.uml.Property
import org.eclipse.uml2.uml.Type
import snippetTemplate.CompositeSnippet
import snippetTemplate.SnippetTemplateFactory

class ReducedAlfFlattener {
	extension SnippetTemplateFactory factory = SnippetTemplateFactory.eINSTANCE
	extension SnippetTemplateCompilerUtil util
	
	new(SnippetTemplateCompilerUtil util){
		this.util = util
	}

	def dispatch FlattenedVariable flatten(ArithmeticExpression ex, CompositeSnippet snippet){
		val operand1 = ex.operand1
		val operand2 = ex.operand2
		
		var FlattenedVariable operand1Variable
		var FlattenedVariable operand2Variable
		 
		if((operand1 instanceof NameExpression) && (operand1 as NameExpression).reference instanceof Variable){
			val variable = (operand1 as NameExpression).reference as Variable
			if(variable != null){
				operand1Variable = new FlattenedVariable(getDescriptor(operand1), variable.type.type)
				
			}
		}else{
			operand1Variable = flatten(operand1, snippet)
		}
		
		if((operand2 instanceof NameExpression) && (operand2 as NameExpression).reference instanceof Variable){
			val variable = (operand2 as NameExpression).reference as Variable
			if(variable != null){
				operand2Variable = new FlattenedVariable(getDescriptor(operand2), variable.type.type)
				
			}
		}else{
			operand2Variable = flatten(operand2, snippet)
		}
		
		val descriptor1 = operand1Variable.descriptor
		val descriptor2 = operand2Variable.descriptor
		
		var Type tempType 
		if(operand1Variable.type.equals(operand2Variable.type)){
			tempType = operand1Variable.type
		}else{
			if(operand1Variable.type.equals(context.getPrimitiveType(IUMLContextProvider.REAL_TYPE))){
				tempType = operand1Variable.type
			}else{
				tempType = operand2Variable.type
			}
		}
		val variableType = tempType
		
		val descriptor = (descriptorFactory.createSingleVariableDescriptorBuilder => [
			type = variableType
			name = null
		]).build
		
		snippet.snippet.add(createCompositeSnippet =>[ s |
			s.snippet.add(createStringSnippet => [value = descriptor.fullType])
			s.snippet.add(createStringSnippet => [value = ''' '''])
			s.snippet.add(createStringSnippet => [value = descriptor.stringRepresentation])
			s.snippet.add(createStringSnippet => [value = ''' = '''])
			s.snippet.add(createStringSnippet => [value = descriptor1.stringRepresentation])
			s.snippet.add(createStringSnippet => [value = ''' '''+ex.operator+''' '''])
			s.snippet.add(createStringSnippet => [value = descriptor2.stringRepresentation])
			s.snippet.add(createStringSnippet => [value = ''';'''])
			s.snippet.add(createStringSnippet => [value = '\n'])
		])
		
		return new FlattenedVariable(descriptor, variableType)
	}
	
	def dispatch FlattenedVariable flatten(NaturalLiteralExpression ex, CompositeSnippet snippet){	
		val literalType = context.getPrimitiveType(IUMLContextProvider.INTEGER_TYPE)
		val literalDescriptor = (descriptorFactory.createLiteralDescriptorBuilder => [
			literal = ex.value
			type = literalType
		]).build
		
		val descriptor = (descriptorFactory.createSingleVariableDescriptorBuilder => [
			type = literalType
			name = null
		]).build
		
		snippet.snippet.add(createCompositeSnippet =>[ s |
			s.snippet.add(createStringSnippet => [value = descriptor.fullType])
			s.snippet.add(createStringSnippet => [value = ''' '''])
			s.snippet.add(createStringSnippet => [value = descriptor.stringRepresentation])
			s.snippet.add(createStringSnippet => [value = ''' = '''])
			s.snippet.add(createStringSnippet => [value = literalDescriptor.stringRepresentation])
			s.snippet.add(createStringSnippet => [value = ''';'''])
			s.snippet.add(createStringSnippet => [value = '\n'])
		])
		
		return new FlattenedVariable(descriptor, literalType)
	}
	
	def dispatch FlattenedVariable flatten(RealLiteralExpression ex, CompositeSnippet snippet){	
		val literalType = context.getPrimitiveType(IUMLContextProvider.REAL_TYPE)
		val literalDescriptor = (descriptorFactory.createLiteralDescriptorBuilder => [
			literal = ex.value
			type = literalType
		]).build
		
		val descriptor = (descriptorFactory.createSingleVariableDescriptorBuilder => [
			type = literalType
			name = null
		]).build
		
		snippet.snippet.add(createCompositeSnippet =>[ s |
			s.snippet.add(createStringSnippet => [value = descriptor.fullType])
			s.snippet.add(createStringSnippet => [value = ''' '''])
			s.snippet.add(createStringSnippet => [value = descriptor.stringRepresentation])
			s.snippet.add(createStringSnippet => [value = ''' = '''])
			s.snippet.add(createStringSnippet => [value = literalDescriptor.stringRepresentation])
			s.snippet.add(createStringSnippet => [value = ''';'''])
			s.snippet.add(createStringSnippet => [value = '\n'])
		])
		
		return new FlattenedVariable(descriptor, literalType)
	}
	
	def dispatch FlattenedVariable flatten(StringLiteralExpression ex, CompositeSnippet snippet){	
		val literalType = context.getPrimitiveType(IUMLContextProvider.STRING_TYPE)
		val literalDescriptor = (descriptorFactory.createLiteralDescriptorBuilder => [
			literal = ex.value
			type = literalType
		]).build
		
		val descriptor = (descriptorFactory.createSingleVariableDescriptorBuilder => [
			type = literalType
			name = null
		]).build
		
		snippet.snippet.add(createCompositeSnippet =>[ s |
			s.snippet.add(createStringSnippet => [value = descriptor.fullType])
			s.snippet.add(createStringSnippet => [value = ''' '''])
			s.snippet.add(createStringSnippet => [value = descriptor.stringRepresentation])
			s.snippet.add(createStringSnippet => [value = ''' = '''])
			s.snippet.add(createStringSnippet => [value = literalDescriptor.stringRepresentation])
			s.snippet.add(createStringSnippet => [value = ''';'''])
			s.snippet.add(createStringSnippet => [value = '\n'])
		])
		
		return new FlattenedVariable(descriptor, literalType)
	}
	
	def dispatch FlattenedVariable flatten(BooleanLiteralExpression ex, CompositeSnippet snippet){	
		val literalType = context.getPrimitiveType(IUMLContextProvider.BOOLEAN_TYPE)
		val literalDescriptor = (descriptorFactory.createLiteralDescriptorBuilder => [
			literal = ex.value
			type = literalType
		]).build
		
		val descriptor = (descriptorFactory.createSingleVariableDescriptorBuilder => [
			type = literalType
			name = null
		]).build
		
		snippet.snippet.add(createCompositeSnippet =>[ s |
			s.snippet.add(createStringSnippet => [value = descriptor.fullType])
			s.snippet.add(createStringSnippet => [value = ''' '''])
			s.snippet.add(createStringSnippet => [value = descriptor.stringRepresentation])
			s.snippet.add(createStringSnippet => [value = ''' = '''])
			s.snippet.add(createStringSnippet => [value = literalDescriptor.stringRepresentation])
			s.snippet.add(createStringSnippet => [value = ''';'''])
			s.snippet.add(createStringSnippet => [value = '\n'])
		])
		
		return new FlattenedVariable(descriptor, literalType)
	}
	
	def dispatch FlattenedVariable flatten(FeatureInvocationExpression ex, CompositeSnippet snippet){	
		val feature = ex.feature
		if(feature instanceof Property){
			return flatten(ex, feature, snippet)
		}else{
			throw new UnsupportedOperationException
		}
	}
	
	private def FlattenedVariable flatten(FeatureInvocationExpression ex, Property prop, CompositeSnippet snippet){	
		val propertyContext = ex.context
		
		var FlattenedVariable contextVariable
		if((propertyContext instanceof NameExpression) && (propertyContext as NameExpression).reference instanceof Variable){
			val variable = (propertyContext as NameExpression).reference as Variable
			if(variable != null){
				contextVariable = new FlattenedVariable(getDescriptor(propertyContext), variable.type.type)
				
			}
		}else if (propertyContext instanceof ThisExpression){
				contextVariable = new FlattenedVariable(getDescriptor(propertyContext), context.thisType)
		}else{
			contextVariable = flatten(propertyContext, snippet)
		}
		val contextDescriptor = contextVariable.descriptor
		val variableType = prop.type
		
		val descriptor = (descriptorFactory.createSingleVariableDescriptorBuilder => [
			type = variableType
			name = null
		]).build
		
		val propertyAccess = (descriptorFactory.createPropertyReadBuilder => [
			variable = contextDescriptor
			property = prop
		]).build
		
		snippet.snippet.add(createCompositeSnippet =>[ s |
			s.snippet.add(createStringSnippet => [value = descriptor.fullType])
			s.snippet.add(createStringSnippet => [value = ''' '''])
			s.snippet.add(createStringSnippet => [value = descriptor.stringRepresentation])
			s.snippet.add(createStringSnippet => [value = ''' = '''])
			s.snippet.add(createStringSnippet => [value = propertyAccess.stringRepresentation])
			s.snippet.add(createStringSnippet => [value = ''';'''])
			s.snippet.add(createStringSnippet => [value = '\n'])
		])
				
		return new FlattenedVariable(descriptor, variableType)
	}
	
	def dispatch FlattenedVariable flatten(AssociationAccessExpression ex, CompositeSnippet snippet){	
		val context = ex.context
		
		var FlattenedVariable contextVariable
		if((context instanceof NameExpression) && (context as NameExpression).reference instanceof Variable){
			val variable = (context as NameExpression).reference as Variable
			if(variable != null){
				contextVariable = new FlattenedVariable(getDescriptor(context), variable.type.type)
				
			}
		}else{
			contextVariable = flatten(context, snippet)
		}
		val contextDescriptor = contextVariable.descriptor
		val variableType = ex.association.type
		
		val descriptor = (descriptorFactory.createSingleVariableDescriptorBuilder => [
			type = variableType
			name = null
		]).build
		
		val propertyAccess = (descriptorFactory.createPropertyReadBuilder => [
			variable = contextDescriptor
			property = ex.association
		]).build
		
		snippet.snippet.add(createCompositeSnippet =>[ s |
			s.snippet.add(createStringSnippet => [value = descriptor.fullType])
			s.snippet.add(createStringSnippet => [value = ''' '''])
			s.snippet.add(createStringSnippet => [value = descriptor.stringRepresentation])
			s.snippet.add(createStringSnippet => [value = ''' = '''])
			s.snippet.add(createStringSnippet => [value = propertyAccess.stringRepresentation])
			s.snippet.add(createStringSnippet => [value = ''';'''])
			s.snippet.add(createStringSnippet => [value = '\n'])
		])
				
		return new FlattenedVariable(descriptor, variableType)
	}
	
	def dispatch FlattenedVariable flatten(ShiftExpression ex, CompositeSnippet snippet){
		val operand1 = ex.operand1
		val operand2 = ex.operand2
		
		var FlattenedVariable operand1Variable
		var FlattenedVariable operand2Variable
		 
		if((operand1 instanceof NameExpression) && (operand1 as NameExpression).reference instanceof Variable){
			val variable = (operand1 as NameExpression).reference as Variable
			if(variable != null){
				operand1Variable = new FlattenedVariable(getDescriptor(operand1), variable.type.type)
				
			}
		}else{
			operand1Variable = flatten(operand1, snippet)
		}
		
		if((operand2 instanceof NameExpression) && (operand2 as NameExpression).reference instanceof Variable){
			val variable = (operand2 as NameExpression).reference as Variable
			if(variable != null){
				operand2Variable = new FlattenedVariable(getDescriptor(operand2), variable.type.type)
				
			}
		}else{
			operand2Variable = flatten(operand2, snippet)
		}
		
		val descriptor1 = operand1Variable.descriptor
		val descriptor2 = operand2Variable.descriptor
		val variableType = context.getPrimitiveType(IUMLContextProvider.INTEGER_TYPE)
		
		val descriptor = (descriptorFactory.createSingleVariableDescriptorBuilder => [
			type = variableType
			name = null
		]).build
		
		snippet.snippet.add(createCompositeSnippet =>[ s |
			s.snippet.add(createStringSnippet => [value = descriptor.fullType])
			s.snippet.add(createStringSnippet => [value = ''' '''])
			s.snippet.add(createStringSnippet => [value = descriptor.stringRepresentation])
			s.snippet.add(createStringSnippet => [value = ''' = '''])
			s.snippet.add(createStringSnippet => [value = descriptor1.stringRepresentation])
			s.snippet.add(createStringSnippet => [value = ''' '''+ex.operator+''' '''])
			s.snippet.add(createStringSnippet => [value = descriptor2.stringRepresentation])
			s.snippet.add(createStringSnippet => [value = ''';'''])
			s.snippet.add(createStringSnippet => [value = '\n'])
		])
		
		return new FlattenedVariable(descriptor, variableType)
	}
	
	def dispatch FlattenedVariable flatten(RelationalExpression ex, CompositeSnippet snippet){
		val operand1 = ex.operand1
		val operand2 = ex.operand2
		
		var FlattenedVariable operand1Variable
		var FlattenedVariable operand2Variable
		 
		if((operand1 instanceof NameExpression) && (operand1 as NameExpression).reference instanceof Variable){
			val variable = (operand1 as NameExpression).reference as Variable
			if(variable != null){
				operand1Variable = new FlattenedVariable(getDescriptor(operand1), variable.type.type)
				
			}
		}else{
			operand1Variable = flatten(operand1, snippet)
		}
		
		if((operand2 instanceof NameExpression) && (operand2 as NameExpression).reference instanceof Variable){
			val variable = (operand2 as NameExpression).reference as Variable
			if(variable != null){
				operand2Variable = new FlattenedVariable(getDescriptor(operand2), variable.type.type)
				
			}
		}else{
			operand2Variable = flatten(operand2, snippet)
		}
		
		val descriptor1 = operand1Variable.descriptor
		val descriptor2 = operand2Variable.descriptor
		val variableType = context.getPrimitiveType(IUMLContextProvider.BOOLEAN_TYPE)
		
		val descriptor = (descriptorFactory.createSingleVariableDescriptorBuilder => [
			type = variableType
			name = null
		]).build
		
		snippet.snippet.add(createCompositeSnippet =>[ s |
			s.snippet.add(createStringSnippet => [value = descriptor.fullType])
			s.snippet.add(createStringSnippet => [value = ''' '''])
			s.snippet.add(createStringSnippet => [value = descriptor.stringRepresentation])
			s.snippet.add(createStringSnippet => [value = ''' = '''])
			s.snippet.add(createStringSnippet => [value = descriptor1.stringRepresentation])
			s.snippet.add(createStringSnippet => [value = ''' '''+ex.operator+''' '''])
			s.snippet.add(createStringSnippet => [value = descriptor2.stringRepresentation])
			s.snippet.add(createStringSnippet => [value = ''';'''])
			s.snippet.add(createStringSnippet => [value = '\n'])
		])
		
		return new FlattenedVariable(descriptor, variableType)
	}
	
	def dispatch FlattenedVariable flatten(EqualityExpression ex, CompositeSnippet snippet){
		val operand1 = ex.operand1
		val operand2 = ex.operand2
		
		var FlattenedVariable operand1Variable
		var FlattenedVariable operand2Variable
		 
		if((operand1 instanceof NameExpression) && (operand1 as NameExpression).reference instanceof Variable){
			val variable = (operand1 as NameExpression).reference as Variable
			if(variable != null){
				operand1Variable = new FlattenedVariable(getDescriptor(operand1), variable.type.type)
				
			}
		}else{
			operand1Variable = flatten(operand1, snippet)
		}
		
		if((operand2 instanceof NameExpression) && (operand2 as NameExpression).reference instanceof Variable){
			val variable = (operand2 as NameExpression).reference as Variable
			if(variable != null){
				operand2Variable = new FlattenedVariable(getDescriptor(operand2), variable.type.type)
				
			}
		}else{
			operand2Variable = flatten(operand2, snippet)
		}
		
		val descriptor1 = operand1Variable.descriptor
		val descriptor2 = operand2Variable.descriptor
		val variableType = context.getPrimitiveType(IUMLContextProvider.BOOLEAN_TYPE)
		
		val descriptor = (descriptorFactory.createSingleVariableDescriptorBuilder => [
			type = variableType
			name = null
		]).build
		
		snippet.snippet.add(createCompositeSnippet =>[ s |
			s.snippet.add(createStringSnippet => [value = descriptor.fullType])
			s.snippet.add(createStringSnippet => [value = ''' '''])
			s.snippet.add(createStringSnippet => [value = descriptor.stringRepresentation])
			s.snippet.add(createStringSnippet => [value = ''' = '''])
			s.snippet.add(createStringSnippet => [value = descriptor1.stringRepresentation])
			s.snippet.add(createStringSnippet => [value = ''' '''+ex.operator+''' '''])
			s.snippet.add(createStringSnippet => [value = descriptor2.stringRepresentation])
			s.snippet.add(createStringSnippet => [value = ''';'''])
			s.snippet.add(createStringSnippet => [value = '\n'])
		])
		
		return new FlattenedVariable(descriptor, variableType)
	}
	
	def dispatch FlattenedVariable flatten(ConditionalLogicalExpression ex, CompositeSnippet snippet){
		val operand1 = ex.operand1
		val operand2 = ex.operand2
		
		var FlattenedVariable operand1Variable
		var FlattenedVariable operand2Variable
		 
		if((operand1 instanceof NameExpression) && (operand1 as NameExpression).reference instanceof Variable){
			val variable = (operand1 as NameExpression).reference as Variable
			if(variable != null){
				operand1Variable = new FlattenedVariable(getDescriptor(operand1), variable.type.type)
				
			}
		}else{
			operand1Variable = flatten(operand1, snippet)
		}
		
		if((operand2 instanceof NameExpression) && (operand2 as NameExpression).reference instanceof Variable){
			val variable = (operand2 as NameExpression).reference as Variable
			if(variable != null){
				operand2Variable = new FlattenedVariable(getDescriptor(operand2), variable.type.type)
				
			}
		}else{
			operand2Variable = flatten(operand2, snippet)
		}
		
		val descriptor1 = operand1Variable.descriptor
		val descriptor2 = operand2Variable.descriptor
		val variableType = context.getPrimitiveType(IUMLContextProvider.BOOLEAN_TYPE)
		
		val descriptor = (descriptorFactory.createSingleVariableDescriptorBuilder => [
			type = variableType
			name = null
		]).build
		
		snippet.snippet.add(createCompositeSnippet =>[ s |
			s.snippet.add(createStringSnippet => [value = descriptor.fullType])
			s.snippet.add(createStringSnippet => [value = ''' '''])
			s.snippet.add(createStringSnippet => [value = descriptor.stringRepresentation])
			s.snippet.add(createStringSnippet => [value = ''' = '''])
			s.snippet.add(createStringSnippet => [value = descriptor1.stringRepresentation])
			s.snippet.add(createStringSnippet => [value = ''' '''+ex.operator+''' '''])
			s.snippet.add(createStringSnippet => [value = descriptor2.stringRepresentation])
			s.snippet.add(createStringSnippet => [value = ''';'''])
			s.snippet.add(createStringSnippet => [value = '\n'])
		])
		
		return new FlattenedVariable(descriptor, variableType)
	}
	
	def dispatch FlattenedVariable flatten(LogicalExpression ex, CompositeSnippet snippet){
		val operand1 = ex.operand1
		val operand2 = ex.operand2
		
		var FlattenedVariable operand1Variable
		var FlattenedVariable operand2Variable
		 
		if((operand1 instanceof NameExpression) && (operand1 as NameExpression).reference instanceof Variable){
			val variable = (operand1 as NameExpression).reference as Variable
			if(variable != null){
				operand1Variable = new FlattenedVariable(getDescriptor(operand1), variable.type.type)
				
			}
		}else{
			operand1Variable = flatten(operand1, snippet)
		}
		
		if((operand2 instanceof NameExpression) && (operand2 as NameExpression).reference instanceof Variable){
			val variable = (operand2 as NameExpression).reference as Variable
			if(variable != null){
				operand2Variable = new FlattenedVariable(getDescriptor(operand2), variable.type.type)
				
			}
		}else{
			operand2Variable = flatten(operand2, snippet)
		}
		
		val descriptor1 = operand1Variable.descriptor
		val descriptor2 = operand2Variable.descriptor
		var Type tempType 
		if(operand1Variable.type.equals(operand2Variable.type)){
			tempType = operand1Variable.type
		}else{
			if(operand1Variable.type.equals(context.getPrimitiveType(IUMLContextProvider.REAL_TYPE))){
				tempType = operand1Variable.type
			}else{
				tempType = operand2Variable.type
			}
		}
		val variableType = tempType
		
		val descriptor = (descriptorFactory.createSingleVariableDescriptorBuilder => [
			type = variableType
			name = null
		]).build
		
		snippet.snippet.add(createCompositeSnippet =>[ s |
			s.snippet.add(createStringSnippet => [value = descriptor.fullType])
			s.snippet.add(createStringSnippet => [value = ''' '''])
			s.snippet.add(createStringSnippet => [value = descriptor.stringRepresentation])
			s.snippet.add(createStringSnippet => [value = ''' = '''])
			s.snippet.add(createStringSnippet => [value = descriptor1.stringRepresentation])
			s.snippet.add(createStringSnippet => [value = ''' '''+ex.operator+''' '''])
			s.snippet.add(createStringSnippet => [value = descriptor2.stringRepresentation])
			s.snippet.add(createStringSnippet => [value = ''';'''])
			s.snippet.add(createStringSnippet => [value = '\n'])
		])
		
		return new FlattenedVariable(descriptor, variableType)
	}
	
	def dispatch FlattenedVariable flatten(PrefixExpression ex, CompositeSnippet snippet){
		val operand = ex.operand
		var FlattenedVariable operandVariable		 
		 
		if(operand.flatteningNotNeeded){
			val variable = (operand as NameExpression).reference as Variable
			if(variable != null){
				operandVariable = new FlattenedVariable(getDescriptor(operand), variable.type.type)
			}
		}else{
			operandVariable = flatten(operand.expression, snippet)
		}
		
		val operandDescriptor = operandVariable.descriptor
		val variableType = operandVariable.type
		
		val descriptor = (descriptorFactory.createSingleVariableDescriptorBuilder => [
			type = variableType
			name = null
		]).build
		
		snippet.snippet.add(createCompositeSnippet =>[ s |
			s.snippet.add(createStringSnippet => [value = descriptor.fullType])
			s.snippet.add(createStringSnippet => [value = ''' '''])
			s.snippet.add(createStringSnippet => [value = descriptor.stringRepresentation])
			s.snippet.add(createStringSnippet => [value = ''' = '''])
			s.snippet.add(createStringSnippet => [value = ex.operator.toString])
			s.snippet.add(createStringSnippet => [value = operandDescriptor.stringRepresentation])
			s.snippet.add(createStringSnippet => [value = ''';'''])
			s.snippet.add(createStringSnippet => [value = '\n'])
		])
		
		return new FlattenedVariable(descriptor, variableType)
	}
	
	def dispatch FlattenedVariable flatten(PostfixExpression ex, CompositeSnippet snippet){
		val operand = ex.operand
		var FlattenedVariable operandVariable		 
		 
		if(operand.flatteningNotNeeded){
			val variable = (operand as NameExpression).reference as Variable
			if(variable != null){
				operandVariable = new FlattenedVariable(getDescriptor(operand), variable.type.type)
			}
		}else{
			operandVariable = flatten(operand.expression, snippet)
		}
		
		val operandDescriptor = operandVariable.descriptor
		val variableType = operandVariable.type
		
		val descriptor = (descriptorFactory.createSingleVariableDescriptorBuilder => [
			type = variableType
			name = null
		]).build
		
		snippet.snippet.add(createCompositeSnippet =>[ s |
			s.snippet.add(createStringSnippet => [value = descriptor.fullType])
			s.snippet.add(createStringSnippet => [value = ''' '''])
			s.snippet.add(createStringSnippet => [value = descriptor.stringRepresentation])
			s.snippet.add(createStringSnippet => [value = ''' = '''])
		    s.snippet.add(createStringSnippet => [value = operandDescriptor.stringRepresentation])
			s.snippet.add(createStringSnippet => [value = ex.operator.toString])
			s.snippet.add(createStringSnippet => [value = ''';'''])
			s.snippet.add(createStringSnippet => [value = '\n'])
		])
		
		return new FlattenedVariable(descriptor, variableType)
	}
	
	def dispatch FlattenedVariable flatten(NumericUnaryExpression ex, CompositeSnippet snippet){	
		val operand = ex.operand
		var FlattenedVariable operandVariable
		 
		if(operand.flatteningNotNeeded){
			val variable = (operand as NameExpression).reference as Variable
			if(variable != null){
				operandVariable = new FlattenedVariable(getDescriptor(operand), variable.type.type)
				
			}
		}else{
			operandVariable = flatten(operand, snippet)
		}
		
		val operandDescriptor = operandVariable.descriptor
		val variableType = operandVariable.type
		
		val descriptor = (descriptorFactory.createSingleVariableDescriptorBuilder => [
			type = variableType
			name = null
		]).build
		
		snippet.snippet.add(createCompositeSnippet =>[ s |
			s.snippet.add(createStringSnippet => [value = descriptor.fullType])
			s.snippet.add(createStringSnippet => [value = ''' '''])
			s.snippet.add(createStringSnippet => [value = descriptor.stringRepresentation])
			s.snippet.add(createStringSnippet => [value = ''' = '''])
			s.snippet.add(createStringSnippet => [value = ''' '''+ex.operator+''' '''])
			s.snippet.add(createStringSnippet => [value = operandDescriptor.stringRepresentation])
			s.snippet.add(createStringSnippet => [value = ''';'''])
			s.snippet.add(createStringSnippet => [value = '\n'])
		])
		
		return new FlattenedVariable(descriptor, variableType)
	}
	
	def dispatch FlattenedVariable flatten(BitStringUnaryExpression ex, CompositeSnippet snippet){	
		val operand = ex.operand
		var FlattenedVariable operandVariable
		 
		if(operand.flatteningNotNeeded){
			val variable = (operand as NameExpression).reference as Variable
			if(variable != null){
				operandVariable = new FlattenedVariable(getDescriptor(operand), variable.type.type)
				
			}
		}else{
			operandVariable = flatten(operand, snippet)
		}
		
		val operandDescriptor = operandVariable.descriptor
		val variableType = operandVariable.type
		
		val descriptor = (descriptorFactory.createSingleVariableDescriptorBuilder => [
			type = variableType
			name = null
		]).build
		
		snippet.snippet.add(createCompositeSnippet =>[ s |
			s.snippet.add(createStringSnippet => [value = descriptor.fullType])
			s.snippet.add(createStringSnippet => [value = ''' '''])
			s.snippet.add(createStringSnippet => [value = descriptor.stringRepresentation])
			s.snippet.add(createStringSnippet => [value = ''' = '''])
			s.snippet.add(createStringSnippet => [value = ''' '''+ex.operator+''' '''])
			s.snippet.add(createStringSnippet => [value = operandDescriptor.stringRepresentation])
			s.snippet.add(createStringSnippet => [value = ''';'''])
			s.snippet.add(createStringSnippet => [value = '\n'])
		])
		
		return new FlattenedVariable(descriptor, variableType)
	}
	
	def dispatch FlattenedVariable flatten(BooleanUnaryExpression ex, CompositeSnippet snippet){	
		val operand = ex.operand
		var FlattenedVariable operandVariable
		 
		if(operand.flatteningNotNeeded){
			val variable = (operand as NameExpression).reference as Variable
			if(variable != null){
				operandVariable = new FlattenedVariable(getDescriptor(operand), variable.type.type)
				
			}
		}else{
			operandVariable = flatten(operand, snippet)
		}
		
		val operandDescriptor = operandVariable.descriptor
		val variableType = operandVariable.type
		
		val descriptor = (descriptorFactory.createSingleVariableDescriptorBuilder => [
			type = variableType
			name = null
		]).build
		
		snippet.snippet.add(createCompositeSnippet =>[ s |
			s.snippet.add(createStringSnippet => [value = descriptor.fullType])
			s.snippet.add(createStringSnippet => [value = ''' '''])
			s.snippet.add(createStringSnippet => [value = descriptor.stringRepresentation])
			s.snippet.add(createStringSnippet => [value = ''' = '''])
			s.snippet.add(createStringSnippet => [value = ''' '''+ex.operator+''' '''])
			s.snippet.add(createStringSnippet => [value = operandDescriptor.stringRepresentation])
			s.snippet.add(createStringSnippet => [value = ''';'''])
			s.snippet.add(createStringSnippet => [value = '\n'])
		])
		
		return new FlattenedVariable(descriptor, variableType)
	}
	
	//Expressions with TUPLEs
	
	
	def dispatch FlattenedVariable flatten(InstanceCreationExpression ex, CompositeSnippet snippet){	
		val instanceType = ex.instance
		val tuple = ex.parameters
	    val List<FlattenedVariable> variables = Lists.newArrayList
	    
		if(tuple instanceof NamedTuple){
			//Named Tuples not supported
			throw new UnsupportedOperationException("Named Tuples not supported")
		}else if (tuple instanceof ExpressionList){
			tuple.expressions.forEach[ expr |
				var FlattenedVariable contextVariable
				if(expr.flatteningNotNeeded){
					if(expr instanceof NameExpression){
						val variable = expr.reference as Variable
						if(variable != null){
							contextVariable = new FlattenedVariable(getDescriptor(expr), variable.type.type)
						}
					}else if (expr instanceof ThisExpression){
						contextVariable = new FlattenedVariable(getDescriptor(expr), context.thisType)
					}else if (expr instanceof NullExpression){
						//Null Expressions not supported
						throw new UnsupportedOperationException("Null Expressions not supported")
					}
					
				}else{
					contextVariable = flatten(expr, snippet)
				}
				variables.add(contextVariable)
			]
		}
		
		val variableDescriptor = (descriptorFactory.createSingleVariableDescriptorBuilder => [
			type = instanceType
			name = null
		]).build
				
		snippet.snippet.add(createCompositeSnippet =>[ s |
			s.snippet.add(createStringSnippet => [value = variableDescriptor.fullType])
			s.snippet.add(createStringSnippet => [value = ''' '''])
			s.snippet.add(createStringSnippet => [value = variableDescriptor.stringRepresentation])
			s.snippet.add(createStringSnippet => [value = ''' = new '''])
			s.snippet.add(createStringSnippet => [value = variableDescriptor.fullType])
			s.snippet.add(createStringSnippet => [value = '''('''])
			
			if(variables!= null && !variables.isEmpty){
				variables.forEach[
					s.snippet.add(createStringSnippet => [value = descriptor.stringRepresentation])
					s.snippet.add(createStringSnippet => [value = ''', '''])
				]
				s.snippet.remove(s.snippet.size-1)
			}
			
			s.snippet.add(createStringSnippet => [value = ''')'''])
			s.snippet.add(createStringSnippet => [value = ''';'''])
			s.snippet.add(createStringSnippet => [value = '\n'])
		])
				
		return new FlattenedVariable(variableDescriptor, instanceType)
	}
	
	public def flatteningSupported(EObject ex){
		return (ex instanceof ArithmeticExpression ||
				ex instanceof FeatureInvocationExpression || 
				ex instanceof AssociationAccessExpression || 
				ex instanceof LiteralExpression || 
				ex instanceof ShiftExpression || 
				ex instanceof RelationalExpression ||
				ex instanceof EqualityExpression ||
				ex instanceof ConditionalLogicalExpression ||
				ex instanceof LogicalExpression ||
				ex instanceof InstanceCreationExpression ||
				ex instanceof PrefixExpression ||
				ex instanceof PostfixExpression ||
				ex instanceof NumericUnaryExpression ||
				ex instanceof BitStringUnaryExpression ||
				ex instanceof BooleanUnaryExpression
		)
	}
	
	public def flatteningNotNeeded(EObject ex){
		return ((ex instanceof NameExpression) && (ex as NameExpression).reference instanceof Variable ||
				ex instanceof ThisExpression || 
				ex instanceof NullExpression 
		)
	}
	
	public static class FlattenedVariable{
		private ValueDescriptor descriptor
		private Type type
		
		new(ValueDescriptor descriptor, Type type){
			this.descriptor = descriptor
			this.type = type
		}
		
		def getDescriptor(){
			descriptor
		}
		
		def getType(){
			type
		}
		
		def setDescriptor(ValueDescriptor descriptor){
			this.descriptor = descriptor
		}
		
		def setType(Type type){
			this.type = type
		}
	}
}