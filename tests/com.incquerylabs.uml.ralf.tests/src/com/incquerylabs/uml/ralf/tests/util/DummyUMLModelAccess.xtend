package com.incquerylabs.uml.ralf.tests.util

import com.incquerylabs.emdw.cpp.common.modelaccess.IModelAccess

class DummyUMLModelAccess implements IModelAccess{
		
	override createPropertyWriteBuilder() {
		new DummyPropertyWriteBuilder
	}
	
	override createOperationCallBuilder() {
		new DummyOperationCallBuilder
	}
	
	override createPropertyReadBuilder() {
		new DummyPropertyAccessBuilder
	}
	
}