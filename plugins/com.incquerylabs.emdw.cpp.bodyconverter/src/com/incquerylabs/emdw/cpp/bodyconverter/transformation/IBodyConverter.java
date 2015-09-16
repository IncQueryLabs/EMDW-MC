package com.incquerylabs.emdw.cpp.bodyconverter.transformation;

import org.eclipse.incquery.runtime.api.AdvancedIncQueryEngine;

import com.ericsson.xtumlrt.oopl.cppmodel.CPPOperation;
import com.ericsson.xtumlrt.oopl.cppmodel.CPPState;
import com.ericsson.xtumlrt.oopl.cppmodel.CPPTransition;
import com.incquerylabs.emdw.cpp.bodyconverter.scoping.BasicUMLContextProvider;

public interface IBodyConverter {    
    public void initialize(AdvancedIncQueryEngine engine, BasicUMLContextProvider context);
    
    public String convertOperation(CPPOperation target);
    public String convertStateEntry(CPPState target);
    public String convertStateExit(CPPState target);
    public String convertTransition(CPPTransition target);
    public String convertTransitionGuard(CPPTransition target);
}
