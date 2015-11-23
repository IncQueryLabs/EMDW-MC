package com.incquerylabs.emdw.toolchain.mwe2integration

import com.incquerylabs.emdw.cpp.common.util.EMDWNullProgressMonitor
import com.incquerylabs.emdw.cpp.transformation.XtumlComponentCPPTransformation
import java.util.Set
import org.eclipse.emf.common.util.URI
import org.eclipse.emf.mwe2.runtime.workflow.IWorkflowContext
import org.eclipse.incquery.runtime.api.AdvancedIncQueryEngine
import org.eclipse.papyrusrt.xtumlrt.xtuml.XTComponent
import org.eclipse.viatra.emf.mwe2integration.mwe2impl.TransformationStep
import org.eclipse.xtend.lib.annotations.Accessors

class CppComponentTransformationStep extends TransformationStep {
	AdvancedIncQueryEngine engine
	XtumlComponentCPPTransformation cppCompTrafo
	
	@Accessors Set<XTComponent> dirtyComponents
	
	static val DEFAULT_CPP_BASIC_TYPES_PATH = "/com.incquerylabs.emdw.cpp.transformation/model/cppBasicTypes.cppmodel"
	static val DEFAULT_IMPLEMENTATIONS_PATH = "/com.incquerylabs.emdw.cpp.transformation/model/defaultImplementations.cppmodel"
	
	protected URI CPP_BASIC_TYPES_URI = URI.createPlatformPluginURI(DEFAULT_CPP_BASIC_TYPES_PATH, true)
	protected URI COLLECTION_IMPLEMENTATIONS_URI = URI.createPlatformPluginURI(DEFAULT_IMPLEMENTATIONS_PATH, true)
	

	override void doInitialize(IWorkflowContext ctx) {
		engine = ctx.get("engine") as AdvancedIncQueryEngine
		
		if(cppCompTrafo == null) {
			cppCompTrafo = new XtumlComponentCPPTransformation
		}
		cppCompTrafo.initialize(engine)
	}

	override void doExecute() {
		dirtyComponents.forEach[ comp |
			cppCompTrafo.transformComponent(comp)
			//cppCompTrafo.compileActionCodes(comp, new EMDWNullProgressMonitor)
		]
	}

	override void dispose() {
		cppCompTrafo?.dispose
		cppCompTrafo = null
	}
}
