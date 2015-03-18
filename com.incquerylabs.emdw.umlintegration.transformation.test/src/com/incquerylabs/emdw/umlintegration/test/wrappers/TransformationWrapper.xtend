package com.incquerylabs.emdw.umlintegration.test.wrappers

import com.incquerylabs.emdw.umlintegration.trace.RootMapping
import org.apache.log4j.Logger

abstract class TransformationWrapper {
	protected extension Logger logger = Logger.getLogger(class)
	
	def void initializeTransformation(RootMapping umlToCommon)
	
	def void executeTransformation()
	
	def void cleanupTransformation()
}