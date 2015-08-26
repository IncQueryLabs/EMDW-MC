package com.incquerylabs.uml.ralf.scoping

import org.eclipse.emf.ecore.EObject
import org.eclipse.incquery.runtime.api.AdvancedIncQueryEngine
import org.eclipse.uml2.uml.OpaqueBehavior
import org.eclipse.uml2.uml.OpaqueExpression

class BasicUMLContextProvider extends UMLContextProvider {
	
	private AdvancedIncQueryEngine engine
	private EObject contextObject
	
	new(AdvancedIncQueryEngine engine) {
		this.engine = engine
	}
	
	override protected doGetEngine() {
		engine
	}
	
	override protected getContextObject() {
		if(contextObject!=null) {
			return contextObject
		}
		throw new IllegalArgumentException('''Context has not been set''')
	}
	
	def dispatch public void setContextObject(OpaqueBehavior behavior) {
		contextObject = behavior
	}
	
	def dispatch public void setContextObject(OpaqueExpression expression) {
		contextObject = expression
	}
	
}