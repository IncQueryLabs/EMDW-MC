package com.incquerylabs.emdw.toolchain.mwe2integration.steps

import java.util.HashMap
import org.eclipse.emf.common.util.URI
import org.eclipse.emf.mwe2.runtime.workflow.WorkflowContextImpl
import org.eclipse.viatra.emf.mwe2integration.initializer.MWE2IntegrationInitializer

class MWE2IntegrationRunner {
	private String workflowPath
	extension MWE2IntegrationInitializer initializer = new MWE2IntegrationInitializer()
	
	new(String path){
		workflowPath = path
	}
	
	
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
