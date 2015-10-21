package com.incquerylabs.emdw.cpp.performance.test.config.scenarios

import com.incquerylabs.emdw.cpp.performance.test.config.cases.BenchmarkCase
import com.incquerylabs.emdw.cpp.performance.test.config.phases.CodeGenerationPhase
import com.incquerylabs.emdw.cpp.performance.test.config.phases.FileSyncPhase
import com.incquerylabs.emdw.cpp.performance.test.config.phases.Init_LoadAndScaleModelPhase
import com.incquerylabs.emdw.cpp.performance.test.config.phases.Init_XumlrtPhase
import com.incquerylabs.emdw.cpp.performance.test.config.phases.MakefileGenerationPhase
import com.incquerylabs.emdw.cpp.performance.test.config.phases.RuntimeMappingPhase
import com.incquerylabs.emdw.cpp.performance.test.config.phases.XumlrtToCppBodyCompilePhase
import com.incquerylabs.emdw.cpp.performance.test.config.phases.XumlrtToCppComponentStructurePhase
import com.incquerylabs.emdw.cpp.performance.test.config.phases.XumlrtToCppQrtPhase
import eu.mondo.sam.core.phases.SequencePhase
import com.incquerylabs.emdw.cpp.performance.test.config.phases.ChangeMonitorInitializationPhase
import eu.mondo.sam.core.phases.IterationPhase
import com.incquerylabs.emdw.cpp.performance.test.config.phases.ModelModificationPhase

class RunWithModificationScenario extends AbstractBenchmarkScenario {
	
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
			new FileSyncPhase(FileSyncPhaseName),
			new ChangeMonitorInitializationPhase(ChangeMonitorInitializationPhaseName),
			new IterationPhase(benchmarkCase.modificationTimes) => [
				it.phase = new SequencePhase => [
					it.addPhases(
						new ModelModificationPhase(ModelModificationPhaseName),
						new XumlrtToCppComponentStructurePhase(XumlrtToCppComponentStructurePhaseName),
						new XumlrtToCppBodyCompilePhase(XumlrtToCppBodyCompilePhaseName),
						new CodeGenerationPhase(CodeGenerationPhaseName),
						new MakefileGenerationPhase(MakefileGenerationPhaseName),
						new FileSyncPhase(FileSyncPhaseName)
					)
				]
			]
		)
		
		rootPhase = seq
	}
	
	override getName() {
		return "RunWithModificationScenario"
	}
	
}