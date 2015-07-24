package com.incquerylabs.emdw.cpp.transformation.test.monitor

import com.google.common.collect.ImmutableList
import com.incquerylabs.emdw.cpp.transformation.monitor.XtumlModelChangeMonitor
import com.incquerylabs.emdw.cpp.transformation.queries.XtumlQueries
import com.incquerylabs.emdw.cpp.transformation.test.TestWithoutParameters
import com.incquerylabs.emdw.cpp.transformation.test.wrappers.TransformationWrapper
import com.incquerylabs.emdw.cpp.transformation.test.wrappers.XtumlCPPTransformationWrapper
import java.util.Set
import org.eclipse.incquery.runtime.api.AdvancedIncQueryEngine
import org.eclipse.incquery.runtime.emf.EMFScope
import org.eclipse.papyrusrt.xtumlrt.common.Model
import org.eclipse.papyrusrt.xtumlrt.xtuml.XTComponent
import org.junit.Test
import org.junit.runners.Parameterized.Parameters

import static com.incquerylabs.emdw.cpp.transformation.test.TransformationTestUtil.*

abstract class XtumlMonitorBaseTest extends TestWithoutParameters {
	
	protected extension XtumlQueries xtumlQueries = XtumlQueries.instance
	
	new(TransformationWrapper wrapper, String wrapperType) {
		super(wrapper, wrapperType)
	}	
	
	
	@Parameters(name="{index}: {1}")
	public static def transformations() {
		val alternatives = ImmutableList.builder
		.add(new XtumlCPPTransformationWrapper()).build

		alternatives.map [
			val simpleName = it.class.simpleName
			#[it, simpleName].toArray
		]
	}
	
	@Test
	def change_monitor_test() {
		val testId = "change_monitor_test"
		startTest(testId)
		
		val xtModel = createEmptyXtumlModel(this.class.simpleName + "_" + testId)
		val engine = AdvancedIncQueryEngine.createUnmanagedEngine(new EMFScope(xtModel.eResource.resourceSet))
		
		prepareXtUmlModel(xtModel)
		
		val xtumlMonitor = new XtumlModelChangeMonitor(engine)
		xtumlMonitor.startMonitoring
		
		modifyXtumlModel(xtModel)
		
		xtumlMonitor.createCheckpoint
		
		assertDirtyComponents(xtumlMonitor.dirtyXTComponents)
		
		xtumlMonitor.dispose
		engine.dispose
	}
	
	protected def void prepareXtUmlModel(Model xtModel)
	
	protected def void modifyXtumlModel(Model xtModel)
	
	protected def void assertDirtyComponents(Set<XTComponent> components)
	
}