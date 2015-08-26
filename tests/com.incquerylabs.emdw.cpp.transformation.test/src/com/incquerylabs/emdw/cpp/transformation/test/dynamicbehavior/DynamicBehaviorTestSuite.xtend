package com.incquerylabs.emdw.cpp.transformation.test.dynamicbehavior

import org.junit.runner.RunWith
import org.junit.runners.Suite
import org.junit.runners.Suite.SuiteClasses

@SuiteClasses(#[
	ClassConstructorTest,
	ClassDestructorTest,
	ClassOperationTest,
	EventClassTypeTest,
	EventMultipleTypeTest,
	EventPrimitiveTypeTest,
	EventSelfSendPriorityTest,
	EventUserDefinedTypeTest,
	SelfTransitionBehaviorTest,
	StateEntryBehaviorTest,
	StateExitBehaviorTest,
	TransitionBehaviorTest
])
@RunWith(Suite)
class DynamicBehaviorTestSuite {
	
}