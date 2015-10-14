package com.incquerylabs.emdw.cpp.performance.test.config.scenarios

import com.incquerylabs.emdw.cpp.performance.test.config.cases.BenchmarkCase
import eu.mondo.sam.core.results.CaseDescriptor
import eu.mondo.sam.core.scenarios.BenchmarkScenario

abstract class AbstractBenchmarkScenario extends BenchmarkScenario {
	protected BenchmarkCase benchmarkCase
	
	new(BenchmarkCase bencmarkCase) {
		this.benchmarkCase = bencmarkCase
		this.size = bencmarkCase.componentsScale * bencmarkCase.componentInsideScale
		this.caseName = '''Scale«bencmarkCase.componentsScale»x«bencmarkCase.componentInsideScale»'''
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
	protected final String XumlrtToCppQrtPhaseName = "???"	// TODO: What should this phase do?
	protected final String ChangeMonitorInitializationPhaseName = "ChangeMonitorInitialization"
	protected final String XumlrtToCppComponentStructurePhaseName = "XumlrtToCppComponentStructureTransformation"
	protected final String XumlrtToCppBodyCompilePhaseName = "XumlrtToCppBodyCompilation"
	protected final String CodeGenerationPhaseName = "CppCodeGeneration"
	protected final String MakefileGenerationPhaseName = "MakefileGeneration"
	protected final String RuntimeMappingPhaseName = "RuntimeMapping"
	protected final String FileSyncPhaseName = "FileSync"
	protected final String ModelModificationPhaseName = "ModelModification"
}