package com.incquerylabs.uml.ralf.transformation;

import org.eclipse.incquery.runtime.api.AdvancedIncQueryEngine;

import com.ericsson.xtumlrt.oopl.cppmodel.CPPOperation;
import com.ericsson.xtumlrt.oopl.cppmodel.CPPState;
import com.ericsson.xtumlrt.oopl.cppmodel.CPPTransition;
import com.incquerylabs.uml.ralf.scoping.IUMLContextProvider;

public interface IBodyConverter {    
    public void initialize(AdvancedIncQueryEngine engine, IUMLContextProvider context);
    
    public String convertOperation(CPPOperation target);
    public String convertStateEntry(CPPState target);
    public String convertStateExit(CPPState target);
    public String convertTransition(CPPTransition target);
    public String convertTransitionGuard(CPPTransition target);
}
