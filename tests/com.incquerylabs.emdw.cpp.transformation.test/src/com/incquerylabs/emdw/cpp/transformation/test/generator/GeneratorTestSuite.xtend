package com.incquerylabs.emdw.cpp.transformation.test.generator

import org.junit.runner.RunWith
import org.junit.runners.Suite
import org.junit.runners.Suite.SuiteClasses

@SuiteClasses(#[
	GenerateSimpleModelTest,
	GenerateComplexModelTest
])
@RunWith(Suite)
class GeneratorTestSuite {}