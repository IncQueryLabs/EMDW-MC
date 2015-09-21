package com.incquerylabs.emdw.cpp.common.descriptor.builder.impl

import com.ericsson.xtumlrt.oopl.BaseContainerImplementation
import com.ericsson.xtumlrt.oopl.BaseContainerImplementationTemplateReplacer
import com.ericsson.xtumlrt.oopl.OOPLSequenceImplementation
import com.ericsson.xtumlrt.oopl.OOPLSequenceImplementationTemplateReplacer
import com.incquerylabs.emdw.cpp.common.descriptor.builder.IUmlCollectionLiteralBuilder
import com.incquerylabs.emdw.cpp.common.descriptor.factory.impl.UmlValueDescriptorFactory
import com.incquerylabs.emdw.cpp.common.mapper.UmlToXtumlMapper
import com.incquerylabs.emdw.cpp.common.mapper.XtumlToOoplMapper
import com.incquerylabs.emdw.valuedescriptor.CollectionVariableDescriptor
import com.incquerylabs.emdw.valuedescriptor.LiteralDescriptor
import com.incquerylabs.emdw.valuedescriptor.SingleVariableDescriptor
import com.incquerylabs.emdw.valuedescriptor.ValueDescriptor
import java.util.List
import org.eclipse.incquery.runtime.api.AdvancedIncQueryEngine
import org.eclipse.papyrusrt.xtumlrt.common.PrimitiveType
import org.eclipse.uml2.uml.Type

class UmlCollectionLiteralBuilder implements IUmlCollectionLiteralBuilder {
	private UmlToXtumlMapper xumlMapper
	private XtumlToOoplMapper ooplMapper
	private UmlValueDescriptorFactory factory
	
	private Type collectionType
	private Type elementType
	private List<ValueDescriptor> elems
	private StringBuilder builder
	
	new(AdvancedIncQueryEngine engine, UmlValueDescriptorFactory factory) {
		this.factory = factory
		xumlMapper = new UmlToXtumlMapper(engine)
		ooplMapper = new XtumlToOoplMapper(engine)
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
		switch elementType {
			case org.eclipse.uml2.uml.PrimitiveType: {
				val collection = ooplMapper.findSequenceCollectionImplementation(collectionString)
				builder.append('''
					«cvd.fullType» «cvd.stringRepresentation»;
					«FOR elem : elems.filter(SingleVariableDescriptor)»
					«collection.addTemplate(cvd, elem)»
					«ENDFOR»
					«FOR elem : elems.filter(LiteralDescriptor)»
					«collection.addTemplate(cvd, elem)»
					«ENDFOR»''')
			}
			default: {
				val collection = ooplMapper.findClassRefCollectionImplementation(collectionString)
				builder.append('''
					«cvd.fullType» «cvd.stringRepresentation»;
					«FOR elem : elems.filter(SingleVariableDescriptor)»
					«collection.addTemplate(cvd, elem)»
					«ENDFOR»''')
			}
		}
		return cvd
	}
	
	def String addTemplate(BaseContainerImplementation collection, CollectionVariableDescriptor cvd, SingleVariableDescriptor elem) {
		return BaseContainerImplementationTemplateReplacer.generateAdd(
						collection, 
						cvd, 
						elem, 
						factory.prepareSingleVariableDescriptorForNewLocalVariable(
							xumlMapper.findUmlPrimitiveType(
								ooplMapper.findBasicType("bool").commonType as PrimitiveType
							) as Type
						)
					)
	}
	
	def String addTemplate(OOPLSequenceImplementation collection, CollectionVariableDescriptor cvd, LiteralDescriptor elem) {
		return OOPLSequenceImplementationTemplateReplacer.generateAdd(
						collection, 
						cvd, 
						elem, 
						factory.prepareSingleVariableDescriptorForNewLocalVariable(
							xumlMapper.findUmlPrimitiveType(
								ooplMapper.findBasicType("bool").commonType as PrimitiveType
							) as Type
						)
					)
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