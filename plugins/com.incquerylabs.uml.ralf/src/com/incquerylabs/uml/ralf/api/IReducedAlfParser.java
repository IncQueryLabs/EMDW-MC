package com.incquerylabs.uml.ralf.api;

import org.eclipse.uml2.uml.OpaqueBehavior;

import com.incquerylabs.uml.ralf.reducedAlfLanguage.Statements;

public interface IReducedAlfParser {

    public Statements parse(String behavior);
    public Statements parse(OpaqueBehavior behavior);
    
}
