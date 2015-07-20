/**
 */
package com.ericsson.xtumlrt.oopl.impl;

import com.ericsson.xtumlrt.oopl.AssociativeCollectionKind;
import com.ericsson.xtumlrt.oopl.BaseContainerImplementation;
import com.ericsson.xtumlrt.oopl.OOPLBasicType;
import com.ericsson.xtumlrt.oopl.OOPLClass;
import com.ericsson.xtumlrt.oopl.OOPLClassRefAssocCollection;
import com.ericsson.xtumlrt.oopl.OOPLClassRefAssocCollectionImplementation;
import com.ericsson.xtumlrt.oopl.OOPLClassRefSimpleCollection;
import com.ericsson.xtumlrt.oopl.OOPLClassRefSimpleCollectionImplementation;
import com.ericsson.xtumlrt.oopl.OOPLClassReference;
import com.ericsson.xtumlrt.oopl.OOPLClassReferenceCollection;
import com.ericsson.xtumlrt.oopl.OOPLClassReferenceStorage;
import com.ericsson.xtumlrt.oopl.OOPLDerivedNameProvider;
import com.ericsson.xtumlrt.oopl.OOPLEnumType;
import com.ericsson.xtumlrt.oopl.OOPLEnumerator;
import com.ericsson.xtumlrt.oopl.OOPLExistingNameProvider;
import com.ericsson.xtumlrt.oopl.OOPLNameProvider;
import com.ericsson.xtumlrt.oopl.OOPLRelation;
import com.ericsson.xtumlrt.oopl.OOPLSequence;
import com.ericsson.xtumlrt.oopl.OOPLSequenceImplementation;
import com.ericsson.xtumlrt.oopl.OOPLStructMember;
import com.ericsson.xtumlrt.oopl.OOPLStructType;
import com.ericsson.xtumlrt.oopl.OOPLType;
import com.ericsson.xtumlrt.oopl.OOPLUserDefinedType;
import com.ericsson.xtumlrt.oopl.OoplFactory;
import com.ericsson.xtumlrt.oopl.OoplPackage;
import com.ericsson.xtumlrt.oopl.SequenceOrderednessKind;
import com.ericsson.xtumlrt.oopl.SequenceUniquenessKind;
import com.ericsson.xtumlrt.oopl.SimpleCollectionKind;

import org.eclipse.emf.ecore.EAttribute;
import org.eclipse.emf.ecore.EClass;
import org.eclipse.emf.ecore.EEnum;
import org.eclipse.emf.ecore.EOperation;
import org.eclipse.emf.ecore.EPackage;
import org.eclipse.emf.ecore.EReference;

import org.eclipse.emf.ecore.impl.EPackageImpl;

import org.eclipse.papyrusrt.xtumlrt.common.CommonPackage;

import org.eclipse.papyrusrt.xtumlrt.xtuml.XtumlPackage;

/**
 * <!-- begin-user-doc -->
 * An implementation of the model <b>Package</b>.
 * <!-- end-user-doc -->
 * @generated
 */
public class OoplPackageImpl extends EPackageImpl implements OoplPackage {
    /**
     * <!-- begin-user-doc -->
     * <!-- end-user-doc -->
     * @generated
     */
    private EClass ooplClassEClass = null;

    /**
     * <!-- begin-user-doc -->
     * <!-- end-user-doc -->
     * @generated
     */
    private EClass ooplTypeEClass = null;

    /**
     * <!-- begin-user-doc -->
     * <!-- end-user-doc -->
     * @generated
     */
    private EClass ooplClassReferenceEClass = null;

    /**
     * <!-- begin-user-doc -->
     * <!-- end-user-doc -->
     * @generated
     */
    private EClass ooplClassReferenceCollectionEClass = null;

    /**
     * <!-- begin-user-doc -->
     * <!-- end-user-doc -->
     * @generated
     */
    private EClass ooplClassRefSimpleCollectionEClass = null;

    /**
     * <!-- begin-user-doc -->
     * <!-- end-user-doc -->
     * @generated
     */
    private EClass ooplClassRefAssocCollectionEClass = null;

    /**
     * <!-- begin-user-doc -->
     * <!-- end-user-doc -->
     * @generated
     */
    private EClass ooplClassReferenceStorageEClass = null;

    /**
     * <!-- begin-user-doc -->
     * <!-- end-user-doc -->
     * @generated
     */
    private EClass ooplRelationEClass = null;

    /**
     * <!-- begin-user-doc -->
     * <!-- end-user-doc -->
     * @generated
     */
    private EClass ooplNameProviderEClass = null;

    /**
     * <!-- begin-user-doc -->
     * <!-- end-user-doc -->
     * @generated
     */
    private EClass ooplDerivedNameProviderEClass = null;

    /**
     * <!-- begin-user-doc -->
     * <!-- end-user-doc -->
     * @generated
     */
    private EClass ooplExistingNameProviderEClass = null;

    /**
     * <!-- begin-user-doc -->
     * <!-- end-user-doc -->
     * @generated
     */
    private EClass ooplBasicTypeEClass = null;

    /**
     * <!-- begin-user-doc -->
     * <!-- end-user-doc -->
     * @generated
     */
    private EClass ooplEnumTypeEClass = null;

    /**
     * <!-- begin-user-doc -->
     * <!-- end-user-doc -->
     * @generated
     */
    private EClass ooplEnumeratorEClass = null;

    /**
     * <!-- begin-user-doc -->
     * <!-- end-user-doc -->
     * @generated
     */
    private EClass ooplStructTypeEClass = null;

    /**
     * <!-- begin-user-doc -->
     * <!-- end-user-doc -->
     * @generated
     */
    private EClass ooplStructMemberEClass = null;

    /**
     * <!-- begin-user-doc -->
     * <!-- end-user-doc -->
     * @generated
     */
    private EClass ooplSequenceEClass = null;

    /**
     * <!-- begin-user-doc -->
     * <!-- end-user-doc -->
     * @generated
     */
    private EClass ooplUserDefinedTypeEClass = null;

    /**
     * <!-- begin-user-doc -->
     * <!-- end-user-doc -->
     * @generated
     */
    private EClass baseContainerImplementationEClass = null;

    /**
     * <!-- begin-user-doc -->
     * <!-- end-user-doc -->
     * @generated
     */
    private EClass ooplClassRefAssocCollectionImplementationEClass = null;

    /**
     * <!-- begin-user-doc -->
     * <!-- end-user-doc -->
     * @generated
     */
    private EClass ooplClassRefSimpleCollectionImplementationEClass = null;

    /**
     * <!-- begin-user-doc -->
     * <!-- end-user-doc -->
     * @generated
     */
    private EClass ooplSequenceImplementationEClass = null;

    /**
     * <!-- begin-user-doc -->
     * <!-- end-user-doc -->
     * @generated
     */
    private EEnum simpleCollectionKindEEnum = null;

    /**
     * <!-- begin-user-doc -->
     * <!-- end-user-doc -->
     * @generated
     */
    private EEnum associativeCollectionKindEEnum = null;

    /**
     * <!-- begin-user-doc -->
     * <!-- end-user-doc -->
     * @generated
     */
    private EEnum sequenceOrderednessKindEEnum = null;

    /**
     * <!-- begin-user-doc -->
     * <!-- end-user-doc -->
     * @generated
     */
    private EEnum sequenceUniquenessKindEEnum = null;

    /**
     * Creates an instance of the model <b>Package</b>, registered with
     * {@link org.eclipse.emf.ecore.EPackage.Registry EPackage.Registry} by the package
     * package URI value.
     * <p>Note: the correct way to create the package is via the static
     * factory method {@link #init init()}, which also performs
     * initialization of the package, or returns the registered package,
     * if one already exists.
     * <!-- begin-user-doc -->
     * <!-- end-user-doc -->
     * @see org.eclipse.emf.ecore.EPackage.Registry
     * @see com.ericsson.xtumlrt.oopl.OoplPackage#eNS_URI
     * @see #init()
     * @generated
     */
    private OoplPackageImpl() {
        super(eNS_URI, OoplFactory.eINSTANCE);
    }

    /**
     * <!-- begin-user-doc -->
     * <!-- end-user-doc -->
     * @generated
     */
    private static boolean isInited = false;

    /**
     * Creates, registers, and initializes the <b>Package</b> for this model, and for any others upon which it depends.
     * 
     * <p>This method is used to initialize {@link OoplPackage#eINSTANCE} when that field is accessed.
     * Clients should not invoke it directly. Instead, they should simply access that field to obtain the package.
     * <!-- begin-user-doc -->
     * <!-- end-user-doc -->
     * @see #eNS_URI
     * @see #createPackageContents()
     * @see #initializePackageContents()
     * @generated
     */
    public static OoplPackage init() {
        if (isInited) return (OoplPackage)EPackage.Registry.INSTANCE.getEPackage(OoplPackage.eNS_URI);

        // Obtain or create and register package
        OoplPackageImpl theOoplPackage = (OoplPackageImpl)(EPackage.Registry.INSTANCE.get(eNS_URI) instanceof OoplPackageImpl ? EPackage.Registry.INSTANCE.get(eNS_URI) : new OoplPackageImpl());

        isInited = true;

        // Initialize simple dependencies
        XtumlPackage.eINSTANCE.eClass();

        // Create package meta-data objects
        theOoplPackage.createPackageContents();

        // Initialize created meta-data
        theOoplPackage.initializePackageContents();

        // Mark meta-data to indicate it can't be changed
        theOoplPackage.freeze();

  
        // Update the registry and return the package
        EPackage.Registry.INSTANCE.put(OoplPackage.eNS_URI, theOoplPackage);
        return theOoplPackage;
    }

    /**
     * <!-- begin-user-doc -->
     * <!-- end-user-doc -->
     * @generated
     */
    public EClass getOOPLClass() {
        return ooplClassEClass;
    }

    /**
     * <!-- begin-user-doc -->
     * <!-- end-user-doc -->
     * @generated
     */
    public EReference getOOPLClass_XtClass() {
        return (EReference)ooplClassEClass.getEStructuralFeatures().get(0);
    }

    /**
     * <!-- begin-user-doc -->
     * <!-- end-user-doc -->
     * @generated
     */
    public EReference getOOPLClass_ReferenceStorage() {
        return (EReference)ooplClassEClass.getEStructuralFeatures().get(1);
    }

    /**
     * <!-- begin-user-doc -->
     * <!-- end-user-doc -->
     * @generated
     */
    public EClass getOOPLType() {
        return ooplTypeEClass;
    }

    /**
     * <!-- begin-user-doc -->
     * <!-- end-user-doc -->
     * @generated
     */
    public EReference getOOPLType_CommonType() {
        return (EReference)ooplTypeEClass.getEStructuralFeatures().get(0);
    }

    /**
     * <!-- begin-user-doc -->
     * <!-- end-user-doc -->
     * @generated
     */
    public EClass getOOPLClassReference() {
        return ooplClassReferenceEClass;
    }

    /**
     * <!-- begin-user-doc -->
     * <!-- end-user-doc -->
     * @generated
     */
    public EReference getOOPLClassReference_OoplClass() {
        return (EReference)ooplClassReferenceEClass.getEStructuralFeatures().get(0);
    }

    /**
     * <!-- begin-user-doc -->
     * <!-- end-user-doc -->
     * @generated
     */
    public EClass getOOPLClassReferenceCollection() {
        return ooplClassReferenceCollectionEClass;
    }

    /**
     * <!-- begin-user-doc -->
     * <!-- end-user-doc -->
     * @generated
     */
    public EReference getOOPLClassReferenceCollection_OoplClass() {
        return (EReference)ooplClassReferenceCollectionEClass.getEStructuralFeatures().get(0);
    }

    /**
     * <!-- begin-user-doc -->
     * <!-- end-user-doc -->
     * @generated
     */
    public EClass getOOPLClassRefSimpleCollection() {
        return ooplClassRefSimpleCollectionEClass;
    }

    /**
     * <!-- begin-user-doc -->
     * <!-- end-user-doc -->
     * @generated
     */
    public EAttribute getOOPLClassRefSimpleCollection_Kind() {
        return (EAttribute)ooplClassRefSimpleCollectionEClass.getEStructuralFeatures().get(0);
    }

    /**
     * <!-- begin-user-doc -->
     * <!-- end-user-doc -->
     * @generated
     */
    public EReference getOOPLClassRefSimpleCollection_Implementation() {
        return (EReference)ooplClassRefSimpleCollectionEClass.getEStructuralFeatures().get(1);
    }

    /**
     * <!-- begin-user-doc -->
     * <!-- end-user-doc -->
     * @generated
     */
    public EClass getOOPLClassRefAssocCollection() {
        return ooplClassRefAssocCollectionEClass;
    }

    /**
     * <!-- begin-user-doc -->
     * <!-- end-user-doc -->
     * @generated
     */
    public EReference getOOPLClassRefAssocCollection_Key() {
        return (EReference)ooplClassRefAssocCollectionEClass.getEStructuralFeatures().get(0);
    }

    /**
     * <!-- begin-user-doc -->
     * <!-- end-user-doc -->
     * @generated
     */
    public EAttribute getOOPLClassRefAssocCollection_Kind() {
        return (EAttribute)ooplClassRefAssocCollectionEClass.getEStructuralFeatures().get(1);
    }

    /**
     * <!-- begin-user-doc -->
     * <!-- end-user-doc -->
     * @generated
     */
    public EReference getOOPLClassRefAssocCollection_Implementation() {
        return (EReference)ooplClassRefAssocCollectionEClass.getEStructuralFeatures().get(2);
    }

    /**
     * <!-- begin-user-doc -->
     * <!-- end-user-doc -->
     * @generated
     */
    public EClass getOOPLClassReferenceStorage() {
        return ooplClassReferenceStorageEClass;
    }

    /**
     * <!-- begin-user-doc -->
     * <!-- end-user-doc -->
     * @generated
     */
    public EReference getOOPLClassReferenceStorage_Type() {
        return (EReference)ooplClassReferenceStorageEClass.getEStructuralFeatures().get(0);
    }

    /**
     * <!-- begin-user-doc -->
     * <!-- end-user-doc -->
     * @generated
     */
    public EAttribute getOOPLClassReferenceStorage_Required() {
        return (EAttribute)ooplClassReferenceStorageEClass.getEStructuralFeatures().get(1);
    }

    /**
     * <!-- begin-user-doc -->
     * <!-- end-user-doc -->
     * @generated
     */
    public EClass getOOPLRelation() {
        return ooplRelationEClass;
    }

    /**
     * <!-- begin-user-doc -->
     * <!-- end-user-doc -->
     * @generated
     */
    public EReference getOOPLRelation_XtRelation() {
        return (EReference)ooplRelationEClass.getEStructuralFeatures().get(0);
    }

    /**
     * <!-- begin-user-doc -->
     * <!-- end-user-doc -->
     * @generated
     */
    public EReference getOOPLRelation_ReferenceStorage() {
        return (EReference)ooplRelationEClass.getEStructuralFeatures().get(1);
    }

    /**
     * <!-- begin-user-doc -->
     * <!-- end-user-doc -->
     * @generated
     */
    public EClass getOOPLNameProvider() {
        return ooplNameProviderEClass;
    }

    /**
     * <!-- begin-user-doc -->
     * <!-- end-user-doc -->
     * @generated
     */
    public EClass getOOPLDerivedNameProvider() {
        return ooplDerivedNameProviderEClass;
    }

    /**
     * <!-- begin-user-doc -->
     * <!-- end-user-doc -->
     * @generated
     */
    public EAttribute getOOPLDerivedNameProvider_Name() {
        return (EAttribute)ooplDerivedNameProviderEClass.getEStructuralFeatures().get(0);
    }

    /**
     * <!-- begin-user-doc -->
     * <!-- end-user-doc -->
     * @generated
     */
    public EClass getOOPLExistingNameProvider() {
        return ooplExistingNameProviderEClass;
    }

    /**
     * <!-- begin-user-doc -->
     * <!-- end-user-doc -->
     * @generated
     */
    public EReference getOOPLExistingNameProvider_CommonNamedElement() {
        return (EReference)ooplExistingNameProviderEClass.getEStructuralFeatures().get(0);
    }

    /**
     * <!-- begin-user-doc -->
     * <!-- end-user-doc -->
     * @generated
     */
    public EClass getOOPLBasicType() {
        return ooplBasicTypeEClass;
    }

    /**
     * <!-- begin-user-doc -->
     * <!-- end-user-doc -->
     * @generated
     */
    public EClass getOOPLEnumType() {
        return ooplEnumTypeEClass;
    }

    /**
     * <!-- begin-user-doc -->
     * <!-- end-user-doc -->
     * @generated
     */
    public EReference getOOPLEnumType_Enumerators() {
        return (EReference)ooplEnumTypeEClass.getEStructuralFeatures().get(0);
    }

    /**
     * <!-- begin-user-doc -->
     * <!-- end-user-doc -->
     * @generated
     */
    public EReference getOOPLEnumType_DefaultValue() {
        return (EReference)ooplEnumTypeEClass.getEStructuralFeatures().get(1);
    }

    /**
     * <!-- begin-user-doc -->
     * <!-- end-user-doc -->
     * @generated
     */
    public EClass getOOPLEnumerator() {
        return ooplEnumeratorEClass;
    }

    /**
     * <!-- begin-user-doc -->
     * <!-- end-user-doc -->
     * @generated
     */
    public EReference getOOPLEnumerator_CommonEnumerationLiteral() {
        return (EReference)ooplEnumeratorEClass.getEStructuralFeatures().get(0);
    }

    /**
     * <!-- begin-user-doc -->
     * <!-- end-user-doc -->
     * @generated
     */
    public EClass getOOPLStructType() {
        return ooplStructTypeEClass;
    }

    /**
     * <!-- begin-user-doc -->
     * <!-- end-user-doc -->
     * @generated
     */
    public EReference getOOPLStructType_Members() {
        return (EReference)ooplStructTypeEClass.getEStructuralFeatures().get(0);
    }

    /**
     * <!-- begin-user-doc -->
     * <!-- end-user-doc -->
     * @generated
     */
    public EClass getOOPLStructMember() {
        return ooplStructMemberEClass;
    }

    /**
     * <!-- begin-user-doc -->
     * <!-- end-user-doc -->
     * @generated
     */
    public EReference getOOPLStructMember_CommonMember() {
        return (EReference)ooplStructMemberEClass.getEStructuralFeatures().get(0);
    }

    /**
     * <!-- begin-user-doc -->
     * <!-- end-user-doc -->
     * @generated
     */
    public EReference getOOPLStructMember_Type() {
        return (EReference)ooplStructMemberEClass.getEStructuralFeatures().get(1);
    }

    /**
     * <!-- begin-user-doc -->
     * <!-- end-user-doc -->
     * @generated
     */
    public EClass getOOPLSequence() {
        return ooplSequenceEClass;
    }

    /**
     * <!-- begin-user-doc -->
     * <!-- end-user-doc -->
     * @generated
     */
    public EReference getOOPLSequence_ElementType() {
        return (EReference)ooplSequenceEClass.getEStructuralFeatures().get(0);
    }

    /**
     * <!-- begin-user-doc -->
     * <!-- end-user-doc -->
     * @generated
     */
    public EAttribute getOOPLSequence_Orderedness() {
        return (EAttribute)ooplSequenceEClass.getEStructuralFeatures().get(1);
    }

    /**
     * <!-- begin-user-doc -->
     * <!-- end-user-doc -->
     * @generated
     */
    public EAttribute getOOPLSequence_Uniqueness() {
        return (EAttribute)ooplSequenceEClass.getEStructuralFeatures().get(2);
    }

    /**
     * <!-- begin-user-doc -->
     * <!-- end-user-doc -->
     * @generated
     */
    public EReference getOOPLSequence_Implementation() {
        return (EReference)ooplSequenceEClass.getEStructuralFeatures().get(3);
    }

    /**
     * <!-- begin-user-doc -->
     * <!-- end-user-doc -->
     * @generated
     */
    public EClass getOOPLUserDefinedType() {
        return ooplUserDefinedTypeEClass;
    }

    /**
     * <!-- begin-user-doc -->
     * <!-- end-user-doc -->
     * @generated
     */
    public EReference getOOPLUserDefinedType_BaseType() {
        return (EReference)ooplUserDefinedTypeEClass.getEStructuralFeatures().get(0);
    }

    /**
     * <!-- begin-user-doc -->
     * <!-- end-user-doc -->
     * @generated
     */
    public EClass getBaseContainerImplementation() {
        return baseContainerImplementationEClass;
    }

    /**
     * <!-- begin-user-doc -->
     * <!-- end-user-doc -->
     * @generated
     */
    public EAttribute getBaseContainerImplementation_AnyTemplate() {
        return (EAttribute)baseContainerImplementationEClass.getEStructuralFeatures().get(0);
    }

    /**
     * <!-- begin-user-doc -->
     * <!-- end-user-doc -->
     * @generated
     */
    public EAttribute getBaseContainerImplementation_AddTemplate() {
        return (EAttribute)baseContainerImplementationEClass.getEStructuralFeatures().get(1);
    }

    /**
     * <!-- begin-user-doc -->
     * <!-- end-user-doc -->
     * @generated
     */
    public EAttribute getBaseContainerImplementation_AddAllTemplate() {
        return (EAttribute)baseContainerImplementationEClass.getEStructuralFeatures().get(2);
    }

    /**
     * <!-- begin-user-doc -->
     * <!-- end-user-doc -->
     * @generated
     */
    public EAttribute getBaseContainerImplementation_ClearTemplate() {
        return (EAttribute)baseContainerImplementationEClass.getEStructuralFeatures().get(3);
    }

    /**
     * <!-- begin-user-doc -->
     * <!-- end-user-doc -->
     * @generated
     */
    public EAttribute getBaseContainerImplementation_CloneTemplate() {
        return (EAttribute)baseContainerImplementationEClass.getEStructuralFeatures().get(4);
    }

    /**
     * <!-- begin-user-doc -->
     * <!-- end-user-doc -->
     * @generated
     */
    public EAttribute getBaseContainerImplementation_ContainsTemplate() {
        return (EAttribute)baseContainerImplementationEClass.getEStructuralFeatures().get(5);
    }

    /**
     * <!-- begin-user-doc -->
     * <!-- end-user-doc -->
     * @generated
     */
    public EAttribute getBaseContainerImplementation_ContainsAllTemplate() {
        return (EAttribute)baseContainerImplementationEClass.getEStructuralFeatures().get(6);
    }

    /**
     * <!-- begin-user-doc -->
     * <!-- end-user-doc -->
     * @generated
     */
    public EAttribute getBaseContainerImplementation_CountOfTemplate() {
        return (EAttribute)baseContainerImplementationEClass.getEStructuralFeatures().get(7);
    }

    /**
     * <!-- begin-user-doc -->
     * <!-- end-user-doc -->
     * @generated
     */
    public EAttribute getBaseContainerImplementation_ElementAtIndexTemplate() {
        return (EAttribute)baseContainerImplementationEClass.getEStructuralFeatures().get(8);
    }

    /**
     * <!-- begin-user-doc -->
     * <!-- end-user-doc -->
     * @generated
     */
    public EAttribute getBaseContainerImplementation_InsertElementAtIndexTemplate() {
        return (EAttribute)baseContainerImplementationEClass.getEStructuralFeatures().get(9);
    }

    /**
     * <!-- begin-user-doc -->
     * <!-- end-user-doc -->
     * @generated
     */
    public EAttribute getBaseContainerImplementation_IsEmptyTemplate() {
        return (EAttribute)baseContainerImplementationEClass.getEStructuralFeatures().get(10);
    }

    /**
     * <!-- begin-user-doc -->
     * <!-- end-user-doc -->
     * @generated
     */
    public EAttribute getBaseContainerImplementation_RemoveTemplate() {
        return (EAttribute)baseContainerImplementationEClass.getEStructuralFeatures().get(11);
    }

    /**
     * <!-- begin-user-doc -->
     * <!-- end-user-doc -->
     * @generated
     */
    public EAttribute getBaseContainerImplementation_RemoveAllTemplate() {
        return (EAttribute)baseContainerImplementationEClass.getEStructuralFeatures().get(12);
    }

    /**
     * <!-- begin-user-doc -->
     * <!-- end-user-doc -->
     * @generated
     */
    public EAttribute getBaseContainerImplementation_ReplaceElementAtIndexTemplate() {
        return (EAttribute)baseContainerImplementationEClass.getEStructuralFeatures().get(13);
    }

    /**
     * <!-- begin-user-doc -->
     * <!-- end-user-doc -->
     * @generated
     */
    public EAttribute getBaseContainerImplementation_RetainAllTemplate() {
        return (EAttribute)baseContainerImplementationEClass.getEStructuralFeatures().get(14);
    }

    /**
     * <!-- begin-user-doc -->
     * <!-- end-user-doc -->
     * @generated
     */
    public EAttribute getBaseContainerImplementation_SizeTemplate() {
        return (EAttribute)baseContainerImplementationEClass.getEStructuralFeatures().get(15);
    }

    /**
     * <!-- begin-user-doc -->
     * <!-- end-user-doc -->
     * @generated
     */
    public EAttribute getBaseContainerImplementation_ContainerQualifiedName() {
        return (EAttribute)baseContainerImplementationEClass.getEStructuralFeatures().get(16);
    }

    /**
     * <!-- begin-user-doc -->
     * <!-- end-user-doc -->
     * @generated
     */
    public EAttribute getBaseContainerImplementation_ContainerHeaderIncludes() {
        return (EAttribute)baseContainerImplementationEClass.getEStructuralFeatures().get(17);
    }

    /**
     * <!-- begin-user-doc -->
     * <!-- end-user-doc -->
     * @generated
     */
    public EOperation getBaseContainerImplementation__GenerateAdd__String_String_String() {
        return baseContainerImplementationEClass.getEOperations().get(0);
    }

    /**
     * <!-- begin-user-doc -->
     * <!-- end-user-doc -->
     * @generated
     */
    public EOperation getBaseContainerImplementation__GenerateAddAll__String_String() {
        return baseContainerImplementationEClass.getEOperations().get(1);
    }

    /**
     * <!-- begin-user-doc -->
     * <!-- end-user-doc -->
     * @generated
     */
    public EOperation getBaseContainerImplementation__GenerateClear__String() {
        return baseContainerImplementationEClass.getEOperations().get(2);
    }

    /**
     * <!-- begin-user-doc -->
     * <!-- end-user-doc -->
     * @generated
     */
    public EOperation getBaseContainerImplementation__GenerateClone__String_String_String() {
        return baseContainerImplementationEClass.getEOperations().get(3);
    }

    /**
     * <!-- begin-user-doc -->
     * <!-- end-user-doc -->
     * @generated
     */
    public EOperation getBaseContainerImplementation__GenerateContains__String_String_String() {
        return baseContainerImplementationEClass.getEOperations().get(4);
    }

    /**
     * <!-- begin-user-doc -->
     * <!-- end-user-doc -->
     * @generated
     */
    public EOperation getBaseContainerImplementation__GenerateContainsAll__String_String_String_String_String() {
        return baseContainerImplementationEClass.getEOperations().get(5);
    }

    /**
     * <!-- begin-user-doc -->
     * <!-- end-user-doc -->
     * @generated
     */
    public EOperation getBaseContainerImplementation__GenerateIsEmpty__String_String() {
        return baseContainerImplementationEClass.getEOperations().get(6);
    }

    /**
     * <!-- begin-user-doc -->
     * <!-- end-user-doc -->
     * @generated
     */
    public EOperation getBaseContainerImplementation__GenerateRemove__String_String() {
        return baseContainerImplementationEClass.getEOperations().get(7);
    }

    /**
     * <!-- begin-user-doc -->
     * <!-- end-user-doc -->
     * @generated
     */
    public EOperation getBaseContainerImplementation__GenerateRemoveAll__String_String_String_String() {
        return baseContainerImplementationEClass.getEOperations().get(8);
    }

    /**
     * <!-- begin-user-doc -->
     * <!-- end-user-doc -->
     * @generated
     */
    public EOperation getBaseContainerImplementation__GenerateRetainAll__String_String_String() {
        return baseContainerImplementationEClass.getEOperations().get(9);
    }

    /**
     * <!-- begin-user-doc -->
     * <!-- end-user-doc -->
     * @generated
     */
    public EOperation getBaseContainerImplementation__GenerateSize__String_String() {
        return baseContainerImplementationEClass.getEOperations().get(10);
    }

    /**
     * <!-- begin-user-doc -->
     * <!-- end-user-doc -->
     * @generated
     */
    public EClass getOOPLClassRefAssocCollectionImplementation() {
        return ooplClassRefAssocCollectionImplementationEClass;
    }

    /**
     * <!-- begin-user-doc -->
     * <!-- end-user-doc -->
     * @generated
     */
    public EAttribute getOOPLClassRefAssocCollectionImplementation_Kind() {
        return (EAttribute)ooplClassRefAssocCollectionImplementationEClass.getEStructuralFeatures().get(0);
    }

    /**
     * <!-- begin-user-doc -->
     * <!-- end-user-doc -->
     * @generated
     */
    public EOperation getOOPLClassRefAssocCollectionImplementation__GenerateCountOf__String_String_String() {
        return ooplClassRefAssocCollectionImplementationEClass.getEOperations().get(0);
    }

    /**
     * <!-- begin-user-doc -->
     * <!-- end-user-doc -->
     * @generated
     */
    public EOperation getOOPLClassRefAssocCollectionImplementation__GenerateAny__String_String_String() {
        return ooplClassRefAssocCollectionImplementationEClass.getEOperations().get(1);
    }

    /**
     * <!-- begin-user-doc -->
     * <!-- end-user-doc -->
     * @generated
     */
    public EClass getOOPLClassRefSimpleCollectionImplementation() {
        return ooplClassRefSimpleCollectionImplementationEClass;
    }

    /**
     * <!-- begin-user-doc -->
     * <!-- end-user-doc -->
     * @generated
     */
    public EAttribute getOOPLClassRefSimpleCollectionImplementation_Kind() {
        return (EAttribute)ooplClassRefSimpleCollectionImplementationEClass.getEStructuralFeatures().get(0);
    }

    /**
     * <!-- begin-user-doc -->
     * <!-- end-user-doc -->
     * @generated
     */
    public EOperation getOOPLClassRefSimpleCollectionImplementation__GenerateElementAtIndex__String_String_String_String() {
        return ooplClassRefSimpleCollectionImplementationEClass.getEOperations().get(0);
    }

    /**
     * <!-- begin-user-doc -->
     * <!-- end-user-doc -->
     * @generated
     */
    public EOperation getOOPLClassRefSimpleCollectionImplementation__GenerateInsertElementAtIndex__String_String_String_String() {
        return ooplClassRefSimpleCollectionImplementationEClass.getEOperations().get(1);
    }

    /**
     * <!-- begin-user-doc -->
     * <!-- end-user-doc -->
     * @generated
     */
    public EOperation getOOPLClassRefSimpleCollectionImplementation__GenerateReplaceElementAtIndex__String_String_String_String() {
        return ooplClassRefSimpleCollectionImplementationEClass.getEOperations().get(2);
    }

    /**
     * <!-- begin-user-doc -->
     * <!-- end-user-doc -->
     * @generated
     */
    public EClass getOOPLSequenceImplementation() {
        return ooplSequenceImplementationEClass;
    }

    /**
     * <!-- begin-user-doc -->
     * <!-- end-user-doc -->
     * @generated
     */
    public EAttribute getOOPLSequenceImplementation_Uniqueness() {
        return (EAttribute)ooplSequenceImplementationEClass.getEStructuralFeatures().get(0);
    }

    /**
     * <!-- begin-user-doc -->
     * <!-- end-user-doc -->
     * @generated
     */
    public EAttribute getOOPLSequenceImplementation_Orderedness() {
        return (EAttribute)ooplSequenceImplementationEClass.getEStructuralFeatures().get(1);
    }

    /**
     * <!-- begin-user-doc -->
     * <!-- end-user-doc -->
     * @generated
     */
    public EOperation getOOPLSequenceImplementation__GenerateAny__String_String_String() {
        return ooplSequenceImplementationEClass.getEOperations().get(0);
    }

    /**
     * <!-- begin-user-doc -->
     * <!-- end-user-doc -->
     * @generated
     */
    public EOperation getOOPLSequenceImplementation__GenerateCountOf__String_String_String() {
        return ooplSequenceImplementationEClass.getEOperations().get(1);
    }

    /**
     * <!-- begin-user-doc -->
     * <!-- end-user-doc -->
     * @generated
     */
    public EOperation getOOPLSequenceImplementation__GenerateElementAtIndex__String_String_String_String() {
        return ooplSequenceImplementationEClass.getEOperations().get(2);
    }

    /**
     * <!-- begin-user-doc -->
     * <!-- end-user-doc -->
     * @generated
     */
    public EOperation getOOPLSequenceImplementation__GenerateInsertElementAtIndex__String_String_String_String() {
        return ooplSequenceImplementationEClass.getEOperations().get(3);
    }

    /**
     * <!-- begin-user-doc -->
     * <!-- end-user-doc -->
     * @generated
     */
    public EOperation getOOPLSequenceImplementation__GenerateReplaceElementAtIndex__String_String_String_String() {
        return ooplSequenceImplementationEClass.getEOperations().get(4);
    }

    /**
     * <!-- begin-user-doc -->
     * <!-- end-user-doc -->
     * @generated
     */
    public EEnum getSimpleCollectionKind() {
        return simpleCollectionKindEEnum;
    }

    /**
     * <!-- begin-user-doc -->
     * <!-- end-user-doc -->
     * @generated
     */
    public EEnum getAssociativeCollectionKind() {
        return associativeCollectionKindEEnum;
    }

    /**
     * <!-- begin-user-doc -->
     * <!-- end-user-doc -->
     * @generated
     */
    public EEnum getSequenceOrderednessKind() {
        return sequenceOrderednessKindEEnum;
    }

    /**
     * <!-- begin-user-doc -->
     * <!-- end-user-doc -->
     * @generated
     */
    public EEnum getSequenceUniquenessKind() {
        return sequenceUniquenessKindEEnum;
    }

    /**
     * <!-- begin-user-doc -->
     * <!-- end-user-doc -->
     * @generated
     */
    public OoplFactory getOoplFactory() {
        return (OoplFactory)getEFactoryInstance();
    }

    /**
     * <!-- begin-user-doc -->
     * <!-- end-user-doc -->
     * @generated
     */
    private boolean isCreated = false;

    /**
     * Creates the meta-model objects for the package.  This method is
     * guarded to have no affect on any invocation but its first.
     * <!-- begin-user-doc -->
     * <!-- end-user-doc -->
     * @generated
     */
    public void createPackageContents() {
        if (isCreated) return;
        isCreated = true;

        // Create classes and their features
        ooplClassEClass = createEClass(OOPL_CLASS);
        createEReference(ooplClassEClass, OOPL_CLASS__XT_CLASS);
        createEReference(ooplClassEClass, OOPL_CLASS__REFERENCE_STORAGE);

        ooplTypeEClass = createEClass(OOPL_TYPE);
        createEReference(ooplTypeEClass, OOPL_TYPE__COMMON_TYPE);

        ooplClassReferenceEClass = createEClass(OOPL_CLASS_REFERENCE);
        createEReference(ooplClassReferenceEClass, OOPL_CLASS_REFERENCE__OOPL_CLASS);

        ooplClassReferenceCollectionEClass = createEClass(OOPL_CLASS_REFERENCE_COLLECTION);
        createEReference(ooplClassReferenceCollectionEClass, OOPL_CLASS_REFERENCE_COLLECTION__OOPL_CLASS);

        ooplClassRefSimpleCollectionEClass = createEClass(OOPL_CLASS_REF_SIMPLE_COLLECTION);
        createEAttribute(ooplClassRefSimpleCollectionEClass, OOPL_CLASS_REF_SIMPLE_COLLECTION__KIND);
        createEReference(ooplClassRefSimpleCollectionEClass, OOPL_CLASS_REF_SIMPLE_COLLECTION__IMPLEMENTATION);

        ooplClassRefAssocCollectionEClass = createEClass(OOPL_CLASS_REF_ASSOC_COLLECTION);
        createEReference(ooplClassRefAssocCollectionEClass, OOPL_CLASS_REF_ASSOC_COLLECTION__KEY);
        createEAttribute(ooplClassRefAssocCollectionEClass, OOPL_CLASS_REF_ASSOC_COLLECTION__KIND);
        createEReference(ooplClassRefAssocCollectionEClass, OOPL_CLASS_REF_ASSOC_COLLECTION__IMPLEMENTATION);

        ooplClassReferenceStorageEClass = createEClass(OOPL_CLASS_REFERENCE_STORAGE);
        createEReference(ooplClassReferenceStorageEClass, OOPL_CLASS_REFERENCE_STORAGE__TYPE);
        createEAttribute(ooplClassReferenceStorageEClass, OOPL_CLASS_REFERENCE_STORAGE__REQUIRED);

        ooplRelationEClass = createEClass(OOPL_RELATION);
        createEReference(ooplRelationEClass, OOPL_RELATION__XT_RELATION);
        createEReference(ooplRelationEClass, OOPL_RELATION__REFERENCE_STORAGE);

        ooplNameProviderEClass = createEClass(OOPL_NAME_PROVIDER);

        ooplDerivedNameProviderEClass = createEClass(OOPL_DERIVED_NAME_PROVIDER);
        createEAttribute(ooplDerivedNameProviderEClass, OOPL_DERIVED_NAME_PROVIDER__NAME);

        ooplExistingNameProviderEClass = createEClass(OOPL_EXISTING_NAME_PROVIDER);
        createEReference(ooplExistingNameProviderEClass, OOPL_EXISTING_NAME_PROVIDER__COMMON_NAMED_ELEMENT);

        ooplBasicTypeEClass = createEClass(OOPL_BASIC_TYPE);

        ooplEnumTypeEClass = createEClass(OOPL_ENUM_TYPE);
        createEReference(ooplEnumTypeEClass, OOPL_ENUM_TYPE__ENUMERATORS);
        createEReference(ooplEnumTypeEClass, OOPL_ENUM_TYPE__DEFAULT_VALUE);

        ooplEnumeratorEClass = createEClass(OOPL_ENUMERATOR);
        createEReference(ooplEnumeratorEClass, OOPL_ENUMERATOR__COMMON_ENUMERATION_LITERAL);

        ooplStructTypeEClass = createEClass(OOPL_STRUCT_TYPE);
        createEReference(ooplStructTypeEClass, OOPL_STRUCT_TYPE__MEMBERS);

        ooplStructMemberEClass = createEClass(OOPL_STRUCT_MEMBER);
        createEReference(ooplStructMemberEClass, OOPL_STRUCT_MEMBER__COMMON_MEMBER);
        createEReference(ooplStructMemberEClass, OOPL_STRUCT_MEMBER__TYPE);

        ooplSequenceEClass = createEClass(OOPL_SEQUENCE);
        createEReference(ooplSequenceEClass, OOPL_SEQUENCE__ELEMENT_TYPE);
        createEAttribute(ooplSequenceEClass, OOPL_SEQUENCE__ORDEREDNESS);
        createEAttribute(ooplSequenceEClass, OOPL_SEQUENCE__UNIQUENESS);
        createEReference(ooplSequenceEClass, OOPL_SEQUENCE__IMPLEMENTATION);

        ooplUserDefinedTypeEClass = createEClass(OOPL_USER_DEFINED_TYPE);
        createEReference(ooplUserDefinedTypeEClass, OOPL_USER_DEFINED_TYPE__BASE_TYPE);

        baseContainerImplementationEClass = createEClass(BASE_CONTAINER_IMPLEMENTATION);
        createEAttribute(baseContainerImplementationEClass, BASE_CONTAINER_IMPLEMENTATION__ANY_TEMPLATE);
        createEAttribute(baseContainerImplementationEClass, BASE_CONTAINER_IMPLEMENTATION__ADD_TEMPLATE);
        createEAttribute(baseContainerImplementationEClass, BASE_CONTAINER_IMPLEMENTATION__ADD_ALL_TEMPLATE);
        createEAttribute(baseContainerImplementationEClass, BASE_CONTAINER_IMPLEMENTATION__CLEAR_TEMPLATE);
        createEAttribute(baseContainerImplementationEClass, BASE_CONTAINER_IMPLEMENTATION__CLONE_TEMPLATE);
        createEAttribute(baseContainerImplementationEClass, BASE_CONTAINER_IMPLEMENTATION__CONTAINS_TEMPLATE);
        createEAttribute(baseContainerImplementationEClass, BASE_CONTAINER_IMPLEMENTATION__CONTAINS_ALL_TEMPLATE);
        createEAttribute(baseContainerImplementationEClass, BASE_CONTAINER_IMPLEMENTATION__COUNT_OF_TEMPLATE);
        createEAttribute(baseContainerImplementationEClass, BASE_CONTAINER_IMPLEMENTATION__ELEMENT_AT_INDEX_TEMPLATE);
        createEAttribute(baseContainerImplementationEClass, BASE_CONTAINER_IMPLEMENTATION__INSERT_ELEMENT_AT_INDEX_TEMPLATE);
        createEAttribute(baseContainerImplementationEClass, BASE_CONTAINER_IMPLEMENTATION__IS_EMPTY_TEMPLATE);
        createEAttribute(baseContainerImplementationEClass, BASE_CONTAINER_IMPLEMENTATION__REMOVE_TEMPLATE);
        createEAttribute(baseContainerImplementationEClass, BASE_CONTAINER_IMPLEMENTATION__REMOVE_ALL_TEMPLATE);
        createEAttribute(baseContainerImplementationEClass, BASE_CONTAINER_IMPLEMENTATION__REPLACE_ELEMENT_AT_INDEX_TEMPLATE);
        createEAttribute(baseContainerImplementationEClass, BASE_CONTAINER_IMPLEMENTATION__RETAIN_ALL_TEMPLATE);
        createEAttribute(baseContainerImplementationEClass, BASE_CONTAINER_IMPLEMENTATION__SIZE_TEMPLATE);
        createEAttribute(baseContainerImplementationEClass, BASE_CONTAINER_IMPLEMENTATION__CONTAINER_QUALIFIED_NAME);
        createEAttribute(baseContainerImplementationEClass, BASE_CONTAINER_IMPLEMENTATION__CONTAINER_HEADER_INCLUDES);
        createEOperation(baseContainerImplementationEClass, BASE_CONTAINER_IMPLEMENTATION___GENERATE_ADD__STRING_STRING_STRING);
        createEOperation(baseContainerImplementationEClass, BASE_CONTAINER_IMPLEMENTATION___GENERATE_ADD_ALL__STRING_STRING);
        createEOperation(baseContainerImplementationEClass, BASE_CONTAINER_IMPLEMENTATION___GENERATE_CLEAR__STRING);
        createEOperation(baseContainerImplementationEClass, BASE_CONTAINER_IMPLEMENTATION___GENERATE_CLONE__STRING_STRING_STRING);
        createEOperation(baseContainerImplementationEClass, BASE_CONTAINER_IMPLEMENTATION___GENERATE_CONTAINS__STRING_STRING_STRING);
        createEOperation(baseContainerImplementationEClass, BASE_CONTAINER_IMPLEMENTATION___GENERATE_CONTAINS_ALL__STRING_STRING_STRING_STRING_STRING);
        createEOperation(baseContainerImplementationEClass, BASE_CONTAINER_IMPLEMENTATION___GENERATE_IS_EMPTY__STRING_STRING);
        createEOperation(baseContainerImplementationEClass, BASE_CONTAINER_IMPLEMENTATION___GENERATE_REMOVE__STRING_STRING);
        createEOperation(baseContainerImplementationEClass, BASE_CONTAINER_IMPLEMENTATION___GENERATE_REMOVE_ALL__STRING_STRING_STRING_STRING);
        createEOperation(baseContainerImplementationEClass, BASE_CONTAINER_IMPLEMENTATION___GENERATE_RETAIN_ALL__STRING_STRING_STRING);
        createEOperation(baseContainerImplementationEClass, BASE_CONTAINER_IMPLEMENTATION___GENERATE_SIZE__STRING_STRING);

        ooplClassRefAssocCollectionImplementationEClass = createEClass(OOPL_CLASS_REF_ASSOC_COLLECTION_IMPLEMENTATION);
        createEAttribute(ooplClassRefAssocCollectionImplementationEClass, OOPL_CLASS_REF_ASSOC_COLLECTION_IMPLEMENTATION__KIND);
        createEOperation(ooplClassRefAssocCollectionImplementationEClass, OOPL_CLASS_REF_ASSOC_COLLECTION_IMPLEMENTATION___GENERATE_COUNT_OF__STRING_STRING_STRING);
        createEOperation(ooplClassRefAssocCollectionImplementationEClass, OOPL_CLASS_REF_ASSOC_COLLECTION_IMPLEMENTATION___GENERATE_ANY__STRING_STRING_STRING);

        ooplClassRefSimpleCollectionImplementationEClass = createEClass(OOPL_CLASS_REF_SIMPLE_COLLECTION_IMPLEMENTATION);
        createEAttribute(ooplClassRefSimpleCollectionImplementationEClass, OOPL_CLASS_REF_SIMPLE_COLLECTION_IMPLEMENTATION__KIND);
        createEOperation(ooplClassRefSimpleCollectionImplementationEClass, OOPL_CLASS_REF_SIMPLE_COLLECTION_IMPLEMENTATION___GENERATE_ELEMENT_AT_INDEX__STRING_STRING_STRING_STRING);
        createEOperation(ooplClassRefSimpleCollectionImplementationEClass, OOPL_CLASS_REF_SIMPLE_COLLECTION_IMPLEMENTATION___GENERATE_INSERT_ELEMENT_AT_INDEX__STRING_STRING_STRING_STRING);
        createEOperation(ooplClassRefSimpleCollectionImplementationEClass, OOPL_CLASS_REF_SIMPLE_COLLECTION_IMPLEMENTATION___GENERATE_REPLACE_ELEMENT_AT_INDEX__STRING_STRING_STRING_STRING);

        ooplSequenceImplementationEClass = createEClass(OOPL_SEQUENCE_IMPLEMENTATION);
        createEAttribute(ooplSequenceImplementationEClass, OOPL_SEQUENCE_IMPLEMENTATION__UNIQUENESS);
        createEAttribute(ooplSequenceImplementationEClass, OOPL_SEQUENCE_IMPLEMENTATION__ORDEREDNESS);
        createEOperation(ooplSequenceImplementationEClass, OOPL_SEQUENCE_IMPLEMENTATION___GENERATE_ANY__STRING_STRING_STRING);
        createEOperation(ooplSequenceImplementationEClass, OOPL_SEQUENCE_IMPLEMENTATION___GENERATE_COUNT_OF__STRING_STRING_STRING);
        createEOperation(ooplSequenceImplementationEClass, OOPL_SEQUENCE_IMPLEMENTATION___GENERATE_ELEMENT_AT_INDEX__STRING_STRING_STRING_STRING);
        createEOperation(ooplSequenceImplementationEClass, OOPL_SEQUENCE_IMPLEMENTATION___GENERATE_INSERT_ELEMENT_AT_INDEX__STRING_STRING_STRING_STRING);
        createEOperation(ooplSequenceImplementationEClass, OOPL_SEQUENCE_IMPLEMENTATION___GENERATE_REPLACE_ELEMENT_AT_INDEX__STRING_STRING_STRING_STRING);

        // Create enums
        simpleCollectionKindEEnum = createEEnum(SIMPLE_COLLECTION_KIND);
        associativeCollectionKindEEnum = createEEnum(ASSOCIATIVE_COLLECTION_KIND);
        sequenceOrderednessKindEEnum = createEEnum(SEQUENCE_ORDEREDNESS_KIND);
        sequenceUniquenessKindEEnum = createEEnum(SEQUENCE_UNIQUENESS_KIND);
    }

    /**
     * <!-- begin-user-doc -->
     * <!-- end-user-doc -->
     * @generated
     */
    private boolean isInitialized = false;

    /**
     * Complete the initialization of the package and its meta-model.  This
     * method is guarded to have no affect on any invocation but its first.
     * <!-- begin-user-doc -->
     * <!-- end-user-doc -->
     * @generated
     */
    public void initializePackageContents() {
        if (isInitialized) return;
        isInitialized = true;

        // Initialize package
        setName(eNAME);
        setNsPrefix(eNS_PREFIX);
        setNsURI(eNS_URI);

        // Obtain other dependent packages
        XtumlPackage theXtumlPackage = (XtumlPackage)EPackage.Registry.INSTANCE.getEPackage(XtumlPackage.eNS_URI);
        CommonPackage theCommonPackage = (CommonPackage)EPackage.Registry.INSTANCE.getEPackage(CommonPackage.eNS_URI);

        // Create type parameters

        // Set bounds for type parameters

        // Add supertypes to classes
        ooplClassReferenceEClass.getESuperTypes().add(this.getOOPLType());
        ooplClassReferenceCollectionEClass.getESuperTypes().add(this.getOOPLType());
        ooplClassRefSimpleCollectionEClass.getESuperTypes().add(this.getOOPLClassReferenceCollection());
        ooplClassRefAssocCollectionEClass.getESuperTypes().add(this.getOOPLClassReferenceCollection());
        ooplDerivedNameProviderEClass.getESuperTypes().add(this.getOOPLNameProvider());
        ooplExistingNameProviderEClass.getESuperTypes().add(this.getOOPLNameProvider());
        ooplBasicTypeEClass.getESuperTypes().add(this.getOOPLType());
        ooplEnumTypeEClass.getESuperTypes().add(this.getOOPLType());
        ooplStructTypeEClass.getESuperTypes().add(this.getOOPLType());
        ooplSequenceEClass.getESuperTypes().add(this.getOOPLType());
        ooplUserDefinedTypeEClass.getESuperTypes().add(this.getOOPLType());
        ooplClassRefAssocCollectionImplementationEClass.getESuperTypes().add(this.getBaseContainerImplementation());
        ooplClassRefSimpleCollectionImplementationEClass.getESuperTypes().add(this.getBaseContainerImplementation());
        ooplSequenceImplementationEClass.getESuperTypes().add(this.getBaseContainerImplementation());

        // Initialize classes, features, and operations; add parameters
        initEClass(ooplClassEClass, OOPLClass.class, "OOPLClass", IS_ABSTRACT, !IS_INTERFACE, IS_GENERATED_INSTANCE_CLASS);
        initEReference(getOOPLClass_XtClass(), theXtumlPackage.getXTClass(), null, "xtClass", null, 1, 1, OOPLClass.class, !IS_TRANSIENT, !IS_VOLATILE, IS_CHANGEABLE, !IS_COMPOSITE, IS_RESOLVE_PROXIES, !IS_UNSETTABLE, IS_UNIQUE, !IS_DERIVED, IS_ORDERED);
        initEReference(getOOPLClass_ReferenceStorage(), this.getOOPLClassReferenceStorage(), null, "referenceStorage", null, 0, -1, OOPLClass.class, !IS_TRANSIENT, !IS_VOLATILE, IS_CHANGEABLE, !IS_COMPOSITE, IS_RESOLVE_PROXIES, !IS_UNSETTABLE, IS_UNIQUE, !IS_DERIVED, IS_ORDERED);

        initEClass(ooplTypeEClass, OOPLType.class, "OOPLType", IS_ABSTRACT, !IS_INTERFACE, IS_GENERATED_INSTANCE_CLASS);
        initEReference(getOOPLType_CommonType(), theCommonPackage.getType(), null, "commonType", null, 0, 1, OOPLType.class, !IS_TRANSIENT, !IS_VOLATILE, IS_CHANGEABLE, !IS_COMPOSITE, IS_RESOLVE_PROXIES, !IS_UNSETTABLE, IS_UNIQUE, !IS_DERIVED, IS_ORDERED);

        initEClass(ooplClassReferenceEClass, OOPLClassReference.class, "OOPLClassReference", IS_ABSTRACT, !IS_INTERFACE, IS_GENERATED_INSTANCE_CLASS);
        initEReference(getOOPLClassReference_OoplClass(), this.getOOPLClass(), null, "ooplClass", null, 1, 1, OOPLClassReference.class, !IS_TRANSIENT, !IS_VOLATILE, IS_CHANGEABLE, !IS_COMPOSITE, IS_RESOLVE_PROXIES, !IS_UNSETTABLE, IS_UNIQUE, !IS_DERIVED, IS_ORDERED);

        initEClass(ooplClassReferenceCollectionEClass, OOPLClassReferenceCollection.class, "OOPLClassReferenceCollection", IS_ABSTRACT, !IS_INTERFACE, IS_GENERATED_INSTANCE_CLASS);
        initEReference(getOOPLClassReferenceCollection_OoplClass(), this.getOOPLClass(), null, "ooplClass", null, 1, 1, OOPLClassReferenceCollection.class, !IS_TRANSIENT, !IS_VOLATILE, IS_CHANGEABLE, !IS_COMPOSITE, IS_RESOLVE_PROXIES, !IS_UNSETTABLE, IS_UNIQUE, !IS_DERIVED, IS_ORDERED);

        initEClass(ooplClassRefSimpleCollectionEClass, OOPLClassRefSimpleCollection.class, "OOPLClassRefSimpleCollection", !IS_ABSTRACT, !IS_INTERFACE, IS_GENERATED_INSTANCE_CLASS);
        initEAttribute(getOOPLClassRefSimpleCollection_Kind(), this.getSimpleCollectionKind(), "kind", "SIMPLY_LINKED_LIST", 1, 1, OOPLClassRefSimpleCollection.class, !IS_TRANSIENT, !IS_VOLATILE, IS_CHANGEABLE, !IS_UNSETTABLE, !IS_ID, !IS_UNIQUE, !IS_DERIVED, !IS_ORDERED);
        initEReference(getOOPLClassRefSimpleCollection_Implementation(), this.getOOPLClassRefSimpleCollectionImplementation(), null, "implementation", null, 1, 1, OOPLClassRefSimpleCollection.class, !IS_TRANSIENT, !IS_VOLATILE, IS_CHANGEABLE, !IS_COMPOSITE, IS_RESOLVE_PROXIES, !IS_UNSETTABLE, IS_UNIQUE, !IS_DERIVED, IS_ORDERED);

        initEClass(ooplClassRefAssocCollectionEClass, OOPLClassRefAssocCollection.class, "OOPLClassRefAssocCollection", !IS_ABSTRACT, !IS_INTERFACE, IS_GENERATED_INSTANCE_CLASS);
        initEReference(getOOPLClassRefAssocCollection_Key(), theCommonPackage.getAttribute(), null, "key", null, 1, 1, OOPLClassRefAssocCollection.class, !IS_TRANSIENT, !IS_VOLATILE, IS_CHANGEABLE, !IS_COMPOSITE, IS_RESOLVE_PROXIES, !IS_UNSETTABLE, IS_UNIQUE, !IS_DERIVED, IS_ORDERED);
        initEAttribute(getOOPLClassRefAssocCollection_Kind(), this.getAssociativeCollectionKind(), "kind", "UNORDERED_SET", 1, 1, OOPLClassRefAssocCollection.class, !IS_TRANSIENT, !IS_VOLATILE, IS_CHANGEABLE, !IS_UNSETTABLE, !IS_ID, !IS_UNIQUE, !IS_DERIVED, !IS_ORDERED);
        initEReference(getOOPLClassRefAssocCollection_Implementation(), this.getOOPLClassRefAssocCollectionImplementation(), null, "implementation", null, 1, 1, OOPLClassRefAssocCollection.class, !IS_TRANSIENT, !IS_VOLATILE, IS_CHANGEABLE, !IS_COMPOSITE, IS_RESOLVE_PROXIES, !IS_UNSETTABLE, IS_UNIQUE, !IS_DERIVED, IS_ORDERED);

        initEClass(ooplClassReferenceStorageEClass, OOPLClassReferenceStorage.class, "OOPLClassReferenceStorage", IS_ABSTRACT, !IS_INTERFACE, IS_GENERATED_INSTANCE_CLASS);
        initEReference(getOOPLClassReferenceStorage_Type(), this.getOOPLType(), null, "type", null, 1, 1, OOPLClassReferenceStorage.class, !IS_TRANSIENT, !IS_VOLATILE, IS_CHANGEABLE, !IS_COMPOSITE, IS_RESOLVE_PROXIES, !IS_UNSETTABLE, IS_UNIQUE, !IS_DERIVED, IS_ORDERED);
        initEAttribute(getOOPLClassReferenceStorage_Required(), ecorePackage.getEBoolean(), "required", null, 0, 1, OOPLClassReferenceStorage.class, !IS_TRANSIENT, !IS_VOLATILE, IS_CHANGEABLE, !IS_UNSETTABLE, !IS_ID, IS_UNIQUE, !IS_DERIVED, IS_ORDERED);

        initEClass(ooplRelationEClass, OOPLRelation.class, "OOPLRelation", IS_ABSTRACT, !IS_INTERFACE, IS_GENERATED_INSTANCE_CLASS);
        initEReference(getOOPLRelation_XtRelation(), theXtumlPackage.getXTRelation(), null, "xtRelation", null, 1, 1, OOPLRelation.class, !IS_TRANSIENT, !IS_VOLATILE, IS_CHANGEABLE, !IS_COMPOSITE, IS_RESOLVE_PROXIES, !IS_UNSETTABLE, IS_UNIQUE, !IS_DERIVED, IS_ORDERED);
        initEReference(getOOPLRelation_ReferenceStorage(), this.getOOPLClassReferenceStorage(), null, "referenceStorage", null, 0, -1, OOPLRelation.class, !IS_TRANSIENT, !IS_VOLATILE, IS_CHANGEABLE, !IS_COMPOSITE, IS_RESOLVE_PROXIES, !IS_UNSETTABLE, IS_UNIQUE, !IS_DERIVED, IS_ORDERED);

        initEClass(ooplNameProviderEClass, OOPLNameProvider.class, "OOPLNameProvider", IS_ABSTRACT, !IS_INTERFACE, IS_GENERATED_INSTANCE_CLASS);

        initEClass(ooplDerivedNameProviderEClass, OOPLDerivedNameProvider.class, "OOPLDerivedNameProvider", !IS_ABSTRACT, !IS_INTERFACE, IS_GENERATED_INSTANCE_CLASS);
        initEAttribute(getOOPLDerivedNameProvider_Name(), ecorePackage.getEString(), "name", null, 1, 1, OOPLDerivedNameProvider.class, !IS_TRANSIENT, !IS_VOLATILE, IS_CHANGEABLE, !IS_UNSETTABLE, !IS_ID, !IS_UNIQUE, !IS_DERIVED, !IS_ORDERED);

        initEClass(ooplExistingNameProviderEClass, OOPLExistingNameProvider.class, "OOPLExistingNameProvider", !IS_ABSTRACT, !IS_INTERFACE, IS_GENERATED_INSTANCE_CLASS);
        initEReference(getOOPLExistingNameProvider_CommonNamedElement(), theCommonPackage.getNamedElement(), null, "commonNamedElement", null, 0, 1, OOPLExistingNameProvider.class, !IS_TRANSIENT, !IS_VOLATILE, IS_CHANGEABLE, !IS_COMPOSITE, IS_RESOLVE_PROXIES, !IS_UNSETTABLE, IS_UNIQUE, !IS_DERIVED, IS_ORDERED);

        initEClass(ooplBasicTypeEClass, OOPLBasicType.class, "OOPLBasicType", IS_ABSTRACT, !IS_INTERFACE, IS_GENERATED_INSTANCE_CLASS);

        initEClass(ooplEnumTypeEClass, OOPLEnumType.class, "OOPLEnumType", IS_ABSTRACT, !IS_INTERFACE, IS_GENERATED_INSTANCE_CLASS);
        initEReference(getOOPLEnumType_Enumerators(), this.getOOPLEnumerator(), null, "enumerators", null, 1, -1, OOPLEnumType.class, !IS_TRANSIENT, !IS_VOLATILE, !IS_CHANGEABLE, !IS_COMPOSITE, IS_RESOLVE_PROXIES, !IS_UNSETTABLE, IS_UNIQUE, IS_DERIVED, IS_ORDERED);
        initEReference(getOOPLEnumType_DefaultValue(), this.getOOPLEnumerator(), null, "defaultValue", null, 1, 1, OOPLEnumType.class, !IS_TRANSIENT, !IS_VOLATILE, !IS_CHANGEABLE, !IS_COMPOSITE, IS_RESOLVE_PROXIES, !IS_UNSETTABLE, IS_UNIQUE, IS_DERIVED, IS_ORDERED);

        initEClass(ooplEnumeratorEClass, OOPLEnumerator.class, "OOPLEnumerator", IS_ABSTRACT, !IS_INTERFACE, IS_GENERATED_INSTANCE_CLASS);
        initEReference(getOOPLEnumerator_CommonEnumerationLiteral(), theCommonPackage.getEnumerationLiteral(), null, "commonEnumerationLiteral", null, 1, 1, OOPLEnumerator.class, !IS_TRANSIENT, !IS_VOLATILE, IS_CHANGEABLE, !IS_COMPOSITE, IS_RESOLVE_PROXIES, !IS_UNSETTABLE, IS_UNIQUE, !IS_DERIVED, IS_ORDERED);

        initEClass(ooplStructTypeEClass, OOPLStructType.class, "OOPLStructType", IS_ABSTRACT, !IS_INTERFACE, IS_GENERATED_INSTANCE_CLASS);
        initEReference(getOOPLStructType_Members(), this.getOOPLStructMember(), null, "members", null, 1, -1, OOPLStructType.class, !IS_TRANSIENT, !IS_VOLATILE, !IS_CHANGEABLE, !IS_COMPOSITE, IS_RESOLVE_PROXIES, !IS_UNSETTABLE, IS_UNIQUE, IS_DERIVED, IS_ORDERED);

        initEClass(ooplStructMemberEClass, OOPLStructMember.class, "OOPLStructMember", IS_ABSTRACT, !IS_INTERFACE, IS_GENERATED_INSTANCE_CLASS);
        initEReference(getOOPLStructMember_CommonMember(), theCommonPackage.getAttribute(), null, "commonMember", null, 1, 1, OOPLStructMember.class, !IS_TRANSIENT, !IS_VOLATILE, IS_CHANGEABLE, !IS_COMPOSITE, IS_RESOLVE_PROXIES, !IS_UNSETTABLE, IS_UNIQUE, !IS_DERIVED, IS_ORDERED);
        initEReference(getOOPLStructMember_Type(), this.getOOPLType(), null, "type", null, 1, 1, OOPLStructMember.class, !IS_TRANSIENT, !IS_VOLATILE, !IS_CHANGEABLE, !IS_COMPOSITE, IS_RESOLVE_PROXIES, !IS_UNSETTABLE, IS_UNIQUE, IS_DERIVED, IS_ORDERED);

        initEClass(ooplSequenceEClass, OOPLSequence.class, "OOPLSequence", !IS_ABSTRACT, !IS_INTERFACE, IS_GENERATED_INSTANCE_CLASS);
        initEReference(getOOPLSequence_ElementType(), this.getOOPLType(), null, "elementType", null, 1, 1, OOPLSequence.class, !IS_TRANSIENT, !IS_VOLATILE, IS_CHANGEABLE, !IS_COMPOSITE, IS_RESOLVE_PROXIES, !IS_UNSETTABLE, IS_UNIQUE, !IS_DERIVED, IS_ORDERED);
        initEAttribute(getOOPLSequence_Orderedness(), this.getSequenceOrderednessKind(), "orderedness", null, 1, 1, OOPLSequence.class, !IS_TRANSIENT, !IS_VOLATILE, IS_CHANGEABLE, !IS_UNSETTABLE, !IS_ID, !IS_UNIQUE, !IS_DERIVED, !IS_ORDERED);
        initEAttribute(getOOPLSequence_Uniqueness(), this.getSequenceUniquenessKind(), "uniqueness", null, 1, 1, OOPLSequence.class, !IS_TRANSIENT, !IS_VOLATILE, IS_CHANGEABLE, !IS_UNSETTABLE, !IS_ID, !IS_UNIQUE, !IS_DERIVED, !IS_ORDERED);
        initEReference(getOOPLSequence_Implementation(), this.getOOPLSequenceImplementation(), null, "implementation", null, 1, 1, OOPLSequence.class, !IS_TRANSIENT, !IS_VOLATILE, IS_CHANGEABLE, !IS_COMPOSITE, IS_RESOLVE_PROXIES, !IS_UNSETTABLE, IS_UNIQUE, !IS_DERIVED, IS_ORDERED);

        initEClass(ooplUserDefinedTypeEClass, OOPLUserDefinedType.class, "OOPLUserDefinedType", IS_ABSTRACT, !IS_INTERFACE, IS_GENERATED_INSTANCE_CLASS);
        initEReference(getOOPLUserDefinedType_BaseType(), this.getOOPLType(), null, "baseType", null, 1, 1, OOPLUserDefinedType.class, !IS_TRANSIENT, !IS_VOLATILE, IS_CHANGEABLE, !IS_COMPOSITE, IS_RESOLVE_PROXIES, !IS_UNSETTABLE, IS_UNIQUE, !IS_DERIVED, IS_ORDERED);

        initEClass(baseContainerImplementationEClass, BaseContainerImplementation.class, "BaseContainerImplementation", IS_ABSTRACT, !IS_INTERFACE, IS_GENERATED_INSTANCE_CLASS);
        initEAttribute(getBaseContainerImplementation_AnyTemplate(), ecorePackage.getEString(), "anyTemplate", null, 0, 1, BaseContainerImplementation.class, !IS_TRANSIENT, !IS_VOLATILE, IS_CHANGEABLE, !IS_UNSETTABLE, !IS_ID, IS_UNIQUE, !IS_DERIVED, IS_ORDERED);
        initEAttribute(getBaseContainerImplementation_AddTemplate(), ecorePackage.getEString(), "addTemplate", null, 0, 1, BaseContainerImplementation.class, !IS_TRANSIENT, !IS_VOLATILE, IS_CHANGEABLE, !IS_UNSETTABLE, !IS_ID, IS_UNIQUE, !IS_DERIVED, IS_ORDERED);
        initEAttribute(getBaseContainerImplementation_AddAllTemplate(), ecorePackage.getEString(), "addAllTemplate", null, 0, 1, BaseContainerImplementation.class, !IS_TRANSIENT, !IS_VOLATILE, IS_CHANGEABLE, !IS_UNSETTABLE, !IS_ID, IS_UNIQUE, !IS_DERIVED, IS_ORDERED);
        initEAttribute(getBaseContainerImplementation_ClearTemplate(), ecorePackage.getEString(), "clearTemplate", null, 0, 1, BaseContainerImplementation.class, !IS_TRANSIENT, !IS_VOLATILE, IS_CHANGEABLE, !IS_UNSETTABLE, !IS_ID, IS_UNIQUE, !IS_DERIVED, IS_ORDERED);
        initEAttribute(getBaseContainerImplementation_CloneTemplate(), ecorePackage.getEString(), "cloneTemplate", null, 0, 1, BaseContainerImplementation.class, !IS_TRANSIENT, !IS_VOLATILE, IS_CHANGEABLE, !IS_UNSETTABLE, !IS_ID, IS_UNIQUE, !IS_DERIVED, IS_ORDERED);
        initEAttribute(getBaseContainerImplementation_ContainsTemplate(), ecorePackage.getEString(), "containsTemplate", null, 0, 1, BaseContainerImplementation.class, !IS_TRANSIENT, !IS_VOLATILE, IS_CHANGEABLE, !IS_UNSETTABLE, !IS_ID, IS_UNIQUE, !IS_DERIVED, IS_ORDERED);
        initEAttribute(getBaseContainerImplementation_ContainsAllTemplate(), ecorePackage.getEString(), "containsAllTemplate", null, 0, 1, BaseContainerImplementation.class, !IS_TRANSIENT, !IS_VOLATILE, IS_CHANGEABLE, !IS_UNSETTABLE, !IS_ID, IS_UNIQUE, !IS_DERIVED, IS_ORDERED);
        initEAttribute(getBaseContainerImplementation_CountOfTemplate(), ecorePackage.getEString(), "countOfTemplate", null, 0, 1, BaseContainerImplementation.class, !IS_TRANSIENT, !IS_VOLATILE, IS_CHANGEABLE, !IS_UNSETTABLE, !IS_ID, IS_UNIQUE, !IS_DERIVED, IS_ORDERED);
        initEAttribute(getBaseContainerImplementation_ElementAtIndexTemplate(), ecorePackage.getEString(), "elementAtIndexTemplate", null, 0, 1, BaseContainerImplementation.class, !IS_TRANSIENT, !IS_VOLATILE, IS_CHANGEABLE, !IS_UNSETTABLE, !IS_ID, IS_UNIQUE, !IS_DERIVED, IS_ORDERED);
        initEAttribute(getBaseContainerImplementation_InsertElementAtIndexTemplate(), ecorePackage.getEString(), "insertElementAtIndexTemplate", null, 0, 1, BaseContainerImplementation.class, !IS_TRANSIENT, !IS_VOLATILE, IS_CHANGEABLE, !IS_UNSETTABLE, !IS_ID, IS_UNIQUE, !IS_DERIVED, IS_ORDERED);
        initEAttribute(getBaseContainerImplementation_IsEmptyTemplate(), ecorePackage.getEString(), "isEmptyTemplate", null, 0, 1, BaseContainerImplementation.class, !IS_TRANSIENT, !IS_VOLATILE, IS_CHANGEABLE, !IS_UNSETTABLE, !IS_ID, IS_UNIQUE, !IS_DERIVED, IS_ORDERED);
        initEAttribute(getBaseContainerImplementation_RemoveTemplate(), ecorePackage.getEString(), "removeTemplate", null, 0, 1, BaseContainerImplementation.class, !IS_TRANSIENT, !IS_VOLATILE, IS_CHANGEABLE, !IS_UNSETTABLE, !IS_ID, IS_UNIQUE, !IS_DERIVED, IS_ORDERED);
        initEAttribute(getBaseContainerImplementation_RemoveAllTemplate(), ecorePackage.getEString(), "removeAllTemplate", null, 0, 1, BaseContainerImplementation.class, !IS_TRANSIENT, !IS_VOLATILE, IS_CHANGEABLE, !IS_UNSETTABLE, !IS_ID, IS_UNIQUE, !IS_DERIVED, IS_ORDERED);
        initEAttribute(getBaseContainerImplementation_ReplaceElementAtIndexTemplate(), ecorePackage.getEString(), "replaceElementAtIndexTemplate", null, 0, 1, BaseContainerImplementation.class, !IS_TRANSIENT, !IS_VOLATILE, IS_CHANGEABLE, !IS_UNSETTABLE, !IS_ID, IS_UNIQUE, !IS_DERIVED, IS_ORDERED);
        initEAttribute(getBaseContainerImplementation_RetainAllTemplate(), ecorePackage.getEString(), "retainAllTemplate", null, 0, 1, BaseContainerImplementation.class, !IS_TRANSIENT, !IS_VOLATILE, IS_CHANGEABLE, !IS_UNSETTABLE, !IS_ID, IS_UNIQUE, !IS_DERIVED, IS_ORDERED);
        initEAttribute(getBaseContainerImplementation_SizeTemplate(), ecorePackage.getEString(), "sizeTemplate", null, 0, 1, BaseContainerImplementation.class, !IS_TRANSIENT, !IS_VOLATILE, IS_CHANGEABLE, !IS_UNSETTABLE, !IS_ID, IS_UNIQUE, !IS_DERIVED, IS_ORDERED);
        initEAttribute(getBaseContainerImplementation_ContainerQualifiedName(), ecorePackage.getEString(), "containerQualifiedName", null, 0, 1, BaseContainerImplementation.class, !IS_TRANSIENT, !IS_VOLATILE, IS_CHANGEABLE, !IS_UNSETTABLE, !IS_ID, IS_UNIQUE, !IS_DERIVED, IS_ORDERED);
        initEAttribute(getBaseContainerImplementation_ContainerHeaderIncludes(), ecorePackage.getEString(), "containerHeaderIncludes", null, 1, -1, BaseContainerImplementation.class, !IS_TRANSIENT, !IS_VOLATILE, IS_CHANGEABLE, !IS_UNSETTABLE, !IS_ID, IS_UNIQUE, !IS_DERIVED, IS_ORDERED);

        EOperation op = initEOperation(getBaseContainerImplementation__GenerateAdd__String_String_String(), ecorePackage.getEString(), "generateAdd", 0, 1, IS_UNIQUE, IS_ORDERED);
        addEParameter(op, ecorePackage.getEString(), "collection", 0, 1, IS_UNIQUE, IS_ORDERED);
        addEParameter(op, ecorePackage.getEString(), "value", 0, 1, IS_UNIQUE, IS_ORDERED);
        addEParameter(op, ecorePackage.getEString(), "result", 0, 1, IS_UNIQUE, IS_ORDERED);

        op = initEOperation(getBaseContainerImplementation__GenerateAddAll__String_String(), ecorePackage.getEString(), "generateAddAll", 0, 1, IS_UNIQUE, IS_ORDERED);
        addEParameter(op, ecorePackage.getEString(), "collection", 0, 1, IS_UNIQUE, IS_ORDERED);
        addEParameter(op, ecorePackage.getEString(), "values", 0, 1, IS_UNIQUE, IS_ORDERED);

        op = initEOperation(getBaseContainerImplementation__GenerateClear__String(), ecorePackage.getEString(), "generateClear", 0, 1, IS_UNIQUE, IS_ORDERED);
        addEParameter(op, ecorePackage.getEString(), "collection", 0, 1, IS_UNIQUE, IS_ORDERED);

        op = initEOperation(getBaseContainerImplementation__GenerateClone__String_String_String(), ecorePackage.getEString(), "generateClone", 0, 1, IS_UNIQUE, IS_ORDERED);
        addEParameter(op, ecorePackage.getEString(), "collection", 0, 1, IS_UNIQUE, IS_ORDERED);
        addEParameter(op, ecorePackage.getEString(), "valueType", 0, 1, IS_UNIQUE, IS_ORDERED);
        addEParameter(op, ecorePackage.getEString(), "result", 0, 1, IS_UNIQUE, IS_ORDERED);

        op = initEOperation(getBaseContainerImplementation__GenerateContains__String_String_String(), ecorePackage.getEString(), "generateContains", 0, 1, IS_UNIQUE, IS_ORDERED);
        addEParameter(op, ecorePackage.getEString(), "collection", 0, 1, IS_UNIQUE, IS_ORDERED);
        addEParameter(op, ecorePackage.getEString(), "value", 0, 1, IS_UNIQUE, IS_ORDERED);
        addEParameter(op, ecorePackage.getEString(), "result", 0, 1, IS_UNIQUE, IS_ORDERED);

        op = initEOperation(getBaseContainerImplementation__GenerateContainsAll__String_String_String_String_String(), ecorePackage.getEString(), "generateContainsAll", 0, 1, IS_UNIQUE, IS_ORDERED);
        addEParameter(op, ecorePackage.getEString(), "collection", 0, 1, IS_UNIQUE, IS_ORDERED);
        addEParameter(op, ecorePackage.getEString(), "values", 0, 1, IS_UNIQUE, IS_ORDERED);
        addEParameter(op, ecorePackage.getEString(), "valuesType", 0, 1, IS_UNIQUE, IS_ORDERED);
        addEParameter(op, ecorePackage.getEString(), "valueType", 0, 1, IS_UNIQUE, IS_ORDERED);
        addEParameter(op, ecorePackage.getEString(), "result", 0, 1, IS_UNIQUE, IS_ORDERED);

        op = initEOperation(getBaseContainerImplementation__GenerateIsEmpty__String_String(), ecorePackage.getEString(), "generateIsEmpty", 0, 1, IS_UNIQUE, IS_ORDERED);
        addEParameter(op, ecorePackage.getEString(), "collection", 0, 1, IS_UNIQUE, IS_ORDERED);
        addEParameter(op, ecorePackage.getEString(), "result", 0, 1, IS_UNIQUE, IS_ORDERED);

        op = initEOperation(getBaseContainerImplementation__GenerateRemove__String_String(), ecorePackage.getEString(), "generateRemove", 0, 1, IS_UNIQUE, IS_ORDERED);
        addEParameter(op, ecorePackage.getEString(), "collection", 0, 1, IS_UNIQUE, IS_ORDERED);
        addEParameter(op, ecorePackage.getEString(), "value", 0, 1, IS_UNIQUE, IS_ORDERED);

        op = initEOperation(getBaseContainerImplementation__GenerateRemoveAll__String_String_String_String(), ecorePackage.getEString(), "generateRemoveAll", 0, 1, IS_UNIQUE, IS_ORDERED);
        addEParameter(op, ecorePackage.getEString(), "collection", 0, 1, IS_UNIQUE, IS_ORDERED);
        addEParameter(op, ecorePackage.getEString(), "values", 0, 1, IS_UNIQUE, IS_ORDERED);
        addEParameter(op, ecorePackage.getEString(), "valuesType", 0, 1, IS_UNIQUE, IS_ORDERED);
        addEParameter(op, ecorePackage.getEString(), "valueType", 0, 1, IS_UNIQUE, IS_ORDERED);

        op = initEOperation(getBaseContainerImplementation__GenerateRetainAll__String_String_String(), ecorePackage.getEString(), "generateRetainAll", 0, 1, IS_UNIQUE, IS_ORDERED);
        addEParameter(op, ecorePackage.getEString(), "collection", 0, 1, IS_UNIQUE, IS_ORDERED);
        addEParameter(op, ecorePackage.getEString(), "values", 0, 1, IS_UNIQUE, IS_ORDERED);
        addEParameter(op, ecorePackage.getEString(), "valueType", 0, 1, IS_UNIQUE, IS_ORDERED);

        op = initEOperation(getBaseContainerImplementation__GenerateSize__String_String(), ecorePackage.getEString(), "generateSize", 0, 1, IS_UNIQUE, IS_ORDERED);
        addEParameter(op, ecorePackage.getEString(), "collection", 0, 1, IS_UNIQUE, IS_ORDERED);
        addEParameter(op, ecorePackage.getEString(), "result", 0, 1, IS_UNIQUE, IS_ORDERED);

        initEClass(ooplClassRefAssocCollectionImplementationEClass, OOPLClassRefAssocCollectionImplementation.class, "OOPLClassRefAssocCollectionImplementation", !IS_ABSTRACT, !IS_INTERFACE, IS_GENERATED_INSTANCE_CLASS);
        initEAttribute(getOOPLClassRefAssocCollectionImplementation_Kind(), this.getAssociativeCollectionKind(), "kind", "UNORDERED_SET", 1, 1, OOPLClassRefAssocCollectionImplementation.class, !IS_TRANSIENT, !IS_VOLATILE, IS_CHANGEABLE, !IS_UNSETTABLE, !IS_ID, IS_UNIQUE, !IS_DERIVED, IS_ORDERED);

        op = initEOperation(getOOPLClassRefAssocCollectionImplementation__GenerateCountOf__String_String_String(), ecorePackage.getEString(), "generateCountOf", 0, 1, IS_UNIQUE, IS_ORDERED);
        addEParameter(op, ecorePackage.getEString(), "collection", 0, 1, IS_UNIQUE, IS_ORDERED);
        addEParameter(op, ecorePackage.getEString(), "value", 0, 1, IS_UNIQUE, IS_ORDERED);
        addEParameter(op, ecorePackage.getEString(), "result", 0, 1, IS_UNIQUE, IS_ORDERED);

        op = initEOperation(getOOPLClassRefAssocCollectionImplementation__GenerateAny__String_String_String(), ecorePackage.getEString(), "generateAny", 0, 1, IS_UNIQUE, IS_ORDERED);
        addEParameter(op, ecorePackage.getEString(), "collection", 0, 1, IS_UNIQUE, IS_ORDERED);
        addEParameter(op, ecorePackage.getEString(), "valueType", 0, 1, IS_UNIQUE, IS_ORDERED);
        addEParameter(op, ecorePackage.getEString(), "result", 0, 1, IS_UNIQUE, IS_ORDERED);

        initEClass(ooplClassRefSimpleCollectionImplementationEClass, OOPLClassRefSimpleCollectionImplementation.class, "OOPLClassRefSimpleCollectionImplementation", !IS_ABSTRACT, !IS_INTERFACE, IS_GENERATED_INSTANCE_CLASS);
        initEAttribute(getOOPLClassRefSimpleCollectionImplementation_Kind(), this.getSimpleCollectionKind(), "kind", "SIMPLY_LINKED_LIST", 1, 1, OOPLClassRefSimpleCollectionImplementation.class, !IS_TRANSIENT, !IS_VOLATILE, IS_CHANGEABLE, !IS_UNSETTABLE, !IS_ID, IS_UNIQUE, !IS_DERIVED, IS_ORDERED);

        op = initEOperation(getOOPLClassRefSimpleCollectionImplementation__GenerateElementAtIndex__String_String_String_String(), ecorePackage.getEString(), "generateElementAtIndex", 0, 1, IS_UNIQUE, IS_ORDERED);
        addEParameter(op, ecorePackage.getEString(), "collection", 0, 1, IS_UNIQUE, IS_ORDERED);
        addEParameter(op, ecorePackage.getEString(), "valueType", 0, 1, IS_UNIQUE, IS_ORDERED);
        addEParameter(op, ecorePackage.getEString(), "index", 0, 1, IS_UNIQUE, IS_ORDERED);
        addEParameter(op, ecorePackage.getEString(), "result", 0, 1, IS_UNIQUE, IS_ORDERED);

        op = initEOperation(getOOPLClassRefSimpleCollectionImplementation__GenerateInsertElementAtIndex__String_String_String_String(), ecorePackage.getEString(), "generateInsertElementAtIndex", 0, 1, IS_UNIQUE, IS_ORDERED);
        addEParameter(op, ecorePackage.getEString(), "collection", 0, 1, IS_UNIQUE, IS_ORDERED);
        addEParameter(op, ecorePackage.getEString(), "value", 0, 1, IS_UNIQUE, IS_ORDERED);
        addEParameter(op, ecorePackage.getEString(), "valueType", 0, 1, IS_UNIQUE, IS_ORDERED);
        addEParameter(op, ecorePackage.getEString(), "index", 0, 1, IS_UNIQUE, IS_ORDERED);

        op = initEOperation(getOOPLClassRefSimpleCollectionImplementation__GenerateReplaceElementAtIndex__String_String_String_String(), ecorePackage.getEString(), "generateReplaceElementAtIndex", 0, 1, IS_UNIQUE, IS_ORDERED);
        addEParameter(op, ecorePackage.getEString(), "collection", 0, 1, IS_UNIQUE, IS_ORDERED);
        addEParameter(op, ecorePackage.getEString(), "value", 0, 1, IS_UNIQUE, IS_ORDERED);
        addEParameter(op, ecorePackage.getEString(), "valueType", 0, 1, IS_UNIQUE, IS_ORDERED);
        addEParameter(op, ecorePackage.getEString(), "index", 0, 1, IS_UNIQUE, IS_ORDERED);

        initEClass(ooplSequenceImplementationEClass, OOPLSequenceImplementation.class, "OOPLSequenceImplementation", !IS_ABSTRACT, !IS_INTERFACE, IS_GENERATED_INSTANCE_CLASS);
        initEAttribute(getOOPLSequenceImplementation_Uniqueness(), this.getSequenceUniquenessKind(), "uniqueness", "NON_UNIQUE", 1, 1, OOPLSequenceImplementation.class, !IS_TRANSIENT, !IS_VOLATILE, IS_CHANGEABLE, !IS_UNSETTABLE, !IS_ID, IS_UNIQUE, !IS_DERIVED, IS_ORDERED);
        initEAttribute(getOOPLSequenceImplementation_Orderedness(), this.getSequenceOrderednessKind(), "orderedness", "UNORDERED", 1, 1, OOPLSequenceImplementation.class, !IS_TRANSIENT, !IS_VOLATILE, IS_CHANGEABLE, !IS_UNSETTABLE, !IS_ID, IS_UNIQUE, !IS_DERIVED, IS_ORDERED);

        op = initEOperation(getOOPLSequenceImplementation__GenerateAny__String_String_String(), ecorePackage.getEString(), "generateAny", 0, 1, IS_UNIQUE, IS_ORDERED);
        addEParameter(op, ecorePackage.getEString(), "collection", 0, 1, IS_UNIQUE, IS_ORDERED);
        addEParameter(op, ecorePackage.getEString(), "valueType", 0, 1, IS_UNIQUE, IS_ORDERED);
        addEParameter(op, ecorePackage.getEString(), "result", 0, 1, IS_UNIQUE, IS_ORDERED);

        op = initEOperation(getOOPLSequenceImplementation__GenerateCountOf__String_String_String(), ecorePackage.getEString(), "generateCountOf", 0, 1, IS_UNIQUE, IS_ORDERED);
        addEParameter(op, ecorePackage.getEString(), "collection", 0, 1, IS_UNIQUE, IS_ORDERED);
        addEParameter(op, ecorePackage.getEString(), "value", 0, 1, IS_UNIQUE, IS_ORDERED);
        addEParameter(op, ecorePackage.getEString(), "result", 0, 1, IS_UNIQUE, IS_ORDERED);

        op = initEOperation(getOOPLSequenceImplementation__GenerateElementAtIndex__String_String_String_String(), ecorePackage.getEString(), "generateElementAtIndex", 0, 1, IS_UNIQUE, IS_ORDERED);
        addEParameter(op, ecorePackage.getEString(), "collection", 0, 1, IS_UNIQUE, IS_ORDERED);
        addEParameter(op, ecorePackage.getEString(), "valueType", 0, 1, IS_UNIQUE, IS_ORDERED);
        addEParameter(op, ecorePackage.getEString(), "index", 0, 1, IS_UNIQUE, IS_ORDERED);
        addEParameter(op, ecorePackage.getEString(), "result", 0, 1, IS_UNIQUE, IS_ORDERED);

        op = initEOperation(getOOPLSequenceImplementation__GenerateInsertElementAtIndex__String_String_String_String(), ecorePackage.getEString(), "generateInsertElementAtIndex", 0, 1, IS_UNIQUE, IS_ORDERED);
        addEParameter(op, ecorePackage.getEString(), "collection", 0, 1, IS_UNIQUE, IS_ORDERED);
        addEParameter(op, ecorePackage.getEString(), "value", 0, 1, IS_UNIQUE, IS_ORDERED);
        addEParameter(op, ecorePackage.getEString(), "valueType", 0, 1, IS_UNIQUE, IS_ORDERED);
        addEParameter(op, ecorePackage.getEString(), "index", 0, 1, IS_UNIQUE, IS_ORDERED);

        op = initEOperation(getOOPLSequenceImplementation__GenerateReplaceElementAtIndex__String_String_String_String(), ecorePackage.getEString(), "generateReplaceElementAtIndex", 0, 1, IS_UNIQUE, IS_ORDERED);
        addEParameter(op, ecorePackage.getEString(), "collection", 0, 1, IS_UNIQUE, IS_ORDERED);
        addEParameter(op, ecorePackage.getEString(), "value", 0, 1, IS_UNIQUE, IS_ORDERED);
        addEParameter(op, ecorePackage.getEString(), "valueType", 0, 1, IS_UNIQUE, IS_ORDERED);
        addEParameter(op, ecorePackage.getEString(), "index", 0, 1, IS_UNIQUE, IS_ORDERED);

        // Initialize enums and add enum literals
        initEEnum(simpleCollectionKindEEnum, SimpleCollectionKind.class, "SimpleCollectionKind");
        addEEnumLiteral(simpleCollectionKindEEnum, SimpleCollectionKind.INDEXED_ARRAY);
        addEEnumLiteral(simpleCollectionKindEEnum, SimpleCollectionKind.SIMPLY_LINKED_LIST);
        addEEnumLiteral(simpleCollectionKindEEnum, SimpleCollectionKind.DOUBLY_LINKED_LIST);
        addEEnumLiteral(simpleCollectionKindEEnum, SimpleCollectionKind.DOUBLE_ENDED_QUEUE);

        initEEnum(associativeCollectionKindEEnum, AssociativeCollectionKind.class, "AssociativeCollectionKind");
        addEEnumLiteral(associativeCollectionKindEEnum, AssociativeCollectionKind.UNORDERED_SET);
        addEEnumLiteral(associativeCollectionKindEEnum, AssociativeCollectionKind.ORDERED_SET);
        addEEnumLiteral(associativeCollectionKindEEnum, AssociativeCollectionKind.UNORDERED_MULTISET);
        addEEnumLiteral(associativeCollectionKindEEnum, AssociativeCollectionKind.ORDERED_MULTISET);
        addEEnumLiteral(associativeCollectionKindEEnum, AssociativeCollectionKind.UNORDERED_MAP);
        addEEnumLiteral(associativeCollectionKindEEnum, AssociativeCollectionKind.ORDERED_MAP);
        addEEnumLiteral(associativeCollectionKindEEnum, AssociativeCollectionKind.UNORDERED_MULTIMAP);
        addEEnumLiteral(associativeCollectionKindEEnum, AssociativeCollectionKind.ORDERED_MULTIMAP);

        initEEnum(sequenceOrderednessKindEEnum, SequenceOrderednessKind.class, "SequenceOrderednessKind");
        addEEnumLiteral(sequenceOrderednessKindEEnum, SequenceOrderednessKind.UNORDERED);
        addEEnumLiteral(sequenceOrderednessKindEEnum, SequenceOrderednessKind.ORDERED);
        addEEnumLiteral(sequenceOrderednessKindEEnum, SequenceOrderednessKind.SORTED);

        initEEnum(sequenceUniquenessKindEEnum, SequenceUniquenessKind.class, "SequenceUniquenessKind");
        addEEnumLiteral(sequenceUniquenessKindEEnum, SequenceUniquenessKind.NON_UNIQUE);
        addEEnumLiteral(sequenceUniquenessKindEEnum, SequenceUniquenessKind.UNIQUE);

        // Create resource
        createResource(eNS_URI);
    }

} //OoplPackageImpl
