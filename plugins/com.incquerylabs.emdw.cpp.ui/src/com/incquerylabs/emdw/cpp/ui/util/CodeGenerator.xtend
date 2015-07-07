package com.incquerylabs.emdw.cpp.ui.util

import com.ericsson.xtumlrt.oopl.OoplFactory
import com.ericsson.xtumlrt.oopl.cppmodel.CPPDirectory
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
import org.eclipse.core.resources.IFolder
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
import com.ericsson.xtumlrt.oopl.cppmodel.CPPComponent

class CodeGenerator {

	extension XtumlQueries xtumlQueries = XtumlQueries.instance
	extension CppmodelFactory cppFactory = CppmodelFactory.eINSTANCE
	extension OoplFactory ooplFactory = OoplFactory.eINSTANCE

	def generateCodeFromXtComponents(ResourceSet xtResourceSet, Iterable<XTComponent> xtComponents, ExecutionEvent event) {
		val engine = AdvancedIncQueryEngine.createUnmanagedEngine(new EMFScope(xtResourceSet))
		
		val validXtumlModel = validateXtumlModel(engine, event)
		if(validXtumlModel){
			xtComponents.forEach[ xtComponent |
				performCodeGenerationOnXtComponent(engine, xtComponent, xtResourceSet)
			]
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
	
	def performCodeGenerationOnXtComponent(AdvancedIncQueryEngine engine, XTComponent xtComponent, ResourceSet xtResourceSet) {
		xtumlQueries.prepare(engine)
		val modelToEntityMatcher = getXtModelEntities(engine)

		val xtModel = modelToEntityMatcher.getAllValuesOfxtModel(xtComponent).head
		val cppModel = getOrCreateCPPModel(xtModel, engine, xtResourceSet)
		val cppResource = cppModel.eResource
		
		loadCPPBasicTypes(xtResourceSet)
		
		// Create the CPPComponent with its directories if it does not exist
		// The incremental part of the m2m transformation should provide 
		// the cppComponent (and its name provider) in the future
		createOrUpdateCppComponent(engine, xtComponent, cppModel)
		
		performCppTransformation(engine, xtComponent)
		cppResource.save(null)
		
		val cppComponent = engine.cppComponents.getAllValuesOfcppComponent(xtComponent).head
		val cppCodeGeneration = new CPPCodeGeneration
		performCodeGeneration(engine, cppCodeGeneration, cppComponent)
		
		val targetFolder = GeneratorHelper.getTargetFolder(cppResource)
		performFileGeneration(engine, cppComponent, cppCodeGeneration, targetFolder)

		cppCodeGeneration.dispose
	}
	
	def performCppTransformation(AdvancedIncQueryEngine engine, XTComponent xtComponent){
		Logger.getLogger(XtumlComponentCPPTransformation.package.name).level = Level.DEBUG
		val xform = new XtumlComponentCPPTransformation
		xform.initialize(engine)
		xform.execute(xtComponent)
		xform.dispose
	}
	
	def performCodeGeneration(AdvancedIncQueryEngine engine, CPPCodeGeneration cppCodeGeneration, CPPComponent cppComponent){
		Logger.getLogger(CPPCodeGeneration.package.name).level = Level.DEBUG
		cppCodeGeneration.initialize(engine)
		cppCodeGeneration.execute(cppComponent)
	}
	
	def performFileGeneration(AdvancedIncQueryEngine engine, CPPComponent cppComponent, CPPCodeGeneration cppCodeGeneration, IFolder targetFolder){
		val generatedCPPSourceFiles = cppCodeGeneration.generatedCPPSourceFiles
		
		val filegen = new FileAndDirectoryGeneration
		val fileManager = new EclipseWorkspaceFileManager(targetFolder)
		//val fileManager = new JavaIOBasedFileManager(targetFolder.rawLocation.makeAbsolute.toOSString)
		filegen.initialize(engine, fileManager, generatedCPPSourceFiles)
		filegen.execute(cppComponent.headerDirectory)
		if(cppComponent.bodyDirectory != cppComponent.headerDirectory){
			filegen.execute(cppComponent.bodyDirectory)
		}
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
		
	def void createOrUpdateCppComponent(AdvancedIncQueryEngine engine, XTComponent xtComponent, CPPModel cppModel){
		val cppResource = cppModel.eResource
		val cppComponentMatcher = getCppComponents(engine)
		if (!cppComponentMatcher.hasMatch(xtComponent, null)) {
			val componentDirectory = cppFactory.createCPPDirectory
			cppResource.contents += componentDirectory
			val cppComponent = createCppComponent(componentDirectory, xtComponent)
			cppModel.subElements += cppComponent
		} else {
			val cppComponent = cppComponentMatcher.getAllValuesOfcppComponent(xtComponent).head
			if (cppComponent.ooplNameProvider == null) {
				cppComponent.ooplNameProvider = createOOPLExistingNameProvider => [
					commonNamedElement = xtComponent
				]
			}
		}
	}
	
	def createCppComponent(CPPDirectory componentDirectory, XTComponent xtComponent){
		val mainBodyFile = createCPPBodyFile
		val mainHeaderFile = createCPPHeaderFile
		val declHeaderFile = createCPPHeaderFile
		val defHeaderFile = createCPPHeaderFile
		componentDirectory.files += mainBodyFile
		componentDirectory.files += mainHeaderFile
		componentDirectory.files += declHeaderFile
		componentDirectory.files += defHeaderFile
		
		val cppComponent = createCPPComponent => [
			it.xtComponent = xtComponent
			it.headerDirectory = componentDirectory
			it.bodyDirectory = componentDirectory
			
			it.mainBodyFile = mainBodyFile
			it.mainHeaderFile = mainHeaderFile
			it.declarationHeaderFile = declHeaderFile
			it.definitionHeaderFile = defHeaderFile
			
			it.ooplNameProvider = createOOPLExistingNameProvider => [
				commonNamedElement = xtComponent
			]
		]
		return cppComponent
	}

	def loadCPPBasicTypes(ResourceSet rs) {
		rs.getResource(
			URI.createPlatformPluginURI("/com.incquerylabs.emdw.cpp.transformation/model/cppBasicTypes.cppmodel", true),
			true)
		}
	}