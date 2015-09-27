package com.incquerylabs.emdw.cpp.common.descriptor.builder.impl

import com.incquerylabs.emdw.cpp.common.descriptor.builder.IOoplConstructorCallBuilder
import com.incquerylabs.emdw.cpp.common.descriptor.builder.IUmlConstructorCallBuilder
import com.incquerylabs.emdw.cpp.common.mapper.UmlToXtumlMapper
import com.incquerylabs.emdw.valuedescriptor.ValueDescriptor
import java.util.List
import org.eclipse.incquery.runtime.api.AdvancedIncQueryEngine
import org.eclipse.papyrusrt.xtumlrt.xtuml.XTClass
import org.eclipse.uml2.uml.Type
import org.eclipse.uml2.uml.Signal
import org.eclipse.papyrusrt.xtumlrt.xtuml.XTClassEvent
import org.eclipse.uml2.uml.Operation

class UmlConstructorCallBuilder implements IUmlConstructorCallBuilder {
	private UmlToXtumlMapper mapper
	private IOoplConstructorCallBuilder builder
	
	private Type type
	private List<Pair<Type, ? extends ValueDescriptor>> params
	private Operation operation
	
	
	
	new(AdvancedIncQueryEngine engine) {
		mapper = new UmlToXtumlMapper(engine)
		builder = new CppConstructorCallBuilder(engine)
	}
	
	
	override build() {
		val List<ValueDescriptor> parameters = newArrayList
		params?.forEach[pair | parameters += pair.value]
		
		if(type instanceof Signal) {
			val xtEvent = mapper.convertSignal(type) as XTClassEvent
			return (builder => [
						it.redefinableElement = xtEvent
						it.parameters = parameters
					]).build
		} else {
			val xtClass = mapper.convertType(type) as XTClass
			val xtOperation = if(operation != null) mapper.convertOperation(operation) else null
			return (builder => [
						it.redefinableElement = xtClass
						it.parameters = parameters
						it.operation = xtOperation
					]).build
		}
	}
	
	override setType(Type type) {
		this.type = type
		return this
	}
	
	override setParameters(Pair<Type, ? extends ValueDescriptor>... params) {
		this.params = params
		return this
	}
	
	override setOperation(Operation operation) {
		this.operation = operation
		this
	}
	
}