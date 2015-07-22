package com.incquerylabs.uml.ralf.types

import org.eclipse.uml2.uml.Type
import com.google.inject.Inject
import com.incquerylabs.uml.ralf.scoping.IUMLContextProvider
import com.incquerylabs.uml.ralf.types.IUMLTypeReference.AnyTypeReference
import com.incquerylabs.uml.ralf.types.IUMLTypeReference.NullTypeReference
import com.incquerylabs.uml.ralf.reducedAlfLanguage.CollectionType

class TypeFactory {
    
    @Inject extension IUMLContextProvider umlContext
    
    def UMLTypeReference typeReference(Type type) {
        return UMLTypeReference.create(type)
    }

    def UMLTypeReference primitiveTypeReference(String name) {
        name.primitiveType.typeReference        
    }
    
    def AnyTypeReference anyType() {
        return AnyTypeReference.instance
    }
    
    def NullTypeReference nullType() {
        return NullTypeReference.instance
    }
    
    def CollectionTypeReference collectionOf(Type valueType, CollectionType collectionType) {
        new CollectionTypeReference(collectionType, typeReference(valueType))
    }
    
    def CollectionTypeReference collectionOf(IUMLTypeReference valueType, CollectionType collectionType) {
        new CollectionTypeReference(collectionType, valueType)
    }
    
    def CollectionTypeReference setOf(Type valueType) {
        new CollectionTypeReference(CollectionType.SET, typeReference(valueType))
    }
    
    def CollectionTypeReference setOf(IUMLTypeReference valueType) {
        new CollectionTypeReference(CollectionType.SET, valueType)
    }
    
    def CollectionTypeReference bagOf(Type valueType) {
        new CollectionTypeReference(CollectionType.BAG, typeReference(valueType))
    }
    
    def CollectionTypeReference bagOf(IUMLTypeReference valueType) {
        new CollectionTypeReference(CollectionType.BAG, valueType)
    }
    
    def CollectionTypeReference sequenceOf(Type valueType) {
        new CollectionTypeReference(CollectionType.SEQUENCE, typeReference(valueType))
    }
    
    def CollectionTypeReference sequenceOf(IUMLTypeReference valueType) {
        new CollectionTypeReference(CollectionType.SEQUENCE, valueType)
    }
}
