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
package com.incquerylabs.emdw.cpp.performance.test.config.scenarios

import com.incquerylabs.emdw.cpp.performance.test.config.cases.BenchmarkCase
import eu.mondo.sam.core.results.CaseDescriptor
import eu.mondo.sam.core.scenarios.BenchmarkScenario

abstract class AbstractBenchmarkScenario extends BenchmarkScenario {
	protected BenchmarkCase benchmarkCase
	
	new(BenchmarkCase bencmarkCase) {
		this.benchmarkCase = bencmarkCase
		this.size = bencmarkCase.componentInsideScale + 1
		this.caseName = '''«bencmarkCase.componentsScale + 1»'''
		this.tool = bencmarkCase.modelName
		this.runIndex = 1
	}
	
	override getCaseDescriptor() {
		val descriptor = new CaseDescriptor
		
		descriptor.tool = this.tool
		descriptor.caseName = this.caseName
		descriptor.size = this.size
		descriptor.runIndex = this.runIndex
		descriptor.scenario = this.name
		
		return descriptor
	}
	
	def String getName()
	
	protected final String Init_LoadAndScaleModelPhaseName = "UMLModelInitialization"
	protected final String Init_XumlrtPhaseName = "XumlrtModelInitialization"
	protected final String XumlrtToCppQrtPhaseName = "XumlrtToCppQRTTransformation"
	protected final String ChangeMonitorInitializationPhaseName = "ChangeMonitorInitialization"
	protected final String XumlrtToCppComponentStructurePhaseName = "XumlrtToCppComponentStructureTransformation"
	protected final String XumlrtToCppBodyCompilePhaseName = "XumlrtToCppBodyCompilation"
	protected final String CodeGenerationPhaseName = "CppCodeGeneration"
	protected final String MakefileGenerationPhaseName = "MakefileGeneration"
	protected final String RuntimeMappingPhaseName = "RuntimeMapping"
	protected final String FileSyncPhaseName = "FileSync"
	protected final String ModelModificationPhaseName = "ModelModification"
}