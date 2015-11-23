package com.incquerylabs.emdw.toolchain.mwe2integration

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
import org.eclipse.viatra.emf.mwe2integration.eventdriven.mwe2impl.MWE2ControlledExecutor
import org.eclipse.viatra.emf.mwe2integration.mwe2impl.TransformationStep

class CppQrtTransformationStep extends TransformationStep {
	AdvancedIncQueryEngine engine
	XtumlCPPTransformationQrt cppQrtTrafo
	MWE2ControlledExecutor executor
	
	static val DEFAULT_CPP_BASIC_TYPES_PATH = "/com.incquerylabs.emdw.cpp.transformation/model/cppBasicTypes.cppmodel"
	static val DEFAULT_IMPLEMENTATIONS_PATH = "/com.incquerylabs.emdw.cpp.transformation/model/defaultImplementations.cppmodel"
	
	protected URI CPP_BASIC_TYPES_URI = URI.createPlatformPluginURI(DEFAULT_CPP_BASIC_TYPES_PATH, true)
	protected URI COLLECTION_IMPLEMENTATIONS_URI = URI.createPlatformPluginURI(DEFAULT_IMPLEMENTATIONS_PATH, true)
	

	override void doInitialize(IWorkflowContext ctx) {
		engine = ctx.get("engine") as AdvancedIncQueryEngine
		executor = new MWE2ControlledExecutor(IncQueryEventRealm.create(engine));
		
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
		rs.getResource(CPP_BASIC_TYPES_URI, true)
	}
	
	private def loadDefaultContainerImplementations(ResourceSet rs) {
		rs.getResource(COLLECTION_IMPLEMENTATIONS_URI, true)
	}
}
