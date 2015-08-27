package com.incquerylabs.uml.ralf.snippetcompiler

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
import com.incquerylabs.uml.ralf.reducedAlfLanguage.Tuple
import com.incquerylabs.uml.ralf.reducedAlfLanguage.Variable
import com.incquerylabs.uml.ralf.snippetcompiler.ReducedAlfFlattener.FlattenedVariable
import org.eclipse.uml2.uml.Operation
import org.eclipse.uml2.uml.Parameter
import org.eclipse.uml2.uml.Property
import snippetTemplate.CompositeSnippet
import snippetTemplate.Snippet
import snippetTemplate.SnippetTemplateFactory

class ExpressionVisitor {
	extension SnippetTemplateFactory factory = SnippetTemplateFactory.eINSTANCE
	extension ReducedAlfSnippetTemplateCompiler compiler
	extension SnippetTemplateCompilerUtil util
	extension ReducedAlfFlattener flattener
	
	new(ReducedAlfSnippetTemplateCompiler compiler, ReducedAlfFlattener flattener){
		this.compiler = compiler
		this.flattener = flattener
		util = compiler.util
	}
	
//	def dispatch Snippet visit(SequenceAccessExpression ex, CompositeSnippet composite){
//		val primarySnippet = ex.primary.visit
//				
//		
//		createCompositeSnippet =>[
//			snippet.add(ex.primary.visit)
//			snippet.add(ex?.index.visit)
//		]
//	}
	
	def dispatch FlattenedVariable visit(CastExpression ex, CompositeSnippet composite){
		val descriptor = getDescriptor(ex)
		createCompositeSnippet =>[
			snippet.add(createStringSnippet => [value = '''('''])
			snippet.add(createStringSnippet => [value = descriptor.fullType])
			snippet.add(createStringSnippet => [value = ''') '''])
			snippet.add(ex.operand.visit)
		]
	}
	
	def dispatch FlattenedVariable visit(NullExpression ex, CompositeSnippet composite){
		createCompositeSnippet =>[
			snippet.add(createStringSnippet => [value = '''0'''])
		]
	}
	
	def dispatch FlattenedVariable visit(InstanceCreationExpression ex, CompositeSnippet composite){
		val variableDescriptor = (descriptorFactory.createSingleVariableDescriptorBuilder => [
			type = ex.instance
			name = null
			isExistingVariable = true
		]).build
		createCompositeSnippet =>[
			snippet.add(createStringSnippet => [value = '''new '''])
			snippet.add(createStringSnippet => [value = variableDescriptor.fullType])
			snippet.add(ex.parameters.visit)
		]
	}
	

	def dispatch FlattenedVariable visit(ThisExpression ex, CompositeSnippet composite){
		val descriptor = getDescriptor(ex)
		createStringSnippet => [value = descriptor.stringRepresentation]
	}
	
	def dispatch FlattenedVariable visit(StaticFeatureInvocationExpression ex, CompositeSnippet composite){
		throw new UnsupportedOperationException("Static calls not supported yet")
	}
	
	def dispatch FlattenedVariable visit(SuperInvocationExpression ex, CompositeSnippet composite){
		throw new UnsupportedOperationException("Super invocations not supported yet")
	}
	
	def dispatch FlattenedVariable visit(LinkOperationExpression ex, CompositeSnippet composite){
		createCompositeSnippet =>[
			snippet.add(createStringSnippet => [value = ex.association.reference.name])
			snippet.add(createStringSnippet => [value = '''->'''])
			snippet.add(createStringSnippet => [value = ex.linkOperation.getName()])
			snippet.add(ex.parameters.visit)
		]
	}
	
	def dispatch FlattenedVariable visit(AssociationAccessExpression ex, CompositeSnippet composite){
		if(ex.context instanceof ThisExpression){
			return createCompositeSnippet =>[
				snippet.add(ex.context.visit)
				snippet.add(createStringSnippet => [value = '''->'''])
				snippet.add(createStringSnippet => [value = ex.association.name])
			]
		}else{
			val descriptor = getDescriptor(ex)
			return createCompositeSnippet =>[
				snippet.add(createStringSnippet => [value = descriptor.stringRepresentation])
			]
		}
	}
	
    private def Snippet createThisInvocationSnippet(ThisExpression context, Property property) {
        if(context instanceof ThisExpression){
            return createCompositeSnippet => [
                snippet.add(context.visit)
                snippet.add(createStringSnippet => [value = '''->'''    ])
                snippet.add(createStringSnippet => [value = property.name])
            ]
        }
    }
	
	private def Snippet createThisInvocationSnippet(ThisExpression context, Operation op, Tuple parameters) {
        createCompositeSnippet => [
            snippet.add(context.visit)
            snippet.add(createStringSnippet => [
                value = '''.'''
            ])
            snippet.add(createStringSnippet => [value = op.name])
            snippet.add(parameters.visit)
        ]
    }
	
	def dispatch FlattenedVariable visit(FeatureInvocationExpression ex, CompositeSnippet composite){
		if(ex.context instanceof ThisExpression){
			return if (ex.feature instanceof Operation) {
			    createThisInvocationSnippet(ex.context as ThisExpression, ex.feature as Operation, ex.parameters)
			} else if (ex.feature instanceof Property) {
			    createThisInvocationSnippet(ex.context as ThisExpression, ex.feature as Property)
			}
		} else {
			val descriptor = util.getDescriptor(ex)
			return createCompositeSnippet => [
				snippet.add(createStringSnippet => [value = descriptor.stringRepresentation	])
			]
		}
	}
	
	
	def dispatch FlattenedVariable visit(AssignmentExpression ex, CompositeSnippet composite){
	    //TODO revisit the left hand side expressions correctly
		//If the left hand side is a property
		if(ex.leftHandSide instanceof FeatureInvocationExpression) {
			val descriptor = getDescriptor(ex)
			return createCompositeSnippet =>[
				snippet.add(createStringSnippet => [value = descriptor.stringRepresentation])
			]
		} else {
			//If assignment has no property on the left hand side
			return createCompositeSnippet =>[
				snippet.add(ex.leftHandSide.visit)
				snippet.add(createStringSnippet => [value = ''' '''	])
				snippet.add(createStringSnippet => [value = ex.operator.literal])
				snippet.add(createStringSnippet => [value = ''' '''	])
				snippet.add(ex.rightHandSide.visit)
			]
		}

	}

	def dispatch FlattenedVariable visit(ArithmeticExpression ex, CompositeSnippet composite) {
		val operand1Variable = ex.operand1.visit(composite)
		val operand2Variable = ex.operand2.visit(composite)
		
		composite.snippet.add(createCompositeSnippet =>[ s |
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
		
		
		createCompositeSnippet =>[
			snippet.add(createStringSnippet => [
				if (util.parenthesisRequired(ex)) 
					value = "(" 
				else 
					value = ""
			])
			snippet.add(ex.operand1.visit)
			snippet.add(createStringSnippet => [
				value = ''' '''
			])
			snippet.add(createStringSnippet => [
				value = ex.operator
			])
			snippet.add(createStringSnippet => [
				value = ''' '''
			])
			snippet.add(ex.operand2.visit)
			snippet.add(createStringSnippet => [
				if (util.parenthesisRequired(ex)) 
					value = ")" 
				else 
					value = ""
			])
		]


	}
	
	def dispatch FlattenedVariable visit(ShiftExpression ex, CompositeSnippet composite) {
//	    createCompositeSnippet =>[
//			snippet.add(createStringSnippet => [
//				if (util.parenthesisRequired(ex)) 
//					value = "(" 
//				else 
//					value = ""
//			])
//			snippet.add(ex.operand1.visit)
//			snippet.add(createStringSnippet => [
//				value = ''' '''
//			])
//			snippet.add(createStringSnippet => [
//				value = ex.operator.literal
//			])
//			snippet.add(createStringSnippet => [
//				value = ''' '''
//			])
//			snippet.add(ex.operand2.visit)
//			snippet.add(createStringSnippet => [
//				if (util.parenthesisRequired(ex)) 
//					value = ")" 
//				else 
//					value = ""
//			])
//		]
		throw new UnsupportedOperationException("ShiftExpression handled by flattener")
	}
	
	def dispatch FlattenedVariable visit(RelationalExpression ex, CompositeSnippet composite) {
//		createCompositeSnippet =>[
//			snippet.add(createStringSnippet => [
//				if (util.parenthesisRequired(ex)) 
//					value = "(" 
//				else 
//					value = ""
//			])
//			snippet.add(ex.operand1.visit)
//			snippet.add(createStringSnippet => [
//				value = ''' '''
//			])
//			snippet.add(createStringSnippet => [
//				value = ex.operator.literal
//			])
//			snippet.add(createStringSnippet => [
//				value = ''' '''
//			])
//			snippet.add(ex.operand2.visit)
//			snippet.add(createStringSnippet => [
//				if (util.parenthesisRequired(ex)) 
//					value = ")" 
//				else 
//					value = ""
//			])
//		]
		throw new UnsupportedOperationException("RelationalExpression handled by flattener")
	}
	
	def dispatch FlattenedVariable visit(EqualityExpression ex, CompositeSnippet composite) {
//		createCompositeSnippet =>[
//			snippet.add(createStringSnippet => [
//				if (util.parenthesisRequired(ex)) 
//					value = "(" 
//				else 
//					value = ""
//			])
//			snippet.add(ex.operand1.visit)
//			snippet.add(createStringSnippet => [
//				value = ''' '''
//			])
//			snippet.add(createStringSnippet => [
//				value = ex.operator.literal
//			])
//			snippet.add(createStringSnippet => [
//				value = ''' '''
//			])
//			snippet.add(ex.operand2.visit)
//			snippet.add(createStringSnippet => [
//				if (util.parenthesisRequired(ex)) 
//					value = ")" 
//				else 
//					value = ""
//			])
//		]
		throw new UnsupportedOperationException("EqualityExpression handled by flattener")
	}
	
	def dispatch FlattenedVariable visit(LogicalExpression ex, CompositeSnippet composite) {
//		createCompositeSnippet =>[
//			snippet.add(createStringSnippet => [
//				if (util.parenthesisRequired(ex)) 
//					value = "(" 
//				else 
//					value = ""
//			])
//			snippet.add(ex.operand1.visit)
//			snippet.add(createStringSnippet => [
//				value = ''' '''
//			])
//			snippet.add(createStringSnippet => [
//				value = ex.operator
//			])
//			snippet.add(createStringSnippet => [
//				value = ''' '''
//			])
//			snippet.add(ex.operand2.visit)
//			snippet.add(createStringSnippet => [
//				if (util.parenthesisRequired(ex)) 
//					value = ")" 
//				else 
//					value = ""
//			])
//		]
		throw new UnsupportedOperationException("LogicalExpression handled by flattener")
	}
	
	def dispatch FlattenedVariable visit(ConditionalLogicalExpression ex, CompositeSnippet composite) {
//		createCompositeSnippet =>[
//			snippet.add(createStringSnippet => [
//				if (util.parenthesisRequired(ex)) 
//					value = "(" 
//				else 
//					value = ""
//			])
//			snippet.add(ex.operand1.visit)
//			snippet.add(createStringSnippet => [
//				value = ''' '''
//			])
//			snippet.add(createStringSnippet => [
//				value = ex.operator
//			])
//			snippet.add(createStringSnippet => [
//				value = ''' '''
//			])
//			snippet.add(ex.operand2.visit)
//			snippet.add(createStringSnippet => [
//				if (util.parenthesisRequired(ex)) 
//					value = ")" 
//				else 
//					value = ""
//			])
//		]
		throw new UnsupportedOperationException("Conditional expressions handled by flattener")
	}

	def dispatch FlattenedVariable visit(PrefixExpression ex, CompositeSnippet composite){
		createCompositeSnippet =>[
			snippet.add(createStringSnippet => [
					value = ex.operator.literal
				])
			snippet.add(ex.operand.visit)
		]
	}
	
	def dispatch FlattenedVariable visit(PostfixExpression ex, CompositeSnippet composite){
		createCompositeSnippet =>[
			snippet.add(ex.operand.visit)
			snippet.add(createStringSnippet => [
					value = ex.operator.literal
			])
		]
	}

	
	def dispatch FlattenedVariable visit(ConditionalTestExpression ex, CompositeSnippet composite) {
		createCompositeSnippet =>[
			snippet.add(createStringSnippet => [
					value = '''('''
			])
			snippet.add(ex.operand1.visit)
			snippet.add(createStringSnippet => [
					value = ''') ? ('''
			])
			snippet.add(ex.operand2.visit)
			snippet.add(createStringSnippet => [
					value = ''') : ('''
			])
			snippet.add(ex.operand3.visit)
			snippet.add(createStringSnippet => [
					value = ''')'''
			])
		]
	}

	def dispatch FlattenedVariable visit(NameExpression ex, CompositeSnippet composite){
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
	
	
	def dispatch FlattenedVariable visit(NumericUnaryExpression ex, CompositeSnippet composite){
		createCompositeSnippet =>[
			snippet.add(createStringSnippet => [value = ex.operator.literal])
			snippet.add(ex.operand.visit)
		]
	}
	
	def dispatch FlattenedVariable visit(BitStringUnaryExpression ex, CompositeSnippet composite){
		createCompositeSnippet =>[
			snippet.add(createStringSnippet => [value = ex.operator])
			snippet.add(ex.operand.visit)
		]
	}
	
	def dispatch FlattenedVariable visit(BooleanUnaryExpression ex, CompositeSnippet composite){
		createCompositeSnippet =>[
			snippet.add(createStringSnippet => [value = ex.operator])
			snippet.add(ex.operand.visit)
		]
	}
	
	def dispatch FlattenedVariable visit(NaturalLiteralExpression ex, CompositeSnippet composite) {
	    createStringSnippet => [value = ex.value.replace("_", "")] 
    }
    
	def dispatch FlattenedVariable visit(RealLiteralExpression ex, CompositeSnippet composite) {
	    createStringSnippet => [value = ex.value]
    }
	
	def dispatch FlattenedVariable visit(BooleanLiteralExpression ex, CompositeSnippet composite){
		createStringSnippet => [value = ex.value]
	}
	   
	def dispatch FlattenedVariable visit(StringLiteralExpression ex, CompositeSnippet composite){
		createStringSnippet => [value = ex.value]
	}
	
}