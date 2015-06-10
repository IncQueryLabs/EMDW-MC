package com.incquerylabs.emdw.cpp.ui.util

import com.ericsson.xtumlrt.oopl.cppmodel.CPPModel
import com.ericsson.xtumlrt.oopl.cppmodel.CppmodelFactory
import com.incquerylabs.emdw.cpp.codegeneration.CPPCodeGeneration
import com.incquerylabs.emdw.cpp.transformation.XtumlComponentCPPTransformation
import com.incquerylabs.emdw.cpp.transformation.queries.XtumlQueries
import com.incquerylabs.emdw.cpp.ui.GeneratorHelper
import org.apache.log4j.Level
import org.apache.log4j.Logger
import org.eclipse.emf.common.util.URI
import org.eclipse.emf.ecore.resource.ResourceSet
import org.eclipse.incquery.runtime.api.AdvancedIncQueryEngine
import org.eclipse.incquery.runtime.api.IncQueryEngine
import org.eclipse.incquery.runtime.emf.EMFScope
import org.eclipse.papyrusrt.xtumlrt.common.Model
import org.eclipse.papyrusrt.xtumlrt.xtuml.XTComponent
import com.ericsson.xtumlrt.oopl.OoplFactory

class CodeGenerator {
		
	extension XtumlQueries xtumlQueries = XtumlQueries.instance
	extension CppmodelFactory cppFactory = CppmodelFactory.eINSTANCE
	extension OoplFactory ooplFactory = OoplFactory.eINSTANCE
	
	def generateCodeFromXtComponents(Iterable<XTComponent> xtComponents) {
		xtComponents.forEach[ xtComponent |
	    	val xtResource = xtComponent.eResource
            val xtResourceSet = xtResource.resourceSet
            
	    	val engine = AdvancedIncQueryEngine.createUnmanagedEngine(new EMFScope(xtResourceSet))
	    	xtumlQueries.prepare(engine)
	    	
	    	val modelToEntityMatcher = getXtModelEntities(engine)
	    	val cppComponentMatcher = getCppComponents(engine)
	    	
			val xtModel = modelToEntityMatcher.getAllValuesOfxtModel(xtComponent).head
			val cppModel = getOrCreateCPPModel(xtModel, engine, xtResourceSet)
			val cppResource = cppModel.eResource
			
			loadCPPBasicTypes(xtResourceSet)
	
			// Create the CPPComponent with its directories if it does not exist
			// The incremental part of the m2m transformation should provide the cppComponent in the future
			if(!cppComponentMatcher.hasMatch(xtComponent, null)){
				val componentHeaderDir = cppFactory.createCPPDirectory
				cppResource.contents += componentHeaderDir
				val componentBodyDir = cppFactory.createCPPDirectory
				cppResource.contents += componentBodyDir
				val cppComponent = createCPPComponent => [
					it.xtComponent = xtComponent
					it.headerDirectory = componentHeaderDir
					it.bodyDirectory = componentBodyDir
				]
				cppModel.subElements += cppComponent
			}
			
			Logger.getLogger(XtumlComponentCPPTransformation.package.name).level = Level.DEBUG
			val xform = new XtumlComponentCPPTransformation
			xform.initialize(xtModel, engine)
			xform.execute
			cppResource.save(null)
			
			Logger.getLogger(CPPCodeGeneration.package.name).level = Level.DEBUG
			val codegen = new CPPCodeGeneration
			codegen.initialize(cppModel, engine)
			codegen.execute
			val generatedFiles = codegen.generatedFiles
			generatedFiles.forEach[ fileName, content |
				GeneratorHelper.createFileNextToWorkspaceResource(xtResource, fileName, true, content)
			]
	    ]
	}
	
	def getOrCreateCPPModel(Model xtmodel, IncQueryEngine engine, ResourceSet rs) {
		val modelMatcher = getXtModelToCppModel(engine)  
		var CPPModel cppModel = null
		if(modelMatcher.hasMatch(xtmodel, null)){
			cppModel = modelMatcher.getOneArbitraryMatch(xtmodel, null).cppModel
			if (cppModel.ooplNameProvider == null) {
				cppModel.ooplNameProvider = createOOPLExistingNameProvider => [
					commonNamedElement = xtmodel
				]
			}
		} else {
			cppModel = createCPPModel => [
				commonModel = xtmodel
				ooplNameProvider = createOOPLExistingNameProvider => [
					commonNamedElement = xtmodel
				]
			]
			
			val uriWithoutExtension = xtmodel.eResource.getURI.trimFileExtension
			val uri = uriWithoutExtension.appendFileExtension("cppmodel")
			val cppResource = rs.createResource(uri)
			cppResource.contents += cppModel
		}
		return cppModel
	}
	
	def loadCPPBasicTypes(ResourceSet rs) {
		rs.getResource(URI.createPlatformPluginURI("/com.incquerylabs.emdw.cpp.transformation/model/cppBasicTypes.cppmodel", true), true)
	}
}