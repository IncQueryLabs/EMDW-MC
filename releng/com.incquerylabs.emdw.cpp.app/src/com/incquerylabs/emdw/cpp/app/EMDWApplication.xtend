package com.incquerylabs.emdw.cpp.app

import com.incquerylabs.emdw.cpp.codegeneration.fsa.impl.JavaIOBasedFileManager
import com.incquerylabs.emdw.cpp.common.util.EMDWNullProgressMonitor
import com.incquerylabs.emdw.toolchain.ToolchainManager
import com.incquerylabs.emdw.toolchain.ToolchainManagerBuilder
import java.io.IOException
import java.util.Arrays
import java.util.List
import org.apache.log4j.FileAppender
import org.apache.log4j.Level
import org.apache.log4j.Logger
import org.apache.log4j.PatternLayout
import org.eclipse.equinox.app.IApplication
import org.eclipse.equinox.app.IApplicationContext

class EMDWApplication implements IApplication {
	private static final String APP_NAME = "EMDW-MC RCP Application"
	private static final String ARGS_HELP = 
	'''
	We need these arguments:
	 * first arg: uml model path
	 * second arg: target folder for generated code and log
	'''
	private static final String LOGGER_FOLDER = "log"

	static package String COMMON_LAYOUT = "%30.30c - %m%n"
	static package String FILE_LOG_LAYOUT_PREFIX = "[%d{MMM/dd HH:mm:ss}] "
	
	
	
	
	
	
	/* (non-Javadoc)
	 * @see IApplication#start(org.eclipse.equinox.app.IApplicationContext)
	 */
	override Object start(IApplicationContext context) throws Exception {
		var List<String> args = Arrays.asList(context.getArguments().get("application.args") as String[])
		System.out.println('''************* «APP_NAME» started *************''')
		System.out.println("Arguments:")
		args.forEach(arg | println(" * "+arg))
		if (args === null || args.size() != 2) {
			System.out.println(ARGS_HELP)
		} else {
			var String umlModelPath = getUmlModelPath(args)
			var String targetFolderPath = getTargetFolderPath(args)
			
			initLogger(targetFolderPath.loggerPath, umlModelPath.fileName)
			
			val resourceManager = new ResourceManager(umlModelPath, targetFolderPath)
			
			val mapping = resourceManager.createRootMapping
			val primitiveTypeMapping = resourceManager.createPrimitiveTypeMapping
			val fileManager = new JavaIOBasedFileManager('''«targetFolderPath»/code''')
			val toolchainManagerBuilder = new ToolchainManagerBuilder => [
				it.xumlrtModel = mapping.xtumlrtRoot
				it.primitiveTypeMapping = primitiveTypeMapping
				it.fileManager = fileManager
				
			]
			toolchainManagerBuilder.executeToolchainManager
			
			resourceManager.saveResources
			
		}
		System.out.println('''************* «APP_NAME» finished *************''')
		return IApplication.EXIT_OK
	}
	
	private def void executeToolchainManager(ToolchainManagerBuilder builder) {
		val toolchainManager = builder.buildOrGetManager
			toolchainManager.clearMeasuredTimes
			toolchainManager.logLevel = Level.TRACE
			
			
			toolchainManager.initializeTransformations
			toolchainManager.executeTransformations
			toolchainManager.logMeasuredTimes
			
	}
	
	private def String getLoggerPath(String path) {
		return '''«path»/«LOGGER_FOLDER»'''
	}
	
	private def initializeTransformations(ToolchainManager toolchainManager) {
		toolchainManager.initializeXtTransformation
		toolchainManager.initializeCppQrtTransformation
		toolchainManager.initializeCppComponentTransformation
		toolchainManager.initializeCppCodegeneration
		toolchainManager.initializeMakefileGeneration
	}
	
	private def executeTransformations(ToolchainManager toolchainManager) {
		toolchainManager.executeXtTransformation
		toolchainManager.executeCppQrtTransformation
		toolchainManager.executeDeltaCodeAndFileGeneration(new EMDWNullProgressMonitor)
	}
	
	private def String getFileName(String path) {
		if(path.contains('\\')) {
			return path.split("\\\\").last.replace(".uml", "")
		} else if(path.contains('/')) {
			return path.split("/").last.replace(".uml", "")
		} else {
			return path
		}
	}

	private def String getUmlModelPath(List<String> args) {
		return args.get(0)
	}

	def private String getTargetFolderPath(List<String> args) {
		return checkFolderEnding(args.get(1))
	}

	def private String checkFolderEnding(String folderPath) {
		if (folderPath.endsWith("/")) {
			return folderPath
		} else {
			return '''«folderPath»/'''
		}
	}

	override void stop() { /* nothing to do */ }




	def private void initLogger(String targetFolder, String modelName) {
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
			