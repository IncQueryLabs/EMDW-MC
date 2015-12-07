package com.incquerylabs.emdw.toolchain.mwe2integration.steps

import com.ericsson.xtumlrt.oopl.OoplFactory
import com.ericsson.xtumlrt.oopl.OoplQueryBasedFeatures
import com.ericsson.xtumlrt.oopl.cppmodel.CPPModel
import com.ericsson.xtumlrt.oopl.cppmodel.CppmodelFactory
import com.ericsson.xtumlrt.oopl.cppmodel.derived.QueryBasedFeatures
import com.incquerylabs.emdw.cpp.bodyconverter.transformation.impl.queries.UmlXumlrtMappingQueries
import com.incquerylabs.emdw.cpp.codegeneration.fsa.impl.JavaIOBasedFileManager
import com.incquerylabs.emdw.cpp.codegeneration.queries.CppCodeGenerationQueries
import com.incquerylabs.emdw.cpp.codegeneration.queries.CppFileAndDirectoryQueries
import com.incquerylabs.emdw.cpp.common.EMDWConstants
import com.incquerylabs.emdw.cpp.common.mapper.queries.UmlQueries
import com.incquerylabs.emdw.cpp.transformation.queries.CppQueries
import com.incquerylabs.emdw.cpp.transformation.queries.MonitorQueries
import com.incquerylabs.emdw.cpp.transformation.queries.XtumlQueries
import com.incquerylabs.emdw.umlintegration.queries.CppExtensionQueries
import com.incquerylabs.emdw.umlintegration.queries.StateMachine
import com.incquerylabs.emdw.umlintegration.queries.Structure
import com.incquerylabs.emdw.umlintegration.queries.Trace
import com.incquerylabs.emdw.umlintegration.trace.TraceFactory
import com.incquerylabs.emdw.xtuml.incquery.XtumlValidationQueries
import java.util.Arrays
import java.util.List
import java.util.Map
import org.eclipse.emf.common.util.URI
import org.eclipse.emf.ecore.EObject
import org.eclipse.emf.ecore.resource.Resource
import org.eclipse.emf.ecore.resource.ResourceSet
import org.eclipse.emf.ecore.resource.URIConverter
import org.eclipse.emf.ecore.resource.impl.ResourceSetImpl
import org.eclipse.emf.mwe2.runtime.workflow.IWorkflowComponent
import org.eclipse.emf.mwe2.runtime.workflow.IWorkflowContext
import org.eclipse.incquery.runtime.api.AdvancedIncQueryEngine
import org.eclipse.incquery.runtime.api.GenericPatternGroup
import org.eclipse.incquery.runtime.api.IncQueryEngine
import org.eclipse.incquery.runtime.base.api.BaseIndexOptions
import org.eclipse.incquery.runtime.emf.EMFScope
import org.eclipse.incquery.runtime.exception.IncQueryException
import org.eclipse.papyrusrt.xtumlrt.common.CommonFactory
import org.eclipse.uml2.uml.Model
import org.eclipse.uml2.uml.PrimitiveType
import org.eclipse.uml2.uml.Type
import org.eclipse.uml2.uml.resource.UMLResource
import org.eclipse.uml2.uml.resources.util.UMLResourcesUtil
import org.eclipse.xtend.lib.annotations.Accessors

import static com.google.common.base.Preconditions.*

class PlainJavaInitializerComponent implements IWorkflowComponent {
	
	static val TOOLCHAIN_QUERIES = GenericPatternGroup.of(
			StateMachine.instance,
			Structure.instance,
			Trace.instance,
			CppExtensionQueries.instance,
			XtumlValidationQueries.instance,
			UmlQueries.instance,
			com.incquerylabs.emdw.cpp.common.mapper.queries.XtumlQueries.instance,
			XtumlQueries.instance,
			MonitorQueries.instance,
			CppQueries.instance,
			CppCodeGenerationQueries.instance,
			CppFileAndDirectoryQueries.instance,
			UmlXumlrtMappingQueries.instance,
			OoplQueryBasedFeatures.instance,
			QueryBasedFeatures.instance
		)
	
	private static final List<String> INDEXED_AUTHORITIES = Arrays.asList("UML_LIBRARIES", "RALF",
			"XUMLRT_PROFILE", "EMDW");
	static val PATHMAP_SCHEME = "pathmap";
	private static final String MODEL_GENERATION_DIRECTORY_NAME = "model"
	
	@Accessors String targetFolderPath
	@Accessors String umlModelPath
	
	String generationProjectName
	IncQueryEngine engine
	Map<Type, org.eclipse.papyrusrt.xtumlrt.common.Type> primitiveTypeMapping
	
	extension CommonFactory commonFactory = CommonFactory.eINSTANCE
	extension TraceFactory traceFactory = TraceFactory.eINSTANCE
	extension OoplFactory ooplFactory = OoplFactory.eINSTANCE
	extension CppmodelFactory cppFactory = CppmodelFactory.eINSTANCE
	
	
	var Resource xumlrtResource
	var Resource traceResource
	var Resource cppmodelResource
	var CPPModel cppModel
	

	override void preInvoke() {
	}

	override void invoke(IWorkflowContext ctx) {
		if(ctx.get("targetFolderPath")!=null){
			this.targetFolderPath = ctx.get("targetFolderPath") as String
		}
		if(ctx.get("umlModelPath")!=null){
			this.umlModelPath = ctx.get("umlModelPath") as String
		}
		
		val resourceSet = new ResourceSetImpl
		resourceSet.URIConverter = URIConverter::INSTANCE
		UMLResourcesUtil.init(resourceSet)
		
		val umlResource = resourceSet.createResource(URI.createFileURI(umlModelPath))
		umlResource.load(null)
		val umlModel = umlResource.contents.filter(Model).head
		generationProjectName = targetFolderPath + umlModel.name
		
		val mapping = resourceSet.createRootMapping(umlResource)
		
		
		primitiveTypeMapping = resourceSet.createPrimitiveTypeMapping(URI::createURI(EMDWConstants.XUMLRT_PRIMITIVE_TYPES_LIBRARY_PATH))
		
		checkNotNull(mapping.xtumlrtRoot, "xUML-RT Model cannot be null!")
		if(engine == null) {
			engine = createDefaultEngine(mapping.xtumlrtRoot.eResource.resourceSet)
		}
		
		TOOLCHAIN_QUERIES.prepare(engine)
		
		val fileManager = new JavaIOBasedFileManager('''«targetFolderPath»''')
		fileManager.createDirectory("/code")
		val targetFolderLocation = targetFolderPath+"/code"
			
		ctx.put("engine", engine)
		ctx.put("primitiveTypeMapping", primitiveTypeMapping)
		ctx.put("xumlrtResource", xumlrtResource)
		ctx.put("traceResource", traceResource)
		ctx.put("cppmodelResource", cppmodelResource)
		ctx.put("cppModel", cppModel)
		ctx.put("targetFolderLocation", targetFolderLocation)
		
	}
	
	private def String getModelTargetFolderPath() {
		return '''«targetFolderPath»/«MODEL_GENERATION_DIRECTORY_NAME»'''
	}

	override void postInvoke() {
	}
	
	private def createRootMapping(ResourceSet resourceSet, Resource umlResource) {
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
	
	def createDefaultEngine(ResourceSet resourceSet) throws IncQueryException {

		val options = new BaseIndexOptions().withResourceFilterConfiguration([
			val uri = getURI();
			if (INDEXED_AUTHORITIES.contains(uri.authority())) {
				return false;
			}
			return PATHMAP_SCHEME.equals(uri.scheme());
		]);
		val scope = new EMFScope(resourceSet, options);
		val engine = AdvancedIncQueryEngine.createUnmanagedEngine(scope);
		return engine;
	}
	
	private def createPrimitiveTypeMapping(ResourceSet rs, URI primitiveUri){
		val primitiveTypeMapping = <Type, org.eclipse.papyrusrt.xtumlrt.common.Type>newHashMap
		
		val commonTypesResource = rs.getResource(primitiveUri, true)
		val commonTypesModel = commonTypesResource.contents.head as org.eclipse.papyrusrt.xtumlrt.common.Model
		val commonTypes = commonTypesModel.packages.head.typeDefinitions.map[td|td.type]
		
		val umlTypesResource = rs.getResource(URI.createURI(UMLResource.UML_PRIMITIVE_TYPES_LIBRARY_URI, false), true)
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
	
	private def createResource(ResourceSet resourceSet, String resultPath, String fileExtension, EObject root) {
		val uriWithoutExtension = URI.createFileURI(resultPath).trimFileExtension
		val uri = uriWithoutExtension.appendFileExtension(fileExtension)
		val resource = resourceSet.createResource(uri)
		resource.contents += root
		resource
	}
		
//	private def void initializePathmaps() {
//		resourcesMap = #{
//			URI::createURI(EMDWConstants::CPP_BASIC_TYPES_LIBRARY_PATH)			->	URI::createFileURI(cppBasicTypesPath),
//			URI::createURI(EMDWConstants::CPP_COLLECTIONS_LIBRARY_PATH)			->	URI::createFileURI(cppCollectionsPath),
//			URI::createURI(EMDWConstants::CPP_RUNTIME_LIBRARY_PATH)				->	URI::createFileURI(cppRuntimePath),
//			URI::createURI(EMDWConstants::XUMLRT_PRIMITIVE_TYPES_LIBRARY_PATH)	->	URI::createFileURI(xumlRTTypesPath),
//			URI::createURI(EMDWConstants::CPP_RALF_MODELS_PATH)					->	URI::createFileURI(xumlRTTypesPath)
//		}
//
//		resourcesMap.forEach[pathmapPath, locationPath|
//			URIConverter.URI_MAP.put(
//				pathmapPath,
//				locationPath
//			)			
//		]
//	}	
}
