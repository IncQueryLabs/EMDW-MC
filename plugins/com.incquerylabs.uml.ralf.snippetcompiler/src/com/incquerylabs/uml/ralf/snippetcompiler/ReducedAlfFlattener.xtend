package com.incquerylabs.uml.ralf.snippetcompiler

import com.google.common.collect.Lists
import com.incquerylabs.emdw.valuedescriptor.ValueDescriptor
import com.incquerylabs.uml.ralf.reducedAlfLanguage.ArithmeticExpression
import com.incquerylabs.uml.ralf.reducedAlfLanguage.AssignmentExpression
import com.incquerylabs.uml.ralf.reducedAlfLanguage.AssociationAccessExpression
import com.incquerylabs.uml.ralf.reducedAlfLanguage.BitStringUnaryExpression
import com.incquerylabs.uml.ralf.reducedAlfLanguage.BooleanLiteralExpression
import com.incquerylabs.uml.ralf.reducedAlfLanguage.BooleanUnaryExpression
import com.incquerylabs.uml.ralf.reducedAlfLanguage.ConditionalLogicalExpression
import com.incquerylabs.uml.ralf.reducedAlfLanguage.EqualityExpression
import com.incquerylabs.uml.ralf.reducedAlfLanguage.Expression
import com.incquerylabs.uml.ralf.reducedAlfLanguage.ExpressionList
import com.incquerylabs.uml.ralf.reducedAlfLanguage.FeatureInvocationExpression
import com.incquerylabs.uml.ralf.reducedAlfLanguage.InstanceCreationExpression
import com.incquerylabs.uml.ralf.reducedAlfLanguage.LiteralExpression
import com.incquerylabs.uml.ralf.reducedAlfLanguage.LogicalExpression
import com.incquerylabs.uml.ralf.reducedAlfLanguage.NameExpression
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
import org.eclipse.uml2.uml.Operation
import org.eclipse.uml2.uml.Parameter
import org.eclipse.uml2.uml.Property
import org.eclipse.uml2.uml.Type
import snippetTemplate.CompositeSnippet
import snippetTemplate.Snippet
import snippetTemplate.SnippetTemplateFactory

class ReducedAlfFlattener {
	extension SnippetTemplateFactory factory = SnippetTemplateFactory.eINSTANCE
	extension SnippetTemplateCompilerUtil util
	
	new(SnippetTemplateCompilerUtil util){
		this.util = util
	}

	def dispatch FlattenedVariable flatten(ArithmeticExpression ex, CompositeSnippet snippet){
		val operand1Variable = flattenChildExpression(ex.operand1, snippet)
		val operand2Variable = flattenChildExpression(ex.operand2, snippet)
		
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
			s.snippet.add(createStringSnippet => [value = operand1Variable.descriptor.stringRepresentation])
			s.snippet.add(createStringSnippet => [value = ''' '''+ex.operator+''' '''])
			s.snippet.add(createStringSnippet => [value = operand2Variable.descriptor.stringRepresentation])
			s.snippet.add(createStringSnippet => [value = ''';'''])
			s.snippet.add(createStringSnippet => [value = '\n'])
		])
		
		return new FlattenedVariable(descriptor, variableType)
	}
	
	def dispatch FlattenedVariable flatten(FeatureInvocationExpression ex, CompositeSnippet snippet){	
		val feature = ex.feature
		if(feature instanceof Property){
			return flatten(ex, feature, snippet)
		}else if (feature instanceof Operation){
			return flatten(ex, feature, snippet)
		}
	}
	
	private def FlattenedVariable flatten(FeatureInvocationExpression ex, Property prop, CompositeSnippet snippet){			
		val contextVariable = flattenChildExpression(ex.context, snippet)
		val variableType = prop.type
		
		val descriptor = (descriptorFactory.createSingleVariableDescriptorBuilder => [
			type = variableType
			name = null
		]).build
		
		val propertyAccess = (descriptorFactory.createPropertyReadBuilder => [
			variable = contextVariable.descriptor
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
	
	private def FlattenedVariable flatten(FeatureInvocationExpression ex, Operation op, CompositeSnippet snippet){	
		val contextVariable = flattenChildExpression(ex.context, snippet)
		val List<FlattenedVariable> flattenedParameters = Lists.newArrayList
		
		if(ex.parameters instanceof ExpressionList){
			val parameters = ex.parameters as ExpressionList
			parameters.expressions.forEach[ expr |
				flattenedParameters.add(flattenChildExpression(expr, snippet))
			]
		}else{
			throw new UnsupportedOperationException("Only expression list based tuples are supported")
		}
		
		val List<ValueDescriptor> tupleDescriptors = Lists.newArrayList									

		
		val descriptor = (descriptorFactory.createSingleVariableDescriptorBuilder => [
			type = op.type
			name = null
		]).build
		
		flattenedParameters.forEach[ p |
			tupleDescriptors.add(p.descriptor)
		]
		
		
		val operationCallDescriptor = (descriptorFactory.createOperationCallBuilder => [
			variable = contextVariable.descriptor
			operation = ex.feature as Operation
			parameters = tupleDescriptors
		]).build
		
		snippet.snippet.add = createCompositeSnippet => [
			snippet.snippet.add(createStringSnippet => [value = descriptor.fullType])
			snippet.snippet.add(createStringSnippet => [value = ''' '''])
			snippet.snippet.add(createStringSnippet => [value = descriptor.stringRepresentation])
			snippet.snippet.add(createStringSnippet => [value = ''' = '''])
			snippet.snippet.add(createStringSnippet => [value = operationCallDescriptor.stringRepresentation	])
			snippet.snippet.add(createStringSnippet => [value = ''';'''])
			snippet.snippet.add(createStringSnippet => [value = '\n'])
		]
				
		return new FlattenedVariable(descriptor, op.type)
	}
	
	def dispatch FlattenedVariable flatten(AssociationAccessExpression ex, CompositeSnippet snippet){		
		val contextVariable = flattenChildExpression(ex.context, snippet)
		val variableType = ex.association.type
		
		val descriptor = (descriptorFactory.createSingleVariableDescriptorBuilder => [
			type = variableType
			name = null
		]).build
		
		val propertyAccess = (descriptorFactory.createPropertyReadBuilder => [
			variable = contextVariable.descriptor
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
		val operand1Variable = flattenChildExpression(ex.operand1, snippet)
		val operand2Variable = flattenChildExpression(ex.operand2, snippet)
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
			s.snippet.add(createStringSnippet => [value = operand1Variable.descriptor.stringRepresentation])
			s.snippet.add(createStringSnippet => [value = ''' '''+ex.operator+''' '''])
			s.snippet.add(createStringSnippet => [value = operand2Variable.descriptor.stringRepresentation])
			s.snippet.add(createStringSnippet => [value = ''';'''])
			s.snippet.add(createStringSnippet => [value = '\n'])
		])
		
		return new FlattenedVariable(descriptor, variableType)
	}
	
	def dispatch FlattenedVariable flatten(RelationalExpression ex, CompositeSnippet snippet){
		val operand1Variable = flattenChildExpression(ex.operand1, snippet)
		val operand2Variable = flattenChildExpression(ex.operand2, snippet)
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
			s.snippet.add(createStringSnippet => [value = operand1Variable.descriptor.stringRepresentation])
			s.snippet.add(createStringSnippet => [value = ''' '''+ex.operator+''' '''])
			s.snippet.add(createStringSnippet => [value = operand2Variable.descriptor.stringRepresentation])
			s.snippet.add(createStringSnippet => [value = ''';'''])
			s.snippet.add(createStringSnippet => [value = '\n'])
		])
		
		return new FlattenedVariable(descriptor, variableType)
	}
	
	def dispatch FlattenedVariable flatten(EqualityExpression ex, CompositeSnippet snippet){
		val operand1Variable = flattenChildExpression(ex.operand1, snippet)
		val operand2Variable = flattenChildExpression(ex.operand2, snippet)
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
			s.snippet.add(createStringSnippet => [value = operand1Variable.descriptor.stringRepresentation])
			s.snippet.add(createStringSnippet => [value = ''' '''+ex.operator+''' '''])
			s.snippet.add(createStringSnippet => [value = operand2Variable.descriptor.stringRepresentation])
			s.snippet.add(createStringSnippet => [value = ''';'''])
			s.snippet.add(createStringSnippet => [value = '\n'])
		])
		
		return new FlattenedVariable(descriptor, variableType)
	}
	
	def dispatch FlattenedVariable flatten(ConditionalLogicalExpression ex, CompositeSnippet snippet){
		val operand1Variable = flattenChildExpression(ex.operand1, snippet)
		val operand2Variable = flattenChildExpression(ex.operand2, snippet)
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
			s.snippet.add(createStringSnippet => [value = operand1Variable.descriptor.stringRepresentation])
			s.snippet.add(createStringSnippet => [value = ''' '''+ex.operator+''' '''])
			s.snippet.add(createStringSnippet => [value = operand2Variable.descriptor.stringRepresentation])
			s.snippet.add(createStringSnippet => [value = ''';'''])
			s.snippet.add(createStringSnippet => [value = '\n'])
		])
		
		return new FlattenedVariable(descriptor, variableType)
	}
	
	def dispatch FlattenedVariable flatten(LogicalExpression ex, CompositeSnippet snippet){
		val operand1Variable = flattenChildExpression(ex.operand1, snippet)
		val operand2Variable = flattenChildExpression(ex.operand2, snippet)
		
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
			s.snippet.add(createStringSnippet => [value = operand1Variable.descriptor.stringRepresentation])
			s.snippet.add(createStringSnippet => [value = ''' '''+ex.operator+''' '''])
			s.snippet.add(createStringSnippet => [value = operand2Variable.descriptor.stringRepresentation])
			s.snippet.add(createStringSnippet => [value = ''';'''])
			s.snippet.add(createStringSnippet => [value = '\n'])
		])
		
		return new FlattenedVariable(descriptor, variableType)
	}
	
	def dispatch FlattenedVariable flatten(PrefixExpression ex, CompositeSnippet snippet){
		val operandVariable = flattenChildExpression(ex.operand.expression,snippet)
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
			s.snippet.add(createStringSnippet => [value = operandVariable.descriptor.stringRepresentation])
			s.snippet.add(createStringSnippet => [value = ''';'''])
			s.snippet.add(createStringSnippet => [value = '\n'])
		])
		
		return new FlattenedVariable(descriptor, variableType)
	}
	
	def dispatch FlattenedVariable flatten(PostfixExpression ex, CompositeSnippet snippet){
		val operandVariable = flattenChildExpression(ex.operand.expression,snippet)
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
			s.snippet.add(createStringSnippet => [value = operandVariable.descriptor.stringRepresentation])
			s.snippet.add(createStringSnippet => [value = ex.operator.toString])
			s.snippet.add(createStringSnippet => [value = ''';'''])
			s.snippet.add(createStringSnippet => [value = '\n'])
		])
		
		return new FlattenedVariable(descriptor, variableType)
	}
	
	def dispatch FlattenedVariable flatten(NumericUnaryExpression ex, CompositeSnippet snippet){	
		val operandVariable = flattenChildExpression(ex.operand, snippet)
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
			s.snippet.add(createStringSnippet => [value = operandVariable.descriptor.stringRepresentation])
			s.snippet.add(createStringSnippet => [value = ''';'''])
			s.snippet.add(createStringSnippet => [value = '\n'])
		])
		
		return new FlattenedVariable(descriptor, variableType)
	}
	
	def dispatch FlattenedVariable flatten(BitStringUnaryExpression ex, CompositeSnippet snippet){	
		val operandVariable = flattenChildExpression(ex.operand, snippet)
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
			s.snippet.add(createStringSnippet => [value = operandVariable.descriptor.stringRepresentation])
			s.snippet.add(createStringSnippet => [value = ''';'''])
			s.snippet.add(createStringSnippet => [value = '\n'])
		])
		
		return new FlattenedVariable(descriptor, variableType)
	}
	
	def dispatch FlattenedVariable flatten(BooleanUnaryExpression ex, CompositeSnippet snippet){	
		val operandVariable = flattenChildExpression(ex.operand, snippet)
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
			s.snippet.add(createStringSnippet => [value = operandVariable.descriptor.stringRepresentation])
			s.snippet.add(createStringSnippet => [value = ''';'''])
			s.snippet.add(createStringSnippet => [value = '\n'])
		])
		
		return new FlattenedVariable(descriptor, variableType)
	}
	
	def dispatch FlattenedVariable flatten(AssignmentExpression ex, CompositeSnippet snippet){	
		val lhsVariable = flattenChildExpression(ex.leftHandSide, snippet)
		val rhsVariable = flattenChildExpression(ex.rightHandSide, snippet)
		val variableType = lhsVariable.type
		
		val descriptor = (descriptorFactory.createSingleVariableDescriptorBuilder => [
			type = variableType
			name = null
		]).build
		
		snippet.snippet.add(createCompositeSnippet =>[ s |
			s.snippet.add(createStringSnippet => [value = descriptor.fullType])
			s.snippet.add(createStringSnippet => [value = ''' '''])
			s.snippet.add(createStringSnippet => [value = descriptor.stringRepresentation])
			s.snippet.add(createStringSnippet => [value = ''' = '''])
			s.snippet.add(createStringSnippet => [value = '''('''])
			s.snippet.add(createStringSnippet => [value = lhsVariable.descriptor.stringRepresentation])
			s.snippet.add(createStringSnippet => [value = ''' '''+ex.operator+''' '''])
			s.snippet.add(createStringSnippet => [value = rhsVariable.descriptor.stringRepresentation])
			s.snippet.add(createStringSnippet => [value = ''')'''])
			s.snippet.add(createStringSnippet => [value = ''';'''])
			s.snippet.add(createStringSnippet => [value = '\n'])
		])
		
		return new FlattenedVariable(descriptor, variableType)
	}
	
	//Expressions with TUPLEs
	
	
	def dispatch FlattenedVariable flatten(InstanceCreationExpression ex, CompositeSnippet snippet){	
		val instanceType = ex.instance
		
	   	val List<FlattenedVariable> flattenedParameters = Lists.newArrayList
		
		if(ex.parameters instanceof ExpressionList){
			val parameters = ex.parameters as ExpressionList
			parameters.expressions.forEach[ expr |
				flattenedParameters.add(flattenChildExpression(expr, snippet))
			]
		}else{
			throw new UnsupportedOperationException("Only expression list based tuples are supported")
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
			
			if(flattenedParameters!= null && !flattenedParameters.isEmpty){
				flattenedParameters.forEach[ variable |
					s.snippet.add(createStringSnippet => [value = variable.descriptor.stringRepresentation])
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
				ex instanceof AssignmentExpression || 
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
				(ex instanceof NameExpression) && (ex as NameExpression).reference instanceof Parameter ||
				ex instanceof LiteralExpression || 
				ex instanceof ThisExpression || 
				ex instanceof NullExpression 
		)
	}
	
	public def flattenChildExpression(Expression expression, CompositeSnippet snippet){
		var FlattenedVariable switchVariable 
		if(expression.flatteningNotNeeded){
			var Type type
			if(expression instanceof NaturalLiteralExpression){
				type = context.getPrimitiveType(IUMLContextProvider.INTEGER_TYPE)
			}else if(expression instanceof RealLiteralExpression){
				type = context.getPrimitiveType(IUMLContextProvider.REAL_TYPE)
			}else if(expression instanceof StringLiteralExpression){
				type = context.getPrimitiveType(IUMLContextProvider.STRING_TYPE)
			}else if(expression instanceof BooleanLiteralExpression){
				type = context.getPrimitiveType(IUMLContextProvider.BOOLEAN_TYPE)
			}else if(expression instanceof ThisExpression){
				type = context.thisType
			}else if((expression as NameExpression).reference instanceof Variable){
				val variable = (expression as NameExpression).reference as Variable
				type =  variable.type.type
			}else if((expression as NameExpression).reference instanceof Parameter){
				val param = (expression as NameExpression).reference as Parameter
				type =  param.type
			}else{
				throw new UnsupportedOperationException("Only literals, variables, parameters and 'this' are supported")
			}
			switchVariable = new FlattenedVariable(getDescriptor(expression), type)
		}else{			
			switchVariable = flatten(expression, snippet)
		}
	}
	
	public static class FlattenedVariable{
		private ValueDescriptor descriptor
		private Type type
		private Snippet snippet
		
		new(ValueDescriptor descriptor, Type type, Snippet snippet){
			this.descriptor = descriptor
			this.type = type
			this.snippet = snippet
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