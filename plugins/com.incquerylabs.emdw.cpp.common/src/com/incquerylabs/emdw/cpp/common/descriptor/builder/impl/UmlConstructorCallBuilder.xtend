package com.incquerylabs.emdw.cpp.common.descriptor.builder.impl

import com.incquerylabs.emdw.cpp.common.descriptor.builder.IOoplConstructorCallBuilder
import com.incquerylabs.emdw.cpp.common.descriptor.builder.IUmlConstructorCallBuilder
import com.incquerylabs.emdw.cpp.common.mapper.UmlToXtumlMapper
import com.incquerylabs.emdw.valuedescriptor.ValueDescriptor
import java.util.List
import org.eclipse.incquery.runtime.api.AdvancedIncQueryEngine
import org.eclipse.papyrusrt.xtumlrt.xtuml.XTClass
import org.eclipse.uml2.uml.Type

class UmlConstructorCallBuilder implements IUmlConstructorCallBuilder {
	private UmlToXtumlMapper mapper
	private IOoplConstructorCallBuilder builder
	
	private Type type
	private List<Pair<Type, ? extends ValueDescriptor>> params
	
	
	
	new(AdvancedIncQueryEngine engine) {
		mapper = new UmlToXtumlMapper(engine)
		builder = new CppConstructorCallBuilder(engine)
	}
	
	
	override build() {
		val List<ValueDescriptor> parameters = newArrayList
		params?.forEach[pair | parameters += pair.value]
		
		val xtClass = mapper.convertType(type) as XTClass
		return (builder => [
					it.xtClass = xtClass
					it.parameters = parameters
				]).build
	}
	
	override setType(Type type) {
		this.type = type
		return this
	}
	
	override setParameters(Pair<Type, ? extends ValueDescriptor>... params) {
		this.params = params
		return this
	}
}