package com.incquerylabs.uml.ralf.tests.modelvalidator

import com.incquerylabs.uml.ralf.tests.util.basetests.AbstractModelValidatorTest
import java.util.Collection
import org.junit.runner.RunWith
import org.junit.runners.Parameterized
import org.junit.runners.Parameterized.Parameters

@RunWith(Parameterized)
class StaticInstanceResolutionValidatorTest extends AbstractModelValidatorTest{
    
    @Parameters(name = "{0}")
    def static Collection<Object[]> testData() {
        calculateTestData("/com.incquerylabs.uml.ralf.tests/model/static-instance-resolution.uml")    
    }

}
