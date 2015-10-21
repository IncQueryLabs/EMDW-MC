package com.incquerylabs.emdw.cpp.performance.test

import com.incquerylabs.emdw.cpp.performance.test.config.cases.BenchmarkCase
import com.incquerylabs.emdw.cpp.performance.test.config.scenarios.SimpleRunScenario
import org.junit.Test
import com.incquerylabs.emdw.cpp.performance.test.config.scenarios.RunWithModificationScenario

class DynamicPerformanceTest extends AbstractPerformanceTest {
	
	@Test
	def void test() {
		relativePathRoot = ""
		configFilePath = CONFIG_FILE_PATH
		targetFolder = "./results/"+JSON_RESULT_FOLDER
		runIndex = 1
		run
	}
	
	override getPerformanceScenario(BenchmarkCase _case) {
		if(_case.modificationTimes<1) {
			return new SimpleRunScenario(_case)
		} else {
			return new RunWithModificationScenario(_case)
		}
	}
	
}