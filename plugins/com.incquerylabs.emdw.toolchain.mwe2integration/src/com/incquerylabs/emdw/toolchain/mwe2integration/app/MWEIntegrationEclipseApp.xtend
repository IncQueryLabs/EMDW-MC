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
package com.incquerylabs.emdw.toolchain.mwe2integration.app

import com.incquerylabs.uml.ralf.ReducedAlfLanguageStandaloneSetup
import java.util.Arrays
import java.util.HashMap
import java.util.List
import org.eclipse.emf.common.util.URI
import org.eclipse.emf.mwe2.runtime.workflow.WorkflowContextImpl
import org.eclipse.equinox.app.IApplication
import org.eclipse.equinox.app.IApplicationContext
import org.eclipse.viatra.emf.mwe2integration.initializer.MWE2IntegrationInitializer

class MWEIntegrationEclipseApp implements IApplication{

	private static final String APP_NAME = "MWE2Integration RCP App"
	private static final String ARGS_HELP = 
	'''
	We need these arguments:
	 * first arg: uml model path
	 * second arg: target folder for generated code
	 * third arg: MWE file location
	'''	
	
	private static def boolean checkArguments(List<String> args) {
		System.out.println("Passed arguments:")
		args.forEach(arg | println(" * "+arg))
		if (args === null || args.size() < 2) {
			System.out.println(ARGS_HELP)
			return false
		}
		return true
	}
	
	override start(IApplicationContext context) throws Exception {
		var List<String> args = Arrays.asList(context.getArguments().get("application.args") as String[])	
		
		System.out.println('''************* «APP_NAME» started *************''')
		if(args.checkArguments) {
			val initializer = new MWE2IntegrationInitializer
			
			// Initialize Xtext languages
			new ReducedAlfLanguageStandaloneSetup().createInjectorAndDoEMFRegistration()
			
			val  mweRunner = initializer.initializeHeadlessEclipse(MWEIntegrationEclipseApp.classLoader)
			var WorkflowContextImpl workflowcontext = new WorkflowContextImpl()
			workflowcontext.put("umlModelPath", args.get(0))
			workflowcontext.put("targetFolderPath", args.get(1))
			

			var URI mwe2FileUri
			if(args.size == 3){
				mwe2FileUri = URI.createURI(args.get(2))
			}else {
				mwe2FileUri = URI::createURI(MWEIntegrationApp.getResource("/com/incquerylabs/emdw/toolchain/mwe2integration/EMDWRcpWorkflow.mwe2").toString)
			}

			mweRunner.run(mwe2FileUri, new HashMap<String, String>(), workflowcontext)	
		}
		System.out.println('''************* «APP_NAME» finished *************''')
		return IApplication.EXIT_OK
	}
	
	override stop() {
		
	}
	
}