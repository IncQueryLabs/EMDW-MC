package com.incquerylabs.emdw.cpp.performance.test.config.phases

import com.incquerylabs.emdw.cpp.performance.test.config.MCDataToken
import eu.mondo.sam.core.DataToken
import eu.mondo.sam.core.metrics.MemoryMetric
import eu.mondo.sam.core.metrics.TimeMetric
import eu.mondo.sam.core.phases.AtomicPhase
import eu.mondo.sam.core.results.PhaseResult

class ChangeMonitorInitializationPhase extends AtomicPhase {
	
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
		mcToken.toolchain.startChangeMonitor
		// WORK END
		
		timer.stopMeasure
		memory.measure
		
		phaseResult.addMetrics(timer)
		phaseResult.addMetrics(memory)
		mcToken.addMetrics(phaseName, timer.value, memory.value)
	}
	
}