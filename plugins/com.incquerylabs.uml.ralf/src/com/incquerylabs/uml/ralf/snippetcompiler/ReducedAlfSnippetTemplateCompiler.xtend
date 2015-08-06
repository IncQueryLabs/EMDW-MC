package com.incquerylabs.uml.ralf.snippetcompiler

import com.incquerylabs.emdw.cpp.common.descriptor.factory.IUmlDescriptorFactory
import com.incquerylabs.emdw.cpp.common.modelaccess.IModelAccess
import com.incquerylabs.uml.ralf.reducedAlfLanguage.ConcurrentClauses
import com.incquerylabs.uml.ralf.reducedAlfLanguage.Expression
import com.incquerylabs.uml.ralf.reducedAlfLanguage.ExpressionList
import com.incquerylabs.uml.ralf.reducedAlfLanguage.FeatureLeftHandSide
import com.incquerylabs.uml.ralf.reducedAlfLanguage.NameLeftHandSide
import com.incquerylabs.uml.ralf.reducedAlfLanguage.NamedExpression
import com.incquerylabs.uml.ralf.reducedAlfLanguage.NamedTuple
import com.incquerylabs.uml.ralf.reducedAlfLanguage.NonFinalClause
import com.incquerylabs.uml.ralf.reducedAlfLanguage.Statement
import com.incquerylabs.uml.ralf.reducedAlfLanguage.Statements
import com.incquerylabs.uml.ralf.reducedAlfLanguage.SwitchClause
import org.eclipse.emf.ecore.EObject
import snippetTemplate.Snippet
import snippetTemplate.SnippetTemplateFactory

class ReducedAlfSnippetTemplateCompiler {
	
	extension SnippetTemplateFactory factory = SnippetTemplateFactory.eINSTANCE
		
	public SnippetTemplateCompilerUtil util
	public ExpressionVisitor expressionVisitor
	public StatementVisitor statementVisitor
	
	new(IUmlDescriptorFactory factory, IModelAccess modelAccess){
		util = new SnippetTemplateCompilerUtil(factory, modelAccess)
		statementVisitor = new StatementVisitor(this)
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
	
	def dispatch Snippet visit(NamedExpression ex){
		createCompositeSnippet =>[
			snippet.add(createStringSnippet => [
					value = ex.name
			])
			snippet.add(createStringSnippet => [value = ''' => '''])
			snippet.add(ex.expression.visit)
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