package com.incquerylabs.emdw.cpp.performance.test.config

import eu.mondo.sam.core.DataToken
import org.eclipse.incquery.runtime.api.AdvancedIncQueryEngine
import org.eclipse.uml2.uml.Model
import org.eclipse.xtend.lib.annotations.Accessors

@Accessors
class MCDataToken implements DataToken {
	AdvancedIncQueryEngine engine
	
	String scenarioName
	
	String umlModelPath
	Model umlModel
	
	ModificationType modificationType
	
	
	override init() {
		//throw new UnsupportedOperationException("TODO: auto-generated method stub")
	}
	
	override destroy() {
		//throw new UnsupportedOperationException("TODO: auto-generated method stub")
	}
	
}