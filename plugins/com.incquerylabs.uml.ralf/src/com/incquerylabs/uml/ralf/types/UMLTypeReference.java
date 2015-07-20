package com.incquerylabs.uml.ralf.types;

import org.eclipse.uml2.uml.Type;

public class UMLTypeReference implements IUMLTypeReference {

	Type umlType;
	
	public static UMLTypeReference create(Type type) {
		UMLTypeReference ref = new UMLTypeReference();
		ref.umlType = type;
		return ref;
	}

	public Type getUmlType() {
		return umlType;
	}

	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + ((umlType == null) ? 0 : umlType.hashCode());
		return result;
	}

	@Override
	public boolean equals(Object obj) {
		if (this == obj)
			return true;
		if (obj == null)
			return false;
		if (getClass() != obj.getClass())
			return false;
		UMLTypeReference other = (UMLTypeReference) obj;
		if (umlType == null) {
			if (other.umlType != null)
				return false;
		} else if (!umlType.equals(other.umlType))
			return false;
		return true;
	}

	@Override
	public String toString() {
		return "UML type " + umlType.getQualifiedName();
	}
	
	
}
