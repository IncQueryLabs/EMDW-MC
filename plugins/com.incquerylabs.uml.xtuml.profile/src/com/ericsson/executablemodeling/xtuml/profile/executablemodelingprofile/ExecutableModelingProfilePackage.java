/*******************************************************************************
 * Copyright (c) 2015-2016 IncQuery Labs Ltd. and Ericsson AB
 * All rights reserved. This program and the accompanying materials
 * are made available under the terms of the Eclipse Public License v1.0
 * which accompanies this distribution, and is available at
 * http://www.eclipse.org/legal/epl-v10.html
 *
 * Contributors:
 *     Akos Horvath, Abel Hegedus, Zoltan Ujhelyi, Adam Balogh - initial API and implementation
 *******************************************************************************/
/**
 */
package com.ericsson.executablemodeling.xtuml.profile.executablemodelingprofile;

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
 * @see com.ericsson.executablemodeling.xtuml.profile.executablemodelingprofile.ExecutableModelingProfileFactory
 * @model kind="package"
 *        annotation="http://www.eclipse.org/uml2/2.0.0/UML originalName='ExecutableModeling'"
 * @generated
 */
public interface ExecutableModelingProfilePackage extends EPackage {
	/**
	 * The package name.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 */
	String eNAME = "executablemodelingprofile";

	/**
	 * The package namespace URI.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 */
	String eNS_URI = "http://Papyrus/ExecutableModelingProfile";

	/**
	 * The package namespace name.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 */
	String eNS_PREFIX = "ExecutableModelingProfile";

	/**
	 * The singleton instance of the package.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 */
	ExecutableModelingProfilePackage eINSTANCE = com.ericsson.executablemodeling.xtuml.profile.executablemodelingprofile.impl.ExecutableModelingProfilePackageImpl.init();

	/**
	 * The meta object id for the '{@link com.ericsson.executablemodeling.xtuml.profile.executablemodelingprofile.impl.XNamedElementImpl <em>XNamed Element</em>}' class.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @see com.ericsson.executablemodeling.xtuml.profile.executablemodelingprofile.impl.XNamedElementImpl
	 * @see com.ericsson.executablemodeling.xtuml.profile.executablemodelingprofile.impl.ExecutableModelingProfilePackageImpl#getXNamedElement()
	 * @generated
	 */
	int XNAMED_ELEMENT = 2;

	/**
	 * The feature id for the '<em><b>Base Named Element</b></em>' reference.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 * @ordered
	 */
	int XNAMED_ELEMENT__BASE_NAMED_ELEMENT = 0;

	/**
	 * The number of structural features of the '<em>XNamed Element</em>' class.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 * @ordered
	 */
	int XNAMED_ELEMENT_FEATURE_COUNT = 1;

	/**
	 * The operation id for the '<em>XNamed Element Name</em>' operation.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 * @ordered
	 */
	int XNAMED_ELEMENT___XNAMED_ELEMENT_NAME__DIAGNOSTICCHAIN_MAP = 0;

	/**
	 * The number of operations of the '<em>XNamed Element</em>' class.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 * @ordered
	 */
	int XNAMED_ELEMENT_OPERATION_COUNT = 1;

	/**
	 * The meta object id for the '{@link com.ericsson.executablemodeling.xtuml.profile.executablemodelingprofile.impl.XFeatureImpl <em>XFeature</em>}' class.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @see com.ericsson.executablemodeling.xtuml.profile.executablemodelingprofile.impl.XFeatureImpl
	 * @see com.ericsson.executablemodeling.xtuml.profile.executablemodelingprofile.impl.ExecutableModelingProfilePackageImpl#getXFeature()
	 * @generated
	 */
	int XFEATURE = 3;

	/**
	 * The feature id for the '<em><b>Base Named Element</b></em>' reference.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 * @ordered
	 */
	int XFEATURE__BASE_NAMED_ELEMENT = XNAMED_ELEMENT__BASE_NAMED_ELEMENT;

	/**
	 * The feature id for the '<em><b>Base Feature</b></em>' reference.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 * @ordered
	 */
	int XFEATURE__BASE_FEATURE = XNAMED_ELEMENT_FEATURE_COUNT + 0;

	/**
	 * The number of structural features of the '<em>XFeature</em>' class.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 * @ordered
	 */
	int XFEATURE_FEATURE_COUNT = XNAMED_ELEMENT_FEATURE_COUNT + 1;

	/**
	 * The operation id for the '<em>XNamed Element Name</em>' operation.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 * @ordered
	 */
	int XFEATURE___XNAMED_ELEMENT_NAME__DIAGNOSTICCHAIN_MAP = XNAMED_ELEMENT___XNAMED_ELEMENT_NAME__DIAGNOSTICCHAIN_MAP;

	/**
	 * The operation id for the '<em>XFeature Classifier</em>' operation.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 * @ordered
	 */
	int XFEATURE___XFEATURE_CLASSIFIER__DIAGNOSTICCHAIN_MAP = XNAMED_ELEMENT_OPERATION_COUNT + 0;

	/**
	 * The number of operations of the '<em>XFeature</em>' class.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 * @ordered
	 */
	int XFEATURE_OPERATION_COUNT = XNAMED_ELEMENT_OPERATION_COUNT + 1;

	/**
	 * The meta object id for the '{@link com.ericsson.executablemodeling.xtuml.profile.executablemodelingprofile.impl.XOperationImpl <em>XOperation</em>}' class.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @see com.ericsson.executablemodeling.xtuml.profile.executablemodelingprofile.impl.XOperationImpl
	 * @see com.ericsson.executablemodeling.xtuml.profile.executablemodelingprofile.impl.ExecutableModelingProfilePackageImpl#getXOperation()
	 * @generated
	 */
	int XOPERATION = 0;

	/**
	 * The feature id for the '<em><b>Base Named Element</b></em>' reference.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 * @ordered
	 */
	int XOPERATION__BASE_NAMED_ELEMENT = XFEATURE__BASE_NAMED_ELEMENT;

	/**
	 * The feature id for the '<em><b>Base Feature</b></em>' reference.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 * @ordered
	 */
	int XOPERATION__BASE_FEATURE = XFEATURE__BASE_FEATURE;

	/**
	 * The feature id for the '<em><b>Base Namespace</b></em>' reference.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 * @ordered
	 */
	int XOPERATION__BASE_NAMESPACE = XFEATURE_FEATURE_COUNT + 0;

	/**
	 * The feature id for the '<em><b>Base Operation</b></em>' reference.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 * @ordered
	 */
	int XOPERATION__BASE_OPERATION = XFEATURE_FEATURE_COUNT + 1;

	/**
	 * The number of structural features of the '<em>XOperation</em>' class.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 * @ordered
	 */
	int XOPERATION_FEATURE_COUNT = XFEATURE_FEATURE_COUNT + 2;

	/**
	 * The operation id for the '<em>XNamed Element Name</em>' operation.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 * @ordered
	 */
	int XOPERATION___XNAMED_ELEMENT_NAME__DIAGNOSTICCHAIN_MAP = XFEATURE___XNAMED_ELEMENT_NAME__DIAGNOSTICCHAIN_MAP;

	/**
	 * The operation id for the '<em>XFeature Classifier</em>' operation.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 * @ordered
	 */
	int XOPERATION___XFEATURE_CLASSIFIER__DIAGNOSTICCHAIN_MAP = XFEATURE___XFEATURE_CLASSIFIER__DIAGNOSTICCHAIN_MAP;

	/**
	 * The operation id for the '<em>XOperation Parameters</em>' operation.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 * @ordered
	 */
	int XOPERATION___XOPERATION_PARAMETERS__DIAGNOSTICCHAIN_MAP = XFEATURE_OPERATION_COUNT + 0;

	/**
	 * The operation id for the '<em>XOperation One Method</em>' operation.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 * @ordered
	 */
	int XOPERATION___XOPERATION_ONE_METHOD__DIAGNOSTICCHAIN_MAP = XFEATURE_OPERATION_COUNT + 1;

	/**
	 * The operation id for the '<em>XOperation Imports</em>' operation.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 * @ordered
	 */
	int XOPERATION___XOPERATION_IMPORTS__DIAGNOSTICCHAIN_MAP = XFEATURE_OPERATION_COUNT + 2;

	/**
	 * The operation id for the '<em>XOperation Owned Rules</em>' operation.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 * @ordered
	 */
	int XOPERATION___XOPERATION_OWNED_RULES__DIAGNOSTICCHAIN_MAP = XFEATURE_OPERATION_COUNT + 3;

	/**
	 * The operation id for the '<em>XOperation Methods</em>' operation.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 * @ordered
	 */
	int XOPERATION___XOPERATION_METHODS__DIAGNOSTICCHAIN_MAP = XFEATURE_OPERATION_COUNT + 4;

	/**
	 * The operation id for the '<em>XOperation Constraints</em>' operation.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 * @ordered
	 */
	int XOPERATION___XOPERATION_CONSTRAINTS__DIAGNOSTICCHAIN_MAP = XFEATURE_OPERATION_COUNT + 5;

	/**
	 * The number of operations of the '<em>XOperation</em>' class.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 * @ordered
	 */
	int XOPERATION_OPERATION_COUNT = XFEATURE_OPERATION_COUNT + 6;

	/**
	 * The meta object id for the '{@link com.ericsson.executablemodeling.xtuml.profile.executablemodelingprofile.impl.XNamespaceImpl <em>XNamespace</em>}' class.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @see com.ericsson.executablemodeling.xtuml.profile.executablemodelingprofile.impl.XNamespaceImpl
	 * @see com.ericsson.executablemodeling.xtuml.profile.executablemodelingprofile.impl.ExecutableModelingProfilePackageImpl#getXNamespace()
	 * @generated
	 */
	int XNAMESPACE = 1;

	/**
	 * The feature id for the '<em><b>Base Named Element</b></em>' reference.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 * @ordered
	 */
	int XNAMESPACE__BASE_NAMED_ELEMENT = XNAMED_ELEMENT__BASE_NAMED_ELEMENT;

	/**
	 * The feature id for the '<em><b>Base Namespace</b></em>' reference.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 * @ordered
	 */
	int XNAMESPACE__BASE_NAMESPACE = XNAMED_ELEMENT_FEATURE_COUNT + 0;

	/**
	 * The number of structural features of the '<em>XNamespace</em>' class.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 * @ordered
	 */
	int XNAMESPACE_FEATURE_COUNT = XNAMED_ELEMENT_FEATURE_COUNT + 1;

	/**
	 * The operation id for the '<em>XNamed Element Name</em>' operation.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 * @ordered
	 */
	int XNAMESPACE___XNAMED_ELEMENT_NAME__DIAGNOSTICCHAIN_MAP = XNAMED_ELEMENT___XNAMED_ELEMENT_NAME__DIAGNOSTICCHAIN_MAP;

	/**
	 * The number of operations of the '<em>XNamespace</em>' class.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 * @ordered
	 */
	int XNAMESPACE_OPERATION_COUNT = XNAMED_ELEMENT_OPERATION_COUNT + 0;

	/**
	 * The meta object id for the '{@link com.ericsson.executablemodeling.xtuml.profile.executablemodelingprofile.impl.XAssociationImpl <em>XAssociation</em>}' class.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @see com.ericsson.executablemodeling.xtuml.profile.executablemodelingprofile.impl.XAssociationImpl
	 * @see com.ericsson.executablemodeling.xtuml.profile.executablemodelingprofile.impl.ExecutableModelingProfilePackageImpl#getXAssociation()
	 * @generated
	 */
	int XASSOCIATION = 4;

	/**
	 * The feature id for the '<em><b>Base Association</b></em>' reference.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 * @ordered
	 */
	int XASSOCIATION__BASE_ASSOCIATION = 0;

	/**
	 * The number of structural features of the '<em>XAssociation</em>' class.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 * @ordered
	 */
	int XASSOCIATION_FEATURE_COUNT = 1;

	/**
	 * The operation id for the '<em>XAssociation Is Binary</em>' operation.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 * @ordered
	 */
	int XASSOCIATION___XASSOCIATION_IS_BINARY__DIAGNOSTICCHAIN_MAP = 0;

	/**
	 * The number of operations of the '<em>XAssociation</em>' class.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 * @ordered
	 */
	int XASSOCIATION_OPERATION_COUNT = 1;

	/**
	 * The meta object id for the '{@link com.ericsson.executablemodeling.xtuml.profile.executablemodelingprofile.impl.XClassifierImpl <em>XClassifier</em>}' class.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @see com.ericsson.executablemodeling.xtuml.profile.executablemodelingprofile.impl.XClassifierImpl
	 * @see com.ericsson.executablemodeling.xtuml.profile.executablemodelingprofile.impl.ExecutableModelingProfilePackageImpl#getXClassifier()
	 * @generated
	 */
	int XCLASSIFIER = 5;

	/**
	 * The feature id for the '<em><b>Base Named Element</b></em>' reference.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 * @ordered
	 */
	int XCLASSIFIER__BASE_NAMED_ELEMENT = XNAMESPACE__BASE_NAMED_ELEMENT;

	/**
	 * The feature id for the '<em><b>Base Namespace</b></em>' reference.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 * @ordered
	 */
	int XCLASSIFIER__BASE_NAMESPACE = XNAMESPACE__BASE_NAMESPACE;

	/**
	 * The feature id for the '<em><b>Base Classifier</b></em>' reference.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 * @ordered
	 */
	int XCLASSIFIER__BASE_CLASSIFIER = XNAMESPACE_FEATURE_COUNT + 0;

	/**
	 * The number of structural features of the '<em>XClassifier</em>' class.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 * @ordered
	 */
	int XCLASSIFIER_FEATURE_COUNT = XNAMESPACE_FEATURE_COUNT + 1;

	/**
	 * The operation id for the '<em>XNamed Element Name</em>' operation.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 * @ordered
	 */
	int XCLASSIFIER___XNAMED_ELEMENT_NAME__DIAGNOSTICCHAIN_MAP = XNAMESPACE___XNAMED_ELEMENT_NAME__DIAGNOSTICCHAIN_MAP;

	/**
	 * The operation id for the '<em>XClassifier Features</em>' operation.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 * @ordered
	 */
	int XCLASSIFIER___XCLASSIFIER_FEATURES__DIAGNOSTICCHAIN_MAP = XNAMESPACE_OPERATION_COUNT + 0;

	/**
	 * The operation id for the '<em>XClassifier Nested Classifiers</em>' operation.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 * @ordered
	 */
	int XCLASSIFIER___XCLASSIFIER_NESTED_CLASSIFIERS__DIAGNOSTICCHAIN_MAP = XNAMESPACE_OPERATION_COUNT + 1;

	/**
	 * The operation id for the '<em>XClassifier Generals</em>' operation.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 * @ordered
	 */
	int XCLASSIFIER___XCLASSIFIER_GENERALS__DIAGNOSTICCHAIN_MAP = XNAMESPACE_OPERATION_COUNT + 2;

	/**
	 * The operation id for the '<em>XClassifier Constraints</em>' operation.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 * @ordered
	 */
	int XCLASSIFIER___XCLASSIFIER_CONSTRAINTS__DIAGNOSTICCHAIN_MAP = XNAMESPACE_OPERATION_COUNT + 3;

	/**
	 * The number of operations of the '<em>XClassifier</em>' class.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 * @ordered
	 */
	int XCLASSIFIER_OPERATION_COUNT = XNAMESPACE_OPERATION_COUNT + 4;

	/**
	 * The meta object id for the '{@link com.ericsson.executablemodeling.xtuml.profile.executablemodelingprofile.impl.XBehaviorImpl <em>XBehavior</em>}' class.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @see com.ericsson.executablemodeling.xtuml.profile.executablemodelingprofile.impl.XBehaviorImpl
	 * @see com.ericsson.executablemodeling.xtuml.profile.executablemodelingprofile.impl.ExecutableModelingProfilePackageImpl#getXBehavior()
	 * @generated
	 */
	int XBEHAVIOR = 6;

	/**
	 * The feature id for the '<em><b>Base Named Element</b></em>' reference.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 * @ordered
	 */
	int XBEHAVIOR__BASE_NAMED_ELEMENT = XNAMESPACE__BASE_NAMED_ELEMENT;

	/**
	 * The feature id for the '<em><b>Base Namespace</b></em>' reference.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 * @ordered
	 */
	int XBEHAVIOR__BASE_NAMESPACE = XNAMESPACE__BASE_NAMESPACE;

	/**
	 * The feature id for the '<em><b>Base Behavior</b></em>' reference.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 * @ordered
	 */
	int XBEHAVIOR__BASE_BEHAVIOR = XNAMESPACE_FEATURE_COUNT + 0;

	/**
	 * The number of structural features of the '<em>XBehavior</em>' class.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 * @ordered
	 */
	int XBEHAVIOR_FEATURE_COUNT = XNAMESPACE_FEATURE_COUNT + 1;

	/**
	 * The operation id for the '<em>XNamed Element Name</em>' operation.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 * @ordered
	 */
	int XBEHAVIOR___XNAMED_ELEMENT_NAME__DIAGNOSTICCHAIN_MAP = XNAMESPACE___XNAMED_ELEMENT_NAME__DIAGNOSTICCHAIN_MAP;

	/**
	 * The operation id for the '<em>XBehavior No Parameter Sets</em>' operation.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 * @ordered
	 */
	int XBEHAVIOR___XBEHAVIOR_NO_PARAMETER_SETS__DIAGNOSTICCHAIN_MAP = XNAMESPACE_OPERATION_COUNT + 0;

	/**
	 * The number of operations of the '<em>XBehavior</em>' class.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 * @ordered
	 */
	int XBEHAVIOR_OPERATION_COUNT = XNAMESPACE_OPERATION_COUNT + 1;

	/**
	 * The meta object id for the '{@link com.ericsson.executablemodeling.xtuml.profile.executablemodelingprofile.impl.XEncapsulatedClassifierImpl <em>XEncapsulated Classifier</em>}' class.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @see com.ericsson.executablemodeling.xtuml.profile.executablemodelingprofile.impl.XEncapsulatedClassifierImpl
	 * @see com.ericsson.executablemodeling.xtuml.profile.executablemodelingprofile.impl.ExecutableModelingProfilePackageImpl#getXEncapsulatedClassifier()
	 * @generated
	 */
	int XENCAPSULATED_CLASSIFIER = 7;

	/**
	 * The feature id for the '<em><b>Base Named Element</b></em>' reference.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 * @ordered
	 */
	int XENCAPSULATED_CLASSIFIER__BASE_NAMED_ELEMENT = XCLASSIFIER__BASE_NAMED_ELEMENT;

	/**
	 * The feature id for the '<em><b>Base Namespace</b></em>' reference.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 * @ordered
	 */
	int XENCAPSULATED_CLASSIFIER__BASE_NAMESPACE = XCLASSIFIER__BASE_NAMESPACE;

	/**
	 * The feature id for the '<em><b>Base Classifier</b></em>' reference.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 * @ordered
	 */
	int XENCAPSULATED_CLASSIFIER__BASE_CLASSIFIER = XCLASSIFIER__BASE_CLASSIFIER;

	/**
	 * The feature id for the '<em><b>Base Encapsulated Classifier</b></em>' reference.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 * @ordered
	 */
	int XENCAPSULATED_CLASSIFIER__BASE_ENCAPSULATED_CLASSIFIER = XCLASSIFIER_FEATURE_COUNT + 0;

	/**
	 * The feature id for the '<em><b>Is External</b></em>' attribute.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 * @ordered
	 */
	int XENCAPSULATED_CLASSIFIER__IS_EXTERNAL = XCLASSIFIER_FEATURE_COUNT + 1;

	/**
	 * The number of structural features of the '<em>XEncapsulated Classifier</em>' class.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 * @ordered
	 */
	int XENCAPSULATED_CLASSIFIER_FEATURE_COUNT = XCLASSIFIER_FEATURE_COUNT + 2;

	/**
	 * The operation id for the '<em>XNamed Element Name</em>' operation.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 * @ordered
	 */
	int XENCAPSULATED_CLASSIFIER___XNAMED_ELEMENT_NAME__DIAGNOSTICCHAIN_MAP = XCLASSIFIER___XNAMED_ELEMENT_NAME__DIAGNOSTICCHAIN_MAP;

	/**
	 * The operation id for the '<em>XClassifier Features</em>' operation.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 * @ordered
	 */
	int XENCAPSULATED_CLASSIFIER___XCLASSIFIER_FEATURES__DIAGNOSTICCHAIN_MAP = XCLASSIFIER___XCLASSIFIER_FEATURES__DIAGNOSTICCHAIN_MAP;

	/**
	 * The operation id for the '<em>XClassifier Nested Classifiers</em>' operation.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 * @ordered
	 */
	int XENCAPSULATED_CLASSIFIER___XCLASSIFIER_NESTED_CLASSIFIERS__DIAGNOSTICCHAIN_MAP = XCLASSIFIER___XCLASSIFIER_NESTED_CLASSIFIERS__DIAGNOSTICCHAIN_MAP;

	/**
	 * The operation id for the '<em>XClassifier Generals</em>' operation.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 * @ordered
	 */
	int XENCAPSULATED_CLASSIFIER___XCLASSIFIER_GENERALS__DIAGNOSTICCHAIN_MAP = XCLASSIFIER___XCLASSIFIER_GENERALS__DIAGNOSTICCHAIN_MAP;

	/**
	 * The operation id for the '<em>XClassifier Constraints</em>' operation.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 * @ordered
	 */
	int XENCAPSULATED_CLASSIFIER___XCLASSIFIER_CONSTRAINTS__DIAGNOSTICCHAIN_MAP = XCLASSIFIER___XCLASSIFIER_CONSTRAINTS__DIAGNOSTICCHAIN_MAP;

	/**
	 * The operation id for the '<em>XEncapsulated Classifier Ports</em>' operation.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 * @ordered
	 */
	int XENCAPSULATED_CLASSIFIER___XENCAPSULATED_CLASSIFIER_PORTS__DIAGNOSTICCHAIN_MAP = XCLASSIFIER_OPERATION_COUNT + 0;

	/**
	 * The operation id for the '<em>XEncapsulated Classifierconnectors</em>' operation.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 * @ordered
	 */
	int XENCAPSULATED_CLASSIFIER___XENCAPSULATED_CLASSIFIERCONNECTORS__DIAGNOSTICCHAIN_MAP = XCLASSIFIER_OPERATION_COUNT + 1;

	/**
	 * The operation id for the '<em>XEncapsulated Classifier External</em>' operation.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 * @ordered
	 */
	int XENCAPSULATED_CLASSIFIER___XENCAPSULATED_CLASSIFIER_EXTERNAL__DIAGNOSTICCHAIN_MAP = XCLASSIFIER_OPERATION_COUNT + 2;

	/**
	 * The number of operations of the '<em>XEncapsulated Classifier</em>' class.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 * @ordered
	 */
	int XENCAPSULATED_CLASSIFIER_OPERATION_COUNT = XCLASSIFIER_OPERATION_COUNT + 3;

	/**
	 * The meta object id for the '{@link com.ericsson.executablemodeling.xtuml.profile.executablemodelingprofile.impl.XProtocolImpl <em>XProtocol</em>}' class.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @see com.ericsson.executablemodeling.xtuml.profile.executablemodelingprofile.impl.XProtocolImpl
	 * @see com.ericsson.executablemodeling.xtuml.profile.executablemodelingprofile.impl.ExecutableModelingProfilePackageImpl#getXProtocol()
	 * @generated
	 */
	int XPROTOCOL = 8;

	/**
	 * The feature id for the '<em><b>Base Named Element</b></em>' reference.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 * @ordered
	 */
	int XPROTOCOL__BASE_NAMED_ELEMENT = XCLASSIFIER__BASE_NAMED_ELEMENT;

	/**
	 * The feature id for the '<em><b>Base Namespace</b></em>' reference.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 * @ordered
	 */
	int XPROTOCOL__BASE_NAMESPACE = XCLASSIFIER__BASE_NAMESPACE;

	/**
	 * The feature id for the '<em><b>Base Classifier</b></em>' reference.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 * @ordered
	 */
	int XPROTOCOL__BASE_CLASSIFIER = XCLASSIFIER__BASE_CLASSIFIER;

	/**
	 * The feature id for the '<em><b>Base Behaviored Classifier</b></em>' reference.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 * @ordered
	 */
	int XPROTOCOL__BASE_BEHAVIORED_CLASSIFIER = XCLASSIFIER_FEATURE_COUNT + 0;

	/**
	 * The number of structural features of the '<em>XProtocol</em>' class.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 * @ordered
	 */
	int XPROTOCOL_FEATURE_COUNT = XCLASSIFIER_FEATURE_COUNT + 1;

	/**
	 * The operation id for the '<em>XNamed Element Name</em>' operation.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 * @ordered
	 */
	int XPROTOCOL___XNAMED_ELEMENT_NAME__DIAGNOSTICCHAIN_MAP = XCLASSIFIER___XNAMED_ELEMENT_NAME__DIAGNOSTICCHAIN_MAP;

	/**
	 * The operation id for the '<em>XClassifier Features</em>' operation.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 * @ordered
	 */
	int XPROTOCOL___XCLASSIFIER_FEATURES__DIAGNOSTICCHAIN_MAP = XCLASSIFIER___XCLASSIFIER_FEATURES__DIAGNOSTICCHAIN_MAP;

	/**
	 * The operation id for the '<em>XClassifier Nested Classifiers</em>' operation.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 * @ordered
	 */
	int XPROTOCOL___XCLASSIFIER_NESTED_CLASSIFIERS__DIAGNOSTICCHAIN_MAP = XCLASSIFIER___XCLASSIFIER_NESTED_CLASSIFIERS__DIAGNOSTICCHAIN_MAP;

	/**
	 * The operation id for the '<em>XClassifier Generals</em>' operation.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 * @ordered
	 */
	int XPROTOCOL___XCLASSIFIER_GENERALS__DIAGNOSTICCHAIN_MAP = XCLASSIFIER___XCLASSIFIER_GENERALS__DIAGNOSTICCHAIN_MAP;

	/**
	 * The operation id for the '<em>XClassifier Constraints</em>' operation.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 * @ordered
	 */
	int XPROTOCOL___XCLASSIFIER_CONSTRAINTS__DIAGNOSTICCHAIN_MAP = XCLASSIFIER___XCLASSIFIER_CONSTRAINTS__DIAGNOSTICCHAIN_MAP;

	/**
	 * The operation id for the '<em>XProtocol Incoming Interface</em>' operation.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 * @ordered
	 */
	int XPROTOCOL___XPROTOCOL_INCOMING_INTERFACE__DIAGNOSTICCHAIN_MAP = XCLASSIFIER_OPERATION_COUNT + 0;

	/**
	 * The operation id for the '<em>XProtocol Protocol Container</em>' operation.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 * @ordered
	 */
	int XPROTOCOL___XPROTOCOL_PROTOCOL_CONTAINER__DIAGNOSTICCHAIN_MAP = XCLASSIFIER_OPERATION_COUNT + 1;

	/**
	 * The operation id for the '<em>XProtocol Outgoing Interface</em>' operation.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 * @ordered
	 */
	int XPROTOCOL___XPROTOCOL_OUTGOING_INTERFACE__DIAGNOSTICCHAIN_MAP = XCLASSIFIER_OPERATION_COUNT + 2;

	/**
	 * The operation id for the '<em>XProtocol Symmetric Interface</em>' operation.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 * @ordered
	 */
	int XPROTOCOL___XPROTOCOL_SYMMETRIC_INTERFACE__DIAGNOSTICCHAIN_MAP = XCLASSIFIER_OPERATION_COUNT + 3;

	/**
	 * The number of operations of the '<em>XProtocol</em>' class.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 * @ordered
	 */
	int XPROTOCOL_OPERATION_COUNT = XCLASSIFIER_OPERATION_COUNT + 4;

	/**
	 * The meta object id for the '{@link com.ericsson.executablemodeling.xtuml.profile.executablemodelingprofile.impl.XSignalImpl <em>XSignal</em>}' class.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @see com.ericsson.executablemodeling.xtuml.profile.executablemodelingprofile.impl.XSignalImpl
	 * @see com.ericsson.executablemodeling.xtuml.profile.executablemodelingprofile.impl.ExecutableModelingProfilePackageImpl#getXSignal()
	 * @generated
	 */
	int XSIGNAL = 9;

	/**
	 * The feature id for the '<em><b>Base Named Element</b></em>' reference.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 * @ordered
	 */
	int XSIGNAL__BASE_NAMED_ELEMENT = XCLASSIFIER__BASE_NAMED_ELEMENT;

	/**
	 * The feature id for the '<em><b>Base Namespace</b></em>' reference.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 * @ordered
	 */
	int XSIGNAL__BASE_NAMESPACE = XCLASSIFIER__BASE_NAMESPACE;

	/**
	 * The feature id for the '<em><b>Base Classifier</b></em>' reference.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 * @ordered
	 */
	int XSIGNAL__BASE_CLASSIFIER = XCLASSIFIER__BASE_CLASSIFIER;

	/**
	 * The feature id for the '<em><b>Base Signal</b></em>' reference.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 * @ordered
	 */
	int XSIGNAL__BASE_SIGNAL = XCLASSIFIER_FEATURE_COUNT + 0;

	/**
	 * The number of structural features of the '<em>XSignal</em>' class.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 * @ordered
	 */
	int XSIGNAL_FEATURE_COUNT = XCLASSIFIER_FEATURE_COUNT + 1;

	/**
	 * The operation id for the '<em>XNamed Element Name</em>' operation.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 * @ordered
	 */
	int XSIGNAL___XNAMED_ELEMENT_NAME__DIAGNOSTICCHAIN_MAP = XCLASSIFIER___XNAMED_ELEMENT_NAME__DIAGNOSTICCHAIN_MAP;

	/**
	 * The operation id for the '<em>XClassifier Features</em>' operation.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 * @ordered
	 */
	int XSIGNAL___XCLASSIFIER_FEATURES__DIAGNOSTICCHAIN_MAP = XCLASSIFIER___XCLASSIFIER_FEATURES__DIAGNOSTICCHAIN_MAP;

	/**
	 * The operation id for the '<em>XClassifier Nested Classifiers</em>' operation.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 * @ordered
	 */
	int XSIGNAL___XCLASSIFIER_NESTED_CLASSIFIERS__DIAGNOSTICCHAIN_MAP = XCLASSIFIER___XCLASSIFIER_NESTED_CLASSIFIERS__DIAGNOSTICCHAIN_MAP;

	/**
	 * The operation id for the '<em>XClassifier Generals</em>' operation.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 * @ordered
	 */
	int XSIGNAL___XCLASSIFIER_GENERALS__DIAGNOSTICCHAIN_MAP = XCLASSIFIER___XCLASSIFIER_GENERALS__DIAGNOSTICCHAIN_MAP;

	/**
	 * The operation id for the '<em>XClassifier Constraints</em>' operation.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 * @ordered
	 */
	int XSIGNAL___XCLASSIFIER_CONSTRAINTS__DIAGNOSTICCHAIN_MAP = XCLASSIFIER___XCLASSIFIER_CONSTRAINTS__DIAGNOSTICCHAIN_MAP;

	/**
	 * The operation id for the '<em>XSignal Visibility</em>' operation.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 * @ordered
	 */
	int XSIGNAL___XSIGNAL_VISIBILITY__DIAGNOSTICCHAIN_MAP = XCLASSIFIER_OPERATION_COUNT + 0;

	/**
	 * The number of operations of the '<em>XSignal</em>' class.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 * @ordered
	 */
	int XSIGNAL_OPERATION_COUNT = XCLASSIFIER_OPERATION_COUNT + 1;

	/**
	 * The meta object id for the '{@link com.ericsson.executablemodeling.xtuml.profile.executablemodelingprofile.impl.XDataTypeImpl <em>XData Type</em>}' class.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @see com.ericsson.executablemodeling.xtuml.profile.executablemodelingprofile.impl.XDataTypeImpl
	 * @see com.ericsson.executablemodeling.xtuml.profile.executablemodelingprofile.impl.ExecutableModelingProfilePackageImpl#getXDataType()
	 * @generated
	 */
	int XDATA_TYPE = 10;

	/**
	 * The feature id for the '<em><b>Base Named Element</b></em>' reference.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 * @ordered
	 */
	int XDATA_TYPE__BASE_NAMED_ELEMENT = XCLASSIFIER__BASE_NAMED_ELEMENT;

	/**
	 * The feature id for the '<em><b>Base Namespace</b></em>' reference.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 * @ordered
	 */
	int XDATA_TYPE__BASE_NAMESPACE = XCLASSIFIER__BASE_NAMESPACE;

	/**
	 * The feature id for the '<em><b>Base Classifier</b></em>' reference.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 * @ordered
	 */
	int XDATA_TYPE__BASE_CLASSIFIER = XCLASSIFIER__BASE_CLASSIFIER;

	/**
	 * The feature id for the '<em><b>Base Data Type</b></em>' reference.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 * @ordered
	 */
	int XDATA_TYPE__BASE_DATA_TYPE = XCLASSIFIER_FEATURE_COUNT + 0;

	/**
	 * The number of structural features of the '<em>XData Type</em>' class.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 * @ordered
	 */
	int XDATA_TYPE_FEATURE_COUNT = XCLASSIFIER_FEATURE_COUNT + 1;

	/**
	 * The operation id for the '<em>XNamed Element Name</em>' operation.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 * @ordered
	 */
	int XDATA_TYPE___XNAMED_ELEMENT_NAME__DIAGNOSTICCHAIN_MAP = XCLASSIFIER___XNAMED_ELEMENT_NAME__DIAGNOSTICCHAIN_MAP;

	/**
	 * The operation id for the '<em>XClassifier Features</em>' operation.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 * @ordered
	 */
	int XDATA_TYPE___XCLASSIFIER_FEATURES__DIAGNOSTICCHAIN_MAP = XCLASSIFIER___XCLASSIFIER_FEATURES__DIAGNOSTICCHAIN_MAP;

	/**
	 * The operation id for the '<em>XClassifier Nested Classifiers</em>' operation.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 * @ordered
	 */
	int XDATA_TYPE___XCLASSIFIER_NESTED_CLASSIFIERS__DIAGNOSTICCHAIN_MAP = XCLASSIFIER___XCLASSIFIER_NESTED_CLASSIFIERS__DIAGNOSTICCHAIN_MAP;

	/**
	 * The operation id for the '<em>XClassifier Generals</em>' operation.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 * @ordered
	 */
	int XDATA_TYPE___XCLASSIFIER_GENERALS__DIAGNOSTICCHAIN_MAP = XCLASSIFIER___XCLASSIFIER_GENERALS__DIAGNOSTICCHAIN_MAP;

	/**
	 * The operation id for the '<em>XClassifier Constraints</em>' operation.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 * @ordered
	 */
	int XDATA_TYPE___XCLASSIFIER_CONSTRAINTS__DIAGNOSTICCHAIN_MAP = XCLASSIFIER___XCLASSIFIER_CONSTRAINTS__DIAGNOSTICCHAIN_MAP;

	/**
	 * The operation id for the '<em>XData Type Operations</em>' operation.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 * @ordered
	 */
	int XDATA_TYPE___XDATA_TYPE_OPERATIONS__DIAGNOSTICCHAIN_MAP = XCLASSIFIER_OPERATION_COUNT + 0;

	/**
	 * The number of operations of the '<em>XData Type</em>' class.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 * @ordered
	 */
	int XDATA_TYPE_OPERATION_COUNT = XCLASSIFIER_OPERATION_COUNT + 1;

	/**
	 * The meta object id for the '{@link com.ericsson.executablemodeling.xtuml.profile.executablemodelingprofile.impl.XTypedElementImpl <em>XTyped Element</em>}' class.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @see com.ericsson.executablemodeling.xtuml.profile.executablemodelingprofile.impl.XTypedElementImpl
	 * @see com.ericsson.executablemodeling.xtuml.profile.executablemodelingprofile.impl.ExecutableModelingProfilePackageImpl#getXTypedElement()
	 * @generated
	 */
	int XTYPED_ELEMENT = 12;

	/**
	 * The feature id for the '<em><b>Base Typed Element</b></em>' reference.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 * @ordered
	 */
	int XTYPED_ELEMENT__BASE_TYPED_ELEMENT = 0;

	/**
	 * The number of structural features of the '<em>XTyped Element</em>' class.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 * @ordered
	 */
	int XTYPED_ELEMENT_FEATURE_COUNT = 1;

	/**
	 * The operation id for the '<em>XTyped Element Type</em>' operation.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 * @ordered
	 */
	int XTYPED_ELEMENT___XTYPED_ELEMENT_TYPE__DIAGNOSTICCHAIN_MAP = 0;

	/**
	 * The number of operations of the '<em>XTyped Element</em>' class.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 * @ordered
	 */
	int XTYPED_ELEMENT_OPERATION_COUNT = 1;

	/**
	 * The meta object id for the '{@link com.ericsson.executablemodeling.xtuml.profile.executablemodelingprofile.impl.XParameterImpl <em>XParameter</em>}' class.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @see com.ericsson.executablemodeling.xtuml.profile.executablemodelingprofile.impl.XParameterImpl
	 * @see com.ericsson.executablemodeling.xtuml.profile.executablemodelingprofile.impl.ExecutableModelingProfilePackageImpl#getXParameter()
	 * @generated
	 */
	int XPARAMETER = 11;

	/**
	 * The feature id for the '<em><b>Base Typed Element</b></em>' reference.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 * @ordered
	 */
	int XPARAMETER__BASE_TYPED_ELEMENT = XTYPED_ELEMENT__BASE_TYPED_ELEMENT;

	/**
	 * The feature id for the '<em><b>Base Parameter</b></em>' reference.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 * @ordered
	 */
	int XPARAMETER__BASE_PARAMETER = XTYPED_ELEMENT_FEATURE_COUNT + 0;

	/**
	 * The number of structural features of the '<em>XParameter</em>' class.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 * @ordered
	 */
	int XPARAMETER_FEATURE_COUNT = XTYPED_ELEMENT_FEATURE_COUNT + 1;

	/**
	 * The operation id for the '<em>XTyped Element Type</em>' operation.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 * @ordered
	 */
	int XPARAMETER___XTYPED_ELEMENT_TYPE__DIAGNOSTICCHAIN_MAP = XTYPED_ELEMENT___XTYPED_ELEMENT_TYPE__DIAGNOSTICCHAIN_MAP;

	/**
	 * The number of operations of the '<em>XParameter</em>' class.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 * @ordered
	 */
	int XPARAMETER_OPERATION_COUNT = XTYPED_ELEMENT_OPERATION_COUNT + 0;

	/**
	 * The meta object id for the '{@link com.ericsson.executablemodeling.xtuml.profile.executablemodelingprofile.impl.XMultiplicityElementImpl <em>XMultiplicity Element</em>}' class.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @see com.ericsson.executablemodeling.xtuml.profile.executablemodelingprofile.impl.XMultiplicityElementImpl
	 * @see com.ericsson.executablemodeling.xtuml.profile.executablemodelingprofile.impl.ExecutableModelingProfilePackageImpl#getXMultiplicityElement()
	 * @generated
	 */
	int XMULTIPLICITY_ELEMENT = 14;

	/**
	 * The feature id for the '<em><b>Base Multiplicity Element</b></em>' reference.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 * @ordered
	 */
	int XMULTIPLICITY_ELEMENT__BASE_MULTIPLICITY_ELEMENT = 0;

	/**
	 * The feature id for the '<em><b>Is Ordered By Value</b></em>' attribute.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 * @ordered
	 */
	int XMULTIPLICITY_ELEMENT__IS_ORDERED_BY_VALUE = 1;

	/**
	 * The feature id for the '<em><b>Key</b></em>' reference list.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 * @ordered
	 */
	int XMULTIPLICITY_ELEMENT__KEY = 2;

	/**
	 * The feature id for the '<em><b>Is Descending</b></em>' attribute.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 * @ordered
	 */
	int XMULTIPLICITY_ELEMENT__IS_DESCENDING = 3;

	/**
	 * The number of structural features of the '<em>XMultiplicity Element</em>' class.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 * @ordered
	 */
	int XMULTIPLICITY_ELEMENT_FEATURE_COUNT = 4;

	/**
	 * The operation id for the '<em>XMultiplicity Element Is Ordered By Value</em>' operation.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 * @ordered
	 */
	int XMULTIPLICITY_ELEMENT___XMULTIPLICITY_ELEMENT_IS_ORDERED_BY_VALUE__DIAGNOSTICCHAIN_MAP = 0;

	/**
	 * The operation id for the '<em>XMultiplicity Element Keys</em>' operation.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 * @ordered
	 */
	int XMULTIPLICITY_ELEMENT___XMULTIPLICITY_ELEMENT_KEYS__DIAGNOSTICCHAIN_MAP = 1;

	/**
	 * The number of operations of the '<em>XMultiplicity Element</em>' class.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 * @ordered
	 */
	int XMULTIPLICITY_ELEMENT_OPERATION_COUNT = 2;

	/**
	 * The meta object id for the '{@link com.ericsson.executablemodeling.xtuml.profile.executablemodelingprofile.impl.XPropertyImpl <em>XProperty</em>}' class.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @see com.ericsson.executablemodeling.xtuml.profile.executablemodelingprofile.impl.XPropertyImpl
	 * @see com.ericsson.executablemodeling.xtuml.profile.executablemodelingprofile.impl.ExecutableModelingProfilePackageImpl#getXProperty()
	 * @generated
	 */
	int XPROPERTY = 13;

	/**
	 * The feature id for the '<em><b>Base Multiplicity Element</b></em>' reference.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 * @ordered
	 */
	int XPROPERTY__BASE_MULTIPLICITY_ELEMENT = XMULTIPLICITY_ELEMENT__BASE_MULTIPLICITY_ELEMENT;

	/**
	 * The feature id for the '<em><b>Is Ordered By Value</b></em>' attribute.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 * @ordered
	 */
	int XPROPERTY__IS_ORDERED_BY_VALUE = XMULTIPLICITY_ELEMENT__IS_ORDERED_BY_VALUE;

	/**
	 * The feature id for the '<em><b>Key</b></em>' reference list.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 * @ordered
	 */
	int XPROPERTY__KEY = XMULTIPLICITY_ELEMENT__KEY;

	/**
	 * The feature id for the '<em><b>Is Descending</b></em>' attribute.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 * @ordered
	 */
	int XPROPERTY__IS_DESCENDING = XMULTIPLICITY_ELEMENT__IS_DESCENDING;

	/**
	 * The feature id for the '<em><b>Base Named Element</b></em>' reference.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 * @ordered
	 */
	int XPROPERTY__BASE_NAMED_ELEMENT = XMULTIPLICITY_ELEMENT_FEATURE_COUNT + 0;

	/**
	 * The feature id for the '<em><b>Base Feature</b></em>' reference.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 * @ordered
	 */
	int XPROPERTY__BASE_FEATURE = XMULTIPLICITY_ELEMENT_FEATURE_COUNT + 1;

	/**
	 * The feature id for the '<em><b>Base Typed Element</b></em>' reference.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 * @ordered
	 */
	int XPROPERTY__BASE_TYPED_ELEMENT = XMULTIPLICITY_ELEMENT_FEATURE_COUNT + 2;

	/**
	 * The feature id for the '<em><b>Base Property</b></em>' reference.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 * @ordered
	 */
	int XPROPERTY__BASE_PROPERTY = XMULTIPLICITY_ELEMENT_FEATURE_COUNT + 3;

	/**
	 * The number of structural features of the '<em>XProperty</em>' class.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 * @ordered
	 */
	int XPROPERTY_FEATURE_COUNT = XMULTIPLICITY_ELEMENT_FEATURE_COUNT + 4;

	/**
	 * The operation id for the '<em>XMultiplicity Element Is Ordered By Value</em>' operation.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 * @ordered
	 */
	int XPROPERTY___XMULTIPLICITY_ELEMENT_IS_ORDERED_BY_VALUE__DIAGNOSTICCHAIN_MAP = XMULTIPLICITY_ELEMENT___XMULTIPLICITY_ELEMENT_IS_ORDERED_BY_VALUE__DIAGNOSTICCHAIN_MAP;

	/**
	 * The operation id for the '<em>XMultiplicity Element Keys</em>' operation.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 * @ordered
	 */
	int XPROPERTY___XMULTIPLICITY_ELEMENT_KEYS__DIAGNOSTICCHAIN_MAP = XMULTIPLICITY_ELEMENT___XMULTIPLICITY_ELEMENT_KEYS__DIAGNOSTICCHAIN_MAP;

	/**
	 * The operation id for the '<em>XNamed Element Name</em>' operation.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 * @ordered
	 */
	int XPROPERTY___XNAMED_ELEMENT_NAME__DIAGNOSTICCHAIN_MAP = XMULTIPLICITY_ELEMENT_OPERATION_COUNT + 0;

	/**
	 * The operation id for the '<em>XFeature Classifier</em>' operation.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 * @ordered
	 */
	int XPROPERTY___XFEATURE_CLASSIFIER__DIAGNOSTICCHAIN_MAP = XMULTIPLICITY_ELEMENT_OPERATION_COUNT + 1;

	/**
	 * The operation id for the '<em>XTyped Element Type</em>' operation.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 * @ordered
	 */
	int XPROPERTY___XTYPED_ELEMENT_TYPE__DIAGNOSTICCHAIN_MAP = XMULTIPLICITY_ELEMENT_OPERATION_COUNT + 2;

	/**
	 * The number of operations of the '<em>XProperty</em>' class.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 * @ordered
	 */
	int XPROPERTY_OPERATION_COUNT = XMULTIPLICITY_ELEMENT_OPERATION_COUNT + 3;

	/**
	 * The meta object id for the '{@link com.ericsson.executablemodeling.xtuml.profile.executablemodelingprofile.impl.XReceptionImpl <em>XReception</em>}' class.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @see com.ericsson.executablemodeling.xtuml.profile.executablemodelingprofile.impl.XReceptionImpl
	 * @see com.ericsson.executablemodeling.xtuml.profile.executablemodelingprofile.impl.ExecutableModelingProfilePackageImpl#getXReception()
	 * @generated
	 */
	int XRECEPTION = 15;

	/**
	 * The feature id for the '<em><b>Base Named Element</b></em>' reference.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 * @ordered
	 */
	int XRECEPTION__BASE_NAMED_ELEMENT = XFEATURE__BASE_NAMED_ELEMENT;

	/**
	 * The feature id for the '<em><b>Base Feature</b></em>' reference.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 * @ordered
	 */
	int XRECEPTION__BASE_FEATURE = XFEATURE__BASE_FEATURE;

	/**
	 * The feature id for the '<em><b>Base Reception</b></em>' reference.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 * @ordered
	 */
	int XRECEPTION__BASE_RECEPTION = XFEATURE_FEATURE_COUNT + 0;

	/**
	 * The number of structural features of the '<em>XReception</em>' class.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 * @ordered
	 */
	int XRECEPTION_FEATURE_COUNT = XFEATURE_FEATURE_COUNT + 1;

	/**
	 * The operation id for the '<em>XNamed Element Name</em>' operation.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 * @ordered
	 */
	int XRECEPTION___XNAMED_ELEMENT_NAME__DIAGNOSTICCHAIN_MAP = XFEATURE___XNAMED_ELEMENT_NAME__DIAGNOSTICCHAIN_MAP;

	/**
	 * The operation id for the '<em>XFeature Classifier</em>' operation.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 * @ordered
	 */
	int XRECEPTION___XFEATURE_CLASSIFIER__DIAGNOSTICCHAIN_MAP = XFEATURE___XFEATURE_CLASSIFIER__DIAGNOSTICCHAIN_MAP;

	/**
	 * The operation id for the '<em>XReception Signal</em>' operation.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 * @ordered
	 */
	int XRECEPTION___XRECEPTION_SIGNAL__DIAGNOSTICCHAIN_MAP = XFEATURE_OPERATION_COUNT + 0;

	/**
	 * The number of operations of the '<em>XReception</em>' class.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 * @ordered
	 */
	int XRECEPTION_OPERATION_COUNT = XFEATURE_OPERATION_COUNT + 1;

	/**
	 * The meta object id for the '{@link com.ericsson.executablemodeling.xtuml.profile.executablemodelingprofile.impl.XPartImpl <em>XPart</em>}' class.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @see com.ericsson.executablemodeling.xtuml.profile.executablemodelingprofile.impl.XPartImpl
	 * @see com.ericsson.executablemodeling.xtuml.profile.executablemodelingprofile.impl.ExecutableModelingProfilePackageImpl#getXPart()
	 * @generated
	 */
	int XPART = 16;

	/**
	 * The feature id for the '<em><b>Base Named Element</b></em>' reference.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 * @ordered
	 */
	int XPART__BASE_NAMED_ELEMENT = XFEATURE__BASE_NAMED_ELEMENT;

	/**
	 * The feature id for the '<em><b>Base Feature</b></em>' reference.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 * @ordered
	 */
	int XPART__BASE_FEATURE = XFEATURE__BASE_FEATURE;

	/**
	 * The feature id for the '<em><b>Base Typed Element</b></em>' reference.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 * @ordered
	 */
	int XPART__BASE_TYPED_ELEMENT = XFEATURE_FEATURE_COUNT + 0;

	/**
	 * The feature id for the '<em><b>Base Property</b></em>' reference.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 * @ordered
	 */
	int XPART__BASE_PROPERTY = XFEATURE_FEATURE_COUNT + 1;

	/**
	 * The number of structural features of the '<em>XPart</em>' class.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 * @ordered
	 */
	int XPART_FEATURE_COUNT = XFEATURE_FEATURE_COUNT + 2;

	/**
	 * The operation id for the '<em>XNamed Element Name</em>' operation.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 * @ordered
	 */
	int XPART___XNAMED_ELEMENT_NAME__DIAGNOSTICCHAIN_MAP = XFEATURE___XNAMED_ELEMENT_NAME__DIAGNOSTICCHAIN_MAP;

	/**
	 * The operation id for the '<em>XFeature Classifier</em>' operation.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 * @ordered
	 */
	int XPART___XFEATURE_CLASSIFIER__DIAGNOSTICCHAIN_MAP = XFEATURE___XFEATURE_CLASSIFIER__DIAGNOSTICCHAIN_MAP;

	/**
	 * The operation id for the '<em>XTyped Element Type</em>' operation.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 * @ordered
	 */
	int XPART___XTYPED_ELEMENT_TYPE__DIAGNOSTICCHAIN_MAP = XFEATURE_OPERATION_COUNT + 0;

	/**
	 * The operation id for the '<em>XPart Classifier</em>' operation.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 * @ordered
	 */
	int XPART___XPART_CLASSIFIER__DIAGNOSTICCHAIN_MAP = XFEATURE_OPERATION_COUNT + 1;

	/**
	 * The number of operations of the '<em>XPart</em>' class.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 * @ordered
	 */
	int XPART_OPERATION_COUNT = XFEATURE_OPERATION_COUNT + 2;

	/**
	 * The meta object id for the '{@link com.ericsson.executablemodeling.xtuml.profile.executablemodelingprofile.impl.XPortImpl <em>XPort</em>}' class.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @see com.ericsson.executablemodeling.xtuml.profile.executablemodelingprofile.impl.XPortImpl
	 * @see com.ericsson.executablemodeling.xtuml.profile.executablemodelingprofile.impl.ExecutableModelingProfilePackageImpl#getXPort()
	 * @generated
	 */
	int XPORT = 17;

	/**
	 * The feature id for the '<em><b>Base Named Element</b></em>' reference.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 * @ordered
	 */
	int XPORT__BASE_NAMED_ELEMENT = XFEATURE__BASE_NAMED_ELEMENT;

	/**
	 * The feature id for the '<em><b>Base Feature</b></em>' reference.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 * @ordered
	 */
	int XPORT__BASE_FEATURE = XFEATURE__BASE_FEATURE;

	/**
	 * The feature id for the '<em><b>Base Port</b></em>' reference.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 * @ordered
	 */
	int XPORT__BASE_PORT = XFEATURE_FEATURE_COUNT + 0;

	/**
	 * The number of structural features of the '<em>XPort</em>' class.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 * @ordered
	 */
	int XPORT_FEATURE_COUNT = XFEATURE_FEATURE_COUNT + 1;

	/**
	 * The operation id for the '<em>XNamed Element Name</em>' operation.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 * @ordered
	 */
	int XPORT___XNAMED_ELEMENT_NAME__DIAGNOSTICCHAIN_MAP = XFEATURE___XNAMED_ELEMENT_NAME__DIAGNOSTICCHAIN_MAP;

	/**
	 * The operation id for the '<em>XFeature Classifier</em>' operation.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 * @ordered
	 */
	int XPORT___XFEATURE_CLASSIFIER__DIAGNOSTICCHAIN_MAP = XFEATURE___XFEATURE_CLASSIFIER__DIAGNOSTICCHAIN_MAP;

	/**
	 * The operation id for the '<em>XPort Classifier</em>' operation.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 * @ordered
	 */
	int XPORT___XPORT_CLASSIFIER__DIAGNOSTICCHAIN_MAP = XFEATURE_OPERATION_COUNT + 0;

	/**
	 * The operation id for the '<em>XPort Ordering Uniqueness</em>' operation.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 * @ordered
	 */
	int XPORT___XPORT_ORDERING_UNIQUENESS__DIAGNOSTICCHAIN_MAP = XFEATURE_OPERATION_COUNT + 1;

	/**
	 * The operation id for the '<em>XPort Type</em>' operation.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 * @ordered
	 */
	int XPORT___XPORT_TYPE__DIAGNOSTICCHAIN_MAP = XFEATURE_OPERATION_COUNT + 2;

	/**
	 * The operation id for the '<em>XPort Behavior Port</em>' operation.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 * @ordered
	 */
	int XPORT___XPORT_BEHAVIOR_PORT__DIAGNOSTICCHAIN_MAP = XFEATURE_OPERATION_COUNT + 3;

	/**
	 * The operation id for the '<em>XPort Visibility</em>' operation.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 * @ordered
	 */
	int XPORT___XPORT_VISIBILITY__DIAGNOSTICCHAIN_MAP = XFEATURE_OPERATION_COUNT + 4;

	/**
	 * The number of operations of the '<em>XPort</em>' class.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 * @ordered
	 */
	int XPORT_OPERATION_COUNT = XFEATURE_OPERATION_COUNT + 5;

	/**
	 * The meta object id for the '{@link com.ericsson.executablemodeling.xtuml.profile.executablemodelingprofile.impl.XConnectorImpl <em>XConnector</em>}' class.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @see com.ericsson.executablemodeling.xtuml.profile.executablemodelingprofile.impl.XConnectorImpl
	 * @see com.ericsson.executablemodeling.xtuml.profile.executablemodelingprofile.impl.ExecutableModelingProfilePackageImpl#getXConnector()
	 * @generated
	 */
	int XCONNECTOR = 18;

	/**
	 * The feature id for the '<em><b>Base Named Element</b></em>' reference.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 * @ordered
	 */
	int XCONNECTOR__BASE_NAMED_ELEMENT = XFEATURE__BASE_NAMED_ELEMENT;

	/**
	 * The feature id for the '<em><b>Base Feature</b></em>' reference.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 * @ordered
	 */
	int XCONNECTOR__BASE_FEATURE = XFEATURE__BASE_FEATURE;

	/**
	 * The feature id for the '<em><b>Base Connector</b></em>' reference.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 * @ordered
	 */
	int XCONNECTOR__BASE_CONNECTOR = XFEATURE_FEATURE_COUNT + 0;

	/**
	 * The number of structural features of the '<em>XConnector</em>' class.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 * @ordered
	 */
	int XCONNECTOR_FEATURE_COUNT = XFEATURE_FEATURE_COUNT + 1;

	/**
	 * The operation id for the '<em>XNamed Element Name</em>' operation.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 * @ordered
	 */
	int XCONNECTOR___XNAMED_ELEMENT_NAME__DIAGNOSTICCHAIN_MAP = XFEATURE___XNAMED_ELEMENT_NAME__DIAGNOSTICCHAIN_MAP;

	/**
	 * The operation id for the '<em>XFeature Classifier</em>' operation.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 * @ordered
	 */
	int XCONNECTOR___XFEATURE_CLASSIFIER__DIAGNOSTICCHAIN_MAP = XFEATURE___XFEATURE_CLASSIFIER__DIAGNOSTICCHAIN_MAP;

	/**
	 * The operation id for the '<em>XConnector Classifier</em>' operation.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 * @ordered
	 */
	int XCONNECTOR___XCONNECTOR_CLASSIFIER__DIAGNOSTICCHAIN_MAP = XFEATURE_OPERATION_COUNT + 0;

	/**
	 * The operation id for the '<em>XConnector Ends</em>' operation.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 * @ordered
	 */
	int XCONNECTOR___XCONNECTOR_ENDS__DIAGNOSTICCHAIN_MAP = XFEATURE_OPERATION_COUNT + 1;

	/**
	 * The operation id for the '<em>Xt Connector Type</em>' operation.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 * @ordered
	 */
	int XCONNECTOR___XT_CONNECTOR_TYPE__DIAGNOSTICCHAIN_MAP = XFEATURE_OPERATION_COUNT + 2;

	/**
	 * The number of operations of the '<em>XConnector</em>' class.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 * @ordered
	 */
	int XCONNECTOR_OPERATION_COUNT = XFEATURE_OPERATION_COUNT + 3;

	/**
	 * The meta object id for the '{@link com.ericsson.executablemodeling.xtuml.profile.executablemodelingprofile.impl.XProtocolContainerImpl <em>XProtocol Container</em>}' class.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @see com.ericsson.executablemodeling.xtuml.profile.executablemodelingprofile.impl.XProtocolContainerImpl
	 * @see com.ericsson.executablemodeling.xtuml.profile.executablemodelingprofile.impl.ExecutableModelingProfilePackageImpl#getXProtocolContainer()
	 * @generated
	 */
	int XPROTOCOL_CONTAINER = 19;

	/**
	 * The feature id for the '<em><b>Base Package</b></em>' reference.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 * @ordered
	 */
	int XPROTOCOL_CONTAINER__BASE_PACKAGE = 0;

	/**
	 * The number of structural features of the '<em>XProtocol Container</em>' class.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 * @ordered
	 */
	int XPROTOCOL_CONTAINER_FEATURE_COUNT = 1;

	/**
	 * The operation id for the '<em>XProtocol Container Protocol</em>' operation.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 * @ordered
	 */
	int XPROTOCOL_CONTAINER___XPROTOCOL_CONTAINER_PROTOCOL__DIAGNOSTICCHAIN_MAP = 0;

	/**
	 * The number of operations of the '<em>XProtocol Container</em>' class.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 * @ordered
	 */
	int XPROTOCOL_CONTAINER_OPERATION_COUNT = 1;

	/**
	 * The meta object id for the '{@link com.ericsson.executablemodeling.xtuml.profile.executablemodelingprofile.impl.XMessageSetImpl <em>XMessage Set</em>}' class.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @see com.ericsson.executablemodeling.xtuml.profile.executablemodelingprofile.impl.XMessageSetImpl
	 * @see com.ericsson.executablemodeling.xtuml.profile.executablemodelingprofile.impl.ExecutableModelingProfilePackageImpl#getXMessageSet()
	 * @generated
	 */
	int XMESSAGE_SET = 20;

	/**
	 * The feature id for the '<em><b>Base Named Element</b></em>' reference.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 * @ordered
	 */
	int XMESSAGE_SET__BASE_NAMED_ELEMENT = XCLASSIFIER__BASE_NAMED_ELEMENT;

	/**
	 * The feature id for the '<em><b>Base Namespace</b></em>' reference.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 * @ordered
	 */
	int XMESSAGE_SET__BASE_NAMESPACE = XCLASSIFIER__BASE_NAMESPACE;

	/**
	 * The feature id for the '<em><b>Base Classifier</b></em>' reference.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 * @ordered
	 */
	int XMESSAGE_SET__BASE_CLASSIFIER = XCLASSIFIER__BASE_CLASSIFIER;

	/**
	 * The feature id for the '<em><b>Base Interface</b></em>' reference.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 * @ordered
	 */
	int XMESSAGE_SET__BASE_INTERFACE = XCLASSIFIER_FEATURE_COUNT + 0;

	/**
	 * The feature id for the '<em><b>Message Kind</b></em>' attribute.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 * @ordered
	 */
	int XMESSAGE_SET__MESSAGE_KIND = XCLASSIFIER_FEATURE_COUNT + 1;

	/**
	 * The number of structural features of the '<em>XMessage Set</em>' class.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 * @ordered
	 */
	int XMESSAGE_SET_FEATURE_COUNT = XCLASSIFIER_FEATURE_COUNT + 2;

	/**
	 * The operation id for the '<em>XNamed Element Name</em>' operation.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 * @ordered
	 */
	int XMESSAGE_SET___XNAMED_ELEMENT_NAME__DIAGNOSTICCHAIN_MAP = XCLASSIFIER___XNAMED_ELEMENT_NAME__DIAGNOSTICCHAIN_MAP;

	/**
	 * The operation id for the '<em>XClassifier Features</em>' operation.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 * @ordered
	 */
	int XMESSAGE_SET___XCLASSIFIER_FEATURES__DIAGNOSTICCHAIN_MAP = XCLASSIFIER___XCLASSIFIER_FEATURES__DIAGNOSTICCHAIN_MAP;

	/**
	 * The operation id for the '<em>XClassifier Nested Classifiers</em>' operation.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 * @ordered
	 */
	int XMESSAGE_SET___XCLASSIFIER_NESTED_CLASSIFIERS__DIAGNOSTICCHAIN_MAP = XCLASSIFIER___XCLASSIFIER_NESTED_CLASSIFIERS__DIAGNOSTICCHAIN_MAP;

	/**
	 * The operation id for the '<em>XClassifier Generals</em>' operation.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 * @ordered
	 */
	int XMESSAGE_SET___XCLASSIFIER_GENERALS__DIAGNOSTICCHAIN_MAP = XCLASSIFIER___XCLASSIFIER_GENERALS__DIAGNOSTICCHAIN_MAP;

	/**
	 * The operation id for the '<em>XClassifier Constraints</em>' operation.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 * @ordered
	 */
	int XMESSAGE_SET___XCLASSIFIER_CONSTRAINTS__DIAGNOSTICCHAIN_MAP = XCLASSIFIER___XCLASSIFIER_CONSTRAINTS__DIAGNOSTICCHAIN_MAP;

	/**
	 * The operation id for the '<em>XMessage Set Incoming</em>' operation.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 * @ordered
	 */
	int XMESSAGE_SET___XMESSAGE_SET_INCOMING__DIAGNOSTICCHAIN_MAP = XCLASSIFIER_OPERATION_COUNT + 0;

	/**
	 * The operation id for the '<em>XMessage Set Outgoing</em>' operation.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 * @ordered
	 */
	int XMESSAGE_SET___XMESSAGE_SET_OUTGOING__DIAGNOSTICCHAIN_MAP = XCLASSIFIER_OPERATION_COUNT + 1;

	/**
	 * The operation id for the '<em>XMessage Set Symmetric</em>' operation.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 * @ordered
	 */
	int XMESSAGE_SET___XMESSAGE_SET_SYMMETRIC__DIAGNOSTICCHAIN_MAP = XCLASSIFIER_OPERATION_COUNT + 2;

	/**
	 * The number of operations of the '<em>XMessage Set</em>' class.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 * @ordered
	 */
	int XMESSAGE_SET_OPERATION_COUNT = XCLASSIFIER_OPERATION_COUNT + 3;

	/**
	 * The meta object id for the '{@link com.ericsson.executablemodeling.xtuml.profile.executablemodelingprofile.impl.XEnumerationImpl <em>XEnumeration</em>}' class.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @see com.ericsson.executablemodeling.xtuml.profile.executablemodelingprofile.impl.XEnumerationImpl
	 * @see com.ericsson.executablemodeling.xtuml.profile.executablemodelingprofile.impl.ExecutableModelingProfilePackageImpl#getXEnumeration()
	 * @generated
	 */
	int XENUMERATION = 21;

	/**
	 * The feature id for the '<em><b>Base Named Element</b></em>' reference.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 * @ordered
	 */
	int XENUMERATION__BASE_NAMED_ELEMENT = XDATA_TYPE__BASE_NAMED_ELEMENT;

	/**
	 * The feature id for the '<em><b>Base Namespace</b></em>' reference.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 * @ordered
	 */
	int XENUMERATION__BASE_NAMESPACE = XDATA_TYPE__BASE_NAMESPACE;

	/**
	 * The feature id for the '<em><b>Base Classifier</b></em>' reference.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 * @ordered
	 */
	int XENUMERATION__BASE_CLASSIFIER = XDATA_TYPE__BASE_CLASSIFIER;

	/**
	 * The feature id for the '<em><b>Base Data Type</b></em>' reference.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 * @ordered
	 */
	int XENUMERATION__BASE_DATA_TYPE = XDATA_TYPE__BASE_DATA_TYPE;

	/**
	 * The feature id for the '<em><b>Base Enumeration</b></em>' reference.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 * @ordered
	 */
	int XENUMERATION__BASE_ENUMERATION = XDATA_TYPE_FEATURE_COUNT + 0;

	/**
	 * The number of structural features of the '<em>XEnumeration</em>' class.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 * @ordered
	 */
	int XENUMERATION_FEATURE_COUNT = XDATA_TYPE_FEATURE_COUNT + 1;

	/**
	 * The operation id for the '<em>XNamed Element Name</em>' operation.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 * @ordered
	 */
	int XENUMERATION___XNAMED_ELEMENT_NAME__DIAGNOSTICCHAIN_MAP = XDATA_TYPE___XNAMED_ELEMENT_NAME__DIAGNOSTICCHAIN_MAP;

	/**
	 * The operation id for the '<em>XClassifier Features</em>' operation.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 * @ordered
	 */
	int XENUMERATION___XCLASSIFIER_FEATURES__DIAGNOSTICCHAIN_MAP = XDATA_TYPE___XCLASSIFIER_FEATURES__DIAGNOSTICCHAIN_MAP;

	/**
	 * The operation id for the '<em>XClassifier Nested Classifiers</em>' operation.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 * @ordered
	 */
	int XENUMERATION___XCLASSIFIER_NESTED_CLASSIFIERS__DIAGNOSTICCHAIN_MAP = XDATA_TYPE___XCLASSIFIER_NESTED_CLASSIFIERS__DIAGNOSTICCHAIN_MAP;

	/**
	 * The operation id for the '<em>XClassifier Generals</em>' operation.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 * @ordered
	 */
	int XENUMERATION___XCLASSIFIER_GENERALS__DIAGNOSTICCHAIN_MAP = XDATA_TYPE___XCLASSIFIER_GENERALS__DIAGNOSTICCHAIN_MAP;

	/**
	 * The operation id for the '<em>XClassifier Constraints</em>' operation.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 * @ordered
	 */
	int XENUMERATION___XCLASSIFIER_CONSTRAINTS__DIAGNOSTICCHAIN_MAP = XDATA_TYPE___XCLASSIFIER_CONSTRAINTS__DIAGNOSTICCHAIN_MAP;

	/**
	 * The operation id for the '<em>XData Type Operations</em>' operation.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 * @ordered
	 */
	int XENUMERATION___XDATA_TYPE_OPERATIONS__DIAGNOSTICCHAIN_MAP = XDATA_TYPE___XDATA_TYPE_OPERATIONS__DIAGNOSTICCHAIN_MAP;

	/**
	 * The operation id for the '<em>XEnumeration Attributes</em>' operation.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 * @ordered
	 */
	int XENUMERATION___XENUMERATION_ATTRIBUTES__DIAGNOSTICCHAIN_MAP = XDATA_TYPE_OPERATION_COUNT + 0;

	/**
	 * The number of operations of the '<em>XEnumeration</em>' class.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 * @ordered
	 */
	int XENUMERATION_OPERATION_COUNT = XDATA_TYPE_OPERATION_COUNT + 1;

	/**
	 * The meta object id for the '{@link com.ericsson.executablemodeling.xtuml.profile.executablemodelingprofile.impl.XAssociationClassImpl <em>XAssociation Class</em>}' class.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @see com.ericsson.executablemodeling.xtuml.profile.executablemodelingprofile.impl.XAssociationClassImpl
	 * @see com.ericsson.executablemodeling.xtuml.profile.executablemodelingprofile.impl.ExecutableModelingProfilePackageImpl#getXAssociationClass()
	 * @generated
	 */
	int XASSOCIATION_CLASS = 22;

	/**
	 * The feature id for the '<em><b>Base Named Element</b></em>' reference.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 * @ordered
	 */
	int XASSOCIATION_CLASS__BASE_NAMED_ELEMENT = XCLASSIFIER__BASE_NAMED_ELEMENT;

	/**
	 * The feature id for the '<em><b>Base Namespace</b></em>' reference.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 * @ordered
	 */
	int XASSOCIATION_CLASS__BASE_NAMESPACE = XCLASSIFIER__BASE_NAMESPACE;

	/**
	 * The feature id for the '<em><b>Base Classifier</b></em>' reference.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 * @ordered
	 */
	int XASSOCIATION_CLASS__BASE_CLASSIFIER = XCLASSIFIER__BASE_CLASSIFIER;

	/**
	 * The feature id for the '<em><b>Base Association</b></em>' reference.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 * @ordered
	 */
	int XASSOCIATION_CLASS__BASE_ASSOCIATION = XCLASSIFIER_FEATURE_COUNT + 0;

	/**
	 * The feature id for the '<em><b>Base Association Class</b></em>' reference.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 * @ordered
	 */
	int XASSOCIATION_CLASS__BASE_ASSOCIATION_CLASS = XCLASSIFIER_FEATURE_COUNT + 1;

	/**
	 * The number of structural features of the '<em>XAssociation Class</em>' class.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 * @ordered
	 */
	int XASSOCIATION_CLASS_FEATURE_COUNT = XCLASSIFIER_FEATURE_COUNT + 2;

	/**
	 * The operation id for the '<em>XNamed Element Name</em>' operation.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 * @ordered
	 */
	int XASSOCIATION_CLASS___XNAMED_ELEMENT_NAME__DIAGNOSTICCHAIN_MAP = XCLASSIFIER___XNAMED_ELEMENT_NAME__DIAGNOSTICCHAIN_MAP;

	/**
	 * The operation id for the '<em>XClassifier Features</em>' operation.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 * @ordered
	 */
	int XASSOCIATION_CLASS___XCLASSIFIER_FEATURES__DIAGNOSTICCHAIN_MAP = XCLASSIFIER___XCLASSIFIER_FEATURES__DIAGNOSTICCHAIN_MAP;

	/**
	 * The operation id for the '<em>XClassifier Nested Classifiers</em>' operation.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 * @ordered
	 */
	int XASSOCIATION_CLASS___XCLASSIFIER_NESTED_CLASSIFIERS__DIAGNOSTICCHAIN_MAP = XCLASSIFIER___XCLASSIFIER_NESTED_CLASSIFIERS__DIAGNOSTICCHAIN_MAP;

	/**
	 * The operation id for the '<em>XClassifier Generals</em>' operation.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 * @ordered
	 */
	int XASSOCIATION_CLASS___XCLASSIFIER_GENERALS__DIAGNOSTICCHAIN_MAP = XCLASSIFIER___XCLASSIFIER_GENERALS__DIAGNOSTICCHAIN_MAP;

	/**
	 * The operation id for the '<em>XClassifier Constraints</em>' operation.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 * @ordered
	 */
	int XASSOCIATION_CLASS___XCLASSIFIER_CONSTRAINTS__DIAGNOSTICCHAIN_MAP = XCLASSIFIER___XCLASSIFIER_CONSTRAINTS__DIAGNOSTICCHAIN_MAP;

	/**
	 * The operation id for the '<em>XAssociation Is Binary</em>' operation.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 * @ordered
	 */
	int XASSOCIATION_CLASS___XASSOCIATION_IS_BINARY__DIAGNOSTICCHAIN_MAP = XCLASSIFIER_OPERATION_COUNT + 0;

	/**
	 * The number of operations of the '<em>XAssociation Class</em>' class.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 * @ordered
	 */
	int XASSOCIATION_CLASS_OPERATION_COUNT = XCLASSIFIER_OPERATION_COUNT + 1;

	/**
	 * The meta object id for the '{@link com.ericsson.executablemodeling.xtuml.profile.executablemodelingprofile.impl.XTriggerImpl <em>XTrigger</em>}' class.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @see com.ericsson.executablemodeling.xtuml.profile.executablemodelingprofile.impl.XTriggerImpl
	 * @see com.ericsson.executablemodeling.xtuml.profile.executablemodelingprofile.impl.ExecutableModelingProfilePackageImpl#getXTrigger()
	 * @generated
	 */
	int XTRIGGER = 23;

	/**
	 * The feature id for the '<em><b>Base Trigger</b></em>' reference.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 * @ordered
	 */
	int XTRIGGER__BASE_TRIGGER = 0;

	/**
	 * The number of structural features of the '<em>XTrigger</em>' class.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 * @ordered
	 */
	int XTRIGGER_FEATURE_COUNT = 1;

	/**
	 * The operation id for the '<em>XTrigger Signal Reception</em>' operation.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 * @ordered
	 */
	int XTRIGGER___XTRIGGER_SIGNAL_RECEPTION__DIAGNOSTICCHAIN_MAP = 0;

	/**
	 * The operation id for the '<em>XTrigger Events</em>' operation.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 * @ordered
	 */
	int XTRIGGER___XTRIGGER_EVENTS__DIAGNOSTICCHAIN_MAP = 1;

	/**
	 * The operation id for the '<em>XTrigger Called Operation</em>' operation.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 * @ordered
	 */
	int XTRIGGER___XTRIGGER_CALLED_OPERATION__DIAGNOSTICCHAIN_MAP = 2;

	/**
	 * The number of operations of the '<em>XTrigger</em>' class.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 * @ordered
	 */
	int XTRIGGER_OPERATION_COUNT = 3;

	/**
	 * The meta object id for the '{@link com.ericsson.executablemodeling.xtuml.profile.executablemodelingprofile.impl.XStateMachineImpl <em>XState Machine</em>}' class.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @see com.ericsson.executablemodeling.xtuml.profile.executablemodelingprofile.impl.XStateMachineImpl
	 * @see com.ericsson.executablemodeling.xtuml.profile.executablemodelingprofile.impl.ExecutableModelingProfilePackageImpl#getXStateMachine()
	 * @generated
	 */
	int XSTATE_MACHINE = 24;

	/**
	 * The feature id for the '<em><b>Base Named Element</b></em>' reference.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 * @ordered
	 */
	int XSTATE_MACHINE__BASE_NAMED_ELEMENT = XBEHAVIOR__BASE_NAMED_ELEMENT;

	/**
	 * The feature id for the '<em><b>Base Namespace</b></em>' reference.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 * @ordered
	 */
	int XSTATE_MACHINE__BASE_NAMESPACE = XBEHAVIOR__BASE_NAMESPACE;

	/**
	 * The feature id for the '<em><b>Base Behavior</b></em>' reference.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 * @ordered
	 */
	int XSTATE_MACHINE__BASE_BEHAVIOR = XBEHAVIOR__BASE_BEHAVIOR;

	/**
	 * The feature id for the '<em><b>Base State Machine</b></em>' reference.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 * @ordered
	 */
	int XSTATE_MACHINE__BASE_STATE_MACHINE = XBEHAVIOR_FEATURE_COUNT + 0;

	/**
	 * The number of structural features of the '<em>XState Machine</em>' class.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 * @ordered
	 */
	int XSTATE_MACHINE_FEATURE_COUNT = XBEHAVIOR_FEATURE_COUNT + 1;

	/**
	 * The operation id for the '<em>XNamed Element Name</em>' operation.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 * @ordered
	 */
	int XSTATE_MACHINE___XNAMED_ELEMENT_NAME__DIAGNOSTICCHAIN_MAP = XBEHAVIOR___XNAMED_ELEMENT_NAME__DIAGNOSTICCHAIN_MAP;

	/**
	 * The operation id for the '<em>XBehavior No Parameter Sets</em>' operation.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 * @ordered
	 */
	int XSTATE_MACHINE___XBEHAVIOR_NO_PARAMETER_SETS__DIAGNOSTICCHAIN_MAP = XBEHAVIOR___XBEHAVIOR_NO_PARAMETER_SETS__DIAGNOSTICCHAIN_MAP;

	/**
	 * The operation id for the '<em>XState Machine One Region</em>' operation.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 * @ordered
	 */
	int XSTATE_MACHINE___XSTATE_MACHINE_ONE_REGION__DIAGNOSTICCHAIN_MAP = XBEHAVIOR_OPERATION_COUNT + 0;

	/**
	 * The operation id for the '<em>XState Machine Initial State</em>' operation.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 * @ordered
	 */
	int XSTATE_MACHINE___XSTATE_MACHINE_INITIAL_STATE__DIAGNOSTICCHAIN_MAP = XBEHAVIOR_OPERATION_COUNT + 1;

	/**
	 * The operation id for the '<em>XState Machine Context</em>' operation.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 * @ordered
	 */
	int XSTATE_MACHINE___XSTATE_MACHINE_CONTEXT__DIAGNOSTICCHAIN_MAP = XBEHAVIOR_OPERATION_COUNT + 2;

	/**
	 * The operation id for the '<em>XState Machine No Parameters</em>' operation.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 * @ordered
	 */
	int XSTATE_MACHINE___XSTATE_MACHINE_NO_PARAMETERS__DIAGNOSTICCHAIN_MAP = XBEHAVIOR_OPERATION_COUNT + 3;

	/**
	 * The operation id for the '<em>XState Machine Regions</em>' operation.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 * @ordered
	 */
	int XSTATE_MACHINE___XSTATE_MACHINE_REGIONS__DIAGNOSTICCHAIN_MAP = XBEHAVIOR_OPERATION_COUNT + 4;

	/**
	 * The number of operations of the '<em>XState Machine</em>' class.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 * @ordered
	 */
	int XSTATE_MACHINE_OPERATION_COUNT = XBEHAVIOR_OPERATION_COUNT + 5;

	/**
	 * The meta object id for the '{@link com.ericsson.executablemodeling.xtuml.profile.executablemodelingprofile.impl.XRegionImpl <em>XRegion</em>}' class.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @see com.ericsson.executablemodeling.xtuml.profile.executablemodelingprofile.impl.XRegionImpl
	 * @see com.ericsson.executablemodeling.xtuml.profile.executablemodelingprofile.impl.ExecutableModelingProfilePackageImpl#getXRegion()
	 * @generated
	 */
	int XREGION = 25;

	/**
	 * The feature id for the '<em><b>Base Region</b></em>' reference.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 * @ordered
	 */
	int XREGION__BASE_REGION = 0;

	/**
	 * The number of structural features of the '<em>XRegion</em>' class.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 * @ordered
	 */
	int XREGION_FEATURE_COUNT = 1;

	/**
	 * The operation id for the '<em>XRegion Subvertexes</em>' operation.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 * @ordered
	 */
	int XREGION___XREGION_SUBVERTEXES__DIAGNOSTICCHAIN_MAP = 0;

	/**
	 * The operation id for the '<em>XRegion Transitions</em>' operation.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 * @ordered
	 */
	int XREGION___XREGION_TRANSITIONS__DIAGNOSTICCHAIN_MAP = 1;

	/**
	 * The number of operations of the '<em>XRegion</em>' class.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 * @ordered
	 */
	int XREGION_OPERATION_COUNT = 2;

	/**
	 * The meta object id for the '{@link com.ericsson.executablemodeling.xtuml.profile.executablemodelingprofile.impl.XVertexImpl <em>XVertex</em>}' class.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @see com.ericsson.executablemodeling.xtuml.profile.executablemodelingprofile.impl.XVertexImpl
	 * @see com.ericsson.executablemodeling.xtuml.profile.executablemodelingprofile.impl.ExecutableModelingProfilePackageImpl#getXVertex()
	 * @generated
	 */
	int XVERTEX = 27;

	/**
	 * The feature id for the '<em><b>Base Vertex</b></em>' reference.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 * @ordered
	 */
	int XVERTEX__BASE_VERTEX = 0;

	/**
	 * The number of structural features of the '<em>XVertex</em>' class.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 * @ordered
	 */
	int XVERTEX_FEATURE_COUNT = 1;

	/**
	 * The number of operations of the '<em>XVertex</em>' class.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 * @ordered
	 */
	int XVERTEX_OPERATION_COUNT = 0;

	/**
	 * The meta object id for the '{@link com.ericsson.executablemodeling.xtuml.profile.executablemodelingprofile.impl.XStateImpl <em>XState</em>}' class.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @see com.ericsson.executablemodeling.xtuml.profile.executablemodelingprofile.impl.XStateImpl
	 * @see com.ericsson.executablemodeling.xtuml.profile.executablemodelingprofile.impl.ExecutableModelingProfilePackageImpl#getXState()
	 * @generated
	 */
	int XSTATE = 26;

	/**
	 * The feature id for the '<em><b>Base Vertex</b></em>' reference.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 * @ordered
	 */
	int XSTATE__BASE_VERTEX = XVERTEX__BASE_VERTEX;

	/**
	 * The feature id for the '<em><b>Base State</b></em>' reference.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 * @ordered
	 */
	int XSTATE__BASE_STATE = XVERTEX_FEATURE_COUNT + 0;

	/**
	 * The number of structural features of the '<em>XState</em>' class.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 * @ordered
	 */
	int XSTATE_FEATURE_COUNT = XVERTEX_FEATURE_COUNT + 1;

	/**
	 * The operation id for the '<em>XState Behaviors</em>' operation.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 * @ordered
	 */
	int XSTATE___XSTATE_BEHAVIORS__DIAGNOSTICCHAIN_MAP = XVERTEX_OPERATION_COUNT + 0;

	/**
	 * The operation id for the '<em>XState No Do Activity</em>' operation.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 * @ordered
	 */
	int XSTATE___XSTATE_NO_DO_ACTIVITY__DIAGNOSTICCHAIN_MAP = XVERTEX_OPERATION_COUNT + 1;

	/**
	 * The operation id for the '<em>XState One Region</em>' operation.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 * @ordered
	 */
	int XSTATE___XSTATE_ONE_REGION__DIAGNOSTICCHAIN_MAP = XVERTEX_OPERATION_COUNT + 2;

	/**
	 * The operation id for the '<em>XState No Submachine</em>' operation.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 * @ordered
	 */
	int XSTATE___XSTATE_NO_SUBMACHINE__DIAGNOSTICCHAIN_MAP = XVERTEX_OPERATION_COUNT + 3;

	/**
	 * The operation id for the '<em>XState Regions</em>' operation.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 * @ordered
	 */
	int XSTATE___XSTATE_REGIONS__DIAGNOSTICCHAIN_MAP = XVERTEX_OPERATION_COUNT + 4;

	/**
	 * The number of operations of the '<em>XState</em>' class.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 * @ordered
	 */
	int XSTATE_OPERATION_COUNT = XVERTEX_OPERATION_COUNT + 5;

	/**
	 * The meta object id for the '{@link com.ericsson.executablemodeling.xtuml.profile.executablemodelingprofile.impl.XPseudostateImpl <em>XPseudostate</em>}' class.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @see com.ericsson.executablemodeling.xtuml.profile.executablemodelingprofile.impl.XPseudostateImpl
	 * @see com.ericsson.executablemodeling.xtuml.profile.executablemodelingprofile.impl.ExecutableModelingProfilePackageImpl#getXPseudostate()
	 * @generated
	 */
	int XPSEUDOSTATE = 28;

	/**
	 * The feature id for the '<em><b>Base Vertex</b></em>' reference.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 * @ordered
	 */
	int XPSEUDOSTATE__BASE_VERTEX = XVERTEX__BASE_VERTEX;

	/**
	 * The feature id for the '<em><b>Base Pseudostate</b></em>' reference.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 * @ordered
	 */
	int XPSEUDOSTATE__BASE_PSEUDOSTATE = XVERTEX_FEATURE_COUNT + 0;

	/**
	 * The number of structural features of the '<em>XPseudostate</em>' class.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 * @ordered
	 */
	int XPSEUDOSTATE_FEATURE_COUNT = XVERTEX_FEATURE_COUNT + 1;

	/**
	 * The operation id for the '<em>XPsuedostate Kind</em>' operation.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 * @ordered
	 */
	int XPSEUDOSTATE___XPSUEDOSTATE_KIND__DIAGNOSTICCHAIN_MAP = XVERTEX_OPERATION_COUNT + 0;

	/**
	 * The number of operations of the '<em>XPseudostate</em>' class.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 * @ordered
	 */
	int XPSEUDOSTATE_OPERATION_COUNT = XVERTEX_OPERATION_COUNT + 1;

	/**
	 * The meta object id for the '{@link com.ericsson.executablemodeling.xtuml.profile.executablemodelingprofile.impl.XTransitionImpl <em>XTransition</em>}' class.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @see com.ericsson.executablemodeling.xtuml.profile.executablemodelingprofile.impl.XTransitionImpl
	 * @see com.ericsson.executablemodeling.xtuml.profile.executablemodelingprofile.impl.ExecutableModelingProfilePackageImpl#getXTransition()
	 * @generated
	 */
	int XTRANSITION = 29;

	/**
	 * The feature id for the '<em><b>Base Transition</b></em>' reference.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 * @ordered
	 */
	int XTRANSITION__BASE_TRANSITION = 0;

	/**
	 * The number of structural features of the '<em>XTransition</em>' class.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 * @ordered
	 */
	int XTRANSITION_FEATURE_COUNT = 1;

	/**
	 * The operation id for the '<em>XTransition Trigger</em>' operation.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 * @ordered
	 */
	int XTRANSITION___XTRANSITION_TRIGGER__DIAGNOSTICCHAIN_MAP = 0;

	/**
	 * The operation id for the '<em>XTransition Guard</em>' operation.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 * @ordered
	 */
	int XTRANSITION___XTRANSITION_GUARD__DIAGNOSTICCHAIN_MAP = 1;

	/**
	 * The operation id for the '<em>XTransition Effect</em>' operation.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 * @ordered
	 */
	int XTRANSITION___XTRANSITION_EFFECT__DIAGNOSTICCHAIN_MAP = 2;

	/**
	 * The number of operations of the '<em>XTransition</em>' class.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 * @ordered
	 */
	int XTRANSITION_OPERATION_COUNT = 3;

	/**
	 * The meta object id for the '{@link com.ericsson.executablemodeling.xtuml.profile.executablemodelingprofile.impl.XActionBehaviorImpl <em>XAction Behavior</em>}' class.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @see com.ericsson.executablemodeling.xtuml.profile.executablemodelingprofile.impl.XActionBehaviorImpl
	 * @see com.ericsson.executablemodeling.xtuml.profile.executablemodelingprofile.impl.ExecutableModelingProfilePackageImpl#getXActionBehavior()
	 * @generated
	 */
	int XACTION_BEHAVIOR = 31;

	/**
	 * The feature id for the '<em><b>Base Named Element</b></em>' reference.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 * @ordered
	 */
	int XACTION_BEHAVIOR__BASE_NAMED_ELEMENT = XBEHAVIOR__BASE_NAMED_ELEMENT;

	/**
	 * The feature id for the '<em><b>Base Namespace</b></em>' reference.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 * @ordered
	 */
	int XACTION_BEHAVIOR__BASE_NAMESPACE = XBEHAVIOR__BASE_NAMESPACE;

	/**
	 * The feature id for the '<em><b>Base Behavior</b></em>' reference.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 * @ordered
	 */
	int XACTION_BEHAVIOR__BASE_BEHAVIOR = XBEHAVIOR__BASE_BEHAVIOR;

	/**
	 * The number of structural features of the '<em>XAction Behavior</em>' class.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 * @ordered
	 */
	int XACTION_BEHAVIOR_FEATURE_COUNT = XBEHAVIOR_FEATURE_COUNT + 0;

	/**
	 * The operation id for the '<em>XNamed Element Name</em>' operation.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 * @ordered
	 */
	int XACTION_BEHAVIOR___XNAMED_ELEMENT_NAME__DIAGNOSTICCHAIN_MAP = XBEHAVIOR___XNAMED_ELEMENT_NAME__DIAGNOSTICCHAIN_MAP;

	/**
	 * The operation id for the '<em>XBehavior No Parameter Sets</em>' operation.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 * @ordered
	 */
	int XACTION_BEHAVIOR___XBEHAVIOR_NO_PARAMETER_SETS__DIAGNOSTICCHAIN_MAP = XBEHAVIOR___XBEHAVIOR_NO_PARAMETER_SETS__DIAGNOSTICCHAIN_MAP;

	/**
	 * The number of operations of the '<em>XAction Behavior</em>' class.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 * @ordered
	 */
	int XACTION_BEHAVIOR_OPERATION_COUNT = XBEHAVIOR_OPERATION_COUNT + 0;

	/**
	 * The meta object id for the '{@link com.ericsson.executablemodeling.xtuml.profile.executablemodelingprofile.impl.XActivityImpl <em>XActivity</em>}' class.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @see com.ericsson.executablemodeling.xtuml.profile.executablemodelingprofile.impl.XActivityImpl
	 * @see com.ericsson.executablemodeling.xtuml.profile.executablemodelingprofile.impl.ExecutableModelingProfilePackageImpl#getXActivity()
	 * @generated
	 */
	int XACTIVITY = 30;

	/**
	 * The feature id for the '<em><b>Base Named Element</b></em>' reference.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 * @ordered
	 */
	int XACTIVITY__BASE_NAMED_ELEMENT = XACTION_BEHAVIOR__BASE_NAMED_ELEMENT;

	/**
	 * The feature id for the '<em><b>Base Namespace</b></em>' reference.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 * @ordered
	 */
	int XACTIVITY__BASE_NAMESPACE = XACTION_BEHAVIOR__BASE_NAMESPACE;

	/**
	 * The feature id for the '<em><b>Base Behavior</b></em>' reference.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 * @ordered
	 */
	int XACTIVITY__BASE_BEHAVIOR = XACTION_BEHAVIOR__BASE_BEHAVIOR;

	/**
	 * The feature id for the '<em><b>Base Activity</b></em>' reference.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 * @ordered
	 */
	int XACTIVITY__BASE_ACTIVITY = XACTION_BEHAVIOR_FEATURE_COUNT + 0;

	/**
	 * The number of structural features of the '<em>XActivity</em>' class.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 * @ordered
	 */
	int XACTIVITY_FEATURE_COUNT = XACTION_BEHAVIOR_FEATURE_COUNT + 1;

	/**
	 * The operation id for the '<em>XNamed Element Name</em>' operation.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 * @ordered
	 */
	int XACTIVITY___XNAMED_ELEMENT_NAME__DIAGNOSTICCHAIN_MAP = XACTION_BEHAVIOR___XNAMED_ELEMENT_NAME__DIAGNOSTICCHAIN_MAP;

	/**
	 * The operation id for the '<em>XBehavior No Parameter Sets</em>' operation.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 * @ordered
	 */
	int XACTIVITY___XBEHAVIOR_NO_PARAMETER_SETS__DIAGNOSTICCHAIN_MAP = XACTION_BEHAVIOR___XBEHAVIOR_NO_PARAMETER_SETS__DIAGNOSTICCHAIN_MAP;

	/**
	 * The operation id for the '<em>XActivity Parameters</em>' operation.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 * @ordered
	 */
	int XACTIVITY___XACTIVITY_PARAMETERS__DIAGNOSTICCHAIN_MAP = XACTION_BEHAVIOR_OPERATION_COUNT + 0;

	/**
	 * The operation id for the '<em>XActivity Textual Representation</em>' operation.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 * @ordered
	 */
	int XACTIVITY___XACTIVITY_TEXTUAL_REPRESENTATION__DIAGNOSTICCHAIN_MAP = XACTION_BEHAVIOR_OPERATION_COUNT + 1;

	/**
	 * The number of operations of the '<em>XActivity</em>' class.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 * @ordered
	 */
	int XACTIVITY_OPERATION_COUNT = XACTION_BEHAVIOR_OPERATION_COUNT + 2;

	/**
	 * The meta object id for the '{@link com.ericsson.executablemodeling.xtuml.profile.executablemodelingprofile.impl.XConstraintImpl <em>XConstraint</em>}' class.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @see com.ericsson.executablemodeling.xtuml.profile.executablemodelingprofile.impl.XConstraintImpl
	 * @see com.ericsson.executablemodeling.xtuml.profile.executablemodelingprofile.impl.ExecutableModelingProfilePackageImpl#getXConstraint()
	 * @generated
	 */
	int XCONSTRAINT = 32;

	/**
	 * The feature id for the '<em><b>Base Named Element</b></em>' reference.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 * @ordered
	 */
	int XCONSTRAINT__BASE_NAMED_ELEMENT = XNAMED_ELEMENT__BASE_NAMED_ELEMENT;

	/**
	 * The feature id for the '<em><b>Base Constraint</b></em>' reference.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 * @ordered
	 */
	int XCONSTRAINT__BASE_CONSTRAINT = XNAMED_ELEMENT_FEATURE_COUNT + 0;

	/**
	 * The number of structural features of the '<em>XConstraint</em>' class.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 * @ordered
	 */
	int XCONSTRAINT_FEATURE_COUNT = XNAMED_ELEMENT_FEATURE_COUNT + 1;

	/**
	 * The operation id for the '<em>XNamed Element Name</em>' operation.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 * @ordered
	 */
	int XCONSTRAINT___XNAMED_ELEMENT_NAME__DIAGNOSTICCHAIN_MAP = XNAMED_ELEMENT___XNAMED_ELEMENT_NAME__DIAGNOSTICCHAIN_MAP;

	/**
	 * The operation id for the '<em>XConstraint Specification</em>' operation.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 * @ordered
	 */
	int XCONSTRAINT___XCONSTRAINT_SPECIFICATION__DIAGNOSTICCHAIN_MAP = XNAMED_ELEMENT_OPERATION_COUNT + 0;

	/**
	 * The operation id for the '<em>XConstraint Behavior</em>' operation.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 * @ordered
	 */
	int XCONSTRAINT___XCONSTRAINT_BEHAVIOR__DIAGNOSTICCHAIN_MAP = XNAMED_ELEMENT_OPERATION_COUNT + 1;

	/**
	 * The number of operations of the '<em>XConstraint</em>' class.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 * @ordered
	 */
	int XCONSTRAINT_OPERATION_COUNT = XNAMED_ELEMENT_OPERATION_COUNT + 2;

	/**
	 * The meta object id for the '{@link com.ericsson.executablemodeling.xtuml.profile.executablemodelingprofile.impl.XOpaqueBehaviorImpl <em>XOpaque Behavior</em>}' class.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @see com.ericsson.executablemodeling.xtuml.profile.executablemodelingprofile.impl.XOpaqueBehaviorImpl
	 * @see com.ericsson.executablemodeling.xtuml.profile.executablemodelingprofile.impl.ExecutableModelingProfilePackageImpl#getXOpaqueBehavior()
	 * @generated
	 */
	int XOPAQUE_BEHAVIOR = 33;

	/**
	 * The feature id for the '<em><b>Base Named Element</b></em>' reference.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 * @ordered
	 */
	int XOPAQUE_BEHAVIOR__BASE_NAMED_ELEMENT = XACTION_BEHAVIOR__BASE_NAMED_ELEMENT;

	/**
	 * The feature id for the '<em><b>Base Namespace</b></em>' reference.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 * @ordered
	 */
	int XOPAQUE_BEHAVIOR__BASE_NAMESPACE = XACTION_BEHAVIOR__BASE_NAMESPACE;

	/**
	 * The feature id for the '<em><b>Base Behavior</b></em>' reference.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 * @ordered
	 */
	int XOPAQUE_BEHAVIOR__BASE_BEHAVIOR = XACTION_BEHAVIOR__BASE_BEHAVIOR;

	/**
	 * The feature id for the '<em><b>Base Opaque Behavior</b></em>' reference.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 * @ordered
	 */
	int XOPAQUE_BEHAVIOR__BASE_OPAQUE_BEHAVIOR = XACTION_BEHAVIOR_FEATURE_COUNT + 0;

	/**
	 * The feature id for the '<em><b>Is External</b></em>' attribute.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 * @ordered
	 */
	int XOPAQUE_BEHAVIOR__IS_EXTERNAL = XACTION_BEHAVIOR_FEATURE_COUNT + 1;

	/**
	 * The number of structural features of the '<em>XOpaque Behavior</em>' class.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 * @ordered
	 */
	int XOPAQUE_BEHAVIOR_FEATURE_COUNT = XACTION_BEHAVIOR_FEATURE_COUNT + 2;

	/**
	 * The operation id for the '<em>XNamed Element Name</em>' operation.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 * @ordered
	 */
	int XOPAQUE_BEHAVIOR___XNAMED_ELEMENT_NAME__DIAGNOSTICCHAIN_MAP = XACTION_BEHAVIOR___XNAMED_ELEMENT_NAME__DIAGNOSTICCHAIN_MAP;

	/**
	 * The operation id for the '<em>XBehavior No Parameter Sets</em>' operation.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 * @ordered
	 */
	int XOPAQUE_BEHAVIOR___XBEHAVIOR_NO_PARAMETER_SETS__DIAGNOSTICCHAIN_MAP = XACTION_BEHAVIOR___XBEHAVIOR_NO_PARAMETER_SETS__DIAGNOSTICCHAIN_MAP;

	/**
	 * The operation id for the '<em>XOpaque Behavior External</em>' operation.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 * @ordered
	 */
	int XOPAQUE_BEHAVIOR___XOPAQUE_BEHAVIOR_EXTERNAL__DIAGNOSTICCHAIN_MAP = XACTION_BEHAVIOR_OPERATION_COUNT + 0;

	/**
	 * The number of operations of the '<em>XOpaque Behavior</em>' class.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 * @ordered
	 */
	int XOPAQUE_BEHAVIOR_OPERATION_COUNT = XACTION_BEHAVIOR_OPERATION_COUNT + 1;

	/**
	 * The meta object id for the '{@link com.ericsson.executablemodeling.xtuml.profile.executablemodelingprofile.impl.XConstrainedTypeImpl <em>XConstrained Type</em>}' class.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @see com.ericsson.executablemodeling.xtuml.profile.executablemodelingprofile.impl.XConstrainedTypeImpl
	 * @see com.ericsson.executablemodeling.xtuml.profile.executablemodelingprofile.impl.ExecutableModelingProfilePackageImpl#getXConstrainedType()
	 * @generated
	 */
	int XCONSTRAINED_TYPE = 34;

	/**
	 * The feature id for the '<em><b>Base Named Element</b></em>' reference.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 * @ordered
	 */
	int XCONSTRAINED_TYPE__BASE_NAMED_ELEMENT = XCLASSIFIER__BASE_NAMED_ELEMENT;

	/**
	 * The feature id for the '<em><b>Base Namespace</b></em>' reference.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 * @ordered
	 */
	int XCONSTRAINED_TYPE__BASE_NAMESPACE = XCLASSIFIER__BASE_NAMESPACE;

	/**
	 * The feature id for the '<em><b>Base Classifier</b></em>' reference.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 * @ordered
	 */
	int XCONSTRAINED_TYPE__BASE_CLASSIFIER = XCLASSIFIER__BASE_CLASSIFIER;

	/**
	 * The feature id for the '<em><b>Base Primitive Type</b></em>' reference.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 * @ordered
	 */
	int XCONSTRAINED_TYPE__BASE_PRIMITIVE_TYPE = XCLASSIFIER_FEATURE_COUNT + 0;

	/**
	 * The feature id for the '<em><b>Lower Bound</b></em>' reference.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 * @ordered
	 */
	int XCONSTRAINED_TYPE__LOWER_BOUND = XCLASSIFIER_FEATURE_COUNT + 1;

	/**
	 * The feature id for the '<em><b>Upper Bound</b></em>' reference.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 * @ordered
	 */
	int XCONSTRAINED_TYPE__UPPER_BOUND = XCLASSIFIER_FEATURE_COUNT + 2;

	/**
	 * The feature id for the '<em><b>Is Lower Bound Exclusive</b></em>' attribute.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 * @ordered
	 */
	int XCONSTRAINED_TYPE__IS_LOWER_BOUND_EXCLUSIVE = XCLASSIFIER_FEATURE_COUNT + 3;

	/**
	 * The feature id for the '<em><b>Is Upper Bound Exclusive</b></em>' attribute.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 * @ordered
	 */
	int XCONSTRAINED_TYPE__IS_UPPER_BOUND_EXCLUSIVE = XCLASSIFIER_FEATURE_COUNT + 4;

	/**
	 * The number of structural features of the '<em>XConstrained Type</em>' class.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 * @ordered
	 */
	int XCONSTRAINED_TYPE_FEATURE_COUNT = XCLASSIFIER_FEATURE_COUNT + 5;

	/**
	 * The operation id for the '<em>XNamed Element Name</em>' operation.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 * @ordered
	 */
	int XCONSTRAINED_TYPE___XNAMED_ELEMENT_NAME__DIAGNOSTICCHAIN_MAP = XCLASSIFIER___XNAMED_ELEMENT_NAME__DIAGNOSTICCHAIN_MAP;

	/**
	 * The operation id for the '<em>XClassifier Features</em>' operation.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 * @ordered
	 */
	int XCONSTRAINED_TYPE___XCLASSIFIER_FEATURES__DIAGNOSTICCHAIN_MAP = XCLASSIFIER___XCLASSIFIER_FEATURES__DIAGNOSTICCHAIN_MAP;

	/**
	 * The operation id for the '<em>XClassifier Nested Classifiers</em>' operation.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 * @ordered
	 */
	int XCONSTRAINED_TYPE___XCLASSIFIER_NESTED_CLASSIFIERS__DIAGNOSTICCHAIN_MAP = XCLASSIFIER___XCLASSIFIER_NESTED_CLASSIFIERS__DIAGNOSTICCHAIN_MAP;

	/**
	 * The operation id for the '<em>XClassifier Generals</em>' operation.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 * @ordered
	 */
	int XCONSTRAINED_TYPE___XCLASSIFIER_GENERALS__DIAGNOSTICCHAIN_MAP = XCLASSIFIER___XCLASSIFIER_GENERALS__DIAGNOSTICCHAIN_MAP;

	/**
	 * The operation id for the '<em>XClassifier Constraints</em>' operation.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 * @ordered
	 */
	int XCONSTRAINED_TYPE___XCLASSIFIER_CONSTRAINTS__DIAGNOSTICCHAIN_MAP = XCLASSIFIER___XCLASSIFIER_CONSTRAINTS__DIAGNOSTICCHAIN_MAP;

	/**
	 * The operation id for the '<em>XConstrained Type Primitive Type</em>' operation.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 * @ordered
	 */
	int XCONSTRAINED_TYPE___XCONSTRAINED_TYPE_PRIMITIVE_TYPE__DIAGNOSTICCHAIN_MAP = XCLASSIFIER_OPERATION_COUNT + 0;

	/**
	 * The operation id for the '<em>XConstrained Type Bounds</em>' operation.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 * @ordered
	 */
	int XCONSTRAINED_TYPE___XCONSTRAINED_TYPE_BOUNDS__DIAGNOSTICCHAIN_MAP = XCLASSIFIER_OPERATION_COUNT + 1;

	/**
	 * The number of operations of the '<em>XConstrained Type</em>' class.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 * @ordered
	 */
	int XCONSTRAINED_TYPE_OPERATION_COUNT = XCLASSIFIER_OPERATION_COUNT + 2;

	/**
	 * The meta object id for the '{@link com.ericsson.executablemodeling.xtuml.profile.executablemodelingprofile.impl.XGeneralizationImpl <em>XGeneralization</em>}' class.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @see com.ericsson.executablemodeling.xtuml.profile.executablemodelingprofile.impl.XGeneralizationImpl
	 * @see com.ericsson.executablemodeling.xtuml.profile.executablemodelingprofile.impl.ExecutableModelingProfilePackageImpl#getXGeneralization()
	 * @generated
	 */
	int XGENERALIZATION = 35;

	/**
	 * The feature id for the '<em><b>Base Generalization</b></em>' reference.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 * @ordered
	 */
	int XGENERALIZATION__BASE_GENERALIZATION = 0;

	/**
	 * The number of structural features of the '<em>XGeneralization</em>' class.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 * @ordered
	 */
	int XGENERALIZATION_FEATURE_COUNT = 1;

	/**
	 * The operation id for the '<em>XGeneralization Classifiers</em>' operation.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 * @ordered
	 */
	int XGENERALIZATION___XGENERALIZATION_CLASSIFIERS__DIAGNOSTICCHAIN_MAP = 0;

	/**
	 * The operation id for the '<em>XGeneralization Generalization Set</em>' operation.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 * @ordered
	 */
	int XGENERALIZATION___XGENERALIZATION_GENERALIZATION_SET__DIAGNOSTICCHAIN_MAP = 1;

	/**
	 * The number of operations of the '<em>XGeneralization</em>' class.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 * @ordered
	 */
	int XGENERALIZATION_OPERATION_COUNT = 2;

	/**
	 * The meta object id for the '{@link com.ericsson.executablemodeling.xtuml.profile.executablemodelingprofile.impl.XGeneralizationSetImpl <em>XGeneralization Set</em>}' class.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @see com.ericsson.executablemodeling.xtuml.profile.executablemodelingprofile.impl.XGeneralizationSetImpl
	 * @see com.ericsson.executablemodeling.xtuml.profile.executablemodelingprofile.impl.ExecutableModelingProfilePackageImpl#getXGeneralizationSet()
	 * @generated
	 */
	int XGENERALIZATION_SET = 36;

	/**
	 * The feature id for the '<em><b>Base Generalization Set</b></em>' reference.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 * @ordered
	 */
	int XGENERALIZATION_SET__BASE_GENERALIZATION_SET = 0;

	/**
	 * The number of structural features of the '<em>XGeneralization Set</em>' class.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 * @ordered
	 */
	int XGENERALIZATION_SET_FEATURE_COUNT = 1;

	/**
	 * The number of operations of the '<em>XGeneralization Set</em>' class.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 * @ordered
	 */
	int XGENERALIZATION_SET_OPERATION_COUNT = 0;

	/**
	 * The meta object id for the '{@link com.ericsson.executablemodeling.xtuml.profile.executablemodelingprofile.impl.XClassImpl <em>XClass</em>}' class.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @see com.ericsson.executablemodeling.xtuml.profile.executablemodelingprofile.impl.XClassImpl
	 * @see com.ericsson.executablemodeling.xtuml.profile.executablemodelingprofile.impl.ExecutableModelingProfilePackageImpl#getXClass()
	 * @generated
	 */
	int XCLASS = 37;

	/**
	 * The feature id for the '<em><b>Base Named Element</b></em>' reference.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 * @ordered
	 */
	int XCLASS__BASE_NAMED_ELEMENT = XCLASSIFIER__BASE_NAMED_ELEMENT;

	/**
	 * The feature id for the '<em><b>Base Namespace</b></em>' reference.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 * @ordered
	 */
	int XCLASS__BASE_NAMESPACE = XCLASSIFIER__BASE_NAMESPACE;

	/**
	 * The feature id for the '<em><b>Base Classifier</b></em>' reference.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 * @ordered
	 */
	int XCLASS__BASE_CLASSIFIER = XCLASSIFIER__BASE_CLASSIFIER;

	/**
	 * The feature id for the '<em><b>Base Class</b></em>' reference.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 * @ordered
	 */
	int XCLASS__BASE_CLASS = XCLASSIFIER_FEATURE_COUNT + 0;

	/**
	 * The feature id for the '<em><b>Is External</b></em>' attribute.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 * @ordered
	 */
	int XCLASS__IS_EXTERNAL = XCLASSIFIER_FEATURE_COUNT + 1;

	/**
	 * The number of structural features of the '<em>XClass</em>' class.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 * @ordered
	 */
	int XCLASS_FEATURE_COUNT = XCLASSIFIER_FEATURE_COUNT + 2;

	/**
	 * The operation id for the '<em>XNamed Element Name</em>' operation.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 * @ordered
	 */
	int XCLASS___XNAMED_ELEMENT_NAME__DIAGNOSTICCHAIN_MAP = XCLASSIFIER___XNAMED_ELEMENT_NAME__DIAGNOSTICCHAIN_MAP;

	/**
	 * The operation id for the '<em>XClassifier Features</em>' operation.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 * @ordered
	 */
	int XCLASS___XCLASSIFIER_FEATURES__DIAGNOSTICCHAIN_MAP = XCLASSIFIER___XCLASSIFIER_FEATURES__DIAGNOSTICCHAIN_MAP;

	/**
	 * The operation id for the '<em>XClassifier Nested Classifiers</em>' operation.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 * @ordered
	 */
	int XCLASS___XCLASSIFIER_NESTED_CLASSIFIERS__DIAGNOSTICCHAIN_MAP = XCLASSIFIER___XCLASSIFIER_NESTED_CLASSIFIERS__DIAGNOSTICCHAIN_MAP;

	/**
	 * The operation id for the '<em>XClassifier Generals</em>' operation.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 * @ordered
	 */
	int XCLASS___XCLASSIFIER_GENERALS__DIAGNOSTICCHAIN_MAP = XCLASSIFIER___XCLASSIFIER_GENERALS__DIAGNOSTICCHAIN_MAP;

	/**
	 * The operation id for the '<em>XClassifier Constraints</em>' operation.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 * @ordered
	 */
	int XCLASS___XCLASSIFIER_CONSTRAINTS__DIAGNOSTICCHAIN_MAP = XCLASSIFIER___XCLASSIFIER_CONSTRAINTS__DIAGNOSTICCHAIN_MAP;

	/**
	 * The operation id for the '<em>XClass Metaclass</em>' operation.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 * @ordered
	 */
	int XCLASS___XCLASS_METACLASS__DIAGNOSTICCHAIN_MAP = XCLASSIFIER_OPERATION_COUNT + 0;

	/**
	 * The operation id for the '<em>XClass Nested Classifiers</em>' operation.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 * @ordered
	 */
	int XCLASS___XCLASS_NESTED_CLASSIFIERS__DIAGNOSTICCHAIN_MAP = XCLASSIFIER_OPERATION_COUNT + 1;

	/**
	 * The operation id for the '<em>XClass External</em>' operation.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 * @ordered
	 */
	int XCLASS___XCLASS_EXTERNAL__DIAGNOSTICCHAIN_MAP = XCLASSIFIER_OPERATION_COUNT + 2;

	/**
	 * The number of operations of the '<em>XClass</em>' class.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 * @ordered
	 */
	int XCLASS_OPERATION_COUNT = XCLASSIFIER_OPERATION_COUNT + 3;

	/**
	 * The meta object id for the '{@link com.ericsson.executablemodeling.xtuml.profile.executablemodelingprofile.impl.XConnectorEndImpl <em>XConnector End</em>}' class.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @see com.ericsson.executablemodeling.xtuml.profile.executablemodelingprofile.impl.XConnectorEndImpl
	 * @see com.ericsson.executablemodeling.xtuml.profile.executablemodelingprofile.impl.ExecutableModelingProfilePackageImpl#getXConnectorEnd()
	 * @generated
	 */
	int XCONNECTOR_END = 38;

	/**
	 * The feature id for the '<em><b>Base Connector End</b></em>' reference.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 * @ordered
	 */
	int XCONNECTOR_END__BASE_CONNECTOR_END = 0;

	/**
	 * The number of structural features of the '<em>XConnector End</em>' class.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 * @ordered
	 */
	int XCONNECTOR_END_FEATURE_COUNT = 1;

	/**
	 * The operation id for the '<em>XConnector End Connector</em>' operation.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 * @ordered
	 */
	int XCONNECTOR_END___XCONNECTOR_END_CONNECTOR__DIAGNOSTICCHAIN_MAP = 0;

	/**
	 * The operation id for the '<em>XConnector End Role</em>' operation.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 * @ordered
	 */
	int XCONNECTOR_END___XCONNECTOR_END_ROLE__DIAGNOSTICCHAIN_MAP = 1;

	/**
	 * The operation id for the '<em>XConnector End Uniqueness</em>' operation.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 * @ordered
	 */
	int XCONNECTOR_END___XCONNECTOR_END_UNIQUENESS__DIAGNOSTICCHAIN_MAP = 2;

	/**
	 * The number of operations of the '<em>XConnector End</em>' class.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 * @ordered
	 */
	int XCONNECTOR_END_OPERATION_COUNT = 3;

	/**
	 * The meta object id for the '{@link com.ericsson.executablemodeling.xtuml.profile.executablemodelingprofile.XMessageKind <em>XMessage Kind</em>}' enum.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @see com.ericsson.executablemodeling.xtuml.profile.executablemodelingprofile.XMessageKind
	 * @see com.ericsson.executablemodeling.xtuml.profile.executablemodelingprofile.impl.ExecutableModelingProfilePackageImpl#getXMessageKind()
	 * @generated
	 */
	int XMESSAGE_KIND = 39;


	/**
	 * Returns the meta object for class '{@link com.ericsson.executablemodeling.xtuml.profile.executablemodelingprofile.XOperation <em>XOperation</em>}'.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @return the meta object for class '<em>XOperation</em>'.
	 * @see com.ericsson.executablemodeling.xtuml.profile.executablemodelingprofile.XOperation
	 * @generated
	 */
	EClass getXOperation();

	/**
	 * Returns the meta object for the reference '{@link com.ericsson.executablemodeling.xtuml.profile.executablemodelingprofile.XOperation#getBase_Operation <em>Base Operation</em>}'.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @return the meta object for the reference '<em>Base Operation</em>'.
	 * @see com.ericsson.executablemodeling.xtuml.profile.executablemodelingprofile.XOperation#getBase_Operation()
	 * @see #getXOperation()
	 * @generated
	 */
	EReference getXOperation_Base_Operation();

	/**
	 * Returns the meta object for the '{@link com.ericsson.executablemodeling.xtuml.profile.executablemodelingprofile.XOperation#xOperationParameters(org.eclipse.emf.common.util.DiagnosticChain, java.util.Map) <em>XOperation Parameters</em>}' operation.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @return the meta object for the '<em>XOperation Parameters</em>' operation.
	 * @see com.ericsson.executablemodeling.xtuml.profile.executablemodelingprofile.XOperation#xOperationParameters(org.eclipse.emf.common.util.DiagnosticChain, java.util.Map)
	 * @generated
	 */
	EOperation getXOperation__XOperationParameters__DiagnosticChain_Map();

	/**
	 * Returns the meta object for the '{@link com.ericsson.executablemodeling.xtuml.profile.executablemodelingprofile.XOperation#xOperationOneMethod(org.eclipse.emf.common.util.DiagnosticChain, java.util.Map) <em>XOperation One Method</em>}' operation.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @return the meta object for the '<em>XOperation One Method</em>' operation.
	 * @see com.ericsson.executablemodeling.xtuml.profile.executablemodelingprofile.XOperation#xOperationOneMethod(org.eclipse.emf.common.util.DiagnosticChain, java.util.Map)
	 * @generated
	 */
	EOperation getXOperation__XOperationOneMethod__DiagnosticChain_Map();

	/**
	 * Returns the meta object for the '{@link com.ericsson.executablemodeling.xtuml.profile.executablemodelingprofile.XOperation#xOperationImports(org.eclipse.emf.common.util.DiagnosticChain, java.util.Map) <em>XOperation Imports</em>}' operation.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @return the meta object for the '<em>XOperation Imports</em>' operation.
	 * @see com.ericsson.executablemodeling.xtuml.profile.executablemodelingprofile.XOperation#xOperationImports(org.eclipse.emf.common.util.DiagnosticChain, java.util.Map)
	 * @generated
	 */
	EOperation getXOperation__XOperationImports__DiagnosticChain_Map();

	/**
	 * Returns the meta object for the '{@link com.ericsson.executablemodeling.xtuml.profile.executablemodelingprofile.XOperation#xOperationOwnedRules(org.eclipse.emf.common.util.DiagnosticChain, java.util.Map) <em>XOperation Owned Rules</em>}' operation.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @return the meta object for the '<em>XOperation Owned Rules</em>' operation.
	 * @see com.ericsson.executablemodeling.xtuml.profile.executablemodelingprofile.XOperation#xOperationOwnedRules(org.eclipse.emf.common.util.DiagnosticChain, java.util.Map)
	 * @generated
	 */
	EOperation getXOperation__XOperationOwnedRules__DiagnosticChain_Map();

	/**
	 * Returns the meta object for the '{@link com.ericsson.executablemodeling.xtuml.profile.executablemodelingprofile.XOperation#xOperationMethods(org.eclipse.emf.common.util.DiagnosticChain, java.util.Map) <em>XOperation Methods</em>}' operation.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @return the meta object for the '<em>XOperation Methods</em>' operation.
	 * @see com.ericsson.executablemodeling.xtuml.profile.executablemodelingprofile.XOperation#xOperationMethods(org.eclipse.emf.common.util.DiagnosticChain, java.util.Map)
	 * @generated
	 */
	EOperation getXOperation__XOperationMethods__DiagnosticChain_Map();

	/**
	 * Returns the meta object for the '{@link com.ericsson.executablemodeling.xtuml.profile.executablemodelingprofile.XOperation#xOperationConstraints(org.eclipse.emf.common.util.DiagnosticChain, java.util.Map) <em>XOperation Constraints</em>}' operation.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @return the meta object for the '<em>XOperation Constraints</em>' operation.
	 * @see com.ericsson.executablemodeling.xtuml.profile.executablemodelingprofile.XOperation#xOperationConstraints(org.eclipse.emf.common.util.DiagnosticChain, java.util.Map)
	 * @generated
	 */
	EOperation getXOperation__XOperationConstraints__DiagnosticChain_Map();

	/**
	 * Returns the meta object for class '{@link com.ericsson.executablemodeling.xtuml.profile.executablemodelingprofile.XNamespace <em>XNamespace</em>}'.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @return the meta object for class '<em>XNamespace</em>'.
	 * @see com.ericsson.executablemodeling.xtuml.profile.executablemodelingprofile.XNamespace
	 * @generated
	 */
	EClass getXNamespace();

	/**
	 * Returns the meta object for the reference '{@link com.ericsson.executablemodeling.xtuml.profile.executablemodelingprofile.XNamespace#getBase_Namespace <em>Base Namespace</em>}'.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @return the meta object for the reference '<em>Base Namespace</em>'.
	 * @see com.ericsson.executablemodeling.xtuml.profile.executablemodelingprofile.XNamespace#getBase_Namespace()
	 * @see #getXNamespace()
	 * @generated
	 */
	EReference getXNamespace_Base_Namespace();

	/**
	 * Returns the meta object for class '{@link com.ericsson.executablemodeling.xtuml.profile.executablemodelingprofile.XNamedElement <em>XNamed Element</em>}'.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @return the meta object for class '<em>XNamed Element</em>'.
	 * @see com.ericsson.executablemodeling.xtuml.profile.executablemodelingprofile.XNamedElement
	 * @generated
	 */
	EClass getXNamedElement();

	/**
	 * Returns the meta object for the reference '{@link com.ericsson.executablemodeling.xtuml.profile.executablemodelingprofile.XNamedElement#getBase_NamedElement <em>Base Named Element</em>}'.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @return the meta object for the reference '<em>Base Named Element</em>'.
	 * @see com.ericsson.executablemodeling.xtuml.profile.executablemodelingprofile.XNamedElement#getBase_NamedElement()
	 * @see #getXNamedElement()
	 * @generated
	 */
	EReference getXNamedElement_Base_NamedElement();

	/**
	 * Returns the meta object for the '{@link com.ericsson.executablemodeling.xtuml.profile.executablemodelingprofile.XNamedElement#xNamedElementName(org.eclipse.emf.common.util.DiagnosticChain, java.util.Map) <em>XNamed Element Name</em>}' operation.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @return the meta object for the '<em>XNamed Element Name</em>' operation.
	 * @see com.ericsson.executablemodeling.xtuml.profile.executablemodelingprofile.XNamedElement#xNamedElementName(org.eclipse.emf.common.util.DiagnosticChain, java.util.Map)
	 * @generated
	 */
	EOperation getXNamedElement__XNamedElementName__DiagnosticChain_Map();

	/**
	 * Returns the meta object for class '{@link com.ericsson.executablemodeling.xtuml.profile.executablemodelingprofile.XFeature <em>XFeature</em>}'.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @return the meta object for class '<em>XFeature</em>'.
	 * @see com.ericsson.executablemodeling.xtuml.profile.executablemodelingprofile.XFeature
	 * @generated
	 */
	EClass getXFeature();

	/**
	 * Returns the meta object for the reference '{@link com.ericsson.executablemodeling.xtuml.profile.executablemodelingprofile.XFeature#getBase_Feature <em>Base Feature</em>}'.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @return the meta object for the reference '<em>Base Feature</em>'.
	 * @see com.ericsson.executablemodeling.xtuml.profile.executablemodelingprofile.XFeature#getBase_Feature()
	 * @see #getXFeature()
	 * @generated
	 */
	EReference getXFeature_Base_Feature();

	/**
	 * Returns the meta object for the '{@link com.ericsson.executablemodeling.xtuml.profile.executablemodelingprofile.XFeature#xFeatureClassifier(org.eclipse.emf.common.util.DiagnosticChain, java.util.Map) <em>XFeature Classifier</em>}' operation.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @return the meta object for the '<em>XFeature Classifier</em>' operation.
	 * @see com.ericsson.executablemodeling.xtuml.profile.executablemodelingprofile.XFeature#xFeatureClassifier(org.eclipse.emf.common.util.DiagnosticChain, java.util.Map)
	 * @generated
	 */
	EOperation getXFeature__XFeatureClassifier__DiagnosticChain_Map();

	/**
	 * Returns the meta object for class '{@link com.ericsson.executablemodeling.xtuml.profile.executablemodelingprofile.XAssociation <em>XAssociation</em>}'.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @return the meta object for class '<em>XAssociation</em>'.
	 * @see com.ericsson.executablemodeling.xtuml.profile.executablemodelingprofile.XAssociation
	 * @generated
	 */
	EClass getXAssociation();

	/**
	 * Returns the meta object for the reference '{@link com.ericsson.executablemodeling.xtuml.profile.executablemodelingprofile.XAssociation#getBase_Association <em>Base Association</em>}'.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @return the meta object for the reference '<em>Base Association</em>'.
	 * @see com.ericsson.executablemodeling.xtuml.profile.executablemodelingprofile.XAssociation#getBase_Association()
	 * @see #getXAssociation()
	 * @generated
	 */
	EReference getXAssociation_Base_Association();

	/**
	 * Returns the meta object for the '{@link com.ericsson.executablemodeling.xtuml.profile.executablemodelingprofile.XAssociation#xAssociationIsBinary(org.eclipse.emf.common.util.DiagnosticChain, java.util.Map) <em>XAssociation Is Binary</em>}' operation.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @return the meta object for the '<em>XAssociation Is Binary</em>' operation.
	 * @see com.ericsson.executablemodeling.xtuml.profile.executablemodelingprofile.XAssociation#xAssociationIsBinary(org.eclipse.emf.common.util.DiagnosticChain, java.util.Map)
	 * @generated
	 */
	EOperation getXAssociation__XAssociationIsBinary__DiagnosticChain_Map();

	/**
	 * Returns the meta object for class '{@link com.ericsson.executablemodeling.xtuml.profile.executablemodelingprofile.XClassifier <em>XClassifier</em>}'.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @return the meta object for class '<em>XClassifier</em>'.
	 * @see com.ericsson.executablemodeling.xtuml.profile.executablemodelingprofile.XClassifier
	 * @generated
	 */
	EClass getXClassifier();

	/**
	 * Returns the meta object for the reference '{@link com.ericsson.executablemodeling.xtuml.profile.executablemodelingprofile.XClassifier#getBase_Classifier <em>Base Classifier</em>}'.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @return the meta object for the reference '<em>Base Classifier</em>'.
	 * @see com.ericsson.executablemodeling.xtuml.profile.executablemodelingprofile.XClassifier#getBase_Classifier()
	 * @see #getXClassifier()
	 * @generated
	 */
	EReference getXClassifier_Base_Classifier();

	/**
	 * Returns the meta object for the '{@link com.ericsson.executablemodeling.xtuml.profile.executablemodelingprofile.XClassifier#xClassifierFeatures(org.eclipse.emf.common.util.DiagnosticChain, java.util.Map) <em>XClassifier Features</em>}' operation.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @return the meta object for the '<em>XClassifier Features</em>' operation.
	 * @see com.ericsson.executablemodeling.xtuml.profile.executablemodelingprofile.XClassifier#xClassifierFeatures(org.eclipse.emf.common.util.DiagnosticChain, java.util.Map)
	 * @generated
	 */
	EOperation getXClassifier__XClassifierFeatures__DiagnosticChain_Map();

	/**
	 * Returns the meta object for the '{@link com.ericsson.executablemodeling.xtuml.profile.executablemodelingprofile.XClassifier#xClassifierNestedClassifiers(org.eclipse.emf.common.util.DiagnosticChain, java.util.Map) <em>XClassifier Nested Classifiers</em>}' operation.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @return the meta object for the '<em>XClassifier Nested Classifiers</em>' operation.
	 * @see com.ericsson.executablemodeling.xtuml.profile.executablemodelingprofile.XClassifier#xClassifierNestedClassifiers(org.eclipse.emf.common.util.DiagnosticChain, java.util.Map)
	 * @generated
	 */
	EOperation getXClassifier__XClassifierNestedClassifiers__DiagnosticChain_Map();

	/**
	 * Returns the meta object for the '{@link com.ericsson.executablemodeling.xtuml.profile.executablemodelingprofile.XClassifier#xClassifierGenerals(org.eclipse.emf.common.util.DiagnosticChain, java.util.Map) <em>XClassifier Generals</em>}' operation.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @return the meta object for the '<em>XClassifier Generals</em>' operation.
	 * @see com.ericsson.executablemodeling.xtuml.profile.executablemodelingprofile.XClassifier#xClassifierGenerals(org.eclipse.emf.common.util.DiagnosticChain, java.util.Map)
	 * @generated
	 */
	EOperation getXClassifier__XClassifierGenerals__DiagnosticChain_Map();

	/**
	 * Returns the meta object for the '{@link com.ericsson.executablemodeling.xtuml.profile.executablemodelingprofile.XClassifier#xClassifierConstraints(org.eclipse.emf.common.util.DiagnosticChain, java.util.Map) <em>XClassifier Constraints</em>}' operation.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @return the meta object for the '<em>XClassifier Constraints</em>' operation.
	 * @see com.ericsson.executablemodeling.xtuml.profile.executablemodelingprofile.XClassifier#xClassifierConstraints(org.eclipse.emf.common.util.DiagnosticChain, java.util.Map)
	 * @generated
	 */
	EOperation getXClassifier__XClassifierConstraints__DiagnosticChain_Map();

	/**
	 * Returns the meta object for class '{@link com.ericsson.executablemodeling.xtuml.profile.executablemodelingprofile.XBehavior <em>XBehavior</em>}'.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @return the meta object for class '<em>XBehavior</em>'.
	 * @see com.ericsson.executablemodeling.xtuml.profile.executablemodelingprofile.XBehavior
	 * @generated
	 */
	EClass getXBehavior();

	/**
	 * Returns the meta object for the reference '{@link com.ericsson.executablemodeling.xtuml.profile.executablemodelingprofile.XBehavior#getBase_Behavior <em>Base Behavior</em>}'.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @return the meta object for the reference '<em>Base Behavior</em>'.
	 * @see com.ericsson.executablemodeling.xtuml.profile.executablemodelingprofile.XBehavior#getBase_Behavior()
	 * @see #getXBehavior()
	 * @generated
	 */
	EReference getXBehavior_Base_Behavior();

	/**
	 * Returns the meta object for the '{@link com.ericsson.executablemodeling.xtuml.profile.executablemodelingprofile.XBehavior#xBehaviorNoParameterSets(org.eclipse.emf.common.util.DiagnosticChain, java.util.Map) <em>XBehavior No Parameter Sets</em>}' operation.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @return the meta object for the '<em>XBehavior No Parameter Sets</em>' operation.
	 * @see com.ericsson.executablemodeling.xtuml.profile.executablemodelingprofile.XBehavior#xBehaviorNoParameterSets(org.eclipse.emf.common.util.DiagnosticChain, java.util.Map)
	 * @generated
	 */
	EOperation getXBehavior__XBehaviorNoParameterSets__DiagnosticChain_Map();

	/**
	 * Returns the meta object for class '{@link com.ericsson.executablemodeling.xtuml.profile.executablemodelingprofile.XEncapsulatedClassifier <em>XEncapsulated Classifier</em>}'.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @return the meta object for class '<em>XEncapsulated Classifier</em>'.
	 * @see com.ericsson.executablemodeling.xtuml.profile.executablemodelingprofile.XEncapsulatedClassifier
	 * @generated
	 */
	EClass getXEncapsulatedClassifier();

	/**
	 * Returns the meta object for the reference '{@link com.ericsson.executablemodeling.xtuml.profile.executablemodelingprofile.XEncapsulatedClassifier#getBase_EncapsulatedClassifier <em>Base Encapsulated Classifier</em>}'.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @return the meta object for the reference '<em>Base Encapsulated Classifier</em>'.
	 * @see com.ericsson.executablemodeling.xtuml.profile.executablemodelingprofile.XEncapsulatedClassifier#getBase_EncapsulatedClassifier()
	 * @see #getXEncapsulatedClassifier()
	 * @generated
	 */
	EReference getXEncapsulatedClassifier_Base_EncapsulatedClassifier();

	/**
	 * Returns the meta object for the attribute '{@link com.ericsson.executablemodeling.xtuml.profile.executablemodelingprofile.XEncapsulatedClassifier#isExternal <em>Is External</em>}'.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @return the meta object for the attribute '<em>Is External</em>'.
	 * @see com.ericsson.executablemodeling.xtuml.profile.executablemodelingprofile.XEncapsulatedClassifier#isExternal()
	 * @see #getXEncapsulatedClassifier()
	 * @generated
	 */
	EAttribute getXEncapsulatedClassifier_IsExternal();

	/**
	 * Returns the meta object for the '{@link com.ericsson.executablemodeling.xtuml.profile.executablemodelingprofile.XEncapsulatedClassifier#xEncapsulatedClassifierPorts(org.eclipse.emf.common.util.DiagnosticChain, java.util.Map) <em>XEncapsulated Classifier Ports</em>}' operation.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @return the meta object for the '<em>XEncapsulated Classifier Ports</em>' operation.
	 * @see com.ericsson.executablemodeling.xtuml.profile.executablemodelingprofile.XEncapsulatedClassifier#xEncapsulatedClassifierPorts(org.eclipse.emf.common.util.DiagnosticChain, java.util.Map)
	 * @generated
	 */
	EOperation getXEncapsulatedClassifier__XEncapsulatedClassifierPorts__DiagnosticChain_Map();

	/**
	 * Returns the meta object for the '{@link com.ericsson.executablemodeling.xtuml.profile.executablemodelingprofile.XEncapsulatedClassifier#xEncapsulatedClassifierconnectors(org.eclipse.emf.common.util.DiagnosticChain, java.util.Map) <em>XEncapsulated Classifierconnectors</em>}' operation.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @return the meta object for the '<em>XEncapsulated Classifierconnectors</em>' operation.
	 * @see com.ericsson.executablemodeling.xtuml.profile.executablemodelingprofile.XEncapsulatedClassifier#xEncapsulatedClassifierconnectors(org.eclipse.emf.common.util.DiagnosticChain, java.util.Map)
	 * @generated
	 */
	EOperation getXEncapsulatedClassifier__XEncapsulatedClassifierconnectors__DiagnosticChain_Map();

	/**
	 * Returns the meta object for the '{@link com.ericsson.executablemodeling.xtuml.profile.executablemodelingprofile.XEncapsulatedClassifier#xEncapsulatedClassifierExternal(org.eclipse.emf.common.util.DiagnosticChain, java.util.Map) <em>XEncapsulated Classifier External</em>}' operation.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @return the meta object for the '<em>XEncapsulated Classifier External</em>' operation.
	 * @see com.ericsson.executablemodeling.xtuml.profile.executablemodelingprofile.XEncapsulatedClassifier#xEncapsulatedClassifierExternal(org.eclipse.emf.common.util.DiagnosticChain, java.util.Map)
	 * @generated
	 */
	EOperation getXEncapsulatedClassifier__XEncapsulatedClassifierExternal__DiagnosticChain_Map();

	/**
	 * Returns the meta object for class '{@link com.ericsson.executablemodeling.xtuml.profile.executablemodelingprofile.XProtocol <em>XProtocol</em>}'.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @return the meta object for class '<em>XProtocol</em>'.
	 * @see com.ericsson.executablemodeling.xtuml.profile.executablemodelingprofile.XProtocol
	 * @generated
	 */
	EClass getXProtocol();

	/**
	 * Returns the meta object for the reference '{@link com.ericsson.executablemodeling.xtuml.profile.executablemodelingprofile.XProtocol#getBase_BehavioredClassifier <em>Base Behaviored Classifier</em>}'.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @return the meta object for the reference '<em>Base Behaviored Classifier</em>'.
	 * @see com.ericsson.executablemodeling.xtuml.profile.executablemodelingprofile.XProtocol#getBase_BehavioredClassifier()
	 * @see #getXProtocol()
	 * @generated
	 */
	EReference getXProtocol_Base_BehavioredClassifier();

	/**
	 * Returns the meta object for the '{@link com.ericsson.executablemodeling.xtuml.profile.executablemodelingprofile.XProtocol#xProtocolIncomingInterface(org.eclipse.emf.common.util.DiagnosticChain, java.util.Map) <em>XProtocol Incoming Interface</em>}' operation.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @return the meta object for the '<em>XProtocol Incoming Interface</em>' operation.
	 * @see com.ericsson.executablemodeling.xtuml.profile.executablemodelingprofile.XProtocol#xProtocolIncomingInterface(org.eclipse.emf.common.util.DiagnosticChain, java.util.Map)
	 * @generated
	 */
	EOperation getXProtocol__XProtocolIncomingInterface__DiagnosticChain_Map();

	/**
	 * Returns the meta object for the '{@link com.ericsson.executablemodeling.xtuml.profile.executablemodelingprofile.XProtocol#xProtocolProtocolContainer(org.eclipse.emf.common.util.DiagnosticChain, java.util.Map) <em>XProtocol Protocol Container</em>}' operation.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @return the meta object for the '<em>XProtocol Protocol Container</em>' operation.
	 * @see com.ericsson.executablemodeling.xtuml.profile.executablemodelingprofile.XProtocol#xProtocolProtocolContainer(org.eclipse.emf.common.util.DiagnosticChain, java.util.Map)
	 * @generated
	 */
	EOperation getXProtocol__XProtocolProtocolContainer__DiagnosticChain_Map();

	/**
	 * Returns the meta object for the '{@link com.ericsson.executablemodeling.xtuml.profile.executablemodelingprofile.XProtocol#xProtocolOutgoingInterface(org.eclipse.emf.common.util.DiagnosticChain, java.util.Map) <em>XProtocol Outgoing Interface</em>}' operation.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @return the meta object for the '<em>XProtocol Outgoing Interface</em>' operation.
	 * @see com.ericsson.executablemodeling.xtuml.profile.executablemodelingprofile.XProtocol#xProtocolOutgoingInterface(org.eclipse.emf.common.util.DiagnosticChain, java.util.Map)
	 * @generated
	 */
	EOperation getXProtocol__XProtocolOutgoingInterface__DiagnosticChain_Map();

	/**
	 * Returns the meta object for the '{@link com.ericsson.executablemodeling.xtuml.profile.executablemodelingprofile.XProtocol#xProtocolSymmetricInterface(org.eclipse.emf.common.util.DiagnosticChain, java.util.Map) <em>XProtocol Symmetric Interface</em>}' operation.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @return the meta object for the '<em>XProtocol Symmetric Interface</em>' operation.
	 * @see com.ericsson.executablemodeling.xtuml.profile.executablemodelingprofile.XProtocol#xProtocolSymmetricInterface(org.eclipse.emf.common.util.DiagnosticChain, java.util.Map)
	 * @generated
	 */
	EOperation getXProtocol__XProtocolSymmetricInterface__DiagnosticChain_Map();

	/**
	 * Returns the meta object for class '{@link com.ericsson.executablemodeling.xtuml.profile.executablemodelingprofile.XSignal <em>XSignal</em>}'.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @return the meta object for class '<em>XSignal</em>'.
	 * @see com.ericsson.executablemodeling.xtuml.profile.executablemodelingprofile.XSignal
	 * @generated
	 */
	EClass getXSignal();

	/**
	 * Returns the meta object for the reference '{@link com.ericsson.executablemodeling.xtuml.profile.executablemodelingprofile.XSignal#getBase_Signal <em>Base Signal</em>}'.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @return the meta object for the reference '<em>Base Signal</em>'.
	 * @see com.ericsson.executablemodeling.xtuml.profile.executablemodelingprofile.XSignal#getBase_Signal()
	 * @see #getXSignal()
	 * @generated
	 */
	EReference getXSignal_Base_Signal();

	/**
	 * Returns the meta object for the '{@link com.ericsson.executablemodeling.xtuml.profile.executablemodelingprofile.XSignal#xSignalVisibility(org.eclipse.emf.common.util.DiagnosticChain, java.util.Map) <em>XSignal Visibility</em>}' operation.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @return the meta object for the '<em>XSignal Visibility</em>' operation.
	 * @see com.ericsson.executablemodeling.xtuml.profile.executablemodelingprofile.XSignal#xSignalVisibility(org.eclipse.emf.common.util.DiagnosticChain, java.util.Map)
	 * @generated
	 */
	EOperation getXSignal__XSignalVisibility__DiagnosticChain_Map();

	/**
	 * Returns the meta object for class '{@link com.ericsson.executablemodeling.xtuml.profile.executablemodelingprofile.XDataType <em>XData Type</em>}'.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @return the meta object for class '<em>XData Type</em>'.
	 * @see com.ericsson.executablemodeling.xtuml.profile.executablemodelingprofile.XDataType
	 * @generated
	 */
	EClass getXDataType();

	/**
	 * Returns the meta object for the reference '{@link com.ericsson.executablemodeling.xtuml.profile.executablemodelingprofile.XDataType#getBase_DataType <em>Base Data Type</em>}'.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @return the meta object for the reference '<em>Base Data Type</em>'.
	 * @see com.ericsson.executablemodeling.xtuml.profile.executablemodelingprofile.XDataType#getBase_DataType()
	 * @see #getXDataType()
	 * @generated
	 */
	EReference getXDataType_Base_DataType();

	/**
	 * Returns the meta object for the '{@link com.ericsson.executablemodeling.xtuml.profile.executablemodelingprofile.XDataType#xDataTypeOperations(org.eclipse.emf.common.util.DiagnosticChain, java.util.Map) <em>XData Type Operations</em>}' operation.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @return the meta object for the '<em>XData Type Operations</em>' operation.
	 * @see com.ericsson.executablemodeling.xtuml.profile.executablemodelingprofile.XDataType#xDataTypeOperations(org.eclipse.emf.common.util.DiagnosticChain, java.util.Map)
	 * @generated
	 */
	EOperation getXDataType__XDataTypeOperations__DiagnosticChain_Map();

	/**
	 * Returns the meta object for class '{@link com.ericsson.executablemodeling.xtuml.profile.executablemodelingprofile.XParameter <em>XParameter</em>}'.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @return the meta object for class '<em>XParameter</em>'.
	 * @see com.ericsson.executablemodeling.xtuml.profile.executablemodelingprofile.XParameter
	 * @generated
	 */
	EClass getXParameter();

	/**
	 * Returns the meta object for the reference '{@link com.ericsson.executablemodeling.xtuml.profile.executablemodelingprofile.XParameter#getBase_Parameter <em>Base Parameter</em>}'.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @return the meta object for the reference '<em>Base Parameter</em>'.
	 * @see com.ericsson.executablemodeling.xtuml.profile.executablemodelingprofile.XParameter#getBase_Parameter()
	 * @see #getXParameter()
	 * @generated
	 */
	EReference getXParameter_Base_Parameter();

	/**
	 * Returns the meta object for class '{@link com.ericsson.executablemodeling.xtuml.profile.executablemodelingprofile.XTypedElement <em>XTyped Element</em>}'.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @return the meta object for class '<em>XTyped Element</em>'.
	 * @see com.ericsson.executablemodeling.xtuml.profile.executablemodelingprofile.XTypedElement
	 * @generated
	 */
	EClass getXTypedElement();

	/**
	 * Returns the meta object for the reference '{@link com.ericsson.executablemodeling.xtuml.profile.executablemodelingprofile.XTypedElement#getBase_TypedElement <em>Base Typed Element</em>}'.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @return the meta object for the reference '<em>Base Typed Element</em>'.
	 * @see com.ericsson.executablemodeling.xtuml.profile.executablemodelingprofile.XTypedElement#getBase_TypedElement()
	 * @see #getXTypedElement()
	 * @generated
	 */
	EReference getXTypedElement_Base_TypedElement();

	/**
	 * Returns the meta object for the '{@link com.ericsson.executablemodeling.xtuml.profile.executablemodelingprofile.XTypedElement#xTypedElementType(org.eclipse.emf.common.util.DiagnosticChain, java.util.Map) <em>XTyped Element Type</em>}' operation.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @return the meta object for the '<em>XTyped Element Type</em>' operation.
	 * @see com.ericsson.executablemodeling.xtuml.profile.executablemodelingprofile.XTypedElement#xTypedElementType(org.eclipse.emf.common.util.DiagnosticChain, java.util.Map)
	 * @generated
	 */
	EOperation getXTypedElement__XTypedElementType__DiagnosticChain_Map();

	/**
	 * Returns the meta object for class '{@link com.ericsson.executablemodeling.xtuml.profile.executablemodelingprofile.XProperty <em>XProperty</em>}'.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @return the meta object for class '<em>XProperty</em>'.
	 * @see com.ericsson.executablemodeling.xtuml.profile.executablemodelingprofile.XProperty
	 * @generated
	 */
	EClass getXProperty();

	/**
	 * Returns the meta object for the reference '{@link com.ericsson.executablemodeling.xtuml.profile.executablemodelingprofile.XProperty#getBase_Property <em>Base Property</em>}'.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @return the meta object for the reference '<em>Base Property</em>'.
	 * @see com.ericsson.executablemodeling.xtuml.profile.executablemodelingprofile.XProperty#getBase_Property()
	 * @see #getXProperty()
	 * @generated
	 */
	EReference getXProperty_Base_Property();

	/**
	 * Returns the meta object for class '{@link com.ericsson.executablemodeling.xtuml.profile.executablemodelingprofile.XMultiplicityElement <em>XMultiplicity Element</em>}'.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @return the meta object for class '<em>XMultiplicity Element</em>'.
	 * @see com.ericsson.executablemodeling.xtuml.profile.executablemodelingprofile.XMultiplicityElement
	 * @generated
	 */
	EClass getXMultiplicityElement();

	/**
	 * Returns the meta object for the reference '{@link com.ericsson.executablemodeling.xtuml.profile.executablemodelingprofile.XMultiplicityElement#getBase_MultiplicityElement <em>Base Multiplicity Element</em>}'.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @return the meta object for the reference '<em>Base Multiplicity Element</em>'.
	 * @see com.ericsson.executablemodeling.xtuml.profile.executablemodelingprofile.XMultiplicityElement#getBase_MultiplicityElement()
	 * @see #getXMultiplicityElement()
	 * @generated
	 */
	EReference getXMultiplicityElement_Base_MultiplicityElement();

	/**
	 * Returns the meta object for the attribute '{@link com.ericsson.executablemodeling.xtuml.profile.executablemodelingprofile.XMultiplicityElement#isOrderedByValue <em>Is Ordered By Value</em>}'.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @return the meta object for the attribute '<em>Is Ordered By Value</em>'.
	 * @see com.ericsson.executablemodeling.xtuml.profile.executablemodelingprofile.XMultiplicityElement#isOrderedByValue()
	 * @see #getXMultiplicityElement()
	 * @generated
	 */
	EAttribute getXMultiplicityElement_IsOrderedByValue();

	/**
	 * Returns the meta object for the reference list '{@link com.ericsson.executablemodeling.xtuml.profile.executablemodelingprofile.XMultiplicityElement#getKey <em>Key</em>}'.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @return the meta object for the reference list '<em>Key</em>'.
	 * @see com.ericsson.executablemodeling.xtuml.profile.executablemodelingprofile.XMultiplicityElement#getKey()
	 * @see #getXMultiplicityElement()
	 * @generated
	 */
	EReference getXMultiplicityElement_Key();

	/**
	 * Returns the meta object for the attribute '{@link com.ericsson.executablemodeling.xtuml.profile.executablemodelingprofile.XMultiplicityElement#isDescending <em>Is Descending</em>}'.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @return the meta object for the attribute '<em>Is Descending</em>'.
	 * @see com.ericsson.executablemodeling.xtuml.profile.executablemodelingprofile.XMultiplicityElement#isDescending()
	 * @see #getXMultiplicityElement()
	 * @generated
	 */
	EAttribute getXMultiplicityElement_IsDescending();

	/**
	 * Returns the meta object for the '{@link com.ericsson.executablemodeling.xtuml.profile.executablemodelingprofile.XMultiplicityElement#xMultiplicityElementIsOrderedByValue(org.eclipse.emf.common.util.DiagnosticChain, java.util.Map) <em>XMultiplicity Element Is Ordered By Value</em>}' operation.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @return the meta object for the '<em>XMultiplicity Element Is Ordered By Value</em>' operation.
	 * @see com.ericsson.executablemodeling.xtuml.profile.executablemodelingprofile.XMultiplicityElement#xMultiplicityElementIsOrderedByValue(org.eclipse.emf.common.util.DiagnosticChain, java.util.Map)
	 * @generated
	 */
	EOperation getXMultiplicityElement__XMultiplicityElementIsOrderedByValue__DiagnosticChain_Map();

	/**
	 * Returns the meta object for the '{@link com.ericsson.executablemodeling.xtuml.profile.executablemodelingprofile.XMultiplicityElement#xMultiplicityElementKeys(org.eclipse.emf.common.util.DiagnosticChain, java.util.Map) <em>XMultiplicity Element Keys</em>}' operation.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @return the meta object for the '<em>XMultiplicity Element Keys</em>' operation.
	 * @see com.ericsson.executablemodeling.xtuml.profile.executablemodelingprofile.XMultiplicityElement#xMultiplicityElementKeys(org.eclipse.emf.common.util.DiagnosticChain, java.util.Map)
	 * @generated
	 */
	EOperation getXMultiplicityElement__XMultiplicityElementKeys__DiagnosticChain_Map();

	/**
	 * Returns the meta object for class '{@link com.ericsson.executablemodeling.xtuml.profile.executablemodelingprofile.XReception <em>XReception</em>}'.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @return the meta object for class '<em>XReception</em>'.
	 * @see com.ericsson.executablemodeling.xtuml.profile.executablemodelingprofile.XReception
	 * @generated
	 */
	EClass getXReception();

	/**
	 * Returns the meta object for the reference '{@link com.ericsson.executablemodeling.xtuml.profile.executablemodelingprofile.XReception#getBase_Reception <em>Base Reception</em>}'.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @return the meta object for the reference '<em>Base Reception</em>'.
	 * @see com.ericsson.executablemodeling.xtuml.profile.executablemodelingprofile.XReception#getBase_Reception()
	 * @see #getXReception()
	 * @generated
	 */
	EReference getXReception_Base_Reception();

	/**
	 * Returns the meta object for the '{@link com.ericsson.executablemodeling.xtuml.profile.executablemodelingprofile.XReception#xReceptionSignal(org.eclipse.emf.common.util.DiagnosticChain, java.util.Map) <em>XReception Signal</em>}' operation.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @return the meta object for the '<em>XReception Signal</em>' operation.
	 * @see com.ericsson.executablemodeling.xtuml.profile.executablemodelingprofile.XReception#xReceptionSignal(org.eclipse.emf.common.util.DiagnosticChain, java.util.Map)
	 * @generated
	 */
	EOperation getXReception__XReceptionSignal__DiagnosticChain_Map();

	/**
	 * Returns the meta object for class '{@link com.ericsson.executablemodeling.xtuml.profile.executablemodelingprofile.XPart <em>XPart</em>}'.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @return the meta object for class '<em>XPart</em>'.
	 * @see com.ericsson.executablemodeling.xtuml.profile.executablemodelingprofile.XPart
	 * @generated
	 */
	EClass getXPart();

	/**
	 * Returns the meta object for the reference '{@link com.ericsson.executablemodeling.xtuml.profile.executablemodelingprofile.XPart#getBase_Property <em>Base Property</em>}'.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @return the meta object for the reference '<em>Base Property</em>'.
	 * @see com.ericsson.executablemodeling.xtuml.profile.executablemodelingprofile.XPart#getBase_Property()
	 * @see #getXPart()
	 * @generated
	 */
	EReference getXPart_Base_Property();

	/**
	 * Returns the meta object for the '{@link com.ericsson.executablemodeling.xtuml.profile.executablemodelingprofile.XPart#xPartClassifier(org.eclipse.emf.common.util.DiagnosticChain, java.util.Map) <em>XPart Classifier</em>}' operation.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @return the meta object for the '<em>XPart Classifier</em>' operation.
	 * @see com.ericsson.executablemodeling.xtuml.profile.executablemodelingprofile.XPart#xPartClassifier(org.eclipse.emf.common.util.DiagnosticChain, java.util.Map)
	 * @generated
	 */
	EOperation getXPart__XPartClassifier__DiagnosticChain_Map();

	/**
	 * Returns the meta object for class '{@link com.ericsson.executablemodeling.xtuml.profile.executablemodelingprofile.XPort <em>XPort</em>}'.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @return the meta object for class '<em>XPort</em>'.
	 * @see com.ericsson.executablemodeling.xtuml.profile.executablemodelingprofile.XPort
	 * @generated
	 */
	EClass getXPort();

	/**
	 * Returns the meta object for the reference '{@link com.ericsson.executablemodeling.xtuml.profile.executablemodelingprofile.XPort#getBase_Port <em>Base Port</em>}'.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @return the meta object for the reference '<em>Base Port</em>'.
	 * @see com.ericsson.executablemodeling.xtuml.profile.executablemodelingprofile.XPort#getBase_Port()
	 * @see #getXPort()
	 * @generated
	 */
	EReference getXPort_Base_Port();

	/**
	 * Returns the meta object for the '{@link com.ericsson.executablemodeling.xtuml.profile.executablemodelingprofile.XPort#xPortClassifier(org.eclipse.emf.common.util.DiagnosticChain, java.util.Map) <em>XPort Classifier</em>}' operation.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @return the meta object for the '<em>XPort Classifier</em>' operation.
	 * @see com.ericsson.executablemodeling.xtuml.profile.executablemodelingprofile.XPort#xPortClassifier(org.eclipse.emf.common.util.DiagnosticChain, java.util.Map)
	 * @generated
	 */
	EOperation getXPort__XPortClassifier__DiagnosticChain_Map();

	/**
	 * Returns the meta object for the '{@link com.ericsson.executablemodeling.xtuml.profile.executablemodelingprofile.XPort#xPortOrderingUniqueness(org.eclipse.emf.common.util.DiagnosticChain, java.util.Map) <em>XPort Ordering Uniqueness</em>}' operation.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @return the meta object for the '<em>XPort Ordering Uniqueness</em>' operation.
	 * @see com.ericsson.executablemodeling.xtuml.profile.executablemodelingprofile.XPort#xPortOrderingUniqueness(org.eclipse.emf.common.util.DiagnosticChain, java.util.Map)
	 * @generated
	 */
	EOperation getXPort__XPortOrderingUniqueness__DiagnosticChain_Map();

	/**
	 * Returns the meta object for the '{@link com.ericsson.executablemodeling.xtuml.profile.executablemodelingprofile.XPort#xPortType(org.eclipse.emf.common.util.DiagnosticChain, java.util.Map) <em>XPort Type</em>}' operation.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @return the meta object for the '<em>XPort Type</em>' operation.
	 * @see com.ericsson.executablemodeling.xtuml.profile.executablemodelingprofile.XPort#xPortType(org.eclipse.emf.common.util.DiagnosticChain, java.util.Map)
	 * @generated
	 */
	EOperation getXPort__XPortType__DiagnosticChain_Map();

	/**
	 * Returns the meta object for the '{@link com.ericsson.executablemodeling.xtuml.profile.executablemodelingprofile.XPort#xPortBehaviorPort(org.eclipse.emf.common.util.DiagnosticChain, java.util.Map) <em>XPort Behavior Port</em>}' operation.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @return the meta object for the '<em>XPort Behavior Port</em>' operation.
	 * @see com.ericsson.executablemodeling.xtuml.profile.executablemodelingprofile.XPort#xPortBehaviorPort(org.eclipse.emf.common.util.DiagnosticChain, java.util.Map)
	 * @generated
	 */
	EOperation getXPort__XPortBehaviorPort__DiagnosticChain_Map();

	/**
	 * Returns the meta object for the '{@link com.ericsson.executablemodeling.xtuml.profile.executablemodelingprofile.XPort#xPortVisibility(org.eclipse.emf.common.util.DiagnosticChain, java.util.Map) <em>XPort Visibility</em>}' operation.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @return the meta object for the '<em>XPort Visibility</em>' operation.
	 * @see com.ericsson.executablemodeling.xtuml.profile.executablemodelingprofile.XPort#xPortVisibility(org.eclipse.emf.common.util.DiagnosticChain, java.util.Map)
	 * @generated
	 */
	EOperation getXPort__XPortVisibility__DiagnosticChain_Map();

	/**
	 * Returns the meta object for class '{@link com.ericsson.executablemodeling.xtuml.profile.executablemodelingprofile.XConnector <em>XConnector</em>}'.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @return the meta object for class '<em>XConnector</em>'.
	 * @see com.ericsson.executablemodeling.xtuml.profile.executablemodelingprofile.XConnector
	 * @generated
	 */
	EClass getXConnector();

	/**
	 * Returns the meta object for the reference '{@link com.ericsson.executablemodeling.xtuml.profile.executablemodelingprofile.XConnector#getBase_Connector <em>Base Connector</em>}'.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @return the meta object for the reference '<em>Base Connector</em>'.
	 * @see com.ericsson.executablemodeling.xtuml.profile.executablemodelingprofile.XConnector#getBase_Connector()
	 * @see #getXConnector()
	 * @generated
	 */
	EReference getXConnector_Base_Connector();

	/**
	 * Returns the meta object for the '{@link com.ericsson.executablemodeling.xtuml.profile.executablemodelingprofile.XConnector#xConnectorClassifier(org.eclipse.emf.common.util.DiagnosticChain, java.util.Map) <em>XConnector Classifier</em>}' operation.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @return the meta object for the '<em>XConnector Classifier</em>' operation.
	 * @see com.ericsson.executablemodeling.xtuml.profile.executablemodelingprofile.XConnector#xConnectorClassifier(org.eclipse.emf.common.util.DiagnosticChain, java.util.Map)
	 * @generated
	 */
	EOperation getXConnector__XConnectorClassifier__DiagnosticChain_Map();

	/**
	 * Returns the meta object for the '{@link com.ericsson.executablemodeling.xtuml.profile.executablemodelingprofile.XConnector#xConnectorEnds(org.eclipse.emf.common.util.DiagnosticChain, java.util.Map) <em>XConnector Ends</em>}' operation.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @return the meta object for the '<em>XConnector Ends</em>' operation.
	 * @see com.ericsson.executablemodeling.xtuml.profile.executablemodelingprofile.XConnector#xConnectorEnds(org.eclipse.emf.common.util.DiagnosticChain, java.util.Map)
	 * @generated
	 */
	EOperation getXConnector__XConnectorEnds__DiagnosticChain_Map();

	/**
	 * Returns the meta object for the '{@link com.ericsson.executablemodeling.xtuml.profile.executablemodelingprofile.XConnector#xtConnectorType(org.eclipse.emf.common.util.DiagnosticChain, java.util.Map) <em>Xt Connector Type</em>}' operation.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @return the meta object for the '<em>Xt Connector Type</em>' operation.
	 * @see com.ericsson.executablemodeling.xtuml.profile.executablemodelingprofile.XConnector#xtConnectorType(org.eclipse.emf.common.util.DiagnosticChain, java.util.Map)
	 * @generated
	 */
	EOperation getXConnector__XtConnectorType__DiagnosticChain_Map();

	/**
	 * Returns the meta object for class '{@link com.ericsson.executablemodeling.xtuml.profile.executablemodelingprofile.XProtocolContainer <em>XProtocol Container</em>}'.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @return the meta object for class '<em>XProtocol Container</em>'.
	 * @see com.ericsson.executablemodeling.xtuml.profile.executablemodelingprofile.XProtocolContainer
	 * @generated
	 */
	EClass getXProtocolContainer();

	/**
	 * Returns the meta object for the reference '{@link com.ericsson.executablemodeling.xtuml.profile.executablemodelingprofile.XProtocolContainer#getBase_Package <em>Base Package</em>}'.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @return the meta object for the reference '<em>Base Package</em>'.
	 * @see com.ericsson.executablemodeling.xtuml.profile.executablemodelingprofile.XProtocolContainer#getBase_Package()
	 * @see #getXProtocolContainer()
	 * @generated
	 */
	EReference getXProtocolContainer_Base_Package();

	/**
	 * Returns the meta object for the '{@link com.ericsson.executablemodeling.xtuml.profile.executablemodelingprofile.XProtocolContainer#xProtocolContainerProtocol(org.eclipse.emf.common.util.DiagnosticChain, java.util.Map) <em>XProtocol Container Protocol</em>}' operation.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @return the meta object for the '<em>XProtocol Container Protocol</em>' operation.
	 * @see com.ericsson.executablemodeling.xtuml.profile.executablemodelingprofile.XProtocolContainer#xProtocolContainerProtocol(org.eclipse.emf.common.util.DiagnosticChain, java.util.Map)
	 * @generated
	 */
	EOperation getXProtocolContainer__XProtocolContainerProtocol__DiagnosticChain_Map();

	/**
	 * Returns the meta object for class '{@link com.ericsson.executablemodeling.xtuml.profile.executablemodelingprofile.XMessageSet <em>XMessage Set</em>}'.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @return the meta object for class '<em>XMessage Set</em>'.
	 * @see com.ericsson.executablemodeling.xtuml.profile.executablemodelingprofile.XMessageSet
	 * @generated
	 */
	EClass getXMessageSet();

	/**
	 * Returns the meta object for the reference '{@link com.ericsson.executablemodeling.xtuml.profile.executablemodelingprofile.XMessageSet#getBase_Interface <em>Base Interface</em>}'.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @return the meta object for the reference '<em>Base Interface</em>'.
	 * @see com.ericsson.executablemodeling.xtuml.profile.executablemodelingprofile.XMessageSet#getBase_Interface()
	 * @see #getXMessageSet()
	 * @generated
	 */
	EReference getXMessageSet_Base_Interface();

	/**
	 * Returns the meta object for the attribute '{@link com.ericsson.executablemodeling.xtuml.profile.executablemodelingprofile.XMessageSet#getMessageKind <em>Message Kind</em>}'.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @return the meta object for the attribute '<em>Message Kind</em>'.
	 * @see com.ericsson.executablemodeling.xtuml.profile.executablemodelingprofile.XMessageSet#getMessageKind()
	 * @see #getXMessageSet()
	 * @generated
	 */
	EAttribute getXMessageSet_MessageKind();

	/**
	 * Returns the meta object for the '{@link com.ericsson.executablemodeling.xtuml.profile.executablemodelingprofile.XMessageSet#xMessageSetIncoming(org.eclipse.emf.common.util.DiagnosticChain, java.util.Map) <em>XMessage Set Incoming</em>}' operation.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @return the meta object for the '<em>XMessage Set Incoming</em>' operation.
	 * @see com.ericsson.executablemodeling.xtuml.profile.executablemodelingprofile.XMessageSet#xMessageSetIncoming(org.eclipse.emf.common.util.DiagnosticChain, java.util.Map)
	 * @generated
	 */
	EOperation getXMessageSet__XMessageSetIncoming__DiagnosticChain_Map();

	/**
	 * Returns the meta object for the '{@link com.ericsson.executablemodeling.xtuml.profile.executablemodelingprofile.XMessageSet#xMessageSetOutgoing(org.eclipse.emf.common.util.DiagnosticChain, java.util.Map) <em>XMessage Set Outgoing</em>}' operation.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @return the meta object for the '<em>XMessage Set Outgoing</em>' operation.
	 * @see com.ericsson.executablemodeling.xtuml.profile.executablemodelingprofile.XMessageSet#xMessageSetOutgoing(org.eclipse.emf.common.util.DiagnosticChain, java.util.Map)
	 * @generated
	 */
	EOperation getXMessageSet__XMessageSetOutgoing__DiagnosticChain_Map();

	/**
	 * Returns the meta object for the '{@link com.ericsson.executablemodeling.xtuml.profile.executablemodelingprofile.XMessageSet#xMessageSetSymmetric(org.eclipse.emf.common.util.DiagnosticChain, java.util.Map) <em>XMessage Set Symmetric</em>}' operation.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @return the meta object for the '<em>XMessage Set Symmetric</em>' operation.
	 * @see com.ericsson.executablemodeling.xtuml.profile.executablemodelingprofile.XMessageSet#xMessageSetSymmetric(org.eclipse.emf.common.util.DiagnosticChain, java.util.Map)
	 * @generated
	 */
	EOperation getXMessageSet__XMessageSetSymmetric__DiagnosticChain_Map();

	/**
	 * Returns the meta object for class '{@link com.ericsson.executablemodeling.xtuml.profile.executablemodelingprofile.XEnumeration <em>XEnumeration</em>}'.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @return the meta object for class '<em>XEnumeration</em>'.
	 * @see com.ericsson.executablemodeling.xtuml.profile.executablemodelingprofile.XEnumeration
	 * @generated
	 */
	EClass getXEnumeration();

	/**
	 * Returns the meta object for the reference '{@link com.ericsson.executablemodeling.xtuml.profile.executablemodelingprofile.XEnumeration#getBase_Enumeration <em>Base Enumeration</em>}'.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @return the meta object for the reference '<em>Base Enumeration</em>'.
	 * @see com.ericsson.executablemodeling.xtuml.profile.executablemodelingprofile.XEnumeration#getBase_Enumeration()
	 * @see #getXEnumeration()
	 * @generated
	 */
	EReference getXEnumeration_Base_Enumeration();

	/**
	 * Returns the meta object for the '{@link com.ericsson.executablemodeling.xtuml.profile.executablemodelingprofile.XEnumeration#xEnumerationAttributes(org.eclipse.emf.common.util.DiagnosticChain, java.util.Map) <em>XEnumeration Attributes</em>}' operation.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @return the meta object for the '<em>XEnumeration Attributes</em>' operation.
	 * @see com.ericsson.executablemodeling.xtuml.profile.executablemodelingprofile.XEnumeration#xEnumerationAttributes(org.eclipse.emf.common.util.DiagnosticChain, java.util.Map)
	 * @generated
	 */
	EOperation getXEnumeration__XEnumerationAttributes__DiagnosticChain_Map();

	/**
	 * Returns the meta object for class '{@link com.ericsson.executablemodeling.xtuml.profile.executablemodelingprofile.XAssociationClass <em>XAssociation Class</em>}'.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @return the meta object for class '<em>XAssociation Class</em>'.
	 * @see com.ericsson.executablemodeling.xtuml.profile.executablemodelingprofile.XAssociationClass
	 * @generated
	 */
	EClass getXAssociationClass();

	/**
	 * Returns the meta object for the reference '{@link com.ericsson.executablemodeling.xtuml.profile.executablemodelingprofile.XAssociationClass#getBase_AssociationClass <em>Base Association Class</em>}'.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @return the meta object for the reference '<em>Base Association Class</em>'.
	 * @see com.ericsson.executablemodeling.xtuml.profile.executablemodelingprofile.XAssociationClass#getBase_AssociationClass()
	 * @see #getXAssociationClass()
	 * @generated
	 */
	EReference getXAssociationClass_Base_AssociationClass();

	/**
	 * Returns the meta object for class '{@link com.ericsson.executablemodeling.xtuml.profile.executablemodelingprofile.XTrigger <em>XTrigger</em>}'.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @return the meta object for class '<em>XTrigger</em>'.
	 * @see com.ericsson.executablemodeling.xtuml.profile.executablemodelingprofile.XTrigger
	 * @generated
	 */
	EClass getXTrigger();

	/**
	 * Returns the meta object for the reference '{@link com.ericsson.executablemodeling.xtuml.profile.executablemodelingprofile.XTrigger#getBase_Trigger <em>Base Trigger</em>}'.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @return the meta object for the reference '<em>Base Trigger</em>'.
	 * @see com.ericsson.executablemodeling.xtuml.profile.executablemodelingprofile.XTrigger#getBase_Trigger()
	 * @see #getXTrigger()
	 * @generated
	 */
	EReference getXTrigger_Base_Trigger();

	/**
	 * Returns the meta object for the '{@link com.ericsson.executablemodeling.xtuml.profile.executablemodelingprofile.XTrigger#xTriggerSignalReception(org.eclipse.emf.common.util.DiagnosticChain, java.util.Map) <em>XTrigger Signal Reception</em>}' operation.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @return the meta object for the '<em>XTrigger Signal Reception</em>' operation.
	 * @see com.ericsson.executablemodeling.xtuml.profile.executablemodelingprofile.XTrigger#xTriggerSignalReception(org.eclipse.emf.common.util.DiagnosticChain, java.util.Map)
	 * @generated
	 */
	EOperation getXTrigger__XTriggerSignalReception__DiagnosticChain_Map();

	/**
	 * Returns the meta object for the '{@link com.ericsson.executablemodeling.xtuml.profile.executablemodelingprofile.XTrigger#xTriggerEvents(org.eclipse.emf.common.util.DiagnosticChain, java.util.Map) <em>XTrigger Events</em>}' operation.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @return the meta object for the '<em>XTrigger Events</em>' operation.
	 * @see com.ericsson.executablemodeling.xtuml.profile.executablemodelingprofile.XTrigger#xTriggerEvents(org.eclipse.emf.common.util.DiagnosticChain, java.util.Map)
	 * @generated
	 */
	EOperation getXTrigger__XTriggerEvents__DiagnosticChain_Map();

	/**
	 * Returns the meta object for the '{@link com.ericsson.executablemodeling.xtuml.profile.executablemodelingprofile.XTrigger#xTriggerCalledOperation(org.eclipse.emf.common.util.DiagnosticChain, java.util.Map) <em>XTrigger Called Operation</em>}' operation.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @return the meta object for the '<em>XTrigger Called Operation</em>' operation.
	 * @see com.ericsson.executablemodeling.xtuml.profile.executablemodelingprofile.XTrigger#xTriggerCalledOperation(org.eclipse.emf.common.util.DiagnosticChain, java.util.Map)
	 * @generated
	 */
	EOperation getXTrigger__XTriggerCalledOperation__DiagnosticChain_Map();

	/**
	 * Returns the meta object for class '{@link com.ericsson.executablemodeling.xtuml.profile.executablemodelingprofile.XStateMachine <em>XState Machine</em>}'.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @return the meta object for class '<em>XState Machine</em>'.
	 * @see com.ericsson.executablemodeling.xtuml.profile.executablemodelingprofile.XStateMachine
	 * @generated
	 */
	EClass getXStateMachine();

	/**
	 * Returns the meta object for the reference '{@link com.ericsson.executablemodeling.xtuml.profile.executablemodelingprofile.XStateMachine#getBase_StateMachine <em>Base State Machine</em>}'.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @return the meta object for the reference '<em>Base State Machine</em>'.
	 * @see com.ericsson.executablemodeling.xtuml.profile.executablemodelingprofile.XStateMachine#getBase_StateMachine()
	 * @see #getXStateMachine()
	 * @generated
	 */
	EReference getXStateMachine_Base_StateMachine();

	/**
	 * Returns the meta object for the '{@link com.ericsson.executablemodeling.xtuml.profile.executablemodelingprofile.XStateMachine#xStateMachineOneRegion(org.eclipse.emf.common.util.DiagnosticChain, java.util.Map) <em>XState Machine One Region</em>}' operation.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @return the meta object for the '<em>XState Machine One Region</em>' operation.
	 * @see com.ericsson.executablemodeling.xtuml.profile.executablemodelingprofile.XStateMachine#xStateMachineOneRegion(org.eclipse.emf.common.util.DiagnosticChain, java.util.Map)
	 * @generated
	 */
	EOperation getXStateMachine__XStateMachineOneRegion__DiagnosticChain_Map();

	/**
	 * Returns the meta object for the '{@link com.ericsson.executablemodeling.xtuml.profile.executablemodelingprofile.XStateMachine#xStateMachineInitialState(org.eclipse.emf.common.util.DiagnosticChain, java.util.Map) <em>XState Machine Initial State</em>}' operation.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @return the meta object for the '<em>XState Machine Initial State</em>' operation.
	 * @see com.ericsson.executablemodeling.xtuml.profile.executablemodelingprofile.XStateMachine#xStateMachineInitialState(org.eclipse.emf.common.util.DiagnosticChain, java.util.Map)
	 * @generated
	 */
	EOperation getXStateMachine__XStateMachineInitialState__DiagnosticChain_Map();

	/**
	 * Returns the meta object for the '{@link com.ericsson.executablemodeling.xtuml.profile.executablemodelingprofile.XStateMachine#xStateMachineContext(org.eclipse.emf.common.util.DiagnosticChain, java.util.Map) <em>XState Machine Context</em>}' operation.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @return the meta object for the '<em>XState Machine Context</em>' operation.
	 * @see com.ericsson.executablemodeling.xtuml.profile.executablemodelingprofile.XStateMachine#xStateMachineContext(org.eclipse.emf.common.util.DiagnosticChain, java.util.Map)
	 * @generated
	 */
	EOperation getXStateMachine__XStateMachineContext__DiagnosticChain_Map();

	/**
	 * Returns the meta object for the '{@link com.ericsson.executablemodeling.xtuml.profile.executablemodelingprofile.XStateMachine#xStateMachineNoParameters(org.eclipse.emf.common.util.DiagnosticChain, java.util.Map) <em>XState Machine No Parameters</em>}' operation.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @return the meta object for the '<em>XState Machine No Parameters</em>' operation.
	 * @see com.ericsson.executablemodeling.xtuml.profile.executablemodelingprofile.XStateMachine#xStateMachineNoParameters(org.eclipse.emf.common.util.DiagnosticChain, java.util.Map)
	 * @generated
	 */
	EOperation getXStateMachine__XStateMachineNoParameters__DiagnosticChain_Map();

	/**
	 * Returns the meta object for the '{@link com.ericsson.executablemodeling.xtuml.profile.executablemodelingprofile.XStateMachine#xStateMachineRegions(org.eclipse.emf.common.util.DiagnosticChain, java.util.Map) <em>XState Machine Regions</em>}' operation.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @return the meta object for the '<em>XState Machine Regions</em>' operation.
	 * @see com.ericsson.executablemodeling.xtuml.profile.executablemodelingprofile.XStateMachine#xStateMachineRegions(org.eclipse.emf.common.util.DiagnosticChain, java.util.Map)
	 * @generated
	 */
	EOperation getXStateMachine__XStateMachineRegions__DiagnosticChain_Map();

	/**
	 * Returns the meta object for class '{@link com.ericsson.executablemodeling.xtuml.profile.executablemodelingprofile.XRegion <em>XRegion</em>}'.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @return the meta object for class '<em>XRegion</em>'.
	 * @see com.ericsson.executablemodeling.xtuml.profile.executablemodelingprofile.XRegion
	 * @generated
	 */
	EClass getXRegion();

	/**
	 * Returns the meta object for the reference '{@link com.ericsson.executablemodeling.xtuml.profile.executablemodelingprofile.XRegion#getBase_Region <em>Base Region</em>}'.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @return the meta object for the reference '<em>Base Region</em>'.
	 * @see com.ericsson.executablemodeling.xtuml.profile.executablemodelingprofile.XRegion#getBase_Region()
	 * @see #getXRegion()
	 * @generated
	 */
	EReference getXRegion_Base_Region();

	/**
	 * Returns the meta object for the '{@link com.ericsson.executablemodeling.xtuml.profile.executablemodelingprofile.XRegion#xRegionSubvertexes(org.eclipse.emf.common.util.DiagnosticChain, java.util.Map) <em>XRegion Subvertexes</em>}' operation.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @return the meta object for the '<em>XRegion Subvertexes</em>' operation.
	 * @see com.ericsson.executablemodeling.xtuml.profile.executablemodelingprofile.XRegion#xRegionSubvertexes(org.eclipse.emf.common.util.DiagnosticChain, java.util.Map)
	 * @generated
	 */
	EOperation getXRegion__XRegionSubvertexes__DiagnosticChain_Map();

	/**
	 * Returns the meta object for the '{@link com.ericsson.executablemodeling.xtuml.profile.executablemodelingprofile.XRegion#xRegionTransitions(org.eclipse.emf.common.util.DiagnosticChain, java.util.Map) <em>XRegion Transitions</em>}' operation.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @return the meta object for the '<em>XRegion Transitions</em>' operation.
	 * @see com.ericsson.executablemodeling.xtuml.profile.executablemodelingprofile.XRegion#xRegionTransitions(org.eclipse.emf.common.util.DiagnosticChain, java.util.Map)
	 * @generated
	 */
	EOperation getXRegion__XRegionTransitions__DiagnosticChain_Map();

	/**
	 * Returns the meta object for class '{@link com.ericsson.executablemodeling.xtuml.profile.executablemodelingprofile.XState <em>XState</em>}'.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @return the meta object for class '<em>XState</em>'.
	 * @see com.ericsson.executablemodeling.xtuml.profile.executablemodelingprofile.XState
	 * @generated
	 */
	EClass getXState();

	/**
	 * Returns the meta object for the reference '{@link com.ericsson.executablemodeling.xtuml.profile.executablemodelingprofile.XState#getBase_State <em>Base State</em>}'.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @return the meta object for the reference '<em>Base State</em>'.
	 * @see com.ericsson.executablemodeling.xtuml.profile.executablemodelingprofile.XState#getBase_State()
	 * @see #getXState()
	 * @generated
	 */
	EReference getXState_Base_State();

	/**
	 * Returns the meta object for the '{@link com.ericsson.executablemodeling.xtuml.profile.executablemodelingprofile.XState#xStateBehaviors(org.eclipse.emf.common.util.DiagnosticChain, java.util.Map) <em>XState Behaviors</em>}' operation.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @return the meta object for the '<em>XState Behaviors</em>' operation.
	 * @see com.ericsson.executablemodeling.xtuml.profile.executablemodelingprofile.XState#xStateBehaviors(org.eclipse.emf.common.util.DiagnosticChain, java.util.Map)
	 * @generated
	 */
	EOperation getXState__XStateBehaviors__DiagnosticChain_Map();

	/**
	 * Returns the meta object for the '{@link com.ericsson.executablemodeling.xtuml.profile.executablemodelingprofile.XState#xStateNoDoActivity(org.eclipse.emf.common.util.DiagnosticChain, java.util.Map) <em>XState No Do Activity</em>}' operation.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @return the meta object for the '<em>XState No Do Activity</em>' operation.
	 * @see com.ericsson.executablemodeling.xtuml.profile.executablemodelingprofile.XState#xStateNoDoActivity(org.eclipse.emf.common.util.DiagnosticChain, java.util.Map)
	 * @generated
	 */
	EOperation getXState__XStateNoDoActivity__DiagnosticChain_Map();

	/**
	 * Returns the meta object for the '{@link com.ericsson.executablemodeling.xtuml.profile.executablemodelingprofile.XState#xStateOneRegion(org.eclipse.emf.common.util.DiagnosticChain, java.util.Map) <em>XState One Region</em>}' operation.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @return the meta object for the '<em>XState One Region</em>' operation.
	 * @see com.ericsson.executablemodeling.xtuml.profile.executablemodelingprofile.XState#xStateOneRegion(org.eclipse.emf.common.util.DiagnosticChain, java.util.Map)
	 * @generated
	 */
	EOperation getXState__XStateOneRegion__DiagnosticChain_Map();

	/**
	 * Returns the meta object for the '{@link com.ericsson.executablemodeling.xtuml.profile.executablemodelingprofile.XState#xStateNoSubmachine(org.eclipse.emf.common.util.DiagnosticChain, java.util.Map) <em>XState No Submachine</em>}' operation.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @return the meta object for the '<em>XState No Submachine</em>' operation.
	 * @see com.ericsson.executablemodeling.xtuml.profile.executablemodelingprofile.XState#xStateNoSubmachine(org.eclipse.emf.common.util.DiagnosticChain, java.util.Map)
	 * @generated
	 */
	EOperation getXState__XStateNoSubmachine__DiagnosticChain_Map();

	/**
	 * Returns the meta object for the '{@link com.ericsson.executablemodeling.xtuml.profile.executablemodelingprofile.XState#xStateRegions(org.eclipse.emf.common.util.DiagnosticChain, java.util.Map) <em>XState Regions</em>}' operation.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @return the meta object for the '<em>XState Regions</em>' operation.
	 * @see com.ericsson.executablemodeling.xtuml.profile.executablemodelingprofile.XState#xStateRegions(org.eclipse.emf.common.util.DiagnosticChain, java.util.Map)
	 * @generated
	 */
	EOperation getXState__XStateRegions__DiagnosticChain_Map();

	/**
	 * Returns the meta object for class '{@link com.ericsson.executablemodeling.xtuml.profile.executablemodelingprofile.XVertex <em>XVertex</em>}'.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @return the meta object for class '<em>XVertex</em>'.
	 * @see com.ericsson.executablemodeling.xtuml.profile.executablemodelingprofile.XVertex
	 * @generated
	 */
	EClass getXVertex();

	/**
	 * Returns the meta object for the reference '{@link com.ericsson.executablemodeling.xtuml.profile.executablemodelingprofile.XVertex#getBase_Vertex <em>Base Vertex</em>}'.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @return the meta object for the reference '<em>Base Vertex</em>'.
	 * @see com.ericsson.executablemodeling.xtuml.profile.executablemodelingprofile.XVertex#getBase_Vertex()
	 * @see #getXVertex()
	 * @generated
	 */
	EReference getXVertex_Base_Vertex();

	/**
	 * Returns the meta object for class '{@link com.ericsson.executablemodeling.xtuml.profile.executablemodelingprofile.XPseudostate <em>XPseudostate</em>}'.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @return the meta object for class '<em>XPseudostate</em>'.
	 * @see com.ericsson.executablemodeling.xtuml.profile.executablemodelingprofile.XPseudostate
	 * @generated
	 */
	EClass getXPseudostate();

	/**
	 * Returns the meta object for the reference '{@link com.ericsson.executablemodeling.xtuml.profile.executablemodelingprofile.XPseudostate#getBase_Pseudostate <em>Base Pseudostate</em>}'.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @return the meta object for the reference '<em>Base Pseudostate</em>'.
	 * @see com.ericsson.executablemodeling.xtuml.profile.executablemodelingprofile.XPseudostate#getBase_Pseudostate()
	 * @see #getXPseudostate()
	 * @generated
	 */
	EReference getXPseudostate_Base_Pseudostate();

	/**
	 * Returns the meta object for the '{@link com.ericsson.executablemodeling.xtuml.profile.executablemodelingprofile.XPseudostate#xPsuedostateKind(org.eclipse.emf.common.util.DiagnosticChain, java.util.Map) <em>XPsuedostate Kind</em>}' operation.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @return the meta object for the '<em>XPsuedostate Kind</em>' operation.
	 * @see com.ericsson.executablemodeling.xtuml.profile.executablemodelingprofile.XPseudostate#xPsuedostateKind(org.eclipse.emf.common.util.DiagnosticChain, java.util.Map)
	 * @generated
	 */
	EOperation getXPseudostate__XPsuedostateKind__DiagnosticChain_Map();

	/**
	 * Returns the meta object for class '{@link com.ericsson.executablemodeling.xtuml.profile.executablemodelingprofile.XTransition <em>XTransition</em>}'.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @return the meta object for class '<em>XTransition</em>'.
	 * @see com.ericsson.executablemodeling.xtuml.profile.executablemodelingprofile.XTransition
	 * @generated
	 */
	EClass getXTransition();

	/**
	 * Returns the meta object for the reference '{@link com.ericsson.executablemodeling.xtuml.profile.executablemodelingprofile.XTransition#getBase_Transition <em>Base Transition</em>}'.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @return the meta object for the reference '<em>Base Transition</em>'.
	 * @see com.ericsson.executablemodeling.xtuml.profile.executablemodelingprofile.XTransition#getBase_Transition()
	 * @see #getXTransition()
	 * @generated
	 */
	EReference getXTransition_Base_Transition();

	/**
	 * Returns the meta object for the '{@link com.ericsson.executablemodeling.xtuml.profile.executablemodelingprofile.XTransition#xTransitionTrigger(org.eclipse.emf.common.util.DiagnosticChain, java.util.Map) <em>XTransition Trigger</em>}' operation.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @return the meta object for the '<em>XTransition Trigger</em>' operation.
	 * @see com.ericsson.executablemodeling.xtuml.profile.executablemodelingprofile.XTransition#xTransitionTrigger(org.eclipse.emf.common.util.DiagnosticChain, java.util.Map)
	 * @generated
	 */
	EOperation getXTransition__XTransitionTrigger__DiagnosticChain_Map();

	/**
	 * Returns the meta object for the '{@link com.ericsson.executablemodeling.xtuml.profile.executablemodelingprofile.XTransition#xTransitionGuard(org.eclipse.emf.common.util.DiagnosticChain, java.util.Map) <em>XTransition Guard</em>}' operation.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @return the meta object for the '<em>XTransition Guard</em>' operation.
	 * @see com.ericsson.executablemodeling.xtuml.profile.executablemodelingprofile.XTransition#xTransitionGuard(org.eclipse.emf.common.util.DiagnosticChain, java.util.Map)
	 * @generated
	 */
	EOperation getXTransition__XTransitionGuard__DiagnosticChain_Map();

	/**
	 * Returns the meta object for the '{@link com.ericsson.executablemodeling.xtuml.profile.executablemodelingprofile.XTransition#xTransitionEffect(org.eclipse.emf.common.util.DiagnosticChain, java.util.Map) <em>XTransition Effect</em>}' operation.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @return the meta object for the '<em>XTransition Effect</em>' operation.
	 * @see com.ericsson.executablemodeling.xtuml.profile.executablemodelingprofile.XTransition#xTransitionEffect(org.eclipse.emf.common.util.DiagnosticChain, java.util.Map)
	 * @generated
	 */
	EOperation getXTransition__XTransitionEffect__DiagnosticChain_Map();

	/**
	 * Returns the meta object for class '{@link com.ericsson.executablemodeling.xtuml.profile.executablemodelingprofile.XActivity <em>XActivity</em>}'.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @return the meta object for class '<em>XActivity</em>'.
	 * @see com.ericsson.executablemodeling.xtuml.profile.executablemodelingprofile.XActivity
	 * @generated
	 */
	EClass getXActivity();

	/**
	 * Returns the meta object for the reference '{@link com.ericsson.executablemodeling.xtuml.profile.executablemodelingprofile.XActivity#getBase_Activity <em>Base Activity</em>}'.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @return the meta object for the reference '<em>Base Activity</em>'.
	 * @see com.ericsson.executablemodeling.xtuml.profile.executablemodelingprofile.XActivity#getBase_Activity()
	 * @see #getXActivity()
	 * @generated
	 */
	EReference getXActivity_Base_Activity();

	/**
	 * Returns the meta object for the '{@link com.ericsson.executablemodeling.xtuml.profile.executablemodelingprofile.XActivity#xActivityParameters(org.eclipse.emf.common.util.DiagnosticChain, java.util.Map) <em>XActivity Parameters</em>}' operation.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @return the meta object for the '<em>XActivity Parameters</em>' operation.
	 * @see com.ericsson.executablemodeling.xtuml.profile.executablemodelingprofile.XActivity#xActivityParameters(org.eclipse.emf.common.util.DiagnosticChain, java.util.Map)
	 * @generated
	 */
	EOperation getXActivity__XActivityParameters__DiagnosticChain_Map();

	/**
	 * Returns the meta object for the '{@link com.ericsson.executablemodeling.xtuml.profile.executablemodelingprofile.XActivity#xActivityTextualRepresentation(org.eclipse.emf.common.util.DiagnosticChain, java.util.Map) <em>XActivity Textual Representation</em>}' operation.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @return the meta object for the '<em>XActivity Textual Representation</em>' operation.
	 * @see com.ericsson.executablemodeling.xtuml.profile.executablemodelingprofile.XActivity#xActivityTextualRepresentation(org.eclipse.emf.common.util.DiagnosticChain, java.util.Map)
	 * @generated
	 */
	EOperation getXActivity__XActivityTextualRepresentation__DiagnosticChain_Map();

	/**
	 * Returns the meta object for class '{@link com.ericsson.executablemodeling.xtuml.profile.executablemodelingprofile.XActionBehavior <em>XAction Behavior</em>}'.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @return the meta object for class '<em>XAction Behavior</em>'.
	 * @see com.ericsson.executablemodeling.xtuml.profile.executablemodelingprofile.XActionBehavior
	 * @generated
	 */
	EClass getXActionBehavior();

	/**
	 * Returns the meta object for class '{@link com.ericsson.executablemodeling.xtuml.profile.executablemodelingprofile.XConstraint <em>XConstraint</em>}'.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @return the meta object for class '<em>XConstraint</em>'.
	 * @see com.ericsson.executablemodeling.xtuml.profile.executablemodelingprofile.XConstraint
	 * @generated
	 */
	EClass getXConstraint();

	/**
	 * Returns the meta object for the reference '{@link com.ericsson.executablemodeling.xtuml.profile.executablemodelingprofile.XConstraint#getBase_Constraint <em>Base Constraint</em>}'.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @return the meta object for the reference '<em>Base Constraint</em>'.
	 * @see com.ericsson.executablemodeling.xtuml.profile.executablemodelingprofile.XConstraint#getBase_Constraint()
	 * @see #getXConstraint()
	 * @generated
	 */
	EReference getXConstraint_Base_Constraint();

	/**
	 * Returns the meta object for the '{@link com.ericsson.executablemodeling.xtuml.profile.executablemodelingprofile.XConstraint#xConstraintSpecification(org.eclipse.emf.common.util.DiagnosticChain, java.util.Map) <em>XConstraint Specification</em>}' operation.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @return the meta object for the '<em>XConstraint Specification</em>' operation.
	 * @see com.ericsson.executablemodeling.xtuml.profile.executablemodelingprofile.XConstraint#xConstraintSpecification(org.eclipse.emf.common.util.DiagnosticChain, java.util.Map)
	 * @generated
	 */
	EOperation getXConstraint__XConstraintSpecification__DiagnosticChain_Map();

	/**
	 * Returns the meta object for the '{@link com.ericsson.executablemodeling.xtuml.profile.executablemodelingprofile.XConstraint#xConstraintBehavior(org.eclipse.emf.common.util.DiagnosticChain, java.util.Map) <em>XConstraint Behavior</em>}' operation.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @return the meta object for the '<em>XConstraint Behavior</em>' operation.
	 * @see com.ericsson.executablemodeling.xtuml.profile.executablemodelingprofile.XConstraint#xConstraintBehavior(org.eclipse.emf.common.util.DiagnosticChain, java.util.Map)
	 * @generated
	 */
	EOperation getXConstraint__XConstraintBehavior__DiagnosticChain_Map();

	/**
	 * Returns the meta object for class '{@link com.ericsson.executablemodeling.xtuml.profile.executablemodelingprofile.XOpaqueBehavior <em>XOpaque Behavior</em>}'.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @return the meta object for class '<em>XOpaque Behavior</em>'.
	 * @see com.ericsson.executablemodeling.xtuml.profile.executablemodelingprofile.XOpaqueBehavior
	 * @generated
	 */
	EClass getXOpaqueBehavior();

	/**
	 * Returns the meta object for the reference '{@link com.ericsson.executablemodeling.xtuml.profile.executablemodelingprofile.XOpaqueBehavior#getBase_OpaqueBehavior <em>Base Opaque Behavior</em>}'.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @return the meta object for the reference '<em>Base Opaque Behavior</em>'.
	 * @see com.ericsson.executablemodeling.xtuml.profile.executablemodelingprofile.XOpaqueBehavior#getBase_OpaqueBehavior()
	 * @see #getXOpaqueBehavior()
	 * @generated
	 */
	EReference getXOpaqueBehavior_Base_OpaqueBehavior();

	/**
	 * Returns the meta object for the attribute '{@link com.ericsson.executablemodeling.xtuml.profile.executablemodelingprofile.XOpaqueBehavior#isExternal <em>Is External</em>}'.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @return the meta object for the attribute '<em>Is External</em>'.
	 * @see com.ericsson.executablemodeling.xtuml.profile.executablemodelingprofile.XOpaqueBehavior#isExternal()
	 * @see #getXOpaqueBehavior()
	 * @generated
	 */
	EAttribute getXOpaqueBehavior_IsExternal();

	/**
	 * Returns the meta object for the '{@link com.ericsson.executablemodeling.xtuml.profile.executablemodelingprofile.XOpaqueBehavior#xOpaqueBehaviorExternal(org.eclipse.emf.common.util.DiagnosticChain, java.util.Map) <em>XOpaque Behavior External</em>}' operation.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @return the meta object for the '<em>XOpaque Behavior External</em>' operation.
	 * @see com.ericsson.executablemodeling.xtuml.profile.executablemodelingprofile.XOpaqueBehavior#xOpaqueBehaviorExternal(org.eclipse.emf.common.util.DiagnosticChain, java.util.Map)
	 * @generated
	 */
	EOperation getXOpaqueBehavior__XOpaqueBehaviorExternal__DiagnosticChain_Map();

	/**
	 * Returns the meta object for class '{@link com.ericsson.executablemodeling.xtuml.profile.executablemodelingprofile.XConstrainedType <em>XConstrained Type</em>}'.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @return the meta object for class '<em>XConstrained Type</em>'.
	 * @see com.ericsson.executablemodeling.xtuml.profile.executablemodelingprofile.XConstrainedType
	 * @generated
	 */
	EClass getXConstrainedType();

	/**
	 * Returns the meta object for the reference '{@link com.ericsson.executablemodeling.xtuml.profile.executablemodelingprofile.XConstrainedType#getBase_PrimitiveType <em>Base Primitive Type</em>}'.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @return the meta object for the reference '<em>Base Primitive Type</em>'.
	 * @see com.ericsson.executablemodeling.xtuml.profile.executablemodelingprofile.XConstrainedType#getBase_PrimitiveType()
	 * @see #getXConstrainedType()
	 * @generated
	 */
	EReference getXConstrainedType_Base_PrimitiveType();

	/**
	 * Returns the meta object for the reference '{@link com.ericsson.executablemodeling.xtuml.profile.executablemodelingprofile.XConstrainedType#getLowerBound <em>Lower Bound</em>}'.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @return the meta object for the reference '<em>Lower Bound</em>'.
	 * @see com.ericsson.executablemodeling.xtuml.profile.executablemodelingprofile.XConstrainedType#getLowerBound()
	 * @see #getXConstrainedType()
	 * @generated
	 */
	EReference getXConstrainedType_LowerBound();

	/**
	 * Returns the meta object for the reference '{@link com.ericsson.executablemodeling.xtuml.profile.executablemodelingprofile.XConstrainedType#getUpperBound <em>Upper Bound</em>}'.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @return the meta object for the reference '<em>Upper Bound</em>'.
	 * @see com.ericsson.executablemodeling.xtuml.profile.executablemodelingprofile.XConstrainedType#getUpperBound()
	 * @see #getXConstrainedType()
	 * @generated
	 */
	EReference getXConstrainedType_UpperBound();

	/**
	 * Returns the meta object for the attribute '{@link com.ericsson.executablemodeling.xtuml.profile.executablemodelingprofile.XConstrainedType#isLowerBoundExclusive <em>Is Lower Bound Exclusive</em>}'.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @return the meta object for the attribute '<em>Is Lower Bound Exclusive</em>'.
	 * @see com.ericsson.executablemodeling.xtuml.profile.executablemodelingprofile.XConstrainedType#isLowerBoundExclusive()
	 * @see #getXConstrainedType()
	 * @generated
	 */
	EAttribute getXConstrainedType_IsLowerBoundExclusive();

	/**
	 * Returns the meta object for the attribute '{@link com.ericsson.executablemodeling.xtuml.profile.executablemodelingprofile.XConstrainedType#isUpperBoundExclusive <em>Is Upper Bound Exclusive</em>}'.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @return the meta object for the attribute '<em>Is Upper Bound Exclusive</em>'.
	 * @see com.ericsson.executablemodeling.xtuml.profile.executablemodelingprofile.XConstrainedType#isUpperBoundExclusive()
	 * @see #getXConstrainedType()
	 * @generated
	 */
	EAttribute getXConstrainedType_IsUpperBoundExclusive();

	/**
	 * Returns the meta object for the '{@link com.ericsson.executablemodeling.xtuml.profile.executablemodelingprofile.XConstrainedType#xConstrainedTypePrimitiveType(org.eclipse.emf.common.util.DiagnosticChain, java.util.Map) <em>XConstrained Type Primitive Type</em>}' operation.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @return the meta object for the '<em>XConstrained Type Primitive Type</em>' operation.
	 * @see com.ericsson.executablemodeling.xtuml.profile.executablemodelingprofile.XConstrainedType#xConstrainedTypePrimitiveType(org.eclipse.emf.common.util.DiagnosticChain, java.util.Map)
	 * @generated
	 */
	EOperation getXConstrainedType__XConstrainedTypePrimitiveType__DiagnosticChain_Map();

	/**
	 * Returns the meta object for the '{@link com.ericsson.executablemodeling.xtuml.profile.executablemodelingprofile.XConstrainedType#xConstrainedTypeBounds(org.eclipse.emf.common.util.DiagnosticChain, java.util.Map) <em>XConstrained Type Bounds</em>}' operation.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @return the meta object for the '<em>XConstrained Type Bounds</em>' operation.
	 * @see com.ericsson.executablemodeling.xtuml.profile.executablemodelingprofile.XConstrainedType#xConstrainedTypeBounds(org.eclipse.emf.common.util.DiagnosticChain, java.util.Map)
	 * @generated
	 */
	EOperation getXConstrainedType__XConstrainedTypeBounds__DiagnosticChain_Map();

	/**
	 * Returns the meta object for class '{@link com.ericsson.executablemodeling.xtuml.profile.executablemodelingprofile.XGeneralization <em>XGeneralization</em>}'.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @return the meta object for class '<em>XGeneralization</em>'.
	 * @see com.ericsson.executablemodeling.xtuml.profile.executablemodelingprofile.XGeneralization
	 * @generated
	 */
	EClass getXGeneralization();

	/**
	 * Returns the meta object for the reference '{@link com.ericsson.executablemodeling.xtuml.profile.executablemodelingprofile.XGeneralization#getBase_Generalization <em>Base Generalization</em>}'.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @return the meta object for the reference '<em>Base Generalization</em>'.
	 * @see com.ericsson.executablemodeling.xtuml.profile.executablemodelingprofile.XGeneralization#getBase_Generalization()
	 * @see #getXGeneralization()
	 * @generated
	 */
	EReference getXGeneralization_Base_Generalization();

	/**
	 * Returns the meta object for the '{@link com.ericsson.executablemodeling.xtuml.profile.executablemodelingprofile.XGeneralization#xGeneralizationClassifiers(org.eclipse.emf.common.util.DiagnosticChain, java.util.Map) <em>XGeneralization Classifiers</em>}' operation.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @return the meta object for the '<em>XGeneralization Classifiers</em>' operation.
	 * @see com.ericsson.executablemodeling.xtuml.profile.executablemodelingprofile.XGeneralization#xGeneralizationClassifiers(org.eclipse.emf.common.util.DiagnosticChain, java.util.Map)
	 * @generated
	 */
	EOperation getXGeneralization__XGeneralizationClassifiers__DiagnosticChain_Map();

	/**
	 * Returns the meta object for the '{@link com.ericsson.executablemodeling.xtuml.profile.executablemodelingprofile.XGeneralization#xGeneralizationGeneralizationSet(org.eclipse.emf.common.util.DiagnosticChain, java.util.Map) <em>XGeneralization Generalization Set</em>}' operation.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @return the meta object for the '<em>XGeneralization Generalization Set</em>' operation.
	 * @see com.ericsson.executablemodeling.xtuml.profile.executablemodelingprofile.XGeneralization#xGeneralizationGeneralizationSet(org.eclipse.emf.common.util.DiagnosticChain, java.util.Map)
	 * @generated
	 */
	EOperation getXGeneralization__XGeneralizationGeneralizationSet__DiagnosticChain_Map();

	/**
	 * Returns the meta object for class '{@link com.ericsson.executablemodeling.xtuml.profile.executablemodelingprofile.XGeneralizationSet <em>XGeneralization Set</em>}'.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @return the meta object for class '<em>XGeneralization Set</em>'.
	 * @see com.ericsson.executablemodeling.xtuml.profile.executablemodelingprofile.XGeneralizationSet
	 * @generated
	 */
	EClass getXGeneralizationSet();

	/**
	 * Returns the meta object for the reference '{@link com.ericsson.executablemodeling.xtuml.profile.executablemodelingprofile.XGeneralizationSet#getBase_GeneralizationSet <em>Base Generalization Set</em>}'.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @return the meta object for the reference '<em>Base Generalization Set</em>'.
	 * @see com.ericsson.executablemodeling.xtuml.profile.executablemodelingprofile.XGeneralizationSet#getBase_GeneralizationSet()
	 * @see #getXGeneralizationSet()
	 * @generated
	 */
	EReference getXGeneralizationSet_Base_GeneralizationSet();

	/**
	 * Returns the meta object for class '{@link com.ericsson.executablemodeling.xtuml.profile.executablemodelingprofile.XClass <em>XClass</em>}'.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @return the meta object for class '<em>XClass</em>'.
	 * @see com.ericsson.executablemodeling.xtuml.profile.executablemodelingprofile.XClass
	 * @generated
	 */
	EClass getXClass();

	/**
	 * Returns the meta object for the reference '{@link com.ericsson.executablemodeling.xtuml.profile.executablemodelingprofile.XClass#getBase_Class <em>Base Class</em>}'.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @return the meta object for the reference '<em>Base Class</em>'.
	 * @see com.ericsson.executablemodeling.xtuml.profile.executablemodelingprofile.XClass#getBase_Class()
	 * @see #getXClass()
	 * @generated
	 */
	EReference getXClass_Base_Class();

	/**
	 * Returns the meta object for the attribute '{@link com.ericsson.executablemodeling.xtuml.profile.executablemodelingprofile.XClass#isExternal <em>Is External</em>}'.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @return the meta object for the attribute '<em>Is External</em>'.
	 * @see com.ericsson.executablemodeling.xtuml.profile.executablemodelingprofile.XClass#isExternal()
	 * @see #getXClass()
	 * @generated
	 */
	EAttribute getXClass_IsExternal();

	/**
	 * Returns the meta object for the '{@link com.ericsson.executablemodeling.xtuml.profile.executablemodelingprofile.XClass#xClassMetaclass(org.eclipse.emf.common.util.DiagnosticChain, java.util.Map) <em>XClass Metaclass</em>}' operation.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @return the meta object for the '<em>XClass Metaclass</em>' operation.
	 * @see com.ericsson.executablemodeling.xtuml.profile.executablemodelingprofile.XClass#xClassMetaclass(org.eclipse.emf.common.util.DiagnosticChain, java.util.Map)
	 * @generated
	 */
	EOperation getXClass__XClassMetaclass__DiagnosticChain_Map();

	/**
	 * Returns the meta object for the '{@link com.ericsson.executablemodeling.xtuml.profile.executablemodelingprofile.XClass#xClassNestedClassifiers(org.eclipse.emf.common.util.DiagnosticChain, java.util.Map) <em>XClass Nested Classifiers</em>}' operation.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @return the meta object for the '<em>XClass Nested Classifiers</em>' operation.
	 * @see com.ericsson.executablemodeling.xtuml.profile.executablemodelingprofile.XClass#xClassNestedClassifiers(org.eclipse.emf.common.util.DiagnosticChain, java.util.Map)
	 * @generated
	 */
	EOperation getXClass__XClassNestedClassifiers__DiagnosticChain_Map();

	/**
	 * Returns the meta object for the '{@link com.ericsson.executablemodeling.xtuml.profile.executablemodelingprofile.XClass#xClassExternal(org.eclipse.emf.common.util.DiagnosticChain, java.util.Map) <em>XClass External</em>}' operation.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @return the meta object for the '<em>XClass External</em>' operation.
	 * @see com.ericsson.executablemodeling.xtuml.profile.executablemodelingprofile.XClass#xClassExternal(org.eclipse.emf.common.util.DiagnosticChain, java.util.Map)
	 * @generated
	 */
	EOperation getXClass__XClassExternal__DiagnosticChain_Map();

	/**
	 * Returns the meta object for class '{@link com.ericsson.executablemodeling.xtuml.profile.executablemodelingprofile.XConnectorEnd <em>XConnector End</em>}'.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @return the meta object for class '<em>XConnector End</em>'.
	 * @see com.ericsson.executablemodeling.xtuml.profile.executablemodelingprofile.XConnectorEnd
	 * @generated
	 */
	EClass getXConnectorEnd();

	/**
	 * Returns the meta object for the reference '{@link com.ericsson.executablemodeling.xtuml.profile.executablemodelingprofile.XConnectorEnd#getBase_ConnectorEnd <em>Base Connector End</em>}'.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @return the meta object for the reference '<em>Base Connector End</em>'.
	 * @see com.ericsson.executablemodeling.xtuml.profile.executablemodelingprofile.XConnectorEnd#getBase_ConnectorEnd()
	 * @see #getXConnectorEnd()
	 * @generated
	 */
	EReference getXConnectorEnd_Base_ConnectorEnd();

	/**
	 * Returns the meta object for the '{@link com.ericsson.executablemodeling.xtuml.profile.executablemodelingprofile.XConnectorEnd#xConnectorEndConnector(org.eclipse.emf.common.util.DiagnosticChain, java.util.Map) <em>XConnector End Connector</em>}' operation.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @return the meta object for the '<em>XConnector End Connector</em>' operation.
	 * @see com.ericsson.executablemodeling.xtuml.profile.executablemodelingprofile.XConnectorEnd#xConnectorEndConnector(org.eclipse.emf.common.util.DiagnosticChain, java.util.Map)
	 * @generated
	 */
	EOperation getXConnectorEnd__XConnectorEndConnector__DiagnosticChain_Map();

	/**
	 * Returns the meta object for the '{@link com.ericsson.executablemodeling.xtuml.profile.executablemodelingprofile.XConnectorEnd#xConnectorEndRole(org.eclipse.emf.common.util.DiagnosticChain, java.util.Map) <em>XConnector End Role</em>}' operation.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @return the meta object for the '<em>XConnector End Role</em>' operation.
	 * @see com.ericsson.executablemodeling.xtuml.profile.executablemodelingprofile.XConnectorEnd#xConnectorEndRole(org.eclipse.emf.common.util.DiagnosticChain, java.util.Map)
	 * @generated
	 */
	EOperation getXConnectorEnd__XConnectorEndRole__DiagnosticChain_Map();

	/**
	 * Returns the meta object for the '{@link com.ericsson.executablemodeling.xtuml.profile.executablemodelingprofile.XConnectorEnd#xConnectorEndUniqueness(org.eclipse.emf.common.util.DiagnosticChain, java.util.Map) <em>XConnector End Uniqueness</em>}' operation.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @return the meta object for the '<em>XConnector End Uniqueness</em>' operation.
	 * @see com.ericsson.executablemodeling.xtuml.profile.executablemodelingprofile.XConnectorEnd#xConnectorEndUniqueness(org.eclipse.emf.common.util.DiagnosticChain, java.util.Map)
	 * @generated
	 */
	EOperation getXConnectorEnd__XConnectorEndUniqueness__DiagnosticChain_Map();

	/**
	 * Returns the meta object for enum '{@link com.ericsson.executablemodeling.xtuml.profile.executablemodelingprofile.XMessageKind <em>XMessage Kind</em>}'.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @return the meta object for enum '<em>XMessage Kind</em>'.
	 * @see com.ericsson.executablemodeling.xtuml.profile.executablemodelingprofile.XMessageKind
	 * @generated
	 */
	EEnum getXMessageKind();

	/**
	 * Returns the factory that creates the instances of the model.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @return the factory that creates the instances of the model.
	 * @generated
	 */
	ExecutableModelingProfileFactory getExecutableModelingProfileFactory();

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
		 * The meta object literal for the '{@link com.ericsson.executablemodeling.xtuml.profile.executablemodelingprofile.impl.XOperationImpl <em>XOperation</em>}' class.
		 * <!-- begin-user-doc -->
		 * <!-- end-user-doc -->
		 * @see com.ericsson.executablemodeling.xtuml.profile.executablemodelingprofile.impl.XOperationImpl
		 * @see com.ericsson.executablemodeling.xtuml.profile.executablemodelingprofile.impl.ExecutableModelingProfilePackageImpl#getXOperation()
		 * @generated
		 */
		EClass XOPERATION = eINSTANCE.getXOperation();

		/**
		 * The meta object literal for the '<em><b>Base Operation</b></em>' reference feature.
		 * <!-- begin-user-doc -->
		 * <!-- end-user-doc -->
		 * @generated
		 */
		EReference XOPERATION__BASE_OPERATION = eINSTANCE.getXOperation_Base_Operation();

		/**
		 * The meta object literal for the '<em><b>XOperation Parameters</b></em>' operation.
		 * <!-- begin-user-doc -->
		 * <!-- end-user-doc -->
		 * @generated
		 */
		EOperation XOPERATION___XOPERATION_PARAMETERS__DIAGNOSTICCHAIN_MAP = eINSTANCE.getXOperation__XOperationParameters__DiagnosticChain_Map();

		/**
		 * The meta object literal for the '<em><b>XOperation One Method</b></em>' operation.
		 * <!-- begin-user-doc -->
		 * <!-- end-user-doc -->
		 * @generated
		 */
		EOperation XOPERATION___XOPERATION_ONE_METHOD__DIAGNOSTICCHAIN_MAP = eINSTANCE.getXOperation__XOperationOneMethod__DiagnosticChain_Map();

		/**
		 * The meta object literal for the '<em><b>XOperation Imports</b></em>' operation.
		 * <!-- begin-user-doc -->
		 * <!-- end-user-doc -->
		 * @generated
		 */
		EOperation XOPERATION___XOPERATION_IMPORTS__DIAGNOSTICCHAIN_MAP = eINSTANCE.getXOperation__XOperationImports__DiagnosticChain_Map();

		/**
		 * The meta object literal for the '<em><b>XOperation Owned Rules</b></em>' operation.
		 * <!-- begin-user-doc -->
		 * <!-- end-user-doc -->
		 * @generated
		 */
		EOperation XOPERATION___XOPERATION_OWNED_RULES__DIAGNOSTICCHAIN_MAP = eINSTANCE.getXOperation__XOperationOwnedRules__DiagnosticChain_Map();

		/**
		 * The meta object literal for the '<em><b>XOperation Methods</b></em>' operation.
		 * <!-- begin-user-doc -->
		 * <!-- end-user-doc -->
		 * @generated
		 */
		EOperation XOPERATION___XOPERATION_METHODS__DIAGNOSTICCHAIN_MAP = eINSTANCE.getXOperation__XOperationMethods__DiagnosticChain_Map();

		/**
		 * The meta object literal for the '<em><b>XOperation Constraints</b></em>' operation.
		 * <!-- begin-user-doc -->
		 * <!-- end-user-doc -->
		 * @generated
		 */
		EOperation XOPERATION___XOPERATION_CONSTRAINTS__DIAGNOSTICCHAIN_MAP = eINSTANCE.getXOperation__XOperationConstraints__DiagnosticChain_Map();

		/**
		 * The meta object literal for the '{@link com.ericsson.executablemodeling.xtuml.profile.executablemodelingprofile.impl.XNamespaceImpl <em>XNamespace</em>}' class.
		 * <!-- begin-user-doc -->
		 * <!-- end-user-doc -->
		 * @see com.ericsson.executablemodeling.xtuml.profile.executablemodelingprofile.impl.XNamespaceImpl
		 * @see com.ericsson.executablemodeling.xtuml.profile.executablemodelingprofile.impl.ExecutableModelingProfilePackageImpl#getXNamespace()
		 * @generated
		 */
		EClass XNAMESPACE = eINSTANCE.getXNamespace();

		/**
		 * The meta object literal for the '<em><b>Base Namespace</b></em>' reference feature.
		 * <!-- begin-user-doc -->
		 * <!-- end-user-doc -->
		 * @generated
		 */
		EReference XNAMESPACE__BASE_NAMESPACE = eINSTANCE.getXNamespace_Base_Namespace();

		/**
		 * The meta object literal for the '{@link com.ericsson.executablemodeling.xtuml.profile.executablemodelingprofile.impl.XNamedElementImpl <em>XNamed Element</em>}' class.
		 * <!-- begin-user-doc -->
		 * <!-- end-user-doc -->
		 * @see com.ericsson.executablemodeling.xtuml.profile.executablemodelingprofile.impl.XNamedElementImpl
		 * @see com.ericsson.executablemodeling.xtuml.profile.executablemodelingprofile.impl.ExecutableModelingProfilePackageImpl#getXNamedElement()
		 * @generated
		 */
		EClass XNAMED_ELEMENT = eINSTANCE.getXNamedElement();

		/**
		 * The meta object literal for the '<em><b>Base Named Element</b></em>' reference feature.
		 * <!-- begin-user-doc -->
		 * <!-- end-user-doc -->
		 * @generated
		 */
		EReference XNAMED_ELEMENT__BASE_NAMED_ELEMENT = eINSTANCE.getXNamedElement_Base_NamedElement();

		/**
		 * The meta object literal for the '<em><b>XNamed Element Name</b></em>' operation.
		 * <!-- begin-user-doc -->
		 * <!-- end-user-doc -->
		 * @generated
		 */
		EOperation XNAMED_ELEMENT___XNAMED_ELEMENT_NAME__DIAGNOSTICCHAIN_MAP = eINSTANCE.getXNamedElement__XNamedElementName__DiagnosticChain_Map();

		/**
		 * The meta object literal for the '{@link com.ericsson.executablemodeling.xtuml.profile.executablemodelingprofile.impl.XFeatureImpl <em>XFeature</em>}' class.
		 * <!-- begin-user-doc -->
		 * <!-- end-user-doc -->
		 * @see com.ericsson.executablemodeling.xtuml.profile.executablemodelingprofile.impl.XFeatureImpl
		 * @see com.ericsson.executablemodeling.xtuml.profile.executablemodelingprofile.impl.ExecutableModelingProfilePackageImpl#getXFeature()
		 * @generated
		 */
		EClass XFEATURE = eINSTANCE.getXFeature();

		/**
		 * The meta object literal for the '<em><b>Base Feature</b></em>' reference feature.
		 * <!-- begin-user-doc -->
		 * <!-- end-user-doc -->
		 * @generated
		 */
		EReference XFEATURE__BASE_FEATURE = eINSTANCE.getXFeature_Base_Feature();

		/**
		 * The meta object literal for the '<em><b>XFeature Classifier</b></em>' operation.
		 * <!-- begin-user-doc -->
		 * <!-- end-user-doc -->
		 * @generated
		 */
		EOperation XFEATURE___XFEATURE_CLASSIFIER__DIAGNOSTICCHAIN_MAP = eINSTANCE.getXFeature__XFeatureClassifier__DiagnosticChain_Map();

		/**
		 * The meta object literal for the '{@link com.ericsson.executablemodeling.xtuml.profile.executablemodelingprofile.impl.XAssociationImpl <em>XAssociation</em>}' class.
		 * <!-- begin-user-doc -->
		 * <!-- end-user-doc -->
		 * @see com.ericsson.executablemodeling.xtuml.profile.executablemodelingprofile.impl.XAssociationImpl
		 * @see com.ericsson.executablemodeling.xtuml.profile.executablemodelingprofile.impl.ExecutableModelingProfilePackageImpl#getXAssociation()
		 * @generated
		 */
		EClass XASSOCIATION = eINSTANCE.getXAssociation();

		/**
		 * The meta object literal for the '<em><b>Base Association</b></em>' reference feature.
		 * <!-- begin-user-doc -->
		 * <!-- end-user-doc -->
		 * @generated
		 */
		EReference XASSOCIATION__BASE_ASSOCIATION = eINSTANCE.getXAssociation_Base_Association();

		/**
		 * The meta object literal for the '<em><b>XAssociation Is Binary</b></em>' operation.
		 * <!-- begin-user-doc -->
		 * <!-- end-user-doc -->
		 * @generated
		 */
		EOperation XASSOCIATION___XASSOCIATION_IS_BINARY__DIAGNOSTICCHAIN_MAP = eINSTANCE.getXAssociation__XAssociationIsBinary__DiagnosticChain_Map();

		/**
		 * The meta object literal for the '{@link com.ericsson.executablemodeling.xtuml.profile.executablemodelingprofile.impl.XClassifierImpl <em>XClassifier</em>}' class.
		 * <!-- begin-user-doc -->
		 * <!-- end-user-doc -->
		 * @see com.ericsson.executablemodeling.xtuml.profile.executablemodelingprofile.impl.XClassifierImpl
		 * @see com.ericsson.executablemodeling.xtuml.profile.executablemodelingprofile.impl.ExecutableModelingProfilePackageImpl#getXClassifier()
		 * @generated
		 */
		EClass XCLASSIFIER = eINSTANCE.getXClassifier();

		/**
		 * The meta object literal for the '<em><b>Base Classifier</b></em>' reference feature.
		 * <!-- begin-user-doc -->
		 * <!-- end-user-doc -->
		 * @generated
		 */
		EReference XCLASSIFIER__BASE_CLASSIFIER = eINSTANCE.getXClassifier_Base_Classifier();

		/**
		 * The meta object literal for the '<em><b>XClassifier Features</b></em>' operation.
		 * <!-- begin-user-doc -->
		 * <!-- end-user-doc -->
		 * @generated
		 */
		EOperation XCLASSIFIER___XCLASSIFIER_FEATURES__DIAGNOSTICCHAIN_MAP = eINSTANCE.getXClassifier__XClassifierFeatures__DiagnosticChain_Map();

		/**
		 * The meta object literal for the '<em><b>XClassifier Nested Classifiers</b></em>' operation.
		 * <!-- begin-user-doc -->
		 * <!-- end-user-doc -->
		 * @generated
		 */
		EOperation XCLASSIFIER___XCLASSIFIER_NESTED_CLASSIFIERS__DIAGNOSTICCHAIN_MAP = eINSTANCE.getXClassifier__XClassifierNestedClassifiers__DiagnosticChain_Map();

		/**
		 * The meta object literal for the '<em><b>XClassifier Generals</b></em>' operation.
		 * <!-- begin-user-doc -->
		 * <!-- end-user-doc -->
		 * @generated
		 */
		EOperation XCLASSIFIER___XCLASSIFIER_GENERALS__DIAGNOSTICCHAIN_MAP = eINSTANCE.getXClassifier__XClassifierGenerals__DiagnosticChain_Map();

		/**
		 * The meta object literal for the '<em><b>XClassifier Constraints</b></em>' operation.
		 * <!-- begin-user-doc -->
		 * <!-- end-user-doc -->
		 * @generated
		 */
		EOperation XCLASSIFIER___XCLASSIFIER_CONSTRAINTS__DIAGNOSTICCHAIN_MAP = eINSTANCE.getXClassifier__XClassifierConstraints__DiagnosticChain_Map();

		/**
		 * The meta object literal for the '{@link com.ericsson.executablemodeling.xtuml.profile.executablemodelingprofile.impl.XBehaviorImpl <em>XBehavior</em>}' class.
		 * <!-- begin-user-doc -->
		 * <!-- end-user-doc -->
		 * @see com.ericsson.executablemodeling.xtuml.profile.executablemodelingprofile.impl.XBehaviorImpl
		 * @see com.ericsson.executablemodeling.xtuml.profile.executablemodelingprofile.impl.ExecutableModelingProfilePackageImpl#getXBehavior()
		 * @generated
		 */
		EClass XBEHAVIOR = eINSTANCE.getXBehavior();

		/**
		 * The meta object literal for the '<em><b>Base Behavior</b></em>' reference feature.
		 * <!-- begin-user-doc -->
		 * <!-- end-user-doc -->
		 * @generated
		 */
		EReference XBEHAVIOR__BASE_BEHAVIOR = eINSTANCE.getXBehavior_Base_Behavior();

		/**
		 * The meta object literal for the '<em><b>XBehavior No Parameter Sets</b></em>' operation.
		 * <!-- begin-user-doc -->
		 * <!-- end-user-doc -->
		 * @generated
		 */
		EOperation XBEHAVIOR___XBEHAVIOR_NO_PARAMETER_SETS__DIAGNOSTICCHAIN_MAP = eINSTANCE.getXBehavior__XBehaviorNoParameterSets__DiagnosticChain_Map();

		/**
		 * The meta object literal for the '{@link com.ericsson.executablemodeling.xtuml.profile.executablemodelingprofile.impl.XEncapsulatedClassifierImpl <em>XEncapsulated Classifier</em>}' class.
		 * <!-- begin-user-doc -->
		 * <!-- end-user-doc -->
		 * @see com.ericsson.executablemodeling.xtuml.profile.executablemodelingprofile.impl.XEncapsulatedClassifierImpl
		 * @see com.ericsson.executablemodeling.xtuml.profile.executablemodelingprofile.impl.ExecutableModelingProfilePackageImpl#getXEncapsulatedClassifier()
		 * @generated
		 */
		EClass XENCAPSULATED_CLASSIFIER = eINSTANCE.getXEncapsulatedClassifier();

		/**
		 * The meta object literal for the '<em><b>Base Encapsulated Classifier</b></em>' reference feature.
		 * <!-- begin-user-doc -->
		 * <!-- end-user-doc -->
		 * @generated
		 */
		EReference XENCAPSULATED_CLASSIFIER__BASE_ENCAPSULATED_CLASSIFIER = eINSTANCE.getXEncapsulatedClassifier_Base_EncapsulatedClassifier();

		/**
		 * The meta object literal for the '<em><b>Is External</b></em>' attribute feature.
		 * <!-- begin-user-doc -->
		 * <!-- end-user-doc -->
		 * @generated
		 */
		EAttribute XENCAPSULATED_CLASSIFIER__IS_EXTERNAL = eINSTANCE.getXEncapsulatedClassifier_IsExternal();

		/**
		 * The meta object literal for the '<em><b>XEncapsulated Classifier Ports</b></em>' operation.
		 * <!-- begin-user-doc -->
		 * <!-- end-user-doc -->
		 * @generated
		 */
		EOperation XENCAPSULATED_CLASSIFIER___XENCAPSULATED_CLASSIFIER_PORTS__DIAGNOSTICCHAIN_MAP = eINSTANCE.getXEncapsulatedClassifier__XEncapsulatedClassifierPorts__DiagnosticChain_Map();

		/**
		 * The meta object literal for the '<em><b>XEncapsulated Classifierconnectors</b></em>' operation.
		 * <!-- begin-user-doc -->
		 * <!-- end-user-doc -->
		 * @generated
		 */
		EOperation XENCAPSULATED_CLASSIFIER___XENCAPSULATED_CLASSIFIERCONNECTORS__DIAGNOSTICCHAIN_MAP = eINSTANCE.getXEncapsulatedClassifier__XEncapsulatedClassifierconnectors__DiagnosticChain_Map();

		/**
		 * The meta object literal for the '<em><b>XEncapsulated Classifier External</b></em>' operation.
		 * <!-- begin-user-doc -->
		 * <!-- end-user-doc -->
		 * @generated
		 */
		EOperation XENCAPSULATED_CLASSIFIER___XENCAPSULATED_CLASSIFIER_EXTERNAL__DIAGNOSTICCHAIN_MAP = eINSTANCE.getXEncapsulatedClassifier__XEncapsulatedClassifierExternal__DiagnosticChain_Map();

		/**
		 * The meta object literal for the '{@link com.ericsson.executablemodeling.xtuml.profile.executablemodelingprofile.impl.XProtocolImpl <em>XProtocol</em>}' class.
		 * <!-- begin-user-doc -->
		 * <!-- end-user-doc -->
		 * @see com.ericsson.executablemodeling.xtuml.profile.executablemodelingprofile.impl.XProtocolImpl
		 * @see com.ericsson.executablemodeling.xtuml.profile.executablemodelingprofile.impl.ExecutableModelingProfilePackageImpl#getXProtocol()
		 * @generated
		 */
		EClass XPROTOCOL = eINSTANCE.getXProtocol();

		/**
		 * The meta object literal for the '<em><b>Base Behaviored Classifier</b></em>' reference feature.
		 * <!-- begin-user-doc -->
		 * <!-- end-user-doc -->
		 * @generated
		 */
		EReference XPROTOCOL__BASE_BEHAVIORED_CLASSIFIER = eINSTANCE.getXProtocol_Base_BehavioredClassifier();

		/**
		 * The meta object literal for the '<em><b>XProtocol Incoming Interface</b></em>' operation.
		 * <!-- begin-user-doc -->
		 * <!-- end-user-doc -->
		 * @generated
		 */
		EOperation XPROTOCOL___XPROTOCOL_INCOMING_INTERFACE__DIAGNOSTICCHAIN_MAP = eINSTANCE.getXProtocol__XProtocolIncomingInterface__DiagnosticChain_Map();

		/**
		 * The meta object literal for the '<em><b>XProtocol Protocol Container</b></em>' operation.
		 * <!-- begin-user-doc -->
		 * <!-- end-user-doc -->
		 * @generated
		 */
		EOperation XPROTOCOL___XPROTOCOL_PROTOCOL_CONTAINER__DIAGNOSTICCHAIN_MAP = eINSTANCE.getXProtocol__XProtocolProtocolContainer__DiagnosticChain_Map();

		/**
		 * The meta object literal for the '<em><b>XProtocol Outgoing Interface</b></em>' operation.
		 * <!-- begin-user-doc -->
		 * <!-- end-user-doc -->
		 * @generated
		 */
		EOperation XPROTOCOL___XPROTOCOL_OUTGOING_INTERFACE__DIAGNOSTICCHAIN_MAP = eINSTANCE.getXProtocol__XProtocolOutgoingInterface__DiagnosticChain_Map();

		/**
		 * The meta object literal for the '<em><b>XProtocol Symmetric Interface</b></em>' operation.
		 * <!-- begin-user-doc -->
		 * <!-- end-user-doc -->
		 * @generated
		 */
		EOperation XPROTOCOL___XPROTOCOL_SYMMETRIC_INTERFACE__DIAGNOSTICCHAIN_MAP = eINSTANCE.getXProtocol__XProtocolSymmetricInterface__DiagnosticChain_Map();

		/**
		 * The meta object literal for the '{@link com.ericsson.executablemodeling.xtuml.profile.executablemodelingprofile.impl.XSignalImpl <em>XSignal</em>}' class.
		 * <!-- begin-user-doc -->
		 * <!-- end-user-doc -->
		 * @see com.ericsson.executablemodeling.xtuml.profile.executablemodelingprofile.impl.XSignalImpl
		 * @see com.ericsson.executablemodeling.xtuml.profile.executablemodelingprofile.impl.ExecutableModelingProfilePackageImpl#getXSignal()
		 * @generated
		 */
		EClass XSIGNAL = eINSTANCE.getXSignal();

		/**
		 * The meta object literal for the '<em><b>Base Signal</b></em>' reference feature.
		 * <!-- begin-user-doc -->
		 * <!-- end-user-doc -->
		 * @generated
		 */
		EReference XSIGNAL__BASE_SIGNAL = eINSTANCE.getXSignal_Base_Signal();

		/**
		 * The meta object literal for the '<em><b>XSignal Visibility</b></em>' operation.
		 * <!-- begin-user-doc -->
		 * <!-- end-user-doc -->
		 * @generated
		 */
		EOperation XSIGNAL___XSIGNAL_VISIBILITY__DIAGNOSTICCHAIN_MAP = eINSTANCE.getXSignal__XSignalVisibility__DiagnosticChain_Map();

		/**
		 * The meta object literal for the '{@link com.ericsson.executablemodeling.xtuml.profile.executablemodelingprofile.impl.XDataTypeImpl <em>XData Type</em>}' class.
		 * <!-- begin-user-doc -->
		 * <!-- end-user-doc -->
		 * @see com.ericsson.executablemodeling.xtuml.profile.executablemodelingprofile.impl.XDataTypeImpl
		 * @see com.ericsson.executablemodeling.xtuml.profile.executablemodelingprofile.impl.ExecutableModelingProfilePackageImpl#getXDataType()
		 * @generated
		 */
		EClass XDATA_TYPE = eINSTANCE.getXDataType();

		/**
		 * The meta object literal for the '<em><b>Base Data Type</b></em>' reference feature.
		 * <!-- begin-user-doc -->
		 * <!-- end-user-doc -->
		 * @generated
		 */
		EReference XDATA_TYPE__BASE_DATA_TYPE = eINSTANCE.getXDataType_Base_DataType();

		/**
		 * The meta object literal for the '<em><b>XData Type Operations</b></em>' operation.
		 * <!-- begin-user-doc -->
		 * <!-- end-user-doc -->
		 * @generated
		 */
		EOperation XDATA_TYPE___XDATA_TYPE_OPERATIONS__DIAGNOSTICCHAIN_MAP = eINSTANCE.getXDataType__XDataTypeOperations__DiagnosticChain_Map();

		/**
		 * The meta object literal for the '{@link com.ericsson.executablemodeling.xtuml.profile.executablemodelingprofile.impl.XParameterImpl <em>XParameter</em>}' class.
		 * <!-- begin-user-doc -->
		 * <!-- end-user-doc -->
		 * @see com.ericsson.executablemodeling.xtuml.profile.executablemodelingprofile.impl.XParameterImpl
		 * @see com.ericsson.executablemodeling.xtuml.profile.executablemodelingprofile.impl.ExecutableModelingProfilePackageImpl#getXParameter()
		 * @generated
		 */
		EClass XPARAMETER = eINSTANCE.getXParameter();

		/**
		 * The meta object literal for the '<em><b>Base Parameter</b></em>' reference feature.
		 * <!-- begin-user-doc -->
		 * <!-- end-user-doc -->
		 * @generated
		 */
		EReference XPARAMETER__BASE_PARAMETER = eINSTANCE.getXParameter_Base_Parameter();

		/**
		 * The meta object literal for the '{@link com.ericsson.executablemodeling.xtuml.profile.executablemodelingprofile.impl.XTypedElementImpl <em>XTyped Element</em>}' class.
		 * <!-- begin-user-doc -->
		 * <!-- end-user-doc -->
		 * @see com.ericsson.executablemodeling.xtuml.profile.executablemodelingprofile.impl.XTypedElementImpl
		 * @see com.ericsson.executablemodeling.xtuml.profile.executablemodelingprofile.impl.ExecutableModelingProfilePackageImpl#getXTypedElement()
		 * @generated
		 */
		EClass XTYPED_ELEMENT = eINSTANCE.getXTypedElement();

		/**
		 * The meta object literal for the '<em><b>Base Typed Element</b></em>' reference feature.
		 * <!-- begin-user-doc -->
		 * <!-- end-user-doc -->
		 * @generated
		 */
		EReference XTYPED_ELEMENT__BASE_TYPED_ELEMENT = eINSTANCE.getXTypedElement_Base_TypedElement();

		/**
		 * The meta object literal for the '<em><b>XTyped Element Type</b></em>' operation.
		 * <!-- begin-user-doc -->
		 * <!-- end-user-doc -->
		 * @generated
		 */
		EOperation XTYPED_ELEMENT___XTYPED_ELEMENT_TYPE__DIAGNOSTICCHAIN_MAP = eINSTANCE.getXTypedElement__XTypedElementType__DiagnosticChain_Map();

		/**
		 * The meta object literal for the '{@link com.ericsson.executablemodeling.xtuml.profile.executablemodelingprofile.impl.XPropertyImpl <em>XProperty</em>}' class.
		 * <!-- begin-user-doc -->
		 * <!-- end-user-doc -->
		 * @see com.ericsson.executablemodeling.xtuml.profile.executablemodelingprofile.impl.XPropertyImpl
		 * @see com.ericsson.executablemodeling.xtuml.profile.executablemodelingprofile.impl.ExecutableModelingProfilePackageImpl#getXProperty()
		 * @generated
		 */
		EClass XPROPERTY = eINSTANCE.getXProperty();

		/**
		 * The meta object literal for the '<em><b>Base Property</b></em>' reference feature.
		 * <!-- begin-user-doc -->
		 * <!-- end-user-doc -->
		 * @generated
		 */
		EReference XPROPERTY__BASE_PROPERTY = eINSTANCE.getXProperty_Base_Property();

		/**
		 * The meta object literal for the '{@link com.ericsson.executablemodeling.xtuml.profile.executablemodelingprofile.impl.XMultiplicityElementImpl <em>XMultiplicity Element</em>}' class.
		 * <!-- begin-user-doc -->
		 * <!-- end-user-doc -->
		 * @see com.ericsson.executablemodeling.xtuml.profile.executablemodelingprofile.impl.XMultiplicityElementImpl
		 * @see com.ericsson.executablemodeling.xtuml.profile.executablemodelingprofile.impl.ExecutableModelingProfilePackageImpl#getXMultiplicityElement()
		 * @generated
		 */
		EClass XMULTIPLICITY_ELEMENT = eINSTANCE.getXMultiplicityElement();

		/**
		 * The meta object literal for the '<em><b>Base Multiplicity Element</b></em>' reference feature.
		 * <!-- begin-user-doc -->
		 * <!-- end-user-doc -->
		 * @generated
		 */
		EReference XMULTIPLICITY_ELEMENT__BASE_MULTIPLICITY_ELEMENT = eINSTANCE.getXMultiplicityElement_Base_MultiplicityElement();

		/**
		 * The meta object literal for the '<em><b>Is Ordered By Value</b></em>' attribute feature.
		 * <!-- begin-user-doc -->
		 * <!-- end-user-doc -->
		 * @generated
		 */
		EAttribute XMULTIPLICITY_ELEMENT__IS_ORDERED_BY_VALUE = eINSTANCE.getXMultiplicityElement_IsOrderedByValue();

		/**
		 * The meta object literal for the '<em><b>Key</b></em>' reference list feature.
		 * <!-- begin-user-doc -->
		 * <!-- end-user-doc -->
		 * @generated
		 */
		EReference XMULTIPLICITY_ELEMENT__KEY = eINSTANCE.getXMultiplicityElement_Key();

		/**
		 * The meta object literal for the '<em><b>Is Descending</b></em>' attribute feature.
		 * <!-- begin-user-doc -->
		 * <!-- end-user-doc -->
		 * @generated
		 */
		EAttribute XMULTIPLICITY_ELEMENT__IS_DESCENDING = eINSTANCE.getXMultiplicityElement_IsDescending();

		/**
		 * The meta object literal for the '<em><b>XMultiplicity Element Is Ordered By Value</b></em>' operation.
		 * <!-- begin-user-doc -->
		 * <!-- end-user-doc -->
		 * @generated
		 */
		EOperation XMULTIPLICITY_ELEMENT___XMULTIPLICITY_ELEMENT_IS_ORDERED_BY_VALUE__DIAGNOSTICCHAIN_MAP = eINSTANCE.getXMultiplicityElement__XMultiplicityElementIsOrderedByValue__DiagnosticChain_Map();

		/**
		 * The meta object literal for the '<em><b>XMultiplicity Element Keys</b></em>' operation.
		 * <!-- begin-user-doc -->
		 * <!-- end-user-doc -->
		 * @generated
		 */
		EOperation XMULTIPLICITY_ELEMENT___XMULTIPLICITY_ELEMENT_KEYS__DIAGNOSTICCHAIN_MAP = eINSTANCE.getXMultiplicityElement__XMultiplicityElementKeys__DiagnosticChain_Map();

		/**
		 * The meta object literal for the '{@link com.ericsson.executablemodeling.xtuml.profile.executablemodelingprofile.impl.XReceptionImpl <em>XReception</em>}' class.
		 * <!-- begin-user-doc -->
		 * <!-- end-user-doc -->
		 * @see com.ericsson.executablemodeling.xtuml.profile.executablemodelingprofile.impl.XReceptionImpl
		 * @see com.ericsson.executablemodeling.xtuml.profile.executablemodelingprofile.impl.ExecutableModelingProfilePackageImpl#getXReception()
		 * @generated
		 */
		EClass XRECEPTION = eINSTANCE.getXReception();

		/**
		 * The meta object literal for the '<em><b>Base Reception</b></em>' reference feature.
		 * <!-- begin-user-doc -->
		 * <!-- end-user-doc -->
		 * @generated
		 */
		EReference XRECEPTION__BASE_RECEPTION = eINSTANCE.getXReception_Base_Reception();

		/**
		 * The meta object literal for the '<em><b>XReception Signal</b></em>' operation.
		 * <!-- begin-user-doc -->
		 * <!-- end-user-doc -->
		 * @generated
		 */
		EOperation XRECEPTION___XRECEPTION_SIGNAL__DIAGNOSTICCHAIN_MAP = eINSTANCE.getXReception__XReceptionSignal__DiagnosticChain_Map();

		/**
		 * The meta object literal for the '{@link com.ericsson.executablemodeling.xtuml.profile.executablemodelingprofile.impl.XPartImpl <em>XPart</em>}' class.
		 * <!-- begin-user-doc -->
		 * <!-- end-user-doc -->
		 * @see com.ericsson.executablemodeling.xtuml.profile.executablemodelingprofile.impl.XPartImpl
		 * @see com.ericsson.executablemodeling.xtuml.profile.executablemodelingprofile.impl.ExecutableModelingProfilePackageImpl#getXPart()
		 * @generated
		 */
		EClass XPART = eINSTANCE.getXPart();

		/**
		 * The meta object literal for the '<em><b>Base Property</b></em>' reference feature.
		 * <!-- begin-user-doc -->
		 * <!-- end-user-doc -->
		 * @generated
		 */
		EReference XPART__BASE_PROPERTY = eINSTANCE.getXPart_Base_Property();

		/**
		 * The meta object literal for the '<em><b>XPart Classifier</b></em>' operation.
		 * <!-- begin-user-doc -->
		 * <!-- end-user-doc -->
		 * @generated
		 */
		EOperation XPART___XPART_CLASSIFIER__DIAGNOSTICCHAIN_MAP = eINSTANCE.getXPart__XPartClassifier__DiagnosticChain_Map();

		/**
		 * The meta object literal for the '{@link com.ericsson.executablemodeling.xtuml.profile.executablemodelingprofile.impl.XPortImpl <em>XPort</em>}' class.
		 * <!-- begin-user-doc -->
		 * <!-- end-user-doc -->
		 * @see com.ericsson.executablemodeling.xtuml.profile.executablemodelingprofile.impl.XPortImpl
		 * @see com.ericsson.executablemodeling.xtuml.profile.executablemodelingprofile.impl.ExecutableModelingProfilePackageImpl#getXPort()
		 * @generated
		 */
		EClass XPORT = eINSTANCE.getXPort();

		/**
		 * The meta object literal for the '<em><b>Base Port</b></em>' reference feature.
		 * <!-- begin-user-doc -->
		 * <!-- end-user-doc -->
		 * @generated
		 */
		EReference XPORT__BASE_PORT = eINSTANCE.getXPort_Base_Port();

		/**
		 * The meta object literal for the '<em><b>XPort Classifier</b></em>' operation.
		 * <!-- begin-user-doc -->
		 * <!-- end-user-doc -->
		 * @generated
		 */
		EOperation XPORT___XPORT_CLASSIFIER__DIAGNOSTICCHAIN_MAP = eINSTANCE.getXPort__XPortClassifier__DiagnosticChain_Map();

		/**
		 * The meta object literal for the '<em><b>XPort Ordering Uniqueness</b></em>' operation.
		 * <!-- begin-user-doc -->
		 * <!-- end-user-doc -->
		 * @generated
		 */
		EOperation XPORT___XPORT_ORDERING_UNIQUENESS__DIAGNOSTICCHAIN_MAP = eINSTANCE.getXPort__XPortOrderingUniqueness__DiagnosticChain_Map();

		/**
		 * The meta object literal for the '<em><b>XPort Type</b></em>' operation.
		 * <!-- begin-user-doc -->
		 * <!-- end-user-doc -->
		 * @generated
		 */
		EOperation XPORT___XPORT_TYPE__DIAGNOSTICCHAIN_MAP = eINSTANCE.getXPort__XPortType__DiagnosticChain_Map();

		/**
		 * The meta object literal for the '<em><b>XPort Behavior Port</b></em>' operation.
		 * <!-- begin-user-doc -->
		 * <!-- end-user-doc -->
		 * @generated
		 */
		EOperation XPORT___XPORT_BEHAVIOR_PORT__DIAGNOSTICCHAIN_MAP = eINSTANCE.getXPort__XPortBehaviorPort__DiagnosticChain_Map();

		/**
		 * The meta object literal for the '<em><b>XPort Visibility</b></em>' operation.
		 * <!-- begin-user-doc -->
		 * <!-- end-user-doc -->
		 * @generated
		 */
		EOperation XPORT___XPORT_VISIBILITY__DIAGNOSTICCHAIN_MAP = eINSTANCE.getXPort__XPortVisibility__DiagnosticChain_Map();

		/**
		 * The meta object literal for the '{@link com.ericsson.executablemodeling.xtuml.profile.executablemodelingprofile.impl.XConnectorImpl <em>XConnector</em>}' class.
		 * <!-- begin-user-doc -->
		 * <!-- end-user-doc -->
		 * @see com.ericsson.executablemodeling.xtuml.profile.executablemodelingprofile.impl.XConnectorImpl
		 * @see com.ericsson.executablemodeling.xtuml.profile.executablemodelingprofile.impl.ExecutableModelingProfilePackageImpl#getXConnector()
		 * @generated
		 */
		EClass XCONNECTOR = eINSTANCE.getXConnector();

		/**
		 * The meta object literal for the '<em><b>Base Connector</b></em>' reference feature.
		 * <!-- begin-user-doc -->
		 * <!-- end-user-doc -->
		 * @generated
		 */
		EReference XCONNECTOR__BASE_CONNECTOR = eINSTANCE.getXConnector_Base_Connector();

		/**
		 * The meta object literal for the '<em><b>XConnector Classifier</b></em>' operation.
		 * <!-- begin-user-doc -->
		 * <!-- end-user-doc -->
		 * @generated
		 */
		EOperation XCONNECTOR___XCONNECTOR_CLASSIFIER__DIAGNOSTICCHAIN_MAP = eINSTANCE.getXConnector__XConnectorClassifier__DiagnosticChain_Map();

		/**
		 * The meta object literal for the '<em><b>XConnector Ends</b></em>' operation.
		 * <!-- begin-user-doc -->
		 * <!-- end-user-doc -->
		 * @generated
		 */
		EOperation XCONNECTOR___XCONNECTOR_ENDS__DIAGNOSTICCHAIN_MAP = eINSTANCE.getXConnector__XConnectorEnds__DiagnosticChain_Map();

		/**
		 * The meta object literal for the '<em><b>Xt Connector Type</b></em>' operation.
		 * <!-- begin-user-doc -->
		 * <!-- end-user-doc -->
		 * @generated
		 */
		EOperation XCONNECTOR___XT_CONNECTOR_TYPE__DIAGNOSTICCHAIN_MAP = eINSTANCE.getXConnector__XtConnectorType__DiagnosticChain_Map();

		/**
		 * The meta object literal for the '{@link com.ericsson.executablemodeling.xtuml.profile.executablemodelingprofile.impl.XProtocolContainerImpl <em>XProtocol Container</em>}' class.
		 * <!-- begin-user-doc -->
		 * <!-- end-user-doc -->
		 * @see com.ericsson.executablemodeling.xtuml.profile.executablemodelingprofile.impl.XProtocolContainerImpl
		 * @see com.ericsson.executablemodeling.xtuml.profile.executablemodelingprofile.impl.ExecutableModelingProfilePackageImpl#getXProtocolContainer()
		 * @generated
		 */
		EClass XPROTOCOL_CONTAINER = eINSTANCE.getXProtocolContainer();

		/**
		 * The meta object literal for the '<em><b>Base Package</b></em>' reference feature.
		 * <!-- begin-user-doc -->
		 * <!-- end-user-doc -->
		 * @generated
		 */
		EReference XPROTOCOL_CONTAINER__BASE_PACKAGE = eINSTANCE.getXProtocolContainer_Base_Package();

		/**
		 * The meta object literal for the '<em><b>XProtocol Container Protocol</b></em>' operation.
		 * <!-- begin-user-doc -->
		 * <!-- end-user-doc -->
		 * @generated
		 */
		EOperation XPROTOCOL_CONTAINER___XPROTOCOL_CONTAINER_PROTOCOL__DIAGNOSTICCHAIN_MAP = eINSTANCE.getXProtocolContainer__XProtocolContainerProtocol__DiagnosticChain_Map();

		/**
		 * The meta object literal for the '{@link com.ericsson.executablemodeling.xtuml.profile.executablemodelingprofile.impl.XMessageSetImpl <em>XMessage Set</em>}' class.
		 * <!-- begin-user-doc -->
		 * <!-- end-user-doc -->
		 * @see com.ericsson.executablemodeling.xtuml.profile.executablemodelingprofile.impl.XMessageSetImpl
		 * @see com.ericsson.executablemodeling.xtuml.profile.executablemodelingprofile.impl.ExecutableModelingProfilePackageImpl#getXMessageSet()
		 * @generated
		 */
		EClass XMESSAGE_SET = eINSTANCE.getXMessageSet();

		/**
		 * The meta object literal for the '<em><b>Base Interface</b></em>' reference feature.
		 * <!-- begin-user-doc -->
		 * <!-- end-user-doc -->
		 * @generated
		 */
		EReference XMESSAGE_SET__BASE_INTERFACE = eINSTANCE.getXMessageSet_Base_Interface();

		/**
		 * The meta object literal for the '<em><b>Message Kind</b></em>' attribute feature.
		 * <!-- begin-user-doc -->
		 * <!-- end-user-doc -->
		 * @generated
		 */
		EAttribute XMESSAGE_SET__MESSAGE_KIND = eINSTANCE.getXMessageSet_MessageKind();

		/**
		 * The meta object literal for the '<em><b>XMessage Set Incoming</b></em>' operation.
		 * <!-- begin-user-doc -->
		 * <!-- end-user-doc -->
		 * @generated
		 */
		EOperation XMESSAGE_SET___XMESSAGE_SET_INCOMING__DIAGNOSTICCHAIN_MAP = eINSTANCE.getXMessageSet__XMessageSetIncoming__DiagnosticChain_Map();

		/**
		 * The meta object literal for the '<em><b>XMessage Set Outgoing</b></em>' operation.
		 * <!-- begin-user-doc -->
		 * <!-- end-user-doc -->
		 * @generated
		 */
		EOperation XMESSAGE_SET___XMESSAGE_SET_OUTGOING__DIAGNOSTICCHAIN_MAP = eINSTANCE.getXMessageSet__XMessageSetOutgoing__DiagnosticChain_Map();

		/**
		 * The meta object literal for the '<em><b>XMessage Set Symmetric</b></em>' operation.
		 * <!-- begin-user-doc -->
		 * <!-- end-user-doc -->
		 * @generated
		 */
		EOperation XMESSAGE_SET___XMESSAGE_SET_SYMMETRIC__DIAGNOSTICCHAIN_MAP = eINSTANCE.getXMessageSet__XMessageSetSymmetric__DiagnosticChain_Map();

		/**
		 * The meta object literal for the '{@link com.ericsson.executablemodeling.xtuml.profile.executablemodelingprofile.impl.XEnumerationImpl <em>XEnumeration</em>}' class.
		 * <!-- begin-user-doc -->
		 * <!-- end-user-doc -->
		 * @see com.ericsson.executablemodeling.xtuml.profile.executablemodelingprofile.impl.XEnumerationImpl
		 * @see com.ericsson.executablemodeling.xtuml.profile.executablemodelingprofile.impl.ExecutableModelingProfilePackageImpl#getXEnumeration()
		 * @generated
		 */
		EClass XENUMERATION = eINSTANCE.getXEnumeration();

		/**
		 * The meta object literal for the '<em><b>Base Enumeration</b></em>' reference feature.
		 * <!-- begin-user-doc -->
		 * <!-- end-user-doc -->
		 * @generated
		 */
		EReference XENUMERATION__BASE_ENUMERATION = eINSTANCE.getXEnumeration_Base_Enumeration();

		/**
		 * The meta object literal for the '<em><b>XEnumeration Attributes</b></em>' operation.
		 * <!-- begin-user-doc -->
		 * <!-- end-user-doc -->
		 * @generated
		 */
		EOperation XENUMERATION___XENUMERATION_ATTRIBUTES__DIAGNOSTICCHAIN_MAP = eINSTANCE.getXEnumeration__XEnumerationAttributes__DiagnosticChain_Map();

		/**
		 * The meta object literal for the '{@link com.ericsson.executablemodeling.xtuml.profile.executablemodelingprofile.impl.XAssociationClassImpl <em>XAssociation Class</em>}' class.
		 * <!-- begin-user-doc -->
		 * <!-- end-user-doc -->
		 * @see com.ericsson.executablemodeling.xtuml.profile.executablemodelingprofile.impl.XAssociationClassImpl
		 * @see com.ericsson.executablemodeling.xtuml.profile.executablemodelingprofile.impl.ExecutableModelingProfilePackageImpl#getXAssociationClass()
		 * @generated
		 */
		EClass XASSOCIATION_CLASS = eINSTANCE.getXAssociationClass();

		/**
		 * The meta object literal for the '<em><b>Base Association Class</b></em>' reference feature.
		 * <!-- begin-user-doc -->
		 * <!-- end-user-doc -->
		 * @generated
		 */
		EReference XASSOCIATION_CLASS__BASE_ASSOCIATION_CLASS = eINSTANCE.getXAssociationClass_Base_AssociationClass();

		/**
		 * The meta object literal for the '{@link com.ericsson.executablemodeling.xtuml.profile.executablemodelingprofile.impl.XTriggerImpl <em>XTrigger</em>}' class.
		 * <!-- begin-user-doc -->
		 * <!-- end-user-doc -->
		 * @see com.ericsson.executablemodeling.xtuml.profile.executablemodelingprofile.impl.XTriggerImpl
		 * @see com.ericsson.executablemodeling.xtuml.profile.executablemodelingprofile.impl.ExecutableModelingProfilePackageImpl#getXTrigger()
		 * @generated
		 */
		EClass XTRIGGER = eINSTANCE.getXTrigger();

		/**
		 * The meta object literal for the '<em><b>Base Trigger</b></em>' reference feature.
		 * <!-- begin-user-doc -->
		 * <!-- end-user-doc -->
		 * @generated
		 */
		EReference XTRIGGER__BASE_TRIGGER = eINSTANCE.getXTrigger_Base_Trigger();

		/**
		 * The meta object literal for the '<em><b>XTrigger Signal Reception</b></em>' operation.
		 * <!-- begin-user-doc -->
		 * <!-- end-user-doc -->
		 * @generated
		 */
		EOperation XTRIGGER___XTRIGGER_SIGNAL_RECEPTION__DIAGNOSTICCHAIN_MAP = eINSTANCE.getXTrigger__XTriggerSignalReception__DiagnosticChain_Map();

		/**
		 * The meta object literal for the '<em><b>XTrigger Events</b></em>' operation.
		 * <!-- begin-user-doc -->
		 * <!-- end-user-doc -->
		 * @generated
		 */
		EOperation XTRIGGER___XTRIGGER_EVENTS__DIAGNOSTICCHAIN_MAP = eINSTANCE.getXTrigger__XTriggerEvents__DiagnosticChain_Map();

		/**
		 * The meta object literal for the '<em><b>XTrigger Called Operation</b></em>' operation.
		 * <!-- begin-user-doc -->
		 * <!-- end-user-doc -->
		 * @generated
		 */
		EOperation XTRIGGER___XTRIGGER_CALLED_OPERATION__DIAGNOSTICCHAIN_MAP = eINSTANCE.getXTrigger__XTriggerCalledOperation__DiagnosticChain_Map();

		/**
		 * The meta object literal for the '{@link com.ericsson.executablemodeling.xtuml.profile.executablemodelingprofile.impl.XStateMachineImpl <em>XState Machine</em>}' class.
		 * <!-- begin-user-doc -->
		 * <!-- end-user-doc -->
		 * @see com.ericsson.executablemodeling.xtuml.profile.executablemodelingprofile.impl.XStateMachineImpl
		 * @see com.ericsson.executablemodeling.xtuml.profile.executablemodelingprofile.impl.ExecutableModelingProfilePackageImpl#getXStateMachine()
		 * @generated
		 */
		EClass XSTATE_MACHINE = eINSTANCE.getXStateMachine();

		/**
		 * The meta object literal for the '<em><b>Base State Machine</b></em>' reference feature.
		 * <!-- begin-user-doc -->
		 * <!-- end-user-doc -->
		 * @generated
		 */
		EReference XSTATE_MACHINE__BASE_STATE_MACHINE = eINSTANCE.getXStateMachine_Base_StateMachine();

		/**
		 * The meta object literal for the '<em><b>XState Machine One Region</b></em>' operation.
		 * <!-- begin-user-doc -->
		 * <!-- end-user-doc -->
		 * @generated
		 */
		EOperation XSTATE_MACHINE___XSTATE_MACHINE_ONE_REGION__DIAGNOSTICCHAIN_MAP = eINSTANCE.getXStateMachine__XStateMachineOneRegion__DiagnosticChain_Map();

		/**
		 * The meta object literal for the '<em><b>XState Machine Initial State</b></em>' operation.
		 * <!-- begin-user-doc -->
		 * <!-- end-user-doc -->
		 * @generated
		 */
		EOperation XSTATE_MACHINE___XSTATE_MACHINE_INITIAL_STATE__DIAGNOSTICCHAIN_MAP = eINSTANCE.getXStateMachine__XStateMachineInitialState__DiagnosticChain_Map();

		/**
		 * The meta object literal for the '<em><b>XState Machine Context</b></em>' operation.
		 * <!-- begin-user-doc -->
		 * <!-- end-user-doc -->
		 * @generated
		 */
		EOperation XSTATE_MACHINE___XSTATE_MACHINE_CONTEXT__DIAGNOSTICCHAIN_MAP = eINSTANCE.getXStateMachine__XStateMachineContext__DiagnosticChain_Map();

		/**
		 * The meta object literal for the '<em><b>XState Machine No Parameters</b></em>' operation.
		 * <!-- begin-user-doc -->
		 * <!-- end-user-doc -->
		 * @generated
		 */
		EOperation XSTATE_MACHINE___XSTATE_MACHINE_NO_PARAMETERS__DIAGNOSTICCHAIN_MAP = eINSTANCE.getXStateMachine__XStateMachineNoParameters__DiagnosticChain_Map();

		/**
		 * The meta object literal for the '<em><b>XState Machine Regions</b></em>' operation.
		 * <!-- begin-user-doc -->
		 * <!-- end-user-doc -->
		 * @generated
		 */
		EOperation XSTATE_MACHINE___XSTATE_MACHINE_REGIONS__DIAGNOSTICCHAIN_MAP = eINSTANCE.getXStateMachine__XStateMachineRegions__DiagnosticChain_Map();

		/**
		 * The meta object literal for the '{@link com.ericsson.executablemodeling.xtuml.profile.executablemodelingprofile.impl.XRegionImpl <em>XRegion</em>}' class.
		 * <!-- begin-user-doc -->
		 * <!-- end-user-doc -->
		 * @see com.ericsson.executablemodeling.xtuml.profile.executablemodelingprofile.impl.XRegionImpl
		 * @see com.ericsson.executablemodeling.xtuml.profile.executablemodelingprofile.impl.ExecutableModelingProfilePackageImpl#getXRegion()
		 * @generated
		 */
		EClass XREGION = eINSTANCE.getXRegion();

		/**
		 * The meta object literal for the '<em><b>Base Region</b></em>' reference feature.
		 * <!-- begin-user-doc -->
		 * <!-- end-user-doc -->
		 * @generated
		 */
		EReference XREGION__BASE_REGION = eINSTANCE.getXRegion_Base_Region();

		/**
		 * The meta object literal for the '<em><b>XRegion Subvertexes</b></em>' operation.
		 * <!-- begin-user-doc -->
		 * <!-- end-user-doc -->
		 * @generated
		 */
		EOperation XREGION___XREGION_SUBVERTEXES__DIAGNOSTICCHAIN_MAP = eINSTANCE.getXRegion__XRegionSubvertexes__DiagnosticChain_Map();

		/**
		 * The meta object literal for the '<em><b>XRegion Transitions</b></em>' operation.
		 * <!-- begin-user-doc -->
		 * <!-- end-user-doc -->
		 * @generated
		 */
		EOperation XREGION___XREGION_TRANSITIONS__DIAGNOSTICCHAIN_MAP = eINSTANCE.getXRegion__XRegionTransitions__DiagnosticChain_Map();

		/**
		 * The meta object literal for the '{@link com.ericsson.executablemodeling.xtuml.profile.executablemodelingprofile.impl.XStateImpl <em>XState</em>}' class.
		 * <!-- begin-user-doc -->
		 * <!-- end-user-doc -->
		 * @see com.ericsson.executablemodeling.xtuml.profile.executablemodelingprofile.impl.XStateImpl
		 * @see com.ericsson.executablemodeling.xtuml.profile.executablemodelingprofile.impl.ExecutableModelingProfilePackageImpl#getXState()
		 * @generated
		 */
		EClass XSTATE = eINSTANCE.getXState();

		/**
		 * The meta object literal for the '<em><b>Base State</b></em>' reference feature.
		 * <!-- begin-user-doc -->
		 * <!-- end-user-doc -->
		 * @generated
		 */
		EReference XSTATE__BASE_STATE = eINSTANCE.getXState_Base_State();

		/**
		 * The meta object literal for the '<em><b>XState Behaviors</b></em>' operation.
		 * <!-- begin-user-doc -->
		 * <!-- end-user-doc -->
		 * @generated
		 */
		EOperation XSTATE___XSTATE_BEHAVIORS__DIAGNOSTICCHAIN_MAP = eINSTANCE.getXState__XStateBehaviors__DiagnosticChain_Map();

		/**
		 * The meta object literal for the '<em><b>XState No Do Activity</b></em>' operation.
		 * <!-- begin-user-doc -->
		 * <!-- end-user-doc -->
		 * @generated
		 */
		EOperation XSTATE___XSTATE_NO_DO_ACTIVITY__DIAGNOSTICCHAIN_MAP = eINSTANCE.getXState__XStateNoDoActivity__DiagnosticChain_Map();

		/**
		 * The meta object literal for the '<em><b>XState One Region</b></em>' operation.
		 * <!-- begin-user-doc -->
		 * <!-- end-user-doc -->
		 * @generated
		 */
		EOperation XSTATE___XSTATE_ONE_REGION__DIAGNOSTICCHAIN_MAP = eINSTANCE.getXState__XStateOneRegion__DiagnosticChain_Map();

		/**
		 * The meta object literal for the '<em><b>XState No Submachine</b></em>' operation.
		 * <!-- begin-user-doc -->
		 * <!-- end-user-doc -->
		 * @generated
		 */
		EOperation XSTATE___XSTATE_NO_SUBMACHINE__DIAGNOSTICCHAIN_MAP = eINSTANCE.getXState__XStateNoSubmachine__DiagnosticChain_Map();

		/**
		 * The meta object literal for the '<em><b>XState Regions</b></em>' operation.
		 * <!-- begin-user-doc -->
		 * <!-- end-user-doc -->
		 * @generated
		 */
		EOperation XSTATE___XSTATE_REGIONS__DIAGNOSTICCHAIN_MAP = eINSTANCE.getXState__XStateRegions__DiagnosticChain_Map();

		/**
		 * The meta object literal for the '{@link com.ericsson.executablemodeling.xtuml.profile.executablemodelingprofile.impl.XVertexImpl <em>XVertex</em>}' class.
		 * <!-- begin-user-doc -->
		 * <!-- end-user-doc -->
		 * @see com.ericsson.executablemodeling.xtuml.profile.executablemodelingprofile.impl.XVertexImpl
		 * @see com.ericsson.executablemodeling.xtuml.profile.executablemodelingprofile.impl.ExecutableModelingProfilePackageImpl#getXVertex()
		 * @generated
		 */
		EClass XVERTEX = eINSTANCE.getXVertex();

		/**
		 * The meta object literal for the '<em><b>Base Vertex</b></em>' reference feature.
		 * <!-- begin-user-doc -->
		 * <!-- end-user-doc -->
		 * @generated
		 */
		EReference XVERTEX__BASE_VERTEX = eINSTANCE.getXVertex_Base_Vertex();

		/**
		 * The meta object literal for the '{@link com.ericsson.executablemodeling.xtuml.profile.executablemodelingprofile.impl.XPseudostateImpl <em>XPseudostate</em>}' class.
		 * <!-- begin-user-doc -->
		 * <!-- end-user-doc -->
		 * @see com.ericsson.executablemodeling.xtuml.profile.executablemodelingprofile.impl.XPseudostateImpl
		 * @see com.ericsson.executablemodeling.xtuml.profile.executablemodelingprofile.impl.ExecutableModelingProfilePackageImpl#getXPseudostate()
		 * @generated
		 */
		EClass XPSEUDOSTATE = eINSTANCE.getXPseudostate();

		/**
		 * The meta object literal for the '<em><b>Base Pseudostate</b></em>' reference feature.
		 * <!-- begin-user-doc -->
		 * <!-- end-user-doc -->
		 * @generated
		 */
		EReference XPSEUDOSTATE__BASE_PSEUDOSTATE = eINSTANCE.getXPseudostate_Base_Pseudostate();

		/**
		 * The meta object literal for the '<em><b>XPsuedostate Kind</b></em>' operation.
		 * <!-- begin-user-doc -->
		 * <!-- end-user-doc -->
		 * @generated
		 */
		EOperation XPSEUDOSTATE___XPSUEDOSTATE_KIND__DIAGNOSTICCHAIN_MAP = eINSTANCE.getXPseudostate__XPsuedostateKind__DiagnosticChain_Map();

		/**
		 * The meta object literal for the '{@link com.ericsson.executablemodeling.xtuml.profile.executablemodelingprofile.impl.XTransitionImpl <em>XTransition</em>}' class.
		 * <!-- begin-user-doc -->
		 * <!-- end-user-doc -->
		 * @see com.ericsson.executablemodeling.xtuml.profile.executablemodelingprofile.impl.XTransitionImpl
		 * @see com.ericsson.executablemodeling.xtuml.profile.executablemodelingprofile.impl.ExecutableModelingProfilePackageImpl#getXTransition()
		 * @generated
		 */
		EClass XTRANSITION = eINSTANCE.getXTransition();

		/**
		 * The meta object literal for the '<em><b>Base Transition</b></em>' reference feature.
		 * <!-- begin-user-doc -->
		 * <!-- end-user-doc -->
		 * @generated
		 */
		EReference XTRANSITION__BASE_TRANSITION = eINSTANCE.getXTransition_Base_Transition();

		/**
		 * The meta object literal for the '<em><b>XTransition Trigger</b></em>' operation.
		 * <!-- begin-user-doc -->
		 * <!-- end-user-doc -->
		 * @generated
		 */
		EOperation XTRANSITION___XTRANSITION_TRIGGER__DIAGNOSTICCHAIN_MAP = eINSTANCE.getXTransition__XTransitionTrigger__DiagnosticChain_Map();

		/**
		 * The meta object literal for the '<em><b>XTransition Guard</b></em>' operation.
		 * <!-- begin-user-doc -->
		 * <!-- end-user-doc -->
		 * @generated
		 */
		EOperation XTRANSITION___XTRANSITION_GUARD__DIAGNOSTICCHAIN_MAP = eINSTANCE.getXTransition__XTransitionGuard__DiagnosticChain_Map();

		/**
		 * The meta object literal for the '<em><b>XTransition Effect</b></em>' operation.
		 * <!-- begin-user-doc -->
		 * <!-- end-user-doc -->
		 * @generated
		 */
		EOperation XTRANSITION___XTRANSITION_EFFECT__DIAGNOSTICCHAIN_MAP = eINSTANCE.getXTransition__XTransitionEffect__DiagnosticChain_Map();

		/**
		 * The meta object literal for the '{@link com.ericsson.executablemodeling.xtuml.profile.executablemodelingprofile.impl.XActivityImpl <em>XActivity</em>}' class.
		 * <!-- begin-user-doc -->
		 * <!-- end-user-doc -->
		 * @see com.ericsson.executablemodeling.xtuml.profile.executablemodelingprofile.impl.XActivityImpl
		 * @see com.ericsson.executablemodeling.xtuml.profile.executablemodelingprofile.impl.ExecutableModelingProfilePackageImpl#getXActivity()
		 * @generated
		 */
		EClass XACTIVITY = eINSTANCE.getXActivity();

		/**
		 * The meta object literal for the '<em><b>Base Activity</b></em>' reference feature.
		 * <!-- begin-user-doc -->
		 * <!-- end-user-doc -->
		 * @generated
		 */
		EReference XACTIVITY__BASE_ACTIVITY = eINSTANCE.getXActivity_Base_Activity();

		/**
		 * The meta object literal for the '<em><b>XActivity Parameters</b></em>' operation.
		 * <!-- begin-user-doc -->
		 * <!-- end-user-doc -->
		 * @generated
		 */
		EOperation XACTIVITY___XACTIVITY_PARAMETERS__DIAGNOSTICCHAIN_MAP = eINSTANCE.getXActivity__XActivityParameters__DiagnosticChain_Map();

		/**
		 * The meta object literal for the '<em><b>XActivity Textual Representation</b></em>' operation.
		 * <!-- begin-user-doc -->
		 * <!-- end-user-doc -->
		 * @generated
		 */
		EOperation XACTIVITY___XACTIVITY_TEXTUAL_REPRESENTATION__DIAGNOSTICCHAIN_MAP = eINSTANCE.getXActivity__XActivityTextualRepresentation__DiagnosticChain_Map();

		/**
		 * The meta object literal for the '{@link com.ericsson.executablemodeling.xtuml.profile.executablemodelingprofile.impl.XActionBehaviorImpl <em>XAction Behavior</em>}' class.
		 * <!-- begin-user-doc -->
		 * <!-- end-user-doc -->
		 * @see com.ericsson.executablemodeling.xtuml.profile.executablemodelingprofile.impl.XActionBehaviorImpl
		 * @see com.ericsson.executablemodeling.xtuml.profile.executablemodelingprofile.impl.ExecutableModelingProfilePackageImpl#getXActionBehavior()
		 * @generated
		 */
		EClass XACTION_BEHAVIOR = eINSTANCE.getXActionBehavior();

		/**
		 * The meta object literal for the '{@link com.ericsson.executablemodeling.xtuml.profile.executablemodelingprofile.impl.XConstraintImpl <em>XConstraint</em>}' class.
		 * <!-- begin-user-doc -->
		 * <!-- end-user-doc -->
		 * @see com.ericsson.executablemodeling.xtuml.profile.executablemodelingprofile.impl.XConstraintImpl
		 * @see com.ericsson.executablemodeling.xtuml.profile.executablemodelingprofile.impl.ExecutableModelingProfilePackageImpl#getXConstraint()
		 * @generated
		 */
		EClass XCONSTRAINT = eINSTANCE.getXConstraint();

		/**
		 * The meta object literal for the '<em><b>Base Constraint</b></em>' reference feature.
		 * <!-- begin-user-doc -->
		 * <!-- end-user-doc -->
		 * @generated
		 */
		EReference XCONSTRAINT__BASE_CONSTRAINT = eINSTANCE.getXConstraint_Base_Constraint();

		/**
		 * The meta object literal for the '<em><b>XConstraint Specification</b></em>' operation.
		 * <!-- begin-user-doc -->
		 * <!-- end-user-doc -->
		 * @generated
		 */
		EOperation XCONSTRAINT___XCONSTRAINT_SPECIFICATION__DIAGNOSTICCHAIN_MAP = eINSTANCE.getXConstraint__XConstraintSpecification__DiagnosticChain_Map();

		/**
		 * The meta object literal for the '<em><b>XConstraint Behavior</b></em>' operation.
		 * <!-- begin-user-doc -->
		 * <!-- end-user-doc -->
		 * @generated
		 */
		EOperation XCONSTRAINT___XCONSTRAINT_BEHAVIOR__DIAGNOSTICCHAIN_MAP = eINSTANCE.getXConstraint__XConstraintBehavior__DiagnosticChain_Map();

		/**
		 * The meta object literal for the '{@link com.ericsson.executablemodeling.xtuml.profile.executablemodelingprofile.impl.XOpaqueBehaviorImpl <em>XOpaque Behavior</em>}' class.
		 * <!-- begin-user-doc -->
		 * <!-- end-user-doc -->
		 * @see com.ericsson.executablemodeling.xtuml.profile.executablemodelingprofile.impl.XOpaqueBehaviorImpl
		 * @see com.ericsson.executablemodeling.xtuml.profile.executablemodelingprofile.impl.ExecutableModelingProfilePackageImpl#getXOpaqueBehavior()
		 * @generated
		 */
		EClass XOPAQUE_BEHAVIOR = eINSTANCE.getXOpaqueBehavior();

		/**
		 * The meta object literal for the '<em><b>Base Opaque Behavior</b></em>' reference feature.
		 * <!-- begin-user-doc -->
		 * <!-- end-user-doc -->
		 * @generated
		 */
		EReference XOPAQUE_BEHAVIOR__BASE_OPAQUE_BEHAVIOR = eINSTANCE.getXOpaqueBehavior_Base_OpaqueBehavior();

		/**
		 * The meta object literal for the '<em><b>Is External</b></em>' attribute feature.
		 * <!-- begin-user-doc -->
		 * <!-- end-user-doc -->
		 * @generated
		 */
		EAttribute XOPAQUE_BEHAVIOR__IS_EXTERNAL = eINSTANCE.getXOpaqueBehavior_IsExternal();

		/**
		 * The meta object literal for the '<em><b>XOpaque Behavior External</b></em>' operation.
		 * <!-- begin-user-doc -->
		 * <!-- end-user-doc -->
		 * @generated
		 */
		EOperation XOPAQUE_BEHAVIOR___XOPAQUE_BEHAVIOR_EXTERNAL__DIAGNOSTICCHAIN_MAP = eINSTANCE.getXOpaqueBehavior__XOpaqueBehaviorExternal__DiagnosticChain_Map();

		/**
		 * The meta object literal for the '{@link com.ericsson.executablemodeling.xtuml.profile.executablemodelingprofile.impl.XConstrainedTypeImpl <em>XConstrained Type</em>}' class.
		 * <!-- begin-user-doc -->
		 * <!-- end-user-doc -->
		 * @see com.ericsson.executablemodeling.xtuml.profile.executablemodelingprofile.impl.XConstrainedTypeImpl
		 * @see com.ericsson.executablemodeling.xtuml.profile.executablemodelingprofile.impl.ExecutableModelingProfilePackageImpl#getXConstrainedType()
		 * @generated
		 */
		EClass XCONSTRAINED_TYPE = eINSTANCE.getXConstrainedType();

		/**
		 * The meta object literal for the '<em><b>Base Primitive Type</b></em>' reference feature.
		 * <!-- begin-user-doc -->
		 * <!-- end-user-doc -->
		 * @generated
		 */
		EReference XCONSTRAINED_TYPE__BASE_PRIMITIVE_TYPE = eINSTANCE.getXConstrainedType_Base_PrimitiveType();

		/**
		 * The meta object literal for the '<em><b>Lower Bound</b></em>' reference feature.
		 * <!-- begin-user-doc -->
		 * <!-- end-user-doc -->
		 * @generated
		 */
		EReference XCONSTRAINED_TYPE__LOWER_BOUND = eINSTANCE.getXConstrainedType_LowerBound();

		/**
		 * The meta object literal for the '<em><b>Upper Bound</b></em>' reference feature.
		 * <!-- begin-user-doc -->
		 * <!-- end-user-doc -->
		 * @generated
		 */
		EReference XCONSTRAINED_TYPE__UPPER_BOUND = eINSTANCE.getXConstrainedType_UpperBound();

		/**
		 * The meta object literal for the '<em><b>Is Lower Bound Exclusive</b></em>' attribute feature.
		 * <!-- begin-user-doc -->
		 * <!-- end-user-doc -->
		 * @generated
		 */
		EAttribute XCONSTRAINED_TYPE__IS_LOWER_BOUND_EXCLUSIVE = eINSTANCE.getXConstrainedType_IsLowerBoundExclusive();

		/**
		 * The meta object literal for the '<em><b>Is Upper Bound Exclusive</b></em>' attribute feature.
		 * <!-- begin-user-doc -->
		 * <!-- end-user-doc -->
		 * @generated
		 */
		EAttribute XCONSTRAINED_TYPE__IS_UPPER_BOUND_EXCLUSIVE = eINSTANCE.getXConstrainedType_IsUpperBoundExclusive();

		/**
		 * The meta object literal for the '<em><b>XConstrained Type Primitive Type</b></em>' operation.
		 * <!-- begin-user-doc -->
		 * <!-- end-user-doc -->
		 * @generated
		 */
		EOperation XCONSTRAINED_TYPE___XCONSTRAINED_TYPE_PRIMITIVE_TYPE__DIAGNOSTICCHAIN_MAP = eINSTANCE.getXConstrainedType__XConstrainedTypePrimitiveType__DiagnosticChain_Map();

		/**
		 * The meta object literal for the '<em><b>XConstrained Type Bounds</b></em>' operation.
		 * <!-- begin-user-doc -->
		 * <!-- end-user-doc -->
		 * @generated
		 */
		EOperation XCONSTRAINED_TYPE___XCONSTRAINED_TYPE_BOUNDS__DIAGNOSTICCHAIN_MAP = eINSTANCE.getXConstrainedType__XConstrainedTypeBounds__DiagnosticChain_Map();

		/**
		 * The meta object literal for the '{@link com.ericsson.executablemodeling.xtuml.profile.executablemodelingprofile.impl.XGeneralizationImpl <em>XGeneralization</em>}' class.
		 * <!-- begin-user-doc -->
		 * <!-- end-user-doc -->
		 * @see com.ericsson.executablemodeling.xtuml.profile.executablemodelingprofile.impl.XGeneralizationImpl
		 * @see com.ericsson.executablemodeling.xtuml.profile.executablemodelingprofile.impl.ExecutableModelingProfilePackageImpl#getXGeneralization()
		 * @generated
		 */
		EClass XGENERALIZATION = eINSTANCE.getXGeneralization();

		/**
		 * The meta object literal for the '<em><b>Base Generalization</b></em>' reference feature.
		 * <!-- begin-user-doc -->
		 * <!-- end-user-doc -->
		 * @generated
		 */
		EReference XGENERALIZATION__BASE_GENERALIZATION = eINSTANCE.getXGeneralization_Base_Generalization();

		/**
		 * The meta object literal for the '<em><b>XGeneralization Classifiers</b></em>' operation.
		 * <!-- begin-user-doc -->
		 * <!-- end-user-doc -->
		 * @generated
		 */
		EOperation XGENERALIZATION___XGENERALIZATION_CLASSIFIERS__DIAGNOSTICCHAIN_MAP = eINSTANCE.getXGeneralization__XGeneralizationClassifiers__DiagnosticChain_Map();

		/**
		 * The meta object literal for the '<em><b>XGeneralization Generalization Set</b></em>' operation.
		 * <!-- begin-user-doc -->
		 * <!-- end-user-doc -->
		 * @generated
		 */
		EOperation XGENERALIZATION___XGENERALIZATION_GENERALIZATION_SET__DIAGNOSTICCHAIN_MAP = eINSTANCE.getXGeneralization__XGeneralizationGeneralizationSet__DiagnosticChain_Map();

		/**
		 * The meta object literal for the '{@link com.ericsson.executablemodeling.xtuml.profile.executablemodelingprofile.impl.XGeneralizationSetImpl <em>XGeneralization Set</em>}' class.
		 * <!-- begin-user-doc -->
		 * <!-- end-user-doc -->
		 * @see com.ericsson.executablemodeling.xtuml.profile.executablemodelingprofile.impl.XGeneralizationSetImpl
		 * @see com.ericsson.executablemodeling.xtuml.profile.executablemodelingprofile.impl.ExecutableModelingProfilePackageImpl#getXGeneralizationSet()
		 * @generated
		 */
		EClass XGENERALIZATION_SET = eINSTANCE.getXGeneralizationSet();

		/**
		 * The meta object literal for the '<em><b>Base Generalization Set</b></em>' reference feature.
		 * <!-- begin-user-doc -->
		 * <!-- end-user-doc -->
		 * @generated
		 */
		EReference XGENERALIZATION_SET__BASE_GENERALIZATION_SET = eINSTANCE.getXGeneralizationSet_Base_GeneralizationSet();

		/**
		 * The meta object literal for the '{@link com.ericsson.executablemodeling.xtuml.profile.executablemodelingprofile.impl.XClassImpl <em>XClass</em>}' class.
		 * <!-- begin-user-doc -->
		 * <!-- end-user-doc -->
		 * @see com.ericsson.executablemodeling.xtuml.profile.executablemodelingprofile.impl.XClassImpl
		 * @see com.ericsson.executablemodeling.xtuml.profile.executablemodelingprofile.impl.ExecutableModelingProfilePackageImpl#getXClass()
		 * @generated
		 */
		EClass XCLASS = eINSTANCE.getXClass();

		/**
		 * The meta object literal for the '<em><b>Base Class</b></em>' reference feature.
		 * <!-- begin-user-doc -->
		 * <!-- end-user-doc -->
		 * @generated
		 */
		EReference XCLASS__BASE_CLASS = eINSTANCE.getXClass_Base_Class();

		/**
		 * The meta object literal for the '<em><b>Is External</b></em>' attribute feature.
		 * <!-- begin-user-doc -->
		 * <!-- end-user-doc -->
		 * @generated
		 */
		EAttribute XCLASS__IS_EXTERNAL = eINSTANCE.getXClass_IsExternal();

		/**
		 * The meta object literal for the '<em><b>XClass Metaclass</b></em>' operation.
		 * <!-- begin-user-doc -->
		 * <!-- end-user-doc -->
		 * @generated
		 */
		EOperation XCLASS___XCLASS_METACLASS__DIAGNOSTICCHAIN_MAP = eINSTANCE.getXClass__XClassMetaclass__DiagnosticChain_Map();

		/**
		 * The meta object literal for the '<em><b>XClass Nested Classifiers</b></em>' operation.
		 * <!-- begin-user-doc -->
		 * <!-- end-user-doc -->
		 * @generated
		 */
		EOperation XCLASS___XCLASS_NESTED_CLASSIFIERS__DIAGNOSTICCHAIN_MAP = eINSTANCE.getXClass__XClassNestedClassifiers__DiagnosticChain_Map();

		/**
		 * The meta object literal for the '<em><b>XClass External</b></em>' operation.
		 * <!-- begin-user-doc -->
		 * <!-- end-user-doc -->
		 * @generated
		 */
		EOperation XCLASS___XCLASS_EXTERNAL__DIAGNOSTICCHAIN_MAP = eINSTANCE.getXClass__XClassExternal__DiagnosticChain_Map();

		/**
		 * The meta object literal for the '{@link com.ericsson.executablemodeling.xtuml.profile.executablemodelingprofile.impl.XConnectorEndImpl <em>XConnector End</em>}' class.
		 * <!-- begin-user-doc -->
		 * <!-- end-user-doc -->
		 * @see com.ericsson.executablemodeling.xtuml.profile.executablemodelingprofile.impl.XConnectorEndImpl
		 * @see com.ericsson.executablemodeling.xtuml.profile.executablemodelingprofile.impl.ExecutableModelingProfilePackageImpl#getXConnectorEnd()
		 * @generated
		 */
		EClass XCONNECTOR_END = eINSTANCE.getXConnectorEnd();

		/**
		 * The meta object literal for the '<em><b>Base Connector End</b></em>' reference feature.
		 * <!-- begin-user-doc -->
		 * <!-- end-user-doc -->
		 * @generated
		 */
		EReference XCONNECTOR_END__BASE_CONNECTOR_END = eINSTANCE.getXConnectorEnd_Base_ConnectorEnd();

		/**
		 * The meta object literal for the '<em><b>XConnector End Connector</b></em>' operation.
		 * <!-- begin-user-doc -->
		 * <!-- end-user-doc -->
		 * @generated
		 */
		EOperation XCONNECTOR_END___XCONNECTOR_END_CONNECTOR__DIAGNOSTICCHAIN_MAP = eINSTANCE.getXConnectorEnd__XConnectorEndConnector__DiagnosticChain_Map();

		/**
		 * The meta object literal for the '<em><b>XConnector End Role</b></em>' operation.
		 * <!-- begin-user-doc -->
		 * <!-- end-user-doc -->
		 * @generated
		 */
		EOperation XCONNECTOR_END___XCONNECTOR_END_ROLE__DIAGNOSTICCHAIN_MAP = eINSTANCE.getXConnectorEnd__XConnectorEndRole__DiagnosticChain_Map();

		/**
		 * The meta object literal for the '<em><b>XConnector End Uniqueness</b></em>' operation.
		 * <!-- begin-user-doc -->
		 * <!-- end-user-doc -->
		 * @generated
		 */
		EOperation XCONNECTOR_END___XCONNECTOR_END_UNIQUENESS__DIAGNOSTICCHAIN_MAP = eINSTANCE.getXConnectorEnd__XConnectorEndUniqueness__DiagnosticChain_Map();

		/**
		 * The meta object literal for the '{@link com.ericsson.executablemodeling.xtuml.profile.executablemodelingprofile.XMessageKind <em>XMessage Kind</em>}' enum.
		 * <!-- begin-user-doc -->
		 * <!-- end-user-doc -->
		 * @see com.ericsson.executablemodeling.xtuml.profile.executablemodelingprofile.XMessageKind
		 * @see com.ericsson.executablemodeling.xtuml.profile.executablemodelingprofile.impl.ExecutableModelingProfilePackageImpl#getXMessageKind()
		 * @generated
		 */
		EEnum XMESSAGE_KIND = eINSTANCE.getXMessageKind();

	}

} //ExecutableModelingProfilePackage
