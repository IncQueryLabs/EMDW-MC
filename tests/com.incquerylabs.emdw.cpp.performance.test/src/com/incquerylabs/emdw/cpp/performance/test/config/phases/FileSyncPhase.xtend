package com.incquerylabs.emdw.cpp.performance.test.config.phases

import com.incquerylabs.emdw.cpp.performance.test.config.MCDataToken
import com.incquerylabs.emdw.cpp.transformation.queries.XtumlQueries
import eu.mondo.sam.core.DataToken
import eu.mondo.sam.core.metrics.MemoryMetric
import eu.mondo.sam.core.metrics.TimeMetric
import eu.mondo.sam.core.phases.AtomicPhase
import eu.mondo.sam.core.results.PhaseResult

class FileSyncPhase extends AtomicPhase {
	extension XtumlQueries xtumlQueries = XtumlQueries.instance
	
	new(String phaseName) {
		super(phaseName)
	}
	
	override execute(DataToken token, PhaseResult phaseResult) {
		println(phaseName)
		val mcToken = token as MCDataToken
		val timer = new TimeMetric("Time")
		val memory = new MemoryMetric("Memory")
		
		timer.startMeasure
		
		// WORK START
		val cppModel = mcToken.toolchain.getOrCreateCPPModel
		val runtimeCppDir = mcToken.toolchain.runtimeCppDir
		mcToken.toolchain.executeFileGeneration(cppModel, runtimeCppDir, mcToken.cppSourceFileContents)
		// Manual filegeneration for main makefile and main.cc
		mcToken.toolchain.performMakefileGeneration(cppModel, runtimeCppDir)
		val allCppComponents = mcToken.toolchain.engine.cppComponents.getAllValuesOfcppComponent
		mcToken.toolchain.performMainGeneration(allCppComponents)
		// WORK END
		
		timer.stopMeasure
		memory.measure
		
		phaseResult.addMetrics(timer)
		phaseResult.addMetrics(memory)
		mcToken.addMetrics(phaseName, timer.value, memory.value)
	}
	
}