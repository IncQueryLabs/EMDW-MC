package com.incquerylabs.uml.ralf.types;

import com.incquerylabs.uml.ralf.reducedAlfLanguage.CollectionType;

public class CollectionTypeReference implements IUMLTypeReference {
	
	CollectionType type;
	IUMLTypeReference valueType;
	
	CollectionTypeReference(CollectionType type, IUMLTypeReference valueType) {
		super();
		this.type = type;
		this.valueType = valueType;
	}

	public CollectionType getType() {
		return type;
	}

	public IUMLTypeReference getValueType() {
		return valueType;
	}

	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + ((valueType == null) ? 0 : valueType.hashCode());
		result = prime * result + ((type == null) ? 0 : type.hashCode());
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
		CollectionTypeReference other = (CollectionTypeReference) obj;
		if (valueType == null) {
			if (other.valueType != null)
				return false;
		} else if (!valueType.equals(other.valueType))
			return false;
		if (type != other.type)
			return false;
		return true;
	}
}
