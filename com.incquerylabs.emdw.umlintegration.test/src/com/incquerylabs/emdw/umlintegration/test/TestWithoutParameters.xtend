package com.incquerylabs.emdw.umlintegration.test

import org.apache.log4j.Logger
import com.incquerylabs.emdw.umlintegration.test.wrappers.TransformationWrapper
import org.junit.After

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
	
	@After
	def cleanup() {
		cleanupTransformation;
		
		(0..4).forEach[Runtime.getRuntime().gc()]
	}
}
