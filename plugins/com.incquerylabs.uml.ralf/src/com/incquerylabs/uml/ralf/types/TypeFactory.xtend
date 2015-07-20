package com.incquerylabs.uml.ralf.types

import org.eclipse.uml2.uml.Type
import com.google.inject.Inject
import com.incquerylabs.uml.ralf.scoping.IUMLContextProvider

class TypeFactory {
    
    @Inject extension IUMLContextProvider umlContext
    
    def UMLTypeReference typeReference(Type type) {
        return UMLTypeReference.create(type)
    }

    def UMLTypeReference primitiveTypeReference(String name) {
        name.primitiveType.typeReference        
    }
}
