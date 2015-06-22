package com.incquerylabs.uml.ralf.ui

import com.google.inject.Singleton
import org.eclipse.uml2.uml.Class
import org.eclipse.uml2.uml.Type
import com.incquerylabs.uml.ralf.scoping.AbstractUMLContextProvider

@Singleton
class BasicUMLContextProvider extends AbstractUMLContextProvider {
    
    override getKnownTypes() {
        containerResource.allContents.filter(typeof(Type)).toSet
    }
    
    override getKnownClasses() {
        containerResource.allContents.filter(typeof(Class)).toSet
    }
    
    
    
}