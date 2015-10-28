package com.incquerylabs.emdw.cpp.common.descriptor.builder.impl

import com.incquerylabs.emdw.cpp.common.descriptor.builder.IOoplOperationCallBuilder
import com.incquerylabs.emdw.cpp.common.descriptor.builder.IUmlOperationCallBuilder
import com.incquerylabs.emdw.cpp.common.descriptor.factory.impl.UmlValueDescriptorFactory
import com.incquerylabs.emdw.cpp.common.mapper.UmlToXtumlMapper
import com.incquerylabs.emdw.cpp.common.util.UmlTypedValueDescriptor
import com.incquerylabs.emdw.cpp.common.util.XtTypedValueDescriptor
import com.incquerylabs.emdw.valuedescriptor.ValueDescriptor
import java.util.List
import org.apache.log4j.Logger
import org.eclipse.incquery.runtime.api.AdvancedIncQueryEngine
import org.eclipse.uml2.uml.DataType
import org.eclipse.uml2.uml.Operation

class UmlOperationCallBuilder implements IUmlOperationCallBuilder {
	extension Logger logger = Logger.getLogger(class)
	
	private UmlToXtumlMapper mapper
	private IOoplOperationCallBuilder builder
	private static final val collections = newArrayList(
		"std::collections::Set",
		"std::collections::Sequence",
		"std::collections::Bag",
		"std::collections::Collection")
	
	private ValueDescriptor variable
	private Operation operation
	private List<UmlTypedValueDescriptor<? extends ValueDescriptor>> params
	
	
	
	new(UmlValueDescriptorFactory factory, AdvancedIncQueryEngine engine) {
		mapper = new UmlToXtumlMapper(engine)
		builder = new CppOperationCallBuilder(factory.factory.factory, engine)
	}
	
	
	
	override build() {
		trace('''Started building''')
		val xtParams = params?.map[new XtTypedValueDescriptor(mapper.convertType(type), descriptor)]
		builder => [
			it.variable = variable
			it.parameters = xtParams
		]
		val dataType = operation.eContainer
		if(dataType instanceof DataType) {
			if(collections.contains(dataType.qualifiedName)) {
				val ocd = builder.setOperationName(operation.name).setCollectionType(mapper.decodeCollectionType(dataType)).build
				trace('''Finished building''')
				return ocd
			}
		}
		
		val xtOperation = mapper.convertOperation(operation)
		trace('''Resolved operation: «xtOperation.name»''')
		val ocd = builder.setOperation(xtOperation).build
		trace('''Finished building''')
		return ocd
	}
	
	override setVariable(ValueDescriptor variable) {
		this.variable = variable
		return this
	}
	
	override setOperation(Operation operation) {
		this.operation = operation
		return this
	}
	
	override setParameters(UmlTypedValueDescriptor<? extends ValueDescriptor>... params) {
		this.params = params
		return this
	}
	
}