package com.incquerylabs.emdw.cpp.ui

import org.eclipse.core.expressions.PropertyTester
import org.eclipse.core.runtime.IAdaptable
import org.eclipse.uml2.uml.Model
import org.eclipse.uml2.uml.Component

class SelectionAdapterTester extends PropertyTester {
	
	override test(Object receiver, String property, Object[] args, Object expectedValue) {
		if (receiver instanceof IAdaptable){
			if(property == "isumlmodel"){
				val model = receiver.getAdapter(Model) as Model
				if(model != null){
					return true
				}
			} else if(property == "isumlcomponent"){
				val component = receiver.getAdapter(Component) as Component
				if(component != null){
					return true
				}
			}
		}
		return false
	}
}