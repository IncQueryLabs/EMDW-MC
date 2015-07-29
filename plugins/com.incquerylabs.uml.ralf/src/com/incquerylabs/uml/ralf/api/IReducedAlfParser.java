package com.incquerylabs.uml.ralf.api;

import org.eclipse.uml2.uml.OpaqueBehavior;

import com.incquerylabs.uml.ralf.api.impl.ParsingResults;
import com.incquerylabs.uml.ralf.scoping.IUMLContextProvider;

public interface IReducedAlfParser {
	/**
	 * Creates a rALF AST based on the specified rALF code. This AST cannot
	 * refer to UML types except the primitive types.
	 * 
	 * @param behavior
	 * @return
	 */
	ParsingResults parse(String behavior);

	/**
	 * Creates a rALF AST based on the specified rALF code and an UML context
	 * provider
	 * 
	 * @param behavior
	 * @param contextProvider
	 * @return
	 */
	ParsingResults parse(String behavior, IUMLContextProvider contextProvider);

	/**
	 * Extracts the rALF code from a specified OpaqueBehavior instance, and
	 * creates the corresponding rALF AST. The UML context provider is
	 * initialized based on the behavior parameter.
	 * 
	 * @param behavior
	 * @return
	 */
	ParsingResults parse(OpaqueBehavior behavior);

}
