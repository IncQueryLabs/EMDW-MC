package com.incquerylabs.emdw.cpp.common.descriptor.factory.impl

import com.incquerylabs.emdw.cpp.common.mapper.XtumlToOoplMapper
import org.apache.log4j.Logger
import org.eclipse.incquery.runtime.api.AdvancedIncQueryEngine
import org.eclipse.papyrusrt.xtumlrt.common.Type
import org.eclipse.papyrusrt.xtumlrt.xtuml.XTEvent

import static com.google.common.base.Preconditions.*

class XtumlValueDescriptorFactory {
	extension Logger logger = Logger.getLogger(class)
	
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
	def prepareSingleVariableDescriptorForNewLocalVariable(Type type, String localVariableName, boolean initialize) {
		checkArgument(type!=null, "Type cannot be null")
		trace('''Started new local SingleVariableDescriptor creation''')
		val ooplType = mapper.convertType(type)
		trace('''Resolved type: «ooplType»''')
		val svd = factory.prepareSingleVariableDescriptorForNewLocalVariable(ooplType, localVariableName, initialize)
		trace('''Finished new local SingleVariableDescriptor creation''')
		return svd
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
		trace('''Started new local SingleVariableDescriptor creation''')
		val cppEvent = mapper.convertEvent(xtEvent)
		trace('''Resolved event: «cppEvent.cppQualifiedName»''')
		val svd = factory.prepareSingleVariableDescriptorForNewLocalVariable(cppEvent, localVariableName)
		trace('''Finished new local SingleVariableDescriptor creation''')
		return svd
	}
	
	/**
	 * @param type Cannot be null
	 * 
	 * @return The SingleVariableDescriptor with the resolved <code>type</code> based on implementation
	 *         and with unique name
	 */
	def prepareSingleVariableDescriptorForNewLocalVariable(Type type, boolean initialize) {
		checkArgument(type!=null, "Type cannot be null")
		trace('''Started new local SingleVariableDescriptor creation''')
		val ooplType = mapper.convertType(type)
		trace('''Resolved type: «ooplType»''')
		val svd = factory.prepareSingleVariableDescriptorForNewLocalVariable(ooplType, initialize)
		trace('''Finished new local SingleVariableDescriptor creation''')
		return svd
	}
	
	/**
	 * @param type Cannot be null
	 * 
	 * @return The SingleVariableDescriptor with the resolved <code>type</code> based on implementation
	 *         and with unique name
	 */
	def prepareSingleVariableDescriptorForNewLocalVariable(XTEvent type) {
		checkArgument(type!=null, "Type cannot be null")
		trace('''Started new local SingleVariableDescriptor creation''')
		val ooplEvent = mapper.convertEvent(type)
		trace('''Resolved event: «ooplEvent.cppQualifiedName»''')
		val svd = factory.prepareSingleVariableDescriptorForNewLocalVariable(ooplEvent)
		trace('''Finished new local SingleVariableDescriptor creation''')
		return svd
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
		trace('''Started existing local SingleVariableDescriptor creation''')
		val ooplType = mapper.convertType(type)
		trace('''Resolved type: «ooplType»''')
		val svd = factory.prepareSingleVariableDescriptorForExistingVariable(ooplType, localVariableName)
		trace('''Finished existing local SingleVariableDescriptor creation''')
		return svd
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
		trace('''Started existing local SingleVariableDescriptor creation''')
		val cppEvent = mapper.convertEvent(xtEvent)
		trace('''Resolved event: «cppEvent.cppQualifiedName»''')
		val svd = factory.prepareSingleVariableDescriptorForExistingVariable(cppEvent, localVariableName)
		trace('''Finished existing local SingleVariableDescriptor creation''')
		return svd
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
		trace('''Started LiteralDescriptor creation''')
		val ooplType = mapper.convertType(type)
		trace('''Resolved type: «ooplType»''')
		val ld = factory.prepareSingleVariableDescriptorForLiteral(ooplType, literal)
		trace('''Finished LiteralDescriptor creation''')
		return ld
	}
	
	def prepareCollectionVariableDescriptorForNewLocalVariable(String collectionType, Type elementType, String localVariableName) {
		checkArgument(collectionType!=null, "Type (collectionType) cannot be null")
		checkArgument(elementType!=null, "Type (elementType) cannot be null")
		trace('''Started new local CollectionVariableDescriptor creation''')
		val ooplElementType = mapper.convertType(elementType)
		trace('''Resolved element type: «ooplElementType»''')
		val ooplCollectionType = mapper.findCollectionImplementation(collectionType, ooplElementType)
		trace('''Resolved collection type: «ooplCollectionType.containerQualifiedName»''')
		val cvd = factory.prepareCollectionVariableDescriptorForNewLocalVariable(ooplCollectionType, ooplElementType, localVariableName)
		trace('''Finished new local CollectionVariableDescriptor creation''')
		return cvd
	}
	
	def prepareCollectionVariableDescriptorForNewLocalVariable(String collectionType, XTEvent elementType, String localVariableName) {
		checkArgument(collectionType!=null, "Type (collectionType) cannot be null")
		checkArgument(elementType!=null, "Type (elementType) cannot be null")
		trace('''Started new local CollectionVariableDescriptor creation''')
		val ooplElementType = mapper.convertEvent(elementType)
		trace('''Resolved element type: «ooplElementType.cppQualifiedName»''')
		val ooplCollectionType = mapper.findCollectionImplementation(collectionType, ooplElementType)
		trace('''Resolved collection type: «ooplCollectionType.containerQualifiedName»''')
		val cvd = factory.prepareCollectionVariableDescriptorForNewLocalVariable(ooplCollectionType, ooplElementType, localVariableName)
		trace('''Finished new local CollectionVariableDescriptor creation''')
		return cvd
	}
	
	def prepareCollectionVariableDescriptorForNewLocalVariable(String collectionType, Type elementType) {
		checkArgument(collectionType!=null, "Type (collectionType) cannot be null")
		checkArgument(elementType!=null, "Type (elementType) cannot be null")
		trace('''Started new local CollectionVariableDescriptor creation''')
		val ooplElementType = mapper.convertType(elementType)
		trace('''Resolved element type: «ooplElementType»''')
		val ooplCollectionType = mapper.findCollectionImplementation(collectionType, ooplElementType)
		trace('''Resolved collection type: «ooplCollectionType.containerQualifiedName»''')
		val cvd = factory.prepareCollectionVariableDescriptorForNewLocalVariable(ooplCollectionType, ooplElementType)
		trace('''Finished new local CollectionVariableDescriptor creation''')
		return cvd
	}
	
	def prepareCollectionVariableDescriptorForNewLocalVariable(String collectionType, XTEvent elementType) {
		checkArgument(collectionType!=null, "Type (collectionType) cannot be null")
		checkArgument(elementType!=null, "Type (elementType) cannot be null")
		trace('''Started new local CollectionVariableDescriptor creation''')
		val ooplElementType = mapper.convertEvent(elementType)
		trace('''Resolved element type: «ooplElementType.cppQualifiedName»''')
		val ooplCollectionType = mapper.findCollectionImplementation(collectionType, ooplElementType)
		trace('''Resolved collection type: «ooplCollectionType.containerQualifiedName»''')
		val cvd = factory.prepareCollectionVariableDescriptorForNewLocalVariable(ooplCollectionType, ooplElementType)
		trace('''Finished new local CollectionVariableDescriptor creation''')
		return cvd
	}
	
	def prepareCollectionVariableDescriptorForExistingVariable(String collectionType, Type elementType, String localVariableName) {
		checkArgument(collectionType!=null, "Type (collectionType) cannot be null")
		checkArgument(elementType!=null, "Type (elementType) cannot be null")
		trace('''Started existing local CollectionVariableDescriptor creation''')
		val ooplElementType = mapper.convertType(elementType)
		trace('''Resolved element type: «ooplElementType»''')
		val ooplCollectionType = mapper.findCollectionImplementation(collectionType, ooplElementType)
		trace('''Resolved collection type: «ooplCollectionType.containerQualifiedName»''')
		val cvd = factory.prepareCollectionVariableDescriptorForExistingVariable(ooplCollectionType, ooplElementType, localVariableName)
		trace('''Finished existing local CollectionVariableDescriptor creation''')
		return cvd
	}
	
	def prepareCollectionVariableDescriptorForExistingVariable(String collectionType, XTEvent elementType, String localVariableName) {
		checkArgument(collectionType!=null, "Type (collectionType) cannot be null")
		checkArgument(elementType!=null, "Type (elementType) cannot be null")
		trace('''Started existing local CollectionVariableDescriptor creation''')
		val ooplElementType = mapper.convertEvent(elementType)
		trace('''Resolved element type: «ooplElementType.cppQualifiedName»''')
		val ooplCollectionType = mapper.findCollectionImplementation(collectionType, ooplElementType)
		trace('''Resolved collection type: «ooplCollectionType.containerQualifiedName»''')
		val cvd = factory.prepareCollectionVariableDescriptorForExistingVariable(ooplCollectionType, ooplElementType, localVariableName)
		trace('''Finished existing local CollectionVariableDescriptor creation''')
		return cvd
	}

}