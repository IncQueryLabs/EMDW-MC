package com.incquerylabs.emdw.cpp.transformation.test

import com.incquerylabs.emdw.cpp.transformation.XtumlComponentCPPTransformation
import com.incquerylabs.emdw.cpp.transformation.test.wrappers.TransformationWrapper
import org.apache.log4j.Level
import org.apache.log4j.Logger
import org.junit.After
import org.junit.BeforeClass

class TestWithoutParameters {

	protected extension Logger logger = Logger.getLogger(class)
	protected extension TransformationWrapper xform

	String wrapperType
	
    new(TransformationWrapper wrapper, String wrapperType){
    	xform = wrapper
    	this.wrapperType = wrapperType
    }
    
    def startTest(String testId){
    	info('''START TEST: type: «wrapperType» ID: «testId»''')
    }
    
    def endTest(String testId){
    	info('''END TEST: type: «wrapperType» ID: «testId»''')
    }
    
    @BeforeClass
	def static setupRootLogger() {
		Logger.getLogger(XtumlComponentCPPTransformation.package.name).level = Level.TRACE
	}
	
	@After
	def cleanup() {
		cleanupTransformation;
	}
}
