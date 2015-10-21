package com.incquerylabs.emdw.cpp.performance.test

import com.incquerylabs.emdw.cpp.performance.test.config.cases.BenchmarkCase
import com.incquerylabs.emdw.cpp.performance.test.config.scenarios.RunWithModificationScenario
import org.junit.Test

class RunWithModificationTest extends AbstractPerformanceTest {
	
	@Test
	def void test() {
		relativePathRoot = "./results/"
		configFilePath = CONFIG_FILE_PATH
		targetFolder = JSON_RESULT_FOLDER
		runIndex = 1
		run
	}
	
	override getPerformanceScenario(BenchmarkCase _case) {
		return new RunWithModificationScenario(_case)
	}
	
}