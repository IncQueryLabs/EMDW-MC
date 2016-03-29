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
package com.incquerylabs.emdw.cpp.performance.test

import com.incquerylabs.emdw.cpp.performance.test.config.MCDataToken
import com.incquerylabs.emdw.cpp.performance.test.config.cases.BenchmarkCase
import com.incquerylabs.emdw.cpp.performance.test.config.scenarios.AbstractBenchmarkScenario
import com.incquerylabs.emdw.cpp.performance.test.utils.PropertiesUtil
import eu.mondo.sam.core.BenchmarkEngine
import eu.mondo.sam.core.results.JsonSerializer
import java.io.File
import org.eclipse.core.runtime.Path
import org.eclipse.xtend.lib.annotations.Accessors

@Accessors
abstract class AbstractPerformanceTest {
	
	protected static final String JSON_RESULT_FOLDER = "./json/"
	protected static final String CONFIG_FILE_PATH = "./performancetest.properties"
	
	protected String relativePathRoot
	protected String configFilePath
	protected String targetFolder
	protected int runIndex
	
	
	def void run() {
		val util = new PropertiesUtil(configFilePath)
		val modelPath = new Path(util.inputModelPath)
		val modelName = modelPath.removeFileExtension.lastSegment
		val _case = new BenchmarkCase(modelName, util.multiplicationComponentinside, util.multiplicationComponents, util.modificationTimes)
		val scenario = _case.performanceScenario
		scenario.runIndex = runIndex
		
		val token = new MCDataToken => [
			it.scenarioName = scenario.name
			
			it.umlModelPath = relativePathRoot+util.inputModelPath
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
		var resultsFolder = new File(targetFolder.jsonResultFolder)
		if(!resultsFolder.exists){
			resultsFolder.mkdirs
		}
		JsonSerializer::setResultPath(targetFolder.jsonResultFolder)
		
		benchmarkEngine.runBenchmark(scenario, token)
		token.printLog
		token.printMetrics
		token.toolchain.logMeasuredTimes
	}
	
	def String getJsonResultFolder(String targetFolder) '''«targetFolder»«JSON_RESULT_FOLDER»'''
	
	def AbstractBenchmarkScenario getPerformanceScenario(BenchmarkCase _case)
}