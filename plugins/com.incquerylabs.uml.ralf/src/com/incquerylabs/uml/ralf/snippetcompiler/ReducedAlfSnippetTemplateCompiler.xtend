package com.incquerylabs.uml.ralf.snippetcompiler

import com.incquerylabs.uml.ralf.reducedAlfLanguage.ArithmeticExpression
import com.incquerylabs.uml.ralf.reducedAlfLanguage.AssignmentExpression
import com.incquerylabs.uml.ralf.reducedAlfLanguage.AssociationAccessExpression
import com.incquerylabs.uml.ralf.reducedAlfLanguage.Block
import com.incquerylabs.uml.ralf.reducedAlfLanguage.BooleanLiteralExpression
import com.incquerylabs.uml.ralf.reducedAlfLanguage.BooleanUnaryExpression
import com.incquerylabs.uml.ralf.reducedAlfLanguage.BreakStatement
import com.incquerylabs.uml.ralf.reducedAlfLanguage.ConcurrentClauses
import com.incquerylabs.uml.ralf.reducedAlfLanguage.ConditionalLogicalExpression
import com.incquerylabs.uml.ralf.reducedAlfLanguage.ConditionalTestExpression
import com.incquerylabs.uml.ralf.reducedAlfLanguage.EmptyStatement
import com.incquerylabs.uml.ralf.reducedAlfLanguage.EqualityExpression
import com.incquerylabs.uml.ralf.reducedAlfLanguage.Expression
import com.incquerylabs.uml.ralf.reducedAlfLanguage.ExpressionStatement
import com.incquerylabs.uml.ralf.reducedAlfLanguage.FeatureInvocationExpression
import com.incquerylabs.uml.ralf.reducedAlfLanguage.FeatureLeftHandSide
import com.incquerylabs.uml.ralf.reducedAlfLanguage.IfStatement
import com.incquerylabs.uml.ralf.reducedAlfLanguage.InstanceCreationExpression
import com.incquerylabs.uml.ralf.reducedAlfLanguage.LinkOperationExpression
import com.incquerylabs.uml.ralf.reducedAlfLanguage.LocalNameDeclarationStatement
import com.incquerylabs.uml.ralf.reducedAlfLanguage.LogicalExpression
import com.incquerylabs.uml.ralf.reducedAlfLanguage.NameExpression
import com.incquerylabs.uml.ralf.reducedAlfLanguage.NameLeftHandSide
import com.incquerylabs.uml.ralf.reducedAlfLanguage.NamedExpression
import com.incquerylabs.uml.ralf.reducedAlfLanguage.NamedTuple
import com.incquerylabs.uml.ralf.reducedAlfLanguage.NaturalLiteralExpression
import com.incquerylabs.uml.ralf.reducedAlfLanguage.NonFinalClause
import com.incquerylabs.uml.ralf.reducedAlfLanguage.NumericUnaryExpression
import com.incquerylabs.uml.ralf.reducedAlfLanguage.PostfixExpression
import com.incquerylabs.uml.ralf.reducedAlfLanguage.PrefixExpression
import com.incquerylabs.uml.ralf.reducedAlfLanguage.PropertyAccessExpression
import com.incquerylabs.uml.ralf.reducedAlfLanguage.RealLiteralExpression
import com.incquerylabs.uml.ralf.reducedAlfLanguage.RelationalExpression
import com.incquerylabs.uml.ralf.reducedAlfLanguage.ReturnStatement
import com.incquerylabs.uml.ralf.reducedAlfLanguage.SendSignalStatement
import com.incquerylabs.uml.ralf.reducedAlfLanguage.ShiftExpression
import com.incquerylabs.uml.ralf.reducedAlfLanguage.Statements
import com.incquerylabs.uml.ralf.reducedAlfLanguage.StringLiteralExpression
import com.incquerylabs.uml.ralf.reducedAlfLanguage.ThisExpression
import com.incquerylabs.uml.ralf.reducedAlfLanguage.UnboundedLiteralExpression
import org.eclipse.emf.ecore.EObject
import snippetTemplate.Snippet
import snippetTemplate.SnippetTemplateFactory
import com.incquerylabs.uml.ralf.reducedAlfLanguage.ExpressionList

class ReducedAlfSnippetTemplateCompiler {
	extension SnippetTemplateFactory factory = SnippetTemplateFactory.eINSTANCE

	def dispatch Snippet visit(EObject o) {
		val fragment = createCompositeSnippet
		o.eContents.forEach[fragment.snippet.add(visit)]
		return fragment
	}
		
	//Statements
    def dispatch Snippet visit(Statements st){
		createCompositeSnippet => [ f | 
			st.statement.forEach[
				f.snippet.add(visit)
				f.snippet.add(createStringSnippet => [value = '\n'])
			]
			f.snippet.remove(f.snippet.size-1)
		]
	}
    
    def dispatch Snippet visit(EmptyStatement st){
		createStringSnippet => [value = ''';''']
	}
	
	def dispatch Snippet visit(ExpressionStatement st){
		createCompositeSnippet => [
			snippet.add(st.expression.visit)
			snippet.add(createStringSnippet => [value = ''';'''	])
		]
	} 
	
	def dispatch Snippet visit(Block block){
		createCompositeSnippet => [ f | 
				f.snippet.add = createStringSnippet => [value = '''{''']
				f.snippet.add = createStringSnippet => [value = '\n']
				f.snippet.add = createStringSnippet => [value = '\t']
				block.statement.forEach[
    				f.snippet.add(visit)
    				f.snippet.add(createStringSnippet => [value = '\n'])
    			]
    			f.snippet.remove(f.snippet.size-1)
    			f.snippet.add(createStringSnippet => [value = '\n'])
				f.snippet.add = createStringSnippet => [value = '''}''']
		]
	} 
	
	def dispatch Snippet visit(BreakStatement st){
		createStringSnippet => [value = '''break;''']
	} 
	
	def dispatch Snippet visit(ReturnStatement st){
		createCompositeSnippet =>[
			snippet.add(createStringSnippet => [value = '''return '''])
			snippet.add(st.expression.visit)
			snippet.add(createStringSnippet => [value = ''';'''])
		]
	} 
	
	def dispatch Snippet visit(LocalNameDeclarationStatement st){
		createCompositeSnippet =>[
			snippet.add(createStringSnippet => [value = st.variable.type.type.qualifiedName])
			snippet.add(createStringSnippet => [value = ''' '''])
			snippet.add(createStringSnippet => [value = st.variable.name])
			snippet.add(createStringSnippet => [value = ''' = '''])
			snippet.add(st.expression.visit)
			snippet.add(createStringSnippet => [value = ''';'''])
		]
	}
	
	def dispatch Snippet visit(IfStatement st){
		createCompositeSnippet => [ f | 
				st.nonFinalClauses.forEach[ clause |
					if(st.nonFinalClauses.indexOf(clause) == 0){
						f.snippet.add(createStringSnippet => [value = '''if '''])
						f.snippet.add(clause.visit)
					}else {
						f.snippet.add(createStringSnippet => [value = '''else if '''])
						f.snippet.add(clause.visit)
					}
    				f.snippet.add(createStringSnippet => [value = '\n'])
    			]
    			f.snippet.remove(f.snippet.size-1)
    			if(st.finalClause != null){
    				f.snippet.add(createStringSnippet => [value = ''' else '''])
    				f.snippet.add(st.finalClause.visit)	
    			}
		]
	}
	
	def dispatch Snippet visit(ConcurrentClauses cc){
		createCompositeSnippet => [ f | 
				cc.clause.forEach[
    				f.snippet.add(visit)
    				f.snippet.add(createStringSnippet => [value = '\n'])
    			]
    			f.snippet.remove(f.snippet.size-1)
		]
	}
	
	def dispatch Snippet visit(NonFinalClause nfc){
		createCompositeSnippet =>[
			snippet.add(createStringSnippet => [value = '''('''])
			snippet.add(nfc.condition.visit)
			snippet.add(createStringSnippet => [value = ''') '''])
			snippet.add(nfc.body.visit)
		]
	}  	
	
	def dispatch Snippet visit(SendSignalStatement st){
		createCompositeSnippet =>[
			snippet.add(st.target.visit)
			snippet.add(createStringSnippet => [value = '''->generate_event('''])
			snippet.add(st.signal.visit)
			snippet.add(createStringSnippet => [value = ''');'''])
		]
	}
		
	//Expressions
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
		createCompositeSnippet =>[
			snippet.add(ex.context.visit)
			snippet.add(createStringSnippet => [
				value = '''.'''
			])
			snippet.add(createStringSnippet => [value = ex.operation.name])
			snippet.add(ex.parameters.visit)
		]
	}
	
	def dispatch Snippet visit(ExpressionList tuple){
		createCompositeSnippet => [ f | 
			f.snippet.add = createStringSnippet => [value = '''(''']
			if(tuple.expressions!= null && !tuple.expressions.isEmpty){
				tuple.expressions.forEach[
					f.snippet.add(visit)
					f.snippet.add(createStringSnippet => [value = ''', '''])
				]
				f.snippet.remove(f.snippet.size-1)
			}
			f.snippet.add = createStringSnippet => [value = ''')''']
		]
	}
	
	def dispatch Snippet visit(NamedTuple tuple){
		createCompositeSnippet => [ f | 
				f.snippet.add = createStringSnippet => [value = '''(''']
				if(tuple.expressions!= null && !tuple.expressions.isEmpty){
					tuple.expressions.forEach[
						f.snippet.add(visit)
						f.snippet.add(createStringSnippet => [value = ''', '''])
	    			]
	    			f.snippet.remove(f.snippet.size-1)
    			}
				f.snippet.add = createStringSnippet => [value = ''')''']
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
				if (ex.parenthesisRequired) 
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
				if (ex.parenthesisRequired) 
					value = ")" 
				else 
					value = ""
			])
		]
	}
	
	def dispatch Snippet visit(ShiftExpression ex) {
	    createCompositeSnippet =>[
			snippet.add(createStringSnippet => [
				if (ex.parenthesisRequired) 
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
				if (ex.parenthesisRequired) 
					value = ")" 
				else 
					value = ""
			])
		]
	}
	
	def dispatch Snippet visit(RelationalExpression ex) {
		createCompositeSnippet =>[
			snippet.add(createStringSnippet => [
				if (ex.parenthesisRequired) 
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
				if (ex.parenthesisRequired) 
					value = ")" 
				else 
					value = ""
			])
		]
	}
	
	def dispatch Snippet visit(EqualityExpression ex) {
		createCompositeSnippet =>[
			snippet.add(createStringSnippet => [
				if (ex.parenthesisRequired) 
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
				if (ex.parenthesisRequired) 
					value = ")" 
				else 
					value = ""
			])
		]
	}
	
	def dispatch Snippet visit(LogicalExpression ex) {
		createCompositeSnippet =>[
			snippet.add(createStringSnippet => [
				if (ex.parenthesisRequired) 
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
				if (ex.parenthesisRequired) 
					value = ")" 
				else 
					value = ""
			])
		]
	}
	
	def dispatch Snippet visit(ConditionalLogicalExpression ex) {
		createCompositeSnippet =>[
			snippet.add(createStringSnippet => [
				if (ex.parenthesisRequired) 
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
				if (ex.parenthesisRequired) 
					value = ")" 
				else 
					value = ""
			])
		]
	}

		
	def dispatch Snippet visit(NameLeftHandSide lhs){
		createCompositeSnippet =>[
			snippet.add(lhs.expression.visit)
			if(lhs.index != null){
				snippet.add(createStringSnippet => [
					value = '''['''
				])
				snippet.add(lhs.index.visit)
				snippet.add(createStringSnippet => [
					value = ''']'''
				])
			}
		]
	}
	
	def dispatch Snippet visit(FeatureLeftHandSide lhs){
		createCompositeSnippet =>[
			snippet.add(lhs.expression.visit)
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
		createStringSnippet => [
			value = ex.reference.name
		]
	}
	
	def dispatch Snippet visit(NamedExpression ex){
		createCompositeSnippet =>[
			snippet.add(createStringSnippet => [
					value = ex.name
			])
			snippet.add(createStringSnippet => [value = ''' => '''])
			snippet.add(ex.expression.visit)
		]
	}
	
	def dispatch Snippet visit(NumericUnaryExpression ex){
		createCompositeSnippet =>[
			snippet.add(createStringSnippet => [value = ex.operator.literal])
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
	
	// Parentheses
	
	private def dispatch parenthesisRequired(Expression ex) {
        return false
	}
	
	private def dispatch parenthesisRequired(ArithmeticExpression ex) {
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
	
	private def dispatch parenthesisRequired(ShiftExpression ex) {
	    if (ex.eContainer instanceof NumericUnaryExpression) {
            return true
        }
	    if (ex.eContainer instanceof ArithmeticExpression) {
	    	return true
        }
        return false
	}
	
	private def dispatch parenthesisRequired(RelationalExpression ex) {
	    if (ex.eContainer instanceof BooleanUnaryExpression) {
            return true
        }
        if(ex.eContainer instanceof ConditionalLogicalExpression){
        	return true
        }
        return false
	}
	
	private def dispatch parenthesisRequired(EqualityExpression ex) {
	    if (ex.eContainer instanceof BooleanUnaryExpression) {
            return true
        }
        return false
	}
	
	private def dispatch parenthesisRequired(LogicalExpression ex) {
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
	
	private def dispatch parenthesisRequired(ConditionalLogicalExpression ex) {
	    if (ex.eContainer instanceof BooleanUnaryExpression) {
            return true
        }
        if (ex.eContainer instanceof EqualityExpression) {
	    	return true
        }
        return false
	}
			
}