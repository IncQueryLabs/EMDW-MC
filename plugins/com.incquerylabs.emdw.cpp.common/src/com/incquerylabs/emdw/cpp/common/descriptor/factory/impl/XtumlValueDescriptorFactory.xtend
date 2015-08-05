package com.incquerylabs.emdw.cpp.common.descriptor.factory.impl

import com.incquerylabs.emdw.cpp.common.descriptor.mapper.XtumlToOoplMapper
import org.eclipse.incquery.runtime.api.AdvancedIncQueryEngine
import org.eclipse.papyrusrt.xtumlrt.common.Type

import static com.google.common.base.Preconditions.*

class XtumlValueDescriptorFactory {
	private XtumlValueDescriptorFactory parent
	private OOPLValueDescriptorFactory factory
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
			factory = new CPPValueDescriptorFactory(parent.factory)
		} else {
			factory = new CPPValueDescriptorFactory
		}
		mapper = new XtumlToOoplMapper(engine)
	}
	
	
	
	/**
	 * @param type Cannot be null
	 * @param localVariableName Cannot be null
	 * 
	 * @return The SingleValueDescriptor with the resolved <code>type</code> based on implementation
	 *         and with unique name based on <code>localVariableName</code>
	 */
	def prepareSingleValueDescriptorForNewLocalVariable(Type type, String localVariableName) {
		checkArgument(type!=null, "Type cannot be null")
		val ooplType = mapper.convertType(type)
		return factory.prepareSingleValueDescriptorForNewLocalVariable(ooplType, localVariableName)
	}
	
	/**
	 * @param type Cannot be null
	 * 
	 * @return The SingleValueDescriptor with the resolved <code>type</code> based on implementation
	 *         and with unique name
	 */
	def prepareSingleValueDescriptorForNewLocalVariable(Type type) {
		checkArgument(type!=null, "Type cannot be null")
		val ooplType = mapper.convertType(type)
		return factory.prepareSingleValueDescriptorForNewLocalVariable(ooplType)
	}
	
	/**
	 * @param type Cannot be null
	 * @param localVariableName Cannot be null
	 * 
	 * @return The SingleValueDescriptor with the resolved <code>type</code> based on implementation
	 *         and with <code>stringRepresentation</code> which is the same as <code>localVariableName</code>
	 */
	def prepareSingleValueDescriptorForExistingVariable(Type type, String localVariableName) {
		checkArgument(type!=null, "Type cannot be null")
		val ooplType = mapper.convertType(type)
		return factory.prepareSingleValueDescriptorForExistingVariable(ooplType, localVariableName)
	}
	
	/**
	 * @param type Cannot be null and must be convertible to an OOPL type
	 * @param literal Cannot be null and must be parsable if it is a number
	 * 
	 * @return The SingleValueDescriptor with the resolved type based on implementation 
	 *         and with <code>stringRepresentation</code> which will contain the converted 
	 *         <code>literal</code>
	 */
	def prepareSingleValueDescriptorForLiteral(Type type, String literal) {
		checkArgument(type!=null, "Type cannot be null")
		val ooplType = mapper.convertType(type)
		return factory.prepareSingleValueDescriptorForLiteral(ooplType, literal)
	}

}