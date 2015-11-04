package com.incquerylabs.emdw.cpp.app

import com.ericsson.xtumlrt.oopl.OoplFactory
import com.ericsson.xtumlrt.oopl.cppmodel.CPPModel
import com.ericsson.xtumlrt.oopl.cppmodel.CppmodelFactory
import com.incquerylabs.emdw.umlintegration.trace.RootMapping
import com.incquerylabs.emdw.umlintegration.trace.TraceFactory
import org.eclipse.emf.common.util.URI
import org.eclipse.emf.ecore.EObject
import org.eclipse.emf.ecore.resource.Resource
import org.eclipse.emf.ecore.resource.ResourceSet
import org.eclipse.papyrusrt.xtumlrt.common.CommonFactory
import org.eclipse.uml2.uml.Model
import org.eclipse.uml2.uml.PrimitiveType
import org.eclipse.uml2.uml.Type
import org.eclipse.uml2.uml.resource.UMLResource
import org.eclipse.uml2.uml.resources.util.UMLResourcesUtil

class ResourceManager {
	public static final String COMMON_PRIMITIVE_TYPES_PATH = "/org.eclipse.papyrusrt.xtumlrt.common.model/model/umlPrimitiveTypes.common"
	private static final String MODEL_GENERATION_DIRECTORY_NAME = "model"
	
	private val String targetFolderPath
	
	private val CommonFactory commonFactory = CommonFactory.eINSTANCE
	private val TraceFactory traceFactory = TraceFactory.eINSTANCE
	private val OoplFactory ooplFactory = OoplFactory.eINSTANCE
	private val CppmodelFactory cppFactory = CppmodelFactory.eINSTANCE
	
	private val ResourceSet resourceSet
	private val Resource umlResource
	private var Resource xumlrtResource
	private var Resource traceResource
	private var Resource cppmodelResource
	private var CPPModel cppModel
	
	new(ResourceSet resourceSet, String umlPath, String targetFolderPath) {
		this.resourceSet = resourceSet
		val uri = URI.createFileURI(umlPath)
		umlResource = this.resourceSet.createResource(uri) => [ 
			load(#{})
		]
		
		UMLResourcesUtil.init(resourceSet)
		this.targetFolderPath = targetFolderPath
	}
	
	def createPrimitiveTypeMapping(String umlPrimitiveTypes) {
		val primitiveTypeMapping = <Type, org.eclipse.papyrusrt.xtumlrt.common.Type>newHashMap
		
		val commonTypesResource = resourceSet.getResource(URI.createURI(umlPrimitiveTypes), true) => [ load(#{}) ]
		val commonTypesModel = commonTypesResource.contents.head as org.eclipse.papyrusrt.xtumlrt.common.Model
		val commonTypes = commonTypesModel.packages.head.typeDefinitions.map[td|td.type]
		
		val umlTypesResource = resourceSet.getResource(URI.createURI(UMLResource.UML_PRIMITIVE_TYPES_LIBRARY_URI), true) => [ load(#{}) ]
		val model = umlTypesResource.contents.filter(Model).head
		val umlTypes = model.packagedElements.filter(PrimitiveType)
		
		commonTypes.forEach[type|
			// Here the void xtUML type is put into the map with null key because 
			// UML null types are mapped to void in xtUML as there is no void UML basic type.
			val umlType = umlTypes.filter[umlType | umlType.name.equals(type.name)].head
			primitiveTypeMapping.put(umlType, type)
		]
		primitiveTypeMapping
	}
	
	def RootMapping createRootMapping() {
		val umlModel = umlResource.contents.filter(Model).head
		
		val myuri = URI.createFileURI('''«modelTargetFolderPath»/«umlModel.name»''')
		val RESULT_PATH = myuri.toFileString
		
		// Create xtuml resource with xtuml model
		val xumlrtModel = commonFactory.createModel => [
			name = umlModel.name
		]
		xumlrtResource = resourceSet.createResource(RESULT_PATH, "xtuml", xumlrtModel)
		
		// Create trace resource with trace model
		val mapping = traceFactory.createRootMapping => [
			umlRoot = umlModel
			xtumlrtRoot = xumlrtModel
		]
		traceResource = resourceSet.createResource(RESULT_PATH, "trace", mapping)
		
		// Create cpp resource with cpp model
		val nameProvider = ooplFactory.createOOPLExistingNameProvider=>[commonNamedElement = xumlrtModel ]
		cppModel = cppFactory.createCPPModel => [
			commonModel = xumlrtModel
			ooplNameProvider = nameProvider
		]
		cppmodelResource = resourceSet.createResource(RESULT_PATH, "cppmodel", cppModel)
		
		// Add root directory and external library
		val makeRulesFile = cppFactory.createCPPMakeFile
		val modelDir = cppFactory.createCPPDirectory => [
			it.makeRulesFile = makeRulesFile
			it.files += makeRulesFile
		]
		cppmodelResource.contents += modelDir
		cppmodelResource.contents += cppFactory.createCPPExternalLibrary
		cppModel.headerDir = modelDir
		cppModel.bodyDir = modelDir
		
		mapping
	}
	
	def void saveResources() {
		xumlrtResource.save(null)
		traceResource.save(null)
		cppmodelResource.save(null)
	}
	
	private def String getModelTargetFolderPath() {
		return '''«targetFolderPath»/«MODEL_GENERATION_DIRECTORY_NAME»'''
	}
	
	private def createResource(ResourceSet resourceSet, String resultPath, String fileExtension, EObject root) {
		val uriWithoutExtension = URI.createFileURI(resultPath).trimFileExtension
		val uri = uriWithoutExtension.appendFileExtension(fileExtension)
		val resource = resourceSet.createResource(uri)
		resource.contents += root
		resource
	}
}