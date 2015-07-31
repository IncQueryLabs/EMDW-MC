package com.incquerylabs.uml.ralf.scoping

import org.eclipse.uml2.uml.Behavior
import org.eclipse.uml2.uml.Parameter
import org.eclipse.uml2.uml.ParameterDirectionKind
import org.eclipse.uml2.uml.Operation

class UMLScopeHelper {

    def Iterable<Parameter> getParameters(Behavior behavior) {
        if (behavior == null) {
            return newArrayList
        } else {
            
        }
        val ownedParameters = behavior.ownedParameters
        val specificationParameters = behavior.specification?.ownedParameters
        if (ownedParameters.nullOrEmpty) {
            if (!specificationParameters.nullOrEmpty) {
                return specificationParameters
            }
        } else {
            return ownedParameters
        }
        return newArrayList
    }
    
    def Parameter getReturnParameter(Operation operation) {
        operation?.ownedParameters?.findFirst[direction == ParameterDirectionKind.RETURN_LITERAL]
    }
}