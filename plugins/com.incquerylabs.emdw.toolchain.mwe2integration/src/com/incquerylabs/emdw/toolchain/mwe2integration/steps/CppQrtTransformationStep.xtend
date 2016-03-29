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

import com.ericsson.xtumlrt.oopl.OoplQueryBasedFeatures
import com.ericsson.xtumlrt.oopl.cppmodel.derived.QueryBasedFeatures
import com.incquerylabs.emdw.cpp.transformation.XtumlCPPTransformationQrt
import org.eclipse.emf.common.util.URI
import org.eclipse.emf.ecore.resource.Resource
import org.eclipse.emf.ecore.resource.ResourceSet
import org.eclipse.emf.mwe2.runtime.workflow.IWorkflowContext
import org.eclipse.incquery.runtime.api.AdvancedIncQueryEngine
import org.eclipse.incquery.runtime.api.GenericPatternGroup
import org.eclipse.incquery.runtime.api.IncQueryEngine
import org.eclipse.incquery.runtime.emf.EMFScope
import org.eclipse.incquery.runtime.evm.specific.event.IncQueryEventRealm
import org.eclipse.viatra.emf.mwe2integration.eventdriven.mwe2impl.MWE2ControllableExecutor
import org.eclipse.viatra.emf.mwe2integration.mwe2impl.TransformationStep
import com.incquerylabs.emdw.cpp.common.EMDWConstants

class CppQrtTransformationStep extends TransformationStep {
	AdvancedIncQueryEngine engine
	XtumlCPPTransformationQrt cppQrtTrafo
	MWE2ControllableExecutor executor
	
	override void doInitialize(IWorkflowContext ctx) {
		engine = ctx.get("engine") as AdvancedIncQueryEngine
		executor = new MWE2ControllableExecutor(IncQueryEventRealm.create(engine));
		
		val xUmlRtResource = ctx.get("xumlrtResource") as Resource
		
		val resourceSet = xUmlRtResource.resourceSet
		val managedEngine = IncQueryEngine.on(new EMFScope(resourceSet))
		GenericPatternGroup.of(
			OoplQueryBasedFeatures.instance,
			QueryBasedFeatures.instance
		).prepare(managedEngine)
		resourceSet.loadCPPBasicTypes
		resourceSet.loadDefaultContainerImplementations
		
		if(cppQrtTrafo == null) {
			cppQrtTrafo = new XtumlCPPTransformationQrt
		}
		cppQrtTrafo.executor = executor
		cppQrtTrafo.initialize(engine)

	}

	override void doExecute() {
		executor.run();
        while (!executor.isFinished()) {
            try {
                Thread.sleep(10);
            } catch (InterruptedException e) {
                e.printStackTrace();
            }
        }
	}

	override void dispose() {
		executor = null
		cppQrtTrafo?.dispose
		cppQrtTrafo = null
	}
	
	private def loadCPPBasicTypes(ResourceSet rs) {
		rs.getResource(URI.createURI(EMDWConstants.CPP_BASIC_TYPES_LIBRARY_PATH), true)
	}
	
	private def loadDefaultContainerImplementations(ResourceSet rs) {
		rs.getResource(URI.createURI(EMDWConstants.CPP_COLLECTIONS_LIBRARY_PATH), true)
	}
}
