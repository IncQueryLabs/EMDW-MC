package com.incquerylabs.emdw.toolchain.mwe2integration

import java.util.HashMap
import org.eclipse.emf.common.util.URI
import org.eclipse.emf.mwe2.runtime.workflow.WorkflowContextImpl
import org.eclipse.viatra.emf.mwe2integration.initializer.MWE2IntegrationInitializer

class MWE2IntegrationRunner {
	public static final String workflowPath = "src/com/incquerylabs/emdw/toolchain/mwe2integration/EMDWWorkflow.mwe2"
	extension MWE2IntegrationInitializer initializer = new MWE2IntegrationInitializer()
	
	def void RunHeadlessEclipse() {
		val  mweRunner = initializeHeadlessEclipse(class.classLoader)
		var WorkflowContextImpl context = new WorkflowContextImpl()
		mweRunner.run(URI.createURI(workflowPath), new HashMap<String, String>(), context)
	}
	
	def void RunPlainJava() {
		val  mweRunner = initializePlainJava()
		var WorkflowContextImpl context = new WorkflowContextImpl()
		mweRunner.run(URI.createURI(workflowPath), new HashMap<String, String>(), context)
	}
}
