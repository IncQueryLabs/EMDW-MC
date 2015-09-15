package com.incquerylabs.emdw.cpp.common.descriptor.builder.impl

import com.ericsson.xtumlrt.oopl.cppmodel.CPPClassRefSimpleCollection
import com.incquerylabs.emdw.cpp.common.TypeConverter
import com.incquerylabs.emdw.cpp.common.descriptor.builder.IOoplLinkUnlinkBuilder
import com.incquerylabs.emdw.cpp.common.descriptor.factory.impl.CppValueDescriptorFactory
import com.incquerylabs.emdw.cpp.common.mapper.XtumlToOoplMapper
import com.incquerylabs.emdw.valuedescriptor.CollectionVariableDescriptor
import com.incquerylabs.emdw.valuedescriptor.SingleVariableDescriptor
import com.incquerylabs.emdw.valuedescriptor.ValueDescriptor
import com.incquerylabs.emdw.valuedescriptor.ValuedescriptorFactory
import org.eclipse.incquery.runtime.api.AdvancedIncQueryEngine
import org.eclipse.papyrusrt.xtumlrt.xtuml.XTAssociation

class CppLinkUnlinkBuilder implements IOoplLinkUnlinkBuilder {
	protected static extension ValuedescriptorFactory factory = ValuedescriptorFactory.eINSTANCE
	
	private AdvancedIncQueryEngine engine
	private XtumlToOoplMapper mapper
	private TypeConverter converter
	
	private String sourceToTargetString
	private String targetToSourceString
	
	private boolean isUnlink
	private XTAssociation xtAssociation
	private ValueDescriptor sourceDescriptor
	private ValueDescriptor targetDescriptor
	
	
	new(AdvancedIncQueryEngine engine) {
		this.engine = engine
		this.mapper = new XtumlToOoplMapper(engine)
		this.converter = new TypeConverter
	}
	
	override build() {
		val voidTypeString = converter.convertType(mapper.findBasicType("void"))
		val nullDescriptor = factory.createSingleVariableDescriptor => [
			it.baseType = voidTypeString
			it.fullType = voidTypeString
			it.stringRepresentation = "NULL"
		]
		val resultDescriptor = (new CppValueDescriptorFactory()).prepareSingleVariableDescriptorForNewLocalVariable(mapper.findBasicType("bool"))
		
		if(xtAssociation.upperBound>0) {
			var sourceToTargetWriteBuilder = ((new CppAssociationWriteBuilder(engine)) => [
				var newTargetDescriptor = targetDescriptor
				if(isUnlink) {
					newTargetDescriptor = nullDescriptor
				}
				it.variable = sourceDescriptor
				it.association = xtAssociation
				it.newValue = newTargetDescriptor
			]).build
			sourceToTargetString = '''«sourceToTargetWriteBuilder.stringRepresentation»;'''
		} else {
			val rel = mapper.convertAssociation(xtAssociation)
			if(isUnlink) {
				sourceToTargetString = (rel.referenceStorage.head.type as CPPClassRefSimpleCollection).implementation.generateRemove(
						sourceDescriptor as CollectionVariableDescriptor, 
						targetDescriptor as SingleVariableDescriptor
				)
			} else {
				sourceToTargetString = (rel.referenceStorage.head.type as CPPClassRefSimpleCollection).implementation.generateAdd(
						sourceDescriptor as CollectionVariableDescriptor, 
						targetDescriptor as SingleVariableDescriptor, 
						resultDescriptor
				)
			}
		}
		
		if(xtAssociation.opposite.upperBound>0) {
			var targetToSourceWriteBuilder = ((new CppAssociationWriteBuilder(engine)) => [
				var newSourceDescriptor = sourceDescriptor
				if(isUnlink) {
					newSourceDescriptor = nullDescriptor
				}
				it.variable = targetDescriptor
				it.association = xtAssociation.opposite
				it.newValue = newSourceDescriptor
			]).build
			targetToSourceString = '''«targetToSourceWriteBuilder.stringRepresentation»'''
		} else {
			val rel = mapper.convertAssociation(xtAssociation.opposite)
			if(isUnlink) {
				targetToSourceString = (rel.referenceStorage.head.type as CPPClassRefSimpleCollection).implementation.generateRemove(
						targetDescriptor as CollectionVariableDescriptor, 
						sourceDescriptor as SingleVariableDescriptor
				)
			} else {
				targetToSourceString = (rel.referenceStorage.head.type as CPPClassRefSimpleCollection).implementation.generateAdd(
						targetDescriptor as CollectionVariableDescriptor, 
						sourceDescriptor as SingleVariableDescriptor, 
						resultDescriptor
				)
			}
		}
		
		return factory.createOperationCallDescriptor => [
			it.stringRepresentation =	'''
										«sourceToTargetString»
										«targetToSourceString»'''
			it.baseType = voidTypeString
			it.fullType = voidTypeString
		]
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