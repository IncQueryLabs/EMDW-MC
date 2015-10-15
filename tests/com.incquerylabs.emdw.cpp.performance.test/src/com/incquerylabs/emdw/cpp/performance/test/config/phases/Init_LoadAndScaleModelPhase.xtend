package com.incquerylabs.emdw.cpp.performance.test.config.phases

import com.incquerylabs.emdw.cpp.performance.test.config.MCDataToken
import com.incquerylabs.emdw.modelmultiplicator.ModelMultiplicator
import com.incquerylabs.emdw.testing.common.utils.ComplexModelUtil
import com.incquerylabs.emdw.toolchain.ToolchainManagerBuilder
import eu.mondo.sam.core.DataToken
import eu.mondo.sam.core.metrics.MemoryMetric
import eu.mondo.sam.core.metrics.TimeMetric
import eu.mondo.sam.core.phases.AtomicPhase
import eu.mondo.sam.core.results.PhaseResult
import org.apache.log4j.Level
import org.eclipse.emf.common.util.URI
import org.eclipse.emf.ecore.resource.impl.ResourceSetImpl
import org.eclipse.uml2.uml.Component
import org.eclipse.uml2.uml.Model
import org.eclipse.uml2.uml.Package

class Init_LoadAndScaleModelPhase extends AtomicPhase {
	
	extension val ComplexModelUtil complexModelUtil = new ComplexModelUtil
	
	new(String phaseName) {
		super(phaseName)
	}
	
	override execute(DataToken token, PhaseResult phaseResult) {
		println('''Phase | Time | Memory''')
		print('''«phaseName»''')
		val mcToken = token as MCDataToken
		val timer = new TimeMetric("Time")
		val memory = new MemoryMetric("Memory")
		
		timer.startMeasure
		
		// WORK START
		val umlResourceSet = new ResourceSetImpl
		val umlUri = URI.createFileURI(mcToken.umlModelPath)
		val umlResource = umlResourceSet.createResource(umlUri) => [ load(#{}) ]
		val umlModel = umlResource.contents.filter(Model).head
		
		extension val modelMultiplicator = new ModelMultiplicator
		umlModel.copyPackagedElements(mcToken.componentsScale, Package)
		umlModel.copyPackagedElements(mcToken.componentsScale, Component)
		
		val toolchainManagerBuilder = new ToolchainManagerBuilder
		val engine = toolchainManagerBuilder.createDefaultEngine(umlResourceSet)
		val mapping = complexModelUtil.createRootMapping(umlModel, engine)
		val xumlResourceSet = mapping.xtumlrtRoot.eResource.resourceSet
		
		val primitiveTypeMapping = createPrimitiveTypeMapping(umlResourceSet, xumlResourceSet)
		
		toolchainManagerBuilder => [
			it.engine = engine
			it.resourceSet = xumlResourceSet
			it.primitiveTypeMapping = primitiveTypeMapping
		]
		val toolchainManager = toolchainManagerBuilder.buildOrGetManager
		toolchainManager.logLevel = Level.TRACE
		mcToken.toolchainManager = toolchainManager
		// WORK END
		
		timer.stopMeasure
		memory.measure
		
		phaseResult.addMetrics(timer)
		phaseResult.addMetrics(memory)
		print(''' | «timer.value»''')
		println(''' | «memory.value»''')
	}
	
}