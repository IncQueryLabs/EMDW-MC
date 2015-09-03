package com.incquerylabs.uml.ralf.snippetcompiler

import com.incquerylabs.emdw.cpp.common.descriptor.factory.IUmlDescriptorFactory
import com.incquerylabs.emdw.snippettemplate.Snippet
import com.incquerylabs.emdw.snippettemplate.SnippetTemplateFactory
import com.incquerylabs.uml.ralf.api.impl.ParsingResults
import com.incquerylabs.uml.ralf.reducedAlfLanguage.ExpressionList
import com.incquerylabs.uml.ralf.reducedAlfLanguage.LeftHandSide
import com.incquerylabs.uml.ralf.reducedAlfLanguage.NamedExpression
import com.incquerylabs.uml.ralf.reducedAlfLanguage.NamedTuple
import com.incquerylabs.uml.ralf.reducedAlfLanguage.Statement
import com.incquerylabs.uml.ralf.reducedAlfLanguage.Statements
import com.incquerylabs.uml.ralf.scoping.IUMLContextProvider

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
		statementVisitor = new StatementVisitor(this, util, expressionVisitor, results.typeSystem)
		createStringSnippet => [value = results.model.visit]
	}
	
    private def dispatch String visit(Statements st){
		'''«FOR statement : st.statement SEPARATOR '\n'»«statement.visit»«ENDFOR»'''
	}
	
	private def dispatch String visit(Statement st){
		statementVisitor.visit(st)
	}
	
	private def dispatch String visit(ExpressionList tuple){
		throw new UnsupportedOperationException("Tuples should not be visited independently")
	}
	
	private def dispatch String visit(NamedTuple tuple){
		throw new UnsupportedOperationException("Tuples should not be visited independently")
	}
	
	private def dispatch String visit(LeftHandSide lhs){
		throw new UnsupportedOperationException("LeftHandSide should not be visited independently")
	}
	
	private def dispatch String visit(NamedExpression ex){
		throw new UnsupportedOperationException("NamedExpression should not be visited independently")
	}
	
			
}