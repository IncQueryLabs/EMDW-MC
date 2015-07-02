package com.incquerylabs.emdw.cpp.ui.util

import com.ericsson.xtumlrt.oopl.OoplFactory
import com.ericsson.xtumlrt.oopl.cppmodel.CPPModel
import com.ericsson.xtumlrt.oopl.cppmodel.CppmodelFactory
import com.incquerylabs.emdw.cpp.codegeneration.CPPCodeGeneration
import com.incquerylabs.emdw.cpp.codegeneration.FileAndDirectoryGeneration
import com.incquerylabs.emdw.cpp.codegeneration.fsa.impl.EclipseWorkspaceFileManager
import com.incquerylabs.emdw.cpp.transformation.XtumlComponentCPPTransformation
import com.incquerylabs.emdw.cpp.transformation.queries.XtumlQueries
import com.incquerylabs.emdw.cpp.ui.GeneratorHelper
import com.incquerylabs.emdw.xtuml.incquery.TransitionTriggerWithoutSignalConstraint0
import org.apache.log4j.Level
import org.apache.log4j.Logger
import org.eclipse.core.commands.ExecutionEvent
import org.eclipse.emf.common.util.URI
import org.eclipse.emf.ecore.resource.ResourceSet
import org.eclipse.incquery.runtime.api.AdvancedIncQueryEngine
import org.eclipse.incquery.runtime.api.IncQueryEngine
import org.eclipse.incquery.runtime.emf.EMFScope
import org.eclipse.incquery.validation.core.ValidationEngine
import org.eclipse.jface.dialogs.MessageDialog
import org.eclipse.papyrusrt.xtumlrt.common.Model
import org.eclipse.papyrusrt.xtumlrt.xtuml.XTComponent
import org.eclipse.ui.handlers.HandlerUtil

class CodeGenerator {

	extension XtumlQueries xtumlQueries = XtumlQueries.instance
	extension CppmodelFactory cppFactory = CppmodelFactory.eINSTANCE
	extension OoplFactory ooplFactory = OoplFactory.eINSTANCE

	def generateCodeFromXtComponents(ResourceSet xtResourceSet, Iterable<XTComponent> xtComponents, ExecutionEvent event) {

		val engine = AdvancedIncQueryEngine.createUnmanagedEngine(new EMFScope(xtResourceSet))
		
		val validXtumlModel = validateXtumlModel(engine, event)
		if(validXtumlModel){
			performCodeGeneration(engine, xtComponents, xtResourceSet)
    	}

		engine.dispose
	}
	
	def validateXtumlModel(AdvancedIncQueryEngine engine, ExecutionEvent event) {
		val validationEngine = ValidationEngine.builder.setEngine(engine).build
		val constraintSpecifications = #{
			new TransitionTriggerWithoutSignalConstraint0()
		}
		constraintSpecifications.forEach[
			validationEngine.addConstraintSpecification(it)
		]
    	validationEngine.initialize
    	val allViolations = validationEngine.constraints.map[listViolations].flatten 
    	val validXtumlModel = allViolations.empty
		if(!validXtumlModel){
    		MessageDialog.openError(HandlerUtil.getActiveShell(event),
    			 "Invalid xtUML model",
    			'''
    			The following problems were found in the xtUML model, please correct and re-run code generation:
    			«FOR violation : allViolations»
    			  - «violation.message»
    			«ENDFOR»
    			'''
    		)
    	}
		validationEngine.dispose   
		validXtumlModel
	}
	
	def performCodeGeneration(AdvancedIncQueryEngine engine, Iterable<XTComponent> xtComponents, ResourceSet xtResourceSet) {
		xtumlQueries.prepare(engine)
		val modelToEntityMatcher = getXtModelEntities(engine)
		val cppComponentMatcher = getCppComponents(engine)
			
		xtComponents.forEach [ xtComponent |
			val xtModel = modelToEntityMatcher.getAllValuesOfxtModel(xtComponent).head
			val cppModel = getOrCreateCPPModel(xtModel, engine, xtResourceSet)
			val cppResource = cppModel.eResource
			
			loadCPPBasicTypes(xtResourceSet)
			
			// Create the CPPComponent with its directories if it does not exist
			// The incremental part of the m2m transformation should provide 
			// the cppComponent (and its name provider) in the future
			if (!cppComponentMatcher.hasMatch(xtComponent, null)) {
				val componentDir = cppFactory.createCPPDirectory
				cppResource.contents += componentDir
				val mainBodyFile = createCPPBodyFile
				val mainHeaderFile = createCPPHeaderFile
				val declHeaderFile = createCPPHeaderFile
				val defHeaderFile = createCPPHeaderFile
				componentDir.files += mainBodyFile
				componentDir.files += mainHeaderFile
				componentDir.files += declHeaderFile
				componentDir.files += defHeaderFile
				
				val cppComponent = createCPPComponent => [
					it.xtComponent = xtComponent
					it.headerDirectory = componentDir
					it.bodyDirectory = componentDir
					
					it.mainBodyFile = mainBodyFile
					it.mainHeaderFile = mainHeaderFile
					it.declarationHeaderFile = declHeaderFile
					it.definitionHeaderFile = defHeaderFile
					
					it.ooplNameProvider = createOOPLExistingNameProvider => [
						commonNamedElement = xtComponent
					]
				]
				cppModel.subElements += cppComponent
			} else {
				val cppComponent = cppComponentMatcher.getAllValuesOfcppComponent(xtComponent).head
				if (cppComponent.ooplNameProvider == null) {
					cppComponent.ooplNameProvider = createOOPLExistingNameProvider => [
						commonNamedElement = xtComponent
					]
				}
			}
			
			Logger.getLogger(XtumlComponentCPPTransformation.package.name).level = Level.DEBUG
			val xform = new XtumlComponentCPPTransformation
			xform.initialize(xtModel, engine)
			xform.execute
			xform.dispose
			cppResource.save(null)
			
			Logger.getLogger(CPPCodeGeneration.package.name).level = Level.DEBUG
			val codegen = new CPPCodeGeneration
			codegen.initialize(cppModel, engine)
			codegen.execute
			
			val generatedCPPSourceFiles = codegen.generatedCPPSourceFiles
			
			val filegen = new FileAndDirectoryGeneration
			val targetFolder = GeneratorHelper.getTargetFolder(xtComponent.eResource)
			val fileManager = new EclipseWorkspaceFileManager(targetFolder)
			//val fileManager = new JavaIOBasedFileManager(targetFolder.rawLocation.makeAbsolute.toOSString)
			filegen.initialize(engine, fileManager, generatedCPPSourceFiles)
			filegen.execute

			codegen.dispose
		]
	}

	def getOrCreateCPPModel(Model xtmodel, IncQueryEngine engine, ResourceSet rs) {
		val modelMatcher = getXtModelToCppModel(engine)
		var CPPModel cppModel = null
		if (modelMatcher.hasMatch(xtmodel, null)) {
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
		rs.getResource(
			URI.createPlatformPluginURI("/com.incquerylabs.emdw.cpp.transformation/model/cppBasicTypes.cppmodel", true),
			true)
		}
	}