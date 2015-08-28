package com.incquerylabs.emdw.cpp.codegeneration.test.mappings

import org.junit.runner.RunWith
import org.junit.runners.Suite
import org.junit.runners.Suite.SuiteClasses

@SuiteClasses(#[
	AssociationMappingTestSuite,
	AttributeMappingTestSuite,
	ConstructorMappingTestSuite,
	DestructorMappingTestSuite,
	GeneralizationMappingTestSuite,
	OperationMappingTestSuite,
	StateMappingTestSuite
])
@RunWith(Suite)
class MappingsTestSuite {}