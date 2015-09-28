package com.incquerylabs.emdw.cpp.common.descriptor.builder.impl

import com.incquerylabs.emdw.cpp.common.descriptor.builder.IOoplOperationCallBuilder
import com.incquerylabs.emdw.valuedescriptor.ValueDescriptor
import org.eclipse.incquery.runtime.api.AdvancedIncQueryEngine
import org.eclipse.papyrusrt.xtumlrt.common.Operation
import org.eclipse.emf.common.util.ECollections
import com.ericsson.xtumlrt.oopl.BaseContainerImplementation

class CppOperationCallBuilder extends AbstractCppOperationCallDescriptorBuilder implements IOoplOperationCallBuilder {
	
	private ValueDescriptor variable
	private Operation operation
	private String collectionType
	private String operationName
	
	
	new(AdvancedIncQueryEngine engine) {
		super(engine)
	}
	
	
	override build() {
		if(operation!=null) {
			val od = prepareOperationCallDescriptor(operation, params)
			if(mapper.isHiddenByChild(operation)) {
				od.stringRepresentation = '''«variable.stringRepresentation»->«cppOperation.cppQualifiedName»(«parameterList»)'''
			} else {
				od.stringRepresentation = '''«variable.stringRepresentation»->«cppOperation.cppName»(«parameterList»)'''
			}
			return od
		} else {
			val sequenceImplementation = mapper.findSequenceCollectionImplementation(collectionType)
			val eOperationName = operationName.eoperationName
			val op = sequenceImplementation.getEoperation(eOperationName)
			val paramsList = ECollections.asEList(newArrayList(variable.stringRepresentation, parameterList, ""))
			val operationCode = sequenceImplementation.eInvoke(op, paramsList)
			val returnValue = converter.convertToType(mapper.findBasicType("bool"))
			val ocd = factory.createOperationCallDescriptor => [
				it.baseType = returnValue
				it.fullType = it.baseType
				it.stringRepresentation = '''«operationCode»'''
			]
			return ocd
		}
	}
	
	private def getEoperation(BaseContainerImplementation containerImplementation, String eOperationName) {
		containerImplementation.eClass.EAllOperations.findFirst[eop |
			eop.name.toLowerCase.equals(eOperationName.toLowerCase)
		]
	}
	
	private def getEoperationName(String operationName){
		switch(operationName) {
			case "isEmpty" : "generateIsEmpty"
			case "size": "generateSize" 
			case "add": 
				if(params.size == 1){
					"generateAdd"
				} else {
					"generateInsertElementAtIndex"
				}
			case "addAll": "generateAddAll"
			case "get": "generateElementAtIndex"
		}
	}
	
	override setVariable(ValueDescriptor variable) {
		this.variable = variable
		return this
	}
	
	override setOperation(Operation operation) {
		this.operation = operation
		return this
	}
	
	override setParameters(ValueDescriptor... params) {
		this.params = params
		return this
	}
	
	override setOperationName(String operationName) {
		this.operationName = operationName
		return this
	}
	
	override setCollectionType(String collectionType) {
		this.collectionType = collectionType
		return this
	}
	
}