package com.incquerylabs.emdw.umlintegration.test.mappings

import org.junit.runner.RunWith
import org.junit.runners.Suite
import org.junit.runners.Suite.SuiteClasses

@SuiteClasses(#[
	ActionChainMappingTestSuite,
	AttributeMappingTestSuite,
	CapsulePartMappingTestSuite,
	ChoicePointMappingTestSuite,
	ConnectorEndMappingTestSuite,
	DeepHistoryMappingTestSuite,
	EntryPointMappingTestSuite,
	EnumerationLiteralMappingTestSuite,
	EnumerationMappingTestSuite,
	ExitPointMappingTestSuite,
	GuardMappingTestSuite,
	InitialPointMappingTestSuite,
	JunctionPointMappingTestSuite,
	OperationMappingTestSuite,
	ParameterMappingTestSuite,
	PrimitiveTypeMappingTestSuite,
	ReturnTypeMappingTestSuite,
	StateEntryMappingTestSuite,
	StateExitMappingTestSuite,
	StateMachineMappingTestSuite,
	StructMemberMappingTestSuite,
	StructTypeMappingTestSuite,
	TransitionMappingTestSuite,
	TypeDefinitionMappingTestSuite,
	XTAssociationMappingTestSuite,
	XTClassEventMappingTestSuite,
	XTClassMappingTestSuite,
	XTComponentMappingTestSuite,
	XTEventTriggerMappingTestSuite,
	XTEventTriggerWithoutReceptionMappingTestSuite,
	XTGeneralizationMappingTestSuite,
	XTPackageMappingTestSuite,
	XTPortMappingTestSuite
])
@RunWith(Suite)
class MappingTestSuite {}