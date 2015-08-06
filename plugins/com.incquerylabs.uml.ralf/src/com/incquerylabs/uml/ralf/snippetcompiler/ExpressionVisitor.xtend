package com.incquerylabs.uml.ralf.snippetcompiler

import com.incquerylabs.emdw.cpp.common.descriptor.factory.IUmlDescriptorFactory
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
import com.incquerylabs.uml.ralf.reducedAlfLanguage.PropertyAccessExpression
import com.incquerylabs.uml.ralf.reducedAlfLanguage.RealLiteralExpression
import com.incquerylabs.uml.ralf.reducedAlfLanguage.RelationalExpression
import com.incquerylabs.uml.ralf.reducedAlfLanguage.SequenceAccessExpression
import com.incquerylabs.uml.ralf.reducedAlfLanguage.ShiftExpression
import com.incquerylabs.uml.ralf.reducedAlfLanguage.StringLiteralExpression
import com.incquerylabs.uml.ralf.reducedAlfLanguage.ThisExpression
import com.incquerylabs.uml.ralf.reducedAlfLanguage.UnboundedLiteralExpression
import com.incquerylabs.uml.ralf.reducedAlfLanguage.Variable
import snippetTemplate.Snippet
import snippetTemplate.SnippetTemplateFactory

class ExpressionVisitor {
	extension SnippetTemplateFactory factory = SnippetTemplateFactory.eINSTANCE
	extension ReducedAlfSnippetTemplateCompiler compiler
	extension IUmlDescriptorFactory descriptorFactory
	
	new(ReducedAlfSnippetTemplateCompiler compiler){
		this.compiler = compiler
		descriptorFactory = compiler.util.descriptorFactory
	}
	
	def dispatch Snippet visit(SequenceAccessExpression ex){
		createCompositeSnippet =>[
			snippet.add(ex.primary.visit)
			snippet.add(ex?.index.visit)
		]
	}
	
	def dispatch Snippet visit(CastExpression ex){
		val descriptor = (createSingleValueDescriptorBuilder => [
			type = ex.type.type
		]).build
		createCompositeSnippet =>[
			snippet.add(createStringSnippet => [value = '''('''])
			snippet.add(createStringSnippet => [value = descriptor.valueType])
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
			snippet.add(ex.tuple.visit)
		]
	}
	

	def dispatch Snippet visit(ThisExpression ex){
		createStringSnippet => [value = '''this''']
	}
	
	def dispatch Snippet visit(LinkOperationExpression ex){
		createCompositeSnippet =>[
			snippet.add(createStringSnippet => [value = ex.association.name])
			snippet.add(createStringSnippet => [value = '''.'''])
			snippet.add(createStringSnippet => [value = ex.operation.getName()])
			snippet.add(ex.tuple.visit)
		]
	}
	
	def dispatch Snippet visit(PropertyAccessExpression ex){
		createCompositeSnippet =>[
			snippet.add(ex.context.visit)
			snippet.add(createStringSnippet => [value = '''.'''	])
			snippet.add(createStringSnippet => [value = ex.property.name])
		]
	}
	
	def dispatch Snippet visit(AssociationAccessExpression ex){
		createCompositeSnippet =>[
			snippet.add(ex.context.visit)
			snippet.add(createStringSnippet => [value = '''->'''])
			snippet.add(createStringSnippet => [value = ex.association.name])
		]
	}
	
	def dispatch Snippet visit(FeatureInvocationExpression ex){
		//val descriptor = util.getDescriptor(ex)
//		if(descriptor instanceof SingleValueDescriptor){
//			return createCompositeSnippet =>[
//			snippet.add(ex.context.visit)
//			snippet.add(createStringSnippet => [
//				value = '''.'''
//			])
//			snippet.add(createStringSnippet => [value = ex.operation.name])
//			snippet.add(ex.parameters.visit)
//			]
//			
//		}
//		
//		if(descriptor instanceof CollectionValueDescriptor){
//			descriptor.name
//		}
		createCompositeSnippet =>[
			snippet.add(ex.context.visit)
			snippet.add(createStringSnippet => [
				value = '''.'''
			])
			snippet.add(createStringSnippet => [value = ex.operation.name])
			snippet.add(ex.parameters.visit)
		]
	}
	
	
	def dispatch Snippet visit(AssignmentExpression ex){
		createCompositeSnippet =>[
			snippet.add(ex.leftHandSide.visit)
			snippet.add(createStringSnippet => [value = ''' '''	])
			snippet.add(createStringSnippet => [value = ex.operator.literal])
			snippet.add(createStringSnippet => [value = ''' '''	])
			snippet.add(ex.rightHandSide.visit)
		]
		//TODO different assignment operators might require different solutions
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
		val variable = ex.reference as Variable
		if(variable != null){
			val descriptor = (descriptorFactory.createSingleValueDescriptorBuilder => [
				name = variable.name
				type = variable.type.type
			]).build
			createStringSnippet => [
				value = descriptor.stringRepresentation
			]
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
	
	def dispatch Snippet visit(UnboundedLiteralExpression ex){
		createStringSnippet => [value = ex.value]
	}
}