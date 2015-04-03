package com.incquerylabs.emdw.umlintegration.test

import com.incquerylabs.emdw.umlintegration.TransformationQrt
import com.incquerylabs.emdw.umlintegration.rules.AbstractRule
import com.incquerylabs.emdw.umlintegration.trace.TraceFactory
import com.zeligsoft.xtumlrt.common.CommonFactory
import org.apache.log4j.Level
import org.apache.log4j.Logger
import org.eclipse.emf.common.util.URI
import org.eclipse.emf.ecore.resource.impl.ResourceSetImpl
import org.eclipse.incquery.runtime.api.AdvancedIncQueryEngine
import org.eclipse.incquery.runtime.emf.EMFScope
import org.eclipse.uml2.uml.Model
import org.junit.BeforeClass
import org.junit.Test

class IntegrationTest {

	static extension val CommonFactory commonFactory = CommonFactory.eINSTANCE
	static extension val TraceFactory traceFactory = TraceFactory.eINSTANCE

	@Test
	def gpsWatch() {
		val resourceSet = new ResourceSetImpl
		
		val umlResource = resourceSet.createResource(URI.createPlatformPluginURI("/com.incquerylabs.emdw.umlintegration.transformation.test/model/GPSWatch.uml", true)) => [
			load(#{})	
		]
		
		val xtumlrtModel = commonFactory.createModel
		resourceSet.createResource(URI.createURI("dummyXtumlrtUri")) => [
			contents += xtumlrtModel
		]
		
		val mapping = createRootMapping => [
			umlRoot = umlResource.contents.filter(Model).head
			xtumlrtRoot = xtumlrtModel
		]
		resourceSet.createResource(URI.createURI("dummyTraceUri")) => [
			contents += mapping
		]

		val transformation = new TransformationQrt
		val engine = AdvancedIncQueryEngine.createUnmanagedEngine(new EMFScope(resourceSet))
		transformation.initialize(mapping, engine)
		transformation.execute
	}

    @BeforeClass
	def static setupRootLogger() {
		Logger.getLogger(AbstractRule.package.name).level = Level.DEBUG
	}

}