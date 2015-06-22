package com.incquerylabs.uml.ralf.scoping

import com.incquerylabs.uml.ralf.scoping.IUMLContextProvider
import org.eclipse.emf.common.util.URI
import org.eclipse.emf.ecore.resource.Resource
import org.eclipse.emf.ecore.resource.impl.ResourceSetImpl
import org.eclipse.emf.ecore.util.EcoreUtil
import org.eclipse.uml2.uml.Package
import org.eclipse.uml2.uml.UMLPackage
import org.eclipse.uml2.uml.resource.UMLResource

abstract class AbstractUMLContextProvider implements IUMLContextProvider {
    
    val Resource resource
    val Package primitivePackage
    
    new() {
        val set = new ResourceSetImpl()
        resource = set.getResource(URI.createURI(UMLResource.UML_PRIMITIVE_TYPES_LIBRARY_URI), true)
        primitivePackage = EcoreUtil.getObjectByType(resource.getContents(), UMLPackage.Literals.PACKAGE) as Package
    }
    
    def Resource getContainerResource() {
        return resource
    }
    
    override getPrimitiveType(String name) {
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
}