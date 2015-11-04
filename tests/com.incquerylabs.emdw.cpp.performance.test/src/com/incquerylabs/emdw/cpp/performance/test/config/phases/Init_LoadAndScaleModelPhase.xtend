package com.incquerylabs.emdw.cpp.performance.test.config.phases

import com.incquerylabs.emdw.cpp.codegeneration.fsa.impl.EclipseWorkspaceFileManager
import com.incquerylabs.emdw.cpp.performance.test.config.MCDataToken
import com.incquerylabs.emdw.modelmultiplicator.ModelMultiplicator
import com.incquerylabs.emdw.testing.common.utils.ComplexModelUtil
import com.incquerylabs.emdw.toolchain.Toolchain
import eu.mondo.sam.core.DataToken
import eu.mondo.sam.core.metrics.MemoryMetric
import eu.mondo.sam.core.metrics.TimeMetric
import eu.mondo.sam.core.phases.AtomicPhase
import eu.mondo.sam.core.results.PhaseResult
import java.util.Set
import org.apache.log4j.Level
import org.eclipse.emf.common.util.URI
import org.eclipse.emf.ecore.resource.impl.ResourceSetImpl
import org.eclipse.uml2.uml.Component
import org.eclipse.uml2.uml.Model
import org.eclipse.uml2.uml.Package
import org.eclipse.uml2.uml.PackageableElement

class Init_LoadAndScaleModelPhase extends AtomicPhase {
	
	extension val ComplexModelUtil complexModelUtil = new ComplexModelUtil
	
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
		val umlResourceSet = new ResourceSetImpl
		val umlUri = URI.createFileURI(mcToken.umlModelPath)
		val umlResource = umlResourceSet.createResource(umlUri) => [ load(#{}) ]
		val umlModel = umlResource.contents.filter(Model).head
		mcToken.umlModel = umlModel
		mcToken.addLogLine('''Original model size: «umlModel.eAllContents.size»''')
		
		extension val modelMultiplicator = new ModelMultiplicator
		// Find top-level components
		val components = umlModel.findTopLevelComponents
		// Multiplicate components inside
		components.forEach[ copyPackagedElements(mcToken.componentInsideScale, PackageableElement) ]
//		components.forEach[ copyNestedElements(mcToken.componentInsideScale, Classifier) ]
		// Multiplicate components
		components.ownersSet.forEach[ it.copyPackagedElements(mcToken.componentsScale, Component) ]
		mcToken.addLogLine('''Multiplicated model size: «umlModel.eAllContents.size»''')
		
		val toolchainBuilder = Toolchain.builder
		val engine = toolchainBuilder.createDefaultEngine(umlResourceSet)
		val mapping = complexModelUtil.createRootMapping(umlModel, engine)
		val xumlResourceSet = mapping.xtumlrtRoot.eResource.resourceSet
		
		val primitiveTypeMapping = createPrimitiveTypeMapping(umlResourceSet, xumlResourceSet)
		
		toolchainBuilder => [
			it.engine = engine
			it.xumlrtModel = mapping.xtumlrtRoot
			it.primitiveTypeMapping = primitiveTypeMapping
			it.fileManager = new EclipseWorkspaceFileManager("test","src")
		]
		val toolchain = toolchainBuilder.buildOrGetManager
		toolchain.logLevel = Level.TRACE
		mcToken.toolchain = toolchain
		// WORK END
		
		timer.stopMeasure
		memory.measure
		
		phaseResult.addMetrics(timer)
		phaseResult.addMetrics(memory)
		mcToken.addMetrics(phaseName, timer.value, memory.value)
	}
	
	def Set<Package> getOwnersSet(Set<Component> components) {
		val ownersSet = <Package>newHashSet()
		components.forEach[
			if(it.namespace instanceof Package) {
				ownersSet += it.namespace as Package
			}
		]
		return ownersSet
	}
	
	def Set<Component> findTopLevelComponents(Package pack) {
		val innerPackages = pack.packagedElements.filter(Package)
		val allComponents = pack.packagedElements.filter(Component).toSet
		innerPackages.forEach[allComponents += it.findTopLevelComponents]
		return allComponents
	}
	
}