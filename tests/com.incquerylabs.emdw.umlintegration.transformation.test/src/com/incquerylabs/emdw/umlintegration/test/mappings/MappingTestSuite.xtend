/*******************************************************************************
 * Copyright (c) 2015-2016, IncQuery Labs Ltd. and Ericsson AB
 * All rights reserved. This program and the accompanying materials
 * are made available under the terms of the Eclipse Public License v1.0
 * which accompanies this distribution, and is available at
 * http://www.eclipse.org/legal/epl-v10.html
 *
 * Contributors:
 *   Akos Horvath, Abel Hegedus, Zoltan Ujhelyi, Daniel Segesdi, Tamas Borbas, Denes Harmath - initial API and implementation
 *******************************************************************************/
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
	ConnectorMappingTestSuite,
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
	StateMappingTestSuite,
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