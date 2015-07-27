package com.incquerylabs.uml.ralf.types;

import org.eclipse.uml2.uml.Type;

import com.google.common.base.Preconditions;

public abstract class AbstractTypeReference implements IUMLTypeReference {

	protected Type umlType;

	public AbstractTypeReference(Type umlType) {
		Preconditions.checkNotNull(umlType, "UML Type must not be null");
		Preconditions.checkArgument(!umlType.eIsProxy(), "Unresolved type reference in %s", umlType);
		this.umlType = umlType;
	}

	public Type getUmlType() {
		return umlType;
	}

	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + ((umlType == null) ? 0 : umlType.getQualifiedName().hashCode());
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
		AbstractTypeReference other = (AbstractTypeReference) obj;
		if (umlType == null) {
			if (other.umlType != null)
				return false;
		} else if (!umlType.getQualifiedName().equals(other.umlType.getQualifiedName()))
			return false;
		return true;
	}

	@Override
	public String toString() {
		return "UML type " + umlType.getQualifiedName();
	}

}