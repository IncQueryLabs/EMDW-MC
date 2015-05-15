package com.incquerylabs.emdw.cpp.transformation.test.mappings

import org.junit.runner.RunWith
import org.junit.runners.Suite
import org.junit.runners.Suite.SuiteClasses

@SuiteClasses(#[
	CPPAttributeMappingTestSuite,
	CPPClassMappingTestSuite,
	CPPClassReferenceMappingTestSuite,
	CPPComponentMappingTestSuite,
	CPPEventMappingTestSuite,
	CPPOperationMappingTestSuite,
	CPPPackageMappingTestSuite,
	CPPPortMappingTestSuite,
	CPPProtocolMappingTestSuite,
	CPPProtocolOperationDefinitionMappingTestSuite,
	CPPProtocolOperationImplMappingTestSuite,
	CPPSignalMappingTestSuite,
	CPPStateMappingTestSuite,
	CPPTransitionMappingTestSuite
])
@RunWith(Suite)
class CPPXformMappingTestSuite {
	
}