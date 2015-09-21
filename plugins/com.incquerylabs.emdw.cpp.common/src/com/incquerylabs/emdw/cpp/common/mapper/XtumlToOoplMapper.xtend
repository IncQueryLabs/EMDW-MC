package com.incquerylabs.emdw.cpp.common.mapper

import com.ericsson.xtumlrt.oopl.OOPLBasicType
import com.ericsson.xtumlrt.oopl.OOPLType
import com.incquerylabs.emdw.cpp.common.mapper.queries.XtumlQueries
import org.eclipse.incquery.runtime.api.AdvancedIncQueryEngine
import org.eclipse.papyrusrt.xtumlrt.common.Attribute
import org.eclipse.papyrusrt.xtumlrt.common.Operation
import org.eclipse.papyrusrt.xtumlrt.common.Type
import org.eclipse.papyrusrt.xtumlrt.xtuml.XTAssociation
import org.eclipse.papyrusrt.xtumlrt.xtuml.XTEvent
import com.ericsson.xtumlrt.oopl.cppmodel.CPPEvent

class XtumlToOoplMapper {
	extension XtumlQueries xtumlQueries = XtumlQueries.instance
	private AdvancedIncQueryEngine engine
	
	/**
	 * @param engine Cannot be null
	 */
	new(AdvancedIncQueryEngine engine) {
		this.engine = engine
		xtumlQueries.prepare(engine)
	}
	
	/**
	 * @param type Cannot be null
	 * 
	 * @return The OOPL pair of the xtUML <code>type</code>
	 */
	def convertType(Type type) {
		engine.ooplType2Type.getAllValuesOfooplType(type).head
	}
	
	def convertEvent(XTEvent event) {
		engine.cppevent2XtEvent.getAllValuesOfcppEvent(event).head
	}
	
	def convertAttribute(Attribute attribute) {
		return engine.cppAttribute2Attribute.getAllValuesOfooplAttribute(attribute)?.head
	}
	
	def convertAssociation(XTAssociation association) {
		return engine.ooplAssociation2Association.getAllValuesOfooplRelation(association)?.head
	}
	
	def convertOperation(Operation operation) {
		return engine.cppOperation2Operation.getAllValuesOfcppOperation(operation).head
	}
	
	def findBasicType(String primitiveType) {
		return engine.cppPrimitiveTypes.allValuesOfbasicType.findFirst[bt | primitiveType.equals(bt.cppName)]
	}
	
	def findSequenceCollectionImplementation(String collection) {
		return engine.ooplSequenceImplementations.allValuesOfimplementation.findFirst[si | collection.equals(si.containerQualifiedName)]
	}
	
	def findClassRefCollectionImplementation(String collection) {
		return engine.ooplClassReferenceSimpleCollectionImplementations.allValuesOfimplementation.findFirst[crsci | collection.equals(crsci.containerQualifiedName)]
	}
	
	def dispatch findCollectionImplementation(String collection, OOPLBasicType basicType) {
		return collection.findSequenceCollectionImplementation
	}
	
	def dispatch findCollectionImplementation(String collection, OOPLType type) {
		return collection.findClassRefCollectionImplementation
	}
	
	def dispatch findCollectionImplementation(String collection, CPPEvent type) {
		return collection.findClassRefCollectionImplementation
	}
	
	def isHiddenByChild(Operation operation) {
		return !engine.childrenWhichHasSameNameOperation.getAllValuesOftype(operation).empty
	}
}