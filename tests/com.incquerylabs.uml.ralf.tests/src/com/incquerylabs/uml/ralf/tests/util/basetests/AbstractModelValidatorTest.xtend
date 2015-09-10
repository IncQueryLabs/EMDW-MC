package com.incquerylabs.uml.ralf.tests.util.basetests

import com.incquerylabs.uml.ralf.api.IReducedAlfParser
import java.util.Collection
import org.eclipse.emf.ecore.EObject
import org.eclipse.uml2.uml.BodyOwner
import org.eclipse.uml2.uml.Model
import org.eclipse.uml2.uml.NamedElement
import org.eclipse.xtext.EcoreUtil2
import org.eclipse.emf.ecore.resource.impl.ResourceSetImpl
import org.eclipse.emf.common.util.URI
import org.eclipse.uml2.uml.resource.UMLResource
import org.eclipse.incquery.runtime.api.IncQueryEngine
import org.eclipse.incquery.runtime.emf.EMFScope

abstract class AbstractModelValidatorTest {
    
    static var protected IncQueryEngine engine

    def protected static Collection<Object[]> calculateTestData(String modelLocation) {
        val resourceSet = new ResourceSetImpl
        resourceSet.getResource(URI.createURI(UMLResource.UML_PRIMITIVE_TYPES_LIBRARY_URI),
                true) => [
                    load(#{})    
                ]
        val resource = resourceSet.createResource(URI.createPlatformPluginURI(modelLocation, true)) => [
            load(#{})
        ]
        val model =  resource.allContents.filter(typeof(Model)).findFirst[true]
        engine = IncQueryEngine.on(new EMFScope(resourceSet))
        calculateTestData(model)
    }
    
    def protected static Collection<Object[]> calculateTestData(Model model) {
        model.eAllContents.filter(BodyOwner).filter[languages.contains(IReducedAlfParser.LANGUAGE_NAME)].
        <BodyOwner, Object[]>map[
            #[
                EcoreUtil2.getContainerOfType(it as EObject, typeof(NamedElement)).qualifiedName,
                it
            ].toArray
        ].<Object[]>toList
    }


}
