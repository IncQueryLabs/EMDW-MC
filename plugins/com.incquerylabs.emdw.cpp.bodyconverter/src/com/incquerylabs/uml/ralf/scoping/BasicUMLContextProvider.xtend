package com.incquerylabs.uml.ralf.scoping

import org.eclipse.incquery.runtime.api.AdvancedIncQueryEngine

class BasicUMLContextProvider extends UMLContextProvider {
	
	private AdvancedIncQueryEngine engine
	
	new(AdvancedIncQueryEngine engine) {
		this.engine = engine
	}
	
	override protected doGetEngine() {
		engine
	}
	
	override protected getContextObject() {
		if(definedOperation!=null) {
			return definedOperation
		}
		throw new IllegalArgumentException('''Context has not been set''')
	}
	
}