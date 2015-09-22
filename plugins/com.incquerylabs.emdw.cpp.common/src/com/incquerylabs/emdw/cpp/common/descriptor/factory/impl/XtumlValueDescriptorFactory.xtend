package com.incquerylabs.emdw.cpp.common.descriptor.factory.impl

import com.incquerylabs.emdw.cpp.common.mapper.XtumlToOoplMapper
import org.eclipse.incquery.runtime.api.AdvancedIncQueryEngine
import org.eclipse.papyrusrt.xtumlrt.common.Type
import org.eclipse.papyrusrt.xtumlrt.xtuml.XTEvent

import static com.google.common.base.Preconditions.*

class XtumlValueDescriptorFactory {
	private XtumlValueDescriptorFactory parent
	public CppValueDescriptorFactory factory
	private XtumlToOoplMapper mapper
	private AdvancedIncQueryEngine engine
	
	/**
	 * @param engine Cannot be null
	 */
	new(AdvancedIncQueryEngine engine) {
		checkArgument(engine!=null, "Engine cannot be null!")
		init(null, engine)
	}
	
	/**
	 * If you use this constructor the factory will use its parent's IncQueryEngine.
	 * 
	 * @param parent Cannot be null
	 */
	new(XtumlValueDescriptorFactory parent) {
		checkArgument(parent!=null, "Parent cannot be null!")
		init(parent, parent.engine)
	}
	
	private def init(XtumlValueDescriptorFactory parent, AdvancedIncQueryEngine engine) {
		this.parent = parent
		this.engine = engine
		if(parent!=null) {
			factory = new CppValueDescriptorFactory(parent.factory)
		} else {
			factory = new CppValueDescriptorFactory
		}
		mapper = new XtumlToOoplMapper(engine)
	}
	
	
	
	/**
	 * @param type Cannot be null
	 * @param localVariableName Cannot be null
	 * 
	 * @return The SingleVariableDescriptor with the resolved <code>type</code> based on implementation
	 *         and with unique name based on <code>localVariableName</code>
	 */
	def prepareSingleVariableDescriptorForNewLocalVariable(Type type, String localVariableName) {
		checkArgument(type!=null, "Type cannot be null")
		val ooplType = mapper.convertType(type)
		return factory.prepareSingleVariableDescriptorForNewLocalVariable(ooplType, localVariableName)
	}
	
	/**
	 * @param event Cannot be null
	 * @param localVariableName Cannot be null
	 * 
	 * @return The SingleVariableDescriptor with the resolved <code>event</code> based on implementation
	 *         and with unique name based on <code>localVariableName</code>
	 */
	def prepareSingleVariableDescriptorForNewLocalVariable(XTEvent xtEvent, String localVariableName) {
		checkArgument(xtEvent!=null, "Type cannot be null")
		val cppEvent = mapper.convertEvent(xtEvent)
		return factory.prepareSingleVariableDescriptorForNewLocalVariable(cppEvent, localVariableName)
	}
	
	/**
	 * @param type Cannot be null
	 * 
	 * @return The SingleVariableDescriptor with the resolved <code>type</code> based on implementation
	 *         and with unique name
	 */
	dispatch def prepareSingleVariableDescriptorForNewLocalVariable(Type type) {
		checkArgument(type!=null, "Type cannot be null")
		val ooplType = mapper.convertType(type)
		return factory.prepareSingleVariableDescriptorForNewLocalVariable(ooplType)
	}
	
	/**
	 * @param type Cannot be null
	 * 
	 * @return The SingleVariableDescriptor with the resolved <code>type</code> based on implementation
	 *         and with unique name
	 */
	dispatch def prepareSingleVariableDescriptorForNewLocalVariable(XTEvent type) {
		checkArgument(type!=null, "Type cannot be null")
		val ooplEvent = mapper.convertEvent(type)
		return factory.prepareSingleVariableDescriptorForNewLocalVariable(ooplEvent)
	}
	
	/**
	 * @param type Cannot be null
	 * @param localVariableName Cannot be null
	 * 
	 * @return The SingleVariableDescriptor with the resolved <code>type</code> based on implementation
	 *         and with <code>stringRepresentation</code> which is the same as <code>localVariableName</code>
	 */
	def prepareSingleVariableDescriptorForExistingVariable(Type type, String localVariableName) {
		checkArgument(type!=null, "Type cannot be null")
		val ooplType = mapper.convertType(type)
		return factory.prepareSingleVariableDescriptorForExistingVariable(ooplType, localVariableName)
	}
	
	/**
	 * @param type Cannot be null
	 * @param localVariableName Cannot be null
	 * 
	 * @return The SingleVariableDescriptor with the resolved <code>type</code> based on implementation
	 *         and with <code>stringRepresentation</code> which is the same as <code>localVariableName</code>
	 */
	def prepareSingleVariableDescriptorForExistingVariable(XTEvent xtEvent, String localVariableName) {
		checkArgument(xtEvent!=null, "Type cannot be null")
		val cppEvent = mapper.convertEvent(xtEvent)
		return factory.prepareSingleVariableDescriptorForExistingVariable(cppEvent, localVariableName)
	}
	
	/**
	 * @param type Cannot be null and must be convertible to an OOPL type
	 * @param literal Cannot be null and must be parsable if it is a number
	 * 
	 * @return The SingleVariableDescriptor with the resolved type based on implementation 
	 *         and with <code>stringRepresentation</code> which will contain the converted 
	 *         <code>literal</code>
	 */
	def prepareSingleVariableDescriptorForLiteral(Type type, String literal) {
		checkArgument(type!=null, "Type cannot be null")
		val ooplType = mapper.convertType(type)
		return factory.prepareSingleVariableDescriptorForLiteral(ooplType, literal)
	}
	
	def prepareCollectionVariableDescriptorForNewLocalVariable(String collectionType, Type elementType, String localVariableName) {
		checkArgument(collectionType!=null, "Type (collectionType) cannot be null")
		checkArgument(elementType!=null, "Type (elementType) cannot be null")
		val ooplElementType = mapper.convertType(elementType)
		val ooplCollectionType = mapper.findCollectionImplementation(collectionType, ooplElementType)
		return factory.prepareCollectionVariableDescriptorForNewLocalVariable(ooplCollectionType, ooplElementType, localVariableName)
	}
	
	def prepareCollectionVariableDescriptorForNewLocalVariable(String collectionType, XTEvent elementType, String localVariableName) {
		checkArgument(collectionType!=null, "Type (collectionType) cannot be null")
		checkArgument(elementType!=null, "Type (elementType) cannot be null")
		val ooplElementType = mapper.convertEvent(elementType)
		val ooplCollectionType = mapper.findCollectionImplementation(collectionType, ooplElementType)
		return factory.prepareCollectionVariableDescriptorForNewLocalVariable(ooplCollectionType, ooplElementType, localVariableName)
	}
	
	def prepareCollectionVariableDescriptorForNewLocalVariable(String collectionType, Type elementType) {
		checkArgument(collectionType!=null, "Type (collectionType) cannot be null")
		checkArgument(elementType!=null, "Type (elementType) cannot be null")
		val ooplElementType = mapper.convertType(elementType)
		val ooplCollectionType = mapper.findCollectionImplementation(collectionType, ooplElementType)
		return factory.prepareCollectionVariableDescriptorForNewLocalVariable(ooplCollectionType, ooplElementType)
	}
	
	def prepareCollectionVariableDescriptorForNewLocalVariable(String collectionType, XTEvent elementType) {
		checkArgument(collectionType!=null, "Type (collectionType) cannot be null")
		checkArgument(elementType!=null, "Type (elementType) cannot be null")
		val ooplElementType = mapper.convertEvent(elementType)
		val ooplCollectionType = mapper.findCollectionImplementation(collectionType, ooplElementType)
		return factory.prepareCollectionVariableDescriptorForNewLocalVariable(ooplCollectionType, ooplElementType)
	}
	
	def prepareCollectionVariableDescriptorForExistingVariable(String collectionType, Type elementType, String localVariableName) {
		checkArgument(collectionType!=null, "Type (collectionType) cannot be null")
		checkArgument(elementType!=null, "Type (elementType) cannot be null")
		val ooplElementType = mapper.convertType(elementType)
		val ooplCollectionType = mapper.findCollectionImplementation(collectionType, ooplElementType)
		return factory.prepareCollectionVariableDescriptorForExistingVariable(ooplCollectionType, ooplElementType, localVariableName)
	}
	
	def prepareCollectionVariableDescriptorForExistingVariable(String collectionType, XTEvent elementType, String localVariableName) {
		checkArgument(collectionType!=null, "Type (collectionType) cannot be null")
		checkArgument(elementType!=null, "Type (elementType) cannot be null")
		val ooplElementType = mapper.convertEvent(elementType)
		val ooplCollectionType = mapper.findCollectionImplementation(collectionType, ooplElementType)
		return factory.prepareCollectionVariableDescriptorForExistingVariable(ooplCollectionType, ooplElementType, localVariableName)
	}

}