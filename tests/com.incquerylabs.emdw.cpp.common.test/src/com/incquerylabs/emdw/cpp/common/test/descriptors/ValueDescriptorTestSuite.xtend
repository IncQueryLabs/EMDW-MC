package com.incquerylabs.emdw.cpp.common.test.descriptors

import org.junit.runner.RunWith
import org.junit.runners.Suite
import org.junit.runners.Suite.SuiteClasses

@SuiteClasses(#[
	LiteralDescriptorTestSuite,
	SingleVariableDescriptorTestSuite,
	CollectionVariableDescriptorTestSuite,
	SigdataDescriptorTestSuite,
	PropertyReadDescriptorTestSuite,
	PropertyWriteDescriptorTestSuite,
	CastDescriptorTestSuite,
	CollectionLiteralTestSuite,
	OperationCallDescriptorTestSuite,
	ParameterDescriptorTestSuite,
	LinkUnlinkDescriptorTestSuite,
	SendSignalTestSuite,
	StaticOperationCallDescriptorTestSuite,
	DeleteDescriptorTestSuite,
	ForeachDescriptorTestSuite,
	InstancesDescriptorTestSuite,
	CopyConstructorCallDescriptorTestSuite,
	ConstructorCallDescriptorTestSuite,
	HierarchicalVariableDescriptorTestSuite
])
@RunWith(Suite)
class ValueDescriptorTestSuite {}