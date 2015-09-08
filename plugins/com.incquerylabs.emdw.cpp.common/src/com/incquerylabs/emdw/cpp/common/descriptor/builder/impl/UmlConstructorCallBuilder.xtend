package com.incquerylabs.emdw.cpp.common.descriptor.builder.impl

import com.incquerylabs.emdw.cpp.common.descriptor.builder.IOoplConstructorCallBuilder
import com.incquerylabs.emdw.cpp.common.descriptor.builder.IUmlConstructorCallBuilder
import com.incquerylabs.emdw.cpp.common.mapper.UmlToXtumlMapper
import com.incquerylabs.emdw.valuedescriptor.ValueDescriptor
import java.util.List
import java.util.Map
import org.eclipse.incquery.runtime.api.AdvancedIncQueryEngine
import org.eclipse.papyrusrt.xtumlrt.xtuml.XTClass
import org.eclipse.uml2.uml.Class
import org.eclipse.uml2.uml.Type

class UmlConstructorCallBuilder implements IUmlConstructorCallBuilder {
	private UmlToXtumlMapper mapper
	private IOoplConstructorCallBuilder builder
	
	private Type type
	private List<Pair<Type, ValueDescriptor>> params
	
	
	
	new(AdvancedIncQueryEngine engine) {
		mapper = new UmlToXtumlMapper(engine)
		builder = new CppConstructorCallBuilder(engine)
	}
	
	
	override build() {
//		val umlClass = type as Class
//		val constructor = umlClass.operations.filter[op | 
//			op.name.equals(umlClass.name) 
//			&& op.ownedParameters.size==params.size 
//	// TODO
//			&& op.ownedParameters.containsAll(params.keySet)
//		].head
//		val List<ValueDescriptor> parameters = newArrayList
//		constructor.ownedParameters.forEach[p |
//			parameters += params.get(p.type)
//		]
//		
//		val xtClass = mapper.convertType(type) as XTClass
//		return (builder => [
//					it.class = xtClass
//					it.parameters = parameters
//				]).build
		return null
	}
	
	override setType(Type type) {
		this.type = type
		return this
	}
	
	override setParameters(Pair<Type, ValueDescriptor>... params) {
		this.params = params
		return this
	}
}