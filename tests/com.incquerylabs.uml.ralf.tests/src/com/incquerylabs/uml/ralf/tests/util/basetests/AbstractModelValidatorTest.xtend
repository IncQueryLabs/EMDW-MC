package com.incquerylabs.uml.ralf.tests.util.basetests

import com.incquerylabs.uml.ralf.api.IReducedAlfParser
import com.incquerylabs.uml.ralf.api.impl.ReducedAlfParser
import com.incquerylabs.uml.ralf.tests.util.RAlfTestAssertions
import java.util.Collection
import org.eclipse.emf.common.util.URI
import org.eclipse.emf.ecore.EObject
import org.eclipse.emf.ecore.resource.impl.ResourceSetImpl
import org.eclipse.incquery.runtime.api.IncQueryEngine
import org.eclipse.incquery.runtime.emf.EMFScope
import org.eclipse.uml2.uml.BodyOwner
import org.eclipse.uml2.uml.Model
import org.eclipse.uml2.uml.NamedElement
import org.eclipse.uml2.uml.OpaqueBehavior
import org.eclipse.uml2.uml.OpaqueExpression
import org.eclipse.uml2.uml.resource.UMLResource
import org.eclipse.xtext.EcoreUtil2
import org.junit.Test
import org.junit.runners.Parameterized.Parameter

abstract class AbstractModelValidatorTest {
    

    def protected static Collection<Object[]> calculateTestData(String modelLocation) {
        val resourceSet = new ResourceSetImpl
        resourceSet.getResource(URI.createURI(UMLResource.UML_PRIMITIVE_TYPES_LIBRARY_URI),
                true) => [
                    load(#{})    
                ]
        val resource = resourceSet.createResource(URI.createPlatformPluginURI(modelLocation, true)) => [
            load(#{})
        ]
        val engine = IncQueryEngine.on(new EMFScope(resourceSet))
        val model =  resource.allContents.filter(typeof(Model)).findFirst[true]
        calculateTestData(model, engine)
    }
    
    def protected static Collection<Object[]> calculateTestData(Model model, IncQueryEngine engine) {
        model.eAllContents.filter(BodyOwner).filter[languages.contains(IReducedAlfParser.LANGUAGE_NAME)].
        <BodyOwner, Object[]>map[
            #[
                EcoreUtil2.getContainerOfType(it as EObject, typeof(NamedElement)).qualifiedName + "(" + Integer.toString(it.hashCode) + ")",
                it,
                engine
            ].toArray
        ].<Object[]>toList
    }

    @Parameter(0)
    public String name
    
    @Parameter(1)
    public BodyOwner bodyOwner
    
    @Parameter(2)
    public IncQueryEngine engine
    
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
