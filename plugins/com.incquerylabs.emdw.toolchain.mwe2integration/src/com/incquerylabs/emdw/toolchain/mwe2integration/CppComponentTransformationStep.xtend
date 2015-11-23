package com.incquerylabs.emdw.toolchain.mwe2integration

import com.incquerylabs.emdw.cpp.codegeneration.CPPCodeGeneration
import com.incquerylabs.emdw.cpp.codegeneration.MakefileGeneration
import com.incquerylabs.emdw.cpp.common.util.EMDWNullProgressMonitor
import com.incquerylabs.emdw.cpp.transformation.XtumlComponentCPPTransformation
import com.incquerylabs.emdw.umlintegration.TransformationQrt
import java.util.Set
import org.apache.log4j.Level
import org.apache.log4j.Logger
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
	extension val Logger logger = Logger.getLogger(this.class.package.name)

	override void doInitialize(IWorkflowContext ctx) {
		engine = ctx.get("engine") as AdvancedIncQueryEngine
		setLogLevel(Level.TRACE)
		if(cppCompTrafo == null) {
			cppCompTrafo = new XtumlComponentCPPTransformation
		}
		cppCompTrafo.initialize(engine)
	}

	override void doExecute() {
		dirtyComponents.forEach[ comp |
			cppCompTrafo.transformComponent(comp)
			cppCompTrafo.compileActionCodes(comp, new EMDWNullProgressMonitor)
		]
	}

	def setLogLevel(Level commonLoggingLevel){
		logger.level = commonLoggingLevel
		Logger.getLogger(TransformationQrt.package.name).level = commonLoggingLevel
		Logger.getLogger(MakefileGeneration.package.name).level = commonLoggingLevel
		Logger.getLogger(XtumlComponentCPPTransformation.package.name).level = commonLoggingLevel
		Logger.getLogger(CPPCodeGeneration.package.name).level = commonLoggingLevel
	}

	override void dispose() {
		cppCompTrafo?.dispose
		cppCompTrafo = null
	}
}
