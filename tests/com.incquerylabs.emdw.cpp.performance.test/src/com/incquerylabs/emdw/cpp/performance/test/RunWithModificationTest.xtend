package com.incquerylabs.emdw.cpp.performance.test

import com.incquerylabs.emdw.cpp.performance.test.config.cases.BenchmarkCase
import com.incquerylabs.emdw.cpp.performance.test.config.scenarios.RunWithModificationScenario
import org.junit.Test

class RunWithModificationTest extends AbstractPerformanceTest {
	
	@Test
	def void test() {
		run("", CONFIG_FILE_PATH, JSON_RESULT_FOLDER, 1)
	}
	
	override getPerformanceScenario(BenchmarkCase _case) {
		return new RunWithModificationScenario(_case)
	}
	
}