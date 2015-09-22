package com.incquerylabs.emdw.cpp.common.descriptor.builder.impl

import com.incquerylabs.emdw.cpp.common.descriptor.builder.IUmlCollectionLiteralBuilder
import com.incquerylabs.emdw.cpp.common.descriptor.factory.impl.UmlValueDescriptorFactory
import com.incquerylabs.emdw.valuedescriptor.ValueDescriptor
import java.util.List
import org.eclipse.incquery.runtime.api.AdvancedIncQueryEngine
import org.eclipse.uml2.uml.Type

class UmlCollectionLiteralBuilder implements IUmlCollectionLiteralBuilder {
	private UmlValueDescriptorFactory factory
	
	private Type collectionType
	private Type elementType
	private List<ValueDescriptor> elems
	private StringBuilder builder
	
	new(AdvancedIncQueryEngine engine, UmlValueDescriptorFactory factory) {
		this.factory = factory
	}
	
	override build() {
		var String collectionString
		switch collectionType.qualifiedName {
			case "std::collections::Set": {
				collectionString = "::std::set"
			}
			default: {
				collectionString = "::std::list"
			}
		}
		val cvd = factory.prepareCollectionVariableDescriptorForNewLocalVariable(collectionType, elementType)
		builder.append('''«cvd.fullType» «cvd.stringRepresentation»«IF !elems.empty» = { «FOR elem : elems.sortBy[it.stringRepresentation] SEPARATOR ", "»«elem.stringRepresentation»«ENDFOR» }«ENDIF»;«"\r\n"»''')
		return cvd
	}
	
	override setCollectionType(Type collectionType) {
		this.collectionType = collectionType
		return this
	}
	
	override setElementType(Type elementType) {
		this.elementType = elementType
		return this
	}
	
	override setElements(ValueDescriptor... elems) {
		this.elems = elems
		return this
	}
	
	override setStringBuilder(StringBuilder builder) {
		this.builder = builder
		return this
	}
	
}