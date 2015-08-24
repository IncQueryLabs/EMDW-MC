package com.incquerylabs.uml.ralf.snippetcompiler

import com.incquerylabs.emdw.cpp.common.descriptor.factory.IUmlDescriptorFactory
import com.incquerylabs.uml.ralf.reducedAlfLanguage.Expression
import com.incquerylabs.uml.ralf.reducedAlfLanguage.ExpressionList
import com.incquerylabs.uml.ralf.reducedAlfLanguage.NamedExpression
import com.incquerylabs.uml.ralf.reducedAlfLanguage.NamedTuple
import com.incquerylabs.uml.ralf.reducedAlfLanguage.Statement
import com.incquerylabs.uml.ralf.reducedAlfLanguage.Statements
import com.incquerylabs.uml.ralf.reducedAlfLanguage.SwitchClause
import com.incquerylabs.uml.ralf.scoping.IUMLContextProvider
import org.eclipse.emf.ecore.EObject
import snippetTemplate.Snippet
import snippetTemplate.SnippetTemplateFactory
import com.incquerylabs.uml.ralf.reducedAlfLanguage.IfClause
import com.incquerylabs.uml.ralf.reducedAlfLanguage.LeftHandSide

class ReducedAlfSnippetTemplateCompiler {
	
	public extension SnippetTemplateFactory factory = SnippetTemplateFactory.eINSTANCE
	public extension ReducedAlfFlattener flattener
		
	public SnippetTemplateCompilerUtil util
	public ExpressionVisitor expressionVisitor
	public StatementVisitor statementVisitor
	
	IUMLContextProvider context
		
	new(IUmlDescriptorFactory factory, IUMLContextProvider umlcontext){
		util = new SnippetTemplateCompilerUtil(factory, umlcontext)
		context = umlcontext
		flattener = new ReducedAlfFlattener(util)
		statementVisitor = new StatementVisitor(this, flattener)
		expressionVisitor = new ExpressionVisitor(this)
	}

	def dispatch Snippet visit(EObject o) {
		val fragment = createCompositeSnippet
		o.eContents.forEach[fragment.snippet.add(visit)]
		return fragment
	}

    def dispatch Snippet visit(Statements st){
		createCompositeSnippet => [ f | 
			st.statement.forEach[
				f.snippet.add(visit)
				f.snippet.add(createStringSnippet => [value = '\n'])
			]
			f.snippet.remove(f.snippet.size-1)
		]
	}
	
	def dispatch Snippet visit(Statement st){
		statementVisitor.visit(st)
	}
	
	def dispatch Snippet visit(Expression ex){
		expressionVisitor.visit(ex)
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
	
//	def dispatch Snippet visit(NameLeftHandSide lhs){
//		createCompositeSnippet =>[
//			snippet.add(lhs.expression.visit)
//			if(lhs.index != null){
//				snippet.add(createStringSnippet => [
//					value = '''['''
//				])
//				snippet.add(lhs.index.visit)
//				snippet.add(createStringSnippet => [
//					value = ''']'''
//				])
//			}
//		]
//	}
	
	def dispatch Snippet visit(LeftHandSide lhs){
		createCompositeSnippet =>[
			snippet.add(lhs.expression.visit)
		]
	}
	
	def dispatch Snippet visit(NamedExpression ex){
		createCompositeSnippet =>[
			snippet.add(createStringSnippet => [
					value = ex.name
			])
			snippet.add(createStringSnippet => [value = ''' => '''])
			if(ex.expression.flatteningNotNeeded){
				snippet.add(ex.expression.visit)
			}else{
				if(ex.expression.flatteningSupported){			
					val variable = flatten(ex.expression, it)
					snippet.add(createStringSnippet => [value = variable.descriptor.stringRepresentation])
				}else{
					throw new UnsupportedOperationException("Not supported expression type: "+ex.expression.eClass.name)
				}
			}
		]
	}
	
	def dispatch Snippet visit(IfClause nfc){
		createCompositeSnippet =>[
			snippet.add(createStringSnippet => [value = '''('''])
			snippet.add(nfc.condition.visit)
			snippet.add(createStringSnippet => [value = ''') '''])
			snippet.add(nfc.body.visit)
		]
	} 
	
	def dispatch Snippet visit(SwitchClause st){
		createCompositeSnippet => [ f |
			f.snippet.add = createStringSnippet => [value = '''case ''']
			st.^case.forEach[
    			f.snippet.add(visit)
    		]
    		f.snippet.add = createStringSnippet => [value = ''' : ''']
    		f.snippet.add(st.block.visit)	
		]
	}
		
}