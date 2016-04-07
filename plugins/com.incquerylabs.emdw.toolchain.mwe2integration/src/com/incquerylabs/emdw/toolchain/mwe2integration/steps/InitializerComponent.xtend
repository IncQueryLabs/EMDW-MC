/*******************************************************************************
 * Copyright (c) 2015-2016, IncQuery Labs Ltd. and Ericsson AB
 * All rights reserved. This program and the accompanying materials
 * are made available under the terms of the Eclipse Public License v1.0
 * which accompanies this distribution, and is available at
 * http://www.eclipse.org/legal/epl-v10.html
 *
 * Contributors:
 *   Akos Horvath, Abel Hegedus, Zoltan Ujhelyi, Peter Lunk - initial API and implementation
 *******************************************************************************/
package com.incquerylabs.emdw.toolchain.mwe2integration.steps

import com.ericsson.xtumlrt.oopl.OoplFactory
import com.ericsson.xtumlrt.oopl.OoplQueryBasedFeatures
import com.ericsson.xtumlrt.oopl.cppmodel.CPPModel
import com.ericsson.xtumlrt.oopl.cppmodel.CppmodelFactory
import com.ericsson.xtumlrt.oopl.cppmodel.derived.QueryBasedFeatures
import com.incquerylabs.emdw.cpp.bodyconverter.transformation.impl.queries.UmlXumlrtMappingQueries
import com.incquerylabs.emdw.cpp.codegeneration.queries.CppCodeGenerationQueries
import com.incquerylabs.emdw.cpp.codegeneration.queries.CppFileAndDirectoryQueries
import com.incquerylabs.emdw.cpp.common.mapper.queries.UmlQueries
import com.incquerylabs.emdw.cpp.transformation.queries.CppQueries
import com.incquerylabs.emdw.cpp.transformation.queries.MonitorQueries
import com.incquerylabs.emdw.cpp.transformation.queries.XtumlQueries
import com.incquerylabs.emdw.umlintegration.queries.CppExtensionQueries
import com.incquerylabs.emdw.umlintegration.queries.StateMachine
import com.incquerylabs.emdw.umlintegration.queries.Structure
import com.incquerylabs.emdw.umlintegration.queries.Trace
import com.incquerylabs.emdw.umlintegration.trace.TraceFactory
import com.incquerylabs.emdw.xtuml.incquery.XtumlValidationQueries
import java.util.Arrays
import java.util.List
import java.util.Map
import org.eclipse.core.resources.IProject
import org.eclipse.core.resources.IResource
import org.eclipse.core.resources.ResourcesPlugin
import org.eclipse.core.runtime.CoreException
import org.eclipse.emf.common.util.URI
import org.eclipse.emf.ecore.EObject
import org.eclipse.emf.ecore.resource.Resource
import org.eclipse.emf.ecore.resource.ResourceSet
import org.eclipse.emf.ecore.resource.impl.ResourceSetImpl
import org.eclipse.emf.mwe2.runtime.workflow.IWorkflowComponent
import org.eclipse.emf.mwe2.runtime.workflow.IWorkflowContext
import org.eclipse.incquery.runtime.api.AdvancedIncQueryEngine
import org.eclipse.incquery.runtime.api.GenericPatternGroup
import org.eclipse.incquery.runtime.api.IncQueryEngine
import org.eclipse.incquery.runtime.base.api.BaseIndexOptions
import org.eclipse.incquery.runtime.emf.EMFScope
import org.eclipse.incquery.runtime.exception.IncQueryException
import org.eclipse.papyrusrt.xtumlrt.common.CommonFactory
import org.eclipse.uml2.uml.Model
import org.eclipse.uml2.uml.PrimitiveType
import org.eclipse.uml2.uml.Type
import org.eclipse.uml2.uml.resource.UMLResource
import org.eclipse.xtend.lib.annotations.Accessors

import static com.google.common.base.Preconditions.*

class InitializerComponent implements IWorkflowComponent {
	static val TOOLCHAIN_QUERIES = GenericPatternGroup.of(
			StateMachine.instance,
			Structure.instance,
			Trace.instance,
			CppExtensionQueries.instance,
			XtumlValidationQueries.instance,
			UmlQueries.instance,
			com.incquerylabs.emdw.cpp.common.mapper.queries.XtumlQueries.instance,
			XtumlQueries.instance,
			MonitorQueries.instance,
			CppQueries.instance,
			CppCodeGenerationQueries.instance,
			CppFileAndDirectoryQueries.instance,
			UmlXumlrtMappingQueries.instance,
			OoplQueryBasedFeatures.instance,
			QueryBasedFeatures.instance
		)
	static val PATHMAP_SCHEME = "pathmap";
	private static final List<String> INDEXED_AUTHORITIES = Arrays.asList("UML_LIBRARIES", "RALF",
			"XUMLRT_PROFILE", "EMDW");
			
	@Accessors String umlResourcePath
	@Accessors String generationProjectPrefix
	@Accessors String codeGenerationDirectoryName
	@Accessors String modelGenerationDirectoryName
	@Accessors String primitiveTypesPath
	
	String generationProjectName
	IncQueryEngine engine
	Map<Type, org.eclipse.papyrusrt.xtumlrt.common.Type> primitiveTypeMapping
	
	extension CommonFactory commonFactory = CommonFactory.eINSTANCE
	extension TraceFactory traceFactory = TraceFactory.eINSTANCE
	extension OoplFactory ooplFactory = OoplFactory.eINSTANCE
	extension CppmodelFactory cppFactory = CppmodelFactory.eINSTANCE
	
	
	var Resource xumlrtResource
	var Resource traceResource
	var Resource cppmodelResource
	var CPPModel cppModel

	override void preInvoke() {
	}

	override void invoke(IWorkflowContext ctx) {	
		val resourceSet = new ResourceSetImpl	
		val umlResource = resourceSet.createResource(URI.createPlatformPluginURI(umlResourcePath, true)) => [ load(#{}) ]
		val umlModel = umlResource.contents.filter(Model).head
		generationProjectName = generationProjectPrefix + umlModel.name
		
		val mapping = resourceSet.createRootMapping(umlResource)
		primitiveTypeMapping = resourceSet.createPrimitiveTypeMapping
		
		checkNotNull(mapping.xtumlrtRoot, "xUML-RT Model cannot be null!")
		if(engine == null) {
			engine = createDefaultEngine(mapping.xtumlrtRoot.eResource.resourceSet)
		}
		
		TOOLCHAIN_QUERIES.prepare(engine)
		
		val parent = getOrCreateProject(generationProjectName)
		val targetFolder = getOrCreateFolder(parent, codeGenerationDirectoryName)
			
		ctx.put("engine", engine)
		ctx.put("primitiveTypeMapping", primitiveTypeMapping)
		ctx.put("xumlrtResource", xumlrtResource)
		ctx.put("traceResource", traceResource)
		ctx.put("cppmodelResource", cppmodelResource)
		ctx.put("cppModel", cppModel)
		ctx.put("targetFolder", targetFolder)
		
	}

	override void postInvoke() {
	}
	
	private def createRootMapping(ResourceSet resourceSet, Resource umlResource) {
		val umlModel = umlResource.contents.filter(Model).head
		
		val project = getOrCreateProject(generationProjectName)
		val myuri = URI.createFileURI('''«project.location.toOSString»/«modelGenerationDirectoryName»/«umlModel.name»''')
		val RESULT_PATH = myuri.toFileString
		
		// Create xtuml resource with xtuml model
		val xumlrtModel = commonFactory.createModel => [
			name = umlModel.name
		]
		xumlrtResource = resourceSet.createResource(RESULT_PATH, "xtuml", xumlrtModel)
		
		// Create trace resource with trace model
		val mapping = traceFactory.createRootMapping => [
			umlRoot = umlModel
			xtumlrtRoot = xumlrtModel
		]
		traceResource = resourceSet.createResource(RESULT_PATH, "trace", mapping)
		
		// Create cpp resource with cpp model
		val nameProvider = ooplFactory.createOOPLExistingNameProvider=>[commonNamedElement = xumlrtModel ]
		cppModel = cppFactory.createCPPModel => [
			commonModel = xumlrtModel
			ooplNameProvider = nameProvider
		]
		cppmodelResource = resourceSet.createResource(RESULT_PATH, "cppmodel", cppModel)
		
		// Add root directory and external library
		val makeRulesFile = cppFactory.createCPPMakeFile
		val modelDir = cppFactory.createCPPDirectory => [
			it.makeRulesFile = makeRulesFile
			it.files += makeRulesFile
		]
		cppmodelResource.contents += modelDir
		cppmodelResource.contents += cppFactory.createCPPExternalLibrary
		cppModel.headerDir = modelDir
		cppModel.bodyDir = modelDir
		
		mapping
	}
	
	def createDefaultEngine(ResourceSet resourceSet) throws IncQueryException {
		val options = new BaseIndexOptions().withResourceFilterConfiguration([
			val uri = getURI();
			if (INDEXED_AUTHORITIES.contains(uri.authority())) {
				return false;
			}
			return PATHMAP_SCHEME.equals(uri.scheme());
		]);
		val scope = new EMFScope(resourceSet, options);
		val engine = AdvancedIncQueryEngine.createUnmanagedEngine(scope);
		return engine;
	}
	
	private def createPrimitiveTypeMapping(ResourceSet rs){
		val primitiveTypeMapping = <Type, org.eclipse.papyrusrt.xtumlrt.common.Type>newHashMap
		
		val commonTypesResource = rs.getResource(URI.createPlatformPluginURI(primitiveTypesPath, true), true) => [ load(#{}) ]
		val commonTypesModel = commonTypesResource.contents.head as org.eclipse.papyrusrt.xtumlrt.common.Model
		val commonTypes = commonTypesModel.packages.head.typeDefinitions.map[td|td.type]
		
		val umlTypesResource = rs.getResource(URI.createURI(UMLResource.UML_PRIMITIVE_TYPES_LIBRARY_URI), true) => [ load(#{}) ]
		val model = umlTypesResource.contents.filter(Model).head
		val umlTypes = model.packagedElements.filter(PrimitiveType)
		
		commonTypes.forEach[type|
			// Here the void xtUML type is put into the map with null key because 
			// UML null types are mapped to void in xtUML as there is no void UML basic type.
			val umlType = umlTypes.filter[umlType | umlType.name.equals(type.name)].head
			primitiveTypeMapping.put(umlType, type)
		]
		primitiveTypeMapping
	}
	
	private def createResource(ResourceSet resourceSet, String resultPath, String fileExtension, EObject root) {
		val uriWithoutExtension = URI.createFileURI(resultPath).trimFileExtension
		val uri = uriWithoutExtension.appendFileExtension(fileExtension)
		val resource = resourceSet.createResource(uri)
		resource.contents += root
		resource
	}
			
	private def getOrCreateProject(String name) throws CoreException {
		val workspace = ResourcesPlugin.workspace
		val project = workspace.root.getProject(name)
		
		if (!project.exists) {
			project.create(null)
		}
		project.open(IResource.BACKGROUND_REFRESH, null)
		
		return project
	 }
	
	def getOrCreateFolder(IProject project, String folderName){
		val folder = project.getFolder(folderName);
		if (!folder.exists()) {
			folder.create(true, true, null);
		}
		return folder;
	}		
}
