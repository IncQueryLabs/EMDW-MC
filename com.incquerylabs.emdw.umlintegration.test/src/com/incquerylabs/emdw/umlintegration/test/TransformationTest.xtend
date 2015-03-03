package com.incquerylabs.emdw.umlintegration.test

import com.google.common.collect.ImmutableList
import com.incquerylabs.emdw.umlintegration.test.wrappers.QueryResultTraceability
import com.incquerylabs.emdw.umlintegration.test.wrappers.TransformationWrapper
import org.junit.runners.Parameterized.Parameters

class TransformationTest extends TestWithoutParameters {

	new(TransformationWrapper wrapper, String wrapperType) {
		super(wrapper, wrapperType)
	}
	
	@Parameters(name = "{index}: {1}")
    public static def transformations() {
        
        val alternatives = ImmutableList.builder
        	.add(new QueryResultTraceability())
			.build
		
		alternatives.map[
			val simpleName = it.class.simpleName
			#[it, simpleName].toArray
		]
    }
    
}
