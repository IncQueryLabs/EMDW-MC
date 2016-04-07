/*******************************************************************************
 * Copyright (c) 2015-2016, IncQuery Labs Ltd. and Ericsson AB
 * All rights reserved. This program and the accompanying materials
 * are made available under the terms of the Eclipse Public License v1.0
 * which accompanies this distribution, and is available at
 * http://www.eclipse.org/legal/epl-v10.html
 *
 * Contributors:
 *   Akos Horvath, Abel Hegedus, Zoltan Ujhelyi, Peter Lunk - initial API and implementation
 *******************************************************************************/
package com.incquerylabs.uml.ralf.tests.modelvalidator

import java.util.Collection
import org.junit.runners.Parameterized.Parameters
import org.junit.runner.RunWith
import org.junit.runners.Parameterized
import org.junit.runners.Parameterized.Parameter
import org.eclipse.uml2.uml.BodyOwner
import org.junit.Test
import com.incquerylabs.uml.ralf.api.impl.ReducedAlfParser
import org.eclipse.uml2.uml.OpaqueBehavior
import org.eclipse.uml2.uml.OpaqueExpression
import com.incquerylabs.uml.ralf.tests.util.RAlfTestAssertions
import com.incquerylabs.uml.ralf.tests.util.basetests.AbstractModelValidatorTest
import org.eclipse.incquery.runtime.api.IncQueryEngine

@RunWith(Parameterized)
class OperationParameterValidatorTest extends AbstractModelValidatorTest{
    
    @Parameters(name = "{0}")
    def static Collection<Object[]> testData() {
        calculateTestData("/com.incquerylabs.uml.ralf.tests/model/operation-overload.uml")    
    }
    
}
