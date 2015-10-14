package com.incquerylabs.emdw.cpp.performance.test

import com.incquerylabs.emdw.cpp.performance.test.config.MCDataToken
import com.incquerylabs.emdw.cpp.performance.test.config.cases.BenchmarkCase
import com.incquerylabs.emdw.cpp.performance.test.config.scenarios.AbstractBenchmarkScenario
import com.incquerylabs.emdw.cpp.performance.test.utils.PropertiesUtil
import eu.mondo.sam.core.BenchmarkEngine
import eu.mondo.sam.core.results.JsonSerializer
import java.io.File

abstract class AbstractPerformanceTest {
	
	protected static final String JSON_RESULT_FOLDER = "./results/json/"
	protected static final String CONFIG_FILE_PATH = "dummyConfig"
	
	
	def void run(String configFilePath, String jsonResultFolder) {
		val util = new PropertiesUtil(configFilePath)
		val _case = new BenchmarkCase(util.multiplicationComponentinside, util.multiplicationComponents, 2)
		val scenario = _case.performanceScenario
		
		val token = new MCDataToken => [
			it.scenarioName = scenario.name
			
			it.umlModelPath = util.inputModelPath
			it.componentInsideScale = util.multiplicationComponentinside
			it.componentsScale = util.multiplicationComponents
			it.shouldCompileBody = util.shouldCompileBody
			it.modificationTimes = util.modificationTimes
			it.modificationType = util.modificationType
		]
		
		val engine = new BenchmarkEngine
		var resultsFolder = new File(jsonResultFolder)
		if(!resultsFolder.exists){
			resultsFolder.mkdirs
		}
		JsonSerializer::setResultPath(jsonResultFolder)
		
		engine.runBenchmark(scenario, token)
		
	}
	
	def AbstractBenchmarkScenario getPerformanceScenario(BenchmarkCase _case)
}