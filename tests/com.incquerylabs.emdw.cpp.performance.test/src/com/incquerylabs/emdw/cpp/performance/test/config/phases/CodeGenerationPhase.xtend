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
package com.incquerylabs.emdw.cpp.performance.test.config.phases

import com.ericsson.xtumlrt.oopl.cppmodel.CPPSourceFile
import com.incquerylabs.emdw.cpp.performance.test.config.MCDataToken
import eu.mondo.sam.core.DataToken
import eu.mondo.sam.core.metrics.MemoryMetric
import eu.mondo.sam.core.metrics.TimeMetric
import eu.mondo.sam.core.phases.AtomicPhase
import eu.mondo.sam.core.results.PhaseResult
import com.incquerylabs.emdw.cpp.transformation.queries.XtumlQueries

class CodeGenerationPhase extends AtomicPhase {
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
		mcToken.toolchain.initializeCppCodegeneration
		val dirtyComponents = mcToken.toolchain.dirtyXtComponents
		
		val cppComponents = dirtyComponents.map[ xtComponent |
			mcToken.toolchain.engine.cppComponents.getAllValuesOfcppComponent(xtComponent).head
		]
		if(mcToken.cppSourceFileContents == null) {
			mcToken.cppSourceFileContents = <CPPSourceFile, CharSequence>newHashMap
		}
		cppComponents.forEach[ cppComponent |
			val cppSourceFileContentsForComponent = mcToken.toolchain.executeCppCodeGeneration(cppComponent)
			mcToken.cppSourceFileContents.putAll(cppSourceFileContentsForComponent)
		]
		// WORK END
		
		timer.stopMeasure
		memory.measure
		
		phaseResult.addMetrics(timer)
		phaseResult.addMetrics(memory)
		mcToken.addMetrics(phaseName, timer.value, memory.value)
	}
	
	
}