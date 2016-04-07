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

import com.incquerylabs.emdw.cpp.performance.test.ModelModifier
import com.incquerylabs.emdw.cpp.performance.test.config.MCDataToken
import eu.mondo.sam.core.DataToken
import eu.mondo.sam.core.metrics.MemoryMetric
import eu.mondo.sam.core.metrics.TimeMetric
import eu.mondo.sam.core.phases.AtomicPhase
import eu.mondo.sam.core.results.PhaseResult
import java.util.Collections
import java.util.Random
import org.eclipse.uml2.uml.Component

class ModelModificationPhase extends AtomicPhase {
	extension ModelModifier modelModifier
	
	new(String phaseName) {
		super(phaseName)
	}
	
	override execute(DataToken token, PhaseResult phaseResult) {
		println(phaseName)
		val mcToken = token as MCDataToken
		val timer = new TimeMetric("Time")
		val memory = new MemoryMetric("Memory")
		
		timer.startMeasure
		
		// Random seed should be provided in properties file
		val random = new Random(mcToken.randomSeed)
		this.modelModifier = new ModelModifier(random, mcToken.toolchain.primitiveTypeMapping)
		// WORK START
		val umlModel = mcToken.umlModel
		val components = umlModel.allOwnedElements.filter(Component).sortBy[qualifiedName]
		Collections.shuffle(components, random)
		val componentsToModify = components.take(mcToken.modificationScope)
		
		
		// Add random attributes
		val modifications = mcToken.modifications
		modifications.forEach[modificationType, modificationCount|
			for(i : 0 ..< modificationCount){
				componentsToModify.forEach[it.performSmallModification(modificationType)]
				umlModel.performHighLevelModification(modificationType)
			}
		]
		// WORK END
		
		timer.stopMeasure
		memory.measure
		
		phaseResult.addMetrics(timer)
		phaseResult.addMetrics(memory)
		mcToken.addMetrics(phaseName, timer.value, memory.value)
	}
}
