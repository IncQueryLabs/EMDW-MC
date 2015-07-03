package com.incquerylabs.uml.ralf.scoping;

import org.eclipse.uml2.uml.Association;
import org.eclipse.uml2.uml.Class;
import org.eclipse.uml2.uml.Property;
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
	Iterable<Association> getKnownAssociations();

	Type getPrimitiveType(String name);
	
	Iterable<Property> getPropertiesOfClass(Class cl);
	Iterable<Property> getAssociationsOfClass(Class cl);
	
	/**
	 * Returns the type of the this expression. If no container can be calculated, might return null.
	 * 
	 * @return
	 */
	Class getThisType();
}
