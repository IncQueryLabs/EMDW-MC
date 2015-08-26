package com.incquerylabs.emdw.cpp.transformation.test.monitor

import org.junit.runner.RunWith
import org.junit.runners.Suite
import org.junit.runners.Suite.SuiteClasses

@SuiteClasses(#[
	ActionCodeMonitorTestSuite,
	AttributeMonitorTestSuite,
	OperationMonitorTestSuite,
	ParameterMonitorTestSuite,
	StateMachineMonitorTestSuite,
	TransitionMonitorTestSuite,
	TriggerMonitorTestSuite,
	VertexMonitorTestSuite,
	XtAssociationMonitorTestSuite,
	XtClassMonitorTestSuite,
	XtComponentXtClassMonitorTestSuite,
	XtComponentXtPackageMonitorTestSuite
])
@RunWith(Suite)
class MonitorTestSuite {}