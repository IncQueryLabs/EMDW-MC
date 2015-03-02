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
        
        /*
         * Do not alter this list other than adding new alternatives
         * or permanently removing them.
         * 
         * Use properties file to disable alternatives!
         */
        val alternatives = ImmutableList.builder
        	.add(new QueryResultTraceability())
			.build
		
		val disabled = PropertiesUtil.getDisabledM2MTransformations
		alternatives.filter[!disabled.contains(it.class.simpleName)].map[
			val simpleName = it.class.simpleName
			#[it, simpleName].toArray
		]
    }
    
}
