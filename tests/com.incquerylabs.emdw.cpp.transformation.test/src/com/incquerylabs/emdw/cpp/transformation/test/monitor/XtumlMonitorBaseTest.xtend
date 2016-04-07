/*******************************************************************************
 * Copyright (c) 2015-2016, IncQuery Labs Ltd. and Ericsson AB
 * All rights reserved. This program and the accompanying materials
 * are made available under the terms of the Eclipse Public License v1.0
 * which accompanies this distribution, and is available at
 * http://www.eclipse.org/legal/epl-v10.html
 *
 * Contributors:
 *   Akos Horvath, Abel Hegedus, Zoltan Ujhelyi, Daniel Segesdi, Tamas Borbas, Robert Doczi, Peter Lunk, Istvan Papp - initial API and implementation
 *******************************************************************************/
package com.incquerylabs.emdw.cpp.transformation.test.monitor

import com.incquerylabs.emdw.cpp.transformation.monitor.XtumlModelChangeMonitor
import com.incquerylabs.emdw.cpp.transformation.queries.XtumlQueries
import com.incquerylabs.emdw.testing.common.utils.XtumlUtil
import java.util.Set
import org.apache.log4j.Level
import org.apache.log4j.Logger
import org.eclipse.incquery.runtime.api.AdvancedIncQueryEngine
import org.eclipse.incquery.runtime.emf.EMFScope
import org.eclipse.papyrusrt.xtumlrt.common.Model
import org.eclipse.papyrusrt.xtumlrt.xtuml.XTComponent
import org.junit.BeforeClass
import org.junit.Test

abstract class XtumlMonitorBaseTest {
	protected extension XtumlQueries xtumlQueries = XtumlQueries.instance
	protected extension Logger logger = Logger.getLogger(class)
	protected extension XtumlUtil xtumlUtil = new XtumlUtil
	
	@BeforeClass
	def static setupRootLogger() {
		Logger.getLogger(XtumlMonitorBaseTest.package.name).level = Level.TRACE
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
	
	def startTest(String testId){
		info('''START TEST: «testId»''')
	}
	
	def endTest(String testId){
		info('''END TEST: «testId»''')
	}
	
}