package com.incquerylabs.emdw.cpp.performance.test

import com.incquerylabs.emdw.cpp.performance.test.config.MCDataToken
import com.incquerylabs.emdw.cpp.performance.test.config.cases.BenchmarkCase
import com.incquerylabs.emdw.cpp.performance.test.config.scenarios.AbstractBenchmarkScenario
import com.incquerylabs.emdw.cpp.performance.test.utils.PropertiesUtil
import eu.mondo.sam.core.BenchmarkEngine
import eu.mondo.sam.core.results.JsonSerializer
import java.io.File
import org.eclipse.core.runtime.Path

abstract class AbstractPerformanceTest {
	
	protected static final String JSON_RESULT_FOLDER = "./results/json/"
	protected static final String CONFIG_FILE_PATH = "./performancetest.properties"
	
	
	def void run(String configFilePath, String jsonResultFolder) {
		val util = new PropertiesUtil(configFilePath)
		val modelPath = new Path(util.inputModelPath)
		val modelName = modelPath.removeFileExtension.lastSegment
		val _case = new BenchmarkCase(modelName, util.multiplicationComponentinside, util.multiplicationComponents, util.modificationTimes)
		val scenario = _case.performanceScenario
		
		val token = new MCDataToken => [
			it.scenarioName = scenario.name
			
			it.umlModelPath = util.inputModelPath
			it.randomSeed = util.randomSeed
			it.componentInsideScale = util.multiplicationComponentinside
			it.componentsScale = util.multiplicationComponents
			it.shouldCompileBody = util.shouldCompileBody
			it.modificationTimes = util.modificationTimes
			it.modificationScope = util.modificationScope
			it.modifications = util.modificationsMap
		]
		token.addLogLine('''Properties file path: «configFilePath»''')
		
		val benchmarkEngine = new BenchmarkEngine
		var resultsFolder = new File(jsonResultFolder)
		if(!resultsFolder.exists){
			resultsFolder.mkdirs
		}
		JsonSerializer::setResultPath(jsonResultFolder)
		
		benchmarkEngine.runBenchmark(scenario, token)
		token.printLog
		token.printMetrics
	}
	
	def AbstractBenchmarkScenario getPerformanceScenario(BenchmarkCase _case)
}