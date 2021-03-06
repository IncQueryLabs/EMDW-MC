/*******************************************************************************
 * Copyright (c) 2015-2016, IncQuery Labs Ltd. and Ericsson AB
 * All rights reserved. This program and the accompanying materials
 * are made available under the terms of the Eclipse Public License v1.0
 * which accompanies this distribution, and is available at
 * http://www.eclipse.org/legal/epl-v10.html
 *
 * Contributors:
 *   Akos Horvath, Abel Hegedus, Zoltan Ujhelyi, Daniel Segesdi, Tamas Borbas, Denes Harmath - initial API and implementation
 *******************************************************************************/
package com.incquerylabs.emdw.umlintegration.papyrus

import com.incquerylabs.emdw.umlintegration.TransformationQrt
import com.incquerylabs.emdw.umlintegration.UmlIntegrationExtension
import com.incquerylabs.emdw.umlintegration.cpp.CPPRuleExtensionService
import com.incquerylabs.emdw.umlintegration.trace.TraceFactory
import com.incquerylabs.uml.papyrus.IncQueryEngineService
import java.util.HashMap
import java.util.Set
import org.apache.log4j.Logger
import org.eclipse.core.resources.ResourcesPlugin
import org.eclipse.emf.common.util.URI
import org.eclipse.emf.ecore.EObject
import org.eclipse.emf.ecore.resource.Resource
import org.eclipse.emf.ecore.resource.ResourceSet
import org.eclipse.emf.ecore.resource.impl.ResourceSetImpl
import org.eclipse.incquery.runtime.api.IncQueryEngine
import org.eclipse.incquery.runtime.emf.EMFBaseIndexWrapper
import org.eclipse.incquery.runtime.evm.specific.TransactionalSchedulers
import org.eclipse.papyrus.infra.core.resource.IModelSetSnippet
import org.eclipse.papyrus.infra.core.resource.ModelSet
import org.eclipse.papyrusrt.xtumlrt.common.CommonFactory
import org.eclipse.papyrusrt.xtumlrt.common.Type
import org.eclipse.uml2.uml.Model
import org.eclipse.uml2.uml.PrimitiveType
import org.eclipse.uml2.uml.resource.UMLResource
import org.eclipse.emf.transaction.RecordingCommand
import com.incquerylabs.emdw.cpp.common.EMDWConstants

class XUMLRTIntegrationModelSetSnippet implements IModelSetSnippet {

	val transformation = new TransformationQrt
	val Logger logger
	
	new(){
		logger = Logger.getLogger(TransformationQrt.package.name)
	}

    private def getEngineManager(ModelSet modelSet) {
    	IncQueryEngineService.getOrStartService(modelSet)
    }

	override start(ModelSet modelSet) {
		try{
			val umlResources = modelSet.resources.filter(UMLResource)
			val primaryUmlResource = umlResources.findFirst[URI.trimFileExtension.equals(modelSet.URIWithoutExtension)]
			
			if(!primaryUmlResource.hasEMDWCommonProjectNature) {
				logger.debug('''The project does not have the EMDW common project nature.''')
				return
			}
			
			val engine = getEngineManager(modelSet).getOrCreateEngine(modelSet)
			// we need to expand the indexing to the additional resource set
			val emfBaseIndex = engine.baseIndex as EMFBaseIndexWrapper
			val resourceSet = new ResourceSetImpl
			emfBaseIndex.navigationHelper.addRoot(resourceSet)
			
			val mappings = newHashSet()
			if (!primaryUmlResource.contents.filter(Model).empty) {
				mappings += createMapping(primaryUmlResource, modelSet, resourceSet)
			}
			
			
			val xUmlRtResource = resourceSet.resources.findFirst[it.URI.toString.contains(".xtuml")]
			// The extension service should be added through an extension point
			val Set<UmlIntegrationExtension> extensionServices = newHashSet(new CPPRuleExtensionService)
			extensionServices.forEach[initialize(engine, xUmlRtResource)]
			
			if(mappings.size == 1) {
				val primitiveTypeMapping = createPrimitiveTypeMapping(engine, resourceSet, modelSet)
				
				val domain = modelSet.transactionalEditingDomain
				val schedulerFactory = TransactionalSchedulers.getTransactionSchedulerFactory(domain)
				transformation.schedulerFactory = schedulerFactory
				transformation.externalTypeMap = primitiveTypeMapping
				
				// This should not be injected to remove dependency
				transformation.extensionServices = extensionServices
				
				transformation.initialize(engine)
				logger.debug("Initialized UML integration transformation")
				transformation.execute
				logger.debug("First execution of UML integration transformation finished")
			} else {
				logger.error('''Exactly 1 root mapping is expected, but found «mappings.size». UML integration cannot continue!''')
			}
		} catch (Exception e) {
			logger.error("Could not setup UML integration transformation!", e)
		}
	}

	def createMapping(Resource umlResource, ModelSet modelSet, ResourceSet resourceSet) {
		
		val xtumlrtModel = CommonFactory.eINSTANCE.createModel
		xtumlrtModel.name = umlResource.contents.filter(Model).head.name
		createResource(umlResource, "xtuml", xtumlrtModel, modelSet, resourceSet)

		val mapping = TraceFactory.eINSTANCE.createRootMapping => [
			umlRoot = umlResource.contents.filter(Model).head
			xtumlrtRoot = xtumlrtModel
			logger.debug("Created root mapping for tracing UML model " + umlRoot.qualifiedName)
		]
		
		createResource(umlResource, "trace", mapping, modelSet, resourceSet)
		
		mapping
	}
	
	def createResource(Resource umlResource, String fileExtension, EObject root, ModelSet modelSet, ResourceSet resourceSet) {
		val uriWithoutExtension = umlResource.getURI.trimFileExtension
		val uri = uriWithoutExtension.appendFileExtension(fileExtension)
		val resource = resourceSet.createResource(uri)
		resource.contents += root
		modelSet.registerModel(new EMFResourcePapyrusModel(resource))
		resource
	}

	override dispose(ModelSet modelSet) {
		val domain = modelSet.transactionalEditingDomain
		val command = new RecordingCommand(domain) {
			override protected doExecute() {
				transformation.dispose
			}
		}
		domain.commandStack.execute(command)
	}
	
	def createPrimitiveTypeMapping(IncQueryEngine engine, ResourceSet rs, ModelSet modelSet){
		val primitiveTypeMapping = new HashMap<org.eclipse.uml2.uml.Type, Type>();
			
		val commonTypesPath = EMDWConstants::XUMLRT_PRIMITIVE_TYPES_LIBRARY_PATH
		val commonTypesURI = URI.createURI(commonTypesPath)
		val commonTypesResource = rs.getResource(commonTypesURI,true);
		
		val commonTypesModel = commonTypesResource.contents.head as org.eclipse.papyrusrt.xtumlrt.common.Model
		val commonTypes = commonTypesModel.packages.head.typeDefinitions.map[td|td.type]

		val umlTypesURI = URI.createURI(UMLResource.UML_PRIMITIVE_TYPES_LIBRARY_URI)
		val umlTypesResource = modelSet.getResource(umlTypesURI, true)
		
		val model = umlTypesResource.contents.filter(Model).head
		val umlTypes = model.packagedElements.filter(PrimitiveType)
		
		commonTypes.forEach[type|
			// Here the void xtUML type is put into the map with null key because 
			// UML null types are mapped to void in xtUML as there is no void UML basic type.
			val umlType = umlTypes.filter[umlType | umlType.name.equals(type.name)].head
			primitiveTypeMapping.put(umlType, type)
		]
		
		logger.debug("Created primitive type mapping")

		primitiveTypeMapping
	}
	
	def hasEMDWCommonProjectNature(Resource resource) {
		val modelPlatformPath = resource.URI.toPlatformString(true)
		if(modelPlatformPath == null) {
			return false
		}
		val modelResource = ResourcesPlugin.workspace.root.findMember(modelPlatformPath)
		if(modelResource == null) {
			return false
		}
		val project = modelResource.project
		return project.hasNature("com.incquerylabs.emdw.common.nature")
	}

}
