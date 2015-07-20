/**
 */
package com.ericsson.xtumlrt.oopl.util;

import com.ericsson.xtumlrt.oopl.*;

import org.eclipse.emf.common.notify.Adapter;
import org.eclipse.emf.common.notify.Notifier;

import org.eclipse.emf.common.notify.impl.AdapterFactoryImpl;

import org.eclipse.emf.ecore.EObject;

/**
 * <!-- begin-user-doc -->
 * The <b>Adapter Factory</b> for the model.
 * It provides an adapter <code>createXXX</code> method for each class of the model.
 * <!-- end-user-doc -->
 * @see com.ericsson.xtumlrt.oopl.OoplPackage
 * @generated
 */
public class OoplAdapterFactory extends AdapterFactoryImpl {
    /**
     * The cached model package.
     * <!-- begin-user-doc -->
     * <!-- end-user-doc -->
     * @generated
     */
    protected static OoplPackage modelPackage;

    /**
     * Creates an instance of the adapter factory.
     * <!-- begin-user-doc -->
     * <!-- end-user-doc -->
     * @generated
     */
    public OoplAdapterFactory() {
        if (modelPackage == null) {
            modelPackage = OoplPackage.eINSTANCE;
        }
    }

    /**
     * Returns whether this factory is applicable for the type of the object.
     * <!-- begin-user-doc -->
     * This implementation returns <code>true</code> if the object is either the model's package or is an instance object of the model.
     * <!-- end-user-doc -->
     * @return whether this factory is applicable for the type of the object.
     * @generated
     */
    @Override
    public boolean isFactoryForType(Object object) {
        if (object == modelPackage) {
            return true;
        }
        if (object instanceof EObject) {
            return ((EObject)object).eClass().getEPackage() == modelPackage;
        }
        return false;
    }

    /**
     * The switch that delegates to the <code>createXXX</code> methods.
     * <!-- begin-user-doc -->
     * <!-- end-user-doc -->
     * @generated
     */
    protected OoplSwitch<Adapter> modelSwitch =
        new OoplSwitch<Adapter>() {
            @Override
            public Adapter caseOOPLClass(OOPLClass object) {
                return createOOPLClassAdapter();
            }
            @Override
            public Adapter caseOOPLType(OOPLType object) {
                return createOOPLTypeAdapter();
            }
            @Override
            public Adapter caseOOPLClassReference(OOPLClassReference object) {
                return createOOPLClassReferenceAdapter();
            }
            @Override
            public Adapter caseOOPLClassReferenceCollection(OOPLClassReferenceCollection object) {
                return createOOPLClassReferenceCollectionAdapter();
            }
            @Override
            public Adapter caseOOPLClassRefSimpleCollection(OOPLClassRefSimpleCollection object) {
                return createOOPLClassRefSimpleCollectionAdapter();
            }
            @Override
            public Adapter caseOOPLClassRefAssocCollection(OOPLClassRefAssocCollection object) {
                return createOOPLClassRefAssocCollectionAdapter();
            }
            @Override
            public Adapter caseOOPLClassReferenceStorage(OOPLClassReferenceStorage object) {
                return createOOPLClassReferenceStorageAdapter();
            }
            @Override
            public Adapter caseOOPLRelation(OOPLRelation object) {
                return createOOPLRelationAdapter();
            }
            @Override
            public Adapter caseOOPLNameProvider(OOPLNameProvider object) {
                return createOOPLNameProviderAdapter();
            }
            @Override
            public Adapter caseOOPLDerivedNameProvider(OOPLDerivedNameProvider object) {
                return createOOPLDerivedNameProviderAdapter();
            }
            @Override
            public Adapter caseOOPLExistingNameProvider(OOPLExistingNameProvider object) {
                return createOOPLExistingNameProviderAdapter();
            }
            @Override
            public Adapter caseOOPLBasicType(OOPLBasicType object) {
                return createOOPLBasicTypeAdapter();
            }
            @Override
            public Adapter caseOOPLEnumType(OOPLEnumType object) {
                return createOOPLEnumTypeAdapter();
            }
            @Override
            public Adapter caseOOPLEnumerator(OOPLEnumerator object) {
                return createOOPLEnumeratorAdapter();
            }
            @Override
            public Adapter caseOOPLStructType(OOPLStructType object) {
                return createOOPLStructTypeAdapter();
            }
            @Override
            public Adapter caseOOPLStructMember(OOPLStructMember object) {
                return createOOPLStructMemberAdapter();
            }
            @Override
            public Adapter caseOOPLSequence(OOPLSequence object) {
                return createOOPLSequenceAdapter();
            }
            @Override
            public Adapter caseOOPLUserDefinedType(OOPLUserDefinedType object) {
                return createOOPLUserDefinedTypeAdapter();
            }
            @Override
            public Adapter caseBaseContainerImplementation(BaseContainerImplementation object) {
                return createBaseContainerImplementationAdapter();
            }
            @Override
            public Adapter caseOOPLClassRefAssocCollectionImplementation(OOPLClassRefAssocCollectionImplementation object) {
                return createOOPLClassRefAssocCollectionImplementationAdapter();
            }
            @Override
            public Adapter caseOOPLClassRefSimpleCollectionImplementation(OOPLClassRefSimpleCollectionImplementation object) {
                return createOOPLClassRefSimpleCollectionImplementationAdapter();
            }
            @Override
            public Adapter caseOOPLSequenceImplementation(OOPLSequenceImplementation object) {
                return createOOPLSequenceImplementationAdapter();
            }
            @Override
            public Adapter defaultCase(EObject object) {
                return createEObjectAdapter();
            }
        };

    /**
     * Creates an adapter for the <code>target</code>.
     * <!-- begin-user-doc -->
     * <!-- end-user-doc -->
     * @param target the object to adapt.
     * @return the adapter for the <code>target</code>.
     * @generated
     */
    @Override
    public Adapter createAdapter(Notifier target) {
        return modelSwitch.doSwitch((EObject)target);
    }


    /**
     * Creates a new adapter for an object of class '{@link com.ericsson.xtumlrt.oopl.OOPLClass <em>OOPL Class</em>}'.
     * <!-- begin-user-doc -->
     * This default implementation returns null so that we can easily ignore cases;
     * it's useful to ignore a case when inheritance will catch all the cases anyway.
     * <!-- end-user-doc -->
     * @return the new adapter.
     * @see com.ericsson.xtumlrt.oopl.OOPLClass
     * @generated
     */
    public Adapter createOOPLClassAdapter() {
        return null;
    }

    /**
     * Creates a new adapter for an object of class '{@link com.ericsson.xtumlrt.oopl.OOPLType <em>OOPL Type</em>}'.
     * <!-- begin-user-doc -->
     * This default implementation returns null so that we can easily ignore cases;
     * it's useful to ignore a case when inheritance will catch all the cases anyway.
     * <!-- end-user-doc -->
     * @return the new adapter.
     * @see com.ericsson.xtumlrt.oopl.OOPLType
     * @generated
     */
    public Adapter createOOPLTypeAdapter() {
        return null;
    }

    /**
     * Creates a new adapter for an object of class '{@link com.ericsson.xtumlrt.oopl.OOPLClassReference <em>OOPL Class Reference</em>}'.
     * <!-- begin-user-doc -->
     * This default implementation returns null so that we can easily ignore cases;
     * it's useful to ignore a case when inheritance will catch all the cases anyway.
     * <!-- end-user-doc -->
     * @return the new adapter.
     * @see com.ericsson.xtumlrt.oopl.OOPLClassReference
     * @generated
     */
    public Adapter createOOPLClassReferenceAdapter() {
        return null;
    }

    /**
     * Creates a new adapter for an object of class '{@link com.ericsson.xtumlrt.oopl.OOPLClassReferenceCollection <em>OOPL Class Reference Collection</em>}'.
     * <!-- begin-user-doc -->
     * This default implementation returns null so that we can easily ignore cases;
     * it's useful to ignore a case when inheritance will catch all the cases anyway.
     * <!-- end-user-doc -->
     * @return the new adapter.
     * @see com.ericsson.xtumlrt.oopl.OOPLClassReferenceCollection
     * @generated
     */
    public Adapter createOOPLClassReferenceCollectionAdapter() {
        return null;
    }

    /**
     * Creates a new adapter for an object of class '{@link com.ericsson.xtumlrt.oopl.OOPLClassRefSimpleCollection <em>OOPL Class Ref Simple Collection</em>}'.
     * <!-- begin-user-doc -->
     * This default implementation returns null so that we can easily ignore cases;
     * it's useful to ignore a case when inheritance will catch all the cases anyway.
     * <!-- end-user-doc -->
     * @return the new adapter.
     * @see com.ericsson.xtumlrt.oopl.OOPLClassRefSimpleCollection
     * @generated
     */
    public Adapter createOOPLClassRefSimpleCollectionAdapter() {
        return null;
    }

    /**
     * Creates a new adapter for an object of class '{@link com.ericsson.xtumlrt.oopl.OOPLClassRefAssocCollection <em>OOPL Class Ref Assoc Collection</em>}'.
     * <!-- begin-user-doc -->
     * This default implementation returns null so that we can easily ignore cases;
     * it's useful to ignore a case when inheritance will catch all the cases anyway.
     * <!-- end-user-doc -->
     * @return the new adapter.
     * @see com.ericsson.xtumlrt.oopl.OOPLClassRefAssocCollection
     * @generated
     */
    public Adapter createOOPLClassRefAssocCollectionAdapter() {
        return null;
    }

    /**
     * Creates a new adapter for an object of class '{@link com.ericsson.xtumlrt.oopl.OOPLClassReferenceStorage <em>OOPL Class Reference Storage</em>}'.
     * <!-- begin-user-doc -->
     * This default implementation returns null so that we can easily ignore cases;
     * it's useful to ignore a case when inheritance will catch all the cases anyway.
     * <!-- end-user-doc -->
     * @return the new adapter.
     * @see com.ericsson.xtumlrt.oopl.OOPLClassReferenceStorage
     * @generated
     */
    public Adapter createOOPLClassReferenceStorageAdapter() {
        return null;
    }

    /**
     * Creates a new adapter for an object of class '{@link com.ericsson.xtumlrt.oopl.OOPLRelation <em>OOPL Relation</em>}'.
     * <!-- begin-user-doc -->
     * This default implementation returns null so that we can easily ignore cases;
     * it's useful to ignore a case when inheritance will catch all the cases anyway.
     * <!-- end-user-doc -->
     * @return the new adapter.
     * @see com.ericsson.xtumlrt.oopl.OOPLRelation
     * @generated
     */
    public Adapter createOOPLRelationAdapter() {
        return null;
    }

    /**
     * Creates a new adapter for an object of class '{@link com.ericsson.xtumlrt.oopl.OOPLNameProvider <em>OOPL Name Provider</em>}'.
     * <!-- begin-user-doc -->
     * This default implementation returns null so that we can easily ignore cases;
     * it's useful to ignore a case when inheritance will catch all the cases anyway.
     * <!-- end-user-doc -->
     * @return the new adapter.
     * @see com.ericsson.xtumlrt.oopl.OOPLNameProvider
     * @generated
     */
    public Adapter createOOPLNameProviderAdapter() {
        return null;
    }

    /**
     * Creates a new adapter for an object of class '{@link com.ericsson.xtumlrt.oopl.OOPLDerivedNameProvider <em>OOPL Derived Name Provider</em>}'.
     * <!-- begin-user-doc -->
     * This default implementation returns null so that we can easily ignore cases;
     * it's useful to ignore a case when inheritance will catch all the cases anyway.
     * <!-- end-user-doc -->
     * @return the new adapter.
     * @see com.ericsson.xtumlrt.oopl.OOPLDerivedNameProvider
     * @generated
     */
    public Adapter createOOPLDerivedNameProviderAdapter() {
        return null;
    }

    /**
     * Creates a new adapter for an object of class '{@link com.ericsson.xtumlrt.oopl.OOPLExistingNameProvider <em>OOPL Existing Name Provider</em>}'.
     * <!-- begin-user-doc -->
     * This default implementation returns null so that we can easily ignore cases;
     * it's useful to ignore a case when inheritance will catch all the cases anyway.
     * <!-- end-user-doc -->
     * @return the new adapter.
     * @see com.ericsson.xtumlrt.oopl.OOPLExistingNameProvider
     * @generated
     */
    public Adapter createOOPLExistingNameProviderAdapter() {
        return null;
    }

    /**
     * Creates a new adapter for an object of class '{@link com.ericsson.xtumlrt.oopl.OOPLBasicType <em>OOPL Basic Type</em>}'.
     * <!-- begin-user-doc -->
     * This default implementation returns null so that we can easily ignore cases;
     * it's useful to ignore a case when inheritance will catch all the cases anyway.
     * <!-- end-user-doc -->
     * @return the new adapter.
     * @see com.ericsson.xtumlrt.oopl.OOPLBasicType
     * @generated
     */
    public Adapter createOOPLBasicTypeAdapter() {
        return null;
    }

    /**
     * Creates a new adapter for an object of class '{@link com.ericsson.xtumlrt.oopl.OOPLEnumType <em>OOPL Enum Type</em>}'.
     * <!-- begin-user-doc -->
     * This default implementation returns null so that we can easily ignore cases;
     * it's useful to ignore a case when inheritance will catch all the cases anyway.
     * <!-- end-user-doc -->
     * @return the new adapter.
     * @see com.ericsson.xtumlrt.oopl.OOPLEnumType
     * @generated
     */
    public Adapter createOOPLEnumTypeAdapter() {
        return null;
    }

    /**
     * Creates a new adapter for an object of class '{@link com.ericsson.xtumlrt.oopl.OOPLEnumerator <em>OOPL Enumerator</em>}'.
     * <!-- begin-user-doc -->
     * This default implementation returns null so that we can easily ignore cases;
     * it's useful to ignore a case when inheritance will catch all the cases anyway.
     * <!-- end-user-doc -->
     * @return the new adapter.
     * @see com.ericsson.xtumlrt.oopl.OOPLEnumerator
     * @generated
     */
    public Adapter createOOPLEnumeratorAdapter() {
        return null;
    }

    /**
     * Creates a new adapter for an object of class '{@link com.ericsson.xtumlrt.oopl.OOPLStructType <em>OOPL Struct Type</em>}'.
     * <!-- begin-user-doc -->
     * This default implementation returns null so that we can easily ignore cases;
     * it's useful to ignore a case when inheritance will catch all the cases anyway.
     * <!-- end-user-doc -->
     * @return the new adapter.
     * @see com.ericsson.xtumlrt.oopl.OOPLStructType
     * @generated
     */
    public Adapter createOOPLStructTypeAdapter() {
        return null;
    }

    /**
     * Creates a new adapter for an object of class '{@link com.ericsson.xtumlrt.oopl.OOPLStructMember <em>OOPL Struct Member</em>}'.
     * <!-- begin-user-doc -->
     * This default implementation returns null so that we can easily ignore cases;
     * it's useful to ignore a case when inheritance will catch all the cases anyway.
     * <!-- end-user-doc -->
     * @return the new adapter.
     * @see com.ericsson.xtumlrt.oopl.OOPLStructMember
     * @generated
     */
    public Adapter createOOPLStructMemberAdapter() {
        return null;
    }

    /**
     * Creates a new adapter for an object of class '{@link com.ericsson.xtumlrt.oopl.OOPLSequence <em>OOPL Sequence</em>}'.
     * <!-- begin-user-doc -->
     * This default implementation returns null so that we can easily ignore cases;
     * it's useful to ignore a case when inheritance will catch all the cases anyway.
     * <!-- end-user-doc -->
     * @return the new adapter.
     * @see com.ericsson.xtumlrt.oopl.OOPLSequence
     * @generated
     */
    public Adapter createOOPLSequenceAdapter() {
        return null;
    }

    /**
     * Creates a new adapter for an object of class '{@link com.ericsson.xtumlrt.oopl.OOPLUserDefinedType <em>OOPL User Defined Type</em>}'.
     * <!-- begin-user-doc -->
     * This default implementation returns null so that we can easily ignore cases;
     * it's useful to ignore a case when inheritance will catch all the cases anyway.
     * <!-- end-user-doc -->
     * @return the new adapter.
     * @see com.ericsson.xtumlrt.oopl.OOPLUserDefinedType
     * @generated
     */
    public Adapter createOOPLUserDefinedTypeAdapter() {
        return null;
    }

    /**
     * Creates a new adapter for an object of class '{@link com.ericsson.xtumlrt.oopl.BaseContainerImplementation <em>Base Container Implementation</em>}'.
     * <!-- begin-user-doc -->
     * This default implementation returns null so that we can easily ignore cases;
     * it's useful to ignore a case when inheritance will catch all the cases anyway.
     * <!-- end-user-doc -->
     * @return the new adapter.
     * @see com.ericsson.xtumlrt.oopl.BaseContainerImplementation
     * @generated
     */
    public Adapter createBaseContainerImplementationAdapter() {
        return null;
    }

    /**
     * Creates a new adapter for an object of class '{@link com.ericsson.xtumlrt.oopl.OOPLClassRefAssocCollectionImplementation <em>OOPL Class Ref Assoc Collection Implementation</em>}'.
     * <!-- begin-user-doc -->
     * This default implementation returns null so that we can easily ignore cases;
     * it's useful to ignore a case when inheritance will catch all the cases anyway.
     * <!-- end-user-doc -->
     * @return the new adapter.
     * @see com.ericsson.xtumlrt.oopl.OOPLClassRefAssocCollectionImplementation
     * @generated
     */
    public Adapter createOOPLClassRefAssocCollectionImplementationAdapter() {
        return null;
    }

    /**
     * Creates a new adapter for an object of class '{@link com.ericsson.xtumlrt.oopl.OOPLClassRefSimpleCollectionImplementation <em>OOPL Class Ref Simple Collection Implementation</em>}'.
     * <!-- begin-user-doc -->
     * This default implementation returns null so that we can easily ignore cases;
     * it's useful to ignore a case when inheritance will catch all the cases anyway.
     * <!-- end-user-doc -->
     * @return the new adapter.
     * @see com.ericsson.xtumlrt.oopl.OOPLClassRefSimpleCollectionImplementation
     * @generated
     */
    public Adapter createOOPLClassRefSimpleCollectionImplementationAdapter() {
        return null;
    }

    /**
     * Creates a new adapter for an object of class '{@link com.ericsson.xtumlrt.oopl.OOPLSequenceImplementation <em>OOPL Sequence Implementation</em>}'.
     * <!-- begin-user-doc -->
     * This default implementation returns null so that we can easily ignore cases;
     * it's useful to ignore a case when inheritance will catch all the cases anyway.
     * <!-- end-user-doc -->
     * @return the new adapter.
     * @see com.ericsson.xtumlrt.oopl.OOPLSequenceImplementation
     * @generated
     */
    public Adapter createOOPLSequenceImplementationAdapter() {
        return null;
    }

    /**
     * Creates a new adapter for the default case.
     * <!-- begin-user-doc -->
     * This default implementation returns null.
     * <!-- end-user-doc -->
     * @return the new adapter.
     * @generated
     */
    public Adapter createEObjectAdapter() {
        return null;
    }

} //OoplAdapterFactory
