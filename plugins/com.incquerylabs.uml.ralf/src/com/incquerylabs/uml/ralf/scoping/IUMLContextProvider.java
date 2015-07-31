package com.incquerylabs.uml.ralf.scoping;

import org.eclipse.uml2.uml.Association;
import org.eclipse.uml2.uml.Behavior;
import org.eclipse.uml2.uml.Class;
import org.eclipse.uml2.uml.Operation;
import org.eclipse.uml2.uml.Property;
import org.eclipse.uml2.uml.Signal;
import org.eclipse.uml2.uml.Type;

public interface IUMLContextProvider {

	public static final String REAL_TYPE = "Real";
	public static final String INTEGER_TYPE = "Integer";
	public static final String STRING_TYPE = "String";
	public static final String BOOLEAN_TYPE = "Boolean";
	
	
	Iterable<Type> getKnownTypes();
	Iterable<Class> getKnownClasses();
	Iterable<Signal> getKnownSignals();
	Iterable<Association> getKnownAssociations();

	Type getPrimitiveType(String name);
	
	Iterable<Property> getPropertiesOfClass(Class cl);
	Iterable<Property> getAssociationsOfClass(Class cl);
	Iterable<Operation> getOperationsOfClass(Class cl);
	Iterable<Operation> getStaticOperationsOfClass(Class cl);
	
	/**
	 * Returns the type of the this expression. If no container can be calculated, might return null.
	 * 
	 * @return
	 */
	Class getThisType();
	
	Operation getDefinedOperation();
	void setDefinedOperation(Operation behavior);
}
