package com.incquerylabs.emdw.toolchain.mwe2integration

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
