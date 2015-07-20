/**
 */
package com.ericsson.xtumlrt.oopl.impl;

import com.ericsson.xtumlrt.oopl.*;

import org.eclipse.emf.ecore.EClass;
import org.eclipse.emf.ecore.EDataType;
import org.eclipse.emf.ecore.EObject;
import org.eclipse.emf.ecore.EPackage;

import org.eclipse.emf.ecore.impl.EFactoryImpl;

import org.eclipse.emf.ecore.plugin.EcorePlugin;

/**
 * <!-- begin-user-doc -->
 * An implementation of the model <b>Factory</b>.
 * <!-- end-user-doc -->
 * @generated
 */
public class OoplFactoryImpl extends EFactoryImpl implements OoplFactory {
    /**
     * Creates the default factory implementation.
     * <!-- begin-user-doc -->
     * <!-- end-user-doc -->
     * @generated
     */
    public static OoplFactory init() {
        try {
            OoplFactory theOoplFactory = (OoplFactory)EPackage.Registry.INSTANCE.getEFactory(OoplPackage.eNS_URI);
            if (theOoplFactory != null) {
                return theOoplFactory;
            }
        }
        catch (Exception exception) {
            EcorePlugin.INSTANCE.log(exception);
        }
        return new OoplFactoryImpl();
    }

    /**
     * Creates an instance of the factory.
     * <!-- begin-user-doc -->
     * <!-- end-user-doc -->
     * @generated
     */
    public OoplFactoryImpl() {
        super();
    }

    /**
     * <!-- begin-user-doc -->
     * <!-- end-user-doc -->
     * @generated
     */
    @Override
    public EObject create(EClass eClass) {
        switch (eClass.getClassifierID()) {
            case OoplPackage.OOPL_CLASS_REF_SIMPLE_COLLECTION: return createOOPLClassRefSimpleCollection();
            case OoplPackage.OOPL_CLASS_REF_ASSOC_COLLECTION: return createOOPLClassRefAssocCollection();
            case OoplPackage.OOPL_DERIVED_NAME_PROVIDER: return createOOPLDerivedNameProvider();
            case OoplPackage.OOPL_EXISTING_NAME_PROVIDER: return createOOPLExistingNameProvider();
            case OoplPackage.OOPL_SEQUENCE: return createOOPLSequence();
            case OoplPackage.OOPL_CLASS_REF_ASSOC_COLLECTION_IMPLEMENTATION: return createOOPLClassRefAssocCollectionImplementation();
            case OoplPackage.OOPL_CLASS_REF_SIMPLE_COLLECTION_IMPLEMENTATION: return createOOPLClassRefSimpleCollectionImplementation();
            case OoplPackage.OOPL_SEQUENCE_IMPLEMENTATION: return createOOPLSequenceImplementation();
            default:
                throw new IllegalArgumentException("The class '" + eClass.getName() + "' is not a valid classifier");
        }
    }

    /**
     * <!-- begin-user-doc -->
     * <!-- end-user-doc -->
     * @generated
     */
    @Override
    public Object createFromString(EDataType eDataType, String initialValue) {
        switch (eDataType.getClassifierID()) {
            case OoplPackage.SIMPLE_COLLECTION_KIND:
                return createSimpleCollectionKindFromString(eDataType, initialValue);
            case OoplPackage.ASSOCIATIVE_COLLECTION_KIND:
                return createAssociativeCollectionKindFromString(eDataType, initialValue);
            case OoplPackage.SEQUENCE_ORDEREDNESS_KIND:
                return createSequenceOrderednessKindFromString(eDataType, initialValue);
            case OoplPackage.SEQUENCE_UNIQUENESS_KIND:
                return createSequenceUniquenessKindFromString(eDataType, initialValue);
            default:
                throw new IllegalArgumentException("The datatype '" + eDataType.getName() + "' is not a valid classifier");
        }
    }

    /**
     * <!-- begin-user-doc -->
     * <!-- end-user-doc -->
     * @generated
     */
    @Override
    public String convertToString(EDataType eDataType, Object instanceValue) {
        switch (eDataType.getClassifierID()) {
            case OoplPackage.SIMPLE_COLLECTION_KIND:
                return convertSimpleCollectionKindToString(eDataType, instanceValue);
            case OoplPackage.ASSOCIATIVE_COLLECTION_KIND:
                return convertAssociativeCollectionKindToString(eDataType, instanceValue);
            case OoplPackage.SEQUENCE_ORDEREDNESS_KIND:
                return convertSequenceOrderednessKindToString(eDataType, instanceValue);
            case OoplPackage.SEQUENCE_UNIQUENESS_KIND:
                return convertSequenceUniquenessKindToString(eDataType, instanceValue);
            default:
                throw new IllegalArgumentException("The datatype '" + eDataType.getName() + "' is not a valid classifier");
        }
    }

    /**
     * <!-- begin-user-doc -->
     * <!-- end-user-doc -->
     * @generated
     */
    public OOPLClassRefSimpleCollection createOOPLClassRefSimpleCollection() {
        OOPLClassRefSimpleCollectionImpl ooplClassRefSimpleCollection = new OOPLClassRefSimpleCollectionImpl();
        return ooplClassRefSimpleCollection;
    }

    /**
     * <!-- begin-user-doc -->
     * <!-- end-user-doc -->
     * @generated
     */
    public OOPLClassRefAssocCollection createOOPLClassRefAssocCollection() {
        OOPLClassRefAssocCollectionImpl ooplClassRefAssocCollection = new OOPLClassRefAssocCollectionImpl();
        return ooplClassRefAssocCollection;
    }

    /**
     * <!-- begin-user-doc -->
     * <!-- end-user-doc -->
     * @generated
     */
    public OOPLDerivedNameProvider createOOPLDerivedNameProvider() {
        OOPLDerivedNameProviderImpl ooplDerivedNameProvider = new OOPLDerivedNameProviderImpl();
        return ooplDerivedNameProvider;
    }

    /**
     * <!-- begin-user-doc -->
     * <!-- end-user-doc -->
     * @generated
     */
    public OOPLExistingNameProvider createOOPLExistingNameProvider() {
        OOPLExistingNameProviderImpl ooplExistingNameProvider = new OOPLExistingNameProviderImpl();
        return ooplExistingNameProvider;
    }

    /**
     * <!-- begin-user-doc -->
     * <!-- end-user-doc -->
     * @generated
     */
    public OOPLSequence createOOPLSequence() {
        OOPLSequenceImpl ooplSequence = new OOPLSequenceImpl();
        return ooplSequence;
    }

    /**
     * <!-- begin-user-doc -->
     * <!-- end-user-doc -->
     * @generated
     */
    public OOPLClassRefAssocCollectionImplementation createOOPLClassRefAssocCollectionImplementation() {
        OOPLClassRefAssocCollectionImplementationImpl ooplClassRefAssocCollectionImplementation = new OOPLClassRefAssocCollectionImplementationImpl();
        return ooplClassRefAssocCollectionImplementation;
    }

    /**
     * <!-- begin-user-doc -->
     * <!-- end-user-doc -->
     * @generated
     */
    public OOPLClassRefSimpleCollectionImplementation createOOPLClassRefSimpleCollectionImplementation() {
        OOPLClassRefSimpleCollectionImplementationImpl ooplClassRefSimpleCollectionImplementation = new OOPLClassRefSimpleCollectionImplementationImpl();
        return ooplClassRefSimpleCollectionImplementation;
    }

    /**
     * <!-- begin-user-doc -->
     * <!-- end-user-doc -->
     * @generated
     */
    public OOPLSequenceImplementation createOOPLSequenceImplementation() {
        OOPLSequenceImplementationImpl ooplSequenceImplementation = new OOPLSequenceImplementationImpl();
        return ooplSequenceImplementation;
    }

    /**
     * <!-- begin-user-doc -->
     * <!-- end-user-doc -->
     * @generated
     */
    public SimpleCollectionKind createSimpleCollectionKindFromString(EDataType eDataType, String initialValue) {
        SimpleCollectionKind result = SimpleCollectionKind.get(initialValue);
        if (result == null) throw new IllegalArgumentException("The value '" + initialValue + "' is not a valid enumerator of '" + eDataType.getName() + "'");
        return result;
    }

    /**
     * <!-- begin-user-doc -->
     * <!-- end-user-doc -->
     * @generated
     */
    public String convertSimpleCollectionKindToString(EDataType eDataType, Object instanceValue) {
        return instanceValue == null ? null : instanceValue.toString();
    }

    /**
     * <!-- begin-user-doc -->
     * <!-- end-user-doc -->
     * @generated
     */
    public AssociativeCollectionKind createAssociativeCollectionKindFromString(EDataType eDataType, String initialValue) {
        AssociativeCollectionKind result = AssociativeCollectionKind.get(initialValue);
        if (result == null) throw new IllegalArgumentException("The value '" + initialValue + "' is not a valid enumerator of '" + eDataType.getName() + "'");
        return result;
    }

    /**
     * <!-- begin-user-doc -->
     * <!-- end-user-doc -->
     * @generated
     */
    public String convertAssociativeCollectionKindToString(EDataType eDataType, Object instanceValue) {
        return instanceValue == null ? null : instanceValue.toString();
    }

    /**
     * <!-- begin-user-doc -->
     * <!-- end-user-doc -->
     * @generated
     */
    public SequenceOrderednessKind createSequenceOrderednessKindFromString(EDataType eDataType, String initialValue) {
        SequenceOrderednessKind result = SequenceOrderednessKind.get(initialValue);
        if (result == null) throw new IllegalArgumentException("The value '" + initialValue + "' is not a valid enumerator of '" + eDataType.getName() + "'");
        return result;
    }

    /**
     * <!-- begin-user-doc -->
     * <!-- end-user-doc -->
     * @generated
     */
    public String convertSequenceOrderednessKindToString(EDataType eDataType, Object instanceValue) {
        return instanceValue == null ? null : instanceValue.toString();
    }

    /**
     * <!-- begin-user-doc -->
     * <!-- end-user-doc -->
     * @generated
     */
    public SequenceUniquenessKind createSequenceUniquenessKindFromString(EDataType eDataType, String initialValue) {
        SequenceUniquenessKind result = SequenceUniquenessKind.get(initialValue);
        if (result == null) throw new IllegalArgumentException("The value '" + initialValue + "' is not a valid enumerator of '" + eDataType.getName() + "'");
        return result;
    }

    /**
     * <!-- begin-user-doc -->
     * <!-- end-user-doc -->
     * @generated
     */
    public String convertSequenceUniquenessKindToString(EDataType eDataType, Object instanceValue) {
        return instanceValue == null ? null : instanceValue.toString();
    }

    /**
     * <!-- begin-user-doc -->
     * <!-- end-user-doc -->
     * @generated
     */
    public OoplPackage getOoplPackage() {
        return (OoplPackage)getEPackage();
    }

    /**
     * <!-- begin-user-doc -->
     * <!-- end-user-doc -->
     * @deprecated
     * @generated
     */
    @Deprecated
    public static OoplPackage getPackage() {
        return OoplPackage.eINSTANCE;
    }

} //OoplFactoryImpl
