package com.incquerylabs.emdw.cpp.common.descriptor.builder.impl

import com.ericsson.xtumlrt.oopl.cppmodel.CPPClassRefSimpleCollection
import com.incquerylabs.emdw.cpp.common.TypeConverter
import com.incquerylabs.emdw.cpp.common.descriptor.builder.IOoplLinkUnlinkBuilder
import com.incquerylabs.emdw.cpp.common.descriptor.factory.impl.UmlValueDescriptorFactory
import com.incquerylabs.emdw.cpp.common.mapper.UmlToXtumlMapper
import com.incquerylabs.emdw.cpp.common.mapper.XtumlToOoplMapper
import com.incquerylabs.emdw.valuedescriptor.CollectionVariableDescriptor
import com.incquerylabs.emdw.valuedescriptor.SingleVariableDescriptor
import com.incquerylabs.emdw.valuedescriptor.ValueDescriptor
import com.incquerylabs.emdw.valuedescriptor.ValuedescriptorFactory
import org.eclipse.incquery.runtime.api.AdvancedIncQueryEngine
import org.eclipse.papyrusrt.xtumlrt.xtuml.XTAssociation
import com.incquerylabs.emdw.cpp.common.descriptor.factory.impl.CppValueDescriptorFactory

class CppLinkUnlinkBuilder implements IOoplLinkUnlinkBuilder {
	protected static extension ValuedescriptorFactory factory = ValuedescriptorFactory.eINSTANCE
	
	private AdvancedIncQueryEngine engine
	private XtumlToOoplMapper mapper
	private UmlToXtumlMapper umlMapper
	private TypeConverter converter
	private CppValueDescriptorFactory cppFactory
	
	private String sourceToTargetString
	private String targetToSourceString
	
	private boolean isUnlink
	private XTAssociation xtAssociation
	private ValueDescriptor sourceDescriptor
	private ValueDescriptor targetDescriptor
	
	
	new(CppValueDescriptorFactory cppFactory, AdvancedIncQueryEngine engine, UmlToXtumlMapper umlMapper) {
		this.engine = engine
		this.mapper = new XtumlToOoplMapper(engine)
		this.umlMapper = umlMapper
		this.converter = new TypeConverter
		this.cppFactory = cppFactory
	}
	
	override build() {
		if(xtAssociation.upperBound == 1) {
			var sourceToTargetWriteBuilder = createAssociationWriteDescriptor(sourceDescriptor, targetDescriptor, xtAssociation)
			sourceToTargetString = '''«sourceToTargetWriteBuilder.stringRepresentation»'''
		} else {
			sourceToTargetString = collectionModificationCode(xtAssociation, sourceDescriptor, targetDescriptor)
		}
		
		if(xtAssociation.opposite!=null && xtAssociation.opposite.upperBound == 1) {
			var targetToSourceWriteBuilder = createAssociationWriteDescriptor(targetDescriptor, sourceDescriptor, xtAssociation.opposite)
			targetToSourceString = '''«targetToSourceWriteBuilder.stringRepresentation»'''
		} else {
			targetToSourceString = collectionModificationCode(xtAssociation.opposite, targetDescriptor, sourceDescriptor)
			if(targetToSourceString.endsWith(";")) {
				targetToSourceString = targetToSourceString.substring(0, targetToSourceString.length-1)
			}
		}
		
		val voidTypeString = converter.convertToType(mapper.findBasicType("void"))
		return factory.createOperationCallDescriptor => [
			it.stringRepresentation =	'''
										«sourceToTargetString»«IF xtAssociation.opposite!=null»;
										«targetToSourceString»«ENDIF»'''
			it.baseType = voidTypeString
			it.fullType = voidTypeString
		]
	}
	
	def createAssociationWriteDescriptor(ValueDescriptor sourceDescriptor, ValueDescriptor targetDescriptor, XTAssociation xtAssociation) {
		val voidTypeString = converter.convertToType(mapper.findBasicType("void"))
		val nullDescriptor = factory.createSingleVariableDescriptor => [
			it.baseType = voidTypeString
			it.fullType = voidTypeString
			it.stringRepresentation = "nullptr"
			it.pointerRepresentation = "nullptr"
		]
		return ((new CppAssociationWriteBuilder(engine)) => [
				var newTargetDescriptor = targetDescriptor
				if(isUnlink) {
					newTargetDescriptor = nullDescriptor
				}
				it.variable = sourceDescriptor
				it.association = xtAssociation
				it.newValue = newTargetDescriptor
			]).build
	}
	
	def collectionModificationCode(XTAssociation xtAssociation, ValueDescriptor sourceDescriptor, ValueDescriptor targetDescriptor) {
		val rel = mapper.convertAssociation(xtAssociation)
		val cvd = createCollectionDescriptorForAssociation(xtAssociation)
		val initCVD = '''«cvd.fullType» «cvd.stringRepresentation» = «createAssociationReadDescriptor(sourceDescriptor, xtAssociation).stringRepresentation»'''
		var String operationD
		if(isUnlink) {
			operationD = (rel.referenceStorage.head.type as CPPClassRefSimpleCollection).implementation.generateRemove(
					cppFactory.nextPrefix,
					cvd, 
					targetDescriptor as SingleVariableDescriptor
			)
		} else {
			operationD = (rel.referenceStorage.head.type as CPPClassRefSimpleCollection).implementation.generateAdd(
					cppFactory.nextPrefix,
					cvd, 
					targetDescriptor as SingleVariableDescriptor
			)
		}
		return	'''
				«initCVD»;
				«operationD»'''
	}
	
	def createAssociationReadDescriptor(ValueDescriptor sourceDescriptor, XTAssociation xtAssociation) {
		return ((new CppAssociationReadBuilder(engine)) => [
				it.variable = sourceDescriptor
				it.association = xtAssociation
			]).build
	}
	
	def CollectionVariableDescriptor createCollectionDescriptorForAssociation(XTAssociation xtAssociation) {
		val rel = mapper.convertAssociation(xtAssociation)
		val collection = (rel.referenceStorage.head.type as CPPClassRefSimpleCollection)
		return cppFactory.prepareCollectionVariableDescriptorForNewLocalVariable(collection.implementation, collection.ooplClass)
	}
	
	override isUnlink(boolean isUnlink) {
		this.isUnlink = isUnlink
		return this
	}
	
	override setSourceToTargetAssociation(XTAssociation association) {
		this.xtAssociation = association
		return this
	}
	
	override setSourceDescriptor(ValueDescriptor sourceDescriptor) {
		this.sourceDescriptor = sourceDescriptor
		return this
	}
	
	override setTargetDescriptor(ValueDescriptor targetDescriptor) {
		this.targetDescriptor = targetDescriptor
		return this
	}
	
}