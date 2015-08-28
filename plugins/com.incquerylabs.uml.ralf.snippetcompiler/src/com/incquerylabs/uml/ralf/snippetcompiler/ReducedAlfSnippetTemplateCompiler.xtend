package com.incquerylabs.uml.ralf.snippetcompiler

import com.incquerylabs.emdw.cpp.common.descriptor.factory.IUmlDescriptorFactory
import com.incquerylabs.uml.ralf.api.impl.ParsingResults
import com.incquerylabs.uml.ralf.reducedAlfLanguage.ExpressionList
import com.incquerylabs.uml.ralf.reducedAlfLanguage.LeftHandSide
import com.incquerylabs.uml.ralf.reducedAlfLanguage.NamedExpression
import com.incquerylabs.uml.ralf.reducedAlfLanguage.NamedTuple
import com.incquerylabs.uml.ralf.reducedAlfLanguage.Statement
import com.incquerylabs.uml.ralf.reducedAlfLanguage.Statements
import com.incquerylabs.uml.ralf.scoping.IUMLContextProvider
import snippetTemplate.Snippet
import snippetTemplate.SnippetTemplateFactory

class ReducedAlfSnippetTemplateCompiler {
	
	public extension SnippetTemplateFactory factory = SnippetTemplateFactory.eINSTANCE
	public extension ExpressionVisitor expressionVisitor
	public StatementVisitor statementVisitor
	private SnippetTemplateCompilerUtil util
	
	new(IUmlDescriptorFactory factory, IUMLContextProvider umlcontext){
		util = new SnippetTemplateCompilerUtil(factory, umlcontext)
	}
		
	def Snippet createSnippet(ParsingResults results){
		expressionVisitor = new ExpressionVisitor(util, results.typeSystem)
		statementVisitor = new StatementVisitor(this, util, expressionVisitor)
		results.model.visit
	}
	
    private def dispatch Snippet visit(Statements st){
		createCompositeSnippet => [ f | 
			st.statement.forEach[ statement |
				f.snippet.add(statement.visit)
				f.snippet.add(createStringSnippet => [value = '\n'])
			]
			f.snippet.remove(f.snippet.size-1)
		]
	}
	
	private def dispatch Snippet visit(Statement st){
		statementVisitor.visit(st)
	}
	
	private def dispatch Snippet visit(ExpressionList tuple){
		throw new UnsupportedOperationException("Tuples should not be visited independently")
	}
	
	private def dispatch Snippet visit(NamedTuple tuple){
		throw new UnsupportedOperationException("Tuples should not be visited independently")
	}
	
	private def dispatch Snippet visit(LeftHandSide lhs){
		throw new UnsupportedOperationException("LeftHandSide should not be visited independently")
	}
	
	private def dispatch Snippet visit(NamedExpression ex){
		throw new UnsupportedOperationException("NamedExpression should not be visited independently")
	}
	
			
}