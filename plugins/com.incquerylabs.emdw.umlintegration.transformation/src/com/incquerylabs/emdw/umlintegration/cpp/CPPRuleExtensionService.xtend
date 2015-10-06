package com.incquerylabs.emdw.umlintegration.cpp

import com.ericsson.xtumlrt.oopl.cppmodel.CppmodelFactory
import com.incquerylabs.emdw.umlintegration.UmlIntegrationExtension
import com.incquerylabs.emdw.umlintegration.cpp.rules.CPPExternalBridgeRules
import com.incquerylabs.emdw.umlintegration.rules.AbstractMapping
import java.util.Set
import org.eclipse.emf.common.util.URI
import org.eclipse.emf.ecore.resource.Resource
import org.eclipse.incquery.runtime.api.IncQueryEngine
import com.ericsson.xtumlrt.oopl.cppmodel.derived.QueryBasedFeatures
import org.eclipse.incquery.runtime.api.GenericPatternGroup
import com.ericsson.xtumlrt.oopl.OoplQueryBasedFeatures

class CPPRuleExtensionService implements UmlIntegrationExtension {
	extension CppmodelFactory cppFactory = CppmodelFactory.eINSTANCE
	
	override initialize(IncQueryEngine engine, Resource xUmlRtResource) {
		val resourceSet = xUmlRtResource.resourceSet
		val uriWithoutExtension = xUmlRtResource.getURI.trimFileExtension
		val uriString = uriWithoutExtension.toString.concat("_extension")
		val uri = URI.createURI(uriString).appendFileExtension("cppmodel")
		val resource = resourceSet.createResource(uri)
		val queryBasedFeatureQueryGroup = GenericPatternGroup.of(QueryBasedFeatures.instance, OoplQueryBasedFeatures.instance)
		queryBasedFeatureQueryGroup.prepare(engine)
		resource.contents += createCPPModel
		resource.contents += createCPPDirectory
	}
	
	override getRules(IncQueryEngine engine) {
		val Set<AbstractMapping<?>> rules = newHashSet()
		rules += CPPExternalBridgeRules.getRules(engine)
		return rules
	}
	
}
