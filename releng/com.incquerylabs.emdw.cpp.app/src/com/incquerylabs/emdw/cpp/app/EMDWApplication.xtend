package com.incquerylabs.emdw.cpp.app

import com.ericsson.xtumlrt.oopl.OoplPackage
import com.ericsson.xtumlrt.oopl.cppmodel.CppmodelPackage
import com.incquerylabs.emdw.cpp.codegeneration.fsa.impl.JavaIOBasedFileManager
import com.incquerylabs.emdw.cpp.common.util.EMDWNullProgressMonitor
import com.incquerylabs.emdw.toolchain.ToolchainManager
import com.incquerylabs.emdw.toolchain.ToolchainManagerBuilder
import com.incquerylabs.emdw.umlintegration.trace.TracePackage
import java.io.IOException
import java.util.Arrays
import java.util.List
import org.apache.log4j.FileAppender
import org.apache.log4j.Level
import org.apache.log4j.Logger
import org.apache.log4j.PatternLayout
import org.eclipse.emf.ecore.resource.Resource
import org.eclipse.emf.ecore.resource.ResourceSet
import org.eclipse.emf.ecore.resource.impl.ResourceSetImpl
import org.eclipse.emf.ecore.xmi.impl.EcoreResourceFactoryImpl
import org.eclipse.emf.ecore.xmi.impl.XMIResourceFactoryImpl
import org.eclipse.equinox.app.IApplication
import org.eclipse.equinox.app.IApplicationContext
import org.eclipse.incquery.patternlanguage.emf.EMFPatternLanguageStandaloneSetup
import org.eclipse.papyrusrt.xtumlrt.common.CommonPackage
import org.eclipse.papyrusrt.xtumlrt.xtuml.XtumlPackage
import org.eclipse.uml2.uml.UMLPackage
import org.eclipse.uml2.uml.resource.UMLResource

class EMDWApplication implements IApplication {
	private static final String APP_NAME = "EMDW-MC RCP Application"
	private static final String ARGS_HELP = 
	'''
	We need these arguments:
	 * first arg: uml model path
	 * second arg: target folder for generated code and log
	'''
	private static final String LOGGER_FOLDER = "log"
	private static final String COMMON_LAYOUT = "%30.30c - %m%n"
	private static final String FILE_LOG_LAYOUT_PREFIX = "[%d{MMM/dd HH:mm:ss}] "
	
	
	
	
	def static void main(String[] args) {
		System.out.println('''************* «APP_NAME» started *************''')
		if(args.checkArguments) {
			val resourceSet = new ResourceSetImpl
			
			resourceSet.loadDefaultSettings
			
			resourceSet.run(args.umlModelPath, args.targetFolderPath, EMDWApplication.getResource("/model/umlPrimitiveTypes.common").toString())
		}
		System.out.println('''************* «APP_NAME» finished *************''')
	}
	
	def static void loadDefaultSettings(ResourceSet resourceSet) {
		// Register resource factories
		Resource.Factory.Registry.INSTANCE.extensionToFactoryMap.put(UMLResource.FILE_EXTENSION, UMLResource.Factory.INSTANCE)
		Resource.Factory.Registry.INSTANCE.getExtensionToFactoryMap().put("ecore", new EcoreResourceFactoryImpl())
		Resource.Factory.Registry.INSTANCE.getExtensionToFactoryMap().put("trace", new XMIResourceFactoryImpl())
		Resource.Factory.Registry.INSTANCE.getExtensionToFactoryMap().put("xtuml", new EcoreResourceFactoryImpl())
		Resource.Factory.Registry.INSTANCE.getExtensionToFactoryMap().put("cppmodel", new EcoreResourceFactoryImpl())
		
		// Initialize EMF model element types
		UMLPackage.eINSTANCE.eClass
		TracePackage.eINSTANCE.eClass
		CommonPackage.eINSTANCE.eClass
		XtumlPackage.eINSTANCE.eClass
		OoplPackage.eINSTANCE.eClass
		CppmodelPackage.eINSTANCE.eClass
		
		// Initialize IncQuery
		new EMFPatternLanguageStandaloneSetup().createInjectorAndDoEMFRegistration()
	}
	
	
	override Object start(IApplicationContext context) throws Exception {
		var List<String> args = Arrays.asList(context.getArguments().get("application.args") as String[])
		System.out.println('''************* «APP_NAME» started *************''')
		if(args.checkArguments) {
			val resourceSet = new ResourceSetImpl
			resourceSet.run(args.umlModelPath, args.targetFolderPath, '''platform:/plugin«ResourceManager.COMMON_PRIMITIVE_TYPES_PATH»''')
		}
		System.out.println('''************* «APP_NAME» finished *************''')
		return IApplication.EXIT_OK
	}

	override void stop() { /* nothing to do */ }
	
	private static def void run(ResourceSet resourceSet, String umlModelPath, String targetFolderPath, String umlPrimitiveTypes) {
		initLogger(targetFolderPath.loggerPath, umlModelPath.fileName)
			
		val resourceManager = new ResourceManager(resourceSet, umlModelPath, targetFolderPath)
		
		val mapping = resourceManager.createRootMapping
		val primitiveTypeMapping = resourceManager.createPrimitiveTypeMapping(umlPrimitiveTypes)
		val fileManager = new JavaIOBasedFileManager('''«targetFolderPath»/code''')
		val toolchainManagerBuilder = new ToolchainManagerBuilder => [
			it.xumlrtModel = mapping.xtumlrtRoot
			it.primitiveTypeMapping = primitiveTypeMapping
			it.fileManager = fileManager
			
		]
		toolchainManagerBuilder.executeToolchainManager
		
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
	
	private static def void executeToolchainManager(ToolchainManagerBuilder builder) {
		val toolchainManager = builder.buildOrGetManager
			toolchainManager.clearMeasuredTimes
			toolchainManager.logLevel = Level.TRACE
			
			
			toolchainManager.initializeTransformations
			toolchainManager.executeTransformations
			toolchainManager.logMeasuredTimes
			
	}
	
	private static def initializeTransformations(ToolchainManager toolchainManager) {
		toolchainManager.initializeXtTransformation
		toolchainManager.initializeCppQrtTransformation
		toolchainManager.initializeCppComponentTransformation
		toolchainManager.initializeCppCodegeneration
		toolchainManager.initializeMakefileGeneration
	}
	
	private static def executeTransformations(ToolchainManager toolchainManager) {
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
		Logger.getLogger("org.eclipse.incquery").setLevel(
			Level.
				INFO)
				var String logFilePath = '''«targetFolder»./log/log_«modelName»_startedAt_«System.currentTimeMillis()».log'''
				var FileAppender fileAppender
				try {
					fileAppender = new FileAppender(new PatternLayout(FILE_LOG_LAYOUT_PREFIX + COMMON_LAYOUT),
						logFilePath, true)
					var Logger rootLogger = Logger.getRootLogger()
					rootLogger.removeAllAppenders()
					rootLogger.addAppender(fileAppender)
					rootLogger.setAdditivity(false)
					rootLogger.setLevel(Level.INFO)
				} catch (IOException e) {
					e.printStackTrace()
				}

			}

		}
			