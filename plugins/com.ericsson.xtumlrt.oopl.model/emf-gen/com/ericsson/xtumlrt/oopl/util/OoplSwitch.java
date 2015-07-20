/**
 */
package com.ericsson.xtumlrt.oopl.util;

import com.ericsson.xtumlrt.oopl.*;

import org.eclipse.emf.ecore.EObject;
import org.eclipse.emf.ecore.EPackage;

import org.eclipse.emf.ecore.util.Switch;

/**
 * <!-- begin-user-doc -->
 * The <b>Switch</b> for the model's inheritance hierarchy.
 * It supports the call {@link #doSwitch(EObject) doSwitch(object)}
 * to invoke the <code>caseXXX</code> method for each class of the model,
 * starting with the actual class of the object
 * and proceeding up the inheritance hierarchy
 * until a non-null result is returned,
 * which is the result of the switch.
 * <!-- end-user-doc -->
 * @see com.ericsson.xtumlrt.oopl.OoplPackage
 * @generated
 */
public class OoplSwitch<T> extends Switch<T> {
    /**
     * The cached model package
     * <!-- begin-user-doc -->
     * <!-- end-user-doc -->
     * @generated
     */
    protected static OoplPackage modelPackage;

    /**
     * Creates an instance of the switch.
     * <!-- begin-user-doc -->
     * <!-- end-user-doc -->
     * @generated
     */
    public OoplSwitch() {
        if (modelPackage == null) {
            modelPackage = OoplPackage.eINSTANCE;
        }
    }

    /**
     * Checks whether this is a switch for the given package.
     * <!-- begin-user-doc -->
     * <!-- end-user-doc -->
     * @param ePackage the package in question.
     * @return whether this is a switch for the given package.
     * @generated
     */
    @Override
    protected boolean isSwitchFor(EPackage ePackage) {
        return ePackage == modelPackage;
    }

    /**
     * Calls <code>caseXXX</code> for each class of the model until one returns a non null result; it yields that result.
     * <!-- begin-user-doc -->
     * <!-- end-user-doc -->
     * @return the first non-null result returned by a <code>caseXXX</code> call.
     * @generated
     */
    @Override
    protected T doSwitch(int classifierID, EObject theEObject) {
        switch (classifierID) {
            case OoplPackage.OOPL_CLASS: {
                OOPLClass ooplClass = (OOPLClass)theEObject;
                T result = caseOOPLClass(ooplClass);
                if (result == null) result = defaultCase(theEObject);
                return result;
            }
            case OoplPackage.OOPL_TYPE: {
                OOPLType ooplType = (OOPLType)theEObject;
                T result = caseOOPLType(ooplType);
                if (result == null) result = defaultCase(theEObject);
                return result;
            }
            case OoplPackage.OOPL_CLASS_REFERENCE: {
                OOPLClassReference ooplClassReference = (OOPLClassReference)theEObject;
                T result = caseOOPLClassReference(ooplClassReference);
                if (result == null) result = caseOOPLType(ooplClassReference);
                if (result == null) result = defaultCase(theEObject);
                return result;
            }
            case OoplPackage.OOPL_CLASS_REFERENCE_COLLECTION: {
                OOPLClassReferenceCollection ooplClassReferenceCollection = (OOPLClassReferenceCollection)theEObject;
                T result = caseOOPLClassReferenceCollection(ooplClassReferenceCollection);
                if (result == null) result = caseOOPLType(ooplClassReferenceCollection);
                if (result == null) result = defaultCase(theEObject);
                return result;
            }
            case OoplPackage.OOPL_CLASS_REF_SIMPLE_COLLECTION: {
                OOPLClassRefSimpleCollection ooplClassRefSimpleCollection = (OOPLClassRefSimpleCollection)theEObject;
                T result = caseOOPLClassRefSimpleCollection(ooplClassRefSimpleCollection);
                if (result == null) result = caseOOPLClassReferenceCollection(ooplClassRefSimpleCollection);
                if (result == null) result = caseOOPLType(ooplClassRefSimpleCollection);
                if (result == null) result = defaultCase(theEObject);
                return result;
            }
            case OoplPackage.OOPL_CLASS_REF_ASSOC_COLLECTION: {
                OOPLClassRefAssocCollection ooplClassRefAssocCollection = (OOPLClassRefAssocCollection)theEObject;
                T result = caseOOPLClassRefAssocCollection(ooplClassRefAssocCollection);
                if (result == null) result = caseOOPLClassReferenceCollection(ooplClassRefAssocCollection);
                if (result == null) result = caseOOPLType(ooplClassRefAssocCollection);
                if (result == null) result = defaultCase(theEObject);
                return result;
            }
            case OoplPackage.OOPL_CLASS_REFERENCE_STORAGE: {
                OOPLClassReferenceStorage ooplClassReferenceStorage = (OOPLClassReferenceStorage)theEObject;
                T result = caseOOPLClassReferenceStorage(ooplClassReferenceStorage);
                if (result == null) result = defaultCase(theEObject);
                return result;
            }
            case OoplPackage.OOPL_RELATION: {
                OOPLRelation ooplRelation = (OOPLRelation)theEObject;
                T result = caseOOPLRelation(ooplRelation);
                if (result == null) result = defaultCase(theEObject);
                return result;
            }
            case OoplPackage.OOPL_NAME_PROVIDER: {
                OOPLNameProvider ooplNameProvider = (OOPLNameProvider)theEObject;
                T result = caseOOPLNameProvider(ooplNameProvider);
                if (result == null) result = defaultCase(theEObject);
                return result;
            }
            case OoplPackage.OOPL_DERIVED_NAME_PROVIDER: {
                OOPLDerivedNameProvider ooplDerivedNameProvider = (OOPLDerivedNameProvider)theEObject;
                T result = caseOOPLDerivedNameProvider(ooplDerivedNameProvider);
                if (result == null) result = caseOOPLNameProvider(ooplDerivedNameProvider);
                if (result == null) result = defaultCase(theEObject);
                return result;
            }
            case OoplPackage.OOPL_EXISTING_NAME_PROVIDER: {
                OOPLExistingNameProvider ooplExistingNameProvider = (OOPLExistingNameProvider)theEObject;
                T result = caseOOPLExistingNameProvider(ooplExistingNameProvider);
                if (result == null) result = caseOOPLNameProvider(ooplExistingNameProvider);
                if (result == null) result = defaultCase(theEObject);
                return result;
            }
            case OoplPackage.OOPL_BASIC_TYPE: {
                OOPLBasicType ooplBasicType = (OOPLBasicType)theEObject;
                T result = caseOOPLBasicType(ooplBasicType);
                if (result == null) result = caseOOPLType(ooplBasicType);
                if (result == null) result = defaultCase(theEObject);
                return result;
            }
            case OoplPackage.OOPL_ENUM_TYPE: {
                OOPLEnumType ooplEnumType = (OOPLEnumType)theEObject;
                T result = caseOOPLEnumType(ooplEnumType);
                if (result == null) result = caseOOPLType(ooplEnumType);
                if (result == null) result = defaultCase(theEObject);
                return result;
            }
            case OoplPackage.OOPL_ENUMERATOR: {
                OOPLEnumerator ooplEnumerator = (OOPLEnumerator)theEObject;
                T result = caseOOPLEnumerator(ooplEnumerator);
                if (result == null) result = defaultCase(theEObject);
                return result;
            }
            case OoplPackage.OOPL_STRUCT_TYPE: {
                OOPLStructType ooplStructType = (OOPLStructType)theEObject;
                T result = caseOOPLStructType(ooplStructType);
                if (result == null) result = caseOOPLType(ooplStructType);
                if (result == null) result = defaultCase(theEObject);
                return result;
            }
            case OoplPackage.OOPL_STRUCT_MEMBER: {
                OOPLStructMember ooplStructMember = (OOPLStructMember)theEObject;
                T result = caseOOPLStructMember(ooplStructMember);
                if (result == null) result = defaultCase(theEObject);
                return result;
            }
            case OoplPackage.OOPL_SEQUENCE: {
                OOPLSequence ooplSequence = (OOPLSequence)theEObject;
                T result = caseOOPLSequence(ooplSequence);
                if (result == null) result = caseOOPLType(ooplSequence);
                if (result == null) result = defaultCase(theEObject);
                return result;
            }
            case OoplPackage.OOPL_USER_DEFINED_TYPE: {
                OOPLUserDefinedType ooplUserDefinedType = (OOPLUserDefinedType)theEObject;
                T result = caseOOPLUserDefinedType(ooplUserDefinedType);
                if (result == null) result = caseOOPLType(ooplUserDefinedType);
                if (result == null) result = defaultCase(theEObject);
                return result;
            }
            case OoplPackage.BASE_CONTAINER_IMPLEMENTATION: {
                BaseContainerImplementation baseContainerImplementation = (BaseContainerImplementation)theEObject;
                T result = caseBaseContainerImplementation(baseContainerImplementation);
                if (result == null) result = defaultCase(theEObject);
                return result;
            }
            case OoplPackage.OOPL_CLASS_REF_ASSOC_COLLECTION_IMPLEMENTATION: {
                OOPLClassRefAssocCollectionImplementation ooplClassRefAssocCollectionImplementation = (OOPLClassRefAssocCollectionImplementation)theEObject;
                T result = caseOOPLClassRefAssocCollectionImplementation(ooplClassRefAssocCollectionImplementation);
                if (result == null) result = caseBaseContainerImplementation(ooplClassRefAssocCollectionImplementation);
                if (result == null) result = defaultCase(theEObject);
                return result;
            }
            case OoplPackage.OOPL_CLASS_REF_SIMPLE_COLLECTION_IMPLEMENTATION: {
                OOPLClassRefSimpleCollectionImplementation ooplClassRefSimpleCollectionImplementation = (OOPLClassRefSimpleCollectionImplementation)theEObject;
                T result = caseOOPLClassRefSimpleCollectionImplementation(ooplClassRefSimpleCollectionImplementation);
                if (result == null) result = caseBaseContainerImplementation(ooplClassRefSimpleCollectionImplementation);
                if (result == null) result = defaultCase(theEObject);
                return result;
            }
            case OoplPackage.OOPL_SEQUENCE_IMPLEMENTATION: {
                OOPLSequenceImplementation ooplSequenceImplementation = (OOPLSequenceImplementation)theEObject;
                T result = caseOOPLSequenceImplementation(ooplSequenceImplementation);
                if (result == null) result = caseBaseContainerImplementation(ooplSequenceImplementation);
                if (result == null) result = defaultCase(theEObject);
                return result;
            }
            default: return defaultCase(theEObject);
        }
    }

    /**
     * Returns the result of interpreting the object as an instance of '<em>OOPL Class</em>'.
     * <!-- begin-user-doc -->
     * This implementation returns null;
     * returning a non-null result will terminate the switch.
     * <!-- end-user-doc -->
     * @param object the target of the switch.
     * @return the result of interpreting the object as an instance of '<em>OOPL Class</em>'.
     * @see #doSwitch(org.eclipse.emf.ecore.EObject) doSwitch(EObject)
     * @generated
     */
    public T caseOOPLClass(OOPLClass object) {
        return null;
    }

    /**
     * Returns the result of interpreting the object as an instance of '<em>OOPL Type</em>'.
     * <!-- begin-user-doc -->
     * This implementation returns null;
     * returning a non-null result will terminate the switch.
     * <!-- end-user-doc -->
     * @param object the target of the switch.
     * @return the result of interpreting the object as an instance of '<em>OOPL Type</em>'.
     * @see #doSwitch(org.eclipse.emf.ecore.EObject) doSwitch(EObject)
     * @generated
     */
    public T caseOOPLType(OOPLType object) {
        return null;
    }

    /**
     * Returns the result of interpreting the object as an instance of '<em>OOPL Class Reference</em>'.
     * <!-- begin-user-doc -->
     * This implementation returns null;
     * returning a non-null result will terminate the switch.
     * <!-- end-user-doc -->
     * @param object the target of the switch.
     * @return the result of interpreting the object as an instance of '<em>OOPL Class Reference</em>'.
     * @see #doSwitch(org.eclipse.emf.ecore.EObject) doSwitch(EObject)
     * @generated
     */
    public T caseOOPLClassReference(OOPLClassReference object) {
        return null;
    }

    /**
     * Returns the result of interpreting the object as an instance of '<em>OOPL Class Reference Collection</em>'.
     * <!-- begin-user-doc -->
     * This implementation returns null;
     * returning a non-null result will terminate the switch.
     * <!-- end-user-doc -->
     * @param object the target of the switch.
     * @return the result of interpreting the object as an instance of '<em>OOPL Class Reference Collection</em>'.
     * @see #doSwitch(org.eclipse.emf.ecore.EObject) doSwitch(EObject)
     * @generated
     */
    public T caseOOPLClassReferenceCollection(OOPLClassReferenceCollection object) {
        return null;
    }

    /**
     * Returns the result of interpreting the object as an instance of '<em>OOPL Class Ref Simple Collection</em>'.
     * <!-- begin-user-doc -->
     * This implementation returns null;
     * returning a non-null result will terminate the switch.
     * <!-- end-user-doc -->
     * @param object the target of the switch.
     * @return the result of interpreting the object as an instance of '<em>OOPL Class Ref Simple Collection</em>'.
     * @see #doSwitch(org.eclipse.emf.ecore.EObject) doSwitch(EObject)
     * @generated
     */
    public T caseOOPLClassRefSimpleCollection(OOPLClassRefSimpleCollection object) {
        return null;
    }

    /**
     * Returns the result of interpreting the object as an instance of '<em>OOPL Class Ref Assoc Collection</em>'.
     * <!-- begin-user-doc -->
     * This implementation returns null;
     * returning a non-null result will terminate the switch.
     * <!-- end-user-doc -->
     * @param object the target of the switch.
     * @return the result of interpreting the object as an instance of '<em>OOPL Class Ref Assoc Collection</em>'.
     * @see #doSwitch(org.eclipse.emf.ecore.EObject) doSwitch(EObject)
     * @generated
     */
    public T caseOOPLClassRefAssocCollection(OOPLClassRefAssocCollection object) {
        return null;
    }

    /**
     * Returns the result of interpreting the object as an instance of '<em>OOPL Class Reference Storage</em>'.
     * <!-- begin-user-doc -->
     * This implementation returns null;
     * returning a non-null result will terminate the switch.
     * <!-- end-user-doc -->
     * @param object the target of the switch.
     * @return the result of interpreting the object as an instance of '<em>OOPL Class Reference Storage</em>'.
     * @see #doSwitch(org.eclipse.emf.ecore.EObject) doSwitch(EObject)
     * @generated
     */
    public T caseOOPLClassReferenceStorage(OOPLClassReferenceStorage object) {
        return null;
    }

    /**
     * Returns the result of interpreting the object as an instance of '<em>OOPL Relation</em>'.
     * <!-- begin-user-doc -->
     * This implementation returns null;
     * returning a non-null result will terminate the switch.
     * <!-- end-user-doc -->
     * @param object the target of the switch.
     * @return the result of interpreting the object as an instance of '<em>OOPL Relation</em>'.
     * @see #doSwitch(org.eclipse.emf.ecore.EObject) doSwitch(EObject)
     * @generated
     */
    public T caseOOPLRelation(OOPLRelation object) {
        return null;
    }

    /**
     * Returns the result of interpreting the object as an instance of '<em>OOPL Name Provider</em>'.
     * <!-- begin-user-doc -->
     * This implementation returns null;
     * returning a non-null result will terminate the switch.
     * <!-- end-user-doc -->
     * @param object the target of the switch.
     * @return the result of interpreting the object as an instance of '<em>OOPL Name Provider</em>'.
     * @see #doSwitch(org.eclipse.emf.ecore.EObject) doSwitch(EObject)
     * @generated
     */
    public T caseOOPLNameProvider(OOPLNameProvider object) {
        return null;
    }

    /**
     * Returns the result of interpreting the object as an instance of '<em>OOPL Derived Name Provider</em>'.
     * <!-- begin-user-doc -->
     * This implementation returns null;
     * returning a non-null result will terminate the switch.
     * <!-- end-user-doc -->
     * @param object the target of the switch.
     * @return the result of interpreting the object as an instance of '<em>OOPL Derived Name Provider</em>'.
     * @see #doSwitch(org.eclipse.emf.ecore.EObject) doSwitch(EObject)
     * @generated
     */
    public T caseOOPLDerivedNameProvider(OOPLDerivedNameProvider object) {
        return null;
    }

    /**
     * Returns the result of interpreting the object as an instance of '<em>OOPL Existing Name Provider</em>'.
     * <!-- begin-user-doc -->
     * This implementation returns null;
     * returning a non-null result will terminate the switch.
     * <!-- end-user-doc -->
     * @param object the target of the switch.
     * @return the result of interpreting the object as an instance of '<em>OOPL Existing Name Provider</em>'.
     * @see #doSwitch(org.eclipse.emf.ecore.EObject) doSwitch(EObject)
     * @generated
     */
    public T caseOOPLExistingNameProvider(OOPLExistingNameProvider object) {
        return null;
    }

    /**
     * Returns the result of interpreting the object as an instance of '<em>OOPL Basic Type</em>'.
     * <!-- begin-user-doc -->
     * This implementation returns null;
     * returning a non-null result will terminate the switch.
     * <!-- end-user-doc -->
     * @param object the target of the switch.
     * @return the result of interpreting the object as an instance of '<em>OOPL Basic Type</em>'.
     * @see #doSwitch(org.eclipse.emf.ecore.EObject) doSwitch(EObject)
     * @generated
     */
    public T caseOOPLBasicType(OOPLBasicType object) {
        return null;
    }

    /**
     * Returns the result of interpreting the object as an instance of '<em>OOPL Enum Type</em>'.
     * <!-- begin-user-doc -->
     * This implementation returns null;
     * returning a non-null result will terminate the switch.
     * <!-- end-user-doc -->
     * @param object the target of the switch.
     * @return the result of interpreting the object as an instance of '<em>OOPL Enum Type</em>'.
     * @see #doSwitch(org.eclipse.emf.ecore.EObject) doSwitch(EObject)
     * @generated
     */
    public T caseOOPLEnumType(OOPLEnumType object) {
        return null;
    }

    /**
     * Returns the result of interpreting the object as an instance of '<em>OOPL Enumerator</em>'.
     * <!-- begin-user-doc -->
     * This implementation returns null;
     * returning a non-null result will terminate the switch.
     * <!-- end-user-doc -->
     * @param object the target of the switch.
     * @return the result of interpreting the object as an instance of '<em>OOPL Enumerator</em>'.
     * @see #doSwitch(org.eclipse.emf.ecore.EObject) doSwitch(EObject)
     * @generated
     */
    public T caseOOPLEnumerator(OOPLEnumerator object) {
        return null;
    }

    /**
     * Returns the result of interpreting the object as an instance of '<em>OOPL Struct Type</em>'.
     * <!-- begin-user-doc -->
     * This implementation returns null;
     * returning a non-null result will terminate the switch.
     * <!-- end-user-doc -->
     * @param object the target of the switch.
     * @return the result of interpreting the object as an instance of '<em>OOPL Struct Type</em>'.
     * @see #doSwitch(org.eclipse.emf.ecore.EObject) doSwitch(EObject)
     * @generated
     */
    public T caseOOPLStructType(OOPLStructType object) {
        return null;
    }

    /**
     * Returns the result of interpreting the object as an instance of '<em>OOPL Struct Member</em>'.
     * <!-- begin-user-doc -->
     * This implementation returns null;
     * returning a non-null result will terminate the switch.
     * <!-- end-user-doc -->
     * @param object the target of the switch.
     * @return the result of interpreting the object as an instance of '<em>OOPL Struct Member</em>'.
     * @see #doSwitch(org.eclipse.emf.ecore.EObject) doSwitch(EObject)
     * @generated
     */
    public T caseOOPLStructMember(OOPLStructMember object) {
        return null;
    }

    /**
     * Returns the result of interpreting the object as an instance of '<em>OOPL Sequence</em>'.
     * <!-- begin-user-doc -->
     * This implementation returns null;
     * returning a non-null result will terminate the switch.
     * <!-- end-user-doc -->
     * @param object the target of the switch.
     * @return the result of interpreting the object as an instance of '<em>OOPL Sequence</em>'.
     * @see #doSwitch(org.eclipse.emf.ecore.EObject) doSwitch(EObject)
     * @generated
     */
    public T caseOOPLSequence(OOPLSequence object) {
        return null;
    }

    /**
     * Returns the result of interpreting the object as an instance of '<em>OOPL User Defined Type</em>'.
     * <!-- begin-user-doc -->
     * This implementation returns null;
     * returning a non-null result will terminate the switch.
     * <!-- end-user-doc -->
     * @param object the target of the switch.
     * @return the result of interpreting the object as an instance of '<em>OOPL User Defined Type</em>'.
     * @see #doSwitch(org.eclipse.emf.ecore.EObject) doSwitch(EObject)
     * @generated
     */
    public T caseOOPLUserDefinedType(OOPLUserDefinedType object) {
        return null;
    }

    /**
     * Returns the result of interpreting the object as an instance of '<em>Base Container Implementation</em>'.
     * <!-- begin-user-doc -->
     * This implementation returns null;
     * returning a non-null result will terminate the switch.
     * <!-- end-user-doc -->
     * @param object the target of the switch.
     * @return the result of interpreting the object as an instance of '<em>Base Container Implementation</em>'.
     * @see #doSwitch(org.eclipse.emf.ecore.EObject) doSwitch(EObject)
     * @generated
     */
    public T caseBaseContainerImplementation(BaseContainerImplementation object) {
        return null;
    }

    /**
     * Returns the result of interpreting the object as an instance of '<em>OOPL Class Ref Assoc Collection Implementation</em>'.
     * <!-- begin-user-doc -->
     * This implementation returns null;
     * returning a non-null result will terminate the switch.
     * <!-- end-user-doc -->
     * @param object the target of the switch.
     * @return the result of interpreting the object as an instance of '<em>OOPL Class Ref Assoc Collection Implementation</em>'.
     * @see #doSwitch(org.eclipse.emf.ecore.EObject) doSwitch(EObject)
     * @generated
     */
    public T caseOOPLClassRefAssocCollectionImplementation(OOPLClassRefAssocCollectionImplementation object) {
        return null;
    }

    /**
     * Returns the result of interpreting the object as an instance of '<em>OOPL Class Ref Simple Collection Implementation</em>'.
     * <!-- begin-user-doc -->
     * This implementation returns null;
     * returning a non-null result will terminate the switch.
     * <!-- end-user-doc -->
     * @param object the target of the switch.
     * @return the result of interpreting the object as an instance of '<em>OOPL Class Ref Simple Collection Implementation</em>'.
     * @see #doSwitch(org.eclipse.emf.ecore.EObject) doSwitch(EObject)
     * @generated
     */
    public T caseOOPLClassRefSimpleCollectionImplementation(OOPLClassRefSimpleCollectionImplementation object) {
        return null;
    }

    /**
     * Returns the result of interpreting the object as an instance of '<em>OOPL Sequence Implementation</em>'.
     * <!-- begin-user-doc -->
     * This implementation returns null;
     * returning a non-null result will terminate the switch.
     * <!-- end-user-doc -->
     * @param object the target of the switch.
     * @return the result of interpreting the object as an instance of '<em>OOPL Sequence Implementation</em>'.
     * @see #doSwitch(org.eclipse.emf.ecore.EObject) doSwitch(EObject)
     * @generated
     */
    public T caseOOPLSequenceImplementation(OOPLSequenceImplementation object) {
        return null;
    }

    /**
     * Returns the result of interpreting the object as an instance of '<em>EObject</em>'.
     * <!-- begin-user-doc -->
     * This implementation returns null;
     * returning a non-null result will terminate the switch, but this is the last case anyway.
     * <!-- end-user-doc -->
     * @param object the target of the switch.
     * @return the result of interpreting the object as an instance of '<em>EObject</em>'.
     * @see #doSwitch(org.eclipse.emf.ecore.EObject)
     * @generated
     */
    @Override
    public T defaultCase(EObject object) {
        return null;
    }

} //OoplSwitch
