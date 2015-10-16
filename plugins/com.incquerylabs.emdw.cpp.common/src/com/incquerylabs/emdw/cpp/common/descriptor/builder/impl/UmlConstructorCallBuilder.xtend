package com.incquerylabs.emdw.cpp.common.descriptor.builder.impl

import com.incquerylabs.emdw.cpp.common.descriptor.builder.IOoplConstructorCallBuilder
import com.incquerylabs.emdw.cpp.common.descriptor.builder.IUmlConstructorCallBuilder
import com.incquerylabs.emdw.cpp.common.mapper.UmlToXtumlMapper
import com.incquerylabs.emdw.cpp.common.util.UmlTypedValueDescriptor
import com.incquerylabs.emdw.valuedescriptor.ValueDescriptor
import java.util.List
import org.eclipse.incquery.runtime.api.AdvancedIncQueryEngine
import org.eclipse.papyrusrt.xtumlrt.xtuml.XTClass
import org.eclipse.papyrusrt.xtumlrt.xtuml.XTClassEvent
import org.eclipse.uml2.uml.Operation
import org.eclipse.uml2.uml.Signal
import org.eclipse.uml2.uml.Type
import com.incquerylabs.emdw.cpp.common.util.XtTypedValueDescriptor

class UmlConstructorCallBuilder implements IUmlConstructorCallBuilder {
	private UmlToXtumlMapper mapper
	private IOoplConstructorCallBuilder builder
	
	private Type type
	private List<UmlTypedValueDescriptor<? extends ValueDescriptor>> params
	private Operation operation
	
	
	
	new(AdvancedIncQueryEngine engine) {
		mapper = new UmlToXtumlMapper(engine)
		builder = new CppConstructorCallBuilder(engine)
	}
	
	
	override build() {
		val xtParams = params?.map[new XtTypedValueDescriptor(mapper.convertType(type), descriptor)]
		
		if(type instanceof Signal) {
			val xtEvent = mapper.convertSignal(type) as XTClassEvent
			return (builder => [
						it.redefinableElement = xtEvent
						it.parameters = xtParams
					]).build
		} else {
			val xtClass = mapper.convertType(type) as XTClass
			val xtOperation = if(operation != null) mapper.convertOperation(operation) else null
			return (builder => [
						it.redefinableElement = xtClass
						it.parameters = xtParams
						it.operation = xtOperation
					]).build
		}
	}
	
	override setType(Type type) {
		this.type = type
		return this
	}
	
	override setParameters(UmlTypedValueDescriptor<? extends ValueDescriptor>... params) {
		this.params = params
		return this
	}
	
	override setOperation(Operation operation) {
		this.operation = operation
		this
	}
	
}