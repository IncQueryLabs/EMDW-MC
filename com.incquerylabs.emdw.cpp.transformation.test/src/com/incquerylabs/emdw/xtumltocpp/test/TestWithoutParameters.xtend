package com.incquerylabs.emdw.xtumltocpp.test

import org.apache.log4j.Logger
import org.junit.After
import org.junit.BeforeClass
import org.apache.log4j.Level
import com.incquerylabs.emdw.xtumltocpp.test.wrappers.TransformationWrapper
import com.incquerylabs.emdw.cpp.transformation.XtumlComponentCPPTransformation

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
		Logger.getLogger(XtumlComponentCPPTransformation.package.name).level = Level.DEBUG
	}
	
	@After
	def cleanup() {
		cleanupTransformation;
		
		(0..4).forEach[Runtime.getRuntime().gc()]
	}
}
