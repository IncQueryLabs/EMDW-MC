package com.incquerylabs.uml.ralf.scoping

import org.eclipse.emf.ecore.resource.Resource
import org.eclipse.uml2.uml.Class
import org.eclipse.uml2.uml.Package
import org.eclipse.uml2.uml.Type
import org.eclipse.uml2.uml.Signal
import org.eclipse.uml2.uml.Association

abstract class AbstractUMLContextProvider implements IUMLContextProvider {
    
    var Package primitivePackage
    
    def Resource getContainerResource()
    def Package getPrimitivePackage()
    
    override getPrimitiveType(String name) {
    	if (primitivePackage == null) {
    		primitivePackage = getPrimitivePackage()
    	}
    	
        switch (name) {
            case INTEGER_TYPE:
                primitivePackage.getOwnedType("Integer")
            case REAL_TYPE:
                primitivePackage.getOwnedType("Real")
            case STRING_TYPE:
                primitivePackage.getOwnedType("String")
            case BOOLEAN_TYPE:
                primitivePackage.getOwnedType("Boolean")
        }
    }
    
    override getKnownTypes() {
        containerResource.allContents.filter(typeof(Type)).toSet
    }
    
    override getKnownClasses() {
        containerResource.allContents.filter(typeof(Class)).toSet
    }
    
    override getKnownSignals() {
        containerResource.allContents.filter(typeof(Signal)).toSet
    }
    
    override getKnownAssociations() {
        containerResource.allContents.filter(typeof(Association)).toSet
    }
    
    override getPropertiesOfClass(Class cl) {
        return newArrayList
    }
    
    override getAssociationsOfClass(Class cl) {
        return newArrayList
    }
    
    override getThisType() {
        return null
    }
    
}