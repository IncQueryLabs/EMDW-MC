package com.incquerylabs.emdw.cpp.performance.test.config.scenarios

import com.incquerylabs.emdw.cpp.performance.test.config.cases.BenchmarkCase
import eu.mondo.sam.core.phases.SequencePhase
import com.incquerylabs.emdw.cpp.performance.test.config.phases.Init_LoadAndScaleModelPhase
import com.incquerylabs.emdw.cpp.performance.test.config.phases.Init_XumlrtPhase
import com.incquerylabs.emdw.cpp.performance.test.config.phases.XumlrtToCppQrtPhase
import com.incquerylabs.emdw.cpp.performance.test.config.phases.XumlrtToCppComponentStructurePhase
import com.incquerylabs.emdw.cpp.performance.test.config.phases.XumlrtToCppBodyCompilePhase
import com.incquerylabs.emdw.cpp.performance.test.config.phases.CodeGenerationPhase
import com.incquerylabs.emdw.cpp.performance.test.config.phases.MakefileGenerationPhase
import com.incquerylabs.emdw.cpp.performance.test.config.phases.RuntimeMappingPhase
import com.incquerylabs.emdw.cpp.performance.test.config.phases.FileSyncPhase

class SimpleRunScenario extends AbstractBenchmarkScenario {
	
	new(BenchmarkCase bencmarkCase) {
		super(bencmarkCase)
	}
	
	override build() {
		val seq = new SequencePhase
		
		seq.addPhases(
			new Init_LoadAndScaleModelPhase(Init_LoadAndScaleModelPhaseName),
			new Init_XumlrtPhase(Init_XumlrtPhaseName),
			new XumlrtToCppQrtPhase(XumlrtToCppQrtPhaseName),
			new XumlrtToCppComponentStructurePhase(XumlrtToCppComponentStructurePhaseName),
			new XumlrtToCppBodyCompilePhase(XumlrtToCppBodyCompilePhaseName),
			new CodeGenerationPhase(CodeGenerationPhaseName),
			new MakefileGenerationPhase(MakefileGenerationPhaseName),
			new RuntimeMappingPhase(RuntimeMappingPhaseName),
			new FileSyncPhase(FileSyncPhaseName)
		)
		
		rootPhase = seq
	}
	
	override getName() {
		return "SimpleRunScenario"
	}
	
}