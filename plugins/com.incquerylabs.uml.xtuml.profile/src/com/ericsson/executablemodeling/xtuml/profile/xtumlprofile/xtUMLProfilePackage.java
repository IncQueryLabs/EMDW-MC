/**
 */
package com.ericsson.executablemodeling.xtuml.profile.xtumlprofile;

import com.ericsson.executablemodeling.xtuml.profile.executablemodelingprofile.ExecutableModelingProfilePackage;

import org.eclipse.emf.ecore.EClass;
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
 * @see com.ericsson.executablemodeling.xtuml.profile.xtumlprofile.xtUMLProfileFactory
 * @model kind="package"
 *        annotation="http://www.eclipse.org/uml2/2.0.0/UML originalName='xtUML'"
 * @generated
 */
public interface xtUMLProfilePackage extends EPackage {
	/**
	 * The package name.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 */
	String eNAME = "xtumlprofile";

	/**
	 * The package namespace URI.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 */
	String eNS_URI = "http://Papyrus/xtUMLProfile";

	/**
	 * The package namespace name.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 */
	String eNS_PREFIX = "xtUMLProfile";

	/**
	 * The singleton instance of the package.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 */
	xtUMLProfilePackage eINSTANCE = com.ericsson.executablemodeling.xtuml.profile.xtumlprofile.impl.xtUMLProfilePackageImpl.init();

	/**
	 * The meta object id for the '{@link com.ericsson.executablemodeling.xtuml.profile.xtumlprofile.impl.XtConnectorEndImpl <em>Xt Connector End</em>}' class.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @see com.ericsson.executablemodeling.xtuml.profile.xtumlprofile.impl.XtConnectorEndImpl
	 * @see com.ericsson.executablemodeling.xtuml.profile.xtumlprofile.impl.xtUMLProfilePackageImpl#getXtConnectorEnd()
	 * @generated
	 */
	int XT_CONNECTOR_END = 0;

	/**
	 * The feature id for the '<em><b>Base Connector End</b></em>' reference.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 * @ordered
	 */
	int XT_CONNECTOR_END__BASE_CONNECTOR_END = ExecutableModelingProfilePackage.XCONNECTOR_END__BASE_CONNECTOR_END;

	/**
	 * The number of structural features of the '<em>Xt Connector End</em>' class.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 * @ordered
	 */
	int XT_CONNECTOR_END_FEATURE_COUNT = ExecutableModelingProfilePackage.XCONNECTOR_END_FEATURE_COUNT + 0;

	/**
	 * The operation id for the '<em>XConnector End Connector</em>' operation.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 * @ordered
	 */
	int XT_CONNECTOR_END___XCONNECTOR_END_CONNECTOR__DIAGNOSTICCHAIN_MAP = ExecutableModelingProfilePackage.XCONNECTOR_END___XCONNECTOR_END_CONNECTOR__DIAGNOSTICCHAIN_MAP;

	/**
	 * The operation id for the '<em>XConnector End Role</em>' operation.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 * @ordered
	 */
	int XT_CONNECTOR_END___XCONNECTOR_END_ROLE__DIAGNOSTICCHAIN_MAP = ExecutableModelingProfilePackage.XCONNECTOR_END___XCONNECTOR_END_ROLE__DIAGNOSTICCHAIN_MAP;

	/**
	 * The operation id for the '<em>XConnector End Uniqueness</em>' operation.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 * @ordered
	 */
	int XT_CONNECTOR_END___XCONNECTOR_END_UNIQUENESS__DIAGNOSTICCHAIN_MAP = ExecutableModelingProfilePackage.XCONNECTOR_END___XCONNECTOR_END_UNIQUENESS__DIAGNOSTICCHAIN_MAP;

	/**
	 * The operation id for the '<em>Xt Connector End Role</em>' operation.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 * @ordered
	 */
	int XT_CONNECTOR_END___XT_CONNECTOR_END_ROLE__DIAGNOSTICCHAIN_MAP = ExecutableModelingProfilePackage.XCONNECTOR_END_OPERATION_COUNT + 0;

	/**
	 * The number of operations of the '<em>Xt Connector End</em>' class.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 * @ordered
	 */
	int XT_CONNECTOR_END_OPERATION_COUNT = ExecutableModelingProfilePackage.XCONNECTOR_END_OPERATION_COUNT + 1;

	/**
	 * The meta object id for the '{@link com.ericsson.executablemodeling.xtuml.profile.xtumlprofile.impl.XtPropertyImpl <em>Xt Property</em>}' class.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @see com.ericsson.executablemodeling.xtuml.profile.xtumlprofile.impl.XtPropertyImpl
	 * @see com.ericsson.executablemodeling.xtuml.profile.xtumlprofile.impl.xtUMLProfilePackageImpl#getXtProperty()
	 * @generated
	 */
	int XT_PROPERTY = 1;

	/**
	 * The feature id for the '<em><b>Base Multiplicity Element</b></em>' reference.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 * @ordered
	 */
	int XT_PROPERTY__BASE_MULTIPLICITY_ELEMENT = ExecutableModelingProfilePackage.XPROPERTY__BASE_MULTIPLICITY_ELEMENT;

	/**
	 * The feature id for the '<em><b>Is Ordered By Value</b></em>' attribute.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 * @ordered
	 */
	int XT_PROPERTY__IS_ORDERED_BY_VALUE = ExecutableModelingProfilePackage.XPROPERTY__IS_ORDERED_BY_VALUE;

	/**
	 * The feature id for the '<em><b>Key</b></em>' reference list.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 * @ordered
	 */
	int XT_PROPERTY__KEY = ExecutableModelingProfilePackage.XPROPERTY__KEY;

	/**
	 * The feature id for the '<em><b>Is Descending</b></em>' attribute.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 * @ordered
	 */
	int XT_PROPERTY__IS_DESCENDING = ExecutableModelingProfilePackage.XPROPERTY__IS_DESCENDING;

	/**
	 * The feature id for the '<em><b>Base Named Element</b></em>' reference.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 * @ordered
	 */
	int XT_PROPERTY__BASE_NAMED_ELEMENT = ExecutableModelingProfilePackage.XPROPERTY__BASE_NAMED_ELEMENT;

	/**
	 * The feature id for the '<em><b>Base Feature</b></em>' reference.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 * @ordered
	 */
	int XT_PROPERTY__BASE_FEATURE = ExecutableModelingProfilePackage.XPROPERTY__BASE_FEATURE;

	/**
	 * The feature id for the '<em><b>Base Typed Element</b></em>' reference.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 * @ordered
	 */
	int XT_PROPERTY__BASE_TYPED_ELEMENT = ExecutableModelingProfilePackage.XPROPERTY__BASE_TYPED_ELEMENT;

	/**
	 * The feature id for the '<em><b>Base Property</b></em>' reference.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 * @ordered
	 */
	int XT_PROPERTY__BASE_PROPERTY = ExecutableModelingProfilePackage.XPROPERTY__BASE_PROPERTY;

	/**
	 * The feature id for the '<em><b>Derivation</b></em>' reference.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 * @ordered
	 */
	int XT_PROPERTY__DERIVATION = ExecutableModelingProfilePackage.XPROPERTY_FEATURE_COUNT + 0;

	/**
	 * The number of structural features of the '<em>Xt Property</em>' class.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 * @ordered
	 */
	int XT_PROPERTY_FEATURE_COUNT = ExecutableModelingProfilePackage.XPROPERTY_FEATURE_COUNT + 1;

	/**
	 * The operation id for the '<em>XMultiplicity Element Is Ordered By Value</em>' operation.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 * @ordered
	 */
	int XT_PROPERTY___XMULTIPLICITY_ELEMENT_IS_ORDERED_BY_VALUE__DIAGNOSTICCHAIN_MAP = ExecutableModelingProfilePackage.XPROPERTY___XMULTIPLICITY_ELEMENT_IS_ORDERED_BY_VALUE__DIAGNOSTICCHAIN_MAP;

	/**
	 * The operation id for the '<em>XMultiplicity Element Keys</em>' operation.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 * @ordered
	 */
	int XT_PROPERTY___XMULTIPLICITY_ELEMENT_KEYS__DIAGNOSTICCHAIN_MAP = ExecutableModelingProfilePackage.XPROPERTY___XMULTIPLICITY_ELEMENT_KEYS__DIAGNOSTICCHAIN_MAP;

	/**
	 * The operation id for the '<em>XNamed Element Name</em>' operation.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 * @ordered
	 */
	int XT_PROPERTY___XNAMED_ELEMENT_NAME__DIAGNOSTICCHAIN_MAP = ExecutableModelingProfilePackage.XPROPERTY___XNAMED_ELEMENT_NAME__DIAGNOSTICCHAIN_MAP;

	/**
	 * The operation id for the '<em>XFeature Classifier</em>' operation.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 * @ordered
	 */
	int XT_PROPERTY___XFEATURE_CLASSIFIER__DIAGNOSTICCHAIN_MAP = ExecutableModelingProfilePackage.XPROPERTY___XFEATURE_CLASSIFIER__DIAGNOSTICCHAIN_MAP;

	/**
	 * The operation id for the '<em>XTyped Element Type</em>' operation.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 * @ordered
	 */
	int XT_PROPERTY___XTYPED_ELEMENT_TYPE__DIAGNOSTICCHAIN_MAP = ExecutableModelingProfilePackage.XPROPERTY___XTYPED_ELEMENT_TYPE__DIAGNOSTICCHAIN_MAP;

	/**
	 * The operation id for the '<em>Xt Property Aggregation</em>' operation.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 * @ordered
	 */
	int XT_PROPERTY___XT_PROPERTY_AGGREGATION__DIAGNOSTICCHAIN_MAP = ExecutableModelingProfilePackage.XPROPERTY_OPERATION_COUNT + 0;

	/**
	 * The operation id for the '<em>Xt Property Redefinition</em>' operation.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 * @ordered
	 */
	int XT_PROPERTY___XT_PROPERTY_REDEFINITION__DIAGNOSTICCHAIN_MAP = ExecutableModelingProfilePackage.XPROPERTY_OPERATION_COUNT + 1;

	/**
	 * The operation id for the '<em>Xt Property Derivation</em>' operation.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 * @ordered
	 */
	int XT_PROPERTY___XT_PROPERTY_DERIVATION__DIAGNOSTICCHAIN_MAP = ExecutableModelingProfilePackage.XPROPERTY_OPERATION_COUNT + 2;

	/**
	 * The number of operations of the '<em>Xt Property</em>' class.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 * @ordered
	 */
	int XT_PROPERTY_OPERATION_COUNT = ExecutableModelingProfilePackage.XPROPERTY_OPERATION_COUNT + 3;

	/**
	 * The meta object id for the '{@link com.ericsson.executablemodeling.xtuml.profile.xtumlprofile.impl.XtComponentImpl <em>Xt Component</em>}' class.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @see com.ericsson.executablemodeling.xtuml.profile.xtumlprofile.impl.XtComponentImpl
	 * @see com.ericsson.executablemodeling.xtuml.profile.xtumlprofile.impl.xtUMLProfilePackageImpl#getXtComponent()
	 * @generated
	 */
	int XT_COMPONENT = 2;

	/**
	 * The feature id for the '<em><b>Base Named Element</b></em>' reference.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 * @ordered
	 */
	int XT_COMPONENT__BASE_NAMED_ELEMENT = ExecutableModelingProfilePackage.XENCAPSULATED_CLASSIFIER__BASE_NAMED_ELEMENT;

	/**
	 * The feature id for the '<em><b>Base Namespace</b></em>' reference.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 * @ordered
	 */
	int XT_COMPONENT__BASE_NAMESPACE = ExecutableModelingProfilePackage.XENCAPSULATED_CLASSIFIER__BASE_NAMESPACE;

	/**
	 * The feature id for the '<em><b>Base Classifier</b></em>' reference.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 * @ordered
	 */
	int XT_COMPONENT__BASE_CLASSIFIER = ExecutableModelingProfilePackage.XENCAPSULATED_CLASSIFIER__BASE_CLASSIFIER;

	/**
	 * The feature id for the '<em><b>Base Encapsulated Classifier</b></em>' reference.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 * @ordered
	 */
	int XT_COMPONENT__BASE_ENCAPSULATED_CLASSIFIER = ExecutableModelingProfilePackage.XENCAPSULATED_CLASSIFIER__BASE_ENCAPSULATED_CLASSIFIER;

	/**
	 * The feature id for the '<em><b>Is External</b></em>' attribute.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 * @ordered
	 */
	int XT_COMPONENT__IS_EXTERNAL = ExecutableModelingProfilePackage.XENCAPSULATED_CLASSIFIER__IS_EXTERNAL;

	/**
	 * The feature id for the '<em><b>Base Component</b></em>' reference.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 * @ordered
	 */
	int XT_COMPONENT__BASE_COMPONENT = ExecutableModelingProfilePackage.XENCAPSULATED_CLASSIFIER_FEATURE_COUNT + 0;

	/**
	 * The number of structural features of the '<em>Xt Component</em>' class.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 * @ordered
	 */
	int XT_COMPONENT_FEATURE_COUNT = ExecutableModelingProfilePackage.XENCAPSULATED_CLASSIFIER_FEATURE_COUNT + 1;

	/**
	 * The operation id for the '<em>XNamed Element Name</em>' operation.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 * @ordered
	 */
	int XT_COMPONENT___XNAMED_ELEMENT_NAME__DIAGNOSTICCHAIN_MAP = ExecutableModelingProfilePackage.XENCAPSULATED_CLASSIFIER___XNAMED_ELEMENT_NAME__DIAGNOSTICCHAIN_MAP;

	/**
	 * The operation id for the '<em>XClassifier Features</em>' operation.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 * @ordered
	 */
	int XT_COMPONENT___XCLASSIFIER_FEATURES__DIAGNOSTICCHAIN_MAP = ExecutableModelingProfilePackage.XENCAPSULATED_CLASSIFIER___XCLASSIFIER_FEATURES__DIAGNOSTICCHAIN_MAP;

	/**
	 * The operation id for the '<em>XClassifier Nested Classifiers</em>' operation.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 * @ordered
	 */
	int XT_COMPONENT___XCLASSIFIER_NESTED_CLASSIFIERS__DIAGNOSTICCHAIN_MAP = ExecutableModelingProfilePackage.XENCAPSULATED_CLASSIFIER___XCLASSIFIER_NESTED_CLASSIFIERS__DIAGNOSTICCHAIN_MAP;

	/**
	 * The operation id for the '<em>XClassifier Generals</em>' operation.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 * @ordered
	 */
	int XT_COMPONENT___XCLASSIFIER_GENERALS__DIAGNOSTICCHAIN_MAP = ExecutableModelingProfilePackage.XENCAPSULATED_CLASSIFIER___XCLASSIFIER_GENERALS__DIAGNOSTICCHAIN_MAP;

	/**
	 * The operation id for the '<em>XClassifier Constraints</em>' operation.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 * @ordered
	 */
	int XT_COMPONENT___XCLASSIFIER_CONSTRAINTS__DIAGNOSTICCHAIN_MAP = ExecutableModelingProfilePackage.XENCAPSULATED_CLASSIFIER___XCLASSIFIER_CONSTRAINTS__DIAGNOSTICCHAIN_MAP;

	/**
	 * The operation id for the '<em>XEncapsulated Classifier Ports</em>' operation.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 * @ordered
	 */
	int XT_COMPONENT___XENCAPSULATED_CLASSIFIER_PORTS__DIAGNOSTICCHAIN_MAP = ExecutableModelingProfilePackage.XENCAPSULATED_CLASSIFIER___XENCAPSULATED_CLASSIFIER_PORTS__DIAGNOSTICCHAIN_MAP;

	/**
	 * The operation id for the '<em>XEncapsulated Classifierconnectors</em>' operation.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 * @ordered
	 */
	int XT_COMPONENT___XENCAPSULATED_CLASSIFIERCONNECTORS__DIAGNOSTICCHAIN_MAP = ExecutableModelingProfilePackage.XENCAPSULATED_CLASSIFIER___XENCAPSULATED_CLASSIFIERCONNECTORS__DIAGNOSTICCHAIN_MAP;

	/**
	 * The operation id for the '<em>XEncapsulated Classifier External</em>' operation.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 * @ordered
	 */
	int XT_COMPONENT___XENCAPSULATED_CLASSIFIER_EXTERNAL__DIAGNOSTICCHAIN_MAP = ExecutableModelingProfilePackage.XENCAPSULATED_CLASSIFIER___XENCAPSULATED_CLASSIFIER_EXTERNAL__DIAGNOSTICCHAIN_MAP;

	/**
	 * The operation id for the '<em>Xt Component Attributes</em>' operation.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 * @ordered
	 */
	int XT_COMPONENT___XT_COMPONENT_ATTRIBUTES__DIAGNOSTICCHAIN_MAP = ExecutableModelingProfilePackage.XENCAPSULATED_CLASSIFIER_OPERATION_COUNT + 0;

	/**
	 * The operation id for the '<em>Xt Component Behavioral Features</em>' operation.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 * @ordered
	 */
	int XT_COMPONENT___XT_COMPONENT_BEHAVIORAL_FEATURES__DIAGNOSTICCHAIN_MAP = ExecutableModelingProfilePackage.XENCAPSULATED_CLASSIFIER_OPERATION_COUNT + 1;

	/**
	 * The operation id for the '<em>Xt Component Owned Behaviors</em>' operation.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 * @ordered
	 */
	int XT_COMPONENT___XT_COMPONENT_OWNED_BEHAVIORS__DIAGNOSTICCHAIN_MAP = ExecutableModelingProfilePackage.XENCAPSULATED_CLASSIFIER_OPERATION_COUNT + 2;

	/**
	 * The operation id for the '<em>Xt Component Nested Classifiers</em>' operation.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 * @ordered
	 */
	int XT_COMPONENT___XT_COMPONENT_NESTED_CLASSIFIERS__DIAGNOSTICCHAIN_MAP = ExecutableModelingProfilePackage.XENCAPSULATED_CLASSIFIER_OPERATION_COUNT + 3;

	/**
	 * The operation id for the '<em>Xt Component Parts</em>' operation.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 * @ordered
	 */
	int XT_COMPONENT___XT_COMPONENT_PARTS__DIAGNOSTICCHAIN_MAP = ExecutableModelingProfilePackage.XENCAPSULATED_CLASSIFIER_OPERATION_COUNT + 4;

	/**
	 * The operation id for the '<em>Xt Component Generalization</em>' operation.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 * @ordered
	 */
	int XT_COMPONENT___XT_COMPONENT_GENERALIZATION__DIAGNOSTICCHAIN_MAP = ExecutableModelingProfilePackage.XENCAPSULATED_CLASSIFIER_OPERATION_COUNT + 5;

	/**
	 * The number of operations of the '<em>Xt Component</em>' class.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 * @ordered
	 */
	int XT_COMPONENT_OPERATION_COUNT = ExecutableModelingProfilePackage.XENCAPSULATED_CLASSIFIER_OPERATION_COUNT + 6;

	/**
	 * The meta object id for the '{@link com.ericsson.executablemodeling.xtuml.profile.xtumlprofile.impl.XtOperationImpl <em>Xt Operation</em>}' class.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @see com.ericsson.executablemodeling.xtuml.profile.xtumlprofile.impl.XtOperationImpl
	 * @see com.ericsson.executablemodeling.xtuml.profile.xtumlprofile.impl.xtUMLProfilePackageImpl#getXtOperation()
	 * @generated
	 */
	int XT_OPERATION = 3;

	/**
	 * The feature id for the '<em><b>Base Named Element</b></em>' reference.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 * @ordered
	 */
	int XT_OPERATION__BASE_NAMED_ELEMENT = ExecutableModelingProfilePackage.XOPERATION__BASE_NAMED_ELEMENT;

	/**
	 * The feature id for the '<em><b>Base Feature</b></em>' reference.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 * @ordered
	 */
	int XT_OPERATION__BASE_FEATURE = ExecutableModelingProfilePackage.XOPERATION__BASE_FEATURE;

	/**
	 * The feature id for the '<em><b>Base Namespace</b></em>' reference.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 * @ordered
	 */
	int XT_OPERATION__BASE_NAMESPACE = ExecutableModelingProfilePackage.XOPERATION__BASE_NAMESPACE;

	/**
	 * The feature id for the '<em><b>Base Operation</b></em>' reference.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 * @ordered
	 */
	int XT_OPERATION__BASE_OPERATION = ExecutableModelingProfilePackage.XOPERATION__BASE_OPERATION;

	/**
	 * The number of structural features of the '<em>Xt Operation</em>' class.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 * @ordered
	 */
	int XT_OPERATION_FEATURE_COUNT = ExecutableModelingProfilePackage.XOPERATION_FEATURE_COUNT + 0;

	/**
	 * The operation id for the '<em>XNamed Element Name</em>' operation.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 * @ordered
	 */
	int XT_OPERATION___XNAMED_ELEMENT_NAME__DIAGNOSTICCHAIN_MAP = ExecutableModelingProfilePackage.XOPERATION___XNAMED_ELEMENT_NAME__DIAGNOSTICCHAIN_MAP;

	/**
	 * The operation id for the '<em>XFeature Classifier</em>' operation.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 * @ordered
	 */
	int XT_OPERATION___XFEATURE_CLASSIFIER__DIAGNOSTICCHAIN_MAP = ExecutableModelingProfilePackage.XOPERATION___XFEATURE_CLASSIFIER__DIAGNOSTICCHAIN_MAP;

	/**
	 * The operation id for the '<em>XOperation Parameters</em>' operation.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 * @ordered
	 */
	int XT_OPERATION___XOPERATION_PARAMETERS__DIAGNOSTICCHAIN_MAP = ExecutableModelingProfilePackage.XOPERATION___XOPERATION_PARAMETERS__DIAGNOSTICCHAIN_MAP;

	/**
	 * The operation id for the '<em>XOperation One Method</em>' operation.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 * @ordered
	 */
	int XT_OPERATION___XOPERATION_ONE_METHOD__DIAGNOSTICCHAIN_MAP = ExecutableModelingProfilePackage.XOPERATION___XOPERATION_ONE_METHOD__DIAGNOSTICCHAIN_MAP;

	/**
	 * The operation id for the '<em>XOperation Imports</em>' operation.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 * @ordered
	 */
	int XT_OPERATION___XOPERATION_IMPORTS__DIAGNOSTICCHAIN_MAP = ExecutableModelingProfilePackage.XOPERATION___XOPERATION_IMPORTS__DIAGNOSTICCHAIN_MAP;

	/**
	 * The operation id for the '<em>XOperation Owned Rules</em>' operation.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 * @ordered
	 */
	int XT_OPERATION___XOPERATION_OWNED_RULES__DIAGNOSTICCHAIN_MAP = ExecutableModelingProfilePackage.XOPERATION___XOPERATION_OWNED_RULES__DIAGNOSTICCHAIN_MAP;

	/**
	 * The operation id for the '<em>XOperation Methods</em>' operation.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 * @ordered
	 */
	int XT_OPERATION___XOPERATION_METHODS__DIAGNOSTICCHAIN_MAP = ExecutableModelingProfilePackage.XOPERATION___XOPERATION_METHODS__DIAGNOSTICCHAIN_MAP;

	/**
	 * The operation id for the '<em>XOperation Constraints</em>' operation.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 * @ordered
	 */
	int XT_OPERATION___XOPERATION_CONSTRAINTS__DIAGNOSTICCHAIN_MAP = ExecutableModelingProfilePackage.XOPERATION___XOPERATION_CONSTRAINTS__DIAGNOSTICCHAIN_MAP;

	/**
	 * The number of operations of the '<em>Xt Operation</em>' class.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 * @ordered
	 */
	int XT_OPERATION_OPERATION_COUNT = ExecutableModelingProfilePackage.XOPERATION_OPERATION_COUNT + 0;

	/**
	 * The meta object id for the '{@link com.ericsson.executablemodeling.xtuml.profile.xtumlprofile.impl.XtParameterImpl <em>Xt Parameter</em>}' class.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @see com.ericsson.executablemodeling.xtuml.profile.xtumlprofile.impl.XtParameterImpl
	 * @see com.ericsson.executablemodeling.xtuml.profile.xtumlprofile.impl.xtUMLProfilePackageImpl#getXtParameter()
	 * @generated
	 */
	int XT_PARAMETER = 4;

	/**
	 * The feature id for the '<em><b>Base Typed Element</b></em>' reference.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 * @ordered
	 */
	int XT_PARAMETER__BASE_TYPED_ELEMENT = ExecutableModelingProfilePackage.XPARAMETER__BASE_TYPED_ELEMENT;

	/**
	 * The feature id for the '<em><b>Base Parameter</b></em>' reference.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 * @ordered
	 */
	int XT_PARAMETER__BASE_PARAMETER = ExecutableModelingProfilePackage.XPARAMETER__BASE_PARAMETER;

	/**
	 * The number of structural features of the '<em>Xt Parameter</em>' class.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 * @ordered
	 */
	int XT_PARAMETER_FEATURE_COUNT = ExecutableModelingProfilePackage.XPARAMETER_FEATURE_COUNT + 0;

	/**
	 * The operation id for the '<em>XTyped Element Type</em>' operation.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 * @ordered
	 */
	int XT_PARAMETER___XTYPED_ELEMENT_TYPE__DIAGNOSTICCHAIN_MAP = ExecutableModelingProfilePackage.XPARAMETER___XTYPED_ELEMENT_TYPE__DIAGNOSTICCHAIN_MAP;

	/**
	 * The number of operations of the '<em>Xt Parameter</em>' class.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 * @ordered
	 */
	int XT_PARAMETER_OPERATION_COUNT = ExecutableModelingProfilePackage.XPARAMETER_OPERATION_COUNT + 0;

	/**
	 * The meta object id for the '{@link com.ericsson.executablemodeling.xtuml.profile.xtumlprofile.impl.XtReceptionImpl <em>Xt Reception</em>}' class.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @see com.ericsson.executablemodeling.xtuml.profile.xtumlprofile.impl.XtReceptionImpl
	 * @see com.ericsson.executablemodeling.xtuml.profile.xtumlprofile.impl.xtUMLProfilePackageImpl#getXtReception()
	 * @generated
	 */
	int XT_RECEPTION = 5;

	/**
	 * The feature id for the '<em><b>Base Named Element</b></em>' reference.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 * @ordered
	 */
	int XT_RECEPTION__BASE_NAMED_ELEMENT = ExecutableModelingProfilePackage.XRECEPTION__BASE_NAMED_ELEMENT;

	/**
	 * The feature id for the '<em><b>Base Feature</b></em>' reference.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 * @ordered
	 */
	int XT_RECEPTION__BASE_FEATURE = ExecutableModelingProfilePackage.XRECEPTION__BASE_FEATURE;

	/**
	 * The feature id for the '<em><b>Base Reception</b></em>' reference.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 * @ordered
	 */
	int XT_RECEPTION__BASE_RECEPTION = ExecutableModelingProfilePackage.XRECEPTION__BASE_RECEPTION;

	/**
	 * The number of structural features of the '<em>Xt Reception</em>' class.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 * @ordered
	 */
	int XT_RECEPTION_FEATURE_COUNT = ExecutableModelingProfilePackage.XRECEPTION_FEATURE_COUNT + 0;

	/**
	 * The operation id for the '<em>XNamed Element Name</em>' operation.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 * @ordered
	 */
	int XT_RECEPTION___XNAMED_ELEMENT_NAME__DIAGNOSTICCHAIN_MAP = ExecutableModelingProfilePackage.XRECEPTION___XNAMED_ELEMENT_NAME__DIAGNOSTICCHAIN_MAP;

	/**
	 * The operation id for the '<em>XFeature Classifier</em>' operation.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 * @ordered
	 */
	int XT_RECEPTION___XFEATURE_CLASSIFIER__DIAGNOSTICCHAIN_MAP = ExecutableModelingProfilePackage.XRECEPTION___XFEATURE_CLASSIFIER__DIAGNOSTICCHAIN_MAP;

	/**
	 * The operation id for the '<em>XReception Signal</em>' operation.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 * @ordered
	 */
	int XT_RECEPTION___XRECEPTION_SIGNAL__DIAGNOSTICCHAIN_MAP = ExecutableModelingProfilePackage.XRECEPTION___XRECEPTION_SIGNAL__DIAGNOSTICCHAIN_MAP;

	/**
	 * The number of operations of the '<em>Xt Reception</em>' class.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 * @ordered
	 */
	int XT_RECEPTION_OPERATION_COUNT = ExecutableModelingProfilePackage.XRECEPTION_OPERATION_COUNT + 0;

	/**
	 * The meta object id for the '{@link com.ericsson.executablemodeling.xtuml.profile.xtumlprofile.impl.XtPartImpl <em>Xt Part</em>}' class.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @see com.ericsson.executablemodeling.xtuml.profile.xtumlprofile.impl.XtPartImpl
	 * @see com.ericsson.executablemodeling.xtuml.profile.xtumlprofile.impl.xtUMLProfilePackageImpl#getXtPart()
	 * @generated
	 */
	int XT_PART = 6;

	/**
	 * The feature id for the '<em><b>Base Named Element</b></em>' reference.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 * @ordered
	 */
	int XT_PART__BASE_NAMED_ELEMENT = ExecutableModelingProfilePackage.XPART__BASE_NAMED_ELEMENT;

	/**
	 * The feature id for the '<em><b>Base Feature</b></em>' reference.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 * @ordered
	 */
	int XT_PART__BASE_FEATURE = ExecutableModelingProfilePackage.XPART__BASE_FEATURE;

	/**
	 * The feature id for the '<em><b>Base Typed Element</b></em>' reference.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 * @ordered
	 */
	int XT_PART__BASE_TYPED_ELEMENT = ExecutableModelingProfilePackage.XPART__BASE_TYPED_ELEMENT;

	/**
	 * The feature id for the '<em><b>Base Property</b></em>' reference.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 * @ordered
	 */
	int XT_PART__BASE_PROPERTY = ExecutableModelingProfilePackage.XPART__BASE_PROPERTY;

	/**
	 * The number of structural features of the '<em>Xt Part</em>' class.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 * @ordered
	 */
	int XT_PART_FEATURE_COUNT = ExecutableModelingProfilePackage.XPART_FEATURE_COUNT + 0;

	/**
	 * The operation id for the '<em>XNamed Element Name</em>' operation.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 * @ordered
	 */
	int XT_PART___XNAMED_ELEMENT_NAME__DIAGNOSTICCHAIN_MAP = ExecutableModelingProfilePackage.XPART___XNAMED_ELEMENT_NAME__DIAGNOSTICCHAIN_MAP;

	/**
	 * The operation id for the '<em>XFeature Classifier</em>' operation.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 * @ordered
	 */
	int XT_PART___XFEATURE_CLASSIFIER__DIAGNOSTICCHAIN_MAP = ExecutableModelingProfilePackage.XPART___XFEATURE_CLASSIFIER__DIAGNOSTICCHAIN_MAP;

	/**
	 * The operation id for the '<em>XTyped Element Type</em>' operation.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 * @ordered
	 */
	int XT_PART___XTYPED_ELEMENT_TYPE__DIAGNOSTICCHAIN_MAP = ExecutableModelingProfilePackage.XPART___XTYPED_ELEMENT_TYPE__DIAGNOSTICCHAIN_MAP;

	/**
	 * The operation id for the '<em>XPart Classifier</em>' operation.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 * @ordered
	 */
	int XT_PART___XPART_CLASSIFIER__DIAGNOSTICCHAIN_MAP = ExecutableModelingProfilePackage.XPART___XPART_CLASSIFIER__DIAGNOSTICCHAIN_MAP;

	/**
	 * The operation id for the '<em>Xt Part Type</em>' operation.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 * @ordered
	 */
	int XT_PART___XT_PART_TYPE__DIAGNOSTICCHAIN_MAP = ExecutableModelingProfilePackage.XPART_OPERATION_COUNT + 0;

	/**
	 * The operation id for the '<em>Xt Part Composition</em>' operation.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 * @ordered
	 */
	int XT_PART___XT_PART_COMPOSITION__DIAGNOSTICCHAIN_MAP = ExecutableModelingProfilePackage.XPART_OPERATION_COUNT + 1;

	/**
	 * The operation id for the '<em>Xt Part Visibility</em>' operation.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 * @ordered
	 */
	int XT_PART___XT_PART_VISIBILITY__DIAGNOSTICCHAIN_MAP = ExecutableModelingProfilePackage.XPART_OPERATION_COUNT + 2;

	/**
	 * The number of operations of the '<em>Xt Part</em>' class.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 * @ordered
	 */
	int XT_PART_OPERATION_COUNT = ExecutableModelingProfilePackage.XPART_OPERATION_COUNT + 3;

	/**
	 * The meta object id for the '{@link com.ericsson.executablemodeling.xtuml.profile.xtumlprofile.impl.XtPortImpl <em>Xt Port</em>}' class.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @see com.ericsson.executablemodeling.xtuml.profile.xtumlprofile.impl.XtPortImpl
	 * @see com.ericsson.executablemodeling.xtuml.profile.xtumlprofile.impl.xtUMLProfilePackageImpl#getXtPort()
	 * @generated
	 */
	int XT_PORT = 7;

	/**
	 * The feature id for the '<em><b>Base Named Element</b></em>' reference.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 * @ordered
	 */
	int XT_PORT__BASE_NAMED_ELEMENT = ExecutableModelingProfilePackage.XPORT__BASE_NAMED_ELEMENT;

	/**
	 * The feature id for the '<em><b>Base Feature</b></em>' reference.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 * @ordered
	 */
	int XT_PORT__BASE_FEATURE = ExecutableModelingProfilePackage.XPORT__BASE_FEATURE;

	/**
	 * The feature id for the '<em><b>Base Port</b></em>' reference.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 * @ordered
	 */
	int XT_PORT__BASE_PORT = ExecutableModelingProfilePackage.XPORT__BASE_PORT;

	/**
	 * The number of structural features of the '<em>Xt Port</em>' class.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 * @ordered
	 */
	int XT_PORT_FEATURE_COUNT = ExecutableModelingProfilePackage.XPORT_FEATURE_COUNT + 0;

	/**
	 * The operation id for the '<em>XNamed Element Name</em>' operation.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 * @ordered
	 */
	int XT_PORT___XNAMED_ELEMENT_NAME__DIAGNOSTICCHAIN_MAP = ExecutableModelingProfilePackage.XPORT___XNAMED_ELEMENT_NAME__DIAGNOSTICCHAIN_MAP;

	/**
	 * The operation id for the '<em>XFeature Classifier</em>' operation.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 * @ordered
	 */
	int XT_PORT___XFEATURE_CLASSIFIER__DIAGNOSTICCHAIN_MAP = ExecutableModelingProfilePackage.XPORT___XFEATURE_CLASSIFIER__DIAGNOSTICCHAIN_MAP;

	/**
	 * The operation id for the '<em>XPort Classifier</em>' operation.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 * @ordered
	 */
	int XT_PORT___XPORT_CLASSIFIER__DIAGNOSTICCHAIN_MAP = ExecutableModelingProfilePackage.XPORT___XPORT_CLASSIFIER__DIAGNOSTICCHAIN_MAP;

	/**
	 * The operation id for the '<em>XPort Ordering Uniqueness</em>' operation.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 * @ordered
	 */
	int XT_PORT___XPORT_ORDERING_UNIQUENESS__DIAGNOSTICCHAIN_MAP = ExecutableModelingProfilePackage.XPORT___XPORT_ORDERING_UNIQUENESS__DIAGNOSTICCHAIN_MAP;

	/**
	 * The operation id for the '<em>XPort Type</em>' operation.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 * @ordered
	 */
	int XT_PORT___XPORT_TYPE__DIAGNOSTICCHAIN_MAP = ExecutableModelingProfilePackage.XPORT___XPORT_TYPE__DIAGNOSTICCHAIN_MAP;

	/**
	 * The operation id for the '<em>XPort Behavior Port</em>' operation.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 * @ordered
	 */
	int XT_PORT___XPORT_BEHAVIOR_PORT__DIAGNOSTICCHAIN_MAP = ExecutableModelingProfilePackage.XPORT___XPORT_BEHAVIOR_PORT__DIAGNOSTICCHAIN_MAP;

	/**
	 * The operation id for the '<em>XPort Visibility</em>' operation.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 * @ordered
	 */
	int XT_PORT___XPORT_VISIBILITY__DIAGNOSTICCHAIN_MAP = ExecutableModelingProfilePackage.XPORT___XPORT_VISIBILITY__DIAGNOSTICCHAIN_MAP;

	/**
	 * The operation id for the '<em>Xt Port Visibility</em>' operation.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 * @ordered
	 */
	int XT_PORT___XT_PORT_VISIBILITY__DIAGNOSTICCHAIN_MAP = ExecutableModelingProfilePackage.XPORT_OPERATION_COUNT + 0;

	/**
	 * The operation id for the '<em>Xt Connector Visibility</em>' operation.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 * @ordered
	 */
	int XT_PORT___XT_CONNECTOR_VISIBILITY__DIAGNOSTICCHAIN_MAP = ExecutableModelingProfilePackage.XPORT_OPERATION_COUNT + 1;

	/**
	 * The operation id for the '<em>Xt Port Behavior Port</em>' operation.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 * @ordered
	 */
	int XT_PORT___XT_PORT_BEHAVIOR_PORT__DIAGNOSTICCHAIN_MAP = ExecutableModelingProfilePackage.XPORT_OPERATION_COUNT + 2;

	/**
	 * The number of operations of the '<em>Xt Port</em>' class.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 * @ordered
	 */
	int XT_PORT_OPERATION_COUNT = ExecutableModelingProfilePackage.XPORT_OPERATION_COUNT + 3;

	/**
	 * The meta object id for the '{@link com.ericsson.executablemodeling.xtuml.profile.xtumlprofile.impl.XtConnectorImpl <em>Xt Connector</em>}' class.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @see com.ericsson.executablemodeling.xtuml.profile.xtumlprofile.impl.XtConnectorImpl
	 * @see com.ericsson.executablemodeling.xtuml.profile.xtumlprofile.impl.xtUMLProfilePackageImpl#getXtConnector()
	 * @generated
	 */
	int XT_CONNECTOR = 8;

	/**
	 * The feature id for the '<em><b>Base Named Element</b></em>' reference.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 * @ordered
	 */
	int XT_CONNECTOR__BASE_NAMED_ELEMENT = ExecutableModelingProfilePackage.XCONNECTOR__BASE_NAMED_ELEMENT;

	/**
	 * The feature id for the '<em><b>Base Feature</b></em>' reference.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 * @ordered
	 */
	int XT_CONNECTOR__BASE_FEATURE = ExecutableModelingProfilePackage.XCONNECTOR__BASE_FEATURE;

	/**
	 * The feature id for the '<em><b>Base Connector</b></em>' reference.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 * @ordered
	 */
	int XT_CONNECTOR__BASE_CONNECTOR = ExecutableModelingProfilePackage.XCONNECTOR__BASE_CONNECTOR;

	/**
	 * The number of structural features of the '<em>Xt Connector</em>' class.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 * @ordered
	 */
	int XT_CONNECTOR_FEATURE_COUNT = ExecutableModelingProfilePackage.XCONNECTOR_FEATURE_COUNT + 0;

	/**
	 * The operation id for the '<em>XNamed Element Name</em>' operation.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 * @ordered
	 */
	int XT_CONNECTOR___XNAMED_ELEMENT_NAME__DIAGNOSTICCHAIN_MAP = ExecutableModelingProfilePackage.XCONNECTOR___XNAMED_ELEMENT_NAME__DIAGNOSTICCHAIN_MAP;

	/**
	 * The operation id for the '<em>XFeature Classifier</em>' operation.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 * @ordered
	 */
	int XT_CONNECTOR___XFEATURE_CLASSIFIER__DIAGNOSTICCHAIN_MAP = ExecutableModelingProfilePackage.XCONNECTOR___XFEATURE_CLASSIFIER__DIAGNOSTICCHAIN_MAP;

	/**
	 * The operation id for the '<em>XConnector Classifier</em>' operation.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 * @ordered
	 */
	int XT_CONNECTOR___XCONNECTOR_CLASSIFIER__DIAGNOSTICCHAIN_MAP = ExecutableModelingProfilePackage.XCONNECTOR___XCONNECTOR_CLASSIFIER__DIAGNOSTICCHAIN_MAP;

	/**
	 * The operation id for the '<em>XConnector Ends</em>' operation.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 * @ordered
	 */
	int XT_CONNECTOR___XCONNECTOR_ENDS__DIAGNOSTICCHAIN_MAP = ExecutableModelingProfilePackage.XCONNECTOR___XCONNECTOR_ENDS__DIAGNOSTICCHAIN_MAP;

	/**
	 * The operation id for the '<em>Xt Connector Type</em>' operation.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 * @ordered
	 */
	int XT_CONNECTOR___XT_CONNECTOR_TYPE__DIAGNOSTICCHAIN_MAP = ExecutableModelingProfilePackage.XCONNECTOR___XT_CONNECTOR_TYPE__DIAGNOSTICCHAIN_MAP;

	/**
	 * The operation id for the '<em>Xt Connector Connector Ends</em>' operation.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 * @ordered
	 */
	int XT_CONNECTOR___XT_CONNECTOR_CONNECTOR_ENDS__DIAGNOSTICCHAIN_MAP = ExecutableModelingProfilePackage.XCONNECTOR_OPERATION_COUNT + 0;

	/**
	 * The number of operations of the '<em>Xt Connector</em>' class.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 * @ordered
	 */
	int XT_CONNECTOR_OPERATION_COUNT = ExecutableModelingProfilePackage.XCONNECTOR_OPERATION_COUNT + 1;

	/**
	 * The meta object id for the '{@link com.ericsson.executablemodeling.xtuml.profile.xtumlprofile.impl.XtProtocolContainerImpl <em>Xt Protocol Container</em>}' class.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @see com.ericsson.executablemodeling.xtuml.profile.xtumlprofile.impl.XtProtocolContainerImpl
	 * @see com.ericsson.executablemodeling.xtuml.profile.xtumlprofile.impl.xtUMLProfilePackageImpl#getXtProtocolContainer()
	 * @generated
	 */
	int XT_PROTOCOL_CONTAINER = 9;

	/**
	 * The feature id for the '<em><b>Base Package</b></em>' reference.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 * @ordered
	 */
	int XT_PROTOCOL_CONTAINER__BASE_PACKAGE = ExecutableModelingProfilePackage.XPROTOCOL_CONTAINER__BASE_PACKAGE;

	/**
	 * The number of structural features of the '<em>Xt Protocol Container</em>' class.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 * @ordered
	 */
	int XT_PROTOCOL_CONTAINER_FEATURE_COUNT = ExecutableModelingProfilePackage.XPROTOCOL_CONTAINER_FEATURE_COUNT + 0;

	/**
	 * The operation id for the '<em>XProtocol Container Protocol</em>' operation.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 * @ordered
	 */
	int XT_PROTOCOL_CONTAINER___XPROTOCOL_CONTAINER_PROTOCOL__DIAGNOSTICCHAIN_MAP = ExecutableModelingProfilePackage.XPROTOCOL_CONTAINER___XPROTOCOL_CONTAINER_PROTOCOL__DIAGNOSTICCHAIN_MAP;

	/**
	 * The number of operations of the '<em>Xt Protocol Container</em>' class.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 * @ordered
	 */
	int XT_PROTOCOL_CONTAINER_OPERATION_COUNT = ExecutableModelingProfilePackage.XPROTOCOL_CONTAINER_OPERATION_COUNT + 0;

	/**
	 * The meta object id for the '{@link com.ericsson.executablemodeling.xtuml.profile.xtumlprofile.impl.XtProtocolImpl <em>Xt Protocol</em>}' class.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @see com.ericsson.executablemodeling.xtuml.profile.xtumlprofile.impl.XtProtocolImpl
	 * @see com.ericsson.executablemodeling.xtuml.profile.xtumlprofile.impl.xtUMLProfilePackageImpl#getXtProtocol()
	 * @generated
	 */
	int XT_PROTOCOL = 10;

	/**
	 * The feature id for the '<em><b>Base Named Element</b></em>' reference.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 * @ordered
	 */
	int XT_PROTOCOL__BASE_NAMED_ELEMENT = ExecutableModelingProfilePackage.XPROTOCOL__BASE_NAMED_ELEMENT;

	/**
	 * The feature id for the '<em><b>Base Namespace</b></em>' reference.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 * @ordered
	 */
	int XT_PROTOCOL__BASE_NAMESPACE = ExecutableModelingProfilePackage.XPROTOCOL__BASE_NAMESPACE;

	/**
	 * The feature id for the '<em><b>Base Classifier</b></em>' reference.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 * @ordered
	 */
	int XT_PROTOCOL__BASE_CLASSIFIER = ExecutableModelingProfilePackage.XPROTOCOL__BASE_CLASSIFIER;

	/**
	 * The feature id for the '<em><b>Base Behaviored Classifier</b></em>' reference.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 * @ordered
	 */
	int XT_PROTOCOL__BASE_BEHAVIORED_CLASSIFIER = ExecutableModelingProfilePackage.XPROTOCOL__BASE_BEHAVIORED_CLASSIFIER;

	/**
	 * The feature id for the '<em><b>Base Class</b></em>' reference.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 * @ordered
	 */
	int XT_PROTOCOL__BASE_CLASS = ExecutableModelingProfilePackage.XPROTOCOL_FEATURE_COUNT + 0;

	/**
	 * The number of structural features of the '<em>Xt Protocol</em>' class.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 * @ordered
	 */
	int XT_PROTOCOL_FEATURE_COUNT = ExecutableModelingProfilePackage.XPROTOCOL_FEATURE_COUNT + 1;

	/**
	 * The operation id for the '<em>XNamed Element Name</em>' operation.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 * @ordered
	 */
	int XT_PROTOCOL___XNAMED_ELEMENT_NAME__DIAGNOSTICCHAIN_MAP = ExecutableModelingProfilePackage.XPROTOCOL___XNAMED_ELEMENT_NAME__DIAGNOSTICCHAIN_MAP;

	/**
	 * The operation id for the '<em>XClassifier Features</em>' operation.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 * @ordered
	 */
	int XT_PROTOCOL___XCLASSIFIER_FEATURES__DIAGNOSTICCHAIN_MAP = ExecutableModelingProfilePackage.XPROTOCOL___XCLASSIFIER_FEATURES__DIAGNOSTICCHAIN_MAP;

	/**
	 * The operation id for the '<em>XClassifier Nested Classifiers</em>' operation.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 * @ordered
	 */
	int XT_PROTOCOL___XCLASSIFIER_NESTED_CLASSIFIERS__DIAGNOSTICCHAIN_MAP = ExecutableModelingProfilePackage.XPROTOCOL___XCLASSIFIER_NESTED_CLASSIFIERS__DIAGNOSTICCHAIN_MAP;

	/**
	 * The operation id for the '<em>XClassifier Generals</em>' operation.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 * @ordered
	 */
	int XT_PROTOCOL___XCLASSIFIER_GENERALS__DIAGNOSTICCHAIN_MAP = ExecutableModelingProfilePackage.XPROTOCOL___XCLASSIFIER_GENERALS__DIAGNOSTICCHAIN_MAP;

	/**
	 * The operation id for the '<em>XClassifier Constraints</em>' operation.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 * @ordered
	 */
	int XT_PROTOCOL___XCLASSIFIER_CONSTRAINTS__DIAGNOSTICCHAIN_MAP = ExecutableModelingProfilePackage.XPROTOCOL___XCLASSIFIER_CONSTRAINTS__DIAGNOSTICCHAIN_MAP;

	/**
	 * The operation id for the '<em>XProtocol Incoming Interface</em>' operation.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 * @ordered
	 */
	int XT_PROTOCOL___XPROTOCOL_INCOMING_INTERFACE__DIAGNOSTICCHAIN_MAP = ExecutableModelingProfilePackage.XPROTOCOL___XPROTOCOL_INCOMING_INTERFACE__DIAGNOSTICCHAIN_MAP;

	/**
	 * The operation id for the '<em>XProtocol Protocol Container</em>' operation.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 * @ordered
	 */
	int XT_PROTOCOL___XPROTOCOL_PROTOCOL_CONTAINER__DIAGNOSTICCHAIN_MAP = ExecutableModelingProfilePackage.XPROTOCOL___XPROTOCOL_PROTOCOL_CONTAINER__DIAGNOSTICCHAIN_MAP;

	/**
	 * The operation id for the '<em>XProtocol Outgoing Interface</em>' operation.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 * @ordered
	 */
	int XT_PROTOCOL___XPROTOCOL_OUTGOING_INTERFACE__DIAGNOSTICCHAIN_MAP = ExecutableModelingProfilePackage.XPROTOCOL___XPROTOCOL_OUTGOING_INTERFACE__DIAGNOSTICCHAIN_MAP;

	/**
	 * The operation id for the '<em>XProtocol Symmetric Interface</em>' operation.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 * @ordered
	 */
	int XT_PROTOCOL___XPROTOCOL_SYMMETRIC_INTERFACE__DIAGNOSTICCHAIN_MAP = ExecutableModelingProfilePackage.XPROTOCOL___XPROTOCOL_SYMMETRIC_INTERFACE__DIAGNOSTICCHAIN_MAP;

	/**
	 * The operation id for the '<em>Xt Protocol Nested Classifiers</em>' operation.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 * @ordered
	 */
	int XT_PROTOCOL___XT_PROTOCOL_NESTED_CLASSIFIERS__DIAGNOSTICCHAIN_MAP = ExecutableModelingProfilePackage.XPROTOCOL_OPERATION_COUNT + 0;

	/**
	 * The operation id for the '<em>Xt Protocol Behaviors</em>' operation.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 * @ordered
	 */
	int XT_PROTOCOL___XT_PROTOCOL_BEHAVIORS__DIAGNOSTICCHAIN_MAP = ExecutableModelingProfilePackage.XPROTOCOL_OPERATION_COUNT + 1;

	/**
	 * The number of operations of the '<em>Xt Protocol</em>' class.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 * @ordered
	 */
	int XT_PROTOCOL_OPERATION_COUNT = ExecutableModelingProfilePackage.XPROTOCOL_OPERATION_COUNT + 2;

	/**
	 * The meta object id for the '{@link com.ericsson.executablemodeling.xtuml.profile.xtumlprofile.impl.XtMessageSetImpl <em>Xt Message Set</em>}' class.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @see com.ericsson.executablemodeling.xtuml.profile.xtumlprofile.impl.XtMessageSetImpl
	 * @see com.ericsson.executablemodeling.xtuml.profile.xtumlprofile.impl.xtUMLProfilePackageImpl#getXtMessageSet()
	 * @generated
	 */
	int XT_MESSAGE_SET = 11;

	/**
	 * The feature id for the '<em><b>Base Named Element</b></em>' reference.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 * @ordered
	 */
	int XT_MESSAGE_SET__BASE_NAMED_ELEMENT = ExecutableModelingProfilePackage.XMESSAGE_SET__BASE_NAMED_ELEMENT;

	/**
	 * The feature id for the '<em><b>Base Namespace</b></em>' reference.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 * @ordered
	 */
	int XT_MESSAGE_SET__BASE_NAMESPACE = ExecutableModelingProfilePackage.XMESSAGE_SET__BASE_NAMESPACE;

	/**
	 * The feature id for the '<em><b>Base Classifier</b></em>' reference.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 * @ordered
	 */
	int XT_MESSAGE_SET__BASE_CLASSIFIER = ExecutableModelingProfilePackage.XMESSAGE_SET__BASE_CLASSIFIER;

	/**
	 * The feature id for the '<em><b>Base Interface</b></em>' reference.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 * @ordered
	 */
	int XT_MESSAGE_SET__BASE_INTERFACE = ExecutableModelingProfilePackage.XMESSAGE_SET__BASE_INTERFACE;

	/**
	 * The feature id for the '<em><b>Message Kind</b></em>' attribute.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 * @ordered
	 */
	int XT_MESSAGE_SET__MESSAGE_KIND = ExecutableModelingProfilePackage.XMESSAGE_SET__MESSAGE_KIND;

	/**
	 * The number of structural features of the '<em>Xt Message Set</em>' class.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 * @ordered
	 */
	int XT_MESSAGE_SET_FEATURE_COUNT = ExecutableModelingProfilePackage.XMESSAGE_SET_FEATURE_COUNT + 0;

	/**
	 * The operation id for the '<em>XNamed Element Name</em>' operation.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 * @ordered
	 */
	int XT_MESSAGE_SET___XNAMED_ELEMENT_NAME__DIAGNOSTICCHAIN_MAP = ExecutableModelingProfilePackage.XMESSAGE_SET___XNAMED_ELEMENT_NAME__DIAGNOSTICCHAIN_MAP;

	/**
	 * The operation id for the '<em>XClassifier Features</em>' operation.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 * @ordered
	 */
	int XT_MESSAGE_SET___XCLASSIFIER_FEATURES__DIAGNOSTICCHAIN_MAP = ExecutableModelingProfilePackage.XMESSAGE_SET___XCLASSIFIER_FEATURES__DIAGNOSTICCHAIN_MAP;

	/**
	 * The operation id for the '<em>XClassifier Nested Classifiers</em>' operation.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 * @ordered
	 */
	int XT_MESSAGE_SET___XCLASSIFIER_NESTED_CLASSIFIERS__DIAGNOSTICCHAIN_MAP = ExecutableModelingProfilePackage.XMESSAGE_SET___XCLASSIFIER_NESTED_CLASSIFIERS__DIAGNOSTICCHAIN_MAP;

	/**
	 * The operation id for the '<em>XClassifier Generals</em>' operation.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 * @ordered
	 */
	int XT_MESSAGE_SET___XCLASSIFIER_GENERALS__DIAGNOSTICCHAIN_MAP = ExecutableModelingProfilePackage.XMESSAGE_SET___XCLASSIFIER_GENERALS__DIAGNOSTICCHAIN_MAP;

	/**
	 * The operation id for the '<em>XClassifier Constraints</em>' operation.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 * @ordered
	 */
	int XT_MESSAGE_SET___XCLASSIFIER_CONSTRAINTS__DIAGNOSTICCHAIN_MAP = ExecutableModelingProfilePackage.XMESSAGE_SET___XCLASSIFIER_CONSTRAINTS__DIAGNOSTICCHAIN_MAP;

	/**
	 * The operation id for the '<em>XMessage Set Incoming</em>' operation.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 * @ordered
	 */
	int XT_MESSAGE_SET___XMESSAGE_SET_INCOMING__DIAGNOSTICCHAIN_MAP = ExecutableModelingProfilePackage.XMESSAGE_SET___XMESSAGE_SET_INCOMING__DIAGNOSTICCHAIN_MAP;

	/**
	 * The operation id for the '<em>XMessage Set Outgoing</em>' operation.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 * @ordered
	 */
	int XT_MESSAGE_SET___XMESSAGE_SET_OUTGOING__DIAGNOSTICCHAIN_MAP = ExecutableModelingProfilePackage.XMESSAGE_SET___XMESSAGE_SET_OUTGOING__DIAGNOSTICCHAIN_MAP;

	/**
	 * The operation id for the '<em>XMessage Set Symmetric</em>' operation.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 * @ordered
	 */
	int XT_MESSAGE_SET___XMESSAGE_SET_SYMMETRIC__DIAGNOSTICCHAIN_MAP = ExecutableModelingProfilePackage.XMESSAGE_SET___XMESSAGE_SET_SYMMETRIC__DIAGNOSTICCHAIN_MAP;

	/**
	 * The operation id for the '<em>Xt Message Set Nested Classifiers</em>' operation.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 * @ordered
	 */
	int XT_MESSAGE_SET___XT_MESSAGE_SET_NESTED_CLASSIFIERS__DIAGNOSTICCHAIN_MAP = ExecutableModelingProfilePackage.XMESSAGE_SET_OPERATION_COUNT + 0;

	/**
	 * The operation id for the '<em>Xt Message Set Attributes</em>' operation.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 * @ordered
	 */
	int XT_MESSAGE_SET___XT_MESSAGE_SET_ATTRIBUTES__DIAGNOSTICCHAIN_MAP = ExecutableModelingProfilePackage.XMESSAGE_SET_OPERATION_COUNT + 1;

	/**
	 * The number of operations of the '<em>Xt Message Set</em>' class.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 * @ordered
	 */
	int XT_MESSAGE_SET_OPERATION_COUNT = ExecutableModelingProfilePackage.XMESSAGE_SET_OPERATION_COUNT + 2;

	/**
	 * The meta object id for the '{@link com.ericsson.executablemodeling.xtuml.profile.xtumlprofile.impl.XtSignalImpl <em>Xt Signal</em>}' class.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @see com.ericsson.executablemodeling.xtuml.profile.xtumlprofile.impl.XtSignalImpl
	 * @see com.ericsson.executablemodeling.xtuml.profile.xtumlprofile.impl.xtUMLProfilePackageImpl#getXtSignal()
	 * @generated
	 */
	int XT_SIGNAL = 12;

	/**
	 * The feature id for the '<em><b>Base Named Element</b></em>' reference.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 * @ordered
	 */
	int XT_SIGNAL__BASE_NAMED_ELEMENT = ExecutableModelingProfilePackage.XSIGNAL__BASE_NAMED_ELEMENT;

	/**
	 * The feature id for the '<em><b>Base Namespace</b></em>' reference.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 * @ordered
	 */
	int XT_SIGNAL__BASE_NAMESPACE = ExecutableModelingProfilePackage.XSIGNAL__BASE_NAMESPACE;

	/**
	 * The feature id for the '<em><b>Base Classifier</b></em>' reference.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 * @ordered
	 */
	int XT_SIGNAL__BASE_CLASSIFIER = ExecutableModelingProfilePackage.XSIGNAL__BASE_CLASSIFIER;

	/**
	 * The feature id for the '<em><b>Base Signal</b></em>' reference.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 * @ordered
	 */
	int XT_SIGNAL__BASE_SIGNAL = ExecutableModelingProfilePackage.XSIGNAL__BASE_SIGNAL;

	/**
	 * The number of structural features of the '<em>Xt Signal</em>' class.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 * @ordered
	 */
	int XT_SIGNAL_FEATURE_COUNT = ExecutableModelingProfilePackage.XSIGNAL_FEATURE_COUNT + 0;

	/**
	 * The operation id for the '<em>XNamed Element Name</em>' operation.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 * @ordered
	 */
	int XT_SIGNAL___XNAMED_ELEMENT_NAME__DIAGNOSTICCHAIN_MAP = ExecutableModelingProfilePackage.XSIGNAL___XNAMED_ELEMENT_NAME__DIAGNOSTICCHAIN_MAP;

	/**
	 * The operation id for the '<em>XClassifier Features</em>' operation.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 * @ordered
	 */
	int XT_SIGNAL___XCLASSIFIER_FEATURES__DIAGNOSTICCHAIN_MAP = ExecutableModelingProfilePackage.XSIGNAL___XCLASSIFIER_FEATURES__DIAGNOSTICCHAIN_MAP;

	/**
	 * The operation id for the '<em>XClassifier Nested Classifiers</em>' operation.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 * @ordered
	 */
	int XT_SIGNAL___XCLASSIFIER_NESTED_CLASSIFIERS__DIAGNOSTICCHAIN_MAP = ExecutableModelingProfilePackage.XSIGNAL___XCLASSIFIER_NESTED_CLASSIFIERS__DIAGNOSTICCHAIN_MAP;

	/**
	 * The operation id for the '<em>XClassifier Generals</em>' operation.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 * @ordered
	 */
	int XT_SIGNAL___XCLASSIFIER_GENERALS__DIAGNOSTICCHAIN_MAP = ExecutableModelingProfilePackage.XSIGNAL___XCLASSIFIER_GENERALS__DIAGNOSTICCHAIN_MAP;

	/**
	 * The operation id for the '<em>XClassifier Constraints</em>' operation.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 * @ordered
	 */
	int XT_SIGNAL___XCLASSIFIER_CONSTRAINTS__DIAGNOSTICCHAIN_MAP = ExecutableModelingProfilePackage.XSIGNAL___XCLASSIFIER_CONSTRAINTS__DIAGNOSTICCHAIN_MAP;

	/**
	 * The operation id for the '<em>XSignal Visibility</em>' operation.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 * @ordered
	 */
	int XT_SIGNAL___XSIGNAL_VISIBILITY__DIAGNOSTICCHAIN_MAP = ExecutableModelingProfilePackage.XSIGNAL___XSIGNAL_VISIBILITY__DIAGNOSTICCHAIN_MAP;

	/**
	 * The number of operations of the '<em>Xt Signal</em>' class.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 * @ordered
	 */
	int XT_SIGNAL_OPERATION_COUNT = ExecutableModelingProfilePackage.XSIGNAL_OPERATION_COUNT + 0;

	/**
	 * The meta object id for the '{@link com.ericsson.executablemodeling.xtuml.profile.xtumlprofile.impl.XtDataTypeImpl <em>Xt Data Type</em>}' class.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @see com.ericsson.executablemodeling.xtuml.profile.xtumlprofile.impl.XtDataTypeImpl
	 * @see com.ericsson.executablemodeling.xtuml.profile.xtumlprofile.impl.xtUMLProfilePackageImpl#getXtDataType()
	 * @generated
	 */
	int XT_DATA_TYPE = 13;

	/**
	 * The feature id for the '<em><b>Base Named Element</b></em>' reference.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 * @ordered
	 */
	int XT_DATA_TYPE__BASE_NAMED_ELEMENT = ExecutableModelingProfilePackage.XDATA_TYPE__BASE_NAMED_ELEMENT;

	/**
	 * The feature id for the '<em><b>Base Namespace</b></em>' reference.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 * @ordered
	 */
	int XT_DATA_TYPE__BASE_NAMESPACE = ExecutableModelingProfilePackage.XDATA_TYPE__BASE_NAMESPACE;

	/**
	 * The feature id for the '<em><b>Base Classifier</b></em>' reference.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 * @ordered
	 */
	int XT_DATA_TYPE__BASE_CLASSIFIER = ExecutableModelingProfilePackage.XDATA_TYPE__BASE_CLASSIFIER;

	/**
	 * The feature id for the '<em><b>Base Data Type</b></em>' reference.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 * @ordered
	 */
	int XT_DATA_TYPE__BASE_DATA_TYPE = ExecutableModelingProfilePackage.XDATA_TYPE__BASE_DATA_TYPE;

	/**
	 * The number of structural features of the '<em>Xt Data Type</em>' class.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 * @ordered
	 */
	int XT_DATA_TYPE_FEATURE_COUNT = ExecutableModelingProfilePackage.XDATA_TYPE_FEATURE_COUNT + 0;

	/**
	 * The operation id for the '<em>XNamed Element Name</em>' operation.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 * @ordered
	 */
	int XT_DATA_TYPE___XNAMED_ELEMENT_NAME__DIAGNOSTICCHAIN_MAP = ExecutableModelingProfilePackage.XDATA_TYPE___XNAMED_ELEMENT_NAME__DIAGNOSTICCHAIN_MAP;

	/**
	 * The operation id for the '<em>XClassifier Features</em>' operation.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 * @ordered
	 */
	int XT_DATA_TYPE___XCLASSIFIER_FEATURES__DIAGNOSTICCHAIN_MAP = ExecutableModelingProfilePackage.XDATA_TYPE___XCLASSIFIER_FEATURES__DIAGNOSTICCHAIN_MAP;

	/**
	 * The operation id for the '<em>XClassifier Nested Classifiers</em>' operation.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 * @ordered
	 */
	int XT_DATA_TYPE___XCLASSIFIER_NESTED_CLASSIFIERS__DIAGNOSTICCHAIN_MAP = ExecutableModelingProfilePackage.XDATA_TYPE___XCLASSIFIER_NESTED_CLASSIFIERS__DIAGNOSTICCHAIN_MAP;

	/**
	 * The operation id for the '<em>XClassifier Generals</em>' operation.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 * @ordered
	 */
	int XT_DATA_TYPE___XCLASSIFIER_GENERALS__DIAGNOSTICCHAIN_MAP = ExecutableModelingProfilePackage.XDATA_TYPE___XCLASSIFIER_GENERALS__DIAGNOSTICCHAIN_MAP;

	/**
	 * The operation id for the '<em>XClassifier Constraints</em>' operation.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 * @ordered
	 */
	int XT_DATA_TYPE___XCLASSIFIER_CONSTRAINTS__DIAGNOSTICCHAIN_MAP = ExecutableModelingProfilePackage.XDATA_TYPE___XCLASSIFIER_CONSTRAINTS__DIAGNOSTICCHAIN_MAP;

	/**
	 * The operation id for the '<em>XData Type Operations</em>' operation.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 * @ordered
	 */
	int XT_DATA_TYPE___XDATA_TYPE_OPERATIONS__DIAGNOSTICCHAIN_MAP = ExecutableModelingProfilePackage.XDATA_TYPE___XDATA_TYPE_OPERATIONS__DIAGNOSTICCHAIN_MAP;

	/**
	 * The number of operations of the '<em>Xt Data Type</em>' class.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 * @ordered
	 */
	int XT_DATA_TYPE_OPERATION_COUNT = ExecutableModelingProfilePackage.XDATA_TYPE_OPERATION_COUNT + 0;

	/**
	 * The meta object id for the '{@link com.ericsson.executablemodeling.xtuml.profile.xtumlprofile.impl.XtEnumerationImpl <em>Xt Enumeration</em>}' class.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @see com.ericsson.executablemodeling.xtuml.profile.xtumlprofile.impl.XtEnumerationImpl
	 * @see com.ericsson.executablemodeling.xtuml.profile.xtumlprofile.impl.xtUMLProfilePackageImpl#getXtEnumeration()
	 * @generated
	 */
	int XT_ENUMERATION = 14;

	/**
	 * The feature id for the '<em><b>Base Named Element</b></em>' reference.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 * @ordered
	 */
	int XT_ENUMERATION__BASE_NAMED_ELEMENT = ExecutableModelingProfilePackage.XENUMERATION__BASE_NAMED_ELEMENT;

	/**
	 * The feature id for the '<em><b>Base Namespace</b></em>' reference.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 * @ordered
	 */
	int XT_ENUMERATION__BASE_NAMESPACE = ExecutableModelingProfilePackage.XENUMERATION__BASE_NAMESPACE;

	/**
	 * The feature id for the '<em><b>Base Classifier</b></em>' reference.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 * @ordered
	 */
	int XT_ENUMERATION__BASE_CLASSIFIER = ExecutableModelingProfilePackage.XENUMERATION__BASE_CLASSIFIER;

	/**
	 * The feature id for the '<em><b>Base Data Type</b></em>' reference.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 * @ordered
	 */
	int XT_ENUMERATION__BASE_DATA_TYPE = ExecutableModelingProfilePackage.XENUMERATION__BASE_DATA_TYPE;

	/**
	 * The feature id for the '<em><b>Base Enumeration</b></em>' reference.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 * @ordered
	 */
	int XT_ENUMERATION__BASE_ENUMERATION = ExecutableModelingProfilePackage.XENUMERATION__BASE_ENUMERATION;

	/**
	 * The number of structural features of the '<em>Xt Enumeration</em>' class.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 * @ordered
	 */
	int XT_ENUMERATION_FEATURE_COUNT = ExecutableModelingProfilePackage.XENUMERATION_FEATURE_COUNT + 0;

	/**
	 * The operation id for the '<em>XNamed Element Name</em>' operation.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 * @ordered
	 */
	int XT_ENUMERATION___XNAMED_ELEMENT_NAME__DIAGNOSTICCHAIN_MAP = ExecutableModelingProfilePackage.XENUMERATION___XNAMED_ELEMENT_NAME__DIAGNOSTICCHAIN_MAP;

	/**
	 * The operation id for the '<em>XClassifier Features</em>' operation.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 * @ordered
	 */
	int XT_ENUMERATION___XCLASSIFIER_FEATURES__DIAGNOSTICCHAIN_MAP = ExecutableModelingProfilePackage.XENUMERATION___XCLASSIFIER_FEATURES__DIAGNOSTICCHAIN_MAP;

	/**
	 * The operation id for the '<em>XClassifier Nested Classifiers</em>' operation.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 * @ordered
	 */
	int XT_ENUMERATION___XCLASSIFIER_NESTED_CLASSIFIERS__DIAGNOSTICCHAIN_MAP = ExecutableModelingProfilePackage.XENUMERATION___XCLASSIFIER_NESTED_CLASSIFIERS__DIAGNOSTICCHAIN_MAP;

	/**
	 * The operation id for the '<em>XClassifier Generals</em>' operation.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 * @ordered
	 */
	int XT_ENUMERATION___XCLASSIFIER_GENERALS__DIAGNOSTICCHAIN_MAP = ExecutableModelingProfilePackage.XENUMERATION___XCLASSIFIER_GENERALS__DIAGNOSTICCHAIN_MAP;

	/**
	 * The operation id for the '<em>XClassifier Constraints</em>' operation.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 * @ordered
	 */
	int XT_ENUMERATION___XCLASSIFIER_CONSTRAINTS__DIAGNOSTICCHAIN_MAP = ExecutableModelingProfilePackage.XENUMERATION___XCLASSIFIER_CONSTRAINTS__DIAGNOSTICCHAIN_MAP;

	/**
	 * The operation id for the '<em>XData Type Operations</em>' operation.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 * @ordered
	 */
	int XT_ENUMERATION___XDATA_TYPE_OPERATIONS__DIAGNOSTICCHAIN_MAP = ExecutableModelingProfilePackage.XENUMERATION___XDATA_TYPE_OPERATIONS__DIAGNOSTICCHAIN_MAP;

	/**
	 * The operation id for the '<em>XEnumeration Attributes</em>' operation.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 * @ordered
	 */
	int XT_ENUMERATION___XENUMERATION_ATTRIBUTES__DIAGNOSTICCHAIN_MAP = ExecutableModelingProfilePackage.XENUMERATION___XENUMERATION_ATTRIBUTES__DIAGNOSTICCHAIN_MAP;

	/**
	 * The number of operations of the '<em>Xt Enumeration</em>' class.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 * @ordered
	 */
	int XT_ENUMERATION_OPERATION_COUNT = ExecutableModelingProfilePackage.XENUMERATION_OPERATION_COUNT + 0;

	/**
	 * The meta object id for the '{@link com.ericsson.executablemodeling.xtuml.profile.xtumlprofile.impl.XtAssociationImpl <em>Xt Association</em>}' class.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @see com.ericsson.executablemodeling.xtuml.profile.xtumlprofile.impl.XtAssociationImpl
	 * @see com.ericsson.executablemodeling.xtuml.profile.xtumlprofile.impl.xtUMLProfilePackageImpl#getXtAssociation()
	 * @generated
	 */
	int XT_ASSOCIATION = 15;

	/**
	 * The feature id for the '<em><b>Base Named Element</b></em>' reference.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 * @ordered
	 */
	int XT_ASSOCIATION__BASE_NAMED_ELEMENT = ExecutableModelingProfilePackage.XCLASSIFIER__BASE_NAMED_ELEMENT;

	/**
	 * The feature id for the '<em><b>Base Namespace</b></em>' reference.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 * @ordered
	 */
	int XT_ASSOCIATION__BASE_NAMESPACE = ExecutableModelingProfilePackage.XCLASSIFIER__BASE_NAMESPACE;

	/**
	 * The feature id for the '<em><b>Base Classifier</b></em>' reference.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 * @ordered
	 */
	int XT_ASSOCIATION__BASE_CLASSIFIER = ExecutableModelingProfilePackage.XCLASSIFIER__BASE_CLASSIFIER;

	/**
	 * The feature id for the '<em><b>Base Association</b></em>' reference.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 * @ordered
	 */
	int XT_ASSOCIATION__BASE_ASSOCIATION = ExecutableModelingProfilePackage.XCLASSIFIER_FEATURE_COUNT + 0;

	/**
	 * The number of structural features of the '<em>Xt Association</em>' class.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 * @ordered
	 */
	int XT_ASSOCIATION_FEATURE_COUNT = ExecutableModelingProfilePackage.XCLASSIFIER_FEATURE_COUNT + 1;

	/**
	 * The operation id for the '<em>XNamed Element Name</em>' operation.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 * @ordered
	 */
	int XT_ASSOCIATION___XNAMED_ELEMENT_NAME__DIAGNOSTICCHAIN_MAP = ExecutableModelingProfilePackage.XCLASSIFIER___XNAMED_ELEMENT_NAME__DIAGNOSTICCHAIN_MAP;

	/**
	 * The operation id for the '<em>XClassifier Features</em>' operation.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 * @ordered
	 */
	int XT_ASSOCIATION___XCLASSIFIER_FEATURES__DIAGNOSTICCHAIN_MAP = ExecutableModelingProfilePackage.XCLASSIFIER___XCLASSIFIER_FEATURES__DIAGNOSTICCHAIN_MAP;

	/**
	 * The operation id for the '<em>XClassifier Nested Classifiers</em>' operation.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 * @ordered
	 */
	int XT_ASSOCIATION___XCLASSIFIER_NESTED_CLASSIFIERS__DIAGNOSTICCHAIN_MAP = ExecutableModelingProfilePackage.XCLASSIFIER___XCLASSIFIER_NESTED_CLASSIFIERS__DIAGNOSTICCHAIN_MAP;

	/**
	 * The operation id for the '<em>XClassifier Generals</em>' operation.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 * @ordered
	 */
	int XT_ASSOCIATION___XCLASSIFIER_GENERALS__DIAGNOSTICCHAIN_MAP = ExecutableModelingProfilePackage.XCLASSIFIER___XCLASSIFIER_GENERALS__DIAGNOSTICCHAIN_MAP;

	/**
	 * The operation id for the '<em>XClassifier Constraints</em>' operation.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 * @ordered
	 */
	int XT_ASSOCIATION___XCLASSIFIER_CONSTRAINTS__DIAGNOSTICCHAIN_MAP = ExecutableModelingProfilePackage.XCLASSIFIER___XCLASSIFIER_CONSTRAINTS__DIAGNOSTICCHAIN_MAP;

	/**
	 * The operation id for the '<em>XAssociation Is Binary</em>' operation.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 * @ordered
	 */
	int XT_ASSOCIATION___XASSOCIATION_IS_BINARY__DIAGNOSTICCHAIN_MAP = ExecutableModelingProfilePackage.XCLASSIFIER_OPERATION_COUNT + 0;

	/**
	 * The operation id for the '<em>Xt Association End Ownership</em>' operation.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 * @ordered
	 */
	int XT_ASSOCIATION___XT_ASSOCIATION_END_OWNERSHIP__DIAGNOSTICCHAIN_MAP = ExecutableModelingProfilePackage.XCLASSIFIER_OPERATION_COUNT + 1;

	/**
	 * The operation id for the '<em>Xt Association Ends</em>' operation.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 * @ordered
	 */
	int XT_ASSOCIATION___XT_ASSOCIATION_ENDS__DIAGNOSTICCHAIN_MAP = ExecutableModelingProfilePackage.XCLASSIFIER_OPERATION_COUNT + 2;

	/**
	 * The operation id for the '<em>Xt Association End Type</em>' operation.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 * @ordered
	 */
	int XT_ASSOCIATION___XT_ASSOCIATION_END_TYPE__DIAGNOSTICCHAIN_MAP = ExecutableModelingProfilePackage.XCLASSIFIER_OPERATION_COUNT + 3;

	/**
	 * The operation id for the '<em>Xt Association Generalization</em>' operation.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 * @ordered
	 */
	int XT_ASSOCIATION___XT_ASSOCIATION_GENERALIZATION__DIAGNOSTICCHAIN_MAP = ExecutableModelingProfilePackage.XCLASSIFIER_OPERATION_COUNT + 4;

	/**
	 * The number of operations of the '<em>Xt Association</em>' class.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 * @ordered
	 */
	int XT_ASSOCIATION_OPERATION_COUNT = ExecutableModelingProfilePackage.XCLASSIFIER_OPERATION_COUNT + 5;

	/**
	 * The meta object id for the '{@link com.ericsson.executablemodeling.xtuml.profile.xtumlprofile.impl.XtAssociationClassImpl <em>Xt Association Class</em>}' class.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @see com.ericsson.executablemodeling.xtuml.profile.xtumlprofile.impl.XtAssociationClassImpl
	 * @see com.ericsson.executablemodeling.xtuml.profile.xtumlprofile.impl.xtUMLProfilePackageImpl#getXtAssociationClass()
	 * @generated
	 */
	int XT_ASSOCIATION_CLASS = 16;

	/**
	 * The feature id for the '<em><b>Base Named Element</b></em>' reference.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 * @ordered
	 */
	int XT_ASSOCIATION_CLASS__BASE_NAMED_ELEMENT = ExecutableModelingProfilePackage.XASSOCIATION_CLASS__BASE_NAMED_ELEMENT;

	/**
	 * The feature id for the '<em><b>Base Namespace</b></em>' reference.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 * @ordered
	 */
	int XT_ASSOCIATION_CLASS__BASE_NAMESPACE = ExecutableModelingProfilePackage.XASSOCIATION_CLASS__BASE_NAMESPACE;

	/**
	 * The feature id for the '<em><b>Base Classifier</b></em>' reference.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 * @ordered
	 */
	int XT_ASSOCIATION_CLASS__BASE_CLASSIFIER = ExecutableModelingProfilePackage.XASSOCIATION_CLASS__BASE_CLASSIFIER;

	/**
	 * The feature id for the '<em><b>Base Association</b></em>' reference.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 * @ordered
	 */
	int XT_ASSOCIATION_CLASS__BASE_ASSOCIATION = ExecutableModelingProfilePackage.XASSOCIATION_CLASS__BASE_ASSOCIATION;

	/**
	 * The feature id for the '<em><b>Base Association Class</b></em>' reference.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 * @ordered
	 */
	int XT_ASSOCIATION_CLASS__BASE_ASSOCIATION_CLASS = ExecutableModelingProfilePackage.XASSOCIATION_CLASS__BASE_ASSOCIATION_CLASS;

	/**
	 * The number of structural features of the '<em>Xt Association Class</em>' class.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 * @ordered
	 */
	int XT_ASSOCIATION_CLASS_FEATURE_COUNT = ExecutableModelingProfilePackage.XASSOCIATION_CLASS_FEATURE_COUNT + 0;

	/**
	 * The operation id for the '<em>XNamed Element Name</em>' operation.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 * @ordered
	 */
	int XT_ASSOCIATION_CLASS___XNAMED_ELEMENT_NAME__DIAGNOSTICCHAIN_MAP = ExecutableModelingProfilePackage.XASSOCIATION_CLASS___XNAMED_ELEMENT_NAME__DIAGNOSTICCHAIN_MAP;

	/**
	 * The operation id for the '<em>XClassifier Features</em>' operation.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 * @ordered
	 */
	int XT_ASSOCIATION_CLASS___XCLASSIFIER_FEATURES__DIAGNOSTICCHAIN_MAP = ExecutableModelingProfilePackage.XASSOCIATION_CLASS___XCLASSIFIER_FEATURES__DIAGNOSTICCHAIN_MAP;

	/**
	 * The operation id for the '<em>XClassifier Nested Classifiers</em>' operation.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 * @ordered
	 */
	int XT_ASSOCIATION_CLASS___XCLASSIFIER_NESTED_CLASSIFIERS__DIAGNOSTICCHAIN_MAP = ExecutableModelingProfilePackage.XASSOCIATION_CLASS___XCLASSIFIER_NESTED_CLASSIFIERS__DIAGNOSTICCHAIN_MAP;

	/**
	 * The operation id for the '<em>XClassifier Generals</em>' operation.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 * @ordered
	 */
	int XT_ASSOCIATION_CLASS___XCLASSIFIER_GENERALS__DIAGNOSTICCHAIN_MAP = ExecutableModelingProfilePackage.XASSOCIATION_CLASS___XCLASSIFIER_GENERALS__DIAGNOSTICCHAIN_MAP;

	/**
	 * The operation id for the '<em>XClassifier Constraints</em>' operation.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 * @ordered
	 */
	int XT_ASSOCIATION_CLASS___XCLASSIFIER_CONSTRAINTS__DIAGNOSTICCHAIN_MAP = ExecutableModelingProfilePackage.XASSOCIATION_CLASS___XCLASSIFIER_CONSTRAINTS__DIAGNOSTICCHAIN_MAP;

	/**
	 * The operation id for the '<em>XAssociation Is Binary</em>' operation.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 * @ordered
	 */
	int XT_ASSOCIATION_CLASS___XASSOCIATION_IS_BINARY__DIAGNOSTICCHAIN_MAP = ExecutableModelingProfilePackage.XASSOCIATION_CLASS___XASSOCIATION_IS_BINARY__DIAGNOSTICCHAIN_MAP;

	/**
	 * The operation id for the '<em>Xt Association End Ownership</em>' operation.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 * @ordered
	 */
	int XT_ASSOCIATION_CLASS___XT_ASSOCIATION_END_OWNERSHIP__DIAGNOSTICCHAIN_MAP = ExecutableModelingProfilePackage.XASSOCIATION_CLASS_OPERATION_COUNT + 0;

	/**
	 * The operation id for the '<em>Xt Association Ends</em>' operation.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 * @ordered
	 */
	int XT_ASSOCIATION_CLASS___XT_ASSOCIATION_ENDS__DIAGNOSTICCHAIN_MAP = ExecutableModelingProfilePackage.XASSOCIATION_CLASS_OPERATION_COUNT + 1;

	/**
	 * The operation id for the '<em>Xt Association End Type</em>' operation.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 * @ordered
	 */
	int XT_ASSOCIATION_CLASS___XT_ASSOCIATION_END_TYPE__DIAGNOSTICCHAIN_MAP = ExecutableModelingProfilePackage.XASSOCIATION_CLASS_OPERATION_COUNT + 2;

	/**
	 * The operation id for the '<em>Xt Association Generalization</em>' operation.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 * @ordered
	 */
	int XT_ASSOCIATION_CLASS___XT_ASSOCIATION_GENERALIZATION__DIAGNOSTICCHAIN_MAP = ExecutableModelingProfilePackage.XASSOCIATION_CLASS_OPERATION_COUNT + 3;

	/**
	 * The number of operations of the '<em>Xt Association Class</em>' class.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 * @ordered
	 */
	int XT_ASSOCIATION_CLASS_OPERATION_COUNT = ExecutableModelingProfilePackage.XASSOCIATION_CLASS_OPERATION_COUNT + 4;

	/**
	 * The meta object id for the '{@link com.ericsson.executablemodeling.xtuml.profile.xtumlprofile.impl.XtTriggerImpl <em>Xt Trigger</em>}' class.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @see com.ericsson.executablemodeling.xtuml.profile.xtumlprofile.impl.XtTriggerImpl
	 * @see com.ericsson.executablemodeling.xtuml.profile.xtumlprofile.impl.xtUMLProfilePackageImpl#getXtTrigger()
	 * @generated
	 */
	int XT_TRIGGER = 17;

	/**
	 * The feature id for the '<em><b>Base Trigger</b></em>' reference.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 * @ordered
	 */
	int XT_TRIGGER__BASE_TRIGGER = ExecutableModelingProfilePackage.XTRIGGER__BASE_TRIGGER;

	/**
	 * The number of structural features of the '<em>Xt Trigger</em>' class.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 * @ordered
	 */
	int XT_TRIGGER_FEATURE_COUNT = ExecutableModelingProfilePackage.XTRIGGER_FEATURE_COUNT + 0;

	/**
	 * The operation id for the '<em>XTrigger Signal Reception</em>' operation.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 * @ordered
	 */
	int XT_TRIGGER___XTRIGGER_SIGNAL_RECEPTION__DIAGNOSTICCHAIN_MAP = ExecutableModelingProfilePackage.XTRIGGER___XTRIGGER_SIGNAL_RECEPTION__DIAGNOSTICCHAIN_MAP;

	/**
	 * The operation id for the '<em>XTrigger Events</em>' operation.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 * @ordered
	 */
	int XT_TRIGGER___XTRIGGER_EVENTS__DIAGNOSTICCHAIN_MAP = ExecutableModelingProfilePackage.XTRIGGER___XTRIGGER_EVENTS__DIAGNOSTICCHAIN_MAP;

	/**
	 * The operation id for the '<em>XTrigger Called Operation</em>' operation.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 * @ordered
	 */
	int XT_TRIGGER___XTRIGGER_CALLED_OPERATION__DIAGNOSTICCHAIN_MAP = ExecutableModelingProfilePackage.XTRIGGER___XTRIGGER_CALLED_OPERATION__DIAGNOSTICCHAIN_MAP;

	/**
	 * The operation id for the '<em>Xt Trigger Event</em>' operation.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 * @ordered
	 */
	int XT_TRIGGER___XT_TRIGGER_EVENT__DIAGNOSTICCHAIN_MAP = ExecutableModelingProfilePackage.XTRIGGER_OPERATION_COUNT + 0;

	/**
	 * The number of operations of the '<em>Xt Trigger</em>' class.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 * @ordered
	 */
	int XT_TRIGGER_OPERATION_COUNT = ExecutableModelingProfilePackage.XTRIGGER_OPERATION_COUNT + 1;

	/**
	 * The meta object id for the '{@link com.ericsson.executablemodeling.xtuml.profile.xtumlprofile.impl.XtStateMachineImpl <em>Xt State Machine</em>}' class.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @see com.ericsson.executablemodeling.xtuml.profile.xtumlprofile.impl.XtStateMachineImpl
	 * @see com.ericsson.executablemodeling.xtuml.profile.xtumlprofile.impl.xtUMLProfilePackageImpl#getXtStateMachine()
	 * @generated
	 */
	int XT_STATE_MACHINE = 18;

	/**
	 * The feature id for the '<em><b>Base Named Element</b></em>' reference.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 * @ordered
	 */
	int XT_STATE_MACHINE__BASE_NAMED_ELEMENT = ExecutableModelingProfilePackage.XSTATE_MACHINE__BASE_NAMED_ELEMENT;

	/**
	 * The feature id for the '<em><b>Base Namespace</b></em>' reference.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 * @ordered
	 */
	int XT_STATE_MACHINE__BASE_NAMESPACE = ExecutableModelingProfilePackage.XSTATE_MACHINE__BASE_NAMESPACE;

	/**
	 * The feature id for the '<em><b>Base Behavior</b></em>' reference.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 * @ordered
	 */
	int XT_STATE_MACHINE__BASE_BEHAVIOR = ExecutableModelingProfilePackage.XSTATE_MACHINE__BASE_BEHAVIOR;

	/**
	 * The feature id for the '<em><b>Base State Machine</b></em>' reference.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 * @ordered
	 */
	int XT_STATE_MACHINE__BASE_STATE_MACHINE = ExecutableModelingProfilePackage.XSTATE_MACHINE__BASE_STATE_MACHINE;

	/**
	 * The number of structural features of the '<em>Xt State Machine</em>' class.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 * @ordered
	 */
	int XT_STATE_MACHINE_FEATURE_COUNT = ExecutableModelingProfilePackage.XSTATE_MACHINE_FEATURE_COUNT + 0;

	/**
	 * The operation id for the '<em>XNamed Element Name</em>' operation.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 * @ordered
	 */
	int XT_STATE_MACHINE___XNAMED_ELEMENT_NAME__DIAGNOSTICCHAIN_MAP = ExecutableModelingProfilePackage.XSTATE_MACHINE___XNAMED_ELEMENT_NAME__DIAGNOSTICCHAIN_MAP;

	/**
	 * The operation id for the '<em>XBehavior No Parameter Sets</em>' operation.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 * @ordered
	 */
	int XT_STATE_MACHINE___XBEHAVIOR_NO_PARAMETER_SETS__DIAGNOSTICCHAIN_MAP = ExecutableModelingProfilePackage.XSTATE_MACHINE___XBEHAVIOR_NO_PARAMETER_SETS__DIAGNOSTICCHAIN_MAP;

	/**
	 * The operation id for the '<em>XState Machine One Region</em>' operation.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 * @ordered
	 */
	int XT_STATE_MACHINE___XSTATE_MACHINE_ONE_REGION__DIAGNOSTICCHAIN_MAP = ExecutableModelingProfilePackage.XSTATE_MACHINE___XSTATE_MACHINE_ONE_REGION__DIAGNOSTICCHAIN_MAP;

	/**
	 * The operation id for the '<em>XState Machine Initial State</em>' operation.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 * @ordered
	 */
	int XT_STATE_MACHINE___XSTATE_MACHINE_INITIAL_STATE__DIAGNOSTICCHAIN_MAP = ExecutableModelingProfilePackage.XSTATE_MACHINE___XSTATE_MACHINE_INITIAL_STATE__DIAGNOSTICCHAIN_MAP;

	/**
	 * The operation id for the '<em>XState Machine Context</em>' operation.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 * @ordered
	 */
	int XT_STATE_MACHINE___XSTATE_MACHINE_CONTEXT__DIAGNOSTICCHAIN_MAP = ExecutableModelingProfilePackage.XSTATE_MACHINE___XSTATE_MACHINE_CONTEXT__DIAGNOSTICCHAIN_MAP;

	/**
	 * The operation id for the '<em>XState Machine No Parameters</em>' operation.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 * @ordered
	 */
	int XT_STATE_MACHINE___XSTATE_MACHINE_NO_PARAMETERS__DIAGNOSTICCHAIN_MAP = ExecutableModelingProfilePackage.XSTATE_MACHINE___XSTATE_MACHINE_NO_PARAMETERS__DIAGNOSTICCHAIN_MAP;

	/**
	 * The operation id for the '<em>XState Machine Regions</em>' operation.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 * @ordered
	 */
	int XT_STATE_MACHINE___XSTATE_MACHINE_REGIONS__DIAGNOSTICCHAIN_MAP = ExecutableModelingProfilePackage.XSTATE_MACHINE___XSTATE_MACHINE_REGIONS__DIAGNOSTICCHAIN_MAP;

	/**
	 * The number of operations of the '<em>Xt State Machine</em>' class.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 * @ordered
	 */
	int XT_STATE_MACHINE_OPERATION_COUNT = ExecutableModelingProfilePackage.XSTATE_MACHINE_OPERATION_COUNT + 0;

	/**
	 * The meta object id for the '{@link com.ericsson.executablemodeling.xtuml.profile.xtumlprofile.impl.XtRegionImpl <em>Xt Region</em>}' class.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @see com.ericsson.executablemodeling.xtuml.profile.xtumlprofile.impl.XtRegionImpl
	 * @see com.ericsson.executablemodeling.xtuml.profile.xtumlprofile.impl.xtUMLProfilePackageImpl#getXtRegion()
	 * @generated
	 */
	int XT_REGION = 19;

	/**
	 * The feature id for the '<em><b>Base Region</b></em>' reference.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 * @ordered
	 */
	int XT_REGION__BASE_REGION = ExecutableModelingProfilePackage.XREGION__BASE_REGION;

	/**
	 * The number of structural features of the '<em>Xt Region</em>' class.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 * @ordered
	 */
	int XT_REGION_FEATURE_COUNT = ExecutableModelingProfilePackage.XREGION_FEATURE_COUNT + 0;

	/**
	 * The operation id for the '<em>XRegion Subvertexes</em>' operation.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 * @ordered
	 */
	int XT_REGION___XREGION_SUBVERTEXES__DIAGNOSTICCHAIN_MAP = ExecutableModelingProfilePackage.XREGION___XREGION_SUBVERTEXES__DIAGNOSTICCHAIN_MAP;

	/**
	 * The operation id for the '<em>XRegion Transitions</em>' operation.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 * @ordered
	 */
	int XT_REGION___XREGION_TRANSITIONS__DIAGNOSTICCHAIN_MAP = ExecutableModelingProfilePackage.XREGION___XREGION_TRANSITIONS__DIAGNOSTICCHAIN_MAP;

	/**
	 * The number of operations of the '<em>Xt Region</em>' class.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 * @ordered
	 */
	int XT_REGION_OPERATION_COUNT = ExecutableModelingProfilePackage.XREGION_OPERATION_COUNT + 0;

	/**
	 * The meta object id for the '{@link com.ericsson.executablemodeling.xtuml.profile.xtumlprofile.impl.XtPseudoStateImpl <em>Xt Pseudo State</em>}' class.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @see com.ericsson.executablemodeling.xtuml.profile.xtumlprofile.impl.XtPseudoStateImpl
	 * @see com.ericsson.executablemodeling.xtuml.profile.xtumlprofile.impl.xtUMLProfilePackageImpl#getXtPseudoState()
	 * @generated
	 */
	int XT_PSEUDO_STATE = 20;

	/**
	 * The feature id for the '<em><b>Base Vertex</b></em>' reference.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 * @ordered
	 */
	int XT_PSEUDO_STATE__BASE_VERTEX = ExecutableModelingProfilePackage.XPSEUDOSTATE__BASE_VERTEX;

	/**
	 * The feature id for the '<em><b>Base Pseudostate</b></em>' reference.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 * @ordered
	 */
	int XT_PSEUDO_STATE__BASE_PSEUDOSTATE = ExecutableModelingProfilePackage.XPSEUDOSTATE__BASE_PSEUDOSTATE;

	/**
	 * The number of structural features of the '<em>Xt Pseudo State</em>' class.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 * @ordered
	 */
	int XT_PSEUDO_STATE_FEATURE_COUNT = ExecutableModelingProfilePackage.XPSEUDOSTATE_FEATURE_COUNT + 0;

	/**
	 * The operation id for the '<em>XPsuedostate Kind</em>' operation.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 * @ordered
	 */
	int XT_PSEUDO_STATE___XPSUEDOSTATE_KIND__DIAGNOSTICCHAIN_MAP = ExecutableModelingProfilePackage.XPSEUDOSTATE___XPSUEDOSTATE_KIND__DIAGNOSTICCHAIN_MAP;

	/**
	 * The operation id for the '<em>Xt Pseudostate Kind</em>' operation.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 * @ordered
	 */
	int XT_PSEUDO_STATE___XT_PSEUDOSTATE_KIND__DIAGNOSTICCHAIN_MAP = ExecutableModelingProfilePackage.XPSEUDOSTATE_OPERATION_COUNT + 0;

	/**
	 * The number of operations of the '<em>Xt Pseudo State</em>' class.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 * @ordered
	 */
	int XT_PSEUDO_STATE_OPERATION_COUNT = ExecutableModelingProfilePackage.XPSEUDOSTATE_OPERATION_COUNT + 1;

	/**
	 * The meta object id for the '{@link com.ericsson.executablemodeling.xtuml.profile.xtumlprofile.impl.XtTransitionImpl <em>Xt Transition</em>}' class.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @see com.ericsson.executablemodeling.xtuml.profile.xtumlprofile.impl.XtTransitionImpl
	 * @see com.ericsson.executablemodeling.xtuml.profile.xtumlprofile.impl.xtUMLProfilePackageImpl#getXtTransition()
	 * @generated
	 */
	int XT_TRANSITION = 21;

	/**
	 * The feature id for the '<em><b>Base Transition</b></em>' reference.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 * @ordered
	 */
	int XT_TRANSITION__BASE_TRANSITION = ExecutableModelingProfilePackage.XTRANSITION__BASE_TRANSITION;

	/**
	 * The number of structural features of the '<em>Xt Transition</em>' class.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 * @ordered
	 */
	int XT_TRANSITION_FEATURE_COUNT = ExecutableModelingProfilePackage.XTRANSITION_FEATURE_COUNT + 0;

	/**
	 * The operation id for the '<em>XTransition Trigger</em>' operation.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 * @ordered
	 */
	int XT_TRANSITION___XTRANSITION_TRIGGER__DIAGNOSTICCHAIN_MAP = ExecutableModelingProfilePackage.XTRANSITION___XTRANSITION_TRIGGER__DIAGNOSTICCHAIN_MAP;

	/**
	 * The operation id for the '<em>XTransition Guard</em>' operation.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 * @ordered
	 */
	int XT_TRANSITION___XTRANSITION_GUARD__DIAGNOSTICCHAIN_MAP = ExecutableModelingProfilePackage.XTRANSITION___XTRANSITION_GUARD__DIAGNOSTICCHAIN_MAP;

	/**
	 * The operation id for the '<em>XTransition Effect</em>' operation.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 * @ordered
	 */
	int XT_TRANSITION___XTRANSITION_EFFECT__DIAGNOSTICCHAIN_MAP = ExecutableModelingProfilePackage.XTRANSITION___XTRANSITION_EFFECT__DIAGNOSTICCHAIN_MAP;

	/**
	 * The operation id for the '<em>Xt Transition No Guard</em>' operation.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 * @ordered
	 */
	int XT_TRANSITION___XT_TRANSITION_NO_GUARD__DIAGNOSTICCHAIN_MAP = ExecutableModelingProfilePackage.XTRANSITION_OPERATION_COUNT + 0;

	/**
	 * The number of operations of the '<em>Xt Transition</em>' class.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 * @ordered
	 */
	int XT_TRANSITION_OPERATION_COUNT = ExecutableModelingProfilePackage.XTRANSITION_OPERATION_COUNT + 1;

	/**
	 * The meta object id for the '{@link com.ericsson.executablemodeling.xtuml.profile.xtumlprofile.impl.XtStateImpl <em>Xt State</em>}' class.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @see com.ericsson.executablemodeling.xtuml.profile.xtumlprofile.impl.XtStateImpl
	 * @see com.ericsson.executablemodeling.xtuml.profile.xtumlprofile.impl.xtUMLProfilePackageImpl#getXtState()
	 * @generated
	 */
	int XT_STATE = 22;

	/**
	 * The feature id for the '<em><b>Base Vertex</b></em>' reference.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 * @ordered
	 */
	int XT_STATE__BASE_VERTEX = ExecutableModelingProfilePackage.XSTATE__BASE_VERTEX;

	/**
	 * The feature id for the '<em><b>Base State</b></em>' reference.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 * @ordered
	 */
	int XT_STATE__BASE_STATE = ExecutableModelingProfilePackage.XSTATE__BASE_STATE;

	/**
	 * The number of structural features of the '<em>Xt State</em>' class.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 * @ordered
	 */
	int XT_STATE_FEATURE_COUNT = ExecutableModelingProfilePackage.XSTATE_FEATURE_COUNT + 0;

	/**
	 * The operation id for the '<em>XState Behaviors</em>' operation.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 * @ordered
	 */
	int XT_STATE___XSTATE_BEHAVIORS__DIAGNOSTICCHAIN_MAP = ExecutableModelingProfilePackage.XSTATE___XSTATE_BEHAVIORS__DIAGNOSTICCHAIN_MAP;

	/**
	 * The operation id for the '<em>XState No Do Activity</em>' operation.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 * @ordered
	 */
	int XT_STATE___XSTATE_NO_DO_ACTIVITY__DIAGNOSTICCHAIN_MAP = ExecutableModelingProfilePackage.XSTATE___XSTATE_NO_DO_ACTIVITY__DIAGNOSTICCHAIN_MAP;

	/**
	 * The operation id for the '<em>XState One Region</em>' operation.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 * @ordered
	 */
	int XT_STATE___XSTATE_ONE_REGION__DIAGNOSTICCHAIN_MAP = ExecutableModelingProfilePackage.XSTATE___XSTATE_ONE_REGION__DIAGNOSTICCHAIN_MAP;

	/**
	 * The operation id for the '<em>XState No Submachine</em>' operation.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 * @ordered
	 */
	int XT_STATE___XSTATE_NO_SUBMACHINE__DIAGNOSTICCHAIN_MAP = ExecutableModelingProfilePackage.XSTATE___XSTATE_NO_SUBMACHINE__DIAGNOSTICCHAIN_MAP;

	/**
	 * The operation id for the '<em>XState Regions</em>' operation.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 * @ordered
	 */
	int XT_STATE___XSTATE_REGIONS__DIAGNOSTICCHAIN_MAP = ExecutableModelingProfilePackage.XSTATE___XSTATE_REGIONS__DIAGNOSTICCHAIN_MAP;

	/**
	 * The operation id for the '<em>XState Not Composite</em>' operation.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 * @ordered
	 */
	int XT_STATE___XSTATE_NOT_COMPOSITE__DIAGNOSTICCHAIN_MAP = ExecutableModelingProfilePackage.XSTATE_OPERATION_COUNT + 0;

	/**
	 * The number of operations of the '<em>Xt State</em>' class.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 * @ordered
	 */
	int XT_STATE_OPERATION_COUNT = ExecutableModelingProfilePackage.XSTATE_OPERATION_COUNT + 1;

	/**
	 * The meta object id for the '{@link com.ericsson.executablemodeling.xtuml.profile.xtumlprofile.impl.XtActivityImpl <em>Xt Activity</em>}' class.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @see com.ericsson.executablemodeling.xtuml.profile.xtumlprofile.impl.XtActivityImpl
	 * @see com.ericsson.executablemodeling.xtuml.profile.xtumlprofile.impl.xtUMLProfilePackageImpl#getXtActivity()
	 * @generated
	 */
	int XT_ACTIVITY = 23;

	/**
	 * The feature id for the '<em><b>Base Named Element</b></em>' reference.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 * @ordered
	 */
	int XT_ACTIVITY__BASE_NAMED_ELEMENT = ExecutableModelingProfilePackage.XACTIVITY__BASE_NAMED_ELEMENT;

	/**
	 * The feature id for the '<em><b>Base Namespace</b></em>' reference.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 * @ordered
	 */
	int XT_ACTIVITY__BASE_NAMESPACE = ExecutableModelingProfilePackage.XACTIVITY__BASE_NAMESPACE;

	/**
	 * The feature id for the '<em><b>Base Behavior</b></em>' reference.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 * @ordered
	 */
	int XT_ACTIVITY__BASE_BEHAVIOR = ExecutableModelingProfilePackage.XACTIVITY__BASE_BEHAVIOR;

	/**
	 * The feature id for the '<em><b>Base Activity</b></em>' reference.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 * @ordered
	 */
	int XT_ACTIVITY__BASE_ACTIVITY = ExecutableModelingProfilePackage.XACTIVITY__BASE_ACTIVITY;

	/**
	 * The number of structural features of the '<em>Xt Activity</em>' class.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 * @ordered
	 */
	int XT_ACTIVITY_FEATURE_COUNT = ExecutableModelingProfilePackage.XACTIVITY_FEATURE_COUNT + 0;

	/**
	 * The operation id for the '<em>XNamed Element Name</em>' operation.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 * @ordered
	 */
	int XT_ACTIVITY___XNAMED_ELEMENT_NAME__DIAGNOSTICCHAIN_MAP = ExecutableModelingProfilePackage.XACTIVITY___XNAMED_ELEMENT_NAME__DIAGNOSTICCHAIN_MAP;

	/**
	 * The operation id for the '<em>XBehavior No Parameter Sets</em>' operation.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 * @ordered
	 */
	int XT_ACTIVITY___XBEHAVIOR_NO_PARAMETER_SETS__DIAGNOSTICCHAIN_MAP = ExecutableModelingProfilePackage.XACTIVITY___XBEHAVIOR_NO_PARAMETER_SETS__DIAGNOSTICCHAIN_MAP;

	/**
	 * The operation id for the '<em>XActivity Parameters</em>' operation.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 * @ordered
	 */
	int XT_ACTIVITY___XACTIVITY_PARAMETERS__DIAGNOSTICCHAIN_MAP = ExecutableModelingProfilePackage.XACTIVITY___XACTIVITY_PARAMETERS__DIAGNOSTICCHAIN_MAP;

	/**
	 * The operation id for the '<em>XActivity Textual Representation</em>' operation.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 * @ordered
	 */
	int XT_ACTIVITY___XACTIVITY_TEXTUAL_REPRESENTATION__DIAGNOSTICCHAIN_MAP = ExecutableModelingProfilePackage.XACTIVITY___XACTIVITY_TEXTUAL_REPRESENTATION__DIAGNOSTICCHAIN_MAP;

	/**
	 * The operation id for the '<em>Xt Activity Textual Representation</em>' operation.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 * @ordered
	 */
	int XT_ACTIVITY___XT_ACTIVITY_TEXTUAL_REPRESENTATION__DIAGNOSTICCHAIN_MAP = ExecutableModelingProfilePackage.XACTIVITY_OPERATION_COUNT + 0;

	/**
	 * The number of operations of the '<em>Xt Activity</em>' class.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 * @ordered
	 */
	int XT_ACTIVITY_OPERATION_COUNT = ExecutableModelingProfilePackage.XACTIVITY_OPERATION_COUNT + 1;

	/**
	 * The meta object id for the '{@link com.ericsson.executablemodeling.xtuml.profile.xtumlprofile.impl.XtConstraintImpl <em>Xt Constraint</em>}' class.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @see com.ericsson.executablemodeling.xtuml.profile.xtumlprofile.impl.XtConstraintImpl
	 * @see com.ericsson.executablemodeling.xtuml.profile.xtumlprofile.impl.xtUMLProfilePackageImpl#getXtConstraint()
	 * @generated
	 */
	int XT_CONSTRAINT = 24;

	/**
	 * The feature id for the '<em><b>Base Named Element</b></em>' reference.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 * @ordered
	 */
	int XT_CONSTRAINT__BASE_NAMED_ELEMENT = ExecutableModelingProfilePackage.XCONSTRAINT__BASE_NAMED_ELEMENT;

	/**
	 * The feature id for the '<em><b>Base Constraint</b></em>' reference.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 * @ordered
	 */
	int XT_CONSTRAINT__BASE_CONSTRAINT = ExecutableModelingProfilePackage.XCONSTRAINT__BASE_CONSTRAINT;

	/**
	 * The number of structural features of the '<em>Xt Constraint</em>' class.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 * @ordered
	 */
	int XT_CONSTRAINT_FEATURE_COUNT = ExecutableModelingProfilePackage.XCONSTRAINT_FEATURE_COUNT + 0;

	/**
	 * The operation id for the '<em>XNamed Element Name</em>' operation.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 * @ordered
	 */
	int XT_CONSTRAINT___XNAMED_ELEMENT_NAME__DIAGNOSTICCHAIN_MAP = ExecutableModelingProfilePackage.XCONSTRAINT___XNAMED_ELEMENT_NAME__DIAGNOSTICCHAIN_MAP;

	/**
	 * The operation id for the '<em>XConstraint Specification</em>' operation.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 * @ordered
	 */
	int XT_CONSTRAINT___XCONSTRAINT_SPECIFICATION__DIAGNOSTICCHAIN_MAP = ExecutableModelingProfilePackage.XCONSTRAINT___XCONSTRAINT_SPECIFICATION__DIAGNOSTICCHAIN_MAP;

	/**
	 * The operation id for the '<em>XConstraint Behavior</em>' operation.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 * @ordered
	 */
	int XT_CONSTRAINT___XCONSTRAINT_BEHAVIOR__DIAGNOSTICCHAIN_MAP = ExecutableModelingProfilePackage.XCONSTRAINT___XCONSTRAINT_BEHAVIOR__DIAGNOSTICCHAIN_MAP;

	/**
	 * The number of operations of the '<em>Xt Constraint</em>' class.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 * @ordered
	 */
	int XT_CONSTRAINT_OPERATION_COUNT = ExecutableModelingProfilePackage.XCONSTRAINT_OPERATION_COUNT + 0;

	/**
	 * The meta object id for the '{@link com.ericsson.executablemodeling.xtuml.profile.xtumlprofile.impl.XtClassImpl <em>Xt Class</em>}' class.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @see com.ericsson.executablemodeling.xtuml.profile.xtumlprofile.impl.XtClassImpl
	 * @see com.ericsson.executablemodeling.xtuml.profile.xtumlprofile.impl.xtUMLProfilePackageImpl#getXtClass()
	 * @generated
	 */
	int XT_CLASS = 25;

	/**
	 * The feature id for the '<em><b>Base Named Element</b></em>' reference.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 * @ordered
	 */
	int XT_CLASS__BASE_NAMED_ELEMENT = ExecutableModelingProfilePackage.XCLASS__BASE_NAMED_ELEMENT;

	/**
	 * The feature id for the '<em><b>Base Namespace</b></em>' reference.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 * @ordered
	 */
	int XT_CLASS__BASE_NAMESPACE = ExecutableModelingProfilePackage.XCLASS__BASE_NAMESPACE;

	/**
	 * The feature id for the '<em><b>Base Classifier</b></em>' reference.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 * @ordered
	 */
	int XT_CLASS__BASE_CLASSIFIER = ExecutableModelingProfilePackage.XCLASS__BASE_CLASSIFIER;

	/**
	 * The feature id for the '<em><b>Base Class</b></em>' reference.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 * @ordered
	 */
	int XT_CLASS__BASE_CLASS = ExecutableModelingProfilePackage.XCLASS__BASE_CLASS;

	/**
	 * The feature id for the '<em><b>Is External</b></em>' attribute.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 * @ordered
	 */
	int XT_CLASS__IS_EXTERNAL = ExecutableModelingProfilePackage.XCLASS__IS_EXTERNAL;

	/**
	 * The number of structural features of the '<em>Xt Class</em>' class.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 * @ordered
	 */
	int XT_CLASS_FEATURE_COUNT = ExecutableModelingProfilePackage.XCLASS_FEATURE_COUNT + 0;

	/**
	 * The operation id for the '<em>XNamed Element Name</em>' operation.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 * @ordered
	 */
	int XT_CLASS___XNAMED_ELEMENT_NAME__DIAGNOSTICCHAIN_MAP = ExecutableModelingProfilePackage.XCLASS___XNAMED_ELEMENT_NAME__DIAGNOSTICCHAIN_MAP;

	/**
	 * The operation id for the '<em>XClassifier Features</em>' operation.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 * @ordered
	 */
	int XT_CLASS___XCLASSIFIER_FEATURES__DIAGNOSTICCHAIN_MAP = ExecutableModelingProfilePackage.XCLASS___XCLASSIFIER_FEATURES__DIAGNOSTICCHAIN_MAP;

	/**
	 * The operation id for the '<em>XClassifier Nested Classifiers</em>' operation.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 * @ordered
	 */
	int XT_CLASS___XCLASSIFIER_NESTED_CLASSIFIERS__DIAGNOSTICCHAIN_MAP = ExecutableModelingProfilePackage.XCLASS___XCLASSIFIER_NESTED_CLASSIFIERS__DIAGNOSTICCHAIN_MAP;

	/**
	 * The operation id for the '<em>XClassifier Generals</em>' operation.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 * @ordered
	 */
	int XT_CLASS___XCLASSIFIER_GENERALS__DIAGNOSTICCHAIN_MAP = ExecutableModelingProfilePackage.XCLASS___XCLASSIFIER_GENERALS__DIAGNOSTICCHAIN_MAP;

	/**
	 * The operation id for the '<em>XClassifier Constraints</em>' operation.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 * @ordered
	 */
	int XT_CLASS___XCLASSIFIER_CONSTRAINTS__DIAGNOSTICCHAIN_MAP = ExecutableModelingProfilePackage.XCLASS___XCLASSIFIER_CONSTRAINTS__DIAGNOSTICCHAIN_MAP;

	/**
	 * The operation id for the '<em>XClass Metaclass</em>' operation.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 * @ordered
	 */
	int XT_CLASS___XCLASS_METACLASS__DIAGNOSTICCHAIN_MAP = ExecutableModelingProfilePackage.XCLASS___XCLASS_METACLASS__DIAGNOSTICCHAIN_MAP;

	/**
	 * The operation id for the '<em>XClass Nested Classifiers</em>' operation.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 * @ordered
	 */
	int XT_CLASS___XCLASS_NESTED_CLASSIFIERS__DIAGNOSTICCHAIN_MAP = ExecutableModelingProfilePackage.XCLASS___XCLASS_NESTED_CLASSIFIERS__DIAGNOSTICCHAIN_MAP;

	/**
	 * The operation id for the '<em>XClass External</em>' operation.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 * @ordered
	 */
	int XT_CLASS___XCLASS_EXTERNAL__DIAGNOSTICCHAIN_MAP = ExecutableModelingProfilePackage.XCLASS___XCLASS_EXTERNAL__DIAGNOSTICCHAIN_MAP;

	/**
	 * The operation id for the '<em>Xt Class Constructors</em>' operation.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 * @ordered
	 */
	int XT_CLASS___XT_CLASS_CONSTRUCTORS__DIAGNOSTICCHAIN_MAP = ExecutableModelingProfilePackage.XCLASS_OPERATION_COUNT + 0;

	/**
	 * The operation id for the '<em>Xt Class Classifier Behavior</em>' operation.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 * @ordered
	 */
	int XT_CLASS___XT_CLASS_CLASSIFIER_BEHAVIOR__DIAGNOSTICCHAIN_MAP = ExecutableModelingProfilePackage.XCLASS_OPERATION_COUNT + 1;

	/**
	 * The operation id for the '<em>Xt Class Visibility</em>' operation.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 * @ordered
	 */
	int XT_CLASS___XT_CLASS_VISIBILITY__DIAGNOSTICCHAIN_MAP = ExecutableModelingProfilePackage.XCLASS_OPERATION_COUNT + 2;

	/**
	 * The operation id for the '<em>Xt Class Generalization Sets</em>' operation.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 * @ordered
	 */
	int XT_CLASS___XT_CLASS_GENERALIZATION_SETS__DIAGNOSTICCHAIN_MAP = ExecutableModelingProfilePackage.XCLASS_OPERATION_COUNT + 3;

	/**
	 * The number of operations of the '<em>Xt Class</em>' class.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 * @ordered
	 */
	int XT_CLASS_OPERATION_COUNT = ExecutableModelingProfilePackage.XCLASS_OPERATION_COUNT + 4;

	/**
	 * The meta object id for the '{@link com.ericsson.executablemodeling.xtuml.profile.xtumlprofile.impl.XtConstrainedTypeImpl <em>Xt Constrained Type</em>}' class.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @see com.ericsson.executablemodeling.xtuml.profile.xtumlprofile.impl.XtConstrainedTypeImpl
	 * @see com.ericsson.executablemodeling.xtuml.profile.xtumlprofile.impl.xtUMLProfilePackageImpl#getXtConstrainedType()
	 * @generated
	 */
	int XT_CONSTRAINED_TYPE = 26;

	/**
	 * The feature id for the '<em><b>Base Named Element</b></em>' reference.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 * @ordered
	 */
	int XT_CONSTRAINED_TYPE__BASE_NAMED_ELEMENT = ExecutableModelingProfilePackage.XCONSTRAINED_TYPE__BASE_NAMED_ELEMENT;

	/**
	 * The feature id for the '<em><b>Base Namespace</b></em>' reference.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 * @ordered
	 */
	int XT_CONSTRAINED_TYPE__BASE_NAMESPACE = ExecutableModelingProfilePackage.XCONSTRAINED_TYPE__BASE_NAMESPACE;

	/**
	 * The feature id for the '<em><b>Base Classifier</b></em>' reference.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 * @ordered
	 */
	int XT_CONSTRAINED_TYPE__BASE_CLASSIFIER = ExecutableModelingProfilePackage.XCONSTRAINED_TYPE__BASE_CLASSIFIER;

	/**
	 * The feature id for the '<em><b>Base Primitive Type</b></em>' reference.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 * @ordered
	 */
	int XT_CONSTRAINED_TYPE__BASE_PRIMITIVE_TYPE = ExecutableModelingProfilePackage.XCONSTRAINED_TYPE__BASE_PRIMITIVE_TYPE;

	/**
	 * The feature id for the '<em><b>Lower Bound</b></em>' reference.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 * @ordered
	 */
	int XT_CONSTRAINED_TYPE__LOWER_BOUND = ExecutableModelingProfilePackage.XCONSTRAINED_TYPE__LOWER_BOUND;

	/**
	 * The feature id for the '<em><b>Upper Bound</b></em>' reference.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 * @ordered
	 */
	int XT_CONSTRAINED_TYPE__UPPER_BOUND = ExecutableModelingProfilePackage.XCONSTRAINED_TYPE__UPPER_BOUND;

	/**
	 * The feature id for the '<em><b>Is Lower Bound Exclusive</b></em>' attribute.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 * @ordered
	 */
	int XT_CONSTRAINED_TYPE__IS_LOWER_BOUND_EXCLUSIVE = ExecutableModelingProfilePackage.XCONSTRAINED_TYPE__IS_LOWER_BOUND_EXCLUSIVE;

	/**
	 * The feature id for the '<em><b>Is Upper Bound Exclusive</b></em>' attribute.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 * @ordered
	 */
	int XT_CONSTRAINED_TYPE__IS_UPPER_BOUND_EXCLUSIVE = ExecutableModelingProfilePackage.XCONSTRAINED_TYPE__IS_UPPER_BOUND_EXCLUSIVE;

	/**
	 * The number of structural features of the '<em>Xt Constrained Type</em>' class.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 * @ordered
	 */
	int XT_CONSTRAINED_TYPE_FEATURE_COUNT = ExecutableModelingProfilePackage.XCONSTRAINED_TYPE_FEATURE_COUNT + 0;

	/**
	 * The operation id for the '<em>XNamed Element Name</em>' operation.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 * @ordered
	 */
	int XT_CONSTRAINED_TYPE___XNAMED_ELEMENT_NAME__DIAGNOSTICCHAIN_MAP = ExecutableModelingProfilePackage.XCONSTRAINED_TYPE___XNAMED_ELEMENT_NAME__DIAGNOSTICCHAIN_MAP;

	/**
	 * The operation id for the '<em>XClassifier Features</em>' operation.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 * @ordered
	 */
	int XT_CONSTRAINED_TYPE___XCLASSIFIER_FEATURES__DIAGNOSTICCHAIN_MAP = ExecutableModelingProfilePackage.XCONSTRAINED_TYPE___XCLASSIFIER_FEATURES__DIAGNOSTICCHAIN_MAP;

	/**
	 * The operation id for the '<em>XClassifier Nested Classifiers</em>' operation.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 * @ordered
	 */
	int XT_CONSTRAINED_TYPE___XCLASSIFIER_NESTED_CLASSIFIERS__DIAGNOSTICCHAIN_MAP = ExecutableModelingProfilePackage.XCONSTRAINED_TYPE___XCLASSIFIER_NESTED_CLASSIFIERS__DIAGNOSTICCHAIN_MAP;

	/**
	 * The operation id for the '<em>XClassifier Generals</em>' operation.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 * @ordered
	 */
	int XT_CONSTRAINED_TYPE___XCLASSIFIER_GENERALS__DIAGNOSTICCHAIN_MAP = ExecutableModelingProfilePackage.XCONSTRAINED_TYPE___XCLASSIFIER_GENERALS__DIAGNOSTICCHAIN_MAP;

	/**
	 * The operation id for the '<em>XClassifier Constraints</em>' operation.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 * @ordered
	 */
	int XT_CONSTRAINED_TYPE___XCLASSIFIER_CONSTRAINTS__DIAGNOSTICCHAIN_MAP = ExecutableModelingProfilePackage.XCONSTRAINED_TYPE___XCLASSIFIER_CONSTRAINTS__DIAGNOSTICCHAIN_MAP;

	/**
	 * The operation id for the '<em>XConstrained Type Primitive Type</em>' operation.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 * @ordered
	 */
	int XT_CONSTRAINED_TYPE___XCONSTRAINED_TYPE_PRIMITIVE_TYPE__DIAGNOSTICCHAIN_MAP = ExecutableModelingProfilePackage.XCONSTRAINED_TYPE___XCONSTRAINED_TYPE_PRIMITIVE_TYPE__DIAGNOSTICCHAIN_MAP;

	/**
	 * The operation id for the '<em>XConstrained Type Bounds</em>' operation.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 * @ordered
	 */
	int XT_CONSTRAINED_TYPE___XCONSTRAINED_TYPE_BOUNDS__DIAGNOSTICCHAIN_MAP = ExecutableModelingProfilePackage.XCONSTRAINED_TYPE___XCONSTRAINED_TYPE_BOUNDS__DIAGNOSTICCHAIN_MAP;

	/**
	 * The number of operations of the '<em>Xt Constrained Type</em>' class.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 * @ordered
	 */
	int XT_CONSTRAINED_TYPE_OPERATION_COUNT = ExecutableModelingProfilePackage.XCONSTRAINED_TYPE_OPERATION_COUNT + 0;

	/**
	 * The meta object id for the '{@link com.ericsson.executablemodeling.xtuml.profile.xtumlprofile.impl.XtOpaqueBehaviorImpl <em>Xt Opaque Behavior</em>}' class.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @see com.ericsson.executablemodeling.xtuml.profile.xtumlprofile.impl.XtOpaqueBehaviorImpl
	 * @see com.ericsson.executablemodeling.xtuml.profile.xtumlprofile.impl.xtUMLProfilePackageImpl#getXtOpaqueBehavior()
	 * @generated
	 */
	int XT_OPAQUE_BEHAVIOR = 27;

	/**
	 * The feature id for the '<em><b>Base Named Element</b></em>' reference.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 * @ordered
	 */
	int XT_OPAQUE_BEHAVIOR__BASE_NAMED_ELEMENT = ExecutableModelingProfilePackage.XOPAQUE_BEHAVIOR__BASE_NAMED_ELEMENT;

	/**
	 * The feature id for the '<em><b>Base Namespace</b></em>' reference.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 * @ordered
	 */
	int XT_OPAQUE_BEHAVIOR__BASE_NAMESPACE = ExecutableModelingProfilePackage.XOPAQUE_BEHAVIOR__BASE_NAMESPACE;

	/**
	 * The feature id for the '<em><b>Base Behavior</b></em>' reference.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 * @ordered
	 */
	int XT_OPAQUE_BEHAVIOR__BASE_BEHAVIOR = ExecutableModelingProfilePackage.XOPAQUE_BEHAVIOR__BASE_BEHAVIOR;

	/**
	 * The feature id for the '<em><b>Base Opaque Behavior</b></em>' reference.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 * @ordered
	 */
	int XT_OPAQUE_BEHAVIOR__BASE_OPAQUE_BEHAVIOR = ExecutableModelingProfilePackage.XOPAQUE_BEHAVIOR__BASE_OPAQUE_BEHAVIOR;

	/**
	 * The feature id for the '<em><b>Is External</b></em>' attribute.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 * @ordered
	 */
	int XT_OPAQUE_BEHAVIOR__IS_EXTERNAL = ExecutableModelingProfilePackage.XOPAQUE_BEHAVIOR__IS_EXTERNAL;

	/**
	 * The number of structural features of the '<em>Xt Opaque Behavior</em>' class.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 * @ordered
	 */
	int XT_OPAQUE_BEHAVIOR_FEATURE_COUNT = ExecutableModelingProfilePackage.XOPAQUE_BEHAVIOR_FEATURE_COUNT + 0;

	/**
	 * The operation id for the '<em>XNamed Element Name</em>' operation.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 * @ordered
	 */
	int XT_OPAQUE_BEHAVIOR___XNAMED_ELEMENT_NAME__DIAGNOSTICCHAIN_MAP = ExecutableModelingProfilePackage.XOPAQUE_BEHAVIOR___XNAMED_ELEMENT_NAME__DIAGNOSTICCHAIN_MAP;

	/**
	 * The operation id for the '<em>XBehavior No Parameter Sets</em>' operation.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 * @ordered
	 */
	int XT_OPAQUE_BEHAVIOR___XBEHAVIOR_NO_PARAMETER_SETS__DIAGNOSTICCHAIN_MAP = ExecutableModelingProfilePackage.XOPAQUE_BEHAVIOR___XBEHAVIOR_NO_PARAMETER_SETS__DIAGNOSTICCHAIN_MAP;

	/**
	 * The operation id for the '<em>XOpaque Behavior External</em>' operation.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 * @ordered
	 */
	int XT_OPAQUE_BEHAVIOR___XOPAQUE_BEHAVIOR_EXTERNAL__DIAGNOSTICCHAIN_MAP = ExecutableModelingProfilePackage.XOPAQUE_BEHAVIOR___XOPAQUE_BEHAVIOR_EXTERNAL__DIAGNOSTICCHAIN_MAP;

	/**
	 * The operation id for the '<em>Xt Opaque Behavior Language</em>' operation.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 * @ordered
	 */
	int XT_OPAQUE_BEHAVIOR___XT_OPAQUE_BEHAVIOR_LANGUAGE__DIAGNOSTICCHAIN_MAP = ExecutableModelingProfilePackage.XOPAQUE_BEHAVIOR_OPERATION_COUNT + 0;

	/**
	 * The number of operations of the '<em>Xt Opaque Behavior</em>' class.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 * @ordered
	 */
	int XT_OPAQUE_BEHAVIOR_OPERATION_COUNT = ExecutableModelingProfilePackage.XOPAQUE_BEHAVIOR_OPERATION_COUNT + 1;

	/**
	 * The meta object id for the '{@link com.ericsson.executablemodeling.xtuml.profile.xtumlprofile.impl.XtGeneralizationImpl <em>Xt Generalization</em>}' class.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @see com.ericsson.executablemodeling.xtuml.profile.xtumlprofile.impl.XtGeneralizationImpl
	 * @see com.ericsson.executablemodeling.xtuml.profile.xtumlprofile.impl.xtUMLProfilePackageImpl#getXtGeneralization()
	 * @generated
	 */
	int XT_GENERALIZATION = 28;

	/**
	 * The feature id for the '<em><b>Base Generalization</b></em>' reference.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 * @ordered
	 */
	int XT_GENERALIZATION__BASE_GENERALIZATION = ExecutableModelingProfilePackage.XGENERALIZATION__BASE_GENERALIZATION;

	/**
	 * The number of structural features of the '<em>Xt Generalization</em>' class.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 * @ordered
	 */
	int XT_GENERALIZATION_FEATURE_COUNT = ExecutableModelingProfilePackage.XGENERALIZATION_FEATURE_COUNT + 0;

	/**
	 * The operation id for the '<em>XGeneralization Classifiers</em>' operation.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 * @ordered
	 */
	int XT_GENERALIZATION___XGENERALIZATION_CLASSIFIERS__DIAGNOSTICCHAIN_MAP = ExecutableModelingProfilePackage.XGENERALIZATION___XGENERALIZATION_CLASSIFIERS__DIAGNOSTICCHAIN_MAP;

	/**
	 * The operation id for the '<em>XGeneralization Generalization Set</em>' operation.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 * @ordered
	 */
	int XT_GENERALIZATION___XGENERALIZATION_GENERALIZATION_SET__DIAGNOSTICCHAIN_MAP = ExecutableModelingProfilePackage.XGENERALIZATION___XGENERALIZATION_GENERALIZATION_SET__DIAGNOSTICCHAIN_MAP;

	/**
	 * The operation id for the '<em>Xt Generalization Generalization Set</em>' operation.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 * @ordered
	 */
	int XT_GENERALIZATION___XT_GENERALIZATION_GENERALIZATION_SET__DIAGNOSTICCHAIN_MAP = ExecutableModelingProfilePackage.XGENERALIZATION_OPERATION_COUNT + 0;

	/**
	 * The number of operations of the '<em>Xt Generalization</em>' class.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 * @ordered
	 */
	int XT_GENERALIZATION_OPERATION_COUNT = ExecutableModelingProfilePackage.XGENERALIZATION_OPERATION_COUNT + 1;

	/**
	 * The meta object id for the '{@link com.ericsson.executablemodeling.xtuml.profile.xtumlprofile.impl.XtGeneralizationSetImpl <em>Xt Generalization Set</em>}' class.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @see com.ericsson.executablemodeling.xtuml.profile.xtumlprofile.impl.XtGeneralizationSetImpl
	 * @see com.ericsson.executablemodeling.xtuml.profile.xtumlprofile.impl.xtUMLProfilePackageImpl#getXtGeneralizationSet()
	 * @generated
	 */
	int XT_GENERALIZATION_SET = 29;

	/**
	 * The feature id for the '<em><b>Base Generalization Set</b></em>' reference.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 * @ordered
	 */
	int XT_GENERALIZATION_SET__BASE_GENERALIZATION_SET = ExecutableModelingProfilePackage.XGENERALIZATION_SET__BASE_GENERALIZATION_SET;

	/**
	 * The number of structural features of the '<em>Xt Generalization Set</em>' class.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 * @ordered
	 */
	int XT_GENERALIZATION_SET_FEATURE_COUNT = ExecutableModelingProfilePackage.XGENERALIZATION_SET_FEATURE_COUNT + 0;

	/**
	 * The operation id for the '<em>Xt Generalization Set</em>' operation.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 * @ordered
	 */
	int XT_GENERALIZATION_SET___XT_GENERALIZATION_SET__DIAGNOSTICCHAIN_MAP = ExecutableModelingProfilePackage.XGENERALIZATION_SET_OPERATION_COUNT + 0;

	/**
	 * The number of operations of the '<em>Xt Generalization Set</em>' class.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 * @ordered
	 */
	int XT_GENERALIZATION_SET_OPERATION_COUNT = ExecutableModelingProfilePackage.XGENERALIZATION_SET_OPERATION_COUNT + 1;


	/**
	 * Returns the meta object for class '{@link com.ericsson.executablemodeling.xtuml.profile.xtumlprofile.XtConnectorEnd <em>Xt Connector End</em>}'.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @return the meta object for class '<em>Xt Connector End</em>'.
	 * @see com.ericsson.executablemodeling.xtuml.profile.xtumlprofile.XtConnectorEnd
	 * @generated
	 */
	EClass getXtConnectorEnd();

	/**
	 * Returns the meta object for the '{@link com.ericsson.executablemodeling.xtuml.profile.xtumlprofile.XtConnectorEnd#xtConnectorEndRole(org.eclipse.emf.common.util.DiagnosticChain, java.util.Map) <em>Xt Connector End Role</em>}' operation.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @return the meta object for the '<em>Xt Connector End Role</em>' operation.
	 * @see com.ericsson.executablemodeling.xtuml.profile.xtumlprofile.XtConnectorEnd#xtConnectorEndRole(org.eclipse.emf.common.util.DiagnosticChain, java.util.Map)
	 * @generated
	 */
	EOperation getXtConnectorEnd__XtConnectorEndRole__DiagnosticChain_Map();

	/**
	 * Returns the meta object for class '{@link com.ericsson.executablemodeling.xtuml.profile.xtumlprofile.XtProperty <em>Xt Property</em>}'.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @return the meta object for class '<em>Xt Property</em>'.
	 * @see com.ericsson.executablemodeling.xtuml.profile.xtumlprofile.XtProperty
	 * @generated
	 */
	EClass getXtProperty();

	/**
	 * Returns the meta object for the reference '{@link com.ericsson.executablemodeling.xtuml.profile.xtumlprofile.XtProperty#getDerivation <em>Derivation</em>}'.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @return the meta object for the reference '<em>Derivation</em>'.
	 * @see com.ericsson.executablemodeling.xtuml.profile.xtumlprofile.XtProperty#getDerivation()
	 * @see #getXtProperty()
	 * @generated
	 */
	EReference getXtProperty_Derivation();

	/**
	 * Returns the meta object for the '{@link com.ericsson.executablemodeling.xtuml.profile.xtumlprofile.XtProperty#xtPropertyAggregation(org.eclipse.emf.common.util.DiagnosticChain, java.util.Map) <em>Xt Property Aggregation</em>}' operation.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @return the meta object for the '<em>Xt Property Aggregation</em>' operation.
	 * @see com.ericsson.executablemodeling.xtuml.profile.xtumlprofile.XtProperty#xtPropertyAggregation(org.eclipse.emf.common.util.DiagnosticChain, java.util.Map)
	 * @generated
	 */
	EOperation getXtProperty__XtPropertyAggregation__DiagnosticChain_Map();

	/**
	 * Returns the meta object for the '{@link com.ericsson.executablemodeling.xtuml.profile.xtumlprofile.XtProperty#xtPropertyRedefinition(org.eclipse.emf.common.util.DiagnosticChain, java.util.Map) <em>Xt Property Redefinition</em>}' operation.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @return the meta object for the '<em>Xt Property Redefinition</em>' operation.
	 * @see com.ericsson.executablemodeling.xtuml.profile.xtumlprofile.XtProperty#xtPropertyRedefinition(org.eclipse.emf.common.util.DiagnosticChain, java.util.Map)
	 * @generated
	 */
	EOperation getXtProperty__XtPropertyRedefinition__DiagnosticChain_Map();

	/**
	 * Returns the meta object for the '{@link com.ericsson.executablemodeling.xtuml.profile.xtumlprofile.XtProperty#xtPropertyDerivation(org.eclipse.emf.common.util.DiagnosticChain, java.util.Map) <em>Xt Property Derivation</em>}' operation.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @return the meta object for the '<em>Xt Property Derivation</em>' operation.
	 * @see com.ericsson.executablemodeling.xtuml.profile.xtumlprofile.XtProperty#xtPropertyDerivation(org.eclipse.emf.common.util.DiagnosticChain, java.util.Map)
	 * @generated
	 */
	EOperation getXtProperty__XtPropertyDerivation__DiagnosticChain_Map();

	/**
	 * Returns the meta object for class '{@link com.ericsson.executablemodeling.xtuml.profile.xtumlprofile.XtComponent <em>Xt Component</em>}'.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @return the meta object for class '<em>Xt Component</em>'.
	 * @see com.ericsson.executablemodeling.xtuml.profile.xtumlprofile.XtComponent
	 * @generated
	 */
	EClass getXtComponent();

	/**
	 * Returns the meta object for the reference '{@link com.ericsson.executablemodeling.xtuml.profile.xtumlprofile.XtComponent#getBase_Component <em>Base Component</em>}'.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @return the meta object for the reference '<em>Base Component</em>'.
	 * @see com.ericsson.executablemodeling.xtuml.profile.xtumlprofile.XtComponent#getBase_Component()
	 * @see #getXtComponent()
	 * @generated
	 */
	EReference getXtComponent_Base_Component();

	/**
	 * Returns the meta object for the '{@link com.ericsson.executablemodeling.xtuml.profile.xtumlprofile.XtComponent#xtComponentAttributes(org.eclipse.emf.common.util.DiagnosticChain, java.util.Map) <em>Xt Component Attributes</em>}' operation.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @return the meta object for the '<em>Xt Component Attributes</em>' operation.
	 * @see com.ericsson.executablemodeling.xtuml.profile.xtumlprofile.XtComponent#xtComponentAttributes(org.eclipse.emf.common.util.DiagnosticChain, java.util.Map)
	 * @generated
	 */
	EOperation getXtComponent__XtComponentAttributes__DiagnosticChain_Map();

	/**
	 * Returns the meta object for the '{@link com.ericsson.executablemodeling.xtuml.profile.xtumlprofile.XtComponent#xtComponentBehavioralFeatures(org.eclipse.emf.common.util.DiagnosticChain, java.util.Map) <em>Xt Component Behavioral Features</em>}' operation.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @return the meta object for the '<em>Xt Component Behavioral Features</em>' operation.
	 * @see com.ericsson.executablemodeling.xtuml.profile.xtumlprofile.XtComponent#xtComponentBehavioralFeatures(org.eclipse.emf.common.util.DiagnosticChain, java.util.Map)
	 * @generated
	 */
	EOperation getXtComponent__XtComponentBehavioralFeatures__DiagnosticChain_Map();

	/**
	 * Returns the meta object for the '{@link com.ericsson.executablemodeling.xtuml.profile.xtumlprofile.XtComponent#xtComponentOwnedBehaviors(org.eclipse.emf.common.util.DiagnosticChain, java.util.Map) <em>Xt Component Owned Behaviors</em>}' operation.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @return the meta object for the '<em>Xt Component Owned Behaviors</em>' operation.
	 * @see com.ericsson.executablemodeling.xtuml.profile.xtumlprofile.XtComponent#xtComponentOwnedBehaviors(org.eclipse.emf.common.util.DiagnosticChain, java.util.Map)
	 * @generated
	 */
	EOperation getXtComponent__XtComponentOwnedBehaviors__DiagnosticChain_Map();

	/**
	 * Returns the meta object for the '{@link com.ericsson.executablemodeling.xtuml.profile.xtumlprofile.XtComponent#xtComponentNestedClassifiers(org.eclipse.emf.common.util.DiagnosticChain, java.util.Map) <em>Xt Component Nested Classifiers</em>}' operation.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @return the meta object for the '<em>Xt Component Nested Classifiers</em>' operation.
	 * @see com.ericsson.executablemodeling.xtuml.profile.xtumlprofile.XtComponent#xtComponentNestedClassifiers(org.eclipse.emf.common.util.DiagnosticChain, java.util.Map)
	 * @generated
	 */
	EOperation getXtComponent__XtComponentNestedClassifiers__DiagnosticChain_Map();

	/**
	 * Returns the meta object for the '{@link com.ericsson.executablemodeling.xtuml.profile.xtumlprofile.XtComponent#xtComponentParts(org.eclipse.emf.common.util.DiagnosticChain, java.util.Map) <em>Xt Component Parts</em>}' operation.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @return the meta object for the '<em>Xt Component Parts</em>' operation.
	 * @see com.ericsson.executablemodeling.xtuml.profile.xtumlprofile.XtComponent#xtComponentParts(org.eclipse.emf.common.util.DiagnosticChain, java.util.Map)
	 * @generated
	 */
	EOperation getXtComponent__XtComponentParts__DiagnosticChain_Map();

	/**
	 * Returns the meta object for the '{@link com.ericsson.executablemodeling.xtuml.profile.xtumlprofile.XtComponent#xtComponentGeneralization(org.eclipse.emf.common.util.DiagnosticChain, java.util.Map) <em>Xt Component Generalization</em>}' operation.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @return the meta object for the '<em>Xt Component Generalization</em>' operation.
	 * @see com.ericsson.executablemodeling.xtuml.profile.xtumlprofile.XtComponent#xtComponentGeneralization(org.eclipse.emf.common.util.DiagnosticChain, java.util.Map)
	 * @generated
	 */
	EOperation getXtComponent__XtComponentGeneralization__DiagnosticChain_Map();

	/**
	 * Returns the meta object for class '{@link com.ericsson.executablemodeling.xtuml.profile.xtumlprofile.XtOperation <em>Xt Operation</em>}'.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @return the meta object for class '<em>Xt Operation</em>'.
	 * @see com.ericsson.executablemodeling.xtuml.profile.xtumlprofile.XtOperation
	 * @generated
	 */
	EClass getXtOperation();

	/**
	 * Returns the meta object for class '{@link com.ericsson.executablemodeling.xtuml.profile.xtumlprofile.XtParameter <em>Xt Parameter</em>}'.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @return the meta object for class '<em>Xt Parameter</em>'.
	 * @see com.ericsson.executablemodeling.xtuml.profile.xtumlprofile.XtParameter
	 * @generated
	 */
	EClass getXtParameter();

	/**
	 * Returns the meta object for class '{@link com.ericsson.executablemodeling.xtuml.profile.xtumlprofile.XtReception <em>Xt Reception</em>}'.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @return the meta object for class '<em>Xt Reception</em>'.
	 * @see com.ericsson.executablemodeling.xtuml.profile.xtumlprofile.XtReception
	 * @generated
	 */
	EClass getXtReception();

	/**
	 * Returns the meta object for class '{@link com.ericsson.executablemodeling.xtuml.profile.xtumlprofile.XtPart <em>Xt Part</em>}'.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @return the meta object for class '<em>Xt Part</em>'.
	 * @see com.ericsson.executablemodeling.xtuml.profile.xtumlprofile.XtPart
	 * @generated
	 */
	EClass getXtPart();

	/**
	 * Returns the meta object for the '{@link com.ericsson.executablemodeling.xtuml.profile.xtumlprofile.XtPart#xtPartType(org.eclipse.emf.common.util.DiagnosticChain, java.util.Map) <em>Xt Part Type</em>}' operation.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @return the meta object for the '<em>Xt Part Type</em>' operation.
	 * @see com.ericsson.executablemodeling.xtuml.profile.xtumlprofile.XtPart#xtPartType(org.eclipse.emf.common.util.DiagnosticChain, java.util.Map)
	 * @generated
	 */
	EOperation getXtPart__XtPartType__DiagnosticChain_Map();

	/**
	 * Returns the meta object for the '{@link com.ericsson.executablemodeling.xtuml.profile.xtumlprofile.XtPart#xtPartComposition(org.eclipse.emf.common.util.DiagnosticChain, java.util.Map) <em>Xt Part Composition</em>}' operation.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @return the meta object for the '<em>Xt Part Composition</em>' operation.
	 * @see com.ericsson.executablemodeling.xtuml.profile.xtumlprofile.XtPart#xtPartComposition(org.eclipse.emf.common.util.DiagnosticChain, java.util.Map)
	 * @generated
	 */
	EOperation getXtPart__XtPartComposition__DiagnosticChain_Map();

	/**
	 * Returns the meta object for the '{@link com.ericsson.executablemodeling.xtuml.profile.xtumlprofile.XtPart#xtPartVisibility(org.eclipse.emf.common.util.DiagnosticChain, java.util.Map) <em>Xt Part Visibility</em>}' operation.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @return the meta object for the '<em>Xt Part Visibility</em>' operation.
	 * @see com.ericsson.executablemodeling.xtuml.profile.xtumlprofile.XtPart#xtPartVisibility(org.eclipse.emf.common.util.DiagnosticChain, java.util.Map)
	 * @generated
	 */
	EOperation getXtPart__XtPartVisibility__DiagnosticChain_Map();

	/**
	 * Returns the meta object for class '{@link com.ericsson.executablemodeling.xtuml.profile.xtumlprofile.XtPort <em>Xt Port</em>}'.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @return the meta object for class '<em>Xt Port</em>'.
	 * @see com.ericsson.executablemodeling.xtuml.profile.xtumlprofile.XtPort
	 * @generated
	 */
	EClass getXtPort();

	/**
	 * Returns the meta object for the '{@link com.ericsson.executablemodeling.xtuml.profile.xtumlprofile.XtPort#xtPortVisibility(org.eclipse.emf.common.util.DiagnosticChain, java.util.Map) <em>Xt Port Visibility</em>}' operation.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @return the meta object for the '<em>Xt Port Visibility</em>' operation.
	 * @see com.ericsson.executablemodeling.xtuml.profile.xtumlprofile.XtPort#xtPortVisibility(org.eclipse.emf.common.util.DiagnosticChain, java.util.Map)
	 * @generated
	 */
	EOperation getXtPort__XtPortVisibility__DiagnosticChain_Map();

	/**
	 * Returns the meta object for the '{@link com.ericsson.executablemodeling.xtuml.profile.xtumlprofile.XtPort#xtConnectorVisibility(org.eclipse.emf.common.util.DiagnosticChain, java.util.Map) <em>Xt Connector Visibility</em>}' operation.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @return the meta object for the '<em>Xt Connector Visibility</em>' operation.
	 * @see com.ericsson.executablemodeling.xtuml.profile.xtumlprofile.XtPort#xtConnectorVisibility(org.eclipse.emf.common.util.DiagnosticChain, java.util.Map)
	 * @generated
	 */
	EOperation getXtPort__XtConnectorVisibility__DiagnosticChain_Map();

	/**
	 * Returns the meta object for the '{@link com.ericsson.executablemodeling.xtuml.profile.xtumlprofile.XtPort#xtPortBehaviorPort(org.eclipse.emf.common.util.DiagnosticChain, java.util.Map) <em>Xt Port Behavior Port</em>}' operation.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @return the meta object for the '<em>Xt Port Behavior Port</em>' operation.
	 * @see com.ericsson.executablemodeling.xtuml.profile.xtumlprofile.XtPort#xtPortBehaviorPort(org.eclipse.emf.common.util.DiagnosticChain, java.util.Map)
	 * @generated
	 */
	EOperation getXtPort__XtPortBehaviorPort__DiagnosticChain_Map();

	/**
	 * Returns the meta object for class '{@link com.ericsson.executablemodeling.xtuml.profile.xtumlprofile.XtConnector <em>Xt Connector</em>}'.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @return the meta object for class '<em>Xt Connector</em>'.
	 * @see com.ericsson.executablemodeling.xtuml.profile.xtumlprofile.XtConnector
	 * @generated
	 */
	EClass getXtConnector();

	/**
	 * Returns the meta object for the '{@link com.ericsson.executablemodeling.xtuml.profile.xtumlprofile.XtConnector#xtConnectorConnectorEnds(org.eclipse.emf.common.util.DiagnosticChain, java.util.Map) <em>Xt Connector Connector Ends</em>}' operation.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @return the meta object for the '<em>Xt Connector Connector Ends</em>' operation.
	 * @see com.ericsson.executablemodeling.xtuml.profile.xtumlprofile.XtConnector#xtConnectorConnectorEnds(org.eclipse.emf.common.util.DiagnosticChain, java.util.Map)
	 * @generated
	 */
	EOperation getXtConnector__XtConnectorConnectorEnds__DiagnosticChain_Map();

	/**
	 * Returns the meta object for class '{@link com.ericsson.executablemodeling.xtuml.profile.xtumlprofile.XtProtocolContainer <em>Xt Protocol Container</em>}'.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @return the meta object for class '<em>Xt Protocol Container</em>'.
	 * @see com.ericsson.executablemodeling.xtuml.profile.xtumlprofile.XtProtocolContainer
	 * @generated
	 */
	EClass getXtProtocolContainer();

	/**
	 * Returns the meta object for class '{@link com.ericsson.executablemodeling.xtuml.profile.xtumlprofile.XtProtocol <em>Xt Protocol</em>}'.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @return the meta object for class '<em>Xt Protocol</em>'.
	 * @see com.ericsson.executablemodeling.xtuml.profile.xtumlprofile.XtProtocol
	 * @generated
	 */
	EClass getXtProtocol();

	/**
	 * Returns the meta object for the reference '{@link com.ericsson.executablemodeling.xtuml.profile.xtumlprofile.XtProtocol#getBase_Class <em>Base Class</em>}'.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @return the meta object for the reference '<em>Base Class</em>'.
	 * @see com.ericsson.executablemodeling.xtuml.profile.xtumlprofile.XtProtocol#getBase_Class()
	 * @see #getXtProtocol()
	 * @generated
	 */
	EReference getXtProtocol_Base_Class();

	/**
	 * Returns the meta object for the '{@link com.ericsson.executablemodeling.xtuml.profile.xtumlprofile.XtProtocol#xtProtocolNestedClassifiers(org.eclipse.emf.common.util.DiagnosticChain, java.util.Map) <em>Xt Protocol Nested Classifiers</em>}' operation.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @return the meta object for the '<em>Xt Protocol Nested Classifiers</em>' operation.
	 * @see com.ericsson.executablemodeling.xtuml.profile.xtumlprofile.XtProtocol#xtProtocolNestedClassifiers(org.eclipse.emf.common.util.DiagnosticChain, java.util.Map)
	 * @generated
	 */
	EOperation getXtProtocol__XtProtocolNestedClassifiers__DiagnosticChain_Map();

	/**
	 * Returns the meta object for the '{@link com.ericsson.executablemodeling.xtuml.profile.xtumlprofile.XtProtocol#xtProtocolBehaviors(org.eclipse.emf.common.util.DiagnosticChain, java.util.Map) <em>Xt Protocol Behaviors</em>}' operation.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @return the meta object for the '<em>Xt Protocol Behaviors</em>' operation.
	 * @see com.ericsson.executablemodeling.xtuml.profile.xtumlprofile.XtProtocol#xtProtocolBehaviors(org.eclipse.emf.common.util.DiagnosticChain, java.util.Map)
	 * @generated
	 */
	EOperation getXtProtocol__XtProtocolBehaviors__DiagnosticChain_Map();

	/**
	 * Returns the meta object for class '{@link com.ericsson.executablemodeling.xtuml.profile.xtumlprofile.XtMessageSet <em>Xt Message Set</em>}'.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @return the meta object for class '<em>Xt Message Set</em>'.
	 * @see com.ericsson.executablemodeling.xtuml.profile.xtumlprofile.XtMessageSet
	 * @generated
	 */
	EClass getXtMessageSet();

	/**
	 * Returns the meta object for the '{@link com.ericsson.executablemodeling.xtuml.profile.xtumlprofile.XtMessageSet#xtMessageSetNestedClassifiers(org.eclipse.emf.common.util.DiagnosticChain, java.util.Map) <em>Xt Message Set Nested Classifiers</em>}' operation.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @return the meta object for the '<em>Xt Message Set Nested Classifiers</em>' operation.
	 * @see com.ericsson.executablemodeling.xtuml.profile.xtumlprofile.XtMessageSet#xtMessageSetNestedClassifiers(org.eclipse.emf.common.util.DiagnosticChain, java.util.Map)
	 * @generated
	 */
	EOperation getXtMessageSet__XtMessageSetNestedClassifiers__DiagnosticChain_Map();

	/**
	 * Returns the meta object for the '{@link com.ericsson.executablemodeling.xtuml.profile.xtumlprofile.XtMessageSet#xtMessageSetAttributes(org.eclipse.emf.common.util.DiagnosticChain, java.util.Map) <em>Xt Message Set Attributes</em>}' operation.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @return the meta object for the '<em>Xt Message Set Attributes</em>' operation.
	 * @see com.ericsson.executablemodeling.xtuml.profile.xtumlprofile.XtMessageSet#xtMessageSetAttributes(org.eclipse.emf.common.util.DiagnosticChain, java.util.Map)
	 * @generated
	 */
	EOperation getXtMessageSet__XtMessageSetAttributes__DiagnosticChain_Map();

	/**
	 * Returns the meta object for class '{@link com.ericsson.executablemodeling.xtuml.profile.xtumlprofile.XtSignal <em>Xt Signal</em>}'.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @return the meta object for class '<em>Xt Signal</em>'.
	 * @see com.ericsson.executablemodeling.xtuml.profile.xtumlprofile.XtSignal
	 * @generated
	 */
	EClass getXtSignal();

	/**
	 * Returns the meta object for class '{@link com.ericsson.executablemodeling.xtuml.profile.xtumlprofile.XtDataType <em>Xt Data Type</em>}'.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @return the meta object for class '<em>Xt Data Type</em>'.
	 * @see com.ericsson.executablemodeling.xtuml.profile.xtumlprofile.XtDataType
	 * @generated
	 */
	EClass getXtDataType();

	/**
	 * Returns the meta object for class '{@link com.ericsson.executablemodeling.xtuml.profile.xtumlprofile.XtEnumeration <em>Xt Enumeration</em>}'.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @return the meta object for class '<em>Xt Enumeration</em>'.
	 * @see com.ericsson.executablemodeling.xtuml.profile.xtumlprofile.XtEnumeration
	 * @generated
	 */
	EClass getXtEnumeration();

	/**
	 * Returns the meta object for class '{@link com.ericsson.executablemodeling.xtuml.profile.xtumlprofile.XtAssociation <em>Xt Association</em>}'.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @return the meta object for class '<em>Xt Association</em>'.
	 * @see com.ericsson.executablemodeling.xtuml.profile.xtumlprofile.XtAssociation
	 * @generated
	 */
	EClass getXtAssociation();

	/**
	 * Returns the meta object for the '{@link com.ericsson.executablemodeling.xtuml.profile.xtumlprofile.XtAssociation#xtAssociationEndOwnership(org.eclipse.emf.common.util.DiagnosticChain, java.util.Map) <em>Xt Association End Ownership</em>}' operation.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @return the meta object for the '<em>Xt Association End Ownership</em>' operation.
	 * @see com.ericsson.executablemodeling.xtuml.profile.xtumlprofile.XtAssociation#xtAssociationEndOwnership(org.eclipse.emf.common.util.DiagnosticChain, java.util.Map)
	 * @generated
	 */
	EOperation getXtAssociation__XtAssociationEndOwnership__DiagnosticChain_Map();

	/**
	 * Returns the meta object for the '{@link com.ericsson.executablemodeling.xtuml.profile.xtumlprofile.XtAssociation#xtAssociationEnds(org.eclipse.emf.common.util.DiagnosticChain, java.util.Map) <em>Xt Association Ends</em>}' operation.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @return the meta object for the '<em>Xt Association Ends</em>' operation.
	 * @see com.ericsson.executablemodeling.xtuml.profile.xtumlprofile.XtAssociation#xtAssociationEnds(org.eclipse.emf.common.util.DiagnosticChain, java.util.Map)
	 * @generated
	 */
	EOperation getXtAssociation__XtAssociationEnds__DiagnosticChain_Map();

	/**
	 * Returns the meta object for the '{@link com.ericsson.executablemodeling.xtuml.profile.xtumlprofile.XtAssociation#xtAssociationEndType(org.eclipse.emf.common.util.DiagnosticChain, java.util.Map) <em>Xt Association End Type</em>}' operation.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @return the meta object for the '<em>Xt Association End Type</em>' operation.
	 * @see com.ericsson.executablemodeling.xtuml.profile.xtumlprofile.XtAssociation#xtAssociationEndType(org.eclipse.emf.common.util.DiagnosticChain, java.util.Map)
	 * @generated
	 */
	EOperation getXtAssociation__XtAssociationEndType__DiagnosticChain_Map();

	/**
	 * Returns the meta object for the '{@link com.ericsson.executablemodeling.xtuml.profile.xtumlprofile.XtAssociation#xtAssociationGeneralization(org.eclipse.emf.common.util.DiagnosticChain, java.util.Map) <em>Xt Association Generalization</em>}' operation.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @return the meta object for the '<em>Xt Association Generalization</em>' operation.
	 * @see com.ericsson.executablemodeling.xtuml.profile.xtumlprofile.XtAssociation#xtAssociationGeneralization(org.eclipse.emf.common.util.DiagnosticChain, java.util.Map)
	 * @generated
	 */
	EOperation getXtAssociation__XtAssociationGeneralization__DiagnosticChain_Map();

	/**
	 * Returns the meta object for class '{@link com.ericsson.executablemodeling.xtuml.profile.xtumlprofile.XtAssociationClass <em>Xt Association Class</em>}'.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @return the meta object for class '<em>Xt Association Class</em>'.
	 * @see com.ericsson.executablemodeling.xtuml.profile.xtumlprofile.XtAssociationClass
	 * @generated
	 */
	EClass getXtAssociationClass();

	/**
	 * Returns the meta object for class '{@link com.ericsson.executablemodeling.xtuml.profile.xtumlprofile.XtTrigger <em>Xt Trigger</em>}'.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @return the meta object for class '<em>Xt Trigger</em>'.
	 * @see com.ericsson.executablemodeling.xtuml.profile.xtumlprofile.XtTrigger
	 * @generated
	 */
	EClass getXtTrigger();

	/**
	 * Returns the meta object for the '{@link com.ericsson.executablemodeling.xtuml.profile.xtumlprofile.XtTrigger#xtTriggerEvent(org.eclipse.emf.common.util.DiagnosticChain, java.util.Map) <em>Xt Trigger Event</em>}' operation.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @return the meta object for the '<em>Xt Trigger Event</em>' operation.
	 * @see com.ericsson.executablemodeling.xtuml.profile.xtumlprofile.XtTrigger#xtTriggerEvent(org.eclipse.emf.common.util.DiagnosticChain, java.util.Map)
	 * @generated
	 */
	EOperation getXtTrigger__XtTriggerEvent__DiagnosticChain_Map();

	/**
	 * Returns the meta object for class '{@link com.ericsson.executablemodeling.xtuml.profile.xtumlprofile.XtStateMachine <em>Xt State Machine</em>}'.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @return the meta object for class '<em>Xt State Machine</em>'.
	 * @see com.ericsson.executablemodeling.xtuml.profile.xtumlprofile.XtStateMachine
	 * @generated
	 */
	EClass getXtStateMachine();

	/**
	 * Returns the meta object for class '{@link com.ericsson.executablemodeling.xtuml.profile.xtumlprofile.XtRegion <em>Xt Region</em>}'.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @return the meta object for class '<em>Xt Region</em>'.
	 * @see com.ericsson.executablemodeling.xtuml.profile.xtumlprofile.XtRegion
	 * @generated
	 */
	EClass getXtRegion();

	/**
	 * Returns the meta object for class '{@link com.ericsson.executablemodeling.xtuml.profile.xtumlprofile.XtPseudoState <em>Xt Pseudo State</em>}'.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @return the meta object for class '<em>Xt Pseudo State</em>'.
	 * @see com.ericsson.executablemodeling.xtuml.profile.xtumlprofile.XtPseudoState
	 * @generated
	 */
	EClass getXtPseudoState();

	/**
	 * Returns the meta object for the '{@link com.ericsson.executablemodeling.xtuml.profile.xtumlprofile.XtPseudoState#xtPseudostateKind(org.eclipse.emf.common.util.DiagnosticChain, java.util.Map) <em>Xt Pseudostate Kind</em>}' operation.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @return the meta object for the '<em>Xt Pseudostate Kind</em>' operation.
	 * @see com.ericsson.executablemodeling.xtuml.profile.xtumlprofile.XtPseudoState#xtPseudostateKind(org.eclipse.emf.common.util.DiagnosticChain, java.util.Map)
	 * @generated
	 */
	EOperation getXtPseudoState__XtPseudostateKind__DiagnosticChain_Map();

	/**
	 * Returns the meta object for class '{@link com.ericsson.executablemodeling.xtuml.profile.xtumlprofile.XtTransition <em>Xt Transition</em>}'.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @return the meta object for class '<em>Xt Transition</em>'.
	 * @see com.ericsson.executablemodeling.xtuml.profile.xtumlprofile.XtTransition
	 * @generated
	 */
	EClass getXtTransition();

	/**
	 * Returns the meta object for the '{@link com.ericsson.executablemodeling.xtuml.profile.xtumlprofile.XtTransition#xtTransitionNoGuard(org.eclipse.emf.common.util.DiagnosticChain, java.util.Map) <em>Xt Transition No Guard</em>}' operation.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @return the meta object for the '<em>Xt Transition No Guard</em>' operation.
	 * @see com.ericsson.executablemodeling.xtuml.profile.xtumlprofile.XtTransition#xtTransitionNoGuard(org.eclipse.emf.common.util.DiagnosticChain, java.util.Map)
	 * @generated
	 */
	EOperation getXtTransition__XtTransitionNoGuard__DiagnosticChain_Map();

	/**
	 * Returns the meta object for class '{@link com.ericsson.executablemodeling.xtuml.profile.xtumlprofile.XtState <em>Xt State</em>}'.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @return the meta object for class '<em>Xt State</em>'.
	 * @see com.ericsson.executablemodeling.xtuml.profile.xtumlprofile.XtState
	 * @generated
	 */
	EClass getXtState();

	/**
	 * Returns the meta object for the '{@link com.ericsson.executablemodeling.xtuml.profile.xtumlprofile.XtState#xStateNotComposite(org.eclipse.emf.common.util.DiagnosticChain, java.util.Map) <em>XState Not Composite</em>}' operation.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @return the meta object for the '<em>XState Not Composite</em>' operation.
	 * @see com.ericsson.executablemodeling.xtuml.profile.xtumlprofile.XtState#xStateNotComposite(org.eclipse.emf.common.util.DiagnosticChain, java.util.Map)
	 * @generated
	 */
	EOperation getXtState__XStateNotComposite__DiagnosticChain_Map();

	/**
	 * Returns the meta object for class '{@link com.ericsson.executablemodeling.xtuml.profile.xtumlprofile.XtActivity <em>Xt Activity</em>}'.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @return the meta object for class '<em>Xt Activity</em>'.
	 * @see com.ericsson.executablemodeling.xtuml.profile.xtumlprofile.XtActivity
	 * @generated
	 */
	EClass getXtActivity();

	/**
	 * Returns the meta object for the '{@link com.ericsson.executablemodeling.xtuml.profile.xtumlprofile.XtActivity#xtActivityTextualRepresentation(org.eclipse.emf.common.util.DiagnosticChain, java.util.Map) <em>Xt Activity Textual Representation</em>}' operation.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @return the meta object for the '<em>Xt Activity Textual Representation</em>' operation.
	 * @see com.ericsson.executablemodeling.xtuml.profile.xtumlprofile.XtActivity#xtActivityTextualRepresentation(org.eclipse.emf.common.util.DiagnosticChain, java.util.Map)
	 * @generated
	 */
	EOperation getXtActivity__XtActivityTextualRepresentation__DiagnosticChain_Map();

	/**
	 * Returns the meta object for class '{@link com.ericsson.executablemodeling.xtuml.profile.xtumlprofile.XtConstraint <em>Xt Constraint</em>}'.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @return the meta object for class '<em>Xt Constraint</em>'.
	 * @see com.ericsson.executablemodeling.xtuml.profile.xtumlprofile.XtConstraint
	 * @generated
	 */
	EClass getXtConstraint();

	/**
	 * Returns the meta object for class '{@link com.ericsson.executablemodeling.xtuml.profile.xtumlprofile.XtClass <em>Xt Class</em>}'.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @return the meta object for class '<em>Xt Class</em>'.
	 * @see com.ericsson.executablemodeling.xtuml.profile.xtumlprofile.XtClass
	 * @generated
	 */
	EClass getXtClass();

	/**
	 * Returns the meta object for the '{@link com.ericsson.executablemodeling.xtuml.profile.xtumlprofile.XtClass#xtClassConstructors(org.eclipse.emf.common.util.DiagnosticChain, java.util.Map) <em>Xt Class Constructors</em>}' operation.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @return the meta object for the '<em>Xt Class Constructors</em>' operation.
	 * @see com.ericsson.executablemodeling.xtuml.profile.xtumlprofile.XtClass#xtClassConstructors(org.eclipse.emf.common.util.DiagnosticChain, java.util.Map)
	 * @generated
	 */
	EOperation getXtClass__XtClassConstructors__DiagnosticChain_Map();

	/**
	 * Returns the meta object for the '{@link com.ericsson.executablemodeling.xtuml.profile.xtumlprofile.XtClass#xtClassClassifierBehavior(org.eclipse.emf.common.util.DiagnosticChain, java.util.Map) <em>Xt Class Classifier Behavior</em>}' operation.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @return the meta object for the '<em>Xt Class Classifier Behavior</em>' operation.
	 * @see com.ericsson.executablemodeling.xtuml.profile.xtumlprofile.XtClass#xtClassClassifierBehavior(org.eclipse.emf.common.util.DiagnosticChain, java.util.Map)
	 * @generated
	 */
	EOperation getXtClass__XtClassClassifierBehavior__DiagnosticChain_Map();

	/**
	 * Returns the meta object for the '{@link com.ericsson.executablemodeling.xtuml.profile.xtumlprofile.XtClass#xtClassVisibility(org.eclipse.emf.common.util.DiagnosticChain, java.util.Map) <em>Xt Class Visibility</em>}' operation.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @return the meta object for the '<em>Xt Class Visibility</em>' operation.
	 * @see com.ericsson.executablemodeling.xtuml.profile.xtumlprofile.XtClass#xtClassVisibility(org.eclipse.emf.common.util.DiagnosticChain, java.util.Map)
	 * @generated
	 */
	EOperation getXtClass__XtClassVisibility__DiagnosticChain_Map();

	/**
	 * Returns the meta object for the '{@link com.ericsson.executablemodeling.xtuml.profile.xtumlprofile.XtClass#xtClassGeneralizationSets(org.eclipse.emf.common.util.DiagnosticChain, java.util.Map) <em>Xt Class Generalization Sets</em>}' operation.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @return the meta object for the '<em>Xt Class Generalization Sets</em>' operation.
	 * @see com.ericsson.executablemodeling.xtuml.profile.xtumlprofile.XtClass#xtClassGeneralizationSets(org.eclipse.emf.common.util.DiagnosticChain, java.util.Map)
	 * @generated
	 */
	EOperation getXtClass__XtClassGeneralizationSets__DiagnosticChain_Map();

	/**
	 * Returns the meta object for class '{@link com.ericsson.executablemodeling.xtuml.profile.xtumlprofile.XtConstrainedType <em>Xt Constrained Type</em>}'.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @return the meta object for class '<em>Xt Constrained Type</em>'.
	 * @see com.ericsson.executablemodeling.xtuml.profile.xtumlprofile.XtConstrainedType
	 * @generated
	 */
	EClass getXtConstrainedType();

	/**
	 * Returns the meta object for class '{@link com.ericsson.executablemodeling.xtuml.profile.xtumlprofile.XtOpaqueBehavior <em>Xt Opaque Behavior</em>}'.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @return the meta object for class '<em>Xt Opaque Behavior</em>'.
	 * @see com.ericsson.executablemodeling.xtuml.profile.xtumlprofile.XtOpaqueBehavior
	 * @generated
	 */
	EClass getXtOpaqueBehavior();

	/**
	 * Returns the meta object for the '{@link com.ericsson.executablemodeling.xtuml.profile.xtumlprofile.XtOpaqueBehavior#xtOpaqueBehaviorLanguage(org.eclipse.emf.common.util.DiagnosticChain, java.util.Map) <em>Xt Opaque Behavior Language</em>}' operation.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @return the meta object for the '<em>Xt Opaque Behavior Language</em>' operation.
	 * @see com.ericsson.executablemodeling.xtuml.profile.xtumlprofile.XtOpaqueBehavior#xtOpaqueBehaviorLanguage(org.eclipse.emf.common.util.DiagnosticChain, java.util.Map)
	 * @generated
	 */
	EOperation getXtOpaqueBehavior__XtOpaqueBehaviorLanguage__DiagnosticChain_Map();

	/**
	 * Returns the meta object for class '{@link com.ericsson.executablemodeling.xtuml.profile.xtumlprofile.XtGeneralization <em>Xt Generalization</em>}'.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @return the meta object for class '<em>Xt Generalization</em>'.
	 * @see com.ericsson.executablemodeling.xtuml.profile.xtumlprofile.XtGeneralization
	 * @generated
	 */
	EClass getXtGeneralization();

	/**
	 * Returns the meta object for the '{@link com.ericsson.executablemodeling.xtuml.profile.xtumlprofile.XtGeneralization#xtGeneralizationGeneralizationSet(org.eclipse.emf.common.util.DiagnosticChain, java.util.Map) <em>Xt Generalization Generalization Set</em>}' operation.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @return the meta object for the '<em>Xt Generalization Generalization Set</em>' operation.
	 * @see com.ericsson.executablemodeling.xtuml.profile.xtumlprofile.XtGeneralization#xtGeneralizationGeneralizationSet(org.eclipse.emf.common.util.DiagnosticChain, java.util.Map)
	 * @generated
	 */
	EOperation getXtGeneralization__XtGeneralizationGeneralizationSet__DiagnosticChain_Map();

	/**
	 * Returns the meta object for class '{@link com.ericsson.executablemodeling.xtuml.profile.xtumlprofile.XtGeneralizationSet <em>Xt Generalization Set</em>}'.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @return the meta object for class '<em>Xt Generalization Set</em>'.
	 * @see com.ericsson.executablemodeling.xtuml.profile.xtumlprofile.XtGeneralizationSet
	 * @generated
	 */
	EClass getXtGeneralizationSet();

	/**
	 * Returns the meta object for the '{@link com.ericsson.executablemodeling.xtuml.profile.xtumlprofile.XtGeneralizationSet#xtGeneralizationSet(org.eclipse.emf.common.util.DiagnosticChain, java.util.Map) <em>Xt Generalization Set</em>}' operation.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @return the meta object for the '<em>Xt Generalization Set</em>' operation.
	 * @see com.ericsson.executablemodeling.xtuml.profile.xtumlprofile.XtGeneralizationSet#xtGeneralizationSet(org.eclipse.emf.common.util.DiagnosticChain, java.util.Map)
	 * @generated
	 */
	EOperation getXtGeneralizationSet__XtGeneralizationSet__DiagnosticChain_Map();

	/**
	 * Returns the factory that creates the instances of the model.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @return the factory that creates the instances of the model.
	 * @generated
	 */
	xtUMLProfileFactory getxtUMLProfileFactory();

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
		 * The meta object literal for the '{@link com.ericsson.executablemodeling.xtuml.profile.xtumlprofile.impl.XtConnectorEndImpl <em>Xt Connector End</em>}' class.
		 * <!-- begin-user-doc -->
		 * <!-- end-user-doc -->
		 * @see com.ericsson.executablemodeling.xtuml.profile.xtumlprofile.impl.XtConnectorEndImpl
		 * @see com.ericsson.executablemodeling.xtuml.profile.xtumlprofile.impl.xtUMLProfilePackageImpl#getXtConnectorEnd()
		 * @generated
		 */
		EClass XT_CONNECTOR_END = eINSTANCE.getXtConnectorEnd();

		/**
		 * The meta object literal for the '<em><b>Xt Connector End Role</b></em>' operation.
		 * <!-- begin-user-doc -->
		 * <!-- end-user-doc -->
		 * @generated
		 */
		EOperation XT_CONNECTOR_END___XT_CONNECTOR_END_ROLE__DIAGNOSTICCHAIN_MAP = eINSTANCE.getXtConnectorEnd__XtConnectorEndRole__DiagnosticChain_Map();

		/**
		 * The meta object literal for the '{@link com.ericsson.executablemodeling.xtuml.profile.xtumlprofile.impl.XtPropertyImpl <em>Xt Property</em>}' class.
		 * <!-- begin-user-doc -->
		 * <!-- end-user-doc -->
		 * @see com.ericsson.executablemodeling.xtuml.profile.xtumlprofile.impl.XtPropertyImpl
		 * @see com.ericsson.executablemodeling.xtuml.profile.xtumlprofile.impl.xtUMLProfilePackageImpl#getXtProperty()
		 * @generated
		 */
		EClass XT_PROPERTY = eINSTANCE.getXtProperty();

		/**
		 * The meta object literal for the '<em><b>Derivation</b></em>' reference feature.
		 * <!-- begin-user-doc -->
		 * <!-- end-user-doc -->
		 * @generated
		 */
		EReference XT_PROPERTY__DERIVATION = eINSTANCE.getXtProperty_Derivation();

		/**
		 * The meta object literal for the '<em><b>Xt Property Aggregation</b></em>' operation.
		 * <!-- begin-user-doc -->
		 * <!-- end-user-doc -->
		 * @generated
		 */
		EOperation XT_PROPERTY___XT_PROPERTY_AGGREGATION__DIAGNOSTICCHAIN_MAP = eINSTANCE.getXtProperty__XtPropertyAggregation__DiagnosticChain_Map();

		/**
		 * The meta object literal for the '<em><b>Xt Property Redefinition</b></em>' operation.
		 * <!-- begin-user-doc -->
		 * <!-- end-user-doc -->
		 * @generated
		 */
		EOperation XT_PROPERTY___XT_PROPERTY_REDEFINITION__DIAGNOSTICCHAIN_MAP = eINSTANCE.getXtProperty__XtPropertyRedefinition__DiagnosticChain_Map();

		/**
		 * The meta object literal for the '<em><b>Xt Property Derivation</b></em>' operation.
		 * <!-- begin-user-doc -->
		 * <!-- end-user-doc -->
		 * @generated
		 */
		EOperation XT_PROPERTY___XT_PROPERTY_DERIVATION__DIAGNOSTICCHAIN_MAP = eINSTANCE.getXtProperty__XtPropertyDerivation__DiagnosticChain_Map();

		/**
		 * The meta object literal for the '{@link com.ericsson.executablemodeling.xtuml.profile.xtumlprofile.impl.XtComponentImpl <em>Xt Component</em>}' class.
		 * <!-- begin-user-doc -->
		 * <!-- end-user-doc -->
		 * @see com.ericsson.executablemodeling.xtuml.profile.xtumlprofile.impl.XtComponentImpl
		 * @see com.ericsson.executablemodeling.xtuml.profile.xtumlprofile.impl.xtUMLProfilePackageImpl#getXtComponent()
		 * @generated
		 */
		EClass XT_COMPONENT = eINSTANCE.getXtComponent();

		/**
		 * The meta object literal for the '<em><b>Base Component</b></em>' reference feature.
		 * <!-- begin-user-doc -->
		 * <!-- end-user-doc -->
		 * @generated
		 */
		EReference XT_COMPONENT__BASE_COMPONENT = eINSTANCE.getXtComponent_Base_Component();

		/**
		 * The meta object literal for the '<em><b>Xt Component Attributes</b></em>' operation.
		 * <!-- begin-user-doc -->
		 * <!-- end-user-doc -->
		 * @generated
		 */
		EOperation XT_COMPONENT___XT_COMPONENT_ATTRIBUTES__DIAGNOSTICCHAIN_MAP = eINSTANCE.getXtComponent__XtComponentAttributes__DiagnosticChain_Map();

		/**
		 * The meta object literal for the '<em><b>Xt Component Behavioral Features</b></em>' operation.
		 * <!-- begin-user-doc -->
		 * <!-- end-user-doc -->
		 * @generated
		 */
		EOperation XT_COMPONENT___XT_COMPONENT_BEHAVIORAL_FEATURES__DIAGNOSTICCHAIN_MAP = eINSTANCE.getXtComponent__XtComponentBehavioralFeatures__DiagnosticChain_Map();

		/**
		 * The meta object literal for the '<em><b>Xt Component Owned Behaviors</b></em>' operation.
		 * <!-- begin-user-doc -->
		 * <!-- end-user-doc -->
		 * @generated
		 */
		EOperation XT_COMPONENT___XT_COMPONENT_OWNED_BEHAVIORS__DIAGNOSTICCHAIN_MAP = eINSTANCE.getXtComponent__XtComponentOwnedBehaviors__DiagnosticChain_Map();

		/**
		 * The meta object literal for the '<em><b>Xt Component Nested Classifiers</b></em>' operation.
		 * <!-- begin-user-doc -->
		 * <!-- end-user-doc -->
		 * @generated
		 */
		EOperation XT_COMPONENT___XT_COMPONENT_NESTED_CLASSIFIERS__DIAGNOSTICCHAIN_MAP = eINSTANCE.getXtComponent__XtComponentNestedClassifiers__DiagnosticChain_Map();

		/**
		 * The meta object literal for the '<em><b>Xt Component Parts</b></em>' operation.
		 * <!-- begin-user-doc -->
		 * <!-- end-user-doc -->
		 * @generated
		 */
		EOperation XT_COMPONENT___XT_COMPONENT_PARTS__DIAGNOSTICCHAIN_MAP = eINSTANCE.getXtComponent__XtComponentParts__DiagnosticChain_Map();

		/**
		 * The meta object literal for the '<em><b>Xt Component Generalization</b></em>' operation.
		 * <!-- begin-user-doc -->
		 * <!-- end-user-doc -->
		 * @generated
		 */
		EOperation XT_COMPONENT___XT_COMPONENT_GENERALIZATION__DIAGNOSTICCHAIN_MAP = eINSTANCE.getXtComponent__XtComponentGeneralization__DiagnosticChain_Map();

		/**
		 * The meta object literal for the '{@link com.ericsson.executablemodeling.xtuml.profile.xtumlprofile.impl.XtOperationImpl <em>Xt Operation</em>}' class.
		 * <!-- begin-user-doc -->
		 * <!-- end-user-doc -->
		 * @see com.ericsson.executablemodeling.xtuml.profile.xtumlprofile.impl.XtOperationImpl
		 * @see com.ericsson.executablemodeling.xtuml.profile.xtumlprofile.impl.xtUMLProfilePackageImpl#getXtOperation()
		 * @generated
		 */
		EClass XT_OPERATION = eINSTANCE.getXtOperation();

		/**
		 * The meta object literal for the '{@link com.ericsson.executablemodeling.xtuml.profile.xtumlprofile.impl.XtParameterImpl <em>Xt Parameter</em>}' class.
		 * <!-- begin-user-doc -->
		 * <!-- end-user-doc -->
		 * @see com.ericsson.executablemodeling.xtuml.profile.xtumlprofile.impl.XtParameterImpl
		 * @see com.ericsson.executablemodeling.xtuml.profile.xtumlprofile.impl.xtUMLProfilePackageImpl#getXtParameter()
		 * @generated
		 */
		EClass XT_PARAMETER = eINSTANCE.getXtParameter();

		/**
		 * The meta object literal for the '{@link com.ericsson.executablemodeling.xtuml.profile.xtumlprofile.impl.XtReceptionImpl <em>Xt Reception</em>}' class.
		 * <!-- begin-user-doc -->
		 * <!-- end-user-doc -->
		 * @see com.ericsson.executablemodeling.xtuml.profile.xtumlprofile.impl.XtReceptionImpl
		 * @see com.ericsson.executablemodeling.xtuml.profile.xtumlprofile.impl.xtUMLProfilePackageImpl#getXtReception()
		 * @generated
		 */
		EClass XT_RECEPTION = eINSTANCE.getXtReception();

		/**
		 * The meta object literal for the '{@link com.ericsson.executablemodeling.xtuml.profile.xtumlprofile.impl.XtPartImpl <em>Xt Part</em>}' class.
		 * <!-- begin-user-doc -->
		 * <!-- end-user-doc -->
		 * @see com.ericsson.executablemodeling.xtuml.profile.xtumlprofile.impl.XtPartImpl
		 * @see com.ericsson.executablemodeling.xtuml.profile.xtumlprofile.impl.xtUMLProfilePackageImpl#getXtPart()
		 * @generated
		 */
		EClass XT_PART = eINSTANCE.getXtPart();

		/**
		 * The meta object literal for the '<em><b>Xt Part Type</b></em>' operation.
		 * <!-- begin-user-doc -->
		 * <!-- end-user-doc -->
		 * @generated
		 */
		EOperation XT_PART___XT_PART_TYPE__DIAGNOSTICCHAIN_MAP = eINSTANCE.getXtPart__XtPartType__DiagnosticChain_Map();

		/**
		 * The meta object literal for the '<em><b>Xt Part Composition</b></em>' operation.
		 * <!-- begin-user-doc -->
		 * <!-- end-user-doc -->
		 * @generated
		 */
		EOperation XT_PART___XT_PART_COMPOSITION__DIAGNOSTICCHAIN_MAP = eINSTANCE.getXtPart__XtPartComposition__DiagnosticChain_Map();

		/**
		 * The meta object literal for the '<em><b>Xt Part Visibility</b></em>' operation.
		 * <!-- begin-user-doc -->
		 * <!-- end-user-doc -->
		 * @generated
		 */
		EOperation XT_PART___XT_PART_VISIBILITY__DIAGNOSTICCHAIN_MAP = eINSTANCE.getXtPart__XtPartVisibility__DiagnosticChain_Map();

		/**
		 * The meta object literal for the '{@link com.ericsson.executablemodeling.xtuml.profile.xtumlprofile.impl.XtPortImpl <em>Xt Port</em>}' class.
		 * <!-- begin-user-doc -->
		 * <!-- end-user-doc -->
		 * @see com.ericsson.executablemodeling.xtuml.profile.xtumlprofile.impl.XtPortImpl
		 * @see com.ericsson.executablemodeling.xtuml.profile.xtumlprofile.impl.xtUMLProfilePackageImpl#getXtPort()
		 * @generated
		 */
		EClass XT_PORT = eINSTANCE.getXtPort();

		/**
		 * The meta object literal for the '<em><b>Xt Port Visibility</b></em>' operation.
		 * <!-- begin-user-doc -->
		 * <!-- end-user-doc -->
		 * @generated
		 */
		EOperation XT_PORT___XT_PORT_VISIBILITY__DIAGNOSTICCHAIN_MAP = eINSTANCE.getXtPort__XtPortVisibility__DiagnosticChain_Map();

		/**
		 * The meta object literal for the '<em><b>Xt Connector Visibility</b></em>' operation.
		 * <!-- begin-user-doc -->
		 * <!-- end-user-doc -->
		 * @generated
		 */
		EOperation XT_PORT___XT_CONNECTOR_VISIBILITY__DIAGNOSTICCHAIN_MAP = eINSTANCE.getXtPort__XtConnectorVisibility__DiagnosticChain_Map();

		/**
		 * The meta object literal for the '<em><b>Xt Port Behavior Port</b></em>' operation.
		 * <!-- begin-user-doc -->
		 * <!-- end-user-doc -->
		 * @generated
		 */
		EOperation XT_PORT___XT_PORT_BEHAVIOR_PORT__DIAGNOSTICCHAIN_MAP = eINSTANCE.getXtPort__XtPortBehaviorPort__DiagnosticChain_Map();

		/**
		 * The meta object literal for the '{@link com.ericsson.executablemodeling.xtuml.profile.xtumlprofile.impl.XtConnectorImpl <em>Xt Connector</em>}' class.
		 * <!-- begin-user-doc -->
		 * <!-- end-user-doc -->
		 * @see com.ericsson.executablemodeling.xtuml.profile.xtumlprofile.impl.XtConnectorImpl
		 * @see com.ericsson.executablemodeling.xtuml.profile.xtumlprofile.impl.xtUMLProfilePackageImpl#getXtConnector()
		 * @generated
		 */
		EClass XT_CONNECTOR = eINSTANCE.getXtConnector();

		/**
		 * The meta object literal for the '<em><b>Xt Connector Connector Ends</b></em>' operation.
		 * <!-- begin-user-doc -->
		 * <!-- end-user-doc -->
		 * @generated
		 */
		EOperation XT_CONNECTOR___XT_CONNECTOR_CONNECTOR_ENDS__DIAGNOSTICCHAIN_MAP = eINSTANCE.getXtConnector__XtConnectorConnectorEnds__DiagnosticChain_Map();

		/**
		 * The meta object literal for the '{@link com.ericsson.executablemodeling.xtuml.profile.xtumlprofile.impl.XtProtocolContainerImpl <em>Xt Protocol Container</em>}' class.
		 * <!-- begin-user-doc -->
		 * <!-- end-user-doc -->
		 * @see com.ericsson.executablemodeling.xtuml.profile.xtumlprofile.impl.XtProtocolContainerImpl
		 * @see com.ericsson.executablemodeling.xtuml.profile.xtumlprofile.impl.xtUMLProfilePackageImpl#getXtProtocolContainer()
		 * @generated
		 */
		EClass XT_PROTOCOL_CONTAINER = eINSTANCE.getXtProtocolContainer();

		/**
		 * The meta object literal for the '{@link com.ericsson.executablemodeling.xtuml.profile.xtumlprofile.impl.XtProtocolImpl <em>Xt Protocol</em>}' class.
		 * <!-- begin-user-doc -->
		 * <!-- end-user-doc -->
		 * @see com.ericsson.executablemodeling.xtuml.profile.xtumlprofile.impl.XtProtocolImpl
		 * @see com.ericsson.executablemodeling.xtuml.profile.xtumlprofile.impl.xtUMLProfilePackageImpl#getXtProtocol()
		 * @generated
		 */
		EClass XT_PROTOCOL = eINSTANCE.getXtProtocol();

		/**
		 * The meta object literal for the '<em><b>Base Class</b></em>' reference feature.
		 * <!-- begin-user-doc -->
		 * <!-- end-user-doc -->
		 * @generated
		 */
		EReference XT_PROTOCOL__BASE_CLASS = eINSTANCE.getXtProtocol_Base_Class();

		/**
		 * The meta object literal for the '<em><b>Xt Protocol Nested Classifiers</b></em>' operation.
		 * <!-- begin-user-doc -->
		 * <!-- end-user-doc -->
		 * @generated
		 */
		EOperation XT_PROTOCOL___XT_PROTOCOL_NESTED_CLASSIFIERS__DIAGNOSTICCHAIN_MAP = eINSTANCE.getXtProtocol__XtProtocolNestedClassifiers__DiagnosticChain_Map();

		/**
		 * The meta object literal for the '<em><b>Xt Protocol Behaviors</b></em>' operation.
		 * <!-- begin-user-doc -->
		 * <!-- end-user-doc -->
		 * @generated
		 */
		EOperation XT_PROTOCOL___XT_PROTOCOL_BEHAVIORS__DIAGNOSTICCHAIN_MAP = eINSTANCE.getXtProtocol__XtProtocolBehaviors__DiagnosticChain_Map();

		/**
		 * The meta object literal for the '{@link com.ericsson.executablemodeling.xtuml.profile.xtumlprofile.impl.XtMessageSetImpl <em>Xt Message Set</em>}' class.
		 * <!-- begin-user-doc -->
		 * <!-- end-user-doc -->
		 * @see com.ericsson.executablemodeling.xtuml.profile.xtumlprofile.impl.XtMessageSetImpl
		 * @see com.ericsson.executablemodeling.xtuml.profile.xtumlprofile.impl.xtUMLProfilePackageImpl#getXtMessageSet()
		 * @generated
		 */
		EClass XT_MESSAGE_SET = eINSTANCE.getXtMessageSet();

		/**
		 * The meta object literal for the '<em><b>Xt Message Set Nested Classifiers</b></em>' operation.
		 * <!-- begin-user-doc -->
		 * <!-- end-user-doc -->
		 * @generated
		 */
		EOperation XT_MESSAGE_SET___XT_MESSAGE_SET_NESTED_CLASSIFIERS__DIAGNOSTICCHAIN_MAP = eINSTANCE.getXtMessageSet__XtMessageSetNestedClassifiers__DiagnosticChain_Map();

		/**
		 * The meta object literal for the '<em><b>Xt Message Set Attributes</b></em>' operation.
		 * <!-- begin-user-doc -->
		 * <!-- end-user-doc -->
		 * @generated
		 */
		EOperation XT_MESSAGE_SET___XT_MESSAGE_SET_ATTRIBUTES__DIAGNOSTICCHAIN_MAP = eINSTANCE.getXtMessageSet__XtMessageSetAttributes__DiagnosticChain_Map();

		/**
		 * The meta object literal for the '{@link com.ericsson.executablemodeling.xtuml.profile.xtumlprofile.impl.XtSignalImpl <em>Xt Signal</em>}' class.
		 * <!-- begin-user-doc -->
		 * <!-- end-user-doc -->
		 * @see com.ericsson.executablemodeling.xtuml.profile.xtumlprofile.impl.XtSignalImpl
		 * @see com.ericsson.executablemodeling.xtuml.profile.xtumlprofile.impl.xtUMLProfilePackageImpl#getXtSignal()
		 * @generated
		 */
		EClass XT_SIGNAL = eINSTANCE.getXtSignal();

		/**
		 * The meta object literal for the '{@link com.ericsson.executablemodeling.xtuml.profile.xtumlprofile.impl.XtDataTypeImpl <em>Xt Data Type</em>}' class.
		 * <!-- begin-user-doc -->
		 * <!-- end-user-doc -->
		 * @see com.ericsson.executablemodeling.xtuml.profile.xtumlprofile.impl.XtDataTypeImpl
		 * @see com.ericsson.executablemodeling.xtuml.profile.xtumlprofile.impl.xtUMLProfilePackageImpl#getXtDataType()
		 * @generated
		 */
		EClass XT_DATA_TYPE = eINSTANCE.getXtDataType();

		/**
		 * The meta object literal for the '{@link com.ericsson.executablemodeling.xtuml.profile.xtumlprofile.impl.XtEnumerationImpl <em>Xt Enumeration</em>}' class.
		 * <!-- begin-user-doc -->
		 * <!-- end-user-doc -->
		 * @see com.ericsson.executablemodeling.xtuml.profile.xtumlprofile.impl.XtEnumerationImpl
		 * @see com.ericsson.executablemodeling.xtuml.profile.xtumlprofile.impl.xtUMLProfilePackageImpl#getXtEnumeration()
		 * @generated
		 */
		EClass XT_ENUMERATION = eINSTANCE.getXtEnumeration();

		/**
		 * The meta object literal for the '{@link com.ericsson.executablemodeling.xtuml.profile.xtumlprofile.impl.XtAssociationImpl <em>Xt Association</em>}' class.
		 * <!-- begin-user-doc -->
		 * <!-- end-user-doc -->
		 * @see com.ericsson.executablemodeling.xtuml.profile.xtumlprofile.impl.XtAssociationImpl
		 * @see com.ericsson.executablemodeling.xtuml.profile.xtumlprofile.impl.xtUMLProfilePackageImpl#getXtAssociation()
		 * @generated
		 */
		EClass XT_ASSOCIATION = eINSTANCE.getXtAssociation();

		/**
		 * The meta object literal for the '<em><b>Xt Association End Ownership</b></em>' operation.
		 * <!-- begin-user-doc -->
		 * <!-- end-user-doc -->
		 * @generated
		 */
		EOperation XT_ASSOCIATION___XT_ASSOCIATION_END_OWNERSHIP__DIAGNOSTICCHAIN_MAP = eINSTANCE.getXtAssociation__XtAssociationEndOwnership__DiagnosticChain_Map();

		/**
		 * The meta object literal for the '<em><b>Xt Association Ends</b></em>' operation.
		 * <!-- begin-user-doc -->
		 * <!-- end-user-doc -->
		 * @generated
		 */
		EOperation XT_ASSOCIATION___XT_ASSOCIATION_ENDS__DIAGNOSTICCHAIN_MAP = eINSTANCE.getXtAssociation__XtAssociationEnds__DiagnosticChain_Map();

		/**
		 * The meta object literal for the '<em><b>Xt Association End Type</b></em>' operation.
		 * <!-- begin-user-doc -->
		 * <!-- end-user-doc -->
		 * @generated
		 */
		EOperation XT_ASSOCIATION___XT_ASSOCIATION_END_TYPE__DIAGNOSTICCHAIN_MAP = eINSTANCE.getXtAssociation__XtAssociationEndType__DiagnosticChain_Map();

		/**
		 * The meta object literal for the '<em><b>Xt Association Generalization</b></em>' operation.
		 * <!-- begin-user-doc -->
		 * <!-- end-user-doc -->
		 * @generated
		 */
		EOperation XT_ASSOCIATION___XT_ASSOCIATION_GENERALIZATION__DIAGNOSTICCHAIN_MAP = eINSTANCE.getXtAssociation__XtAssociationGeneralization__DiagnosticChain_Map();

		/**
		 * The meta object literal for the '{@link com.ericsson.executablemodeling.xtuml.profile.xtumlprofile.impl.XtAssociationClassImpl <em>Xt Association Class</em>}' class.
		 * <!-- begin-user-doc -->
		 * <!-- end-user-doc -->
		 * @see com.ericsson.executablemodeling.xtuml.profile.xtumlprofile.impl.XtAssociationClassImpl
		 * @see com.ericsson.executablemodeling.xtuml.profile.xtumlprofile.impl.xtUMLProfilePackageImpl#getXtAssociationClass()
		 * @generated
		 */
		EClass XT_ASSOCIATION_CLASS = eINSTANCE.getXtAssociationClass();

		/**
		 * The meta object literal for the '{@link com.ericsson.executablemodeling.xtuml.profile.xtumlprofile.impl.XtTriggerImpl <em>Xt Trigger</em>}' class.
		 * <!-- begin-user-doc -->
		 * <!-- end-user-doc -->
		 * @see com.ericsson.executablemodeling.xtuml.profile.xtumlprofile.impl.XtTriggerImpl
		 * @see com.ericsson.executablemodeling.xtuml.profile.xtumlprofile.impl.xtUMLProfilePackageImpl#getXtTrigger()
		 * @generated
		 */
		EClass XT_TRIGGER = eINSTANCE.getXtTrigger();

		/**
		 * The meta object literal for the '<em><b>Xt Trigger Event</b></em>' operation.
		 * <!-- begin-user-doc -->
		 * <!-- end-user-doc -->
		 * @generated
		 */
		EOperation XT_TRIGGER___XT_TRIGGER_EVENT__DIAGNOSTICCHAIN_MAP = eINSTANCE.getXtTrigger__XtTriggerEvent__DiagnosticChain_Map();

		/**
		 * The meta object literal for the '{@link com.ericsson.executablemodeling.xtuml.profile.xtumlprofile.impl.XtStateMachineImpl <em>Xt State Machine</em>}' class.
		 * <!-- begin-user-doc -->
		 * <!-- end-user-doc -->
		 * @see com.ericsson.executablemodeling.xtuml.profile.xtumlprofile.impl.XtStateMachineImpl
		 * @see com.ericsson.executablemodeling.xtuml.profile.xtumlprofile.impl.xtUMLProfilePackageImpl#getXtStateMachine()
		 * @generated
		 */
		EClass XT_STATE_MACHINE = eINSTANCE.getXtStateMachine();

		/**
		 * The meta object literal for the '{@link com.ericsson.executablemodeling.xtuml.profile.xtumlprofile.impl.XtRegionImpl <em>Xt Region</em>}' class.
		 * <!-- begin-user-doc -->
		 * <!-- end-user-doc -->
		 * @see com.ericsson.executablemodeling.xtuml.profile.xtumlprofile.impl.XtRegionImpl
		 * @see com.ericsson.executablemodeling.xtuml.profile.xtumlprofile.impl.xtUMLProfilePackageImpl#getXtRegion()
		 * @generated
		 */
		EClass XT_REGION = eINSTANCE.getXtRegion();

		/**
		 * The meta object literal for the '{@link com.ericsson.executablemodeling.xtuml.profile.xtumlprofile.impl.XtPseudoStateImpl <em>Xt Pseudo State</em>}' class.
		 * <!-- begin-user-doc -->
		 * <!-- end-user-doc -->
		 * @see com.ericsson.executablemodeling.xtuml.profile.xtumlprofile.impl.XtPseudoStateImpl
		 * @see com.ericsson.executablemodeling.xtuml.profile.xtumlprofile.impl.xtUMLProfilePackageImpl#getXtPseudoState()
		 * @generated
		 */
		EClass XT_PSEUDO_STATE = eINSTANCE.getXtPseudoState();

		/**
		 * The meta object literal for the '<em><b>Xt Pseudostate Kind</b></em>' operation.
		 * <!-- begin-user-doc -->
		 * <!-- end-user-doc -->
		 * @generated
		 */
		EOperation XT_PSEUDO_STATE___XT_PSEUDOSTATE_KIND__DIAGNOSTICCHAIN_MAP = eINSTANCE.getXtPseudoState__XtPseudostateKind__DiagnosticChain_Map();

		/**
		 * The meta object literal for the '{@link com.ericsson.executablemodeling.xtuml.profile.xtumlprofile.impl.XtTransitionImpl <em>Xt Transition</em>}' class.
		 * <!-- begin-user-doc -->
		 * <!-- end-user-doc -->
		 * @see com.ericsson.executablemodeling.xtuml.profile.xtumlprofile.impl.XtTransitionImpl
		 * @see com.ericsson.executablemodeling.xtuml.profile.xtumlprofile.impl.xtUMLProfilePackageImpl#getXtTransition()
		 * @generated
		 */
		EClass XT_TRANSITION = eINSTANCE.getXtTransition();

		/**
		 * The meta object literal for the '<em><b>Xt Transition No Guard</b></em>' operation.
		 * <!-- begin-user-doc -->
		 * <!-- end-user-doc -->
		 * @generated
		 */
		EOperation XT_TRANSITION___XT_TRANSITION_NO_GUARD__DIAGNOSTICCHAIN_MAP = eINSTANCE.getXtTransition__XtTransitionNoGuard__DiagnosticChain_Map();

		/**
		 * The meta object literal for the '{@link com.ericsson.executablemodeling.xtuml.profile.xtumlprofile.impl.XtStateImpl <em>Xt State</em>}' class.
		 * <!-- begin-user-doc -->
		 * <!-- end-user-doc -->
		 * @see com.ericsson.executablemodeling.xtuml.profile.xtumlprofile.impl.XtStateImpl
		 * @see com.ericsson.executablemodeling.xtuml.profile.xtumlprofile.impl.xtUMLProfilePackageImpl#getXtState()
		 * @generated
		 */
		EClass XT_STATE = eINSTANCE.getXtState();

		/**
		 * The meta object literal for the '<em><b>XState Not Composite</b></em>' operation.
		 * <!-- begin-user-doc -->
		 * <!-- end-user-doc -->
		 * @generated
		 */
		EOperation XT_STATE___XSTATE_NOT_COMPOSITE__DIAGNOSTICCHAIN_MAP = eINSTANCE.getXtState__XStateNotComposite__DiagnosticChain_Map();

		/**
		 * The meta object literal for the '{@link com.ericsson.executablemodeling.xtuml.profile.xtumlprofile.impl.XtActivityImpl <em>Xt Activity</em>}' class.
		 * <!-- begin-user-doc -->
		 * <!-- end-user-doc -->
		 * @see com.ericsson.executablemodeling.xtuml.profile.xtumlprofile.impl.XtActivityImpl
		 * @see com.ericsson.executablemodeling.xtuml.profile.xtumlprofile.impl.xtUMLProfilePackageImpl#getXtActivity()
		 * @generated
		 */
		EClass XT_ACTIVITY = eINSTANCE.getXtActivity();

		/**
		 * The meta object literal for the '<em><b>Xt Activity Textual Representation</b></em>' operation.
		 * <!-- begin-user-doc -->
		 * <!-- end-user-doc -->
		 * @generated
		 */
		EOperation XT_ACTIVITY___XT_ACTIVITY_TEXTUAL_REPRESENTATION__DIAGNOSTICCHAIN_MAP = eINSTANCE.getXtActivity__XtActivityTextualRepresentation__DiagnosticChain_Map();

		/**
		 * The meta object literal for the '{@link com.ericsson.executablemodeling.xtuml.profile.xtumlprofile.impl.XtConstraintImpl <em>Xt Constraint</em>}' class.
		 * <!-- begin-user-doc -->
		 * <!-- end-user-doc -->
		 * @see com.ericsson.executablemodeling.xtuml.profile.xtumlprofile.impl.XtConstraintImpl
		 * @see com.ericsson.executablemodeling.xtuml.profile.xtumlprofile.impl.xtUMLProfilePackageImpl#getXtConstraint()
		 * @generated
		 */
		EClass XT_CONSTRAINT = eINSTANCE.getXtConstraint();

		/**
		 * The meta object literal for the '{@link com.ericsson.executablemodeling.xtuml.profile.xtumlprofile.impl.XtClassImpl <em>Xt Class</em>}' class.
		 * <!-- begin-user-doc -->
		 * <!-- end-user-doc -->
		 * @see com.ericsson.executablemodeling.xtuml.profile.xtumlprofile.impl.XtClassImpl
		 * @see com.ericsson.executablemodeling.xtuml.profile.xtumlprofile.impl.xtUMLProfilePackageImpl#getXtClass()
		 * @generated
		 */
		EClass XT_CLASS = eINSTANCE.getXtClass();

		/**
		 * The meta object literal for the '<em><b>Xt Class Constructors</b></em>' operation.
		 * <!-- begin-user-doc -->
		 * <!-- end-user-doc -->
		 * @generated
		 */
		EOperation XT_CLASS___XT_CLASS_CONSTRUCTORS__DIAGNOSTICCHAIN_MAP = eINSTANCE.getXtClass__XtClassConstructors__DiagnosticChain_Map();

		/**
		 * The meta object literal for the '<em><b>Xt Class Classifier Behavior</b></em>' operation.
		 * <!-- begin-user-doc -->
		 * <!-- end-user-doc -->
		 * @generated
		 */
		EOperation XT_CLASS___XT_CLASS_CLASSIFIER_BEHAVIOR__DIAGNOSTICCHAIN_MAP = eINSTANCE.getXtClass__XtClassClassifierBehavior__DiagnosticChain_Map();

		/**
		 * The meta object literal for the '<em><b>Xt Class Visibility</b></em>' operation.
		 * <!-- begin-user-doc -->
		 * <!-- end-user-doc -->
		 * @generated
		 */
		EOperation XT_CLASS___XT_CLASS_VISIBILITY__DIAGNOSTICCHAIN_MAP = eINSTANCE.getXtClass__XtClassVisibility__DiagnosticChain_Map();

		/**
		 * The meta object literal for the '<em><b>Xt Class Generalization Sets</b></em>' operation.
		 * <!-- begin-user-doc -->
		 * <!-- end-user-doc -->
		 * @generated
		 */
		EOperation XT_CLASS___XT_CLASS_GENERALIZATION_SETS__DIAGNOSTICCHAIN_MAP = eINSTANCE.getXtClass__XtClassGeneralizationSets__DiagnosticChain_Map();

		/**
		 * The meta object literal for the '{@link com.ericsson.executablemodeling.xtuml.profile.xtumlprofile.impl.XtConstrainedTypeImpl <em>Xt Constrained Type</em>}' class.
		 * <!-- begin-user-doc -->
		 * <!-- end-user-doc -->
		 * @see com.ericsson.executablemodeling.xtuml.profile.xtumlprofile.impl.XtConstrainedTypeImpl
		 * @see com.ericsson.executablemodeling.xtuml.profile.xtumlprofile.impl.xtUMLProfilePackageImpl#getXtConstrainedType()
		 * @generated
		 */
		EClass XT_CONSTRAINED_TYPE = eINSTANCE.getXtConstrainedType();

		/**
		 * The meta object literal for the '{@link com.ericsson.executablemodeling.xtuml.profile.xtumlprofile.impl.XtOpaqueBehaviorImpl <em>Xt Opaque Behavior</em>}' class.
		 * <!-- begin-user-doc -->
		 * <!-- end-user-doc -->
		 * @see com.ericsson.executablemodeling.xtuml.profile.xtumlprofile.impl.XtOpaqueBehaviorImpl
		 * @see com.ericsson.executablemodeling.xtuml.profile.xtumlprofile.impl.xtUMLProfilePackageImpl#getXtOpaqueBehavior()
		 * @generated
		 */
		EClass XT_OPAQUE_BEHAVIOR = eINSTANCE.getXtOpaqueBehavior();

		/**
		 * The meta object literal for the '<em><b>Xt Opaque Behavior Language</b></em>' operation.
		 * <!-- begin-user-doc -->
		 * <!-- end-user-doc -->
		 * @generated
		 */
		EOperation XT_OPAQUE_BEHAVIOR___XT_OPAQUE_BEHAVIOR_LANGUAGE__DIAGNOSTICCHAIN_MAP = eINSTANCE.getXtOpaqueBehavior__XtOpaqueBehaviorLanguage__DiagnosticChain_Map();

		/**
		 * The meta object literal for the '{@link com.ericsson.executablemodeling.xtuml.profile.xtumlprofile.impl.XtGeneralizationImpl <em>Xt Generalization</em>}' class.
		 * <!-- begin-user-doc -->
		 * <!-- end-user-doc -->
		 * @see com.ericsson.executablemodeling.xtuml.profile.xtumlprofile.impl.XtGeneralizationImpl
		 * @see com.ericsson.executablemodeling.xtuml.profile.xtumlprofile.impl.xtUMLProfilePackageImpl#getXtGeneralization()
		 * @generated
		 */
		EClass XT_GENERALIZATION = eINSTANCE.getXtGeneralization();

		/**
		 * The meta object literal for the '<em><b>Xt Generalization Generalization Set</b></em>' operation.
		 * <!-- begin-user-doc -->
		 * <!-- end-user-doc -->
		 * @generated
		 */
		EOperation XT_GENERALIZATION___XT_GENERALIZATION_GENERALIZATION_SET__DIAGNOSTICCHAIN_MAP = eINSTANCE.getXtGeneralization__XtGeneralizationGeneralizationSet__DiagnosticChain_Map();

		/**
		 * The meta object literal for the '{@link com.ericsson.executablemodeling.xtuml.profile.xtumlprofile.impl.XtGeneralizationSetImpl <em>Xt Generalization Set</em>}' class.
		 * <!-- begin-user-doc -->
		 * <!-- end-user-doc -->
		 * @see com.ericsson.executablemodeling.xtuml.profile.xtumlprofile.impl.XtGeneralizationSetImpl
		 * @see com.ericsson.executablemodeling.xtuml.profile.xtumlprofile.impl.xtUMLProfilePackageImpl#getXtGeneralizationSet()
		 * @generated
		 */
		EClass XT_GENERALIZATION_SET = eINSTANCE.getXtGeneralizationSet();

		/**
		 * The meta object literal for the '<em><b>Xt Generalization Set</b></em>' operation.
		 * <!-- begin-user-doc -->
		 * <!-- end-user-doc -->
		 * @generated
		 */
		EOperation XT_GENERALIZATION_SET___XT_GENERALIZATION_SET__DIAGNOSTICCHAIN_MAP = eINSTANCE.getXtGeneralizationSet__XtGeneralizationSet__DiagnosticChain_Map();

	}

} //xtUMLProfilePackage
