package com.incquerylabs.emdw.umlintegration.test.wrappers

import org.apache.log4j.Logger
import traceability.UmlToCommon

abstract class TransformationWrapper {
	protected extension Logger logger = Logger.getLogger(class)
	
	def void initializeTransformation(UmlToCommon umlToCommon)
	
	def void executeTransformation()
	
	def void cleanupTransformation()
}