/**
 */
package com.ericsson.xtumlrt.oopl;

import org.eclipse.emf.ecore.EAttribute;
import org.eclipse.emf.ecore.EClass;
import org.eclipse.emf.ecore.EEnum;
import org.eclipse.emf.ecore.EOperation;
import org.eclipse.emf.ecore.EPackage;
import org.eclipse.emf.ecore.EReference;

/**
 * <!-- begin-user-doc -->
 * The <b>Package</b> for the model.
 * It contains accessors for the meta objects to represent
 * <ul>
 *   <li>each class,</li>
 *   <li>each feature of each class,</li>
 *   <li>each operation of each class,</li>
 *   <li>each enum,</li>
 *   <li>and each data type</li>
 * </ul>
 * <!-- end-user-doc -->
 * @see com.ericsson.xtumlrt.oopl.OoplFactory
 * @model kind="package"
 * @generated
 */
public interface OoplPackage extends EPackage {
    /**
     * The package name.
     * <!-- begin-user-doc -->
     * <!-- end-user-doc -->
     * @generated
     */
    String eNAME = "oopl";

    /**
     * The package namespace URI.
     * <!-- begin-user-doc -->
     * <!-- end-user-doc -->
     * @generated
     */
    String eNS_URI = "http://www.ericsson.com/xtumlrt/oopl";

    /**
     * The package namespace name.
     * <!-- begin-user-doc -->
     * <!-- end-user-doc -->
     * @generated
     */
    String eNS_PREFIX = "oopl";

    /**
     * The singleton instance of the package.
     * <!-- begin-user-doc -->
     * <!-- end-user-doc -->
     * @generated
     */
    OoplPackage eINSTANCE = com.ericsson.xtumlrt.oopl.impl.OoplPackageImpl.init();

    /**
     * The meta object id for the '{@link com.ericsson.xtumlrt.oopl.impl.OOPLClassImpl <em>OOPL Class</em>}' class.
     * <!-- begin-user-doc -->
     * <!-- end-user-doc -->
     * @see com.ericsson.xtumlrt.oopl.impl.OOPLClassImpl
     * @see com.ericsson.xtumlrt.oopl.impl.OoplPackageImpl#getOOPLClass()
     * @generated
     */
    int OOPL_CLASS = 0;

    /**
     * The feature id for the '<em><b>Xt Class</b></em>' reference.
     * <!-- begin-user-doc -->
     * <!-- end-user-doc -->
     * @generated
     * @ordered
     */
    int OOPL_CLASS__XT_CLASS = 0;

    /**
     * The feature id for the '<em><b>Reference Storage</b></em>' reference list.
     * <!-- begin-user-doc -->
     * <!-- end-user-doc -->
     * @generated
     * @ordered
     */
    int OOPL_CLASS__REFERENCE_STORAGE = 1;

    /**
     * The number of structural features of the '<em>OOPL Class</em>' class.
     * <!-- begin-user-doc -->
     * <!-- end-user-doc -->
     * @generated
     * @ordered
     */
    int OOPL_CLASS_FEATURE_COUNT = 2;

    /**
     * The number of operations of the '<em>OOPL Class</em>' class.
     * <!-- begin-user-doc -->
     * <!-- end-user-doc -->
     * @generated
     * @ordered
     */
    int OOPL_CLASS_OPERATION_COUNT = 0;

    /**
     * The meta object id for the '{@link com.ericsson.xtumlrt.oopl.impl.OOPLTypeImpl <em>OOPL Type</em>}' class.
     * <!-- begin-user-doc -->
     * <!-- end-user-doc -->
     * @see com.ericsson.xtumlrt.oopl.impl.OOPLTypeImpl
     * @see com.ericsson.xtumlrt.oopl.impl.OoplPackageImpl#getOOPLType()
     * @generated
     */
    int OOPL_TYPE = 1;

    /**
     * The feature id for the '<em><b>Common Type</b></em>' reference.
     * <!-- begin-user-doc -->
     * <!-- end-user-doc -->
     * @generated
     * @ordered
     */
    int OOPL_TYPE__COMMON_TYPE = 0;

    /**
     * The number of structural features of the '<em>OOPL Type</em>' class.
     * <!-- begin-user-doc -->
     * <!-- end-user-doc -->
     * @generated
     * @ordered
     */
    int OOPL_TYPE_FEATURE_COUNT = 1;

    /**
     * The number of operations of the '<em>OOPL Type</em>' class.
     * <!-- begin-user-doc -->
     * <!-- end-user-doc -->
     * @generated
     * @ordered
     */
    int OOPL_TYPE_OPERATION_COUNT = 0;

    /**
     * The meta object id for the '{@link com.ericsson.xtumlrt.oopl.impl.OOPLClassReferenceImpl <em>OOPL Class Reference</em>}' class.
     * <!-- begin-user-doc -->
     * <!-- end-user-doc -->
     * @see com.ericsson.xtumlrt.oopl.impl.OOPLClassReferenceImpl
     * @see com.ericsson.xtumlrt.oopl.impl.OoplPackageImpl#getOOPLClassReference()
     * @generated
     */
    int OOPL_CLASS_REFERENCE = 2;

    /**
     * The feature id for the '<em><b>Common Type</b></em>' reference.
     * <!-- begin-user-doc -->
     * <!-- end-user-doc -->
     * @generated
     * @ordered
     */
    int OOPL_CLASS_REFERENCE__COMMON_TYPE = OOPL_TYPE__COMMON_TYPE;

    /**
     * The feature id for the '<em><b>Oopl Class</b></em>' reference.
     * <!-- begin-user-doc -->
     * <!-- end-user-doc -->
     * @generated
     * @ordered
     */
    int OOPL_CLASS_REFERENCE__OOPL_CLASS = OOPL_TYPE_FEATURE_COUNT + 0;

    /**
     * The number of structural features of the '<em>OOPL Class Reference</em>' class.
     * <!-- begin-user-doc -->
     * <!-- end-user-doc -->
     * @generated
     * @ordered
     */
    int OOPL_CLASS_REFERENCE_FEATURE_COUNT = OOPL_TYPE_FEATURE_COUNT + 1;

    /**
     * The number of operations of the '<em>OOPL Class Reference</em>' class.
     * <!-- begin-user-doc -->
     * <!-- end-user-doc -->
     * @generated
     * @ordered
     */
    int OOPL_CLASS_REFERENCE_OPERATION_COUNT = OOPL_TYPE_OPERATION_COUNT + 0;

    /**
     * The meta object id for the '{@link com.ericsson.xtumlrt.oopl.impl.OOPLClassReferenceCollectionImpl <em>OOPL Class Reference Collection</em>}' class.
     * <!-- begin-user-doc -->
     * <!-- end-user-doc -->
     * @see com.ericsson.xtumlrt.oopl.impl.OOPLClassReferenceCollectionImpl
     * @see com.ericsson.xtumlrt.oopl.impl.OoplPackageImpl#getOOPLClassReferenceCollection()
     * @generated
     */
    int OOPL_CLASS_REFERENCE_COLLECTION = 3;

    /**
     * The feature id for the '<em><b>Common Type</b></em>' reference.
     * <!-- begin-user-doc -->
     * <!-- end-user-doc -->
     * @generated
     * @ordered
     */
    int OOPL_CLASS_REFERENCE_COLLECTION__COMMON_TYPE = OOPL_TYPE__COMMON_TYPE;

    /**
     * The feature id for the '<em><b>Oopl Class</b></em>' reference.
     * <!-- begin-user-doc -->
     * <!-- end-user-doc -->
     * @generated
     * @ordered
     */
    int OOPL_CLASS_REFERENCE_COLLECTION__OOPL_CLASS = OOPL_TYPE_FEATURE_COUNT + 0;

    /**
     * The number of structural features of the '<em>OOPL Class Reference Collection</em>' class.
     * <!-- begin-user-doc -->
     * <!-- end-user-doc -->
     * @generated
     * @ordered
     */
    int OOPL_CLASS_REFERENCE_COLLECTION_FEATURE_COUNT = OOPL_TYPE_FEATURE_COUNT + 1;

    /**
     * The number of operations of the '<em>OOPL Class Reference Collection</em>' class.
     * <!-- begin-user-doc -->
     * <!-- end-user-doc -->
     * @generated
     * @ordered
     */
    int OOPL_CLASS_REFERENCE_COLLECTION_OPERATION_COUNT = OOPL_TYPE_OPERATION_COUNT + 0;

    /**
     * The meta object id for the '{@link com.ericsson.xtumlrt.oopl.impl.OOPLClassRefSimpleCollectionImpl <em>OOPL Class Ref Simple Collection</em>}' class.
     * <!-- begin-user-doc -->
     * <!-- end-user-doc -->
     * @see com.ericsson.xtumlrt.oopl.impl.OOPLClassRefSimpleCollectionImpl
     * @see com.ericsson.xtumlrt.oopl.impl.OoplPackageImpl#getOOPLClassRefSimpleCollection()
     * @generated
     */
    int OOPL_CLASS_REF_SIMPLE_COLLECTION = 4;

    /**
     * The feature id for the '<em><b>Common Type</b></em>' reference.
     * <!-- begin-user-doc -->
     * <!-- end-user-doc -->
     * @generated
     * @ordered
     */
    int OOPL_CLASS_REF_SIMPLE_COLLECTION__COMMON_TYPE = OOPL_CLASS_REFERENCE_COLLECTION__COMMON_TYPE;

    /**
     * The feature id for the '<em><b>Oopl Class</b></em>' reference.
     * <!-- begin-user-doc -->
     * <!-- end-user-doc -->
     * @generated
     * @ordered
     */
    int OOPL_CLASS_REF_SIMPLE_COLLECTION__OOPL_CLASS = OOPL_CLASS_REFERENCE_COLLECTION__OOPL_CLASS;

    /**
     * The feature id for the '<em><b>Kind</b></em>' attribute.
     * <!-- begin-user-doc -->
     * <!-- end-user-doc -->
     * @generated
     * @ordered
     */
    int OOPL_CLASS_REF_SIMPLE_COLLECTION__KIND = OOPL_CLASS_REFERENCE_COLLECTION_FEATURE_COUNT + 0;

    /**
     * The feature id for the '<em><b>Implementation</b></em>' reference.
     * <!-- begin-user-doc -->
     * <!-- end-user-doc -->
     * @generated
     * @ordered
     */
    int OOPL_CLASS_REF_SIMPLE_COLLECTION__IMPLEMENTATION = OOPL_CLASS_REFERENCE_COLLECTION_FEATURE_COUNT + 1;

    /**
     * The number of structural features of the '<em>OOPL Class Ref Simple Collection</em>' class.
     * <!-- begin-user-doc -->
     * <!-- end-user-doc -->
     * @generated
     * @ordered
     */
    int OOPL_CLASS_REF_SIMPLE_COLLECTION_FEATURE_COUNT = OOPL_CLASS_REFERENCE_COLLECTION_FEATURE_COUNT + 2;

    /**
     * The number of operations of the '<em>OOPL Class Ref Simple Collection</em>' class.
     * <!-- begin-user-doc -->
     * <!-- end-user-doc -->
     * @generated
     * @ordered
     */
    int OOPL_CLASS_REF_SIMPLE_COLLECTION_OPERATION_COUNT = OOPL_CLASS_REFERENCE_COLLECTION_OPERATION_COUNT + 0;

    /**
     * The meta object id for the '{@link com.ericsson.xtumlrt.oopl.impl.OOPLClassRefAssocCollectionImpl <em>OOPL Class Ref Assoc Collection</em>}' class.
     * <!-- begin-user-doc -->
     * <!-- end-user-doc -->
     * @see com.ericsson.xtumlrt.oopl.impl.OOPLClassRefAssocCollectionImpl
     * @see com.ericsson.xtumlrt.oopl.impl.OoplPackageImpl#getOOPLClassRefAssocCollection()
     * @generated
     */
    int OOPL_CLASS_REF_ASSOC_COLLECTION = 5;

    /**
     * The feature id for the '<em><b>Common Type</b></em>' reference.
     * <!-- begin-user-doc -->
     * <!-- end-user-doc -->
     * @generated
     * @ordered
     */
    int OOPL_CLASS_REF_ASSOC_COLLECTION__COMMON_TYPE = OOPL_CLASS_REFERENCE_COLLECTION__COMMON_TYPE;

    /**
     * The feature id for the '<em><b>Oopl Class</b></em>' reference.
     * <!-- begin-user-doc -->
     * <!-- end-user-doc -->
     * @generated
     * @ordered
     */
    int OOPL_CLASS_REF_ASSOC_COLLECTION__OOPL_CLASS = OOPL_CLASS_REFERENCE_COLLECTION__OOPL_CLASS;

    /**
     * The feature id for the '<em><b>Key</b></em>' reference.
     * <!-- begin-user-doc -->
     * <!-- end-user-doc -->
     * @generated
     * @ordered
     */
    int OOPL_CLASS_REF_ASSOC_COLLECTION__KEY = OOPL_CLASS_REFERENCE_COLLECTION_FEATURE_COUNT + 0;

    /**
     * The feature id for the '<em><b>Kind</b></em>' attribute.
     * <!-- begin-user-doc -->
     * <!-- end-user-doc -->
     * @generated
     * @ordered
     */
    int OOPL_CLASS_REF_ASSOC_COLLECTION__KIND = OOPL_CLASS_REFERENCE_COLLECTION_FEATURE_COUNT + 1;

    /**
     * The feature id for the '<em><b>Implementation</b></em>' reference.
     * <!-- begin-user-doc -->
     * <!-- end-user-doc -->
     * @generated
     * @ordered
     */
    int OOPL_CLASS_REF_ASSOC_COLLECTION__IMPLEMENTATION = OOPL_CLASS_REFERENCE_COLLECTION_FEATURE_COUNT + 2;

    /**
     * The number of structural features of the '<em>OOPL Class Ref Assoc Collection</em>' class.
     * <!-- begin-user-doc -->
     * <!-- end-user-doc -->
     * @generated
     * @ordered
     */
    int OOPL_CLASS_REF_ASSOC_COLLECTION_FEATURE_COUNT = OOPL_CLASS_REFERENCE_COLLECTION_FEATURE_COUNT + 3;

    /**
     * The number of operations of the '<em>OOPL Class Ref Assoc Collection</em>' class.
     * <!-- begin-user-doc -->
     * <!-- end-user-doc -->
     * @generated
     * @ordered
     */
    int OOPL_CLASS_REF_ASSOC_COLLECTION_OPERATION_COUNT = OOPL_CLASS_REFERENCE_COLLECTION_OPERATION_COUNT + 0;

    /**
     * The meta object id for the '{@link com.ericsson.xtumlrt.oopl.impl.OOPLClassReferenceStorageImpl <em>OOPL Class Reference Storage</em>}' class.
     * <!-- begin-user-doc -->
     * <!-- end-user-doc -->
     * @see com.ericsson.xtumlrt.oopl.impl.OOPLClassReferenceStorageImpl
     * @see com.ericsson.xtumlrt.oopl.impl.OoplPackageImpl#getOOPLClassReferenceStorage()
     * @generated
     */
    int OOPL_CLASS_REFERENCE_STORAGE = 6;

    /**
     * The feature id for the '<em><b>Type</b></em>' reference.
     * <!-- begin-user-doc -->
     * <!-- end-user-doc -->
     * @generated
     * @ordered
     */
    int OOPL_CLASS_REFERENCE_STORAGE__TYPE = 0;

    /**
     * The feature id for the '<em><b>Required</b></em>' attribute.
     * <!-- begin-user-doc -->
     * <!-- end-user-doc -->
     * @generated
     * @ordered
     */
    int OOPL_CLASS_REFERENCE_STORAGE__REQUIRED = 1;

    /**
     * The number of structural features of the '<em>OOPL Class Reference Storage</em>' class.
     * <!-- begin-user-doc -->
     * <!-- end-user-doc -->
     * @generated
     * @ordered
     */
    int OOPL_CLASS_REFERENCE_STORAGE_FEATURE_COUNT = 2;

    /**
     * The number of operations of the '<em>OOPL Class Reference Storage</em>' class.
     * <!-- begin-user-doc -->
     * <!-- end-user-doc -->
     * @generated
     * @ordered
     */
    int OOPL_CLASS_REFERENCE_STORAGE_OPERATION_COUNT = 0;

    /**
     * The meta object id for the '{@link com.ericsson.xtumlrt.oopl.impl.OOPLRelationImpl <em>OOPL Relation</em>}' class.
     * <!-- begin-user-doc -->
     * <!-- end-user-doc -->
     * @see com.ericsson.xtumlrt.oopl.impl.OOPLRelationImpl
     * @see com.ericsson.xtumlrt.oopl.impl.OoplPackageImpl#getOOPLRelation()
     * @generated
     */
    int OOPL_RELATION = 7;

    /**
     * The feature id for the '<em><b>Xt Relation</b></em>' reference.
     * <!-- begin-user-doc -->
     * <!-- end-user-doc -->
     * @generated
     * @ordered
     */
    int OOPL_RELATION__XT_RELATION = 0;

    /**
     * The feature id for the '<em><b>Reference Storage</b></em>' reference list.
     * <!-- begin-user-doc -->
     * <!-- end-user-doc -->
     * @generated
     * @ordered
     */
    int OOPL_RELATION__REFERENCE_STORAGE = 1;

    /**
     * The number of structural features of the '<em>OOPL Relation</em>' class.
     * <!-- begin-user-doc -->
     * <!-- end-user-doc -->
     * @generated
     * @ordered
     */
    int OOPL_RELATION_FEATURE_COUNT = 2;

    /**
     * The number of operations of the '<em>OOPL Relation</em>' class.
     * <!-- begin-user-doc -->
     * <!-- end-user-doc -->
     * @generated
     * @ordered
     */
    int OOPL_RELATION_OPERATION_COUNT = 0;

    /**
     * The meta object id for the '{@link com.ericsson.xtumlrt.oopl.impl.OOPLNameProviderImpl <em>OOPL Name Provider</em>}' class.
     * <!-- begin-user-doc -->
     * <!-- end-user-doc -->
     * @see com.ericsson.xtumlrt.oopl.impl.OOPLNameProviderImpl
     * @see com.ericsson.xtumlrt.oopl.impl.OoplPackageImpl#getOOPLNameProvider()
     * @generated
     */
    int OOPL_NAME_PROVIDER = 8;

    /**
     * The number of structural features of the '<em>OOPL Name Provider</em>' class.
     * <!-- begin-user-doc -->
     * <!-- end-user-doc -->
     * @generated
     * @ordered
     */
    int OOPL_NAME_PROVIDER_FEATURE_COUNT = 0;

    /**
     * The number of operations of the '<em>OOPL Name Provider</em>' class.
     * <!-- begin-user-doc -->
     * <!-- end-user-doc -->
     * @generated
     * @ordered
     */
    int OOPL_NAME_PROVIDER_OPERATION_COUNT = 0;

    /**
     * The meta object id for the '{@link com.ericsson.xtumlrt.oopl.impl.OOPLDerivedNameProviderImpl <em>OOPL Derived Name Provider</em>}' class.
     * <!-- begin-user-doc -->
     * <!-- end-user-doc -->
     * @see com.ericsson.xtumlrt.oopl.impl.OOPLDerivedNameProviderImpl
     * @see com.ericsson.xtumlrt.oopl.impl.OoplPackageImpl#getOOPLDerivedNameProvider()
     * @generated
     */
    int OOPL_DERIVED_NAME_PROVIDER = 9;

    /**
     * The feature id for the '<em><b>Name</b></em>' attribute.
     * <!-- begin-user-doc -->
     * <!-- end-user-doc -->
     * @generated
     * @ordered
     */
    int OOPL_DERIVED_NAME_PROVIDER__NAME = OOPL_NAME_PROVIDER_FEATURE_COUNT + 0;

    /**
     * The number of structural features of the '<em>OOPL Derived Name Provider</em>' class.
     * <!-- begin-user-doc -->
     * <!-- end-user-doc -->
     * @generated
     * @ordered
     */
    int OOPL_DERIVED_NAME_PROVIDER_FEATURE_COUNT = OOPL_NAME_PROVIDER_FEATURE_COUNT + 1;

    /**
     * The number of operations of the '<em>OOPL Derived Name Provider</em>' class.
     * <!-- begin-user-doc -->
     * <!-- end-user-doc -->
     * @generated
     * @ordered
     */
    int OOPL_DERIVED_NAME_PROVIDER_OPERATION_COUNT = OOPL_NAME_PROVIDER_OPERATION_COUNT + 0;

    /**
     * The meta object id for the '{@link com.ericsson.xtumlrt.oopl.impl.OOPLExistingNameProviderImpl <em>OOPL Existing Name Provider</em>}' class.
     * <!-- begin-user-doc -->
     * <!-- end-user-doc -->
     * @see com.ericsson.xtumlrt.oopl.impl.OOPLExistingNameProviderImpl
     * @see com.ericsson.xtumlrt.oopl.impl.OoplPackageImpl#getOOPLExistingNameProvider()
     * @generated
     */
    int OOPL_EXISTING_NAME_PROVIDER = 10;

    /**
     * The feature id for the '<em><b>Common Named Element</b></em>' reference.
     * <!-- begin-user-doc -->
     * <!-- end-user-doc -->
     * @generated
     * @ordered
     */
    int OOPL_EXISTING_NAME_PROVIDER__COMMON_NAMED_ELEMENT = OOPL_NAME_PROVIDER_FEATURE_COUNT + 0;

    /**
     * The number of structural features of the '<em>OOPL Existing Name Provider</em>' class.
     * <!-- begin-user-doc -->
     * <!-- end-user-doc -->
     * @generated
     * @ordered
     */
    int OOPL_EXISTING_NAME_PROVIDER_FEATURE_COUNT = OOPL_NAME_PROVIDER_FEATURE_COUNT + 1;

    /**
     * The number of operations of the '<em>OOPL Existing Name Provider</em>' class.
     * <!-- begin-user-doc -->
     * <!-- end-user-doc -->
     * @generated
     * @ordered
     */
    int OOPL_EXISTING_NAME_PROVIDER_OPERATION_COUNT = OOPL_NAME_PROVIDER_OPERATION_COUNT + 0;

    /**
     * The meta object id for the '{@link com.ericsson.xtumlrt.oopl.impl.OOPLBasicTypeImpl <em>OOPL Basic Type</em>}' class.
     * <!-- begin-user-doc -->
     * <!-- end-user-doc -->
     * @see com.ericsson.xtumlrt.oopl.impl.OOPLBasicTypeImpl
     * @see com.ericsson.xtumlrt.oopl.impl.OoplPackageImpl#getOOPLBasicType()
     * @generated
     */
    int OOPL_BASIC_TYPE = 11;

    /**
     * The feature id for the '<em><b>Common Type</b></em>' reference.
     * <!-- begin-user-doc -->
     * <!-- end-user-doc -->
     * @generated
     * @ordered
     */
    int OOPL_BASIC_TYPE__COMMON_TYPE = OOPL_TYPE__COMMON_TYPE;

    /**
     * The number of structural features of the '<em>OOPL Basic Type</em>' class.
     * <!-- begin-user-doc -->
     * <!-- end-user-doc -->
     * @generated
     * @ordered
     */
    int OOPL_BASIC_TYPE_FEATURE_COUNT = OOPL_TYPE_FEATURE_COUNT + 0;

    /**
     * The number of operations of the '<em>OOPL Basic Type</em>' class.
     * <!-- begin-user-doc -->
     * <!-- end-user-doc -->
     * @generated
     * @ordered
     */
    int OOPL_BASIC_TYPE_OPERATION_COUNT = OOPL_TYPE_OPERATION_COUNT + 0;

    /**
     * The meta object id for the '{@link com.ericsson.xtumlrt.oopl.impl.OOPLEnumTypeImpl <em>OOPL Enum Type</em>}' class.
     * <!-- begin-user-doc -->
     * <!-- end-user-doc -->
     * @see com.ericsson.xtumlrt.oopl.impl.OOPLEnumTypeImpl
     * @see com.ericsson.xtumlrt.oopl.impl.OoplPackageImpl#getOOPLEnumType()
     * @generated
     */
    int OOPL_ENUM_TYPE = 12;

    /**
     * The feature id for the '<em><b>Common Type</b></em>' reference.
     * <!-- begin-user-doc -->
     * <!-- end-user-doc -->
     * @generated
     * @ordered
     */
    int OOPL_ENUM_TYPE__COMMON_TYPE = OOPL_TYPE__COMMON_TYPE;

    /**
     * The feature id for the '<em><b>Enumerators</b></em>' reference list.
     * <!-- begin-user-doc -->
     * <!-- end-user-doc -->
     * @generated
     * @ordered
     */
    int OOPL_ENUM_TYPE__ENUMERATORS = OOPL_TYPE_FEATURE_COUNT + 0;

    /**
     * The feature id for the '<em><b>Default Value</b></em>' reference.
     * <!-- begin-user-doc -->
     * <!-- end-user-doc -->
     * @generated
     * @ordered
     */
    int OOPL_ENUM_TYPE__DEFAULT_VALUE = OOPL_TYPE_FEATURE_COUNT + 1;

    /**
     * The number of structural features of the '<em>OOPL Enum Type</em>' class.
     * <!-- begin-user-doc -->
     * <!-- end-user-doc -->
     * @generated
     * @ordered
     */
    int OOPL_ENUM_TYPE_FEATURE_COUNT = OOPL_TYPE_FEATURE_COUNT + 2;

    /**
     * The number of operations of the '<em>OOPL Enum Type</em>' class.
     * <!-- begin-user-doc -->
     * <!-- end-user-doc -->
     * @generated
     * @ordered
     */
    int OOPL_ENUM_TYPE_OPERATION_COUNT = OOPL_TYPE_OPERATION_COUNT + 0;

    /**
     * The meta object id for the '{@link com.ericsson.xtumlrt.oopl.impl.OOPLEnumeratorImpl <em>OOPL Enumerator</em>}' class.
     * <!-- begin-user-doc -->
     * <!-- end-user-doc -->
     * @see com.ericsson.xtumlrt.oopl.impl.OOPLEnumeratorImpl
     * @see com.ericsson.xtumlrt.oopl.impl.OoplPackageImpl#getOOPLEnumerator()
     * @generated
     */
    int OOPL_ENUMERATOR = 13;

    /**
     * The feature id for the '<em><b>Common Enumeration Literal</b></em>' reference.
     * <!-- begin-user-doc -->
     * <!-- end-user-doc -->
     * @generated
     * @ordered
     */
    int OOPL_ENUMERATOR__COMMON_ENUMERATION_LITERAL = 0;

    /**
     * The number of structural features of the '<em>OOPL Enumerator</em>' class.
     * <!-- begin-user-doc -->
     * <!-- end-user-doc -->
     * @generated
     * @ordered
     */
    int OOPL_ENUMERATOR_FEATURE_COUNT = 1;

    /**
     * The number of operations of the '<em>OOPL Enumerator</em>' class.
     * <!-- begin-user-doc -->
     * <!-- end-user-doc -->
     * @generated
     * @ordered
     */
    int OOPL_ENUMERATOR_OPERATION_COUNT = 0;

    /**
     * The meta object id for the '{@link com.ericsson.xtumlrt.oopl.impl.OOPLStructTypeImpl <em>OOPL Struct Type</em>}' class.
     * <!-- begin-user-doc -->
     * <!-- end-user-doc -->
     * @see com.ericsson.xtumlrt.oopl.impl.OOPLStructTypeImpl
     * @see com.ericsson.xtumlrt.oopl.impl.OoplPackageImpl#getOOPLStructType()
     * @generated
     */
    int OOPL_STRUCT_TYPE = 14;

    /**
     * The feature id for the '<em><b>Common Type</b></em>' reference.
     * <!-- begin-user-doc -->
     * <!-- end-user-doc -->
     * @generated
     * @ordered
     */
    int OOPL_STRUCT_TYPE__COMMON_TYPE = OOPL_TYPE__COMMON_TYPE;

    /**
     * The feature id for the '<em><b>Members</b></em>' reference list.
     * <!-- begin-user-doc -->
     * <!-- end-user-doc -->
     * @generated
     * @ordered
     */
    int OOPL_STRUCT_TYPE__MEMBERS = OOPL_TYPE_FEATURE_COUNT + 0;

    /**
     * The number of structural features of the '<em>OOPL Struct Type</em>' class.
     * <!-- begin-user-doc -->
     * <!-- end-user-doc -->
     * @generated
     * @ordered
     */
    int OOPL_STRUCT_TYPE_FEATURE_COUNT = OOPL_TYPE_FEATURE_COUNT + 1;

    /**
     * The number of operations of the '<em>OOPL Struct Type</em>' class.
     * <!-- begin-user-doc -->
     * <!-- end-user-doc -->
     * @generated
     * @ordered
     */
    int OOPL_STRUCT_TYPE_OPERATION_COUNT = OOPL_TYPE_OPERATION_COUNT + 0;

    /**
     * The meta object id for the '{@link com.ericsson.xtumlrt.oopl.impl.OOPLStructMemberImpl <em>OOPL Struct Member</em>}' class.
     * <!-- begin-user-doc -->
     * <!-- end-user-doc -->
     * @see com.ericsson.xtumlrt.oopl.impl.OOPLStructMemberImpl
     * @see com.ericsson.xtumlrt.oopl.impl.OoplPackageImpl#getOOPLStructMember()
     * @generated
     */
    int OOPL_STRUCT_MEMBER = 15;

    /**
     * The feature id for the '<em><b>Common Member</b></em>' reference.
     * <!-- begin-user-doc -->
     * <!-- end-user-doc -->
     * @generated
     * @ordered
     */
    int OOPL_STRUCT_MEMBER__COMMON_MEMBER = 0;

    /**
     * The feature id for the '<em><b>Type</b></em>' reference.
     * <!-- begin-user-doc -->
     * <!-- end-user-doc -->
     * @generated
     * @ordered
     */
    int OOPL_STRUCT_MEMBER__TYPE = 1;

    /**
     * The number of structural features of the '<em>OOPL Struct Member</em>' class.
     * <!-- begin-user-doc -->
     * <!-- end-user-doc -->
     * @generated
     * @ordered
     */
    int OOPL_STRUCT_MEMBER_FEATURE_COUNT = 2;

    /**
     * The number of operations of the '<em>OOPL Struct Member</em>' class.
     * <!-- begin-user-doc -->
     * <!-- end-user-doc -->
     * @generated
     * @ordered
     */
    int OOPL_STRUCT_MEMBER_OPERATION_COUNT = 0;

    /**
     * The meta object id for the '{@link com.ericsson.xtumlrt.oopl.impl.OOPLSequenceImpl <em>OOPL Sequence</em>}' class.
     * <!-- begin-user-doc -->
     * <!-- end-user-doc -->
     * @see com.ericsson.xtumlrt.oopl.impl.OOPLSequenceImpl
     * @see com.ericsson.xtumlrt.oopl.impl.OoplPackageImpl#getOOPLSequence()
     * @generated
     */
    int OOPL_SEQUENCE = 16;

    /**
     * The feature id for the '<em><b>Common Type</b></em>' reference.
     * <!-- begin-user-doc -->
     * <!-- end-user-doc -->
     * @generated
     * @ordered
     */
    int OOPL_SEQUENCE__COMMON_TYPE = OOPL_TYPE__COMMON_TYPE;

    /**
     * The feature id for the '<em><b>Element Type</b></em>' reference.
     * <!-- begin-user-doc -->
     * <!-- end-user-doc -->
     * @generated
     * @ordered
     */
    int OOPL_SEQUENCE__ELEMENT_TYPE = OOPL_TYPE_FEATURE_COUNT + 0;

    /**
     * The feature id for the '<em><b>Orderedness</b></em>' attribute.
     * <!-- begin-user-doc -->
     * <!-- end-user-doc -->
     * @generated
     * @ordered
     */
    int OOPL_SEQUENCE__ORDEREDNESS = OOPL_TYPE_FEATURE_COUNT + 1;

    /**
     * The feature id for the '<em><b>Uniqueness</b></em>' attribute.
     * <!-- begin-user-doc -->
     * <!-- end-user-doc -->
     * @generated
     * @ordered
     */
    int OOPL_SEQUENCE__UNIQUENESS = OOPL_TYPE_FEATURE_COUNT + 2;

    /**
     * The feature id for the '<em><b>Implementation</b></em>' reference.
     * <!-- begin-user-doc -->
     * <!-- end-user-doc -->
     * @generated
     * @ordered
     */
    int OOPL_SEQUENCE__IMPLEMENTATION = OOPL_TYPE_FEATURE_COUNT + 3;

    /**
     * The number of structural features of the '<em>OOPL Sequence</em>' class.
     * <!-- begin-user-doc -->
     * <!-- end-user-doc -->
     * @generated
     * @ordered
     */
    int OOPL_SEQUENCE_FEATURE_COUNT = OOPL_TYPE_FEATURE_COUNT + 4;

    /**
     * The number of operations of the '<em>OOPL Sequence</em>' class.
     * <!-- begin-user-doc -->
     * <!-- end-user-doc -->
     * @generated
     * @ordered
     */
    int OOPL_SEQUENCE_OPERATION_COUNT = OOPL_TYPE_OPERATION_COUNT + 0;

    /**
     * The meta object id for the '{@link com.ericsson.xtumlrt.oopl.impl.OOPLUserDefinedTypeImpl <em>OOPL User Defined Type</em>}' class.
     * <!-- begin-user-doc -->
     * <!-- end-user-doc -->
     * @see com.ericsson.xtumlrt.oopl.impl.OOPLUserDefinedTypeImpl
     * @see com.ericsson.xtumlrt.oopl.impl.OoplPackageImpl#getOOPLUserDefinedType()
     * @generated
     */
    int OOPL_USER_DEFINED_TYPE = 17;

    /**
     * The feature id for the '<em><b>Common Type</b></em>' reference.
     * <!-- begin-user-doc -->
     * <!-- end-user-doc -->
     * @generated
     * @ordered
     */
    int OOPL_USER_DEFINED_TYPE__COMMON_TYPE = OOPL_TYPE__COMMON_TYPE;

    /**
     * The feature id for the '<em><b>Base Type</b></em>' reference.
     * <!-- begin-user-doc -->
     * <!-- end-user-doc -->
     * @generated
     * @ordered
     */
    int OOPL_USER_DEFINED_TYPE__BASE_TYPE = OOPL_TYPE_FEATURE_COUNT + 0;

    /**
     * The number of structural features of the '<em>OOPL User Defined Type</em>' class.
     * <!-- begin-user-doc -->
     * <!-- end-user-doc -->
     * @generated
     * @ordered
     */
    int OOPL_USER_DEFINED_TYPE_FEATURE_COUNT = OOPL_TYPE_FEATURE_COUNT + 1;

    /**
     * The number of operations of the '<em>OOPL User Defined Type</em>' class.
     * <!-- begin-user-doc -->
     * <!-- end-user-doc -->
     * @generated
     * @ordered
     */
    int OOPL_USER_DEFINED_TYPE_OPERATION_COUNT = OOPL_TYPE_OPERATION_COUNT + 0;

    /**
     * The meta object id for the '{@link com.ericsson.xtumlrt.oopl.impl.BaseContainerImplementationImpl <em>Base Container Implementation</em>}' class.
     * <!-- begin-user-doc -->
     * <!-- end-user-doc -->
     * @see com.ericsson.xtumlrt.oopl.impl.BaseContainerImplementationImpl
     * @see com.ericsson.xtumlrt.oopl.impl.OoplPackageImpl#getBaseContainerImplementation()
     * @generated
     */
    int BASE_CONTAINER_IMPLEMENTATION = 18;

    /**
     * The feature id for the '<em><b>Any Template</b></em>' attribute.
     * <!-- begin-user-doc -->
     * <!-- end-user-doc -->
     * @generated
     * @ordered
     */
    int BASE_CONTAINER_IMPLEMENTATION__ANY_TEMPLATE = 0;

    /**
     * The feature id for the '<em><b>Add Template</b></em>' attribute.
     * <!-- begin-user-doc -->
     * <!-- end-user-doc -->
     * @generated
     * @ordered
     */
    int BASE_CONTAINER_IMPLEMENTATION__ADD_TEMPLATE = 1;

    /**
     * The feature id for the '<em><b>Add All Template</b></em>' attribute.
     * <!-- begin-user-doc -->
     * <!-- end-user-doc -->
     * @generated
     * @ordered
     */
    int BASE_CONTAINER_IMPLEMENTATION__ADD_ALL_TEMPLATE = 2;

    /**
     * The feature id for the '<em><b>Clear Template</b></em>' attribute.
     * <!-- begin-user-doc -->
     * <!-- end-user-doc -->
     * @generated
     * @ordered
     */
    int BASE_CONTAINER_IMPLEMENTATION__CLEAR_TEMPLATE = 3;

    /**
     * The feature id for the '<em><b>Clone Template</b></em>' attribute.
     * <!-- begin-user-doc -->
     * <!-- end-user-doc -->
     * @generated
     * @ordered
     */
    int BASE_CONTAINER_IMPLEMENTATION__CLONE_TEMPLATE = 4;

    /**
     * The feature id for the '<em><b>Contains Template</b></em>' attribute.
     * <!-- begin-user-doc -->
     * <!-- end-user-doc -->
     * @generated
     * @ordered
     */
    int BASE_CONTAINER_IMPLEMENTATION__CONTAINS_TEMPLATE = 5;

    /**
     * The feature id for the '<em><b>Contains All Template</b></em>' attribute.
     * <!-- begin-user-doc -->
     * <!-- end-user-doc -->
     * @generated
     * @ordered
     */
    int BASE_CONTAINER_IMPLEMENTATION__CONTAINS_ALL_TEMPLATE = 6;

    /**
     * The feature id for the '<em><b>Count Of Template</b></em>' attribute.
     * <!-- begin-user-doc -->
     * <!-- end-user-doc -->
     * @generated
     * @ordered
     */
    int BASE_CONTAINER_IMPLEMENTATION__COUNT_OF_TEMPLATE = 7;

    /**
     * The feature id for the '<em><b>Element At Index Template</b></em>' attribute.
     * <!-- begin-user-doc -->
     * <!-- end-user-doc -->
     * @generated
     * @ordered
     */
    int BASE_CONTAINER_IMPLEMENTATION__ELEMENT_AT_INDEX_TEMPLATE = 8;

    /**
     * The feature id for the '<em><b>Insert Element At Index Template</b></em>' attribute.
     * <!-- begin-user-doc -->
     * <!-- end-user-doc -->
     * @generated
     * @ordered
     */
    int BASE_CONTAINER_IMPLEMENTATION__INSERT_ELEMENT_AT_INDEX_TEMPLATE = 9;

    /**
     * The feature id for the '<em><b>Is Empty Template</b></em>' attribute.
     * <!-- begin-user-doc -->
     * <!-- end-user-doc -->
     * @generated
     * @ordered
     */
    int BASE_CONTAINER_IMPLEMENTATION__IS_EMPTY_TEMPLATE = 10;

    /**
     * The feature id for the '<em><b>Remove Template</b></em>' attribute.
     * <!-- begin-user-doc -->
     * <!-- end-user-doc -->
     * @generated
     * @ordered
     */
    int BASE_CONTAINER_IMPLEMENTATION__REMOVE_TEMPLATE = 11;

    /**
     * The feature id for the '<em><b>Remove All Template</b></em>' attribute.
     * <!-- begin-user-doc -->
     * <!-- end-user-doc -->
     * @generated
     * @ordered
     */
    int BASE_CONTAINER_IMPLEMENTATION__REMOVE_ALL_TEMPLATE = 12;

    /**
     * The feature id for the '<em><b>Replace Element At Index Template</b></em>' attribute.
     * <!-- begin-user-doc -->
     * <!-- end-user-doc -->
     * @generated
     * @ordered
     */
    int BASE_CONTAINER_IMPLEMENTATION__REPLACE_ELEMENT_AT_INDEX_TEMPLATE = 13;

    /**
     * The feature id for the '<em><b>Retain All Template</b></em>' attribute.
     * <!-- begin-user-doc -->
     * <!-- end-user-doc -->
     * @generated
     * @ordered
     */
    int BASE_CONTAINER_IMPLEMENTATION__RETAIN_ALL_TEMPLATE = 14;

    /**
     * The feature id for the '<em><b>Size Template</b></em>' attribute.
     * <!-- begin-user-doc -->
     * <!-- end-user-doc -->
     * @generated
     * @ordered
     */
    int BASE_CONTAINER_IMPLEMENTATION__SIZE_TEMPLATE = 15;

    /**
     * The feature id for the '<em><b>Container Qualified Name</b></em>' attribute.
     * <!-- begin-user-doc -->
     * <!-- end-user-doc -->
     * @generated
     * @ordered
     */
    int BASE_CONTAINER_IMPLEMENTATION__CONTAINER_QUALIFIED_NAME = 16;

    /**
     * The feature id for the '<em><b>Container Header Includes</b></em>' attribute list.
     * <!-- begin-user-doc -->
     * <!-- end-user-doc -->
     * @generated
     * @ordered
     */
    int BASE_CONTAINER_IMPLEMENTATION__CONTAINER_HEADER_INCLUDES = 17;

    /**
     * The number of structural features of the '<em>Base Container Implementation</em>' class.
     * <!-- begin-user-doc -->
     * <!-- end-user-doc -->
     * @generated
     * @ordered
     */
    int BASE_CONTAINER_IMPLEMENTATION_FEATURE_COUNT = 18;

    /**
     * The operation id for the '<em>Generate Add</em>' operation.
     * <!-- begin-user-doc -->
     * <!-- end-user-doc -->
     * @generated
     * @ordered
     */
    int BASE_CONTAINER_IMPLEMENTATION___GENERATE_ADD__STRING_STRING_STRING = 0;

    /**
     * The operation id for the '<em>Generate Add All</em>' operation.
     * <!-- begin-user-doc -->
     * <!-- end-user-doc -->
     * @generated
     * @ordered
     */
    int BASE_CONTAINER_IMPLEMENTATION___GENERATE_ADD_ALL__STRING_STRING = 1;

    /**
     * The operation id for the '<em>Generate Clear</em>' operation.
     * <!-- begin-user-doc -->
     * <!-- end-user-doc -->
     * @generated
     * @ordered
     */
    int BASE_CONTAINER_IMPLEMENTATION___GENERATE_CLEAR__STRING = 2;

    /**
     * The operation id for the '<em>Generate Clone</em>' operation.
     * <!-- begin-user-doc -->
     * <!-- end-user-doc -->
     * @generated
     * @ordered
     */
    int BASE_CONTAINER_IMPLEMENTATION___GENERATE_CLONE__STRING_STRING_STRING = 3;

    /**
     * The operation id for the '<em>Generate Contains</em>' operation.
     * <!-- begin-user-doc -->
     * <!-- end-user-doc -->
     * @generated
     * @ordered
     */
    int BASE_CONTAINER_IMPLEMENTATION___GENERATE_CONTAINS__STRING_STRING_STRING = 4;

    /**
     * The operation id for the '<em>Generate Contains All</em>' operation.
     * <!-- begin-user-doc -->
     * <!-- end-user-doc -->
     * @generated
     * @ordered
     */
    int BASE_CONTAINER_IMPLEMENTATION___GENERATE_CONTAINS_ALL__STRING_STRING_STRING_STRING_STRING = 5;

    /**
     * The operation id for the '<em>Generate Is Empty</em>' operation.
     * <!-- begin-user-doc -->
     * <!-- end-user-doc -->
     * @generated
     * @ordered
     */
    int BASE_CONTAINER_IMPLEMENTATION___GENERATE_IS_EMPTY__STRING_STRING = 6;

    /**
     * The operation id for the '<em>Generate Remove</em>' operation.
     * <!-- begin-user-doc -->
     * <!-- end-user-doc -->
     * @generated
     * @ordered
     */
    int BASE_CONTAINER_IMPLEMENTATION___GENERATE_REMOVE__STRING_STRING = 7;

    /**
     * The operation id for the '<em>Generate Remove All</em>' operation.
     * <!-- begin-user-doc -->
     * <!-- end-user-doc -->
     * @generated
     * @ordered
     */
    int BASE_CONTAINER_IMPLEMENTATION___GENERATE_REMOVE_ALL__STRING_STRING_STRING_STRING = 8;

    /**
     * The operation id for the '<em>Generate Retain All</em>' operation.
     * <!-- begin-user-doc -->
     * <!-- end-user-doc -->
     * @generated
     * @ordered
     */
    int BASE_CONTAINER_IMPLEMENTATION___GENERATE_RETAIN_ALL__STRING_STRING_STRING = 9;

    /**
     * The operation id for the '<em>Generate Size</em>' operation.
     * <!-- begin-user-doc -->
     * <!-- end-user-doc -->
     * @generated
     * @ordered
     */
    int BASE_CONTAINER_IMPLEMENTATION___GENERATE_SIZE__STRING_STRING = 10;

    /**
     * The number of operations of the '<em>Base Container Implementation</em>' class.
     * <!-- begin-user-doc -->
     * <!-- end-user-doc -->
     * @generated
     * @ordered
     */
    int BASE_CONTAINER_IMPLEMENTATION_OPERATION_COUNT = 11;

    /**
     * The meta object id for the '{@link com.ericsson.xtumlrt.oopl.impl.OOPLClassRefAssocCollectionImplementationImpl <em>OOPL Class Ref Assoc Collection Implementation</em>}' class.
     * <!-- begin-user-doc -->
     * <!-- end-user-doc -->
     * @see com.ericsson.xtumlrt.oopl.impl.OOPLClassRefAssocCollectionImplementationImpl
     * @see com.ericsson.xtumlrt.oopl.impl.OoplPackageImpl#getOOPLClassRefAssocCollectionImplementation()
     * @generated
     */
    int OOPL_CLASS_REF_ASSOC_COLLECTION_IMPLEMENTATION = 19;

    /**
     * The feature id for the '<em><b>Any Template</b></em>' attribute.
     * <!-- begin-user-doc -->
     * <!-- end-user-doc -->
     * @generated
     * @ordered
     */
    int OOPL_CLASS_REF_ASSOC_COLLECTION_IMPLEMENTATION__ANY_TEMPLATE = BASE_CONTAINER_IMPLEMENTATION__ANY_TEMPLATE;

    /**
     * The feature id for the '<em><b>Add Template</b></em>' attribute.
     * <!-- begin-user-doc -->
     * <!-- end-user-doc -->
     * @generated
     * @ordered
     */
    int OOPL_CLASS_REF_ASSOC_COLLECTION_IMPLEMENTATION__ADD_TEMPLATE = BASE_CONTAINER_IMPLEMENTATION__ADD_TEMPLATE;

    /**
     * The feature id for the '<em><b>Add All Template</b></em>' attribute.
     * <!-- begin-user-doc -->
     * <!-- end-user-doc -->
     * @generated
     * @ordered
     */
    int OOPL_CLASS_REF_ASSOC_COLLECTION_IMPLEMENTATION__ADD_ALL_TEMPLATE = BASE_CONTAINER_IMPLEMENTATION__ADD_ALL_TEMPLATE;

    /**
     * The feature id for the '<em><b>Clear Template</b></em>' attribute.
     * <!-- begin-user-doc -->
     * <!-- end-user-doc -->
     * @generated
     * @ordered
     */
    int OOPL_CLASS_REF_ASSOC_COLLECTION_IMPLEMENTATION__CLEAR_TEMPLATE = BASE_CONTAINER_IMPLEMENTATION__CLEAR_TEMPLATE;

    /**
     * The feature id for the '<em><b>Clone Template</b></em>' attribute.
     * <!-- begin-user-doc -->
     * <!-- end-user-doc -->
     * @generated
     * @ordered
     */
    int OOPL_CLASS_REF_ASSOC_COLLECTION_IMPLEMENTATION__CLONE_TEMPLATE = BASE_CONTAINER_IMPLEMENTATION__CLONE_TEMPLATE;

    /**
     * The feature id for the '<em><b>Contains Template</b></em>' attribute.
     * <!-- begin-user-doc -->
     * <!-- end-user-doc -->
     * @generated
     * @ordered
     */
    int OOPL_CLASS_REF_ASSOC_COLLECTION_IMPLEMENTATION__CONTAINS_TEMPLATE = BASE_CONTAINER_IMPLEMENTATION__CONTAINS_TEMPLATE;

    /**
     * The feature id for the '<em><b>Contains All Template</b></em>' attribute.
     * <!-- begin-user-doc -->
     * <!-- end-user-doc -->
     * @generated
     * @ordered
     */
    int OOPL_CLASS_REF_ASSOC_COLLECTION_IMPLEMENTATION__CONTAINS_ALL_TEMPLATE = BASE_CONTAINER_IMPLEMENTATION__CONTAINS_ALL_TEMPLATE;

    /**
     * The feature id for the '<em><b>Count Of Template</b></em>' attribute.
     * <!-- begin-user-doc -->
     * <!-- end-user-doc -->
     * @generated
     * @ordered
     */
    int OOPL_CLASS_REF_ASSOC_COLLECTION_IMPLEMENTATION__COUNT_OF_TEMPLATE = BASE_CONTAINER_IMPLEMENTATION__COUNT_OF_TEMPLATE;

    /**
     * The feature id for the '<em><b>Element At Index Template</b></em>' attribute.
     * <!-- begin-user-doc -->
     * <!-- end-user-doc -->
     * @generated
     * @ordered
     */
    int OOPL_CLASS_REF_ASSOC_COLLECTION_IMPLEMENTATION__ELEMENT_AT_INDEX_TEMPLATE = BASE_CONTAINER_IMPLEMENTATION__ELEMENT_AT_INDEX_TEMPLATE;

    /**
     * The feature id for the '<em><b>Insert Element At Index Template</b></em>' attribute.
     * <!-- begin-user-doc -->
     * <!-- end-user-doc -->
     * @generated
     * @ordered
     */
    int OOPL_CLASS_REF_ASSOC_COLLECTION_IMPLEMENTATION__INSERT_ELEMENT_AT_INDEX_TEMPLATE = BASE_CONTAINER_IMPLEMENTATION__INSERT_ELEMENT_AT_INDEX_TEMPLATE;

    /**
     * The feature id for the '<em><b>Is Empty Template</b></em>' attribute.
     * <!-- begin-user-doc -->
     * <!-- end-user-doc -->
     * @generated
     * @ordered
     */
    int OOPL_CLASS_REF_ASSOC_COLLECTION_IMPLEMENTATION__IS_EMPTY_TEMPLATE = BASE_CONTAINER_IMPLEMENTATION__IS_EMPTY_TEMPLATE;

    /**
     * The feature id for the '<em><b>Remove Template</b></em>' attribute.
     * <!-- begin-user-doc -->
     * <!-- end-user-doc -->
     * @generated
     * @ordered
     */
    int OOPL_CLASS_REF_ASSOC_COLLECTION_IMPLEMENTATION__REMOVE_TEMPLATE = BASE_CONTAINER_IMPLEMENTATION__REMOVE_TEMPLATE;

    /**
     * The feature id for the '<em><b>Remove All Template</b></em>' attribute.
     * <!-- begin-user-doc -->
     * <!-- end-user-doc -->
     * @generated
     * @ordered
     */
    int OOPL_CLASS_REF_ASSOC_COLLECTION_IMPLEMENTATION__REMOVE_ALL_TEMPLATE = BASE_CONTAINER_IMPLEMENTATION__REMOVE_ALL_TEMPLATE;

    /**
     * The feature id for the '<em><b>Replace Element At Index Template</b></em>' attribute.
     * <!-- begin-user-doc -->
     * <!-- end-user-doc -->
     * @generated
     * @ordered
     */
    int OOPL_CLASS_REF_ASSOC_COLLECTION_IMPLEMENTATION__REPLACE_ELEMENT_AT_INDEX_TEMPLATE = BASE_CONTAINER_IMPLEMENTATION__REPLACE_ELEMENT_AT_INDEX_TEMPLATE;

    /**
     * The feature id for the '<em><b>Retain All Template</b></em>' attribute.
     * <!-- begin-user-doc -->
     * <!-- end-user-doc -->
     * @generated
     * @ordered
     */
    int OOPL_CLASS_REF_ASSOC_COLLECTION_IMPLEMENTATION__RETAIN_ALL_TEMPLATE = BASE_CONTAINER_IMPLEMENTATION__RETAIN_ALL_TEMPLATE;

    /**
     * The feature id for the '<em><b>Size Template</b></em>' attribute.
     * <!-- begin-user-doc -->
     * <!-- end-user-doc -->
     * @generated
     * @ordered
     */
    int OOPL_CLASS_REF_ASSOC_COLLECTION_IMPLEMENTATION__SIZE_TEMPLATE = BASE_CONTAINER_IMPLEMENTATION__SIZE_TEMPLATE;

    /**
     * The feature id for the '<em><b>Container Qualified Name</b></em>' attribute.
     * <!-- begin-user-doc -->
     * <!-- end-user-doc -->
     * @generated
     * @ordered
     */
    int OOPL_CLASS_REF_ASSOC_COLLECTION_IMPLEMENTATION__CONTAINER_QUALIFIED_NAME = BASE_CONTAINER_IMPLEMENTATION__CONTAINER_QUALIFIED_NAME;

    /**
     * The feature id for the '<em><b>Container Header Includes</b></em>' attribute list.
     * <!-- begin-user-doc -->
     * <!-- end-user-doc -->
     * @generated
     * @ordered
     */
    int OOPL_CLASS_REF_ASSOC_COLLECTION_IMPLEMENTATION__CONTAINER_HEADER_INCLUDES = BASE_CONTAINER_IMPLEMENTATION__CONTAINER_HEADER_INCLUDES;

    /**
     * The feature id for the '<em><b>Kind</b></em>' attribute.
     * <!-- begin-user-doc -->
     * <!-- end-user-doc -->
     * @generated
     * @ordered
     */
    int OOPL_CLASS_REF_ASSOC_COLLECTION_IMPLEMENTATION__KIND = BASE_CONTAINER_IMPLEMENTATION_FEATURE_COUNT + 0;

    /**
     * The number of structural features of the '<em>OOPL Class Ref Assoc Collection Implementation</em>' class.
     * <!-- begin-user-doc -->
     * <!-- end-user-doc -->
     * @generated
     * @ordered
     */
    int OOPL_CLASS_REF_ASSOC_COLLECTION_IMPLEMENTATION_FEATURE_COUNT = BASE_CONTAINER_IMPLEMENTATION_FEATURE_COUNT + 1;

    /**
     * The operation id for the '<em>Generate Add</em>' operation.
     * <!-- begin-user-doc -->
     * <!-- end-user-doc -->
     * @generated
     * @ordered
     */
    int OOPL_CLASS_REF_ASSOC_COLLECTION_IMPLEMENTATION___GENERATE_ADD__STRING_STRING_STRING = BASE_CONTAINER_IMPLEMENTATION___GENERATE_ADD__STRING_STRING_STRING;

    /**
     * The operation id for the '<em>Generate Add All</em>' operation.
     * <!-- begin-user-doc -->
     * <!-- end-user-doc -->
     * @generated
     * @ordered
     */
    int OOPL_CLASS_REF_ASSOC_COLLECTION_IMPLEMENTATION___GENERATE_ADD_ALL__STRING_STRING = BASE_CONTAINER_IMPLEMENTATION___GENERATE_ADD_ALL__STRING_STRING;

    /**
     * The operation id for the '<em>Generate Clear</em>' operation.
     * <!-- begin-user-doc -->
     * <!-- end-user-doc -->
     * @generated
     * @ordered
     */
    int OOPL_CLASS_REF_ASSOC_COLLECTION_IMPLEMENTATION___GENERATE_CLEAR__STRING = BASE_CONTAINER_IMPLEMENTATION___GENERATE_CLEAR__STRING;

    /**
     * The operation id for the '<em>Generate Clone</em>' operation.
     * <!-- begin-user-doc -->
     * <!-- end-user-doc -->
     * @generated
     * @ordered
     */
    int OOPL_CLASS_REF_ASSOC_COLLECTION_IMPLEMENTATION___GENERATE_CLONE__STRING_STRING_STRING = BASE_CONTAINER_IMPLEMENTATION___GENERATE_CLONE__STRING_STRING_STRING;

    /**
     * The operation id for the '<em>Generate Contains</em>' operation.
     * <!-- begin-user-doc -->
     * <!-- end-user-doc -->
     * @generated
     * @ordered
     */
    int OOPL_CLASS_REF_ASSOC_COLLECTION_IMPLEMENTATION___GENERATE_CONTAINS__STRING_STRING_STRING = BASE_CONTAINER_IMPLEMENTATION___GENERATE_CONTAINS__STRING_STRING_STRING;

    /**
     * The operation id for the '<em>Generate Contains All</em>' operation.
     * <!-- begin-user-doc -->
     * <!-- end-user-doc -->
     * @generated
     * @ordered
     */
    int OOPL_CLASS_REF_ASSOC_COLLECTION_IMPLEMENTATION___GENERATE_CONTAINS_ALL__STRING_STRING_STRING_STRING_STRING = BASE_CONTAINER_IMPLEMENTATION___GENERATE_CONTAINS_ALL__STRING_STRING_STRING_STRING_STRING;

    /**
     * The operation id for the '<em>Generate Is Empty</em>' operation.
     * <!-- begin-user-doc -->
     * <!-- end-user-doc -->
     * @generated
     * @ordered
     */
    int OOPL_CLASS_REF_ASSOC_COLLECTION_IMPLEMENTATION___GENERATE_IS_EMPTY__STRING_STRING = BASE_CONTAINER_IMPLEMENTATION___GENERATE_IS_EMPTY__STRING_STRING;

    /**
     * The operation id for the '<em>Generate Remove</em>' operation.
     * <!-- begin-user-doc -->
     * <!-- end-user-doc -->
     * @generated
     * @ordered
     */
    int OOPL_CLASS_REF_ASSOC_COLLECTION_IMPLEMENTATION___GENERATE_REMOVE__STRING_STRING = BASE_CONTAINER_IMPLEMENTATION___GENERATE_REMOVE__STRING_STRING;

    /**
     * The operation id for the '<em>Generate Remove All</em>' operation.
     * <!-- begin-user-doc -->
     * <!-- end-user-doc -->
     * @generated
     * @ordered
     */
    int OOPL_CLASS_REF_ASSOC_COLLECTION_IMPLEMENTATION___GENERATE_REMOVE_ALL__STRING_STRING_STRING_STRING = BASE_CONTAINER_IMPLEMENTATION___GENERATE_REMOVE_ALL__STRING_STRING_STRING_STRING;

    /**
     * The operation id for the '<em>Generate Retain All</em>' operation.
     * <!-- begin-user-doc -->
     * <!-- end-user-doc -->
     * @generated
     * @ordered
     */
    int OOPL_CLASS_REF_ASSOC_COLLECTION_IMPLEMENTATION___GENERATE_RETAIN_ALL__STRING_STRING_STRING = BASE_CONTAINER_IMPLEMENTATION___GENERATE_RETAIN_ALL__STRING_STRING_STRING;

    /**
     * The operation id for the '<em>Generate Size</em>' operation.
     * <!-- begin-user-doc -->
     * <!-- end-user-doc -->
     * @generated
     * @ordered
     */
    int OOPL_CLASS_REF_ASSOC_COLLECTION_IMPLEMENTATION___GENERATE_SIZE__STRING_STRING = BASE_CONTAINER_IMPLEMENTATION___GENERATE_SIZE__STRING_STRING;

    /**
     * The operation id for the '<em>Generate Count Of</em>' operation.
     * <!-- begin-user-doc -->
     * <!-- end-user-doc -->
     * @generated
     * @ordered
     */
    int OOPL_CLASS_REF_ASSOC_COLLECTION_IMPLEMENTATION___GENERATE_COUNT_OF__STRING_STRING_STRING = BASE_CONTAINER_IMPLEMENTATION_OPERATION_COUNT + 0;

    /**
     * The operation id for the '<em>Generate Any</em>' operation.
     * <!-- begin-user-doc -->
     * <!-- end-user-doc -->
     * @generated
     * @ordered
     */
    int OOPL_CLASS_REF_ASSOC_COLLECTION_IMPLEMENTATION___GENERATE_ANY__STRING_STRING_STRING = BASE_CONTAINER_IMPLEMENTATION_OPERATION_COUNT + 1;

    /**
     * The number of operations of the '<em>OOPL Class Ref Assoc Collection Implementation</em>' class.
     * <!-- begin-user-doc -->
     * <!-- end-user-doc -->
     * @generated
     * @ordered
     */
    int OOPL_CLASS_REF_ASSOC_COLLECTION_IMPLEMENTATION_OPERATION_COUNT = BASE_CONTAINER_IMPLEMENTATION_OPERATION_COUNT + 2;

    /**
     * The meta object id for the '{@link com.ericsson.xtumlrt.oopl.impl.OOPLClassRefSimpleCollectionImplementationImpl <em>OOPL Class Ref Simple Collection Implementation</em>}' class.
     * <!-- begin-user-doc -->
     * <!-- end-user-doc -->
     * @see com.ericsson.xtumlrt.oopl.impl.OOPLClassRefSimpleCollectionImplementationImpl
     * @see com.ericsson.xtumlrt.oopl.impl.OoplPackageImpl#getOOPLClassRefSimpleCollectionImplementation()
     * @generated
     */
    int OOPL_CLASS_REF_SIMPLE_COLLECTION_IMPLEMENTATION = 20;

    /**
     * The feature id for the '<em><b>Any Template</b></em>' attribute.
     * <!-- begin-user-doc -->
     * <!-- end-user-doc -->
     * @generated
     * @ordered
     */
    int OOPL_CLASS_REF_SIMPLE_COLLECTION_IMPLEMENTATION__ANY_TEMPLATE = BASE_CONTAINER_IMPLEMENTATION__ANY_TEMPLATE;

    /**
     * The feature id for the '<em><b>Add Template</b></em>' attribute.
     * <!-- begin-user-doc -->
     * <!-- end-user-doc -->
     * @generated
     * @ordered
     */
    int OOPL_CLASS_REF_SIMPLE_COLLECTION_IMPLEMENTATION__ADD_TEMPLATE = BASE_CONTAINER_IMPLEMENTATION__ADD_TEMPLATE;

    /**
     * The feature id for the '<em><b>Add All Template</b></em>' attribute.
     * <!-- begin-user-doc -->
     * <!-- end-user-doc -->
     * @generated
     * @ordered
     */
    int OOPL_CLASS_REF_SIMPLE_COLLECTION_IMPLEMENTATION__ADD_ALL_TEMPLATE = BASE_CONTAINER_IMPLEMENTATION__ADD_ALL_TEMPLATE;

    /**
     * The feature id for the '<em><b>Clear Template</b></em>' attribute.
     * <!-- begin-user-doc -->
     * <!-- end-user-doc -->
     * @generated
     * @ordered
     */
    int OOPL_CLASS_REF_SIMPLE_COLLECTION_IMPLEMENTATION__CLEAR_TEMPLATE = BASE_CONTAINER_IMPLEMENTATION__CLEAR_TEMPLATE;

    /**
     * The feature id for the '<em><b>Clone Template</b></em>' attribute.
     * <!-- begin-user-doc -->
     * <!-- end-user-doc -->
     * @generated
     * @ordered
     */
    int OOPL_CLASS_REF_SIMPLE_COLLECTION_IMPLEMENTATION__CLONE_TEMPLATE = BASE_CONTAINER_IMPLEMENTATION__CLONE_TEMPLATE;

    /**
     * The feature id for the '<em><b>Contains Template</b></em>' attribute.
     * <!-- begin-user-doc -->
     * <!-- end-user-doc -->
     * @generated
     * @ordered
     */
    int OOPL_CLASS_REF_SIMPLE_COLLECTION_IMPLEMENTATION__CONTAINS_TEMPLATE = BASE_CONTAINER_IMPLEMENTATION__CONTAINS_TEMPLATE;

    /**
     * The feature id for the '<em><b>Contains All Template</b></em>' attribute.
     * <!-- begin-user-doc -->
     * <!-- end-user-doc -->
     * @generated
     * @ordered
     */
    int OOPL_CLASS_REF_SIMPLE_COLLECTION_IMPLEMENTATION__CONTAINS_ALL_TEMPLATE = BASE_CONTAINER_IMPLEMENTATION__CONTAINS_ALL_TEMPLATE;

    /**
     * The feature id for the '<em><b>Count Of Template</b></em>' attribute.
     * <!-- begin-user-doc -->
     * <!-- end-user-doc -->
     * @generated
     * @ordered
     */
    int OOPL_CLASS_REF_SIMPLE_COLLECTION_IMPLEMENTATION__COUNT_OF_TEMPLATE = BASE_CONTAINER_IMPLEMENTATION__COUNT_OF_TEMPLATE;

    /**
     * The feature id for the '<em><b>Element At Index Template</b></em>' attribute.
     * <!-- begin-user-doc -->
     * <!-- end-user-doc -->
     * @generated
     * @ordered
     */
    int OOPL_CLASS_REF_SIMPLE_COLLECTION_IMPLEMENTATION__ELEMENT_AT_INDEX_TEMPLATE = BASE_CONTAINER_IMPLEMENTATION__ELEMENT_AT_INDEX_TEMPLATE;

    /**
     * The feature id for the '<em><b>Insert Element At Index Template</b></em>' attribute.
     * <!-- begin-user-doc -->
     * <!-- end-user-doc -->
     * @generated
     * @ordered
     */
    int OOPL_CLASS_REF_SIMPLE_COLLECTION_IMPLEMENTATION__INSERT_ELEMENT_AT_INDEX_TEMPLATE = BASE_CONTAINER_IMPLEMENTATION__INSERT_ELEMENT_AT_INDEX_TEMPLATE;

    /**
     * The feature id for the '<em><b>Is Empty Template</b></em>' attribute.
     * <!-- begin-user-doc -->
     * <!-- end-user-doc -->
     * @generated
     * @ordered
     */
    int OOPL_CLASS_REF_SIMPLE_COLLECTION_IMPLEMENTATION__IS_EMPTY_TEMPLATE = BASE_CONTAINER_IMPLEMENTATION__IS_EMPTY_TEMPLATE;

    /**
     * The feature id for the '<em><b>Remove Template</b></em>' attribute.
     * <!-- begin-user-doc -->
     * <!-- end-user-doc -->
     * @generated
     * @ordered
     */
    int OOPL_CLASS_REF_SIMPLE_COLLECTION_IMPLEMENTATION__REMOVE_TEMPLATE = BASE_CONTAINER_IMPLEMENTATION__REMOVE_TEMPLATE;

    /**
     * The feature id for the '<em><b>Remove All Template</b></em>' attribute.
     * <!-- begin-user-doc -->
     * <!-- end-user-doc -->
     * @generated
     * @ordered
     */
    int OOPL_CLASS_REF_SIMPLE_COLLECTION_IMPLEMENTATION__REMOVE_ALL_TEMPLATE = BASE_CONTAINER_IMPLEMENTATION__REMOVE_ALL_TEMPLATE;

    /**
     * The feature id for the '<em><b>Replace Element At Index Template</b></em>' attribute.
     * <!-- begin-user-doc -->
     * <!-- end-user-doc -->
     * @generated
     * @ordered
     */
    int OOPL_CLASS_REF_SIMPLE_COLLECTION_IMPLEMENTATION__REPLACE_ELEMENT_AT_INDEX_TEMPLATE = BASE_CONTAINER_IMPLEMENTATION__REPLACE_ELEMENT_AT_INDEX_TEMPLATE;

    /**
     * The feature id for the '<em><b>Retain All Template</b></em>' attribute.
     * <!-- begin-user-doc -->
     * <!-- end-user-doc -->
     * @generated
     * @ordered
     */
    int OOPL_CLASS_REF_SIMPLE_COLLECTION_IMPLEMENTATION__RETAIN_ALL_TEMPLATE = BASE_CONTAINER_IMPLEMENTATION__RETAIN_ALL_TEMPLATE;

    /**
     * The feature id for the '<em><b>Size Template</b></em>' attribute.
     * <!-- begin-user-doc -->
     * <!-- end-user-doc -->
     * @generated
     * @ordered
     */
    int OOPL_CLASS_REF_SIMPLE_COLLECTION_IMPLEMENTATION__SIZE_TEMPLATE = BASE_CONTAINER_IMPLEMENTATION__SIZE_TEMPLATE;

    /**
     * The feature id for the '<em><b>Container Qualified Name</b></em>' attribute.
     * <!-- begin-user-doc -->
     * <!-- end-user-doc -->
     * @generated
     * @ordered
     */
    int OOPL_CLASS_REF_SIMPLE_COLLECTION_IMPLEMENTATION__CONTAINER_QUALIFIED_NAME = BASE_CONTAINER_IMPLEMENTATION__CONTAINER_QUALIFIED_NAME;

    /**
     * The feature id for the '<em><b>Container Header Includes</b></em>' attribute list.
     * <!-- begin-user-doc -->
     * <!-- end-user-doc -->
     * @generated
     * @ordered
     */
    int OOPL_CLASS_REF_SIMPLE_COLLECTION_IMPLEMENTATION__CONTAINER_HEADER_INCLUDES = BASE_CONTAINER_IMPLEMENTATION__CONTAINER_HEADER_INCLUDES;

    /**
     * The feature id for the '<em><b>Kind</b></em>' attribute.
     * <!-- begin-user-doc -->
     * <!-- end-user-doc -->
     * @generated
     * @ordered
     */
    int OOPL_CLASS_REF_SIMPLE_COLLECTION_IMPLEMENTATION__KIND = BASE_CONTAINER_IMPLEMENTATION_FEATURE_COUNT + 0;

    /**
     * The number of structural features of the '<em>OOPL Class Ref Simple Collection Implementation</em>' class.
     * <!-- begin-user-doc -->
     * <!-- end-user-doc -->
     * @generated
     * @ordered
     */
    int OOPL_CLASS_REF_SIMPLE_COLLECTION_IMPLEMENTATION_FEATURE_COUNT = BASE_CONTAINER_IMPLEMENTATION_FEATURE_COUNT + 1;

    /**
     * The operation id for the '<em>Generate Add</em>' operation.
     * <!-- begin-user-doc -->
     * <!-- end-user-doc -->
     * @generated
     * @ordered
     */
    int OOPL_CLASS_REF_SIMPLE_COLLECTION_IMPLEMENTATION___GENERATE_ADD__STRING_STRING_STRING = BASE_CONTAINER_IMPLEMENTATION___GENERATE_ADD__STRING_STRING_STRING;

    /**
     * The operation id for the '<em>Generate Add All</em>' operation.
     * <!-- begin-user-doc -->
     * <!-- end-user-doc -->
     * @generated
     * @ordered
     */
    int OOPL_CLASS_REF_SIMPLE_COLLECTION_IMPLEMENTATION___GENERATE_ADD_ALL__STRING_STRING = BASE_CONTAINER_IMPLEMENTATION___GENERATE_ADD_ALL__STRING_STRING;

    /**
     * The operation id for the '<em>Generate Clear</em>' operation.
     * <!-- begin-user-doc -->
     * <!-- end-user-doc -->
     * @generated
     * @ordered
     */
    int OOPL_CLASS_REF_SIMPLE_COLLECTION_IMPLEMENTATION___GENERATE_CLEAR__STRING = BASE_CONTAINER_IMPLEMENTATION___GENERATE_CLEAR__STRING;

    /**
     * The operation id for the '<em>Generate Clone</em>' operation.
     * <!-- begin-user-doc -->
     * <!-- end-user-doc -->
     * @generated
     * @ordered
     */
    int OOPL_CLASS_REF_SIMPLE_COLLECTION_IMPLEMENTATION___GENERATE_CLONE__STRING_STRING_STRING = BASE_CONTAINER_IMPLEMENTATION___GENERATE_CLONE__STRING_STRING_STRING;

    /**
     * The operation id for the '<em>Generate Contains</em>' operation.
     * <!-- begin-user-doc -->
     * <!-- end-user-doc -->
     * @generated
     * @ordered
     */
    int OOPL_CLASS_REF_SIMPLE_COLLECTION_IMPLEMENTATION___GENERATE_CONTAINS__STRING_STRING_STRING = BASE_CONTAINER_IMPLEMENTATION___GENERATE_CONTAINS__STRING_STRING_STRING;

    /**
     * The operation id for the '<em>Generate Contains All</em>' operation.
     * <!-- begin-user-doc -->
     * <!-- end-user-doc -->
     * @generated
     * @ordered
     */
    int OOPL_CLASS_REF_SIMPLE_COLLECTION_IMPLEMENTATION___GENERATE_CONTAINS_ALL__STRING_STRING_STRING_STRING_STRING = BASE_CONTAINER_IMPLEMENTATION___GENERATE_CONTAINS_ALL__STRING_STRING_STRING_STRING_STRING;

    /**
     * The operation id for the '<em>Generate Is Empty</em>' operation.
     * <!-- begin-user-doc -->
     * <!-- end-user-doc -->
     * @generated
     * @ordered
     */
    int OOPL_CLASS_REF_SIMPLE_COLLECTION_IMPLEMENTATION___GENERATE_IS_EMPTY__STRING_STRING = BASE_CONTAINER_IMPLEMENTATION___GENERATE_IS_EMPTY__STRING_STRING;

    /**
     * The operation id for the '<em>Generate Remove</em>' operation.
     * <!-- begin-user-doc -->
     * <!-- end-user-doc -->
     * @generated
     * @ordered
     */
    int OOPL_CLASS_REF_SIMPLE_COLLECTION_IMPLEMENTATION___GENERATE_REMOVE__STRING_STRING = BASE_CONTAINER_IMPLEMENTATION___GENERATE_REMOVE__STRING_STRING;

    /**
     * The operation id for the '<em>Generate Remove All</em>' operation.
     * <!-- begin-user-doc -->
     * <!-- end-user-doc -->
     * @generated
     * @ordered
     */
    int OOPL_CLASS_REF_SIMPLE_COLLECTION_IMPLEMENTATION___GENERATE_REMOVE_ALL__STRING_STRING_STRING_STRING = BASE_CONTAINER_IMPLEMENTATION___GENERATE_REMOVE_ALL__STRING_STRING_STRING_STRING;

    /**
     * The operation id for the '<em>Generate Retain All</em>' operation.
     * <!-- begin-user-doc -->
     * <!-- end-user-doc -->
     * @generated
     * @ordered
     */
    int OOPL_CLASS_REF_SIMPLE_COLLECTION_IMPLEMENTATION___GENERATE_RETAIN_ALL__STRING_STRING_STRING = BASE_CONTAINER_IMPLEMENTATION___GENERATE_RETAIN_ALL__STRING_STRING_STRING;

    /**
     * The operation id for the '<em>Generate Size</em>' operation.
     * <!-- begin-user-doc -->
     * <!-- end-user-doc -->
     * @generated
     * @ordered
     */
    int OOPL_CLASS_REF_SIMPLE_COLLECTION_IMPLEMENTATION___GENERATE_SIZE__STRING_STRING = BASE_CONTAINER_IMPLEMENTATION___GENERATE_SIZE__STRING_STRING;

    /**
     * The operation id for the '<em>Generate Element At Index</em>' operation.
     * <!-- begin-user-doc -->
     * <!-- end-user-doc -->
     * @generated
     * @ordered
     */
    int OOPL_CLASS_REF_SIMPLE_COLLECTION_IMPLEMENTATION___GENERATE_ELEMENT_AT_INDEX__STRING_STRING_STRING_STRING = BASE_CONTAINER_IMPLEMENTATION_OPERATION_COUNT + 0;

    /**
     * The operation id for the '<em>Generate Insert Element At Index</em>' operation.
     * <!-- begin-user-doc -->
     * <!-- end-user-doc -->
     * @generated
     * @ordered
     */
    int OOPL_CLASS_REF_SIMPLE_COLLECTION_IMPLEMENTATION___GENERATE_INSERT_ELEMENT_AT_INDEX__STRING_STRING_STRING_STRING = BASE_CONTAINER_IMPLEMENTATION_OPERATION_COUNT + 1;

    /**
     * The operation id for the '<em>Generate Replace Element At Index</em>' operation.
     * <!-- begin-user-doc -->
     * <!-- end-user-doc -->
     * @generated
     * @ordered
     */
    int OOPL_CLASS_REF_SIMPLE_COLLECTION_IMPLEMENTATION___GENERATE_REPLACE_ELEMENT_AT_INDEX__STRING_STRING_STRING_STRING = BASE_CONTAINER_IMPLEMENTATION_OPERATION_COUNT + 2;

    /**
     * The number of operations of the '<em>OOPL Class Ref Simple Collection Implementation</em>' class.
     * <!-- begin-user-doc -->
     * <!-- end-user-doc -->
     * @generated
     * @ordered
     */
    int OOPL_CLASS_REF_SIMPLE_COLLECTION_IMPLEMENTATION_OPERATION_COUNT = BASE_CONTAINER_IMPLEMENTATION_OPERATION_COUNT + 3;

    /**
     * The meta object id for the '{@link com.ericsson.xtumlrt.oopl.impl.OOPLSequenceImplementationImpl <em>OOPL Sequence Implementation</em>}' class.
     * <!-- begin-user-doc -->
     * <!-- end-user-doc -->
     * @see com.ericsson.xtumlrt.oopl.impl.OOPLSequenceImplementationImpl
     * @see com.ericsson.xtumlrt.oopl.impl.OoplPackageImpl#getOOPLSequenceImplementation()
     * @generated
     */
    int OOPL_SEQUENCE_IMPLEMENTATION = 21;

    /**
     * The feature id for the '<em><b>Any Template</b></em>' attribute.
     * <!-- begin-user-doc -->
     * <!-- end-user-doc -->
     * @generated
     * @ordered
     */
    int OOPL_SEQUENCE_IMPLEMENTATION__ANY_TEMPLATE = BASE_CONTAINER_IMPLEMENTATION__ANY_TEMPLATE;

    /**
     * The feature id for the '<em><b>Add Template</b></em>' attribute.
     * <!-- begin-user-doc -->
     * <!-- end-user-doc -->
     * @generated
     * @ordered
     */
    int OOPL_SEQUENCE_IMPLEMENTATION__ADD_TEMPLATE = BASE_CONTAINER_IMPLEMENTATION__ADD_TEMPLATE;

    /**
     * The feature id for the '<em><b>Add All Template</b></em>' attribute.
     * <!-- begin-user-doc -->
     * <!-- end-user-doc -->
     * @generated
     * @ordered
     */
    int OOPL_SEQUENCE_IMPLEMENTATION__ADD_ALL_TEMPLATE = BASE_CONTAINER_IMPLEMENTATION__ADD_ALL_TEMPLATE;

    /**
     * The feature id for the '<em><b>Clear Template</b></em>' attribute.
     * <!-- begin-user-doc -->
     * <!-- end-user-doc -->
     * @generated
     * @ordered
     */
    int OOPL_SEQUENCE_IMPLEMENTATION__CLEAR_TEMPLATE = BASE_CONTAINER_IMPLEMENTATION__CLEAR_TEMPLATE;

    /**
     * The feature id for the '<em><b>Clone Template</b></em>' attribute.
     * <!-- begin-user-doc -->
     * <!-- end-user-doc -->
     * @generated
     * @ordered
     */
    int OOPL_SEQUENCE_IMPLEMENTATION__CLONE_TEMPLATE = BASE_CONTAINER_IMPLEMENTATION__CLONE_TEMPLATE;

    /**
     * The feature id for the '<em><b>Contains Template</b></em>' attribute.
     * <!-- begin-user-doc -->
     * <!-- end-user-doc -->
     * @generated
     * @ordered
     */
    int OOPL_SEQUENCE_IMPLEMENTATION__CONTAINS_TEMPLATE = BASE_CONTAINER_IMPLEMENTATION__CONTAINS_TEMPLATE;

    /**
     * The feature id for the '<em><b>Contains All Template</b></em>' attribute.
     * <!-- begin-user-doc -->
     * <!-- end-user-doc -->
     * @generated
     * @ordered
     */
    int OOPL_SEQUENCE_IMPLEMENTATION__CONTAINS_ALL_TEMPLATE = BASE_CONTAINER_IMPLEMENTATION__CONTAINS_ALL_TEMPLATE;

    /**
     * The feature id for the '<em><b>Count Of Template</b></em>' attribute.
     * <!-- begin-user-doc -->
     * <!-- end-user-doc -->
     * @generated
     * @ordered
     */
    int OOPL_SEQUENCE_IMPLEMENTATION__COUNT_OF_TEMPLATE = BASE_CONTAINER_IMPLEMENTATION__COUNT_OF_TEMPLATE;

    /**
     * The feature id for the '<em><b>Element At Index Template</b></em>' attribute.
     * <!-- begin-user-doc -->
     * <!-- end-user-doc -->
     * @generated
     * @ordered
     */
    int OOPL_SEQUENCE_IMPLEMENTATION__ELEMENT_AT_INDEX_TEMPLATE = BASE_CONTAINER_IMPLEMENTATION__ELEMENT_AT_INDEX_TEMPLATE;

    /**
     * The feature id for the '<em><b>Insert Element At Index Template</b></em>' attribute.
     * <!-- begin-user-doc -->
     * <!-- end-user-doc -->
     * @generated
     * @ordered
     */
    int OOPL_SEQUENCE_IMPLEMENTATION__INSERT_ELEMENT_AT_INDEX_TEMPLATE = BASE_CONTAINER_IMPLEMENTATION__INSERT_ELEMENT_AT_INDEX_TEMPLATE;

    /**
     * The feature id for the '<em><b>Is Empty Template</b></em>' attribute.
     * <!-- begin-user-doc -->
     * <!-- end-user-doc -->
     * @generated
     * @ordered
     */
    int OOPL_SEQUENCE_IMPLEMENTATION__IS_EMPTY_TEMPLATE = BASE_CONTAINER_IMPLEMENTATION__IS_EMPTY_TEMPLATE;

    /**
     * The feature id for the '<em><b>Remove Template</b></em>' attribute.
     * <!-- begin-user-doc -->
     * <!-- end-user-doc -->
     * @generated
     * @ordered
     */
    int OOPL_SEQUENCE_IMPLEMENTATION__REMOVE_TEMPLATE = BASE_CONTAINER_IMPLEMENTATION__REMOVE_TEMPLATE;

    /**
     * The feature id for the '<em><b>Remove All Template</b></em>' attribute.
     * <!-- begin-user-doc -->
     * <!-- end-user-doc -->
     * @generated
     * @ordered
     */
    int OOPL_SEQUENCE_IMPLEMENTATION__REMOVE_ALL_TEMPLATE = BASE_CONTAINER_IMPLEMENTATION__REMOVE_ALL_TEMPLATE;

    /**
     * The feature id for the '<em><b>Replace Element At Index Template</b></em>' attribute.
     * <!-- begin-user-doc -->
     * <!-- end-user-doc -->
     * @generated
     * @ordered
     */
    int OOPL_SEQUENCE_IMPLEMENTATION__REPLACE_ELEMENT_AT_INDEX_TEMPLATE = BASE_CONTAINER_IMPLEMENTATION__REPLACE_ELEMENT_AT_INDEX_TEMPLATE;

    /**
     * The feature id for the '<em><b>Retain All Template</b></em>' attribute.
     * <!-- begin-user-doc -->
     * <!-- end-user-doc -->
     * @generated
     * @ordered
     */
    int OOPL_SEQUENCE_IMPLEMENTATION__RETAIN_ALL_TEMPLATE = BASE_CONTAINER_IMPLEMENTATION__RETAIN_ALL_TEMPLATE;

    /**
     * The feature id for the '<em><b>Size Template</b></em>' attribute.
     * <!-- begin-user-doc -->
     * <!-- end-user-doc -->
     * @generated
     * @ordered
     */
    int OOPL_SEQUENCE_IMPLEMENTATION__SIZE_TEMPLATE = BASE_CONTAINER_IMPLEMENTATION__SIZE_TEMPLATE;

    /**
     * The feature id for the '<em><b>Container Qualified Name</b></em>' attribute.
     * <!-- begin-user-doc -->
     * <!-- end-user-doc -->
     * @generated
     * @ordered
     */
    int OOPL_SEQUENCE_IMPLEMENTATION__CONTAINER_QUALIFIED_NAME = BASE_CONTAINER_IMPLEMENTATION__CONTAINER_QUALIFIED_NAME;

    /**
     * The feature id for the '<em><b>Container Header Includes</b></em>' attribute list.
     * <!-- begin-user-doc -->
     * <!-- end-user-doc -->
     * @generated
     * @ordered
     */
    int OOPL_SEQUENCE_IMPLEMENTATION__CONTAINER_HEADER_INCLUDES = BASE_CONTAINER_IMPLEMENTATION__CONTAINER_HEADER_INCLUDES;

    /**
     * The feature id for the '<em><b>Uniqueness</b></em>' attribute.
     * <!-- begin-user-doc -->
     * <!-- end-user-doc -->
     * @generated
     * @ordered
     */
    int OOPL_SEQUENCE_IMPLEMENTATION__UNIQUENESS = BASE_CONTAINER_IMPLEMENTATION_FEATURE_COUNT + 0;

    /**
     * The feature id for the '<em><b>Orderedness</b></em>' attribute.
     * <!-- begin-user-doc -->
     * <!-- end-user-doc -->
     * @generated
     * @ordered
     */
    int OOPL_SEQUENCE_IMPLEMENTATION__ORDEREDNESS = BASE_CONTAINER_IMPLEMENTATION_FEATURE_COUNT + 1;

    /**
     * The number of structural features of the '<em>OOPL Sequence Implementation</em>' class.
     * <!-- begin-user-doc -->
     * <!-- end-user-doc -->
     * @generated
     * @ordered
     */
    int OOPL_SEQUENCE_IMPLEMENTATION_FEATURE_COUNT = BASE_CONTAINER_IMPLEMENTATION_FEATURE_COUNT + 2;

    /**
     * The operation id for the '<em>Generate Add</em>' operation.
     * <!-- begin-user-doc -->
     * <!-- end-user-doc -->
     * @generated
     * @ordered
     */
    int OOPL_SEQUENCE_IMPLEMENTATION___GENERATE_ADD__STRING_STRING_STRING = BASE_CONTAINER_IMPLEMENTATION___GENERATE_ADD__STRING_STRING_STRING;

    /**
     * The operation id for the '<em>Generate Add All</em>' operation.
     * <!-- begin-user-doc -->
     * <!-- end-user-doc -->
     * @generated
     * @ordered
     */
    int OOPL_SEQUENCE_IMPLEMENTATION___GENERATE_ADD_ALL__STRING_STRING = BASE_CONTAINER_IMPLEMENTATION___GENERATE_ADD_ALL__STRING_STRING;

    /**
     * The operation id for the '<em>Generate Clear</em>' operation.
     * <!-- begin-user-doc -->
     * <!-- end-user-doc -->
     * @generated
     * @ordered
     */
    int OOPL_SEQUENCE_IMPLEMENTATION___GENERATE_CLEAR__STRING = BASE_CONTAINER_IMPLEMENTATION___GENERATE_CLEAR__STRING;

    /**
     * The operation id for the '<em>Generate Clone</em>' operation.
     * <!-- begin-user-doc -->
     * <!-- end-user-doc -->
     * @generated
     * @ordered
     */
    int OOPL_SEQUENCE_IMPLEMENTATION___GENERATE_CLONE__STRING_STRING_STRING = BASE_CONTAINER_IMPLEMENTATION___GENERATE_CLONE__STRING_STRING_STRING;

    /**
     * The operation id for the '<em>Generate Contains</em>' operation.
     * <!-- begin-user-doc -->
     * <!-- end-user-doc -->
     * @generated
     * @ordered
     */
    int OOPL_SEQUENCE_IMPLEMENTATION___GENERATE_CONTAINS__STRING_STRING_STRING = BASE_CONTAINER_IMPLEMENTATION___GENERATE_CONTAINS__STRING_STRING_STRING;

    /**
     * The operation id for the '<em>Generate Contains All</em>' operation.
     * <!-- begin-user-doc -->
     * <!-- end-user-doc -->
     * @generated
     * @ordered
     */
    int OOPL_SEQUENCE_IMPLEMENTATION___GENERATE_CONTAINS_ALL__STRING_STRING_STRING_STRING_STRING = BASE_CONTAINER_IMPLEMENTATION___GENERATE_CONTAINS_ALL__STRING_STRING_STRING_STRING_STRING;

    /**
     * The operation id for the '<em>Generate Is Empty</em>' operation.
     * <!-- begin-user-doc -->
     * <!-- end-user-doc -->
     * @generated
     * @ordered
     */
    int OOPL_SEQUENCE_IMPLEMENTATION___GENERATE_IS_EMPTY__STRING_STRING = BASE_CONTAINER_IMPLEMENTATION___GENERATE_IS_EMPTY__STRING_STRING;

    /**
     * The operation id for the '<em>Generate Remove</em>' operation.
     * <!-- begin-user-doc -->
     * <!-- end-user-doc -->
     * @generated
     * @ordered
     */
    int OOPL_SEQUENCE_IMPLEMENTATION___GENERATE_REMOVE__STRING_STRING = BASE_CONTAINER_IMPLEMENTATION___GENERATE_REMOVE__STRING_STRING;

    /**
     * The operation id for the '<em>Generate Remove All</em>' operation.
     * <!-- begin-user-doc -->
     * <!-- end-user-doc -->
     * @generated
     * @ordered
     */
    int OOPL_SEQUENCE_IMPLEMENTATION___GENERATE_REMOVE_ALL__STRING_STRING_STRING_STRING = BASE_CONTAINER_IMPLEMENTATION___GENERATE_REMOVE_ALL__STRING_STRING_STRING_STRING;

    /**
     * The operation id for the '<em>Generate Retain All</em>' operation.
     * <!-- begin-user-doc -->
     * <!-- end-user-doc -->
     * @generated
     * @ordered
     */
    int OOPL_SEQUENCE_IMPLEMENTATION___GENERATE_RETAIN_ALL__STRING_STRING_STRING = BASE_CONTAINER_IMPLEMENTATION___GENERATE_RETAIN_ALL__STRING_STRING_STRING;

    /**
     * The operation id for the '<em>Generate Size</em>' operation.
     * <!-- begin-user-doc -->
     * <!-- end-user-doc -->
     * @generated
     * @ordered
     */
    int OOPL_SEQUENCE_IMPLEMENTATION___GENERATE_SIZE__STRING_STRING = BASE_CONTAINER_IMPLEMENTATION___GENERATE_SIZE__STRING_STRING;

    /**
     * The operation id for the '<em>Generate Any</em>' operation.
     * <!-- begin-user-doc -->
     * <!-- end-user-doc -->
     * @generated
     * @ordered
     */
    int OOPL_SEQUENCE_IMPLEMENTATION___GENERATE_ANY__STRING_STRING_STRING = BASE_CONTAINER_IMPLEMENTATION_OPERATION_COUNT + 0;

    /**
     * The operation id for the '<em>Generate Count Of</em>' operation.
     * <!-- begin-user-doc -->
     * <!-- end-user-doc -->
     * @generated
     * @ordered
     */
    int OOPL_SEQUENCE_IMPLEMENTATION___GENERATE_COUNT_OF__STRING_STRING_STRING = BASE_CONTAINER_IMPLEMENTATION_OPERATION_COUNT + 1;

    /**
     * The operation id for the '<em>Generate Element At Index</em>' operation.
     * <!-- begin-user-doc -->
     * <!-- end-user-doc -->
     * @generated
     * @ordered
     */
    int OOPL_SEQUENCE_IMPLEMENTATION___GENERATE_ELEMENT_AT_INDEX__STRING_STRING_STRING_STRING = BASE_CONTAINER_IMPLEMENTATION_OPERATION_COUNT + 2;

    /**
     * The operation id for the '<em>Generate Insert Element At Index</em>' operation.
     * <!-- begin-user-doc -->
     * <!-- end-user-doc -->
     * @generated
     * @ordered
     */
    int OOPL_SEQUENCE_IMPLEMENTATION___GENERATE_INSERT_ELEMENT_AT_INDEX__STRING_STRING_STRING_STRING = BASE_CONTAINER_IMPLEMENTATION_OPERATION_COUNT + 3;

    /**
     * The operation id for the '<em>Generate Replace Element At Index</em>' operation.
     * <!-- begin-user-doc -->
     * <!-- end-user-doc -->
     * @generated
     * @ordered
     */
    int OOPL_SEQUENCE_IMPLEMENTATION___GENERATE_REPLACE_ELEMENT_AT_INDEX__STRING_STRING_STRING_STRING = BASE_CONTAINER_IMPLEMENTATION_OPERATION_COUNT + 4;

    /**
     * The number of operations of the '<em>OOPL Sequence Implementation</em>' class.
     * <!-- begin-user-doc -->
     * <!-- end-user-doc -->
     * @generated
     * @ordered
     */
    int OOPL_SEQUENCE_IMPLEMENTATION_OPERATION_COUNT = BASE_CONTAINER_IMPLEMENTATION_OPERATION_COUNT + 5;

    /**
     * The meta object id for the '{@link com.ericsson.xtumlrt.oopl.SimpleCollectionKind <em>Simple Collection Kind</em>}' enum.
     * <!-- begin-user-doc -->
     * <!-- end-user-doc -->
     * @see com.ericsson.xtumlrt.oopl.SimpleCollectionKind
     * @see com.ericsson.xtumlrt.oopl.impl.OoplPackageImpl#getSimpleCollectionKind()
     * @generated
     */
    int SIMPLE_COLLECTION_KIND = 22;

    /**
     * The meta object id for the '{@link com.ericsson.xtumlrt.oopl.AssociativeCollectionKind <em>Associative Collection Kind</em>}' enum.
     * <!-- begin-user-doc -->
     * <!-- end-user-doc -->
     * @see com.ericsson.xtumlrt.oopl.AssociativeCollectionKind
     * @see com.ericsson.xtumlrt.oopl.impl.OoplPackageImpl#getAssociativeCollectionKind()
     * @generated
     */
    int ASSOCIATIVE_COLLECTION_KIND = 23;

    /**
     * The meta object id for the '{@link com.ericsson.xtumlrt.oopl.SequenceOrderednessKind <em>Sequence Orderedness Kind</em>}' enum.
     * <!-- begin-user-doc -->
     * <!-- end-user-doc -->
     * @see com.ericsson.xtumlrt.oopl.SequenceOrderednessKind
     * @see com.ericsson.xtumlrt.oopl.impl.OoplPackageImpl#getSequenceOrderednessKind()
     * @generated
     */
    int SEQUENCE_ORDEREDNESS_KIND = 24;

    /**
     * The meta object id for the '{@link com.ericsson.xtumlrt.oopl.SequenceUniquenessKind <em>Sequence Uniqueness Kind</em>}' enum.
     * <!-- begin-user-doc -->
     * <!-- end-user-doc -->
     * @see com.ericsson.xtumlrt.oopl.SequenceUniquenessKind
     * @see com.ericsson.xtumlrt.oopl.impl.OoplPackageImpl#getSequenceUniquenessKind()
     * @generated
     */
    int SEQUENCE_UNIQUENESS_KIND = 25;


    /**
     * Returns the meta object for class '{@link com.ericsson.xtumlrt.oopl.OOPLClass <em>OOPL Class</em>}'.
     * <!-- begin-user-doc -->
     * <!-- end-user-doc -->
     * @return the meta object for class '<em>OOPL Class</em>'.
     * @see com.ericsson.xtumlrt.oopl.OOPLClass
     * @generated
     */
    EClass getOOPLClass();

    /**
     * Returns the meta object for the reference '{@link com.ericsson.xtumlrt.oopl.OOPLClass#getXtClass <em>Xt Class</em>}'.
     * <!-- begin-user-doc -->
     * <!-- end-user-doc -->
     * @return the meta object for the reference '<em>Xt Class</em>'.
     * @see com.ericsson.xtumlrt.oopl.OOPLClass#getXtClass()
     * @see #getOOPLClass()
     * @generated
     */
    EReference getOOPLClass_XtClass();

    /**
     * Returns the meta object for the reference list '{@link com.ericsson.xtumlrt.oopl.OOPLClass#getReferenceStorage <em>Reference Storage</em>}'.
     * <!-- begin-user-doc -->
     * <!-- end-user-doc -->
     * @return the meta object for the reference list '<em>Reference Storage</em>'.
     * @see com.ericsson.xtumlrt.oopl.OOPLClass#getReferenceStorage()
     * @see #getOOPLClass()
     * @generated
     */
    EReference getOOPLClass_ReferenceStorage();

    /**
     * Returns the meta object for class '{@link com.ericsson.xtumlrt.oopl.OOPLType <em>OOPL Type</em>}'.
     * <!-- begin-user-doc -->
     * <!-- end-user-doc -->
     * @return the meta object for class '<em>OOPL Type</em>'.
     * @see com.ericsson.xtumlrt.oopl.OOPLType
     * @generated
     */
    EClass getOOPLType();

    /**
     * Returns the meta object for the reference '{@link com.ericsson.xtumlrt.oopl.OOPLType#getCommonType <em>Common Type</em>}'.
     * <!-- begin-user-doc -->
     * <!-- end-user-doc -->
     * @return the meta object for the reference '<em>Common Type</em>'.
     * @see com.ericsson.xtumlrt.oopl.OOPLType#getCommonType()
     * @see #getOOPLType()
     * @generated
     */
    EReference getOOPLType_CommonType();

    /**
     * Returns the meta object for class '{@link com.ericsson.xtumlrt.oopl.OOPLClassReference <em>OOPL Class Reference</em>}'.
     * <!-- begin-user-doc -->
     * <!-- end-user-doc -->
     * @return the meta object for class '<em>OOPL Class Reference</em>'.
     * @see com.ericsson.xtumlrt.oopl.OOPLClassReference
     * @generated
     */
    EClass getOOPLClassReference();

    /**
     * Returns the meta object for the reference '{@link com.ericsson.xtumlrt.oopl.OOPLClassReference#getOoplClass <em>Oopl Class</em>}'.
     * <!-- begin-user-doc -->
     * <!-- end-user-doc -->
     * @return the meta object for the reference '<em>Oopl Class</em>'.
     * @see com.ericsson.xtumlrt.oopl.OOPLClassReference#getOoplClass()
     * @see #getOOPLClassReference()
     * @generated
     */
    EReference getOOPLClassReference_OoplClass();

    /**
     * Returns the meta object for class '{@link com.ericsson.xtumlrt.oopl.OOPLClassReferenceCollection <em>OOPL Class Reference Collection</em>}'.
     * <!-- begin-user-doc -->
     * <!-- end-user-doc -->
     * @return the meta object for class '<em>OOPL Class Reference Collection</em>'.
     * @see com.ericsson.xtumlrt.oopl.OOPLClassReferenceCollection
     * @generated
     */
    EClass getOOPLClassReferenceCollection();

    /**
     * Returns the meta object for the reference '{@link com.ericsson.xtumlrt.oopl.OOPLClassReferenceCollection#getOoplClass <em>Oopl Class</em>}'.
     * <!-- begin-user-doc -->
     * <!-- end-user-doc -->
     * @return the meta object for the reference '<em>Oopl Class</em>'.
     * @see com.ericsson.xtumlrt.oopl.OOPLClassReferenceCollection#getOoplClass()
     * @see #getOOPLClassReferenceCollection()
     * @generated
     */
    EReference getOOPLClassReferenceCollection_OoplClass();

    /**
     * Returns the meta object for class '{@link com.ericsson.xtumlrt.oopl.OOPLClassRefSimpleCollection <em>OOPL Class Ref Simple Collection</em>}'.
     * <!-- begin-user-doc -->
     * <!-- end-user-doc -->
     * @return the meta object for class '<em>OOPL Class Ref Simple Collection</em>'.
     * @see com.ericsson.xtumlrt.oopl.OOPLClassRefSimpleCollection
     * @generated
     */
    EClass getOOPLClassRefSimpleCollection();

    /**
     * Returns the meta object for the attribute '{@link com.ericsson.xtumlrt.oopl.OOPLClassRefSimpleCollection#getKind <em>Kind</em>}'.
     * <!-- begin-user-doc -->
     * <!-- end-user-doc -->
     * @return the meta object for the attribute '<em>Kind</em>'.
     * @see com.ericsson.xtumlrt.oopl.OOPLClassRefSimpleCollection#getKind()
     * @see #getOOPLClassRefSimpleCollection()
     * @generated
     */
    EAttribute getOOPLClassRefSimpleCollection_Kind();

    /**
     * Returns the meta object for the reference '{@link com.ericsson.xtumlrt.oopl.OOPLClassRefSimpleCollection#getImplementation <em>Implementation</em>}'.
     * <!-- begin-user-doc -->
     * <!-- end-user-doc -->
     * @return the meta object for the reference '<em>Implementation</em>'.
     * @see com.ericsson.xtumlrt.oopl.OOPLClassRefSimpleCollection#getImplementation()
     * @see #getOOPLClassRefSimpleCollection()
     * @generated
     */
    EReference getOOPLClassRefSimpleCollection_Implementation();

    /**
     * Returns the meta object for class '{@link com.ericsson.xtumlrt.oopl.OOPLClassRefAssocCollection <em>OOPL Class Ref Assoc Collection</em>}'.
     * <!-- begin-user-doc -->
     * <!-- end-user-doc -->
     * @return the meta object for class '<em>OOPL Class Ref Assoc Collection</em>'.
     * @see com.ericsson.xtumlrt.oopl.OOPLClassRefAssocCollection
     * @generated
     */
    EClass getOOPLClassRefAssocCollection();

    /**
     * Returns the meta object for the reference '{@link com.ericsson.xtumlrt.oopl.OOPLClassRefAssocCollection#getKey <em>Key</em>}'.
     * <!-- begin-user-doc -->
     * <!-- end-user-doc -->
     * @return the meta object for the reference '<em>Key</em>'.
     * @see com.ericsson.xtumlrt.oopl.OOPLClassRefAssocCollection#getKey()
     * @see #getOOPLClassRefAssocCollection()
     * @generated
     */
    EReference getOOPLClassRefAssocCollection_Key();

    /**
     * Returns the meta object for the attribute '{@link com.ericsson.xtumlrt.oopl.OOPLClassRefAssocCollection#getKind <em>Kind</em>}'.
     * <!-- begin-user-doc -->
     * <!-- end-user-doc -->
     * @return the meta object for the attribute '<em>Kind</em>'.
     * @see com.ericsson.xtumlrt.oopl.OOPLClassRefAssocCollection#getKind()
     * @see #getOOPLClassRefAssocCollection()
     * @generated
     */
    EAttribute getOOPLClassRefAssocCollection_Kind();

    /**
     * Returns the meta object for the reference '{@link com.ericsson.xtumlrt.oopl.OOPLClassRefAssocCollection#getImplementation <em>Implementation</em>}'.
     * <!-- begin-user-doc -->
     * <!-- end-user-doc -->
     * @return the meta object for the reference '<em>Implementation</em>'.
     * @see com.ericsson.xtumlrt.oopl.OOPLClassRefAssocCollection#getImplementation()
     * @see #getOOPLClassRefAssocCollection()
     * @generated
     */
    EReference getOOPLClassRefAssocCollection_Implementation();

    /**
     * Returns the meta object for class '{@link com.ericsson.xtumlrt.oopl.OOPLClassReferenceStorage <em>OOPL Class Reference Storage</em>}'.
     * <!-- begin-user-doc -->
     * <!-- end-user-doc -->
     * @return the meta object for class '<em>OOPL Class Reference Storage</em>'.
     * @see com.ericsson.xtumlrt.oopl.OOPLClassReferenceStorage
     * @generated
     */
    EClass getOOPLClassReferenceStorage();

    /**
     * Returns the meta object for the reference '{@link com.ericsson.xtumlrt.oopl.OOPLClassReferenceStorage#getType <em>Type</em>}'.
     * <!-- begin-user-doc -->
     * <!-- end-user-doc -->
     * @return the meta object for the reference '<em>Type</em>'.
     * @see com.ericsson.xtumlrt.oopl.OOPLClassReferenceStorage#getType()
     * @see #getOOPLClassReferenceStorage()
     * @generated
     */
    EReference getOOPLClassReferenceStorage_Type();

    /**
     * Returns the meta object for the attribute '{@link com.ericsson.xtumlrt.oopl.OOPLClassReferenceStorage#isRequired <em>Required</em>}'.
     * <!-- begin-user-doc -->
     * <!-- end-user-doc -->
     * @return the meta object for the attribute '<em>Required</em>'.
     * @see com.ericsson.xtumlrt.oopl.OOPLClassReferenceStorage#isRequired()
     * @see #getOOPLClassReferenceStorage()
     * @generated
     */
    EAttribute getOOPLClassReferenceStorage_Required();

    /**
     * Returns the meta object for class '{@link com.ericsson.xtumlrt.oopl.OOPLRelation <em>OOPL Relation</em>}'.
     * <!-- begin-user-doc -->
     * <!-- end-user-doc -->
     * @return the meta object for class '<em>OOPL Relation</em>'.
     * @see com.ericsson.xtumlrt.oopl.OOPLRelation
     * @generated
     */
    EClass getOOPLRelation();

    /**
     * Returns the meta object for the reference '{@link com.ericsson.xtumlrt.oopl.OOPLRelation#getXtRelation <em>Xt Relation</em>}'.
     * <!-- begin-user-doc -->
     * <!-- end-user-doc -->
     * @return the meta object for the reference '<em>Xt Relation</em>'.
     * @see com.ericsson.xtumlrt.oopl.OOPLRelation#getXtRelation()
     * @see #getOOPLRelation()
     * @generated
     */
    EReference getOOPLRelation_XtRelation();

    /**
     * Returns the meta object for the reference list '{@link com.ericsson.xtumlrt.oopl.OOPLRelation#getReferenceStorage <em>Reference Storage</em>}'.
     * <!-- begin-user-doc -->
     * <!-- end-user-doc -->
     * @return the meta object for the reference list '<em>Reference Storage</em>'.
     * @see com.ericsson.xtumlrt.oopl.OOPLRelation#getReferenceStorage()
     * @see #getOOPLRelation()
     * @generated
     */
    EReference getOOPLRelation_ReferenceStorage();

    /**
     * Returns the meta object for class '{@link com.ericsson.xtumlrt.oopl.OOPLNameProvider <em>OOPL Name Provider</em>}'.
     * <!-- begin-user-doc -->
     * <!-- end-user-doc -->
     * @return the meta object for class '<em>OOPL Name Provider</em>'.
     * @see com.ericsson.xtumlrt.oopl.OOPLNameProvider
     * @generated
     */
    EClass getOOPLNameProvider();

    /**
     * Returns the meta object for class '{@link com.ericsson.xtumlrt.oopl.OOPLDerivedNameProvider <em>OOPL Derived Name Provider</em>}'.
     * <!-- begin-user-doc -->
     * <!-- end-user-doc -->
     * @return the meta object for class '<em>OOPL Derived Name Provider</em>'.
     * @see com.ericsson.xtumlrt.oopl.OOPLDerivedNameProvider
     * @generated
     */
    EClass getOOPLDerivedNameProvider();

    /**
     * Returns the meta object for the attribute '{@link com.ericsson.xtumlrt.oopl.OOPLDerivedNameProvider#getName <em>Name</em>}'.
     * <!-- begin-user-doc -->
     * <!-- end-user-doc -->
     * @return the meta object for the attribute '<em>Name</em>'.
     * @see com.ericsson.xtumlrt.oopl.OOPLDerivedNameProvider#getName()
     * @see #getOOPLDerivedNameProvider()
     * @generated
     */
    EAttribute getOOPLDerivedNameProvider_Name();

    /**
     * Returns the meta object for class '{@link com.ericsson.xtumlrt.oopl.OOPLExistingNameProvider <em>OOPL Existing Name Provider</em>}'.
     * <!-- begin-user-doc -->
     * <!-- end-user-doc -->
     * @return the meta object for class '<em>OOPL Existing Name Provider</em>'.
     * @see com.ericsson.xtumlrt.oopl.OOPLExistingNameProvider
     * @generated
     */
    EClass getOOPLExistingNameProvider();

    /**
     * Returns the meta object for the reference '{@link com.ericsson.xtumlrt.oopl.OOPLExistingNameProvider#getCommonNamedElement <em>Common Named Element</em>}'.
     * <!-- begin-user-doc -->
     * <!-- end-user-doc -->
     * @return the meta object for the reference '<em>Common Named Element</em>'.
     * @see com.ericsson.xtumlrt.oopl.OOPLExistingNameProvider#getCommonNamedElement()
     * @see #getOOPLExistingNameProvider()
     * @generated
     */
    EReference getOOPLExistingNameProvider_CommonNamedElement();

    /**
     * Returns the meta object for class '{@link com.ericsson.xtumlrt.oopl.OOPLBasicType <em>OOPL Basic Type</em>}'.
     * <!-- begin-user-doc -->
     * <!-- end-user-doc -->
     * @return the meta object for class '<em>OOPL Basic Type</em>'.
     * @see com.ericsson.xtumlrt.oopl.OOPLBasicType
     * @generated
     */
    EClass getOOPLBasicType();

    /**
     * Returns the meta object for class '{@link com.ericsson.xtumlrt.oopl.OOPLEnumType <em>OOPL Enum Type</em>}'.
     * <!-- begin-user-doc -->
     * <!-- end-user-doc -->
     * @return the meta object for class '<em>OOPL Enum Type</em>'.
     * @see com.ericsson.xtumlrt.oopl.OOPLEnumType
     * @generated
     */
    EClass getOOPLEnumType();

    /**
     * Returns the meta object for the reference list '{@link com.ericsson.xtumlrt.oopl.OOPLEnumType#getEnumerators <em>Enumerators</em>}'.
     * <!-- begin-user-doc -->
     * <!-- end-user-doc -->
     * @return the meta object for the reference list '<em>Enumerators</em>'.
     * @see com.ericsson.xtumlrt.oopl.OOPLEnumType#getEnumerators()
     * @see #getOOPLEnumType()
     * @generated
     */
    EReference getOOPLEnumType_Enumerators();

    /**
     * Returns the meta object for the reference '{@link com.ericsson.xtumlrt.oopl.OOPLEnumType#getDefaultValue <em>Default Value</em>}'.
     * <!-- begin-user-doc -->
     * <!-- end-user-doc -->
     * @return the meta object for the reference '<em>Default Value</em>'.
     * @see com.ericsson.xtumlrt.oopl.OOPLEnumType#getDefaultValue()
     * @see #getOOPLEnumType()
     * @generated
     */
    EReference getOOPLEnumType_DefaultValue();

    /**
     * Returns the meta object for class '{@link com.ericsson.xtumlrt.oopl.OOPLEnumerator <em>OOPL Enumerator</em>}'.
     * <!-- begin-user-doc -->
     * <!-- end-user-doc -->
     * @return the meta object for class '<em>OOPL Enumerator</em>'.
     * @see com.ericsson.xtumlrt.oopl.OOPLEnumerator
     * @generated
     */
    EClass getOOPLEnumerator();

    /**
     * Returns the meta object for the reference '{@link com.ericsson.xtumlrt.oopl.OOPLEnumerator#getCommonEnumerationLiteral <em>Common Enumeration Literal</em>}'.
     * <!-- begin-user-doc -->
     * <!-- end-user-doc -->
     * @return the meta object for the reference '<em>Common Enumeration Literal</em>'.
     * @see com.ericsson.xtumlrt.oopl.OOPLEnumerator#getCommonEnumerationLiteral()
     * @see #getOOPLEnumerator()
     * @generated
     */
    EReference getOOPLEnumerator_CommonEnumerationLiteral();

    /**
     * Returns the meta object for class '{@link com.ericsson.xtumlrt.oopl.OOPLStructType <em>OOPL Struct Type</em>}'.
     * <!-- begin-user-doc -->
     * <!-- end-user-doc -->
     * @return the meta object for class '<em>OOPL Struct Type</em>'.
     * @see com.ericsson.xtumlrt.oopl.OOPLStructType
     * @generated
     */
    EClass getOOPLStructType();

    /**
     * Returns the meta object for the reference list '{@link com.ericsson.xtumlrt.oopl.OOPLStructType#getMembers <em>Members</em>}'.
     * <!-- begin-user-doc -->
     * <!-- end-user-doc -->
     * @return the meta object for the reference list '<em>Members</em>'.
     * @see com.ericsson.xtumlrt.oopl.OOPLStructType#getMembers()
     * @see #getOOPLStructType()
     * @generated
     */
    EReference getOOPLStructType_Members();

    /**
     * Returns the meta object for class '{@link com.ericsson.xtumlrt.oopl.OOPLStructMember <em>OOPL Struct Member</em>}'.
     * <!-- begin-user-doc -->
     * <!-- end-user-doc -->
     * @return the meta object for class '<em>OOPL Struct Member</em>'.
     * @see com.ericsson.xtumlrt.oopl.OOPLStructMember
     * @generated
     */
    EClass getOOPLStructMember();

    /**
     * Returns the meta object for the reference '{@link com.ericsson.xtumlrt.oopl.OOPLStructMember#getCommonMember <em>Common Member</em>}'.
     * <!-- begin-user-doc -->
     * <!-- end-user-doc -->
     * @return the meta object for the reference '<em>Common Member</em>'.
     * @see com.ericsson.xtumlrt.oopl.OOPLStructMember#getCommonMember()
     * @see #getOOPLStructMember()
     * @generated
     */
    EReference getOOPLStructMember_CommonMember();

    /**
     * Returns the meta object for the reference '{@link com.ericsson.xtumlrt.oopl.OOPLStructMember#getType <em>Type</em>}'.
     * <!-- begin-user-doc -->
     * <!-- end-user-doc -->
     * @return the meta object for the reference '<em>Type</em>'.
     * @see com.ericsson.xtumlrt.oopl.OOPLStructMember#getType()
     * @see #getOOPLStructMember()
     * @generated
     */
    EReference getOOPLStructMember_Type();

    /**
     * Returns the meta object for class '{@link com.ericsson.xtumlrt.oopl.OOPLSequence <em>OOPL Sequence</em>}'.
     * <!-- begin-user-doc -->
     * <!-- end-user-doc -->
     * @return the meta object for class '<em>OOPL Sequence</em>'.
     * @see com.ericsson.xtumlrt.oopl.OOPLSequence
     * @generated
     */
    EClass getOOPLSequence();

    /**
     * Returns the meta object for the reference '{@link com.ericsson.xtumlrt.oopl.OOPLSequence#getElementType <em>Element Type</em>}'.
     * <!-- begin-user-doc -->
     * <!-- end-user-doc -->
     * @return the meta object for the reference '<em>Element Type</em>'.
     * @see com.ericsson.xtumlrt.oopl.OOPLSequence#getElementType()
     * @see #getOOPLSequence()
     * @generated
     */
    EReference getOOPLSequence_ElementType();

    /**
     * Returns the meta object for the attribute '{@link com.ericsson.xtumlrt.oopl.OOPLSequence#getOrderedness <em>Orderedness</em>}'.
     * <!-- begin-user-doc -->
     * <!-- end-user-doc -->
     * @return the meta object for the attribute '<em>Orderedness</em>'.
     * @see com.ericsson.xtumlrt.oopl.OOPLSequence#getOrderedness()
     * @see #getOOPLSequence()
     * @generated
     */
    EAttribute getOOPLSequence_Orderedness();

    /**
     * Returns the meta object for the attribute '{@link com.ericsson.xtumlrt.oopl.OOPLSequence#getUniqueness <em>Uniqueness</em>}'.
     * <!-- begin-user-doc -->
     * <!-- end-user-doc -->
     * @return the meta object for the attribute '<em>Uniqueness</em>'.
     * @see com.ericsson.xtumlrt.oopl.OOPLSequence#getUniqueness()
     * @see #getOOPLSequence()
     * @generated
     */
    EAttribute getOOPLSequence_Uniqueness();

    /**
     * Returns the meta object for the reference '{@link com.ericsson.xtumlrt.oopl.OOPLSequence#getImplementation <em>Implementation</em>}'.
     * <!-- begin-user-doc -->
     * <!-- end-user-doc -->
     * @return the meta object for the reference '<em>Implementation</em>'.
     * @see com.ericsson.xtumlrt.oopl.OOPLSequence#getImplementation()
     * @see #getOOPLSequence()
     * @generated
     */
    EReference getOOPLSequence_Implementation();

    /**
     * Returns the meta object for class '{@link com.ericsson.xtumlrt.oopl.OOPLUserDefinedType <em>OOPL User Defined Type</em>}'.
     * <!-- begin-user-doc -->
     * <!-- end-user-doc -->
     * @return the meta object for class '<em>OOPL User Defined Type</em>'.
     * @see com.ericsson.xtumlrt.oopl.OOPLUserDefinedType
     * @generated
     */
    EClass getOOPLUserDefinedType();

    /**
     * Returns the meta object for the reference '{@link com.ericsson.xtumlrt.oopl.OOPLUserDefinedType#getBaseType <em>Base Type</em>}'.
     * <!-- begin-user-doc -->
     * <!-- end-user-doc -->
     * @return the meta object for the reference '<em>Base Type</em>'.
     * @see com.ericsson.xtumlrt.oopl.OOPLUserDefinedType#getBaseType()
     * @see #getOOPLUserDefinedType()
     * @generated
     */
    EReference getOOPLUserDefinedType_BaseType();

    /**
     * Returns the meta object for class '{@link com.ericsson.xtumlrt.oopl.BaseContainerImplementation <em>Base Container Implementation</em>}'.
     * <!-- begin-user-doc -->
     * <!-- end-user-doc -->
     * @return the meta object for class '<em>Base Container Implementation</em>'.
     * @see com.ericsson.xtumlrt.oopl.BaseContainerImplementation
     * @generated
     */
    EClass getBaseContainerImplementation();

    /**
     * Returns the meta object for the attribute '{@link com.ericsson.xtumlrt.oopl.BaseContainerImplementation#getAnyTemplate <em>Any Template</em>}'.
     * <!-- begin-user-doc -->
     * <!-- end-user-doc -->
     * @return the meta object for the attribute '<em>Any Template</em>'.
     * @see com.ericsson.xtumlrt.oopl.BaseContainerImplementation#getAnyTemplate()
     * @see #getBaseContainerImplementation()
     * @generated
     */
    EAttribute getBaseContainerImplementation_AnyTemplate();

    /**
     * Returns the meta object for the attribute '{@link com.ericsson.xtumlrt.oopl.BaseContainerImplementation#getAddTemplate <em>Add Template</em>}'.
     * <!-- begin-user-doc -->
     * <!-- end-user-doc -->
     * @return the meta object for the attribute '<em>Add Template</em>'.
     * @see com.ericsson.xtumlrt.oopl.BaseContainerImplementation#getAddTemplate()
     * @see #getBaseContainerImplementation()
     * @generated
     */
    EAttribute getBaseContainerImplementation_AddTemplate();

    /**
     * Returns the meta object for the attribute '{@link com.ericsson.xtumlrt.oopl.BaseContainerImplementation#getAddAllTemplate <em>Add All Template</em>}'.
     * <!-- begin-user-doc -->
     * <!-- end-user-doc -->
     * @return the meta object for the attribute '<em>Add All Template</em>'.
     * @see com.ericsson.xtumlrt.oopl.BaseContainerImplementation#getAddAllTemplate()
     * @see #getBaseContainerImplementation()
     * @generated
     */
    EAttribute getBaseContainerImplementation_AddAllTemplate();

    /**
     * Returns the meta object for the attribute '{@link com.ericsson.xtumlrt.oopl.BaseContainerImplementation#getClearTemplate <em>Clear Template</em>}'.
     * <!-- begin-user-doc -->
     * <!-- end-user-doc -->
     * @return the meta object for the attribute '<em>Clear Template</em>'.
     * @see com.ericsson.xtumlrt.oopl.BaseContainerImplementation#getClearTemplate()
     * @see #getBaseContainerImplementation()
     * @generated
     */
    EAttribute getBaseContainerImplementation_ClearTemplate();

    /**
     * Returns the meta object for the attribute '{@link com.ericsson.xtumlrt.oopl.BaseContainerImplementation#getCloneTemplate <em>Clone Template</em>}'.
     * <!-- begin-user-doc -->
     * <!-- end-user-doc -->
     * @return the meta object for the attribute '<em>Clone Template</em>'.
     * @see com.ericsson.xtumlrt.oopl.BaseContainerImplementation#getCloneTemplate()
     * @see #getBaseContainerImplementation()
     * @generated
     */
    EAttribute getBaseContainerImplementation_CloneTemplate();

    /**
     * Returns the meta object for the attribute '{@link com.ericsson.xtumlrt.oopl.BaseContainerImplementation#getContainsTemplate <em>Contains Template</em>}'.
     * <!-- begin-user-doc -->
     * <!-- end-user-doc -->
     * @return the meta object for the attribute '<em>Contains Template</em>'.
     * @see com.ericsson.xtumlrt.oopl.BaseContainerImplementation#getContainsTemplate()
     * @see #getBaseContainerImplementation()
     * @generated
     */
    EAttribute getBaseContainerImplementation_ContainsTemplate();

    /**
     * Returns the meta object for the attribute '{@link com.ericsson.xtumlrt.oopl.BaseContainerImplementation#getContainsAllTemplate <em>Contains All Template</em>}'.
     * <!-- begin-user-doc -->
     * <!-- end-user-doc -->
     * @return the meta object for the attribute '<em>Contains All Template</em>'.
     * @see com.ericsson.xtumlrt.oopl.BaseContainerImplementation#getContainsAllTemplate()
     * @see #getBaseContainerImplementation()
     * @generated
     */
    EAttribute getBaseContainerImplementation_ContainsAllTemplate();

    /**
     * Returns the meta object for the attribute '{@link com.ericsson.xtumlrt.oopl.BaseContainerImplementation#getCountOfTemplate <em>Count Of Template</em>}'.
     * <!-- begin-user-doc -->
     * <!-- end-user-doc -->
     * @return the meta object for the attribute '<em>Count Of Template</em>'.
     * @see com.ericsson.xtumlrt.oopl.BaseContainerImplementation#getCountOfTemplate()
     * @see #getBaseContainerImplementation()
     * @generated
     */
    EAttribute getBaseContainerImplementation_CountOfTemplate();

    /**
     * Returns the meta object for the attribute '{@link com.ericsson.xtumlrt.oopl.BaseContainerImplementation#getElementAtIndexTemplate <em>Element At Index Template</em>}'.
     * <!-- begin-user-doc -->
     * <!-- end-user-doc -->
     * @return the meta object for the attribute '<em>Element At Index Template</em>'.
     * @see com.ericsson.xtumlrt.oopl.BaseContainerImplementation#getElementAtIndexTemplate()
     * @see #getBaseContainerImplementation()
     * @generated
     */
    EAttribute getBaseContainerImplementation_ElementAtIndexTemplate();

    /**
     * Returns the meta object for the attribute '{@link com.ericsson.xtumlrt.oopl.BaseContainerImplementation#getInsertElementAtIndexTemplate <em>Insert Element At Index Template</em>}'.
     * <!-- begin-user-doc -->
     * <!-- end-user-doc -->
     * @return the meta object for the attribute '<em>Insert Element At Index Template</em>'.
     * @see com.ericsson.xtumlrt.oopl.BaseContainerImplementation#getInsertElementAtIndexTemplate()
     * @see #getBaseContainerImplementation()
     * @generated
     */
    EAttribute getBaseContainerImplementation_InsertElementAtIndexTemplate();

    /**
     * Returns the meta object for the attribute '{@link com.ericsson.xtumlrt.oopl.BaseContainerImplementation#getIsEmptyTemplate <em>Is Empty Template</em>}'.
     * <!-- begin-user-doc -->
     * <!-- end-user-doc -->
     * @return the meta object for the attribute '<em>Is Empty Template</em>'.
     * @see com.ericsson.xtumlrt.oopl.BaseContainerImplementation#getIsEmptyTemplate()
     * @see #getBaseContainerImplementation()
     * @generated
     */
    EAttribute getBaseContainerImplementation_IsEmptyTemplate();

    /**
     * Returns the meta object for the attribute '{@link com.ericsson.xtumlrt.oopl.BaseContainerImplementation#getRemoveTemplate <em>Remove Template</em>}'.
     * <!-- begin-user-doc -->
     * <!-- end-user-doc -->
     * @return the meta object for the attribute '<em>Remove Template</em>'.
     * @see com.ericsson.xtumlrt.oopl.BaseContainerImplementation#getRemoveTemplate()
     * @see #getBaseContainerImplementation()
     * @generated
     */
    EAttribute getBaseContainerImplementation_RemoveTemplate();

    /**
     * Returns the meta object for the attribute '{@link com.ericsson.xtumlrt.oopl.BaseContainerImplementation#getRemoveAllTemplate <em>Remove All Template</em>}'.
     * <!-- begin-user-doc -->
     * <!-- end-user-doc -->
     * @return the meta object for the attribute '<em>Remove All Template</em>'.
     * @see com.ericsson.xtumlrt.oopl.BaseContainerImplementation#getRemoveAllTemplate()
     * @see #getBaseContainerImplementation()
     * @generated
     */
    EAttribute getBaseContainerImplementation_RemoveAllTemplate();

    /**
     * Returns the meta object for the attribute '{@link com.ericsson.xtumlrt.oopl.BaseContainerImplementation#getReplaceElementAtIndexTemplate <em>Replace Element At Index Template</em>}'.
     * <!-- begin-user-doc -->
     * <!-- end-user-doc -->
     * @return the meta object for the attribute '<em>Replace Element At Index Template</em>'.
     * @see com.ericsson.xtumlrt.oopl.BaseContainerImplementation#getReplaceElementAtIndexTemplate()
     * @see #getBaseContainerImplementation()
     * @generated
     */
    EAttribute getBaseContainerImplementation_ReplaceElementAtIndexTemplate();

    /**
     * Returns the meta object for the attribute '{@link com.ericsson.xtumlrt.oopl.BaseContainerImplementation#getRetainAllTemplate <em>Retain All Template</em>}'.
     * <!-- begin-user-doc -->
     * <!-- end-user-doc -->
     * @return the meta object for the attribute '<em>Retain All Template</em>'.
     * @see com.ericsson.xtumlrt.oopl.BaseContainerImplementation#getRetainAllTemplate()
     * @see #getBaseContainerImplementation()
     * @generated
     */
    EAttribute getBaseContainerImplementation_RetainAllTemplate();

    /**
     * Returns the meta object for the attribute '{@link com.ericsson.xtumlrt.oopl.BaseContainerImplementation#getSizeTemplate <em>Size Template</em>}'.
     * <!-- begin-user-doc -->
     * <!-- end-user-doc -->
     * @return the meta object for the attribute '<em>Size Template</em>'.
     * @see com.ericsson.xtumlrt.oopl.BaseContainerImplementation#getSizeTemplate()
     * @see #getBaseContainerImplementation()
     * @generated
     */
    EAttribute getBaseContainerImplementation_SizeTemplate();

    /**
     * Returns the meta object for the attribute '{@link com.ericsson.xtumlrt.oopl.BaseContainerImplementation#getContainerQualifiedName <em>Container Qualified Name</em>}'.
     * <!-- begin-user-doc -->
     * <!-- end-user-doc -->
     * @return the meta object for the attribute '<em>Container Qualified Name</em>'.
     * @see com.ericsson.xtumlrt.oopl.BaseContainerImplementation#getContainerQualifiedName()
     * @see #getBaseContainerImplementation()
     * @generated
     */
    EAttribute getBaseContainerImplementation_ContainerQualifiedName();

    /**
     * Returns the meta object for the attribute list '{@link com.ericsson.xtumlrt.oopl.BaseContainerImplementation#getContainerHeaderIncludes <em>Container Header Includes</em>}'.
     * <!-- begin-user-doc -->
     * <!-- end-user-doc -->
     * @return the meta object for the attribute list '<em>Container Header Includes</em>'.
     * @see com.ericsson.xtumlrt.oopl.BaseContainerImplementation#getContainerHeaderIncludes()
     * @see #getBaseContainerImplementation()
     * @generated
     */
    EAttribute getBaseContainerImplementation_ContainerHeaderIncludes();

    /**
     * Returns the meta object for the '{@link com.ericsson.xtumlrt.oopl.BaseContainerImplementation#generateAdd(java.lang.String, java.lang.String, java.lang.String) <em>Generate Add</em>}' operation.
     * <!-- begin-user-doc -->
     * <!-- end-user-doc -->
     * @return the meta object for the '<em>Generate Add</em>' operation.
     * @see com.ericsson.xtumlrt.oopl.BaseContainerImplementation#generateAdd(java.lang.String, java.lang.String, java.lang.String)
     * @generated
     */
    EOperation getBaseContainerImplementation__GenerateAdd__String_String_String();

    /**
     * Returns the meta object for the '{@link com.ericsson.xtumlrt.oopl.BaseContainerImplementation#generateAddAll(java.lang.String, java.lang.String) <em>Generate Add All</em>}' operation.
     * <!-- begin-user-doc -->
     * <!-- end-user-doc -->
     * @return the meta object for the '<em>Generate Add All</em>' operation.
     * @see com.ericsson.xtumlrt.oopl.BaseContainerImplementation#generateAddAll(java.lang.String, java.lang.String)
     * @generated
     */
    EOperation getBaseContainerImplementation__GenerateAddAll__String_String();

    /**
     * Returns the meta object for the '{@link com.ericsson.xtumlrt.oopl.BaseContainerImplementation#generateClear(java.lang.String) <em>Generate Clear</em>}' operation.
     * <!-- begin-user-doc -->
     * <!-- end-user-doc -->
     * @return the meta object for the '<em>Generate Clear</em>' operation.
     * @see com.ericsson.xtumlrt.oopl.BaseContainerImplementation#generateClear(java.lang.String)
     * @generated
     */
    EOperation getBaseContainerImplementation__GenerateClear__String();

    /**
     * Returns the meta object for the '{@link com.ericsson.xtumlrt.oopl.BaseContainerImplementation#generateClone(java.lang.String, java.lang.String, java.lang.String) <em>Generate Clone</em>}' operation.
     * <!-- begin-user-doc -->
     * <!-- end-user-doc -->
     * @return the meta object for the '<em>Generate Clone</em>' operation.
     * @see com.ericsson.xtumlrt.oopl.BaseContainerImplementation#generateClone(java.lang.String, java.lang.String, java.lang.String)
     * @generated
     */
    EOperation getBaseContainerImplementation__GenerateClone__String_String_String();

    /**
     * Returns the meta object for the '{@link com.ericsson.xtumlrt.oopl.BaseContainerImplementation#generateContains(java.lang.String, java.lang.String, java.lang.String) <em>Generate Contains</em>}' operation.
     * <!-- begin-user-doc -->
     * <!-- end-user-doc -->
     * @return the meta object for the '<em>Generate Contains</em>' operation.
     * @see com.ericsson.xtumlrt.oopl.BaseContainerImplementation#generateContains(java.lang.String, java.lang.String, java.lang.String)
     * @generated
     */
    EOperation getBaseContainerImplementation__GenerateContains__String_String_String();

    /**
     * Returns the meta object for the '{@link com.ericsson.xtumlrt.oopl.BaseContainerImplementation#generateContainsAll(java.lang.String, java.lang.String, java.lang.String, java.lang.String, java.lang.String) <em>Generate Contains All</em>}' operation.
     * <!-- begin-user-doc -->
     * <!-- end-user-doc -->
     * @return the meta object for the '<em>Generate Contains All</em>' operation.
     * @see com.ericsson.xtumlrt.oopl.BaseContainerImplementation#generateContainsAll(java.lang.String, java.lang.String, java.lang.String, java.lang.String, java.lang.String)
     * @generated
     */
    EOperation getBaseContainerImplementation__GenerateContainsAll__String_String_String_String_String();

    /**
     * Returns the meta object for the '{@link com.ericsson.xtumlrt.oopl.BaseContainerImplementation#generateIsEmpty(java.lang.String, java.lang.String) <em>Generate Is Empty</em>}' operation.
     * <!-- begin-user-doc -->
     * <!-- end-user-doc -->
     * @return the meta object for the '<em>Generate Is Empty</em>' operation.
     * @see com.ericsson.xtumlrt.oopl.BaseContainerImplementation#generateIsEmpty(java.lang.String, java.lang.String)
     * @generated
     */
    EOperation getBaseContainerImplementation__GenerateIsEmpty__String_String();

    /**
     * Returns the meta object for the '{@link com.ericsson.xtumlrt.oopl.BaseContainerImplementation#generateRemove(java.lang.String, java.lang.String) <em>Generate Remove</em>}' operation.
     * <!-- begin-user-doc -->
     * <!-- end-user-doc -->
     * @return the meta object for the '<em>Generate Remove</em>' operation.
     * @see com.ericsson.xtumlrt.oopl.BaseContainerImplementation#generateRemove(java.lang.String, java.lang.String)
     * @generated
     */
    EOperation getBaseContainerImplementation__GenerateRemove__String_String();

    /**
     * Returns the meta object for the '{@link com.ericsson.xtumlrt.oopl.BaseContainerImplementation#generateRemoveAll(java.lang.String, java.lang.String, java.lang.String, java.lang.String) <em>Generate Remove All</em>}' operation.
     * <!-- begin-user-doc -->
     * <!-- end-user-doc -->
     * @return the meta object for the '<em>Generate Remove All</em>' operation.
     * @see com.ericsson.xtumlrt.oopl.BaseContainerImplementation#generateRemoveAll(java.lang.String, java.lang.String, java.lang.String, java.lang.String)
     * @generated
     */
    EOperation getBaseContainerImplementation__GenerateRemoveAll__String_String_String_String();

    /**
     * Returns the meta object for the '{@link com.ericsson.xtumlrt.oopl.BaseContainerImplementation#generateRetainAll(java.lang.String, java.lang.String, java.lang.String) <em>Generate Retain All</em>}' operation.
     * <!-- begin-user-doc -->
     * <!-- end-user-doc -->
     * @return the meta object for the '<em>Generate Retain All</em>' operation.
     * @see com.ericsson.xtumlrt.oopl.BaseContainerImplementation#generateRetainAll(java.lang.String, java.lang.String, java.lang.String)
     * @generated
     */
    EOperation getBaseContainerImplementation__GenerateRetainAll__String_String_String();

    /**
     * Returns the meta object for the '{@link com.ericsson.xtumlrt.oopl.BaseContainerImplementation#generateSize(java.lang.String, java.lang.String) <em>Generate Size</em>}' operation.
     * <!-- begin-user-doc -->
     * <!-- end-user-doc -->
     * @return the meta object for the '<em>Generate Size</em>' operation.
     * @see com.ericsson.xtumlrt.oopl.BaseContainerImplementation#generateSize(java.lang.String, java.lang.String)
     * @generated
     */
    EOperation getBaseContainerImplementation__GenerateSize__String_String();

    /**
     * Returns the meta object for class '{@link com.ericsson.xtumlrt.oopl.OOPLClassRefAssocCollectionImplementation <em>OOPL Class Ref Assoc Collection Implementation</em>}'.
     * <!-- begin-user-doc -->
     * <!-- end-user-doc -->
     * @return the meta object for class '<em>OOPL Class Ref Assoc Collection Implementation</em>'.
     * @see com.ericsson.xtumlrt.oopl.OOPLClassRefAssocCollectionImplementation
     * @generated
     */
    EClass getOOPLClassRefAssocCollectionImplementation();

    /**
     * Returns the meta object for the attribute '{@link com.ericsson.xtumlrt.oopl.OOPLClassRefAssocCollectionImplementation#getKind <em>Kind</em>}'.
     * <!-- begin-user-doc -->
     * <!-- end-user-doc -->
     * @return the meta object for the attribute '<em>Kind</em>'.
     * @see com.ericsson.xtumlrt.oopl.OOPLClassRefAssocCollectionImplementation#getKind()
     * @see #getOOPLClassRefAssocCollectionImplementation()
     * @generated
     */
    EAttribute getOOPLClassRefAssocCollectionImplementation_Kind();

    /**
     * Returns the meta object for the '{@link com.ericsson.xtumlrt.oopl.OOPLClassRefAssocCollectionImplementation#generateCountOf(java.lang.String, java.lang.String, java.lang.String) <em>Generate Count Of</em>}' operation.
     * <!-- begin-user-doc -->
     * <!-- end-user-doc -->
     * @return the meta object for the '<em>Generate Count Of</em>' operation.
     * @see com.ericsson.xtumlrt.oopl.OOPLClassRefAssocCollectionImplementation#generateCountOf(java.lang.String, java.lang.String, java.lang.String)
     * @generated
     */
    EOperation getOOPLClassRefAssocCollectionImplementation__GenerateCountOf__String_String_String();

    /**
     * Returns the meta object for the '{@link com.ericsson.xtumlrt.oopl.OOPLClassRefAssocCollectionImplementation#generateAny(java.lang.String, java.lang.String, java.lang.String) <em>Generate Any</em>}' operation.
     * <!-- begin-user-doc -->
     * <!-- end-user-doc -->
     * @return the meta object for the '<em>Generate Any</em>' operation.
     * @see com.ericsson.xtumlrt.oopl.OOPLClassRefAssocCollectionImplementation#generateAny(java.lang.String, java.lang.String, java.lang.String)
     * @generated
     */
    EOperation getOOPLClassRefAssocCollectionImplementation__GenerateAny__String_String_String();

    /**
     * Returns the meta object for class '{@link com.ericsson.xtumlrt.oopl.OOPLClassRefSimpleCollectionImplementation <em>OOPL Class Ref Simple Collection Implementation</em>}'.
     * <!-- begin-user-doc -->
     * <!-- end-user-doc -->
     * @return the meta object for class '<em>OOPL Class Ref Simple Collection Implementation</em>'.
     * @see com.ericsson.xtumlrt.oopl.OOPLClassRefSimpleCollectionImplementation
     * @generated
     */
    EClass getOOPLClassRefSimpleCollectionImplementation();

    /**
     * Returns the meta object for the attribute '{@link com.ericsson.xtumlrt.oopl.OOPLClassRefSimpleCollectionImplementation#getKind <em>Kind</em>}'.
     * <!-- begin-user-doc -->
     * <!-- end-user-doc -->
     * @return the meta object for the attribute '<em>Kind</em>'.
     * @see com.ericsson.xtumlrt.oopl.OOPLClassRefSimpleCollectionImplementation#getKind()
     * @see #getOOPLClassRefSimpleCollectionImplementation()
     * @generated
     */
    EAttribute getOOPLClassRefSimpleCollectionImplementation_Kind();

    /**
     * Returns the meta object for the '{@link com.ericsson.xtumlrt.oopl.OOPLClassRefSimpleCollectionImplementation#generateElementAtIndex(java.lang.String, java.lang.String, java.lang.String, java.lang.String) <em>Generate Element At Index</em>}' operation.
     * <!-- begin-user-doc -->
     * <!-- end-user-doc -->
     * @return the meta object for the '<em>Generate Element At Index</em>' operation.
     * @see com.ericsson.xtumlrt.oopl.OOPLClassRefSimpleCollectionImplementation#generateElementAtIndex(java.lang.String, java.lang.String, java.lang.String, java.lang.String)
     * @generated
     */
    EOperation getOOPLClassRefSimpleCollectionImplementation__GenerateElementAtIndex__String_String_String_String();

    /**
     * Returns the meta object for the '{@link com.ericsson.xtumlrt.oopl.OOPLClassRefSimpleCollectionImplementation#generateInsertElementAtIndex(java.lang.String, java.lang.String, java.lang.String, java.lang.String) <em>Generate Insert Element At Index</em>}' operation.
     * <!-- begin-user-doc -->
     * <!-- end-user-doc -->
     * @return the meta object for the '<em>Generate Insert Element At Index</em>' operation.
     * @see com.ericsson.xtumlrt.oopl.OOPLClassRefSimpleCollectionImplementation#generateInsertElementAtIndex(java.lang.String, java.lang.String, java.lang.String, java.lang.String)
     * @generated
     */
    EOperation getOOPLClassRefSimpleCollectionImplementation__GenerateInsertElementAtIndex__String_String_String_String();

    /**
     * Returns the meta object for the '{@link com.ericsson.xtumlrt.oopl.OOPLClassRefSimpleCollectionImplementation#generateReplaceElementAtIndex(java.lang.String, java.lang.String, java.lang.String, java.lang.String) <em>Generate Replace Element At Index</em>}' operation.
     * <!-- begin-user-doc -->
     * <!-- end-user-doc -->
     * @return the meta object for the '<em>Generate Replace Element At Index</em>' operation.
     * @see com.ericsson.xtumlrt.oopl.OOPLClassRefSimpleCollectionImplementation#generateReplaceElementAtIndex(java.lang.String, java.lang.String, java.lang.String, java.lang.String)
     * @generated
     */
    EOperation getOOPLClassRefSimpleCollectionImplementation__GenerateReplaceElementAtIndex__String_String_String_String();

    /**
     * Returns the meta object for class '{@link com.ericsson.xtumlrt.oopl.OOPLSequenceImplementation <em>OOPL Sequence Implementation</em>}'.
     * <!-- begin-user-doc -->
     * <!-- end-user-doc -->
     * @return the meta object for class '<em>OOPL Sequence Implementation</em>'.
     * @see com.ericsson.xtumlrt.oopl.OOPLSequenceImplementation
     * @generated
     */
    EClass getOOPLSequenceImplementation();

    /**
     * Returns the meta object for the attribute '{@link com.ericsson.xtumlrt.oopl.OOPLSequenceImplementation#getUniqueness <em>Uniqueness</em>}'.
     * <!-- begin-user-doc -->
     * <!-- end-user-doc -->
     * @return the meta object for the attribute '<em>Uniqueness</em>'.
     * @see com.ericsson.xtumlrt.oopl.OOPLSequenceImplementation#getUniqueness()
     * @see #getOOPLSequenceImplementation()
     * @generated
     */
    EAttribute getOOPLSequenceImplementation_Uniqueness();

    /**
     * Returns the meta object for the attribute '{@link com.ericsson.xtumlrt.oopl.OOPLSequenceImplementation#getOrderedness <em>Orderedness</em>}'.
     * <!-- begin-user-doc -->
     * <!-- end-user-doc -->
     * @return the meta object for the attribute '<em>Orderedness</em>'.
     * @see com.ericsson.xtumlrt.oopl.OOPLSequenceImplementation#getOrderedness()
     * @see #getOOPLSequenceImplementation()
     * @generated
     */
    EAttribute getOOPLSequenceImplementation_Orderedness();

    /**
     * Returns the meta object for the '{@link com.ericsson.xtumlrt.oopl.OOPLSequenceImplementation#generateAny(java.lang.String, java.lang.String, java.lang.String) <em>Generate Any</em>}' operation.
     * <!-- begin-user-doc -->
     * <!-- end-user-doc -->
     * @return the meta object for the '<em>Generate Any</em>' operation.
     * @see com.ericsson.xtumlrt.oopl.OOPLSequenceImplementation#generateAny(java.lang.String, java.lang.String, java.lang.String)
     * @generated
     */
    EOperation getOOPLSequenceImplementation__GenerateAny__String_String_String();

    /**
     * Returns the meta object for the '{@link com.ericsson.xtumlrt.oopl.OOPLSequenceImplementation#generateCountOf(java.lang.String, java.lang.String, java.lang.String) <em>Generate Count Of</em>}' operation.
     * <!-- begin-user-doc -->
     * <!-- end-user-doc -->
     * @return the meta object for the '<em>Generate Count Of</em>' operation.
     * @see com.ericsson.xtumlrt.oopl.OOPLSequenceImplementation#generateCountOf(java.lang.String, java.lang.String, java.lang.String)
     * @generated
     */
    EOperation getOOPLSequenceImplementation__GenerateCountOf__String_String_String();

    /**
     * Returns the meta object for the '{@link com.ericsson.xtumlrt.oopl.OOPLSequenceImplementation#generateElementAtIndex(java.lang.String, java.lang.String, java.lang.String, java.lang.String) <em>Generate Element At Index</em>}' operation.
     * <!-- begin-user-doc -->
     * <!-- end-user-doc -->
     * @return the meta object for the '<em>Generate Element At Index</em>' operation.
     * @see com.ericsson.xtumlrt.oopl.OOPLSequenceImplementation#generateElementAtIndex(java.lang.String, java.lang.String, java.lang.String, java.lang.String)
     * @generated
     */
    EOperation getOOPLSequenceImplementation__GenerateElementAtIndex__String_String_String_String();

    /**
     * Returns the meta object for the '{@link com.ericsson.xtumlrt.oopl.OOPLSequenceImplementation#generateInsertElementAtIndex(java.lang.String, java.lang.String, java.lang.String, java.lang.String) <em>Generate Insert Element At Index</em>}' operation.
     * <!-- begin-user-doc -->
     * <!-- end-user-doc -->
     * @return the meta object for the '<em>Generate Insert Element At Index</em>' operation.
     * @see com.ericsson.xtumlrt.oopl.OOPLSequenceImplementation#generateInsertElementAtIndex(java.lang.String, java.lang.String, java.lang.String, java.lang.String)
     * @generated
     */
    EOperation getOOPLSequenceImplementation__GenerateInsertElementAtIndex__String_String_String_String();

    /**
     * Returns the meta object for the '{@link com.ericsson.xtumlrt.oopl.OOPLSequenceImplementation#generateReplaceElementAtIndex(java.lang.String, java.lang.String, java.lang.String, java.lang.String) <em>Generate Replace Element At Index</em>}' operation.
     * <!-- begin-user-doc -->
     * <!-- end-user-doc -->
     * @return the meta object for the '<em>Generate Replace Element At Index</em>' operation.
     * @see com.ericsson.xtumlrt.oopl.OOPLSequenceImplementation#generateReplaceElementAtIndex(java.lang.String, java.lang.String, java.lang.String, java.lang.String)
     * @generated
     */
    EOperation getOOPLSequenceImplementation__GenerateReplaceElementAtIndex__String_String_String_String();

    /**
     * Returns the meta object for enum '{@link com.ericsson.xtumlrt.oopl.SimpleCollectionKind <em>Simple Collection Kind</em>}'.
     * <!-- begin-user-doc -->
     * <!-- end-user-doc -->
     * @return the meta object for enum '<em>Simple Collection Kind</em>'.
     * @see com.ericsson.xtumlrt.oopl.SimpleCollectionKind
     * @generated
     */
    EEnum getSimpleCollectionKind();

    /**
     * Returns the meta object for enum '{@link com.ericsson.xtumlrt.oopl.AssociativeCollectionKind <em>Associative Collection Kind</em>}'.
     * <!-- begin-user-doc -->
     * <!-- end-user-doc -->
     * @return the meta object for enum '<em>Associative Collection Kind</em>'.
     * @see com.ericsson.xtumlrt.oopl.AssociativeCollectionKind
     * @generated
     */
    EEnum getAssociativeCollectionKind();

    /**
     * Returns the meta object for enum '{@link com.ericsson.xtumlrt.oopl.SequenceOrderednessKind <em>Sequence Orderedness Kind</em>}'.
     * <!-- begin-user-doc -->
     * <!-- end-user-doc -->
     * @return the meta object for enum '<em>Sequence Orderedness Kind</em>'.
     * @see com.ericsson.xtumlrt.oopl.SequenceOrderednessKind
     * @generated
     */
    EEnum getSequenceOrderednessKind();

    /**
     * Returns the meta object for enum '{@link com.ericsson.xtumlrt.oopl.SequenceUniquenessKind <em>Sequence Uniqueness Kind</em>}'.
     * <!-- begin-user-doc -->
     * <!-- end-user-doc -->
     * @return the meta object for enum '<em>Sequence Uniqueness Kind</em>'.
     * @see com.ericsson.xtumlrt.oopl.SequenceUniquenessKind
     * @generated
     */
    EEnum getSequenceUniquenessKind();

    /**
     * Returns the factory that creates the instances of the model.
     * <!-- begin-user-doc -->
     * <!-- end-user-doc -->
     * @return the factory that creates the instances of the model.
     * @generated
     */
    OoplFactory getOoplFactory();

    /**
     * <!-- begin-user-doc -->
     * Defines literals for the meta objects that represent
     * <ul>
     *   <li>each class,</li>
     *   <li>each feature of each class,</li>
     *   <li>each operation of each class,</li>
     *   <li>each enum,</li>
     *   <li>and each data type</li>
     * </ul>
     * <!-- end-user-doc -->
     * @generated
     */
    interface Literals {
        /**
         * The meta object literal for the '{@link com.ericsson.xtumlrt.oopl.impl.OOPLClassImpl <em>OOPL Class</em>}' class.
         * <!-- begin-user-doc -->
         * <!-- end-user-doc -->
         * @see com.ericsson.xtumlrt.oopl.impl.OOPLClassImpl
         * @see com.ericsson.xtumlrt.oopl.impl.OoplPackageImpl#getOOPLClass()
         * @generated
         */
        EClass OOPL_CLASS = eINSTANCE.getOOPLClass();

        /**
         * The meta object literal for the '<em><b>Xt Class</b></em>' reference feature.
         * <!-- begin-user-doc -->
         * <!-- end-user-doc -->
         * @generated
         */
        EReference OOPL_CLASS__XT_CLASS = eINSTANCE.getOOPLClass_XtClass();

        /**
         * The meta object literal for the '<em><b>Reference Storage</b></em>' reference list feature.
         * <!-- begin-user-doc -->
         * <!-- end-user-doc -->
         * @generated
         */
        EReference OOPL_CLASS__REFERENCE_STORAGE = eINSTANCE.getOOPLClass_ReferenceStorage();

        /**
         * The meta object literal for the '{@link com.ericsson.xtumlrt.oopl.impl.OOPLTypeImpl <em>OOPL Type</em>}' class.
         * <!-- begin-user-doc -->
         * <!-- end-user-doc -->
         * @see com.ericsson.xtumlrt.oopl.impl.OOPLTypeImpl
         * @see com.ericsson.xtumlrt.oopl.impl.OoplPackageImpl#getOOPLType()
         * @generated
         */
        EClass OOPL_TYPE = eINSTANCE.getOOPLType();

        /**
         * The meta object literal for the '<em><b>Common Type</b></em>' reference feature.
         * <!-- begin-user-doc -->
         * <!-- end-user-doc -->
         * @generated
         */
        EReference OOPL_TYPE__COMMON_TYPE = eINSTANCE.getOOPLType_CommonType();

        /**
         * The meta object literal for the '{@link com.ericsson.xtumlrt.oopl.impl.OOPLClassReferenceImpl <em>OOPL Class Reference</em>}' class.
         * <!-- begin-user-doc -->
         * <!-- end-user-doc -->
         * @see com.ericsson.xtumlrt.oopl.impl.OOPLClassReferenceImpl
         * @see com.ericsson.xtumlrt.oopl.impl.OoplPackageImpl#getOOPLClassReference()
         * @generated
         */
        EClass OOPL_CLASS_REFERENCE = eINSTANCE.getOOPLClassReference();

        /**
         * The meta object literal for the '<em><b>Oopl Class</b></em>' reference feature.
         * <!-- begin-user-doc -->
         * <!-- end-user-doc -->
         * @generated
         */
        EReference OOPL_CLASS_REFERENCE__OOPL_CLASS = eINSTANCE.getOOPLClassReference_OoplClass();

        /**
         * The meta object literal for the '{@link com.ericsson.xtumlrt.oopl.impl.OOPLClassReferenceCollectionImpl <em>OOPL Class Reference Collection</em>}' class.
         * <!-- begin-user-doc -->
         * <!-- end-user-doc -->
         * @see com.ericsson.xtumlrt.oopl.impl.OOPLClassReferenceCollectionImpl
         * @see com.ericsson.xtumlrt.oopl.impl.OoplPackageImpl#getOOPLClassReferenceCollection()
         * @generated
         */
        EClass OOPL_CLASS_REFERENCE_COLLECTION = eINSTANCE.getOOPLClassReferenceCollection();

        /**
         * The meta object literal for the '<em><b>Oopl Class</b></em>' reference feature.
         * <!-- begin-user-doc -->
         * <!-- end-user-doc -->
         * @generated
         */
        EReference OOPL_CLASS_REFERENCE_COLLECTION__OOPL_CLASS = eINSTANCE.getOOPLClassReferenceCollection_OoplClass();

        /**
         * The meta object literal for the '{@link com.ericsson.xtumlrt.oopl.impl.OOPLClassRefSimpleCollectionImpl <em>OOPL Class Ref Simple Collection</em>}' class.
         * <!-- begin-user-doc -->
         * <!-- end-user-doc -->
         * @see com.ericsson.xtumlrt.oopl.impl.OOPLClassRefSimpleCollectionImpl
         * @see com.ericsson.xtumlrt.oopl.impl.OoplPackageImpl#getOOPLClassRefSimpleCollection()
         * @generated
         */
        EClass OOPL_CLASS_REF_SIMPLE_COLLECTION = eINSTANCE.getOOPLClassRefSimpleCollection();

        /**
         * The meta object literal for the '<em><b>Kind</b></em>' attribute feature.
         * <!-- begin-user-doc -->
         * <!-- end-user-doc -->
         * @generated
         */
        EAttribute OOPL_CLASS_REF_SIMPLE_COLLECTION__KIND = eINSTANCE.getOOPLClassRefSimpleCollection_Kind();

        /**
         * The meta object literal for the '<em><b>Implementation</b></em>' reference feature.
         * <!-- begin-user-doc -->
         * <!-- end-user-doc -->
         * @generated
         */
        EReference OOPL_CLASS_REF_SIMPLE_COLLECTION__IMPLEMENTATION = eINSTANCE.getOOPLClassRefSimpleCollection_Implementation();

        /**
         * The meta object literal for the '{@link com.ericsson.xtumlrt.oopl.impl.OOPLClassRefAssocCollectionImpl <em>OOPL Class Ref Assoc Collection</em>}' class.
         * <!-- begin-user-doc -->
         * <!-- end-user-doc -->
         * @see com.ericsson.xtumlrt.oopl.impl.OOPLClassRefAssocCollectionImpl
         * @see com.ericsson.xtumlrt.oopl.impl.OoplPackageImpl#getOOPLClassRefAssocCollection()
         * @generated
         */
        EClass OOPL_CLASS_REF_ASSOC_COLLECTION = eINSTANCE.getOOPLClassRefAssocCollection();

        /**
         * The meta object literal for the '<em><b>Key</b></em>' reference feature.
         * <!-- begin-user-doc -->
         * <!-- end-user-doc -->
         * @generated
         */
        EReference OOPL_CLASS_REF_ASSOC_COLLECTION__KEY = eINSTANCE.getOOPLClassRefAssocCollection_Key();

        /**
         * The meta object literal for the '<em><b>Kind</b></em>' attribute feature.
         * <!-- begin-user-doc -->
         * <!-- end-user-doc -->
         * @generated
         */
        EAttribute OOPL_CLASS_REF_ASSOC_COLLECTION__KIND = eINSTANCE.getOOPLClassRefAssocCollection_Kind();

        /**
         * The meta object literal for the '<em><b>Implementation</b></em>' reference feature.
         * <!-- begin-user-doc -->
         * <!-- end-user-doc -->
         * @generated
         */
        EReference OOPL_CLASS_REF_ASSOC_COLLECTION__IMPLEMENTATION = eINSTANCE.getOOPLClassRefAssocCollection_Implementation();

        /**
         * The meta object literal for the '{@link com.ericsson.xtumlrt.oopl.impl.OOPLClassReferenceStorageImpl <em>OOPL Class Reference Storage</em>}' class.
         * <!-- begin-user-doc -->
         * <!-- end-user-doc -->
         * @see com.ericsson.xtumlrt.oopl.impl.OOPLClassReferenceStorageImpl
         * @see com.ericsson.xtumlrt.oopl.impl.OoplPackageImpl#getOOPLClassReferenceStorage()
         * @generated
         */
        EClass OOPL_CLASS_REFERENCE_STORAGE = eINSTANCE.getOOPLClassReferenceStorage();

        /**
         * The meta object literal for the '<em><b>Type</b></em>' reference feature.
         * <!-- begin-user-doc -->
         * <!-- end-user-doc -->
         * @generated
         */
        EReference OOPL_CLASS_REFERENCE_STORAGE__TYPE = eINSTANCE.getOOPLClassReferenceStorage_Type();

        /**
         * The meta object literal for the '<em><b>Required</b></em>' attribute feature.
         * <!-- begin-user-doc -->
         * <!-- end-user-doc -->
         * @generated
         */
        EAttribute OOPL_CLASS_REFERENCE_STORAGE__REQUIRED = eINSTANCE.getOOPLClassReferenceStorage_Required();

        /**
         * The meta object literal for the '{@link com.ericsson.xtumlrt.oopl.impl.OOPLRelationImpl <em>OOPL Relation</em>}' class.
         * <!-- begin-user-doc -->
         * <!-- end-user-doc -->
         * @see com.ericsson.xtumlrt.oopl.impl.OOPLRelationImpl
         * @see com.ericsson.xtumlrt.oopl.impl.OoplPackageImpl#getOOPLRelation()
         * @generated
         */
        EClass OOPL_RELATION = eINSTANCE.getOOPLRelation();

        /**
         * The meta object literal for the '<em><b>Xt Relation</b></em>' reference feature.
         * <!-- begin-user-doc -->
         * <!-- end-user-doc -->
         * @generated
         */
        EReference OOPL_RELATION__XT_RELATION = eINSTANCE.getOOPLRelation_XtRelation();

        /**
         * The meta object literal for the '<em><b>Reference Storage</b></em>' reference list feature.
         * <!-- begin-user-doc -->
         * <!-- end-user-doc -->
         * @generated
         */
        EReference OOPL_RELATION__REFERENCE_STORAGE = eINSTANCE.getOOPLRelation_ReferenceStorage();

        /**
         * The meta object literal for the '{@link com.ericsson.xtumlrt.oopl.impl.OOPLNameProviderImpl <em>OOPL Name Provider</em>}' class.
         * <!-- begin-user-doc -->
         * <!-- end-user-doc -->
         * @see com.ericsson.xtumlrt.oopl.impl.OOPLNameProviderImpl
         * @see com.ericsson.xtumlrt.oopl.impl.OoplPackageImpl#getOOPLNameProvider()
         * @generated
         */
        EClass OOPL_NAME_PROVIDER = eINSTANCE.getOOPLNameProvider();

        /**
         * The meta object literal for the '{@link com.ericsson.xtumlrt.oopl.impl.OOPLDerivedNameProviderImpl <em>OOPL Derived Name Provider</em>}' class.
         * <!-- begin-user-doc -->
         * <!-- end-user-doc -->
         * @see com.ericsson.xtumlrt.oopl.impl.OOPLDerivedNameProviderImpl
         * @see com.ericsson.xtumlrt.oopl.impl.OoplPackageImpl#getOOPLDerivedNameProvider()
         * @generated
         */
        EClass OOPL_DERIVED_NAME_PROVIDER = eINSTANCE.getOOPLDerivedNameProvider();

        /**
         * The meta object literal for the '<em><b>Name</b></em>' attribute feature.
         * <!-- begin-user-doc -->
         * <!-- end-user-doc -->
         * @generated
         */
        EAttribute OOPL_DERIVED_NAME_PROVIDER__NAME = eINSTANCE.getOOPLDerivedNameProvider_Name();

        /**
         * The meta object literal for the '{@link com.ericsson.xtumlrt.oopl.impl.OOPLExistingNameProviderImpl <em>OOPL Existing Name Provider</em>}' class.
         * <!-- begin-user-doc -->
         * <!-- end-user-doc -->
         * @see com.ericsson.xtumlrt.oopl.impl.OOPLExistingNameProviderImpl
         * @see com.ericsson.xtumlrt.oopl.impl.OoplPackageImpl#getOOPLExistingNameProvider()
         * @generated
         */
        EClass OOPL_EXISTING_NAME_PROVIDER = eINSTANCE.getOOPLExistingNameProvider();

        /**
         * The meta object literal for the '<em><b>Common Named Element</b></em>' reference feature.
         * <!-- begin-user-doc -->
         * <!-- end-user-doc -->
         * @generated
         */
        EReference OOPL_EXISTING_NAME_PROVIDER__COMMON_NAMED_ELEMENT = eINSTANCE.getOOPLExistingNameProvider_CommonNamedElement();

        /**
         * The meta object literal for the '{@link com.ericsson.xtumlrt.oopl.impl.OOPLBasicTypeImpl <em>OOPL Basic Type</em>}' class.
         * <!-- begin-user-doc -->
         * <!-- end-user-doc -->
         * @see com.ericsson.xtumlrt.oopl.impl.OOPLBasicTypeImpl
         * @see com.ericsson.xtumlrt.oopl.impl.OoplPackageImpl#getOOPLBasicType()
         * @generated
         */
        EClass OOPL_BASIC_TYPE = eINSTANCE.getOOPLBasicType();

        /**
         * The meta object literal for the '{@link com.ericsson.xtumlrt.oopl.impl.OOPLEnumTypeImpl <em>OOPL Enum Type</em>}' class.
         * <!-- begin-user-doc -->
         * <!-- end-user-doc -->
         * @see com.ericsson.xtumlrt.oopl.impl.OOPLEnumTypeImpl
         * @see com.ericsson.xtumlrt.oopl.impl.OoplPackageImpl#getOOPLEnumType()
         * @generated
         */
        EClass OOPL_ENUM_TYPE = eINSTANCE.getOOPLEnumType();

        /**
         * The meta object literal for the '<em><b>Enumerators</b></em>' reference list feature.
         * <!-- begin-user-doc -->
         * <!-- end-user-doc -->
         * @generated
         */
        EReference OOPL_ENUM_TYPE__ENUMERATORS = eINSTANCE.getOOPLEnumType_Enumerators();

        /**
         * The meta object literal for the '<em><b>Default Value</b></em>' reference feature.
         * <!-- begin-user-doc -->
         * <!-- end-user-doc -->
         * @generated
         */
        EReference OOPL_ENUM_TYPE__DEFAULT_VALUE = eINSTANCE.getOOPLEnumType_DefaultValue();

        /**
         * The meta object literal for the '{@link com.ericsson.xtumlrt.oopl.impl.OOPLEnumeratorImpl <em>OOPL Enumerator</em>}' class.
         * <!-- begin-user-doc -->
         * <!-- end-user-doc -->
         * @see com.ericsson.xtumlrt.oopl.impl.OOPLEnumeratorImpl
         * @see com.ericsson.xtumlrt.oopl.impl.OoplPackageImpl#getOOPLEnumerator()
         * @generated
         */
        EClass OOPL_ENUMERATOR = eINSTANCE.getOOPLEnumerator();

        /**
         * The meta object literal for the '<em><b>Common Enumeration Literal</b></em>' reference feature.
         * <!-- begin-user-doc -->
         * <!-- end-user-doc -->
         * @generated
         */
        EReference OOPL_ENUMERATOR__COMMON_ENUMERATION_LITERAL = eINSTANCE.getOOPLEnumerator_CommonEnumerationLiteral();

        /**
         * The meta object literal for the '{@link com.ericsson.xtumlrt.oopl.impl.OOPLStructTypeImpl <em>OOPL Struct Type</em>}' class.
         * <!-- begin-user-doc -->
         * <!-- end-user-doc -->
         * @see com.ericsson.xtumlrt.oopl.impl.OOPLStructTypeImpl
         * @see com.ericsson.xtumlrt.oopl.impl.OoplPackageImpl#getOOPLStructType()
         * @generated
         */
        EClass OOPL_STRUCT_TYPE = eINSTANCE.getOOPLStructType();

        /**
         * The meta object literal for the '<em><b>Members</b></em>' reference list feature.
         * <!-- begin-user-doc -->
         * <!-- end-user-doc -->
         * @generated
         */
        EReference OOPL_STRUCT_TYPE__MEMBERS = eINSTANCE.getOOPLStructType_Members();

        /**
         * The meta object literal for the '{@link com.ericsson.xtumlrt.oopl.impl.OOPLStructMemberImpl <em>OOPL Struct Member</em>}' class.
         * <!-- begin-user-doc -->
         * <!-- end-user-doc -->
         * @see com.ericsson.xtumlrt.oopl.impl.OOPLStructMemberImpl
         * @see com.ericsson.xtumlrt.oopl.impl.OoplPackageImpl#getOOPLStructMember()
         * @generated
         */
        EClass OOPL_STRUCT_MEMBER = eINSTANCE.getOOPLStructMember();

        /**
         * The meta object literal for the '<em><b>Common Member</b></em>' reference feature.
         * <!-- begin-user-doc -->
         * <!-- end-user-doc -->
         * @generated
         */
        EReference OOPL_STRUCT_MEMBER__COMMON_MEMBER = eINSTANCE.getOOPLStructMember_CommonMember();

        /**
         * The meta object literal for the '<em><b>Type</b></em>' reference feature.
         * <!-- begin-user-doc -->
         * <!-- end-user-doc -->
         * @generated
         */
        EReference OOPL_STRUCT_MEMBER__TYPE = eINSTANCE.getOOPLStructMember_Type();

        /**
         * The meta object literal for the '{@link com.ericsson.xtumlrt.oopl.impl.OOPLSequenceImpl <em>OOPL Sequence</em>}' class.
         * <!-- begin-user-doc -->
         * <!-- end-user-doc -->
         * @see com.ericsson.xtumlrt.oopl.impl.OOPLSequenceImpl
         * @see com.ericsson.xtumlrt.oopl.impl.OoplPackageImpl#getOOPLSequence()
         * @generated
         */
        EClass OOPL_SEQUENCE = eINSTANCE.getOOPLSequence();

        /**
         * The meta object literal for the '<em><b>Element Type</b></em>' reference feature.
         * <!-- begin-user-doc -->
         * <!-- end-user-doc -->
         * @generated
         */
        EReference OOPL_SEQUENCE__ELEMENT_TYPE = eINSTANCE.getOOPLSequence_ElementType();

        /**
         * The meta object literal for the '<em><b>Orderedness</b></em>' attribute feature.
         * <!-- begin-user-doc -->
         * <!-- end-user-doc -->
         * @generated
         */
        EAttribute OOPL_SEQUENCE__ORDEREDNESS = eINSTANCE.getOOPLSequence_Orderedness();

        /**
         * The meta object literal for the '<em><b>Uniqueness</b></em>' attribute feature.
         * <!-- begin-user-doc -->
         * <!-- end-user-doc -->
         * @generated
         */
        EAttribute OOPL_SEQUENCE__UNIQUENESS = eINSTANCE.getOOPLSequence_Uniqueness();

        /**
         * The meta object literal for the '<em><b>Implementation</b></em>' reference feature.
         * <!-- begin-user-doc -->
         * <!-- end-user-doc -->
         * @generated
         */
        EReference OOPL_SEQUENCE__IMPLEMENTATION = eINSTANCE.getOOPLSequence_Implementation();

        /**
         * The meta object literal for the '{@link com.ericsson.xtumlrt.oopl.impl.OOPLUserDefinedTypeImpl <em>OOPL User Defined Type</em>}' class.
         * <!-- begin-user-doc -->
         * <!-- end-user-doc -->
         * @see com.ericsson.xtumlrt.oopl.impl.OOPLUserDefinedTypeImpl
         * @see com.ericsson.xtumlrt.oopl.impl.OoplPackageImpl#getOOPLUserDefinedType()
         * @generated
         */
        EClass OOPL_USER_DEFINED_TYPE = eINSTANCE.getOOPLUserDefinedType();

        /**
         * The meta object literal for the '<em><b>Base Type</b></em>' reference feature.
         * <!-- begin-user-doc -->
         * <!-- end-user-doc -->
         * @generated
         */
        EReference OOPL_USER_DEFINED_TYPE__BASE_TYPE = eINSTANCE.getOOPLUserDefinedType_BaseType();

        /**
         * The meta object literal for the '{@link com.ericsson.xtumlrt.oopl.impl.BaseContainerImplementationImpl <em>Base Container Implementation</em>}' class.
         * <!-- begin-user-doc -->
         * <!-- end-user-doc -->
         * @see com.ericsson.xtumlrt.oopl.impl.BaseContainerImplementationImpl
         * @see com.ericsson.xtumlrt.oopl.impl.OoplPackageImpl#getBaseContainerImplementation()
         * @generated
         */
        EClass BASE_CONTAINER_IMPLEMENTATION = eINSTANCE.getBaseContainerImplementation();

        /**
         * The meta object literal for the '<em><b>Any Template</b></em>' attribute feature.
         * <!-- begin-user-doc -->
         * <!-- end-user-doc -->
         * @generated
         */
        EAttribute BASE_CONTAINER_IMPLEMENTATION__ANY_TEMPLATE = eINSTANCE.getBaseContainerImplementation_AnyTemplate();

        /**
         * The meta object literal for the '<em><b>Add Template</b></em>' attribute feature.
         * <!-- begin-user-doc -->
         * <!-- end-user-doc -->
         * @generated
         */
        EAttribute BASE_CONTAINER_IMPLEMENTATION__ADD_TEMPLATE = eINSTANCE.getBaseContainerImplementation_AddTemplate();

        /**
         * The meta object literal for the '<em><b>Add All Template</b></em>' attribute feature.
         * <!-- begin-user-doc -->
         * <!-- end-user-doc -->
         * @generated
         */
        EAttribute BASE_CONTAINER_IMPLEMENTATION__ADD_ALL_TEMPLATE = eINSTANCE.getBaseContainerImplementation_AddAllTemplate();

        /**
         * The meta object literal for the '<em><b>Clear Template</b></em>' attribute feature.
         * <!-- begin-user-doc -->
         * <!-- end-user-doc -->
         * @generated
         */
        EAttribute BASE_CONTAINER_IMPLEMENTATION__CLEAR_TEMPLATE = eINSTANCE.getBaseContainerImplementation_ClearTemplate();

        /**
         * The meta object literal for the '<em><b>Clone Template</b></em>' attribute feature.
         * <!-- begin-user-doc -->
         * <!-- end-user-doc -->
         * @generated
         */
        EAttribute BASE_CONTAINER_IMPLEMENTATION__CLONE_TEMPLATE = eINSTANCE.getBaseContainerImplementation_CloneTemplate();

        /**
         * The meta object literal for the '<em><b>Contains Template</b></em>' attribute feature.
         * <!-- begin-user-doc -->
         * <!-- end-user-doc -->
         * @generated
         */
        EAttribute BASE_CONTAINER_IMPLEMENTATION__CONTAINS_TEMPLATE = eINSTANCE.getBaseContainerImplementation_ContainsTemplate();

        /**
         * The meta object literal for the '<em><b>Contains All Template</b></em>' attribute feature.
         * <!-- begin-user-doc -->
         * <!-- end-user-doc -->
         * @generated
         */
        EAttribute BASE_CONTAINER_IMPLEMENTATION__CONTAINS_ALL_TEMPLATE = eINSTANCE.getBaseContainerImplementation_ContainsAllTemplate();

        /**
         * The meta object literal for the '<em><b>Count Of Template</b></em>' attribute feature.
         * <!-- begin-user-doc -->
         * <!-- end-user-doc -->
         * @generated
         */
        EAttribute BASE_CONTAINER_IMPLEMENTATION__COUNT_OF_TEMPLATE = eINSTANCE.getBaseContainerImplementation_CountOfTemplate();

        /**
         * The meta object literal for the '<em><b>Element At Index Template</b></em>' attribute feature.
         * <!-- begin-user-doc -->
         * <!-- end-user-doc -->
         * @generated
         */
        EAttribute BASE_CONTAINER_IMPLEMENTATION__ELEMENT_AT_INDEX_TEMPLATE = eINSTANCE.getBaseContainerImplementation_ElementAtIndexTemplate();

        /**
         * The meta object literal for the '<em><b>Insert Element At Index Template</b></em>' attribute feature.
         * <!-- begin-user-doc -->
         * <!-- end-user-doc -->
         * @generated
         */
        EAttribute BASE_CONTAINER_IMPLEMENTATION__INSERT_ELEMENT_AT_INDEX_TEMPLATE = eINSTANCE.getBaseContainerImplementation_InsertElementAtIndexTemplate();

        /**
         * The meta object literal for the '<em><b>Is Empty Template</b></em>' attribute feature.
         * <!-- begin-user-doc -->
         * <!-- end-user-doc -->
         * @generated
         */
        EAttribute BASE_CONTAINER_IMPLEMENTATION__IS_EMPTY_TEMPLATE = eINSTANCE.getBaseContainerImplementation_IsEmptyTemplate();

        /**
         * The meta object literal for the '<em><b>Remove Template</b></em>' attribute feature.
         * <!-- begin-user-doc -->
         * <!-- end-user-doc -->
         * @generated
         */
        EAttribute BASE_CONTAINER_IMPLEMENTATION__REMOVE_TEMPLATE = eINSTANCE.getBaseContainerImplementation_RemoveTemplate();

        /**
         * The meta object literal for the '<em><b>Remove All Template</b></em>' attribute feature.
         * <!-- begin-user-doc -->
         * <!-- end-user-doc -->
         * @generated
         */
        EAttribute BASE_CONTAINER_IMPLEMENTATION__REMOVE_ALL_TEMPLATE = eINSTANCE.getBaseContainerImplementation_RemoveAllTemplate();

        /**
         * The meta object literal for the '<em><b>Replace Element At Index Template</b></em>' attribute feature.
         * <!-- begin-user-doc -->
         * <!-- end-user-doc -->
         * @generated
         */
        EAttribute BASE_CONTAINER_IMPLEMENTATION__REPLACE_ELEMENT_AT_INDEX_TEMPLATE = eINSTANCE.getBaseContainerImplementation_ReplaceElementAtIndexTemplate();

        /**
         * The meta object literal for the '<em><b>Retain All Template</b></em>' attribute feature.
         * <!-- begin-user-doc -->
         * <!-- end-user-doc -->
         * @generated
         */
        EAttribute BASE_CONTAINER_IMPLEMENTATION__RETAIN_ALL_TEMPLATE = eINSTANCE.getBaseContainerImplementation_RetainAllTemplate();

        /**
         * The meta object literal for the '<em><b>Size Template</b></em>' attribute feature.
         * <!-- begin-user-doc -->
         * <!-- end-user-doc -->
         * @generated
         */
        EAttribute BASE_CONTAINER_IMPLEMENTATION__SIZE_TEMPLATE = eINSTANCE.getBaseContainerImplementation_SizeTemplate();

        /**
         * The meta object literal for the '<em><b>Container Qualified Name</b></em>' attribute feature.
         * <!-- begin-user-doc -->
         * <!-- end-user-doc -->
         * @generated
         */
        EAttribute BASE_CONTAINER_IMPLEMENTATION__CONTAINER_QUALIFIED_NAME = eINSTANCE.getBaseContainerImplementation_ContainerQualifiedName();

        /**
         * The meta object literal for the '<em><b>Container Header Includes</b></em>' attribute list feature.
         * <!-- begin-user-doc -->
         * <!-- end-user-doc -->
         * @generated
         */
        EAttribute BASE_CONTAINER_IMPLEMENTATION__CONTAINER_HEADER_INCLUDES = eINSTANCE.getBaseContainerImplementation_ContainerHeaderIncludes();

        /**
         * The meta object literal for the '<em><b>Generate Add</b></em>' operation.
         * <!-- begin-user-doc -->
         * <!-- end-user-doc -->
         * @generated
         */
        EOperation BASE_CONTAINER_IMPLEMENTATION___GENERATE_ADD__STRING_STRING_STRING = eINSTANCE.getBaseContainerImplementation__GenerateAdd__String_String_String();

        /**
         * The meta object literal for the '<em><b>Generate Add All</b></em>' operation.
         * <!-- begin-user-doc -->
         * <!-- end-user-doc -->
         * @generated
         */
        EOperation BASE_CONTAINER_IMPLEMENTATION___GENERATE_ADD_ALL__STRING_STRING = eINSTANCE.getBaseContainerImplementation__GenerateAddAll__String_String();

        /**
         * The meta object literal for the '<em><b>Generate Clear</b></em>' operation.
         * <!-- begin-user-doc -->
         * <!-- end-user-doc -->
         * @generated
         */
        EOperation BASE_CONTAINER_IMPLEMENTATION___GENERATE_CLEAR__STRING = eINSTANCE.getBaseContainerImplementation__GenerateClear__String();

        /**
         * The meta object literal for the '<em><b>Generate Clone</b></em>' operation.
         * <!-- begin-user-doc -->
         * <!-- end-user-doc -->
         * @generated
         */
        EOperation BASE_CONTAINER_IMPLEMENTATION___GENERATE_CLONE__STRING_STRING_STRING = eINSTANCE.getBaseContainerImplementation__GenerateClone__String_String_String();

        /**
         * The meta object literal for the '<em><b>Generate Contains</b></em>' operation.
         * <!-- begin-user-doc -->
         * <!-- end-user-doc -->
         * @generated
         */
        EOperation BASE_CONTAINER_IMPLEMENTATION___GENERATE_CONTAINS__STRING_STRING_STRING = eINSTANCE.getBaseContainerImplementation__GenerateContains__String_String_String();

        /**
         * The meta object literal for the '<em><b>Generate Contains All</b></em>' operation.
         * <!-- begin-user-doc -->
         * <!-- end-user-doc -->
         * @generated
         */
        EOperation BASE_CONTAINER_IMPLEMENTATION___GENERATE_CONTAINS_ALL__STRING_STRING_STRING_STRING_STRING = eINSTANCE.getBaseContainerImplementation__GenerateContainsAll__String_String_String_String_String();

        /**
         * The meta object literal for the '<em><b>Generate Is Empty</b></em>' operation.
         * <!-- begin-user-doc -->
         * <!-- end-user-doc -->
         * @generated
         */
        EOperation BASE_CONTAINER_IMPLEMENTATION___GENERATE_IS_EMPTY__STRING_STRING = eINSTANCE.getBaseContainerImplementation__GenerateIsEmpty__String_String();

        /**
         * The meta object literal for the '<em><b>Generate Remove</b></em>' operation.
         * <!-- begin-user-doc -->
         * <!-- end-user-doc -->
         * @generated
         */
        EOperation BASE_CONTAINER_IMPLEMENTATION___GENERATE_REMOVE__STRING_STRING = eINSTANCE.getBaseContainerImplementation__GenerateRemove__String_String();

        /**
         * The meta object literal for the '<em><b>Generate Remove All</b></em>' operation.
         * <!-- begin-user-doc -->
         * <!-- end-user-doc -->
         * @generated
         */
        EOperation BASE_CONTAINER_IMPLEMENTATION___GENERATE_REMOVE_ALL__STRING_STRING_STRING_STRING = eINSTANCE.getBaseContainerImplementation__GenerateRemoveAll__String_String_String_String();

        /**
         * The meta object literal for the '<em><b>Generate Retain All</b></em>' operation.
         * <!-- begin-user-doc -->
         * <!-- end-user-doc -->
         * @generated
         */
        EOperation BASE_CONTAINER_IMPLEMENTATION___GENERATE_RETAIN_ALL__STRING_STRING_STRING = eINSTANCE.getBaseContainerImplementation__GenerateRetainAll__String_String_String();

        /**
         * The meta object literal for the '<em><b>Generate Size</b></em>' operation.
         * <!-- begin-user-doc -->
         * <!-- end-user-doc -->
         * @generated
         */
        EOperation BASE_CONTAINER_IMPLEMENTATION___GENERATE_SIZE__STRING_STRING = eINSTANCE.getBaseContainerImplementation__GenerateSize__String_String();

        /**
         * The meta object literal for the '{@link com.ericsson.xtumlrt.oopl.impl.OOPLClassRefAssocCollectionImplementationImpl <em>OOPL Class Ref Assoc Collection Implementation</em>}' class.
         * <!-- begin-user-doc -->
         * <!-- end-user-doc -->
         * @see com.ericsson.xtumlrt.oopl.impl.OOPLClassRefAssocCollectionImplementationImpl
         * @see com.ericsson.xtumlrt.oopl.impl.OoplPackageImpl#getOOPLClassRefAssocCollectionImplementation()
         * @generated
         */
        EClass OOPL_CLASS_REF_ASSOC_COLLECTION_IMPLEMENTATION = eINSTANCE.getOOPLClassRefAssocCollectionImplementation();

        /**
         * The meta object literal for the '<em><b>Kind</b></em>' attribute feature.
         * <!-- begin-user-doc -->
         * <!-- end-user-doc -->
         * @generated
         */
        EAttribute OOPL_CLASS_REF_ASSOC_COLLECTION_IMPLEMENTATION__KIND = eINSTANCE.getOOPLClassRefAssocCollectionImplementation_Kind();

        /**
         * The meta object literal for the '<em><b>Generate Count Of</b></em>' operation.
         * <!-- begin-user-doc -->
         * <!-- end-user-doc -->
         * @generated
         */
        EOperation OOPL_CLASS_REF_ASSOC_COLLECTION_IMPLEMENTATION___GENERATE_COUNT_OF__STRING_STRING_STRING = eINSTANCE.getOOPLClassRefAssocCollectionImplementation__GenerateCountOf__String_String_String();

        /**
         * The meta object literal for the '<em><b>Generate Any</b></em>' operation.
         * <!-- begin-user-doc -->
         * <!-- end-user-doc -->
         * @generated
         */
        EOperation OOPL_CLASS_REF_ASSOC_COLLECTION_IMPLEMENTATION___GENERATE_ANY__STRING_STRING_STRING = eINSTANCE.getOOPLClassRefAssocCollectionImplementation__GenerateAny__String_String_String();

        /**
         * The meta object literal for the '{@link com.ericsson.xtumlrt.oopl.impl.OOPLClassRefSimpleCollectionImplementationImpl <em>OOPL Class Ref Simple Collection Implementation</em>}' class.
         * <!-- begin-user-doc -->
         * <!-- end-user-doc -->
         * @see com.ericsson.xtumlrt.oopl.impl.OOPLClassRefSimpleCollectionImplementationImpl
         * @see com.ericsson.xtumlrt.oopl.impl.OoplPackageImpl#getOOPLClassRefSimpleCollectionImplementation()
         * @generated
         */
        EClass OOPL_CLASS_REF_SIMPLE_COLLECTION_IMPLEMENTATION = eINSTANCE.getOOPLClassRefSimpleCollectionImplementation();

        /**
         * The meta object literal for the '<em><b>Kind</b></em>' attribute feature.
         * <!-- begin-user-doc -->
         * <!-- end-user-doc -->
         * @generated
         */
        EAttribute OOPL_CLASS_REF_SIMPLE_COLLECTION_IMPLEMENTATION__KIND = eINSTANCE.getOOPLClassRefSimpleCollectionImplementation_Kind();

        /**
         * The meta object literal for the '<em><b>Generate Element At Index</b></em>' operation.
         * <!-- begin-user-doc -->
         * <!-- end-user-doc -->
         * @generated
         */
        EOperation OOPL_CLASS_REF_SIMPLE_COLLECTION_IMPLEMENTATION___GENERATE_ELEMENT_AT_INDEX__STRING_STRING_STRING_STRING = eINSTANCE.getOOPLClassRefSimpleCollectionImplementation__GenerateElementAtIndex__String_String_String_String();

        /**
         * The meta object literal for the '<em><b>Generate Insert Element At Index</b></em>' operation.
         * <!-- begin-user-doc -->
         * <!-- end-user-doc -->
         * @generated
         */
        EOperation OOPL_CLASS_REF_SIMPLE_COLLECTION_IMPLEMENTATION___GENERATE_INSERT_ELEMENT_AT_INDEX__STRING_STRING_STRING_STRING = eINSTANCE.getOOPLClassRefSimpleCollectionImplementation__GenerateInsertElementAtIndex__String_String_String_String();

        /**
         * The meta object literal for the '<em><b>Generate Replace Element At Index</b></em>' operation.
         * <!-- begin-user-doc -->
         * <!-- end-user-doc -->
         * @generated
         */
        EOperation OOPL_CLASS_REF_SIMPLE_COLLECTION_IMPLEMENTATION___GENERATE_REPLACE_ELEMENT_AT_INDEX__STRING_STRING_STRING_STRING = eINSTANCE.getOOPLClassRefSimpleCollectionImplementation__GenerateReplaceElementAtIndex__String_String_String_String();

        /**
         * The meta object literal for the '{@link com.ericsson.xtumlrt.oopl.impl.OOPLSequenceImplementationImpl <em>OOPL Sequence Implementation</em>}' class.
         * <!-- begin-user-doc -->
         * <!-- end-user-doc -->
         * @see com.ericsson.xtumlrt.oopl.impl.OOPLSequenceImplementationImpl
         * @see com.ericsson.xtumlrt.oopl.impl.OoplPackageImpl#getOOPLSequenceImplementation()
         * @generated
         */
        EClass OOPL_SEQUENCE_IMPLEMENTATION = eINSTANCE.getOOPLSequenceImplementation();

        /**
         * The meta object literal for the '<em><b>Uniqueness</b></em>' attribute feature.
         * <!-- begin-user-doc -->
         * <!-- end-user-doc -->
         * @generated
         */
        EAttribute OOPL_SEQUENCE_IMPLEMENTATION__UNIQUENESS = eINSTANCE.getOOPLSequenceImplementation_Uniqueness();

        /**
         * The meta object literal for the '<em><b>Orderedness</b></em>' attribute feature.
         * <!-- begin-user-doc -->
         * <!-- end-user-doc -->
         * @generated
         */
        EAttribute OOPL_SEQUENCE_IMPLEMENTATION__ORDEREDNESS = eINSTANCE.getOOPLSequenceImplementation_Orderedness();

        /**
         * The meta object literal for the '<em><b>Generate Any</b></em>' operation.
         * <!-- begin-user-doc -->
         * <!-- end-user-doc -->
         * @generated
         */
        EOperation OOPL_SEQUENCE_IMPLEMENTATION___GENERATE_ANY__STRING_STRING_STRING = eINSTANCE.getOOPLSequenceImplementation__GenerateAny__String_String_String();

        /**
         * The meta object literal for the '<em><b>Generate Count Of</b></em>' operation.
         * <!-- begin-user-doc -->
         * <!-- end-user-doc -->
         * @generated
         */
        EOperation OOPL_SEQUENCE_IMPLEMENTATION___GENERATE_COUNT_OF__STRING_STRING_STRING = eINSTANCE.getOOPLSequenceImplementation__GenerateCountOf__String_String_String();

        /**
         * The meta object literal for the '<em><b>Generate Element At Index</b></em>' operation.
         * <!-- begin-user-doc -->
         * <!-- end-user-doc -->
         * @generated
         */
        EOperation OOPL_SEQUENCE_IMPLEMENTATION___GENERATE_ELEMENT_AT_INDEX__STRING_STRING_STRING_STRING = eINSTANCE.getOOPLSequenceImplementation__GenerateElementAtIndex__String_String_String_String();

        /**
         * The meta object literal for the '<em><b>Generate Insert Element At Index</b></em>' operation.
         * <!-- begin-user-doc -->
         * <!-- end-user-doc -->
         * @generated
         */
        EOperation OOPL_SEQUENCE_IMPLEMENTATION___GENERATE_INSERT_ELEMENT_AT_INDEX__STRING_STRING_STRING_STRING = eINSTANCE.getOOPLSequenceImplementation__GenerateInsertElementAtIndex__String_String_String_String();

        /**
         * The meta object literal for the '<em><b>Generate Replace Element At Index</b></em>' operation.
         * <!-- begin-user-doc -->
         * <!-- end-user-doc -->
         * @generated
         */
        EOperation OOPL_SEQUENCE_IMPLEMENTATION___GENERATE_REPLACE_ELEMENT_AT_INDEX__STRING_STRING_STRING_STRING = eINSTANCE.getOOPLSequenceImplementation__GenerateReplaceElementAtIndex__String_String_String_String();

        /**
         * The meta object literal for the '{@link com.ericsson.xtumlrt.oopl.SimpleCollectionKind <em>Simple Collection Kind</em>}' enum.
         * <!-- begin-user-doc -->
         * <!-- end-user-doc -->
         * @see com.ericsson.xtumlrt.oopl.SimpleCollectionKind
         * @see com.ericsson.xtumlrt.oopl.impl.OoplPackageImpl#getSimpleCollectionKind()
         * @generated
         */
        EEnum SIMPLE_COLLECTION_KIND = eINSTANCE.getSimpleCollectionKind();

        /**
         * The meta object literal for the '{@link com.ericsson.xtumlrt.oopl.AssociativeCollectionKind <em>Associative Collection Kind</em>}' enum.
         * <!-- begin-user-doc -->
         * <!-- end-user-doc -->
         * @see com.ericsson.xtumlrt.oopl.AssociativeCollectionKind
         * @see com.ericsson.xtumlrt.oopl.impl.OoplPackageImpl#getAssociativeCollectionKind()
         * @generated
         */
        EEnum ASSOCIATIVE_COLLECTION_KIND = eINSTANCE.getAssociativeCollectionKind();

        /**
         * The meta object literal for the '{@link com.ericsson.xtumlrt.oopl.SequenceOrderednessKind <em>Sequence Orderedness Kind</em>}' enum.
         * <!-- begin-user-doc -->
         * <!-- end-user-doc -->
         * @see com.ericsson.xtumlrt.oopl.SequenceOrderednessKind
         * @see com.ericsson.xtumlrt.oopl.impl.OoplPackageImpl#getSequenceOrderednessKind()
         * @generated
         */
        EEnum SEQUENCE_ORDEREDNESS_KIND = eINSTANCE.getSequenceOrderednessKind();

        /**
         * The meta object literal for the '{@link com.ericsson.xtumlrt.oopl.SequenceUniquenessKind <em>Sequence Uniqueness Kind</em>}' enum.
         * <!-- begin-user-doc -->
         * <!-- end-user-doc -->
         * @see com.ericsson.xtumlrt.oopl.SequenceUniquenessKind
         * @see com.ericsson.xtumlrt.oopl.impl.OoplPackageImpl#getSequenceUniquenessKind()
         * @generated
         */
        EEnum SEQUENCE_UNIQUENESS_KIND = eINSTANCE.getSequenceUniquenessKind();

    }

} //OoplPackage
