package com.incquerylabs.emdw.cpp.common.modelaccess.impl

import com.incquerylabs.emdw.cpp.common.modelaccess.IModelAccess
import org.eclipse.incquery.runtime.api.AdvancedIncQueryEngine
import com.incquerylabs.emdw.cpp.common.modelaccess.builder.impl.UmlPropertyAccessBuilder
import com.incquerylabs.emdw.cpp.common.modelaccess.builder.impl.UmlPropertyWriteBuilder

class UmlCppModelAccess implements IModelAccess{
	private AdvancedIncQueryEngine engine
	
	new(AdvancedIncQueryEngine engine) {
		this.engine = engine
	}
	
	override createPropertyAccessBuilder() {
		new UmlPropertyAccessBuilder(engine)
	}
	
	override createPropertyWriteBuilder() {
		new UmlPropertyWriteBuilder(engine)
	}
	
	override createOperationCallBuilder() {
		throw new UnsupportedOperationException("TODO: auto-generated method stub")
	}
	
}