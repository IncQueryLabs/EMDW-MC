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

import com.incquerylabs.emdw.umlintegration.TransformationQrt
import com.incquerylabs.emdw.umlintegration.UmlIntegrationExtension
import com.incquerylabs.emdw.umlintegration.cpp.CPPRuleExtensionService
import java.util.Map
import java.util.Set
import org.eclipse.emf.ecore.resource.Resource
import org.eclipse.emf.mwe2.runtime.workflow.IWorkflowContext
import org.eclipse.incquery.runtime.api.AdvancedIncQueryEngine
import org.eclipse.incquery.runtime.evm.specific.event.IncQueryEventRealm
import org.eclipse.uml2.uml.Type
import org.eclipse.viatra.emf.mwe2integration.mwe2impl.TransformationStep
import org.eclipse.viatra.emf.mwe2integration.eventdriven.mwe2impl.MWE2ControllableExecutor

class XtTransformationStep extends TransformationStep {
	AdvancedIncQueryEngine engine
	TransformationQrt xtTrafo
	Set<UmlIntegrationExtension> extensionServices
	MWE2ControllableExecutor executor

	override void doInitialize(IWorkflowContext ctx) {
		engine = ctx.get("engine") as AdvancedIncQueryEngine
		executor = new MWE2ControllableExecutor(IncQueryEventRealm.create(engine));
		
		
		if(xtTrafo == null){
			xtTrafo = new TransformationQrt
		}
		if(extensionServices == null) {
			extensionServices = <UmlIntegrationExtension>newHashSet(new CPPRuleExtensionService)
		}
		
		val xUmlRtResource = ctx.get("xumlrtResource") as Resource
		val Set<UmlIntegrationExtension> extensionServices = newHashSet(new CPPRuleExtensionService)
		val primitiveTypeMapping = ctx.get("primitiveTypeMapping") as Map<Type, org.eclipse.papyrusrt.xtumlrt.common.Type>
		extensionServices.forEach[initialize(engine, xUmlRtResource)]
		xtTrafo.extensionServices = extensionServices
		xtTrafo.externalTypeMap = primitiveTypeMapping
		xtTrafo.executor = executor
		xtTrafo.initialize(engine)
		
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
		extensionServices = null
		xtTrafo?.dispose
		xtTrafo = null
	}
}
