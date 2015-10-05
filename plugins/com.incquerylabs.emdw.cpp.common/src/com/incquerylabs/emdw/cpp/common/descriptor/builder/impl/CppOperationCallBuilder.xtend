package com.incquerylabs.emdw.cpp.common.descriptor.builder.impl

import com.ericsson.xtumlrt.oopl.BaseContainerImplementation
import com.ericsson.xtumlrt.oopl.cppmodel.CPPReturnValue
import com.incquerylabs.emdw.cpp.common.descriptor.builder.IOoplOperationCallBuilder
import com.incquerylabs.emdw.cpp.common.descriptor.factory.impl.CppValueDescriptorFactory
import com.incquerylabs.emdw.valuedescriptor.ValueDescriptor
import org.eclipse.emf.common.util.ECollections
import org.eclipse.incquery.runtime.api.AdvancedIncQueryEngine
import org.eclipse.papyrusrt.xtumlrt.common.Operation

class CppOperationCallBuilder extends AbstractCppOperationCallDescriptorBuilder implements IOoplOperationCallBuilder {
	
	private ValueDescriptor variable
	private Operation operation
	private String collectionType
	private String operationName
	private CppValueDescriptorFactory cvdfactory
	
	
	new(CppValueDescriptorFactory factory, AdvancedIncQueryEngine engine) {
		super(engine)
		this.cvdfactory = factory
	}
	
	
	override build() {
		if(operation!=null) {
			val od = prepareOperationCallDescriptor(operation)
			if(mapper.isHiddenByChild(operation)) {
				od.stringRepresentation = '''«variable.stringRepresentation»->«cppOperation.cppQualifiedName»(«parameterString»)'''
			} else {
				od.stringRepresentation = '''«variable.stringRepresentation»->«cppOperation.cppName»(«parameterString»)'''
			}
			
			val returnValue = cppOperation.subElements.filter(CPPReturnValue).head
			val convertedRepresentations = od.stringRepresentation.createStringRepresentations(returnValue)
			
			od.valueRepresentation = convertedRepresentations.valueRepresentation
			od.pointerRepresentation = convertedRepresentations.pointerRepresentation
			
			return od
		} else {
			val sequenceImplementation = mapper.findSequenceCollectionImplementation(collectionType)
			val eOperationName = operationName.eoperationName
			val op = sequenceImplementation.getEoperation(eOperationName)
			val paramList = eOperationName.parameters
			val paramsEList = ECollections.asEList(paramList)
			val operationCode = sequenceImplementation.eInvoke(op, paramsEList)
			val returnValue = sequenceImplementation.getReturnType(operationName)
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
	
	private def getEoperationName(String operationName) {
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
	
	def String getReturnType(BaseContainerImplementation implementation, String operationName) {
		switch(operationName) {
			case "add": {
				// TODO: sometimes it should be void
				return converter.convertToType(mapper.findBasicType("bool"))
				
			}
			case "addAll": return converter.convertToType(mapper.findBasicType("bool"))
			case "get": return variable.templateTypes.get(0)
			case "isEmpty": return converter.convertToType(mapper.findBasicType("bool"))
			case "size": return converter.convertToType(mapper.findBasicType("long"))
		}
	}
	
	private def getParameters(String eoperationName) {
		// TODO: generate unique prefix
		val variablePrefix = cvdfactory.nextPrefix
		val valueType = this.variable.templateTypes.head ?: ""
		
		val remainingPramas = switch(eoperationName) {
			case "generateIsEmpty" : #[]
			case "generateSize" : #[]
			case "generateAdd" : #[valueType]
			case "generateInsertElementAtIndex" : #[valueType]
			case "generateAddAll" : #[]
			case "generateElementAtIndex" : #[valueType]
			default : #[]
		}
		val paramList = <String>newArrayList(variablePrefix, variable.stringRepresentation)
		paramList += getParameterList()
		paramList += remainingPramas
		
		paramList
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