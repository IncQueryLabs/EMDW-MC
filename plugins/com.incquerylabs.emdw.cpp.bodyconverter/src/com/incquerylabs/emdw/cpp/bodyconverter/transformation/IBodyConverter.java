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
package com.incquerylabs.emdw.cpp.bodyconverter.transformation;

import org.eclipse.incquery.runtime.api.AdvancedIncQueryEngine;
import org.eclipse.papyrusrt.xtumlrt.common.Operation;
import org.eclipse.papyrusrt.xtumlrt.common.State;
import org.eclipse.papyrusrt.xtumlrt.common.Transition;

import com.incquerylabs.emdw.cpp.bodyconverter.scoping.BasicUMLContextProvider;
import com.incquerylabs.emdw.snippettemplate.Snippet;

public interface IBodyConverter {
	public void initialize(AdvancedIncQueryEngine engine, BasicUMLContextProvider context);
	
	public Snippet convertOperation(Operation commonOperation);
	public Snippet convertStateEntry(State commonState);
	public Snippet convertStateExit(State commonState);
	public Snippet convertTransition(Transition commonTransition);
	public Snippet convertTransitionGuard(Transition commonTransition);
}
