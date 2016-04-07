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

import com.incquerylabs.emdw.cpp.performance.test.config.cases.BenchmarkCase
import com.incquerylabs.emdw.cpp.performance.test.config.scenarios.SimpleRunScenario
import org.junit.Test

class SimpleRunTest extends AbstractPerformanceTest {
	
	@Test
	def void test() {
		relativePathRoot = ""
		configFilePath = CONFIG_FILE_PATH
		targetFolder = "./results/"+JSON_RESULT_FOLDER
		runIndex = 1
		run
	}
	
	override getPerformanceScenario(BenchmarkCase _case) {
		return new SimpleRunScenario(_case)
	}
	
}