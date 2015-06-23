package com.incquerylabs.uml.ralf.scoping;

import org.eclipse.uml2.uml.Class;
import org.eclipse.uml2.uml.Signal;
import org.eclipse.uml2.uml.Type;

public interface IUMLContextProvider {

	public static final String REAL_TYPE = "REAL";
	public static final String INTEGER_TYPE = "INTEGER";
	public static final String STRING_TYPE = "STRING";
	public static final String BOOLEAN_TYPE = "BOOLEAN";
	
	
	Iterable<Type> getKnownTypes();
	Iterable<Class> getKnownClasses();
	Iterable<Signal> getKnownSignals();

	Type getPrimitiveType(String name);
}
