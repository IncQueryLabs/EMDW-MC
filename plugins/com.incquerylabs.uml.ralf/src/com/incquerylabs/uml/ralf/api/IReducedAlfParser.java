package com.incquerylabs.uml.ralf.api;

import org.eclipse.uml2.uml.OpaqueBehavior;

import com.incquerylabs.uml.ralf.reducedAlfLanguage.Statements;

public interface IReducedAlfParser {
    /**
     * Creates a rALF AST based on the specified rALF code.
     * @param behavior
     * @return
     */
    public Statements parse(String behavior);
    
    /**
     * Extracts the rALF code from a specified OpaqueBehavior instance, and creates the corresponding rALF AST.
     * @param behavior
     * @return
     */
    public Statements parse(OpaqueBehavior behavior);
    
}
