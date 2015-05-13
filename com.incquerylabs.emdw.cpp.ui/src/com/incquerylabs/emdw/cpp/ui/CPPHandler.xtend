package com.incquerylabs.emdw.cpp.ui

import org.eclipse.core.commands.AbstractHandler
import org.eclipse.core.commands.ExecutionEvent
import org.eclipse.core.commands.ExecutionException
import org.eclipse.ui.handlers.HandlerUtil
import org.eclipse.jface.viewers.IStructuredSelection
import org.eclipse.papyrusrt.xtumlrt.xtuml.XTClass
import org.eclipse.incquery.runtime.api.AdvancedIncQueryEngine
import org.eclipse.incquery.runtime.emf.EMFScope
import com.incquerylabs.emdw.cpp.transformation.queries.XtumlQueries
import com.ericsson.xtumlrt.oopl.cppmodel.CPPModel
import com.ericsson.xtumlrt.oopl.cppmodel.CppmodelFactory
import org.eclipse.incquery.runtime.api.IncQueryEngine
import org.eclipse.papyrusrt.xtumlrt.common.Model
import org.eclipse.emf.ecore.resource.ResourceSet
import com.incquerylabs.emdw.cpp.transformation.XtumlComponentCPPTransformation
import com.incquerylabs.emdw.cpp.codegeneration.CPPCodeGeneration
import org.apache.log4j.Logger
import org.apache.log4j.Level

class CPPHandler extends AbstractHandler {
	
	extension XtumlQueries xtumlQueries = XtumlQueries.instance
	extension CppmodelFactory cppFactory = CppmodelFactory.eINSTANCE
	
	override execute(ExecutionEvent event) throws ExecutionException {
		val selection = HandlerUtil.getCurrentSelection(event);

        if (selection instanceof IStructuredSelection) {
            selection.toList.filter(XTClass).forEach[ xtClass |
            	
            	val xtResource = xtClass.eResource
            	val rs = xtResource.resourceSet
            	val engine = AdvancedIncQueryEngine.createUnmanagedEngine(new EMFScope(rs))
            	xtumlQueries.prepare(engine)
            	
            	val modelToClassMatcher = getXtModelXTClasses(engine)
            	val classStateMachineMatcher = getCppClassStateMachine(engine)
            	
            	if(modelToClassMatcher.hasMatch(null, xtClass)){
            		
            		val xtmodel = modelToClassMatcher.getOneArbitraryMatch(null, xtClass).xtModel
            		val cppModel = xtmodel.getOrCreateCPPModel(engine, rs)
            		if(!classStateMachineMatcher.hasMatch(xtClass, null, null)){
	            		val cppClass = createCPPClass => [
	            			it.xtClass = xtClass
	            		]
	            		cppModel.subElements += cppClass
            		} else {
            			val cppClass = classStateMachineMatcher.getOneArbitraryMatch(xtClass, null, null).cppClass
            			cppClass.subElements.clear
            		}
            		
            		Logger.getLogger(XtumlComponentCPPTransformation.package.name).level = Level.DEBUG
            		val xform = new XtumlComponentCPPTransformation
            		xform.initialize(xtmodel, engine)
            		xform.execute
            		
            		Logger.getLogger(CPPCodeGeneration.package.name).level = Level.DEBUG
            		val codegen = new CPPCodeGeneration
            		codegen.initialize(cppModel, engine)
            		codegen.execute
            		val generatedFiles = codegen.generatedFiles
            		generatedFiles.forEach[ fileName, content |
            			GeneratorHelper.createFileNextToWorkspaceResource(xtResource, fileName, true, content)
            		]
            	}
            	
            ]
       	}
       	
       	return null
	}
	
	def getOrCreateCPPModel(Model xtmodel, IncQueryEngine engine, ResourceSet rs) {
		val modelMatcher = getXtModelToCppModel(engine)  
		var CPPModel cppModel = null
		if(modelMatcher.hasMatch(xtmodel, null)){
			cppModel = modelMatcher.getOneArbitraryMatch(xtmodel, null).cppModel
		} else {
			cppModel = cppFactory.createCPPModel => [
				commonModel = xtmodel
			]
			
			val uriWithoutExtension = xtmodel.eResource.getURI.trimFileExtension
			val uri = uriWithoutExtension.appendFileExtension("cppmodel")
			val cppResource = rs.createResource(uri)
			cppResource.contents += cppModel
		}
		return cppModel
	}
	
}