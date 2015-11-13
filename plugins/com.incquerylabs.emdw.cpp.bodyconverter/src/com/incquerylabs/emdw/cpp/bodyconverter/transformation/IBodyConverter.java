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
