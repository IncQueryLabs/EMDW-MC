package com.incquerylabs.uml.ralf.scoping

import org.eclipse.uml2.uml.Behavior
import org.eclipse.uml2.uml.Class
import org.eclipse.uml2.uml.Package
import org.eclipse.xtend.lib.annotations.Accessors
import org.eclipse.xtext.EcoreUtil2
import com.google.common.collect.Iterators
import org.eclipse.emf.ecore.EObject

abstract class AbstractUMLContextProvider implements IUMLContextProvider {
    
    @Accessors
    var Behavior definedBehavior
    var Package primitivePackage
    
    def abstract protected Package getPrimitivePackage();
    
    override getPrimitiveType(String name) {
        if (primitivePackage == null) {
            primitivePackage = getPrimitivePackage()       
        }
        primitivePackage.getOwnedType(name)
    }
    
    private def isClass(EObject obj) {
        obj != null && !obj.eIsProxy && knownClasses.findFirst[it == obj] != null
    }
    
    override getThisType() {
        val behavior = getDefinedBehavior()
        val classes = behavior?.specification?.featuringClassifiers?.filter(typeof(Class))
        if (classes != null && !(classes.isEmpty)) {
            return classes.get(0)
        }
        
        var EObject parent = behavior;
        do {
            parent = parent.eContainer
        } while (!parent.isClass)
        
        
        if (parent instanceof Class) {
            return parent
        }
        return null
    }
    
}