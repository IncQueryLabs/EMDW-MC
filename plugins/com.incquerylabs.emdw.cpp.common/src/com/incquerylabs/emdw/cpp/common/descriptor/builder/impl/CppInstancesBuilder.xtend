package com.incquerylabs.emdw.cpp.common.descriptor.builder.impl

import com.ericsson.xtumlrt.oopl.cppmodel.CPPClass
import com.ericsson.xtumlrt.oopl.cppmodel.CPPClassRefSimpleCollection
import com.ericsson.xtumlrt.oopl.cppmodel.CPPClassReferenceStorage
import com.incquerylabs.emdw.cpp.common.descriptor.builder.IOoplInstancesBuilder
import com.incquerylabs.emdw.cpp.common.mapper.XtumlToOoplMapper
import com.incquerylabs.emdw.valuedescriptor.ValuedescriptorFactory
import org.eclipse.papyrusrt.xtumlrt.xtuml.XTClass
import org.eclipse.incquery.runtime.api.AdvancedIncQueryEngine

class CppInstancesBuilder implements IOoplInstancesBuilder {
	protected static extension ValuedescriptorFactory factory = ValuedescriptorFactory.eINSTANCE
	
	private XtumlToOoplMapper mapper
	
	private XTClass xtClass
	
	new(AdvancedIncQueryEngine engine) {
		mapper = new XtumlToOoplMapper(engine)
	}
	
	override build() {
		val cppClass = mapper.convertType(xtClass) as CPPClass
		val instances = cppClass.referenceStorage as CPPClassReferenceStorage
		val collectionType = (instances.type as CPPClassRefSimpleCollection).cppContainer
		val cvd = factory.createCollectionVariableDescriptor => [
			it.stringRepresentation = instances.cppQualifiedName
			it.baseType = collectionType
			it.fullType = '''«collectionType»< «cppClass.cppQualifiedName» >'''
		]
		return cvd
	}
	
	override setOoplClass(XTClass xtClass) {
		this.xtClass = xtClass
		return this
	}
	
}