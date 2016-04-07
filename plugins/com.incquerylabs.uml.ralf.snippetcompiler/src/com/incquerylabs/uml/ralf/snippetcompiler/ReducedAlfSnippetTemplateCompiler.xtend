/*******************************************************************************
 * Copyright (c) 2015-2016, IncQuery Labs Ltd. and Ericsson AB
 * All rights reserved. This program and the accompanying materials
 * are made available under the terms of the Eclipse Public License v1.0
 * which accompanies this distribution, and is available at
 * http://www.eclipse.org/legal/epl-v10.html
 *
 * Contributors:
 *   Akos Horvath, Abel Hegedus, Zoltan Ujhelyi, Daniel Segesdi, Tamas Borbas, Robert Doczi, Peter Lunk - initial API and implementation
 *******************************************************************************/
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
import org.apache.log4j.Logger

class ReducedAlfSnippetTemplateCompiler {

	public extension SnippetTemplateFactory factory = SnippetTemplateFactory.eINSTANCE
	public extension ExpressionVisitor expressionVisitor
	extension LoggerUtil loggerutil = new LoggerUtil
	extension Logger logger = Logger.getLogger(class)
	public StatementVisitor statementVisitor
	public IUmlDescriptorFactory umlFactory

	new(IUmlDescriptorFactory factory) {
		umlFactory = factory
	}

	def Snippet createSnippet(ParsingResults results, IUMLContextProvider umlcontext) {
		logger.logVisitingStarted(results.model)
		val util = new SnippetTemplateCompilerUtil(umlFactory, umlcontext, results.typeSystem)
		expressionVisitor = new ExpressionVisitor(util, results.typeSystem)
		statementVisitor = new StatementVisitor(this, util, expressionVisitor, results.typeSystem)
		val retval = createStringSnippet => [value = results.model.visit]
		logger.logVisitingFinished(results.model)
		return retval
	}

	private def dispatch String visit(Statements st) {
		'''«FOR statement : st.statement SEPARATOR '\n'»«statement.visit»«ENDFOR»'''
	}

	private def dispatch String visit(Statement st) {
		statementVisitor.visit(st)
	}

	private def dispatch String visit(ExpressionList tuple) {
		throw new UnsupportedOperationException("Tuples should not be visited independently")
	}

	private def dispatch String visit(NamedTuple tuple) {
		throw new UnsupportedOperationException("Tuples should not be visited independently")
	}

	private def dispatch String visit(LeftHandSide lhs) {
		throw new UnsupportedOperationException("LeftHandSide should not be visited independently")
	}

	private def dispatch String visit(NamedExpression ex) {
		throw new UnsupportedOperationException("NamedExpression should not be visited independently")
	}

}