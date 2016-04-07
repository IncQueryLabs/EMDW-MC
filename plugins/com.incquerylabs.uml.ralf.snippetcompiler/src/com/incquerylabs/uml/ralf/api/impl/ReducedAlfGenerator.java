/*******************************************************************************
 * Copyright (c) 2015-2016 IncQuery Labs Ltd. and Ericsson AB
 * All rights reserved. This program and the accompanying materials
 * are made available under the terms of the Eclipse Public License v1.0
 * which accompanies this distribution, and is available at
 * http://www.eclipse.org/legal/epl-v10.html
 *
 * Contributors:
 *     Akos Horvath, Abel Hegedus, Zoltan Ujhelyi, Daniel Segesdi, Tamas Borbas, Robert Doczi, Peter Lunk - initial API and implementation
 *******************************************************************************/
package com.incquerylabs.uml.ralf.api.impl;

import org.eclipse.uml2.uml.OpaqueBehavior;

import com.incquerylabs.emdw.snippettemplate.Snippet;
import com.incquerylabs.uml.ralf.api.IReducedAlfGenerator;
import com.incquerylabs.uml.ralf.api.IReducedAlfParser;
import com.incquerylabs.uml.ralf.scoping.IUMLContextProvider;
import com.incquerylabs.uml.ralf.snippetcompiler.ReducedAlfSnippetTemplateCompiler;

public class ReducedAlfGenerator implements IReducedAlfGenerator {

	@Override
	public Snippet createSnippet(OpaqueBehavior behavior, IUMLContextProvider contextProvider, IReducedAlfParser parser, ReducedAlfSnippetTemplateCompiler templateCompiler) throws SnippetCompilerException {
		ParsingResults result = parser.parse(behavior);
		return createSnippet(result, contextProvider, templateCompiler);
	}

	@Override
	public Snippet createSnippet(String behavior, IUMLContextProvider contextProvider, IReducedAlfParser parser, ReducedAlfSnippetTemplateCompiler templateCompiler) throws SnippetCompilerException {
		ParsingResults result = parser.parse(behavior, contextProvider);
		return createSnippet(result, contextProvider, templateCompiler);
	}

	@Override
	public Snippet createSnippet(ParsingResults result, IUMLContextProvider contextProvider, ReducedAlfSnippetTemplateCompiler templateCompiler) throws SnippetCompilerException {
		if (result.validationOK()) {
			return templateCompiler.createSnippet(result, contextProvider);
		} else {
			throw new SnippetCompilerException("Validation: " + result.toString());
		}

	}
}
