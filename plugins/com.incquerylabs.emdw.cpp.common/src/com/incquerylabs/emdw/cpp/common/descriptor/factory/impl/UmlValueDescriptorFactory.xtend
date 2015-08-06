package com.incquerylabs.emdw.cpp.common.descriptor.factory.impl

import com.google.common.collect.HashBasedTable
import com.google.common.collect.Table
import com.incquerylabs.emdw.cpp.common.descriptor.IDescriptorCacheManager
import com.incquerylabs.emdw.cpp.common.descriptor.builder.impl.UmlSingleVariableDescriptorBuilder
import com.incquerylabs.emdw.cpp.common.descriptor.factory.IUmlDescriptorFactory
import com.incquerylabs.emdw.cpp.common.mapper.UmlToXtumlMapper
import com.incquerylabs.emdw.valuedescriptor.SingleVariableDescriptor
import java.util.Map
import org.eclipse.incquery.runtime.api.AdvancedIncQueryEngine
import org.eclipse.uml2.uml.Type

import static com.google.common.base.Preconditions.*

class UmlValueDescriptorFactory implements IUmlDescriptorFactory, IDescriptorCacheManager{
	private UmlValueDescriptorFactory parent
	private XtumlValueDescriptorFactory factory
	private UmlToXtumlMapper mapper
	private AdvancedIncQueryEngine engine
	private Map<String, SingleVariableDescriptor> singleVariableCache
	private Table<Type, String, SingleVariableDescriptor> literalCache
	
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
	new(UmlValueDescriptorFactory parent) {
		checkArgument(parent!=null, "Parent cannot be null!")
		init(parent, parent.engine)
	}
	
	private def init(UmlValueDescriptorFactory parent, AdvancedIncQueryEngine engine) {
		checkArgument(engine!=null)
		this.singleVariableCache = newHashMap()
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
	 * a unique prefix to the <code>localVariableName</code>. This method caches the returned 
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
	def prepareSingleVariableDescriptorForNewLocalVariable(Type type, String localVariableName) {
		val xtumlType = mapper.convertType(type)
		return factory.prepareSingleVariableDescriptorForNewLocalVariable(xtumlType, localVariableName).cache(localVariableName)
	}
	
	/**
	 * @return The SingleVariableDescriptor with the resolved type based on implementation and 
	 *         with unique name
	 */
	def prepareSingleVariableDescriptorForNewLocalVariable(Type type) {
		val xtumlType = mapper.convertType(type)
		return factory.prepareSingleVariableDescriptorForNewLocalVariable(xtumlType)
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
	def prepareSingleVariableDescriptorForExistingVariable(Type type, String localVariableName) {
		val xtumlType = mapper.convertType(type)
		if(isSingleVariableInCache(localVariableName)) {
			return getSingleVariableFromCache(localVariableName)
		}
		return factory.prepareSingleVariableDescriptorForExistingVariable(xtumlType, localVariableName).cache(localVariableName)
	}
	
	/**
	 * @param type Cannot be null and must be convertible to an xtUML type
	 * @param literal Cannot be null and must be parsable if it is a number
	 * 
	 * @return The SingleVariableDescriptor with the resolved type based on implementation 
	 *         and with <code>stringRepresentation</code> which will contain the converted 
	 *         <code>literal</code>
	 */
	def prepareSingleVariableDescriptorForLiteral(Type type, String literal) {
		val xtumlType = mapper.convertType(type)
		if(isLiteralInCache(type, literal)) {
			return getLiteralFromCache(type, literal)
		}
		return factory.prepareSingleVariableDescriptorForLiteral(xtumlType, literal).cache(literal, type)
	}
	
	
	
	private def SingleVariableDescriptor cache(SingleVariableDescriptor svd, String variableName) {
		putSingleVariableIntoCache(variableName, svd)
		return svd
	}
	
	private def SingleVariableDescriptor cache(SingleVariableDescriptor svd, String literal, Type type) {
		putLiteralIntoCache(type, literal, svd)
		return svd
	}
	
	
	
	override createSingleVariableDescriptorBuilder() {
		return new UmlSingleVariableDescriptorBuilder(this)
	}
	
	override createCollectionVariableDescriptorBuilder() {
		throw new UnsupportedOperationException("TODO: auto-generated method stub")
	}
	
	override createChild() {
		return new UmlValueDescriptorFactory(this)
	}
	
	
	
	override isSingleVariableInCache(String variableName) {
		return singleVariableCache.containsKey(variableName)
	}
	
	override getSingleVariableFromCache(String variableName) {
		return singleVariableCache.get(variableName)
	}
	
	override putSingleVariableIntoCache(String variableName, SingleVariableDescriptor descriptor) {
		singleVariableCache.put(variableName, descriptor)
	}
	
	override isLiteralInCache(Type type, String literal) {
		return literalCache.contains(type, literal)
	}
	
	override getLiteralFromCache(Type type, String literal) {
		return literalCache.get(type, literal)
	}
	
	override putLiteralIntoCache(Type type, String literal, SingleVariableDescriptor descriptor) {
		literalCache.put(type, literal, descriptor)
	}
	
}