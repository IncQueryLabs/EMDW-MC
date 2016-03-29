/*******************************************************************************
 * Copyright (c) 2015-2016, IncQuery Labs Ltd. and Ericsson AB
 * All rights reserved. This program and the accompanying materials
 * are made available under the terms of the Eclipse Public License v1.0
 * which accompanies this distribution, and is available at
 * http://www.eclipse.org/legal/epl-v10.html
 *
 * Contributors:
 *   Akos Horvath, Abel Hegedus, Zoltan Ujhelyi, Daniel Segesdi, Tamas Borbas, Robert Doczi, Peter Lunk - initial API and implementation
 *******************************************************************************/
package com.incquerylabs.emdw.cpp.app

import com.ericsson.xtumlrt.oopl.OoplPackage
import com.ericsson.xtumlrt.oopl.OoplQueryBasedFeatures
import com.ericsson.xtumlrt.oopl.cppmodel.CppmodelPackage
import com.ericsson.xtumlrt.oopl.cppmodel.derived.QueryBasedFeatures
import com.incquerylabs.emdw.cpp.codegeneration.fsa.impl.JarFileManager
import com.incquerylabs.emdw.cpp.codegeneration.fsa.impl.JavaIOBasedFileManager
import com.incquerylabs.emdw.cpp.common.util.EMDWNullProgressMonitor
import com.incquerylabs.emdw.toolchain.Toolchain
import com.incquerylabs.emdw.toolchain.ToolchainBuilder
import com.incquerylabs.emdw.umlintegration.trace.TracePackage
import com.incquerylabs.uml.ralf.ReducedAlfLanguageStandaloneSetup
import java.io.IOException
import java.net.URL
import java.util.List
import org.apache.log4j.FileAppender
import org.apache.log4j.Level
import org.apache.log4j.Logger
import org.apache.log4j.PatternLayout
import org.eclipse.emf.common.util.URI
import org.eclipse.emf.ecore.EStructuralFeature
import org.eclipse.emf.ecore.resource.Resource
import org.eclipse.emf.ecore.resource.ResourceSet
import org.eclipse.emf.ecore.resource.impl.ResourceSetImpl
import org.eclipse.emf.ecore.xmi.impl.EcoreResourceFactoryImpl
import org.eclipse.emf.ecore.xmi.impl.XMIResourceFactoryImpl
import org.eclipse.incquery.querybasedfeatures.runtime.QueryBasedFeatureSettingDelegateFactory
import org.eclipse.incquery.runtime.api.IPatternMatch
import org.eclipse.incquery.runtime.api.IQuerySpecification
import org.eclipse.incquery.runtime.api.IncQueryMatcher
import org.eclipse.incquery.runtime.extensibility.QuerySpecificationRegistry
import org.eclipse.papyrusrt.xtumlrt.common.CommonPackage
import org.eclipse.papyrusrt.xtumlrt.xtuml.XtumlPackage
import org.eclipse.uml2.uml.UMLPackage
import org.eclipse.uml2.uml.resource.UMLResource
import org.eclipse.emf.ecore.resource.URIConverter
import com.incquerylabs.emdw.cpp.common.EMDWConstants
import hu.eltesoft.modelexecution.profile.xumlrt.XUMLRTPackage
import org.eclipse.uml2.uml.UMLPlugin
import java.util.Map
import org.eclipse.incquery.uml.IncQueryUMLStandaloneSetup

class EMDWApplication {
	private static final String APP_NAME = "EMDW-MC Application"
	private static final String ARGS_HELP = 
	'''
	We need these arguments:
	 * first arg: uml model path
	 * second arg: target folder for generated code and log
	'''
	private static final String LOGGER_FOLDER = "log"
	private static final String COMMON_LAYOUT = "%30.30c - %m%n"
	private static final String FILE_LOG_LAYOUT_PREFIX = "[%d{MMM/dd HH:mm:ss}] "
	
	public static final Map<URI,URI> RESOURCES = <URI,URI>newHashMap
	
	
	def static void main(String[] args) {
		System.out.println('''************* «APP_NAME» started *************''')
		if(args.checkArguments) {
			// Initialize pathmap
			initializePathmaps
			// Initialize Xtext languages
			new ReducedAlfLanguageStandaloneSetup().createInjectorAndDoEMFRegistration()
			
			loadDefaultSettings
			val resourceSet = new ResourceSetImpl
			
			val toolchainBuilder = Toolchain::builder => [
				it.cppBasicTypesURI = URI::createURI(EMDWConstants.CPP_BASIC_TYPES_LIBRARY_PATH)
				it.collectionImplementationsURI = URI::createURI(EMDWConstants.CPP_COLLECTIONS_LIBRARY_PATH)
				it.runtimeModelURI = URI::createURI(EMDWConstants.CPP_RUNTIME_LIBRARY_PATH)
				it.mapperFileManager = new JarFileManager
			]
			
			resourceSet.URIConverter = URIConverter::INSTANCE
			resourceSet.run(args.umlModelPath, args.targetFolderPath, URI::createURI(EMDWConstants.XUMLRT_PRIMITIVE_TYPES_LIBRARY_PATH), toolchainBuilder)
		}
		System.out.println('''************* «APP_NAME» finished *************''')
	}
	
	def static void loadDefaultSettings() {
		// Register resource factories
		Resource.Factory.Registry.INSTANCE.extensionToFactoryMap.put(UMLResource.FILE_EXTENSION, UMLResource.Factory.INSTANCE)
		Resource.Factory.Registry.INSTANCE.getExtensionToFactoryMap().put("ecore", new EcoreResourceFactoryImpl())
		Resource.Factory.Registry.INSTANCE.getExtensionToFactoryMap().put("trace", new XMIResourceFactoryImpl())
		Resource.Factory.Registry.INSTANCE.getExtensionToFactoryMap().put("xtuml", new XMIResourceFactoryImpl())
		Resource.Factory.Registry.INSTANCE.getExtensionToFactoryMap().put("cppmodel", new XMIResourceFactoryImpl())
		Resource.Factory.Registry.INSTANCE.getExtensionToFactoryMap().put("common", new XMIResourceFactoryImpl())
		
		// Initialize EMF model element types
		UMLPackage.eINSTANCE.eClass
		XUMLRTPackage.eINSTANCE.eClass
		TracePackage.eINSTANCE.eClass
		CommonPackage.eINSTANCE.eClass
		XtumlPackage.eINSTANCE.eClass
		OoplPackage.eINSTANCE.eClass
		CppmodelPackage.eINSTANCE.eClass
		
		// initialize UML surrogate queries
		IncQueryUMLStandaloneSetup.doSetup
		
		// register xUML-RT profile
		UMLPlugin.EPackageNsURIToProfileLocationMap.put(XUMLRTPackage.eNS_URI, URI.createURI("pathmap://XUMLRT_PROFILE/xumlrt.profile.uml#_HaqtUBDoEeWE3_d6VQejPQ"))
		
		OoplQueryBasedFeatures::instance.specifications.forEach[IQuerySpecification<? extends IncQueryMatcher<? extends IPatternMatch>> specification |
			QuerySpecificationRegistry::registerQuerySpecification(specification)
		]
		QueryBasedFeatures::instance.specifications.forEach[IQuerySpecification<? extends IncQueryMatcher<? extends IPatternMatch>> specification |
			QuerySpecificationRegistry::registerQuerySpecification(specification)
		]
		EStructuralFeature.Internal.SettingDelegate.Factory.Registry.INSTANCE.put("org.eclipse.incquery.querybasedfeature", new QueryBasedFeatureSettingDelegateFactory)
	}
	
	
	def void start(String[] context) throws Exception {
		var List<String> args = context
		System.out.println('''************* «APP_NAME» started *************''')
		if(args.checkArguments) {
			// Initialize Xtext languages
			new ReducedAlfLanguageStandaloneSetup().createInjectorAndDoEMFRegistration()
			
			val resourceSet = new ResourceSetImpl
			resourceSet.run(args.umlModelPath, args.targetFolderPath, URI::createURI(EMDWConstants.XUMLRT_PRIMITIVE_TYPES_LIBRARY_PATH), Toolchain::builder)
		}
		System.out.println('''************* «APP_NAME» finished *************''')
	}
	
	private static def void initializePathmaps() {
		RESOURCES.putAll(#{
			URI::createURI(EMDWConstants::CPP_BASIC_TYPES_LIBRARY_PATH)			->	URI::createURI(EMDWApplication.getResource("/model/cppBasicTypes.cppmodel").toString),
			URI::createURI(EMDWConstants::CPP_COLLECTIONS_LIBRARY_PATH)			->	URI::createURI(EMDWApplication.getResource("/model/defaultImplementations.cppmodel").toString),
			URI::createURI(EMDWConstants::CPP_RUNTIME_LIBRARY_PATH)				->	URI::createURI(EMDWApplication.getResource("/model/runtime.cppmodel").toString),
			URI::createURI(EMDWConstants::XUMLRT_PRIMITIVE_TYPES_LIBRARY_PATH)	->	URI::createURI(EMDWApplication.getResource("/model/umlPrimitiveTypes.common").toString),
			URI::createURI(EMDWConstants::CPP_RALF_MODELS_PATH)					->	URI::createURI(EMDWApplication.getResource("/model/collections/collections.uml").toString),
			URI::createURI(EMDWConstants::XUMLRT_PROFILE_PATHMAP)				->	URI::createURI(EMDWApplication.getResource("/profile/").toString)
		})
		RESOURCES.forEach[pathmapPath, locationPath|
			URIConverter.URI_MAP.put(
				pathmapPath,
				locationPath
			)			
		]
	}

	def void stop() { /* nothing to do */ }
	
	private static def void run(ResourceSet resourceSet, String umlModelPath, String targetFolderPath, URI umlPrimitiveTypes, ToolchainBuilder toolchainBuilder) {
		initLogger(targetFolderPath.loggerPath, umlModelPath.fileName)
			
		val resourceManager = new ResourceManager(resourceSet, umlModelPath, targetFolderPath)
		
		val mapping = resourceManager.createRootMapping
		val primitiveTypeMapping = resourceManager.createPrimitiveTypeMapping(umlPrimitiveTypes)
		val fileManager = new JavaIOBasedFileManager('''«targetFolderPath»/code''')
		toolchainBuilder => [
			it.xumlrtModel = mapping.xtumlrtRoot
			it.primitiveTypeMapping = primitiveTypeMapping
			it.fileManager = fileManager 
		]
		toolchainBuilder.executeToolchainManager
		
		resourceManager.saveResources
	}
	
	private static def boolean checkArguments(List<String> args) {
		System.out.println("Passed arguments:")
		args.forEach(arg | println(" * "+arg))
		if (args === null || args.size() != 2) {
			System.out.println(ARGS_HELP)
			return false
		}
		return true
	}
	
	private static def void executeToolchainManager(ToolchainBuilder builder) {
		val toolchainManager = builder.build
		toolchainManager.clearMeasuredTimes
		toolchainManager.logLevel = Level.WARN
			
			
		toolchainManager.initializeTransformations
		toolchainManager.executeTransformations
		toolchainManager.logMeasuredTimes
			
	}
	
	private static def initializeTransformations(Toolchain toolchainManager) {
		toolchainManager.initializeXtTransformation
		toolchainManager.initializeCppQrtTransformation
		toolchainManager.initializeCppComponentTransformation
		toolchainManager.initializeCppCodegeneration
		toolchainManager.initializeMakefileGeneration
	}
	
	private static def executeTransformations(Toolchain toolchainManager) {
		toolchainManager.executeXtTransformation
		toolchainManager.executeCppQrtTransformation
		toolchainManager.executeDeltaCodeAndFileGeneration(new EMDWNullProgressMonitor)
	}
	
	private static def String getLoggerPath(String path) {
		return '''«path»/«LOGGER_FOLDER»'''
	}
	
	private static def String getFileName(String path) {
		if(path.contains('\\')) {
			return path.split("\\\\").last.replace(".uml", "")
		} else if(path.contains('/')) {
			return path.split("/").last.replace(".uml", "")
		} else {
			return path
		}
	}

	private static def String getUmlModelPath(List<String> args) {
		return args.get(0)
	}

	private static def String getTargetFolderPath(List<String> args) {
		return checkFolderEnding(args.get(1))
	}

	private static def String checkFolderEnding(String folderPath) {
		if (folderPath.endsWith("/")) {
			return folderPath
		} else {
			return '''«folderPath»/'''
		}
	}

	private static def void initLogger(String targetFolder, String modelName) {
		Logger.getLogger("org.eclipse.incquery").setLevel(Level.WARN)
		var String logFilePath = '''«targetFolder»./log_«modelName»_startedAt_«System.currentTimeMillis()».log'''
		var FileAppender fileAppender
		try {
			fileAppender = new FileAppender(new PatternLayout(FILE_LOG_LAYOUT_PREFIX + COMMON_LAYOUT), logFilePath, true)
			var Logger rootLogger = Logger.getRootLogger()
			rootLogger.removeAllAppenders()
			rootLogger.addAppender(fileAppender)
			rootLogger.setAdditivity(false)
			rootLogger.setLevel(Level.WARN)
		} catch (IOException e) {
			e.printStackTrace()
		}
	}
	
	private static def toEURI(URL url) {
		URI::createURI(url.toString)
	}
}
			
