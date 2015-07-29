package com.incquerylabs.emdw.cpp.common.test.wrappers

import org.apache.log4j.Logger
import org.eclipse.emf.ecore.resource.ResourceSet
import org.eclipse.incquery.runtime.api.AdvancedIncQueryEngine
import org.eclipse.papyrusrt.xtumlrt.common.Type
import java.util.Map

abstract class TransformationWrapper {
	protected extension Logger logger = Logger.getLogger(class)
	
	def void initializeTransformation(ResourceSet rs, Map<org.eclipse.uml2.uml.Type, Type> primitiveTypeMapping)
	
	def void executeTransformation()
	
	def void cleanupTransformation()
	
	def AdvancedIncQueryEngine getEngine()
}