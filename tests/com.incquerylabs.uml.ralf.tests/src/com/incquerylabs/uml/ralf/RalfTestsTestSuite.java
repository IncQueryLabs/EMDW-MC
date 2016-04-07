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
package com.incquerylabs.uml.ralf;

import org.junit.runner.RunWith;
import org.junit.runners.Suite;
import org.junit.runners.Suite.SuiteClasses;

import com.incquerylabs.uml.ralf.plugintests.RalfPlugintestsTestSuite;
import com.incquerylabs.uml.ralf.tests.modelvalidator.RalfModelvalidatorTestSuite;
import com.incquerylabs.uml.ralf.tests.parser.RalfParserTestSuite;
import com.incquerylabs.uml.ralf.tests.validator.RalfValidatorTestSuite;

@RunWith(Suite.class)
@SuiteClasses({ 
    RalfPlugintestsTestSuite.class,
    RalfModelvalidatorTestSuite.class,
    RalfParserTestSuite.class,
    RalfValidatorTestSuite.class})
public class RalfTestsTestSuite {}
