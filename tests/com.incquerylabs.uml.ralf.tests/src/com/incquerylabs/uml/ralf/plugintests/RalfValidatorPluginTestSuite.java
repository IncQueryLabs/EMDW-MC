/*******************************************************************************
 * Copyright (c) 2015-2016 IncQuery Labs Ltd. and Ericsson AB
 * All rights reserved. This program and the accompanying materials
 * are made available under the terms of the Eclipse Public License v1.0
 * which accompanies this distribution, and is available at
 * http://www.eclipse.org/legal/epl-v10.html
 *
 * Contributors:
 *     Akos Horvath, Abel Hegedus, Zoltan Ujhelyi, Peter Lunk - initial API and implementation
 *******************************************************************************/
package com.incquerylabs.uml.ralf.plugintests;

import org.junit.runner.RunWith;
import org.junit.runners.Suite;
import org.junit.runners.Suite.SuiteClasses;

@RunWith(Suite.class)
@SuiteClasses({ 
    UMLAssociationValidatorTest.class, 
    UMLEnumValidatorTest.class,
    UMLOpaqueOperationParameterValidatorTest.class,
    UMLOperationValidatorTest.class,
    UMLOperationPrimitiveValidatorTest.class,
    UMLOperationReturnValidatorTest.class,
    UMLOperationStaticValidatorTest.class,
    UMLPropertyAccessValidatorTest.class,
    UMLSigdataValidatorTest.class,
    UMLSendSignalTest.class,
    UMLOperationValidatorTestIgnored.class,
    UMLVariableDeclarationValidatorTest.class})
public class RalfValidatorPluginTestSuite {}
