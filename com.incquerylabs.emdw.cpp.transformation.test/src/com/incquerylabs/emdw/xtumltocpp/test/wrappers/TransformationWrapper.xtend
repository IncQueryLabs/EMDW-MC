package com.incquerylabs.emdw.xtumltocpp.test.wrappers

import org.apache.log4j.Logger
import com.ericsson.xtumlrt.oopl.cppmodel.CPPModel

abstract class TransformationWrapper {
	protected extension Logger logger = Logger.getLogger(class)
	
	def void initializeTransformation(CPPModel cppmodel)
	
	def void executeTransformation()
	
	def void cleanupTransformation()
}