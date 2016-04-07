/*******************************************************************************
 * Copyright (c) 2015-2016, IncQuery Labs Ltd. and Ericsson AB
 * All rights reserved. This program and the accompanying materials
 * are made available under the terms of the Eclipse Public License v1.0
 * which accompanies this distribution, and is available at
 * http://www.eclipse.org/legal/epl-v10.html
 *
 * Contributors:
 *   Akos Horvath, Abel Hegedus, Zoltan Ujhelyi, Peter Lunk - initial API and implementation
 *******************************************************************************/
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
