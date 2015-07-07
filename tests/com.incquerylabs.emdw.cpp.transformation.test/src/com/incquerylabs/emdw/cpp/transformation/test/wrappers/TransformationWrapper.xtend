package com.incquerylabs.emdw.cpp.transformation.test.wrappers

import org.apache.log4j.Logger
import com.ericsson.xtumlrt.oopl.cppmodel.CPPModel
import org.eclipse.papyrusrt.xtumlrt.xtuml.XTComponent

abstract class TransformationWrapper {
	protected extension Logger logger = Logger.getLogger(class)
	
	def void initializeTransformation(CPPModel cppmodel)
	
	def void executeTransformation()
	
	def void executeTransformation(XTComponent xtComponent)
	
	def void cleanupTransformation()
}