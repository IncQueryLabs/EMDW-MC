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
import com.ericsson.xtumlrt.oopl.SequenceOrderednessKind
import com.ericsson.xtumlrt.oopl.SequenceUniquenessKind
import com.ericsson.xtumlrt.oopl.AssociativeCollectionKind
import com.ericsson.xtumlrt.oopl.SimpleCollectionKind

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
		switch collection {
			case "set" : engine.ooplSequenceImplementations.allValuesOfimplementation.findFirst[
				orderedness == SequenceOrderednessKind.UNORDERED &&
				uniqueness == SequenceUniquenessKind.UNIQUE
			]
			case "bag" : engine.ooplSequenceImplementations.allValuesOfimplementation.findFirst[
				orderedness == SequenceOrderednessKind.UNORDERED &&
				uniqueness == SequenceUniquenessKind.NON_UNIQUE
			]
			case "sequence" : engine.ooplSequenceImplementations.allValuesOfimplementation.findFirst[
				orderedness == SequenceOrderednessKind.ORDERED &&
				uniqueness == SequenceUniquenessKind.NON_UNIQUE
			]
		}
	}
	
	def findClassRefCollectionImplementation(String collection) {
		switch collection {
			case "set" : engine.ooplClassReferenceAssocCollectionImplementations.allValuesOfimplementation.findFirst[
				// TODO: This should be unordered set, but currently default implementation is only available for the ordered version
				// in c++ ::std::set is the ordered version
				kind == AssociativeCollectionKind.ORDERED_SET
			]
			case "bag" : engine.ooplClassReferenceAssocCollectionImplementations.allValuesOfimplementation.findFirst[
				// TODO: This should be unordered multiset, but currently default implementation is only available for the ordered version
				// in c++ ::std::multiset is the ordered version
				kind == AssociativeCollectionKind.ORDERED_MULTISET
			]
			case "sequence" : engine.ooplClassReferenceSimpleCollectionImplementations.allValuesOfimplementation.findFirst[
				kind == SimpleCollectionKind.SIMPLY_LINKED_LIST
			]
		}
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