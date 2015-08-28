package com.incquerylabs.emdw.umlintegration.test

import org.junit.runner.RunWith
import org.junit.runners.Suite
import org.junit.runners.Suite.SuiteClasses
import com.incquerylabs.emdw.umlintegration.test.mappings.MappingTestSuite

@SuiteClasses(#[
	MappingTestSuite,
	IntegrationTestSuite
])
@RunWith(Suite)
class UmlIntegrationMappingTestSuite {}