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
import com.incquerylabs.uml.ralf.reducedAlfLanguage.SequenceAccessExpression
import com.incquerylabs.uml.ralf.reducedAlfLanguage.ShiftExpression
import com.incquerylabs.uml.ralf.reducedAlfLanguage.StaticFeatureInvocationExpression
import com.incquerylabs.uml.ralf.reducedAlfLanguage.StringLiteralExpression
import com.incquerylabs.uml.ralf.reducedAlfLanguage.SuperInvocationExpression
import com.incquerylabs.uml.ralf.reducedAlfLanguage.ThisExpression
import com.incquerylabs.uml.ralf.reducedAlfLanguage.Tuple
import com.incquerylabs.uml.ralf.reducedAlfLanguage.Variable
import org.eclipse.uml2.uml.Operation
import org.eclipse.uml2.uml.Property
import snippetTemplate.Snippet
import snippetTemplate.SnippetTemplateFactory
import org.eclipse.uml2.uml.Parameter

class ExpressionVisitor {
	extension SnippetTemplateFactory factory = SnippetTemplateFactory.eINSTANCE
	extension ReducedAlfSnippetTemplateCompiler compiler
	extension SnippetTemplateCompilerUtil util
	
	new(ReducedAlfSnippetTemplateCompiler compiler){
		this.compiler = compiler
		util = compiler.util
	}
	
	def dispatch Snippet visit(SequenceAccessExpression ex){
		createCompositeSnippet =>[
			snippet.add(ex.primary.visit)
			snippet.add(ex?.index.visit)
		]
	}
	
	def dispatch Snippet visit(CastExpression ex){
		val descriptor = getDescriptor(ex)
		createCompositeSnippet =>[
			snippet.add(createStringSnippet => [value = '''('''])
			snippet.add(createStringSnippet => [value = descriptor.fullType])
			snippet.add(createStringSnippet => [value = ''') '''])
			snippet.add(ex.operand.visit)
		]
	}
	
	def dispatch Snippet visit(NullExpression ex){
		createCompositeSnippet =>[
			snippet.add(createStringSnippet => [value = '''0'''])
		]
	}
	
	def dispatch Snippet visit(InstanceCreationExpression ex){
		createCompositeSnippet =>[
			snippet.add(createStringSnippet => [value = '''new '''])
			snippet.add(createStringSnippet => [value = ex.instance.qualifiedName])
			snippet.add(ex.parameters.visit)
		]
	}
	

	def dispatch Snippet visit(ThisExpression ex){
		val descriptor = getDescriptor(ex)
		createStringSnippet => [value = descriptor.stringRepresentation]
	}
	
	def dispatch Snippet visit(StaticFeatureInvocationExpression ex){
		throw new UnsupportedOperationException("Static calls not supported yet")
	}
	
	def dispatch Snippet visit(SuperInvocationExpression ex){
		throw new UnsupportedOperationException("Super invocations not supported yet")
	}
	
	def dispatch Snippet visit(LinkOperationExpression ex){
		createCompositeSnippet =>[
			snippet.add(createStringSnippet => [value = ex.association.reference.name])
			snippet.add(createStringSnippet => [value = '''->'''])
			snippet.add(createStringSnippet => [value = ex.linkOperation.getName()])
			snippet.add(ex.parameters.visit)
		]
	}
	
	def dispatch Snippet visit(AssociationAccessExpression ex){
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
	
	def dispatch Snippet visit(FeatureInvocationExpression ex){
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
	
	
	def dispatch Snippet visit(AssignmentExpression ex){
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

	def dispatch Snippet visit(ArithmeticExpression ex) {
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
	
	def dispatch Snippet visit(ShiftExpression ex) {
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
				value = ex.operator.literal
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
	
	def dispatch Snippet visit(RelationalExpression ex) {
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
				value = ex.operator.literal
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
	
	def dispatch Snippet visit(EqualityExpression ex) {
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
				value = ex.operator.literal
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
	
	def dispatch Snippet visit(LogicalExpression ex) {
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
	
	def dispatch Snippet visit(ConditionalLogicalExpression ex) {
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

	def dispatch Snippet visit(PrefixExpression ex){
		createCompositeSnippet =>[
			snippet.add(createStringSnippet => [
					value = ex.operator.literal
				])
			snippet.add(ex.operand.visit)
		]
	}
	
	def dispatch Snippet visit(PostfixExpression ex){
		createCompositeSnippet =>[
			snippet.add(ex.operand.visit)
			snippet.add(createStringSnippet => [
					value = ex.operator.literal
			])
		]
	}

	
	def dispatch Snippet visit(ConditionalTestExpression ex) {
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

	def dispatch Snippet visit(NameExpression ex){
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
	
	
	def dispatch Snippet visit(NumericUnaryExpression ex){
		createCompositeSnippet =>[
			snippet.add(createStringSnippet => [value = ex.operator.literal])
			snippet.add(ex.operand.visit)
		]
	}
	
	def dispatch Snippet visit(BitStringUnaryExpression ex){
		createCompositeSnippet =>[
			snippet.add(createStringSnippet => [value = ex.operator])
			snippet.add(ex.operand.visit)
		]
	}
	
	def dispatch Snippet visit(BooleanUnaryExpression ex){
		createCompositeSnippet =>[
			snippet.add(createStringSnippet => [value = ex.operator])
			snippet.add(ex.operand.visit)
		]
	}
	
	def dispatch Snippet visit(NaturalLiteralExpression ex) {
	    createStringSnippet => [value = ex.value.replace("_", "")] 
    }
    
	def dispatch Snippet visit(RealLiteralExpression ex) {
	    createStringSnippet => [value = ex.value]
    }
	
	def dispatch Snippet visit(BooleanLiteralExpression ex){
		createStringSnippet => [value = ex.value]
	}
	   
	def dispatch Snippet visit(StringLiteralExpression ex){
		createStringSnippet => [value = ex.value]
	}
	
}