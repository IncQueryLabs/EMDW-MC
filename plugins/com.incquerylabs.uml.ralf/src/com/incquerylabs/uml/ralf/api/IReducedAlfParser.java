package com.incquerylabs.uml.ralf.api;

import org.eclipse.uml2.uml.OpaqueBehavior;

import com.incquerylabs.uml.ralf.api.impl.ParsingResults;
import com.incquerylabs.uml.ralf.scoping.IUMLContextProvider;

public interface IReducedAlfParser {
    /**
     * Creates a rALF AST based on the specified rALF code.
     * @param behavior
     * @return
     */
    public ParsingResults parse(String behavior);
    
    /**
     * Creates a rALF AST based on the specified rALF code and an UML context provider
     * @param behavior
     * @param contextProvider
     * @return
     */
    public ParsingResults parse(String behavior, IUMLContextProvider contextProvider);
    /**
     * Extracts the rALF code from a specified OpaqueBehavior instance, and creates the corresponding rALF AST.
     * @param behavior
     * @return
     */
    public ParsingResults parse(OpaqueBehavior behavior);

    
}
