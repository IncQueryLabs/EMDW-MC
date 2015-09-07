package com.incquerylabs.emdw.umlintegration.papyrus

import com.google.common.collect.ImmutableList
import com.incquerylabs.emdw.umlintegration.TransformationQrt
import com.incquerylabs.emdw.umlintegration.trace.TraceFactory
import com.incquerylabs.uml.papyrus.IncQueryEngineService
import java.util.HashMap
import org.apache.log4j.Level
import org.apache.log4j.Logger
import org.apache.log4j.RollingFileAppender
import org.apache.log4j.SimpleLayout
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

class XUMLRTIntegrationModelSetSnippet implements IModelSetSnippet {

	val transformation = new TransformationQrt
	val Logger logger
	
	new(){
		logger = Logger.getLogger(TransformationQrt.package.name)
		if(logger.level != Level.TRACE){
			logger.level = Level.TRACE
			val layout = new SimpleLayout()
			val rollingAppender = new RollingFileAppender(layout, "emdw-papyrus-integration.log")
			rollingAppender.setMaxFileSize("1MB")
			rollingAppender.setMaxBackupIndex(10)
			logger.addAppender(rollingAppender)
		}
	}

    private def getEngineManager(ModelSet modelSet) {
    	IncQueryEngineService.getOrStartService(modelSet)
    }

	override start(ModelSet modelSet) {
		try{
			// this is required to find only the loaded models at the start
			val defaultUMLResources = ImmutableList.copyOf(modelSet.resources.filter(UMLResource))
			if(!defaultUMLResources.exists[hasEMDWCommonProjectNature]) {
				logger.debug('''The project does not have the EMDW common project nature.''')
				return
			}
			
			val engine = getEngineManager(modelSet).getOrCreateEngine(modelSet)
			// we need to expand the indexing to the additional resource set
			val emfBaseIndex = engine.baseIndex as EMFBaseIndexWrapper
			val resourceSet = new ResourceSetImpl
			emfBaseIndex.navigationHelper.addRoot(resourceSet)
			
			val mappings = newHashSet()
			(defaultUMLResources).forEach[resource |
				if (!resource.contents.filter(Model).empty) {
					mappings += createMapping(resource, modelSet, resourceSet)
				}
			]
			
			if(mappings.size == 1) {
				val primitiveTypeMapping = createPrimitiveTypeMapping(engine, resourceSet, modelSet)
				
				val domain = modelSet.transactionalEditingDomain
				val schedulerFactory = TransactionalSchedulers.getTransactionSchedulerFactory(domain)
				transformation.schedulerFactory = schedulerFactory
				transformation.externalTypeMap = primitiveTypeMapping
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

	override dispose(ModelSet modelsManager) {
		transformation.dispose
	}
	
	def createPrimitiveTypeMapping(IncQueryEngine engine, ResourceSet rs, ModelSet modelSet){
		val primitiveTypeMapping = new HashMap<org.eclipse.uml2.uml.Type, Type>();
			
		val commonTypesPath = "org.eclipse.papyrusrt.xtumlrt.common.model/model/umlPrimitiveTypes.common"
		val commonTypesURI = URI.createPlatformPluginURI(commonTypesPath,true)
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
