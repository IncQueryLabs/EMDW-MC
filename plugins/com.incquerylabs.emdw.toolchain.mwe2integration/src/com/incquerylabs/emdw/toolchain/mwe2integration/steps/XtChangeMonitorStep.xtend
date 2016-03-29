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

import com.incquerylabs.emdw.cpp.transformation.monitor.XtumlModelChangeMonitor
import org.eclipse.emf.mwe2.runtime.workflow.IWorkflowContext
import org.eclipse.incquery.runtime.api.AdvancedIncQueryEngine
import org.eclipse.viatra.emf.mwe2integration.IPublishTo
import org.eclipse.viatra.emf.mwe2integration.mwe2impl.TransformationStep

class XtChangeMonitorStep extends TransformationStep {
	AdvancedIncQueryEngine engine
	XtumlModelChangeMonitor xtumlChangeMonitor

	override void doInitialize(IWorkflowContext ctx) {
		engine = ctx.get("engine") as AdvancedIncQueryEngine
		xtumlChangeMonitor = new XtumlModelChangeMonitor(engine)
		xtumlChangeMonitor.startMonitoring		
	}

	override void doExecute() {
		xtumlChangeMonitor.createCheckpoint
	}
	
	override publishMessages() {
        for (IPublishTo iPublishTo : publishTo) {
            iPublishTo.publishMessage(xtumlChangeMonitor.dirtyXTComponents);
        }
    }

	override void dispose() {
		xtumlChangeMonitor?.dispose
		xtumlChangeMonitor = null
	}
}
