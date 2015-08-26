package com.incquerylabs.emdw.testing.common.wrappers

import com.ericsson.xtumlrt.oopl.cppmodel.CPPModel
import com.incquerylabs.emdw.umlintegration.trace.RootMapping
import org.apache.log4j.Logger
import org.eclipse.papyrusrt.xtumlrt.xtuml.XTComponent

abstract class TransformationWrapper {
	protected extension Logger logger = Logger.getLogger(class)
	
	def void initializeTransformation(CPPModel cppmodel)
	
	def void initializeTransformation(RootMapping umlToCommon)
	
	def void executeTransformation()
	
	def void executeTransformation(XTComponent xtComponent)
	
	def void cleanupTransformation()
}