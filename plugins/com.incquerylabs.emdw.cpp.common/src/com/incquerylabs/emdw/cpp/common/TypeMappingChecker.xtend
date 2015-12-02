package com.incquerylabs.emdw.cpp.common

import com.incquerylabs.emdw.cpp.common.queries.CheckerQueries
import java.text.MessageFormat
import java.util.Map
import org.eclipse.emf.ecore.resource.Resource
import org.eclipse.emf.ecore.resource.ResourceSet
import org.eclipse.incquery.runtime.api.AdvancedIncQueryEngine
import org.eclipse.uml2.uml.Type

class TypeMappingChecker {
	static extension val CheckerQueries checkerQueries = CheckerQueries.instance
	
	public static def checkUmlXumlTypeMapping(AdvancedIncQueryEngine engine, Map<Type, org.eclipse.papyrusrt.xtumlrt.common.Type> primitiveTypeMapping) throws TypeMappingCheckerException {
		EMDWConstants.SUPPORTED_UML_PRIMITIVE_TYPES.forEach[ qn |
			val match = engine.umlPrimitiveTypeByQualifiedName.getOneArbitraryMatch(null, qn)
			if(match==null) {
				throw new TypeMappingCheckerException('''Missing uml primitive type: «qn»''')				
			}
			val pt = match.primitiveType
			val xpt = primitiveTypeMapping.get(pt)
			if(xpt==null) {
				throw new TypeMappingCheckerException('''Missing xtuml primitive type from mapping: «pt.name»''')
			}
		]
		val voidPT = primitiveTypeMapping.get(null)
		if(voidPT==null) {
			throw new TypeMappingCheckerException('''Missing xtuml primitive type from mapping: Void''')			
		}
	}
	
	public static def checkCppBasicTypes(AdvancedIncQueryEngine engine) throws TypeMappingCheckerException {
		EMDWConstants.SUPPORTED_UML_PRIMITIVE_TYPES.forEach[ qn |
			val match = engine.umlPrimitiveTypeByQualifiedName.getOneArbitraryMatch(null, qn)
			if(match==null) {
				throw new TypeMappingCheckerException('''Missing uml primitive type: «qn»''')				
			}
			val pt = match.primitiveType
			val basicType = engine.cppBasicTypeForUmlPrimitiveType.getAllValuesOfbasicType(pt).head
			if(basicType==null) {
				throw new TypeMappingCheckerException('''Missing CPPBasicType for «pt.name»''')				
			}
		]
	}
	
	public static def checkCppCollections(AdvancedIncQueryEngine engine) throws TypeMappingCheckerException {
		EMDWConstants.SUPPORTED_OOPL_SEQUENCES.forEach[ p |
			val match = engine.ooplSequenceImplementation.getOneArbitraryMatch(null, p.key, p.value)
			if(match==null) {
				throwMissingCollectionException('''«p.key.getName», «p.value.getName»''', "OOPLSequenceImplementation")
			}
		]
		EMDWConstants.SUPPORTED_OOPL_ASSOC_COLLECTIONS.forEach[ kind |
			val match = engine.ooplClassRefAssocImplementation.getOneArbitraryMatch(null, kind)
			if(match==null) {
				throwMissingCollectionException(kind.getName, "OOPLClassRefAssocCollectionImplementation")
			}
		]
		EMDWConstants.SUPPORTED_OOPL_SIMPLE_COLLECTION.forEach[ kind |
			val match = engine.ooplClassRefSimpleImplementation.getOneArbitraryMatch(null, kind)
			if(match==null) {
				throwMissingCollectionException(kind.getName, "OOPLClassRefSimpleCollectionImplementation")
			}
		]
	}
	
	public static def Resource resourceBasicCheck(ResourceSet rs, String modelPath) throws TypeMappingCheckerException {
		val resource = rs.resources.findFirst[modelPath.equals(it.URI)]
		if(resource==null) {
			throwMissingModelException(modelPath)
		}
		if(resource.allContents.isNullOrEmpty) {
			throwEmptyModelException(modelPath)
		}
		return resource
		
	}
	
	private static def void throwMissingModelException(String modelPath) throws TypeMappingCheckerException {
		throw new TypeMappingCheckerException(
				MessageFormat.format(
					TypeMappingCheckerException.messages.MISSING_MODEL, 
					modelPath
			)
		)
	}
	
	private static def void throwEmptyModelException(String modelPath) throws TypeMappingCheckerException {
		throw new TypeMappingCheckerException(
				MessageFormat.format(
					TypeMappingCheckerException.messages.EMPTY_MODEL, 
					modelPath
			)
		)
	}
	
	private static def void throwMissingCollectionException(String kind, String type) throws TypeMappingCheckerException {
		throw new TypeMappingCheckerException(
				MessageFormat.format(
					TypeMappingCheckerException.messages.MISSING_COLLECTION, 
					kind, 
					type
			)
		)
	}
}