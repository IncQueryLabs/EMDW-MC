package com.incquerylabs.emdw.umlintegration.rules

import com.incquerylabs.emdw.umlintegration.queries.OperationMatch
import com.incquerylabs.emdw.umlintegration.util.ModelUtil
import com.incquerylabs.emdw.umlintegration.util.TransformationUtil
import com.zeligsoft.xtumlrt.common.Entity
import com.zeligsoft.xtumlrt.common.Operation
import com.zeligsoft.xtumlrt.common.Type
import org.eclipse.incquery.runtime.api.IncQueryEngine

class OperationRules {
	static def getRules(IncQueryEngine engine) {
		#{
			new OperationMapping(engine).specification
		}
	}
}

class OperationMapping extends AbstractObjectRule<OperationMatch, org.eclipse.uml2.uml.Operation, Operation> {

	new(IncQueryEngine engine) {
		super(engine)
	}

	override getXtumlrtClass() {
		Operation
	}
	
	public static val PRIORITY = CommonPriorities.TYPE_MAPPING_PRIORITY + 1

	override getRulePriority() {
		PRIORITY
	}

	override getQuerySpecification() {
		operation
	}

	override getUmlObject(OperationMatch match) {
		match.operation
	}

	override createXtumlrtObject(org.eclipse.uml2.uml.Operation umlObject, OperationMatch match) {
		commonFactory.createOperation => [
			body = commonFactory.createActionCode
		]
	}

	override updateXtumlrtObject(Operation xtumlrtObject, OperationMatch match) {
		val umlObject = match.umlObject
		xtumlrtObject.body.source = ModelUtil.getCppCode(umlObject)
		switch type : engine.trace.getAllValuesOfxtumlrtElement(null, null, umlObject.type).head {
			Type: xtumlrtObject.returnType = type 
		}
		xtumlrtObject.static = umlObject.static
		xtumlrtObject.visibility = TransformationUtil.transform(umlObject.visibility)
	}
	
	def getXtumlrtContainer(OperationMatch match) {
		engine.trace.getAllValuesOfxtumlrtElement(null, null, match.umlClass).head as Entity
	}

	override protected insertXtumlrtObject(Operation xtumlrtObject, OperationMatch match) {
		match.xtumlrtContainer.operations += xtumlrtObject
	}

}
