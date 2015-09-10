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

@RunWith(Parameterized)
class StaticInstanceResolutionValidatorTest extends AbstractModelValidatorTest{
    
    @Parameters(name = "{0}")
    def static Collection<Object[]> testData() {
        calculateTestData("/com.incquerylabs.uml.ralf.tests/model/static-instance-resolution.uml")    
    }
    
    @Parameter(0)
    public String name
    
    @Parameter(1)
    public BodyOwner bodyOwner
    
    @Test
    public def validateBody() {
        val parser = new ReducedAlfParser
        val results = switch bodyOwner {
            OpaqueBehavior : parser.parse(bodyOwner, engine)
            OpaqueExpression : parser.parse(bodyOwner, engine)
        }
        RAlfTestAssertions::assertAll(results.errors)
    }
}
