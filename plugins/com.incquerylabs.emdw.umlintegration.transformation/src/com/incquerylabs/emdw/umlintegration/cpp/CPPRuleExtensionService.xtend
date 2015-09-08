package com.incquerylabs.emdw.umlintegration.cpp

import com.ericsson.xtumlrt.oopl.cppmodel.CppmodelFactory
import com.incquerylabs.emdw.umlintegration.UmlIntegrationExtension
import com.incquerylabs.emdw.umlintegration.cpp.rules.CPPExternalBridgeRules
import com.incquerylabs.emdw.umlintegration.rules.AbstractMapping
import java.util.Set
import org.eclipse.emf.common.util.URI
import org.eclipse.emf.ecore.resource.Resource
import org.eclipse.incquery.runtime.api.IncQueryEngine

class CPPRuleExtensionService implements UmlIntegrationExtension {
	extension CppmodelFactory cppFactory = CppmodelFactory.eINSTANCE
	
	override initialize(Resource xUmlRtResource) {
		val resourceSet = xUmlRtResource.resourceSet
		val uriWithoutExtension = xUmlRtResource.getURI.trimFileExtension
		val uriString = uriWithoutExtension.toString.concat("_extension")
		val uri = URI.createURI(uriString).appendFileExtension("cppmodel")
		val resource = resourceSet.createResource(uri)
		resource.contents += createCPPModel
		resource.contents += createCPPDirectory
	}
	
	override getRules(IncQueryEngine engine) {
		val Set<AbstractMapping<?>> rules = newHashSet()
		rules += CPPExternalBridgeRules.getRules(engine)
		return rules
	}
	
}
