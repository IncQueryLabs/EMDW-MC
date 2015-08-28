package com.incquerylabs.uml.ralf.snippetcompiler

import com.google.common.collect.Lists
import com.incquerylabs.emdw.valuedescriptor.ValueDescriptor
import com.incquerylabs.uml.ralf.ReducedAlfSystem
import com.incquerylabs.uml.ralf.reducedAlfLanguage.ArithmeticExpression
import com.incquerylabs.uml.ralf.reducedAlfLanguage.AssignmentExpression
import com.incquerylabs.uml.ralf.reducedAlfLanguage.AssociationAccessExpression
import com.incquerylabs.uml.ralf.reducedAlfLanguage.BitStringUnaryExpression
import com.incquerylabs.uml.ralf.reducedAlfLanguage.BooleanLiteralExpression
import com.incquerylabs.uml.ralf.reducedAlfLanguage.BooleanUnaryExpression
import com.incquerylabs.uml.ralf.reducedAlfLanguage.CastExpression
import com.incquerylabs.uml.ralf.reducedAlfLanguage.ConditionalLogicalExpression
import com.incquerylabs.uml.ralf.reducedAlfLanguage.ConditionalTestExpression
import com.incquerylabs.uml.ralf.reducedAlfLanguage.EqualityExpression
import com.incquerylabs.uml.ralf.reducedAlfLanguage.ExpressionList
import com.incquerylabs.uml.ralf.reducedAlfLanguage.FeatureInvocationExpression
import com.incquerylabs.uml.ralf.reducedAlfLanguage.InstanceCreationExpression
import com.incquerylabs.uml.ralf.reducedAlfLanguage.LinkOperationExpression
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
import com.incquerylabs.uml.ralf.reducedAlfLanguage.StaticFeatureInvocationExpression
import com.incquerylabs.uml.ralf.reducedAlfLanguage.StringLiteralExpression
import com.incquerylabs.uml.ralf.reducedAlfLanguage.SuperInvocationExpression
import com.incquerylabs.uml.ralf.reducedAlfLanguage.ThisExpression
import com.incquerylabs.uml.ralf.reducedAlfLanguage.Variable
import java.util.List
import org.eclipse.uml2.uml.Operation
import org.eclipse.uml2.uml.Parameter
import org.eclipse.uml2.uml.Property
import snippetTemplate.CompositeSnippet
import snippetTemplate.Snippet
import snippetTemplate.SnippetTemplateFactory
import snippetTemplate.StringSnippet
import com.incquerylabs.uml.ralf.reducedAlfLanguage.NamedTuple

class ExpressionVisitor {
	extension SnippetTemplateFactory factory = SnippetTemplateFactory.eINSTANCE
	extension SnippetTemplateCompilerUtil util
	extension ReducedAlfSystem typeSystem
	
	new(SnippetTemplateCompilerUtil util, ReducedAlfSystem typeSystem){
		this.typeSystem = typeSystem
		this.util = util
	}
		
	def dispatch Snippet visit(CastExpression ex, CompositeSnippet composite){
		val operandVariable = ex.operand.visit(composite)
		val variableType = typeSystem.type(ex).value.umlType
		
		val descriptor = (descriptorFactory.createSingleVariableDescriptorBuilder => [
			type = variableType
			name = null
		]).build
		
		val flattened = new StringBuilder("")
		flattened.append(descriptor.fullType)
		flattened.append(''' ''')
		flattened.append(descriptor.stringRepresentation)
		flattened.append(''' = (''')
		flattened.append(descriptor.fullType)
		flattened.append(''') ''')
		composite.snippet.add(createCompositeSnippet =>[ s |
			s.snippet.add(createStringSnippet => [value = flattened.toString])
			s.snippet.add(operandVariable)
			s.snippet.add(createStringSnippet => [value = ''';'''+'\n'])
			
		])
		
		createStringSnippet => [value = descriptor.stringRepresentation]
	}
	
	def dispatch Snippet visit(NullExpression ex, CompositeSnippet composite){
		createStringSnippet => [value = '''0''']
	}
	
	def dispatch Snippet visit(InstanceCreationExpression ex, CompositeSnippet composite){
		val variableType = typeSystem.type(ex).value.umlType
		
		val List<Snippet> parameterSnippets = Lists.newArrayList
		
		if(ex.parameters instanceof ExpressionList){
			val parameters = ex.parameters as ExpressionList
			parameters.expressions.forEach[ expr |
				parameterSnippets.add(expr.visit(composite))
			]
		}else{
			throw new UnsupportedOperationException("Only expression list based tuples are supported")
		}
		
		val descriptor = (descriptorFactory.createSingleVariableDescriptorBuilder => [
			type = variableType
			name = null
		]).build
		
		val header = new StringBuilder("")
		header.append(descriptor.fullType)
		header.append(''' ''')
		header.append(descriptor.stringRepresentation)
		header.append(''' = new ''')
		header.append(descriptor.fullType)
		header.append('''(''')
		val trailer = new StringBuilder("")
		trailer.append(''')''')
		trailer.append(''';''')
		trailer.append('\n')
		composite.snippet.add(createCompositeSnippet =>[ s |
			s.snippet.add(createStringSnippet => [value = header.toString])
			if(parameterSnippets!= null && !parameterSnippets.isEmpty){
				parameterSnippets.forEach[ snippet |
					s.snippet.add(snippet)
					s.snippet.add(createStringSnippet => [value = ''', '''])
				]
				s.snippet.remove(s.snippet.size-1)
			}
			s.snippet.add(createStringSnippet => [value = trailer.toString])
		])
		
		createStringSnippet => [value = descriptor.stringRepresentation]
	}
	

	def dispatch Snippet visit(ThisExpression ex, CompositeSnippet composite){
		val descriptor = getDescriptor(ex)
		createStringSnippet => [value = descriptor.stringRepresentation]
	}
	
	def dispatch Snippet visit(StaticFeatureInvocationExpression ex, CompositeSnippet composite){
		throw new UnsupportedOperationException("Static calls not supported yet")
	}
	
	def dispatch Snippet visit(SuperInvocationExpression ex, CompositeSnippet composite){
		throw new UnsupportedOperationException("Super invocations not supported yet")
	}
	
	def dispatch Snippet visit(LinkOperationExpression ex, CompositeSnippet composite){
		throw new UnsupportedOperationException("Link operations not supported yet")
	}
	
	def dispatch Snippet visit(AssociationAccessExpression ex, CompositeSnippet composite){
		val associationDescriptor = ex.descriptor
		val variableType = typeSystem.type(ex).value.umlType
		val descriptor = (descriptorFactory.createSingleVariableDescriptorBuilder => [
			type = variableType
			name = null
		]).build
		
		
		val flattened = new StringBuilder("")
		flattened.append(descriptor.fullType)
		flattened.append(''' ''')
		flattened.append(descriptor.stringRepresentation)
		flattened.append(''' = ''')
		flattened.append(associationDescriptor.stringRepresentation)
		flattened.append(''';''')
		flattened.append('\n')
		
		composite.snippet.add(createStringSnippet => [value = flattened.toString])
		
		createStringSnippet => [value = descriptor.stringRepresentation]
		
	}
	
	def dispatch Snippet visit(FeatureInvocationExpression ex, CompositeSnippet composite){
		var ValueDescriptor invocationDescriptor
		val contextSnippet = ex.context.visit(composite)
		
		val variableType = typeSystem.type(ex).value.umlType
		
		var ValueDescriptor descriptor 
		if(variableType != null){
			descriptor = (descriptorFactory.createSingleVariableDescriptorBuilder => [
				type = variableType
				name = null
			]).build
		}
		
		switch (ex.feature) {
	        Operation: {
	        	val op = ex.feature as Operation
				val List<ValueDescriptor> descriptors = Lists.newArrayList
				
				if(ex.parameters instanceof ExpressionList){
					val parameters = ex.parameters as ExpressionList
					parameters.expressions.forEach[ expr |
						val snippet = expr.visit(composite)
						if(snippet instanceof StringSnippet){
							descriptors.add((descriptorFactory.createSingleVariableDescriptorBuilder => [
								name = snippet.value
								type = typeSystem.type(expr).value.umlType
								isExistingVariable = true
							]).build)
						}
					]
				}else if(ex.parameters instanceof NamedTuple){
					val parameters = ex.parameters as NamedTuple
					parameters.expressions.forEach[ expr |
						val snippet = expr.expression.visit(composite)
						if(snippet instanceof StringSnippet){
							descriptors.add((descriptorFactory.createSingleVariableDescriptorBuilder => [
								name = snippet.value
								type = typeSystem.type(expr).value.umlType
								isExistingVariable = true
							]).build)
						}
					]
				}else{
					throw new UnsupportedOperationException("Only expression list based tuples are supported")
				}	
				
				val contextDescriptor = (descriptorFactory.createSingleVariableDescriptorBuilder => [
					name = (contextSnippet as StringSnippet).value
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
					name = (contextSnippet as StringSnippet).value
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
	    
		val flattened = new StringBuilder("")
		if(variableType != null){
			flattened.append(descriptor.fullType)
			flattened.append(''' ''')
			flattened.append(descriptor.stringRepresentation)
			flattened.append(''' = ''')
			flattened.append(invocationDescriptor.stringRepresentation)
			flattened.append(''';''')
			flattened.append('\n')
			composite.snippet.add(createStringSnippet => [value = flattened.toString])
			val returnVar = descriptor.stringRepresentation
			createStringSnippet => [value = returnVar]
		}else{
			val invocation = invocationDescriptor.stringRepresentation
			createStringSnippet => [value = invocation]
		}
		
		
		

	}
	
	
	def dispatch Snippet visit(AssignmentExpression ex, CompositeSnippet composite){
	   	val variableType = typeSystem.type(ex).value.umlType
	   	if(ex.leftHandSide instanceof FeatureInvocationExpression && (ex.leftHandSide as FeatureInvocationExpression).feature instanceof Property) {
			val propAccess = ex.leftHandSide as FeatureInvocationExpression
			
			val rhsSnippet = ex.rightHandSide.visit(composite)
			val contextSnippet = propAccess.context.visit(composite)
			
				
			val rhsDescriptor = (descriptorFactory.createSingleVariableDescriptorBuilder => [
				name = (rhsSnippet as StringSnippet).value
				type = variableType
				isExistingVariable = true
			]).build

	        val contextDescriptor = (descriptorFactory.createSingleVariableDescriptorBuilder => [
				name = (contextSnippet as StringSnippet).value
				type = variableType
				isExistingVariable = true
			]).build
			
			val assignmentDescriptor =  (descriptorFactory.createPropertyWriteBuilder => [
				variable = contextDescriptor
				property = propAccess.feature as Property
				newValue = rhsDescriptor
			]).build
			
			val descriptor = (descriptorFactory.createSingleVariableDescriptorBuilder => [
				type = variableType
				name = null
			]).build
			
			val flattened = new StringBuilder("")
			flattened.append(descriptor.fullType)
			flattened.append(''' ''')
			flattened.append(descriptor.stringRepresentation)
			flattened.append(''' = (''')
			flattened.append(assignmentDescriptor.stringRepresentation)
			flattened.append(''');''')
			flattened.append('\n')
			composite.snippet.add(createCompositeSnippet =>[ s |
				s.snippet.add(createStringSnippet => [value = flattened.toString])
			])
			
			createStringSnippet => [value = descriptor.stringRepresentation]
		} else {
			val lhsSnippet = ex.leftHandSide.visit(composite)
		    val rhsSnippet = ex.rightHandSide.visit(composite)
		    
		   	val descriptor = (descriptorFactory.createSingleVariableDescriptorBuilder => [
				type = variableType
				name = null
			]).build
		    
		    val flattened = new StringBuilder("")
			flattened.append(descriptor.fullType)
			flattened.append(''' ''')
			flattened.append(descriptor.stringRepresentation)
			flattened.append(''' = (''')
			composite.snippet.add(createCompositeSnippet =>[ s |
				s.snippet.add(createStringSnippet => [value = flattened.toString])
				s.snippet.add(lhsSnippet)
				s.snippet.add(createStringSnippet => [value = ''' '''+ex.operator+''' '''])
				s.snippet.add(rhsSnippet)
				s.snippet.add(createStringSnippet => [value = ''');'''+'\n'])
			])
			

			createStringSnippet => [value = descriptor.stringRepresentation]
		
		}
	}

	def dispatch Snippet visit(ArithmeticExpression ex, CompositeSnippet composite) {
		val operand1Variable = ex.operand1.visit(composite)
		val operand2Variable = ex.operand2.visit(composite)
		
		val variableType = typeSystem.type(ex).value.umlType
		
		val descriptor = (descriptorFactory.createSingleVariableDescriptorBuilder => [
			type = variableType
			name = null
		]).build
		
		val flattened = new StringBuilder("")
		flattened.append(descriptor.fullType)
		flattened.append(''' ''')
		flattened.append(descriptor.stringRepresentation)
		flattened.append(''' = ''')
		composite.snippet.add(createCompositeSnippet =>[ s |
			s.snippet.add(createStringSnippet => [value = flattened.toString])
			s.snippet.add(operand1Variable)
			s.snippet.add(createStringSnippet => [value = ''' '''+ex.operator+''' '''])
			s.snippet.add(operand2Variable)
			s.snippet.add(createStringSnippet => [value = ''';'''+'\n'])
		])
		
		createStringSnippet => [value = descriptor.stringRepresentation]
	}
	
	def dispatch Snippet visit(ShiftExpression ex, CompositeSnippet composite) {
		val operand1Variable = ex.operand1.visit(composite)
		val operand2Variable = ex.operand2.visit(composite)
		
		val variableType = typeSystem.type(ex).value.umlType
		
		val descriptor = (descriptorFactory.createSingleVariableDescriptorBuilder => [
			type = variableType
			name = null
		]).build
		
		val flattened = new StringBuilder("")
		flattened.append(descriptor.fullType)
		flattened.append(''' ''')
		flattened.append(descriptor.stringRepresentation)
		flattened.append(''' = ''')
		composite.snippet.add(createCompositeSnippet =>[ s |
			s.snippet.add(createStringSnippet => [value = flattened.toString])
			s.snippet.add(operand1Variable)
			s.snippet.add(createStringSnippet => [value = ''' '''+ex.operator+''' '''])
			s.snippet.add(operand2Variable)
			s.snippet.add(createStringSnippet => [value = ''';'''+'\n'])
		])
		
		createStringSnippet => [value = descriptor.stringRepresentation]
	}
	
	def dispatch Snippet visit(RelationalExpression ex, CompositeSnippet composite) {
		val operand1Variable = ex.operand1.visit(composite)
		val operand2Variable = ex.operand2.visit(composite)
		
		val variableType = typeSystem.type(ex).value.umlType
		
		val descriptor = (descriptorFactory.createSingleVariableDescriptorBuilder => [
			type = variableType
			name = null
		]).build
		
		val flattened = new StringBuilder("")
		flattened.append(descriptor.fullType)
		flattened.append(''' ''')
		flattened.append(descriptor.stringRepresentation)
		flattened.append(''' = ''')
		composite.snippet.add(createCompositeSnippet =>[ s |
			s.snippet.add(createStringSnippet => [value = flattened.toString])
			s.snippet.add(operand1Variable)
			s.snippet.add(createStringSnippet => [value = ''' '''+ex.operator+''' '''])
			s.snippet.add(operand2Variable)
			s.snippet.add(createStringSnippet => [value = ''';'''+'\n'])
		])
		
		createStringSnippet => [value = descriptor.stringRepresentation]
	}
	
	def dispatch Snippet visit(EqualityExpression ex, CompositeSnippet composite) {
		val operand1Variable = ex.operand1.visit(composite)
		val operand2Variable = ex.operand2.visit(composite)
		
		val variableType = typeSystem.type(ex).value.umlType
		
		val descriptor = (descriptorFactory.createSingleVariableDescriptorBuilder => [
			type = variableType
			name = null
		]).build
		
		val flattened = new StringBuilder("")
		flattened.append(descriptor.fullType)
		flattened.append(''' ''')
		flattened.append(descriptor.stringRepresentation)
		flattened.append(''' = ''')
		composite.snippet.add(createCompositeSnippet =>[ s |
			s.snippet.add(createStringSnippet => [value = flattened.toString])
			s.snippet.add(operand1Variable)
			s.snippet.add(createStringSnippet => [value = ''' '''+ex.operator+''' '''])
			s.snippet.add(operand2Variable)
			s.snippet.add(createStringSnippet => [value = ''';'''+'\n'])
		])
		
		createStringSnippet => [value = descriptor.stringRepresentation]
	}
	
	def dispatch Snippet visit(LogicalExpression ex, CompositeSnippet composite) {
		val operand1Variable = ex.operand1.visit(composite)
		val operand2Variable = ex.operand2.visit(composite)
		
		val variableType = typeSystem.type(ex).value.umlType
		
		val descriptor = (descriptorFactory.createSingleVariableDescriptorBuilder => [
			type = variableType
			name = null
		]).build
		
		val flattened = new StringBuilder("")
		flattened.append(descriptor.fullType)
		flattened.append(''' ''')
		flattened.append(descriptor.stringRepresentation)
		flattened.append(''' = ''')
		composite.snippet.add(createCompositeSnippet =>[ s |
			s.snippet.add(createStringSnippet => [value = flattened.toString])
			s.snippet.add(operand1Variable)
			s.snippet.add(createStringSnippet => [value = ''' '''+ex.operator+''' '''])
			s.snippet.add(operand2Variable)
			s.snippet.add(createStringSnippet => [value = ''';'''+'\n'])
		])
		
		createStringSnippet => [value = descriptor.stringRepresentation]
	}
	
	def dispatch Snippet visit(ConditionalLogicalExpression ex, CompositeSnippet composite) {
		val operand1Variable = ex.operand1.visit(composite)
		val operand2Variable = ex.operand2.visit(composite)
		
		val variableType = typeSystem.type(ex).value.umlType
		
		val descriptor = (descriptorFactory.createSingleVariableDescriptorBuilder => [
			type = variableType
			name = null
		]).build
		
		val flattened = new StringBuilder("")
		flattened.append(descriptor.fullType)
		flattened.append(''' ''')
		flattened.append(descriptor.stringRepresentation)
		flattened.append(''' = ''')
		composite.snippet.add(createCompositeSnippet =>[ s |
			s.snippet.add(createStringSnippet => [value = flattened.toString])
			s.snippet.add(operand1Variable)
			s.snippet.add(createStringSnippet => [value = ''' '''+ex.operator+''' '''])
			s.snippet.add(operand2Variable)
			s.snippet.add(createStringSnippet => [value = ''';'''+'\n'])
			
		])
		
		createStringSnippet => [value = descriptor.stringRepresentation]
	}

	def dispatch Snippet visit(PrefixExpression ex, CompositeSnippet composite){
		val operandVariable = ex.operand.expression.visit(composite)
		
		val variableType = typeSystem.type(ex).value.umlType
		
		val descriptor = (descriptorFactory.createSingleVariableDescriptorBuilder => [
			type = variableType
			name = null
		]).build
		
		val flattened = new StringBuilder("")
		flattened.append(descriptor.fullType)
		flattened.append(''' ''')
		flattened.append(descriptor.stringRepresentation)
		flattened.append(''' = ''')
		flattened.append(ex.operator.literal)
		composite.snippet.add(createCompositeSnippet =>[ s |
			s.snippet.add(createStringSnippet => [value = flattened.toString])
			s.snippet.add(operandVariable)
			s.snippet.add(createStringSnippet => [value = ''';'''+'\n'])
		])
		
		createStringSnippet => [value = descriptor.stringRepresentation]
	}
	
	def dispatch Snippet visit(PostfixExpression ex, CompositeSnippet composite){
		val operandVariable = ex.operand.expression.visit(composite)
		
		val variableType = typeSystem.type(ex).value.umlType
		
		val descriptor = (descriptorFactory.createSingleVariableDescriptorBuilder => [
			type = variableType
			name = null
		]).build
		
		val flattened = new StringBuilder("")
		flattened.append(descriptor.fullType)
		flattened.append(''' ''')
		flattened.append(descriptor.stringRepresentation)
		flattened.append(''' = ''')
		composite.snippet.add(createCompositeSnippet =>[ s |
			s.snippet.add(createStringSnippet => [value = flattened.toString])
			s.snippet.add(operandVariable)
			s.snippet.add(createStringSnippet => [value = ex.operator.literal+''';'''+'\n'])
		])
		
		createStringSnippet => [value = descriptor.stringRepresentation]
	}

	
	def dispatch Snippet visit(ConditionalTestExpression ex, CompositeSnippet composite) {
		val operand1Variable = ex.operand1.visit(composite)
		val operand2Variable = ex.operand2.visit(composite)
		val operand3Variable = ex.operand3.visit(composite)
		
		val variableType = typeSystem.type(ex).value.umlType
		
		val descriptor = (descriptorFactory.createSingleVariableDescriptorBuilder => [
			type = variableType
			name = null
		]).build
		
		val flattened = new StringBuilder("")
		flattened.append(descriptor.fullType)
		flattened.append(''' ''')
		flattened.append(descriptor.stringRepresentation)
		flattened.append(''' = ''')
		flattened.append('''(''')
		composite.snippet.add(createCompositeSnippet =>[ s |
			s.snippet.add(createStringSnippet => [value = flattened.toString])
			s.snippet.add(operand1Variable)
			s.snippet.add(createStringSnippet => [value = ''') ? ('''])
			s.snippet.add(operand2Variable)
			s.snippet.add(createStringSnippet => [value = ''') : ('''])
			s.snippet.add(operand3Variable)
			s.snippet.add(createStringSnippet => [value = ''');'''+'\n'])
		])
		
		createStringSnippet => [value = descriptor.stringRepresentation]
	}

	def dispatch Snippet visit(NameExpression ex, CompositeSnippet composite){
		if(ex.reference instanceof Variable){
			val variable = ex.reference as Variable
			if(variable != null){
				val descriptor = getDescriptor(ex)
				return createStringSnippet => [
					value = descriptor.stringRepresentation
				]
			}
		}else if(ex.reference instanceof Parameter){
			val parameter = ex.reference as Parameter
			if(parameter != null){
				val descriptor = getDescriptor(ex)
				return createStringSnippet => [
					value = descriptor.stringRepresentation
				]
			}
		}else{
			throw new UnsupportedOperationException("Only variables and parameters are supported")
		}
	}
	
	
	def dispatch Snippet visit(NumericUnaryExpression ex, CompositeSnippet composite){
		val operandVariable = ex.operand.visit(composite)
		val variableType = typeSystem.type(ex).value.umlType
		
		val descriptor = (descriptorFactory.createSingleVariableDescriptorBuilder => [
			type = variableType
			name = null
		]).build
		
		val flattened = new StringBuilder("")
		flattened.append(descriptor.fullType)
		flattened.append(''' ''')
		flattened.append(descriptor.stringRepresentation)
		flattened.append(''' = ''')
		flattened.append(ex.operator.literal)
		composite.snippet.add(createCompositeSnippet =>[ s |
			s.snippet.add(createStringSnippet => [value = flattened.toString])
			s.snippet.add(operandVariable)
			s.snippet.add(createStringSnippet => [value = ''';'''+'\n'])
		])
		
		createStringSnippet => [value = descriptor.stringRepresentation]
	}
	
	def dispatch Snippet visit(BitStringUnaryExpression ex, CompositeSnippet composite){
		val operandVariable = ex.operand.visit(composite)
		val variableType = typeSystem.type(ex).value.umlType
		
		val descriptor = (descriptorFactory.createSingleVariableDescriptorBuilder => [
			type = variableType
			name = null
		]).build
		
		val flattened = new StringBuilder("")
		flattened.append(descriptor.fullType)
		flattened.append(''' ''')
		flattened.append(descriptor.stringRepresentation)
		flattened.append(''' = ''')
		flattened.append(ex.operator)
		composite.snippet.add(createCompositeSnippet =>[ s |
			s.snippet.add(createStringSnippet => [value = flattened.toString])
			s.snippet.add(operandVariable)
			s.snippet.add(createStringSnippet => [value = ''';'''+'\n'])
		])
		
		createStringSnippet => [value = descriptor.stringRepresentation]
	}
	
	def dispatch Snippet visit(BooleanUnaryExpression ex, CompositeSnippet composite){
		val operandVariable = ex.operand.visit(composite)
		val variableType = typeSystem.type(ex).value.umlType
		
		val descriptor = (descriptorFactory.createSingleVariableDescriptorBuilder => [
			type = variableType
			name = null
		]).build
		
		val flattened = new StringBuilder("")
		flattened.append(descriptor.fullType)
		flattened.append(''' ''')
		flattened.append(descriptor.stringRepresentation)
		flattened.append(''' = ''')
		flattened.append(ex.operator)
		composite.snippet.add(createCompositeSnippet =>[ s |
			s.snippet.add(createStringSnippet => [value = flattened.toString])
			s.snippet.add(operandVariable)
			s.snippet.add(createStringSnippet => [value = ''';'''+'\n'])
		])
		
		createStringSnippet => [value = descriptor.stringRepresentation]
	}
	
	def dispatch Snippet visit(NaturalLiteralExpression ex, CompositeSnippet composite) {
		createStringSnippet => [value = getDescriptor(ex).stringRepresentation]
    }
    
	def dispatch Snippet visit(RealLiteralExpression ex, CompositeSnippet composite) {
		createStringSnippet => [value = getDescriptor(ex).stringRepresentation]
    }
	
	def dispatch Snippet visit(BooleanLiteralExpression ex, CompositeSnippet composite){
		createStringSnippet => [value = getDescriptor(ex).stringRepresentation]
	}
	   
	def dispatch Snippet visit(StringLiteralExpression ex, CompositeSnippet composite){
		createStringSnippet => [value = getDescriptor(ex).stringRepresentation]
	}
	
}