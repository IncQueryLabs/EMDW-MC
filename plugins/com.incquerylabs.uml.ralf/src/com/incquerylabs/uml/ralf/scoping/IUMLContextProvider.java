package com.incquerylabs.uml.ralf.scoping;

import org.eclipse.uml2.uml.Class;

public interface IUMLContextProvider {

	Iterable<Class> getKnownClasses();

}
