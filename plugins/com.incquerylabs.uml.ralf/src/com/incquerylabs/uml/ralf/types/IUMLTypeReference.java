package com.incquerylabs.uml.ralf.types;

import org.eclipse.uml2.uml.Type;

public interface IUMLTypeReference {

	public class AnyTypeReference implements IUMLTypeReference {
		
		private static AnyTypeReference INSTANCE = new AnyTypeReference();
		
		public static AnyTypeReference getInstance() {
			return INSTANCE;
		}
		
		private AnyTypeReference() {}

	}
	public class NullTypeReference implements IUMLTypeReference {
		
		private static NullTypeReference INSTANCE = new NullTypeReference();
		
		public static NullTypeReference getInstance() {
			return INSTANCE;
		}
		
		private NullTypeReference() {}

	}
}
