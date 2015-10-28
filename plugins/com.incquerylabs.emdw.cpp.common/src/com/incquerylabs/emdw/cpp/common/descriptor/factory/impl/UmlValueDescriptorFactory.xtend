package com.incquerylabs.emdw.cpp.common.descriptor.factory.impl

import com.google.common.collect.HashBasedTable
import com.google.common.collect.Table
import com.incquerylabs.emdw.cpp.common.descriptor.IDescriptorCacheManager
import com.incquerylabs.emdw.cpp.common.descriptor.builder.impl.UmlCastDescriptorBuilder
import com.incquerylabs.emdw.cpp.common.descriptor.builder.impl.UmlCollectionLiteralBuilder
import com.incquerylabs.emdw.cpp.common.descriptor.builder.impl.UmlCollectionVariableDescriptorBuilder
import com.incquerylabs.emdw.cpp.common.descriptor.builder.impl.UmlConstructorCallBuilder
import com.incquerylabs.emdw.cpp.common.descriptor.builder.impl.UmlCopyConstructorCallBuilder
import com.incquerylabs.emdw.cpp.common.descriptor.builder.impl.UmlDeleteBuilder
import com.incquerylabs.emdw.cpp.common.descriptor.builder.impl.UmlForeachBuilder
import com.incquerylabs.emdw.cpp.common.descriptor.builder.impl.UmlInstancesBuilder
import com.incquerylabs.emdw.cpp.common.descriptor.builder.impl.UmlLinkUnlinkBuilder
import com.incquerylabs.emdw.cpp.common.descriptor.builder.impl.UmlLiteralDescriptorBuilder
import com.incquerylabs.emdw.cpp.common.descriptor.builder.impl.UmlOperationCallBuilder
import com.incquerylabs.emdw.cpp.common.descriptor.builder.impl.UmlParameterDescriptorBuilder
import com.incquerylabs.emdw.cpp.common.descriptor.builder.impl.UmlPropertyReadBuilder
import com.incquerylabs.emdw.cpp.common.descriptor.builder.impl.UmlPropertyWriteBuilder
import com.incquerylabs.emdw.cpp.common.descriptor.builder.impl.UmlSendSignalBuilder
import com.incquerylabs.emdw.cpp.common.descriptor.builder.impl.UmlSigdataDescriptorBuilder
import com.incquerylabs.emdw.cpp.common.descriptor.builder.impl.UmlSingleVariableDescriptorBuilder
import com.incquerylabs.emdw.cpp.common.descriptor.builder.impl.UmlStaticOperationCallBuilder
import com.incquerylabs.emdw.cpp.common.descriptor.factory.IUmlDescriptorFactory
import com.incquerylabs.emdw.cpp.common.mapper.UmlToXtumlMapper
import com.incquerylabs.emdw.valuedescriptor.CollectionVariableDescriptor
import com.incquerylabs.emdw.valuedescriptor.LiteralDescriptor
import com.incquerylabs.emdw.valuedescriptor.SingleVariableDescriptor
import java.util.Map
import org.eclipse.incquery.runtime.api.AdvancedIncQueryEngine
import org.eclipse.uml2.uml.Signal
import org.eclipse.uml2.uml.Type

import static com.google.common.base.Preconditions.*
import com.incquerylabs.emdw.cpp.common.descriptor.builder.impl.UmlCollectionOperationCallBuilder
import org.apache.log4j.Logger

class UmlValueDescriptorFactory implements IUmlDescriptorFactory, IDescriptorCacheManager{
	extension Logger logger = Logger.getLogger(class)
	
	private UmlValueDescriptorFactory parent
	public XtumlValueDescriptorFactory factory
	private UmlToXtumlMapper mapper
	private AdvancedIncQueryEngine engine
	private Map<String, SingleVariableDescriptor> singleVariableCache
	private Table<Type, String, LiteralDescriptor> literalCache
	private Map<String, CollectionVariableDescriptor> collectionVariableCache
	
	/**
	 * @param engine Cannot be null
	 */
	new(AdvancedIncQueryEngine engine) {
		checkArgument(engine!=null, "Engine cannot be null!")
		trace('''New instance without parent''')
		init(null, engine)
	}
	
	/**
	 * If you use this constructor the factory will use its parent's IncQueryEngine.
	 * 
	 * @param parent Cannot be null
	 */
	new(UmlValueDescriptorFactory parent) {
		checkArgument(parent!=null, "Parent cannot be null!")
		trace('''New instance with parent''')
		init(parent, parent.engine)
	}
	
	private def init(UmlValueDescriptorFactory parent, AdvancedIncQueryEngine engine) {
		checkArgument(engine!=null)
		this.singleVariableCache = newHashMap()
		this.collectionVariableCache = newHashMap()
		this.parent = parent
		this.engine = engine
		if(parent!=null) {
			factory = new XtumlValueDescriptorFactory(parent.factory)
			this.literalCache = parent.literalCache
		} else {
			factory = new XtumlValueDescriptorFactory(engine)
			this.literalCache = HashBasedTable.create
		}
		mapper = new UmlToXtumlMapper(engine)
	}
	
	
	
	/**
	 * Create a new SingleVariableDescriptor which stringRepresentation won't be the same as 
	 * <code>localVariableName</code> because we need to provide a unique name so it will add 
	 * a unique suffix to the <code>localVariableName</code>. This method caches the returned 
	 * SingleVariableDescriptor to the <code>localVariableName</code> and you can get it through 
	 * {@link UmlValueDescriptorFactory#prepareSingleVariableDescriptorForExistingVariable 
	 * <em>prepareSingleVariableDescriptorForExistingVariable</em>} method.
	 * 
	 * @param type Cannot be null
	 * @param localVariableName Cannot be null
	 * 
	 * @return The SingleVariableDescriptor with the resolved <code>type</code> based on implementation
	 *         and with unique name based on <code>localVariableName</code>
	 */
	dispatch def prepareSingleVariableDescriptorForNewLocalVariable(Type type, String localVariableName, boolean initialize) {
		trace('''Started new local SingleVariableDescriptor creation''')
		val xtumlType = mapper.convertType(type)
		trace('''Resolved type: «xtumlType.name»''')
		var SingleVariableDescriptor svd = null
		if(initialize) {
			svd = factory.prepareSingleVariableDescriptorForNewLocalVariable(xtumlType, localVariableName, initialize);
			// FIXME this should be changed to properly find the generated unique variable name
			var SingleVariableDescriptor uninitializedValueDescriptor
			if(svd.stringRepresentation.startsWith(svd.pointerRepresentation)){
				uninitializedValueDescriptor = factory.prepareSingleVariableDescriptorForExistingVariable(xtumlType, svd.pointerRepresentation);
			} else {
				uninitializedValueDescriptor = factory.prepareSingleVariableDescriptorForExistingVariable(xtumlType, svd.valueRepresentation);
			}
			uninitializedValueDescriptor.cache(localVariableName)
		} else {
			svd = factory.prepareSingleVariableDescriptorForNewLocalVariable(xtumlType, localVariableName, initialize).cache(localVariableName)
		}
		trace('''Finished new local SingleVariableDescriptor creation''')
		return svd
	}
	
	/**
	 * Create a new SingleVariableDescriptor which stringRepresentation won't be the same as 
	 * <code>localVariableName</code> because we need to provide a unique name so it will add 
	 * a unique suffix to the <code>localVariableName</code>. This method caches the returned 
	 * SingleVariableDescriptor to the <code>localVariableName</code> and you can get it through 
	 * {@link UmlValueDescriptorFactory#prepareSingleVariableDescriptorForExistingVariable 
	 * <em>prepareSingleVariableDescriptorForExistingVariable</em>} method.
	 * 
	 * @param signal Cannot be null
	 * @param localVariableName Cannot be null
	 * 
	 * @return The SingleVariableDescriptor with the resolved <code>signal</code> based on implementation
	 *         and with unique name based on <code>localVariableName</code>
	 */
	dispatch def prepareSingleVariableDescriptorForNewLocalVariable(Signal signal, String localVariableName, boolean initialize) {
		trace('''Started new local SingleVariableDescriptor creation''')
		val xtumlSignal = mapper.convertSignal(signal)
		trace('''Resolved signal: «xtumlSignal.name»''')
		val svd = factory.prepareSingleVariableDescriptorForNewLocalVariable(xtumlSignal, localVariableName).cache(localVariableName)
		trace('''Finished new local SingleVariableDescriptor creation''')
		return svd
	}
	
	/**
	 * @return The SingleVariableDescriptor with the resolved type based on implementation and 
	 *         with unique name
	 */
	dispatch def prepareSingleVariableDescriptorForNewLocalVariable(Type type, boolean initialize) {
		trace('''Started new local SingleVariableDescriptor creation''')
		val xtumlType = mapper.convertType(type)
		trace('''Resolved type: «xtumlType.name»''')
		val descriptor = factory.prepareSingleVariableDescriptorForNewLocalVariable(xtumlType, initialize)
		trace('''Finished new local SingleVariableDescriptor creation''')
		return descriptor.cache(descriptor.stringRepresentation)
	}
	
	/**
	 * @return The SingleVariableDescriptor with the resolved signal based on implementation and 
	 *         with unique name
	 */
	dispatch def prepareSingleVariableDescriptorForNewLocalVariable(Signal signal, boolean initialize) {
		trace('''Started new local SingleVariableDescriptor creation''')
		val xtumlEvent = mapper.convertSignal(signal)
		trace('''Resolved signal: «xtumlEvent.name»''')
		val descriptor = factory.prepareSingleVariableDescriptorForNewLocalVariable(xtumlEvent)
		trace('''Finished new local SingleVariableDescriptor creation''')
		return descriptor.cache(descriptor.stringRepresentation)
	}
	
	/**
	 * Create a new SingleVariableDescriptor which stringRepresentation is not necessarily the
	 * same as <code>localVariableName</code> because cached new variables are available also 
	 * through this method. If there is no variable in cache to <code>localVariableName</code> 
	 * a new SVD will be returned which <code>stringRepresentation</code> will be the same as 
	 * <code>localVariableName</code>.
	 * 
	 * @param type Only can be null if the required SVD in cache
	 * @param localVariableName Cannot be null
	 * 
	 * @return The SingleVariableDescriptor with the resolved <code>type</code> based on implementation 
	 *         and with <code>stringRepresentation</code> which can be a unique name if SVD is a cached 
	 *         variable or the same as <code>localVariableName</code> if it is not
	 */
	dispatch def prepareSingleVariableDescriptorForExistingVariable(Type type, String localVariableName) {
		trace('''Started existing local SingleVariableDescriptor creation''')
		val xtumlType = mapper.convertType(type)
		trace('''Resolved type: «xtumlType.name»''')
		var SingleVariableDescriptor svd = null
		if(isSingleVariableInCache(localVariableName)) {
			svd = getSingleVariableFromCache(localVariableName)
		} else {
			svd = factory.prepareSingleVariableDescriptorForExistingVariable(xtumlType, localVariableName).cache(localVariableName)
		}
		trace('''Fnished existing local SingleVariableDescriptor creation''')
		return svd
	}
	
	/**
	 * Create a new SingleVariableDescriptor which stringRepresentation is not necessarily the
	 * same as <code>localVariableName</code> because cached new variables are available also 
	 * through this method. If there is no variable in cache to <code>localVariableName</code> 
	 * a new SVD will be returned which <code>stringRepresentation</code> will be the same as 
	 * <code>localVariableName</code>.
	 * 
	 * @param signal Only can be null if the required SVD in cache
	 * @param localVariableName Cannot be null
	 * 
	 * @return The SingleVariableDescriptor with the resolved <code>signal</code> based on implementation 
	 *         and with <code>stringRepresentation</code> which can be a unique name if SVD is a cached 
	 *         variable or the same as <code>localVariableName</code> if it is not
	 */
	dispatch def prepareSingleVariableDescriptorForExistingVariable(Signal signal, String localVariableName) {
		trace('''Started existing local SingleVariableDescriptor creation''')
		val xtumlType = mapper.convertSignal(signal)
		trace('''Resolved signal: «xtumlType.name»''')
		var SingleVariableDescriptor svd = null
		if(isSingleVariableInCache(localVariableName)) {
			svd = getSingleVariableFromCache(localVariableName)
		} else {
			svd = factory.prepareSingleVariableDescriptorForExistingVariable(xtumlType, localVariableName).cache(localVariableName)
		}
		trace('''Finished existing local SingleVariableDescriptor creation''')
		return svd
	}
	
	/**
	 * @param type Cannot be null and must be convertible to an xtUML type
	 * @param literal Cannot be null and must be parsable if it is a number
	 * 
	 * @return The SingleVariableDescriptor with the resolved type based on implementation 
	 *         and with <code>stringRepresentation</code> which will contain the converted 
	 *         <code>literal</code>
	 */
	def LiteralDescriptor prepareSingleVariableDescriptorForLiteral(Type type, String literal) {
		trace('''Started LiteralDescriptor creation''')
		val xtumlType = mapper.convertType(type)
		trace('''Resolved type: «xtumlType.name»''')
		var LiteralDescriptor ld = null
		if(isLiteralInCache(type, literal)) {
			ld = getLiteralFromCache(type, literal)
		} else {
			ld = factory.prepareSingleVariableDescriptorForLiteral(xtumlType, literal).cache(literal, type)
		}
		trace('''Finished LiteralDescriptor creation''')
		return ld
	}
	
	dispatch def prepareCollectionVariableDescriptorForNewLocalVariable(Type collectionType, Type elementType, String localVariableName) {
		trace('''Started new local CollectionVariableDescriptor creation''')
		val xtumlCollectionType = mapper.decodeCollectionType(collectionType)
		trace('''Decoded collection type: «xtumlCollectionType»''')
		val xtumlElementType = mapper.convertType(elementType)
		trace('''Resolved element type: «xtumlElementType.name»''')
		val cvd = factory.prepareCollectionVariableDescriptorForNewLocalVariable(xtumlCollectionType, xtumlElementType, localVariableName).cache(localVariableName)
		trace('''Finished new local CollectionVariableDescriptor creation''')
		return cvd
	}
	
	dispatch def prepareCollectionVariableDescriptorForNewLocalVariable(Type collectionType, Signal elementType, String localVariableName) {
		trace('''Started new local CollectionVariableDescriptor creation''')
		val xtumlCollectionType = mapper.decodeCollectionType(collectionType)
		trace('''Decoded collection type: «xtumlCollectionType»''')
		val xtumlElementType = mapper.convertSignal(elementType)
		trace('''Resolved element type: «xtumlElementType.name»''')
		val cvd = factory.prepareCollectionVariableDescriptorForNewLocalVariable(xtumlCollectionType, xtumlElementType, localVariableName).cache(localVariableName)
		trace('''Finished new local CollectionVariableDescriptor creation''')
		return cvd
	}
	
	dispatch def prepareCollectionVariableDescriptorForNewLocalVariable(Type collectionType, Type elementType) {
		trace('''Started new local CollectionVariableDescriptor creation''')
		val xtumlCollectionType = mapper.decodeCollectionType(collectionType)
		trace('''Decoded collection type: «xtumlCollectionType»''')
		val xtumlElementType = mapper.convertType(elementType)
		trace('''Resolved element type: «xtumlElementType.name»''')
		val cvd = factory.prepareCollectionVariableDescriptorForNewLocalVariable(xtumlCollectionType, xtumlElementType)
		cvd.cache(cvd.stringRepresentation)
		trace('''Finished new local CollectionVariableDescriptor creation''')
		return cvd
	}
	
	dispatch def prepareCollectionVariableDescriptorForNewLocalVariable(Type collectionType, Signal elementType) {
		trace('''Started new local CollectionVariableDescriptor creation''')
		val xtumlCollectionType = mapper.decodeCollectionType(collectionType)
		trace('''Decoded collection type: «xtumlCollectionType»''')
		val xtumlElementType = mapper.convertSignal(elementType)
		trace('''Resolved element type: «xtumlElementType.name»''')
		val cvd = factory.prepareCollectionVariableDescriptorForNewLocalVariable(xtumlCollectionType, xtumlElementType)
		cvd.cache(cvd.stringRepresentation)
		trace('''Finished new local CollectionVariableDescriptor creation''')
		return cvd
	}
	
	dispatch def prepareCollectionVariableDescriptorForExistingVariable(Type collectionType, Type elementType, String localVariableName) {
		trace('''Started existing local CollectionVariableDescriptor creation''')
		val xtumlCollectionType = mapper.decodeCollectionType(collectionType)
		trace('''Decoded collection type: «xtumlCollectionType»''')
		val xtumlElementType = mapper.convertType(elementType)
		trace('''Resolved element type: «xtumlElementType.name»''')
		var CollectionVariableDescriptor cvd = null
		if(isCollectionVariableInCache(localVariableName)) {
			cvd = getCollectionVariableFromCache(localVariableName)
		} else {
			cvd = factory.prepareCollectionVariableDescriptorForExistingVariable(xtumlCollectionType, xtumlElementType, localVariableName).cache(localVariableName)
		}
		trace('''Finished existing local CollectionVariableDescriptor creation''')
		return cvd
	}
	
	dispatch def prepareCollectionVariableDescriptorForExistingVariable(Type collectionType, Signal elementType, String localVariableName) {
		trace('''Started existing local CollectionVariableDescriptor creation''')
		val xtumlCollectionType = mapper.decodeCollectionType(collectionType)
		trace('''Decoded collection type: «xtumlCollectionType»''')
		val xtumlElementType = mapper.convertSignal(elementType)
		trace('''Resolved element type: «xtumlElementType.name»''')
		var CollectionVariableDescriptor cvd = null
		if(isCollectionVariableInCache(localVariableName)) {
			cvd = getCollectionVariableFromCache(localVariableName)
		} else {
			cvd = factory.prepareCollectionVariableDescriptorForExistingVariable(xtumlCollectionType, xtumlElementType, localVariableName).cache(localVariableName)
		}
		trace('''Finished existing local CollectionVariableDescriptor creation''')
		return cvd
	}	
	
	private def SingleVariableDescriptor cache(SingleVariableDescriptor svd, String variableName) {
		putSingleVariableIntoCache(variableName, svd)
		return svd
	}
	
	private def LiteralDescriptor cache(LiteralDescriptor ld, String literal, Type type) {
		putLiteralIntoCache(type, literal, ld)
		return ld
	}
	
	private def CollectionVariableDescriptor cache(CollectionVariableDescriptor cvd, String variableName) {
		putCollectionVariableIntoCache(variableName, cvd)
		return cvd
	}
		
	override createChild() {
		return new UmlValueDescriptorFactory(this)
	}
	
	override createLiteralDescriptorBuilder() {
		return new UmlLiteralDescriptorBuilder(this)
	}
	
	override createSingleVariableDescriptorBuilder() {
		return new UmlSingleVariableDescriptorBuilder(this)
	}
	
	override createParameterDescriptorBuilder() {
		return new UmlParameterDescriptorBuilder(engine)
	}
	
	override createCollectionVariableDescriptorBuilder() {
		return new UmlCollectionVariableDescriptorBuilder(this)
	}
	
	override createCollectionLiteralBuilder() {
		return new UmlCollectionLiteralBuilder(engine)
	}
	
	override createCastDescriptorBuilder() {
		new UmlCastDescriptorBuilder(engine)
	}
	
	override createPropertyReadBuilder() {
		new UmlPropertyReadBuilder(engine)
	}
	
	override createPropertyWriteBuilder() {
		new UmlPropertyWriteBuilder(engine)
	}
	
	override createOperationCallBuilder() {
		new UmlOperationCallBuilder(this, engine)
	}
	
	override createForeachBuilder() {
		new UmlForeachBuilder(engine)
	}
	
	override createConstructorCallBuilder() {
		new UmlConstructorCallBuilder(engine)
	}
	
	override createStaticOperationCallBuilder() {
		new UmlStaticOperationCallBuilder(engine)
	}
	
	override createCollectionOperationCallBuilder() {
		new UmlCollectionOperationCallBuilder(engine)
	}
	
	override createInstancesBuilder() {
		new UmlInstancesBuilder(engine)
	}
	
	override createLinkUnlinkBuilder() {
		new UmlLinkUnlinkBuilder(this, engine)
	}
	
	override createDeleteBuilder() {
		new UmlDeleteBuilder
	}
	
	override createSendSignalBuilder() {
		new UmlSendSignalBuilder
	}
	
	override createCopyConstructorCallBuilder() {
		new UmlCopyConstructorCallBuilder(engine)
	}
	
	override createSigdataDescriptorBuilder() {
		new UmlSigdataDescriptorBuilder(this)
	}
	
	
	
	override isSingleVariableInCache(String variableName) {
		val inCache = singleVariableCache.containsKey(variableName)
		if(!inCache && parent!=null) {
			return parent.isSingleVariableInCache(variableName)
		}
		if(inCache) {
			trace('''Found a SingleVariableDescriptor in cache for «variableName»''')
		} else {
			trace('''No SingleVariableDescriptor in cache for «variableName»''')
		}
		return inCache
	}
	
	override getSingleVariableFromCache(String variableName) {
		val cached = singleVariableCache.get(variableName)
		if(cached!=null || parent==null) {
			return cached
		}
		return parent.getSingleVariableFromCache(variableName)
	}
	
	override putSingleVariableIntoCache(String variableName, SingleVariableDescriptor descriptor) {
		singleVariableCache.put(variableName, descriptor)
		trace('''SingleVariableDescriptor add to cache with key[«variableName»]''')
		if(variableName!=descriptor.stringRepresentation) {
			trace('''SingleVariableDescriptor add to cache with key[«descriptor.stringRepresentation»]''')
			singleVariableCache.put(descriptor.stringRepresentation, descriptor)
		}
	}
	
	override isLiteralInCache(Type type, String literal) {
		val inCache = literalCache.contains(type, literal)
		if(!inCache && parent!=null) {
			return parent.isLiteralInCache(type, literal)	
		}
		if(inCache) {
			trace('''Found a LiteralDescriptor in cache for type[«type.name»] and value[«literal»]''')
		} else {
			trace('''No LiteralDescriptor in cache for type[«type.name»] and value[«literal»]''')
		}
		return inCache
	}
	
	override getLiteralFromCache(Type type, String literal) {
		val cached = literalCache.get(type, literal)
		if(cached!=null) {
			return cached
		}
		return parent.getLiteralFromCache(type, literal)
	}
	
	override putLiteralIntoCache(Type type, String literal, LiteralDescriptor descriptor) {
		literalCache.put(type, literal, descriptor)
		trace('''LiteralDescriptor add to cache with type[«type.name»] and literal[«literal»]''')
	}
	
	override isCollectionVariableInCache(String variableName) {
		val inCache = collectionVariableCache.containsKey(variableName)
		if(!inCache && parent!=null) {
			return parent.isCollectionVariableInCache(variableName)
		}
		if(inCache) {
			trace('''Found a SingleVariableDescriptor in cache for «variableName»''')
		} else {
			trace('''No SingleVariableDescriptor in cache for «variableName»''')
		}
		return inCache
	}
	
	override getCollectionVariableFromCache(String variableName) {
		val cached = collectionVariableCache.get(variableName)
		if(cached!=null || parent==null) {
			return cached
		}
		return parent.getCollectionVariableFromCache(variableName)
	}
	
	override putCollectionVariableIntoCache(String variableName, CollectionVariableDescriptor descriptor) {
		collectionVariableCache.put(variableName, descriptor)
		trace('''CollectionVariableDescriptor add to cache with key[«variableName»]''')
		if(variableName!=descriptor.stringRepresentation) {
			trace('''CollectionVariableDescriptor add to cache with key[«descriptor.stringRepresentation»]''')
			collectionVariableCache.put(descriptor.stringRepresentation, descriptor)
		}
	}
}