package com.incquerylabs.uml.ralf.scoping

import org.eclipse.uml2.uml.Package
import org.eclipse.xtend.lib.annotations.Accessors
import org.eclipse.uml2.uml.Operation

abstract class AbstractUMLContextProvider implements IUMLContextProvider {
    
    @Accessors
    var Operation definedOperation
    var Package primitivePackage
    
    def abstract protected Package getPrimitivePackage();
    
    override getPrimitiveType(String name) {
        if (primitivePackage == null) {
            primitivePackage = getPrimitivePackage()       
        }
        primitivePackage.getOwnedType(name)
    }
    
    override getThisType() {
        val operation = getDefinedOperation()
        operation.class_
    }
    
}