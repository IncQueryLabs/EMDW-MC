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
package com.ericsson.executablemodeling.xtuml.profile.executablemodelingprofile.util;

import com.ericsson.executablemodeling.xtuml.profile.executablemodelingprofile.*;

import java.util.Map;

import org.eclipse.emf.common.util.DiagnosticChain;
import org.eclipse.emf.common.util.ResourceLocator;

import org.eclipse.emf.ecore.EPackage;

import org.eclipse.emf.ecore.util.EObjectValidator;

/**
 * <!-- begin-user-doc -->
 * The <b>Validator</b> for the model.
 * <!-- end-user-doc -->
 * @see com.ericsson.executablemodeling.xtuml.profile.executablemodelingprofile.ExecutableModelingProfilePackage
 * @generated
 */
public class ExecutableModelingProfileValidator extends EObjectValidator {
	/**
	 * The cached model package
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 */
	public static final ExecutableModelingProfileValidator INSTANCE = new ExecutableModelingProfileValidator();

	/**
	 * A constant for the {@link org.eclipse.emf.common.util.Diagnostic#getSource() source} of diagnostic {@link org.eclipse.emf.common.util.Diagnostic#getCode() codes} from this package.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @see org.eclipse.emf.common.util.Diagnostic#getSource()
	 * @see org.eclipse.emf.common.util.Diagnostic#getCode()
	 * @generated
	 */
	public static final String DIAGNOSTIC_SOURCE = "com.ericsson.executablemodeling.xtuml.profile.executablemodelingprofile";

	/**
	 * The {@link org.eclipse.emf.common.util.Diagnostic#getCode() code} for constraint 'XOperation Parameters' of 'XOperation'.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 */
	public static final int XOPERATION__XOPERATION_PARAMETERS = 1;

	/**
	 * The {@link org.eclipse.emf.common.util.Diagnostic#getCode() code} for constraint 'XOperation One Method' of 'XOperation'.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 */
	public static final int XOPERATION__XOPERATION_ONE_METHOD = 2;

	/**
	 * The {@link org.eclipse.emf.common.util.Diagnostic#getCode() code} for constraint 'XOperation Imports' of 'XOperation'.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 */
	public static final int XOPERATION__XOPERATION_IMPORTS = 3;

	/**
	 * The {@link org.eclipse.emf.common.util.Diagnostic#getCode() code} for constraint 'XOperation Owned Rules' of 'XOperation'.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 */
	public static final int XOPERATION__XOPERATION_OWNED_RULES = 4;

	/**
	 * The {@link org.eclipse.emf.common.util.Diagnostic#getCode() code} for constraint 'XOperation Methods' of 'XOperation'.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 */
	public static final int XOPERATION__XOPERATION_METHODS = 5;

	/**
	 * The {@link org.eclipse.emf.common.util.Diagnostic#getCode() code} for constraint 'XOperation Constraints' of 'XOperation'.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 */
	public static final int XOPERATION__XOPERATION_CONSTRAINTS = 6;

	/**
	 * The {@link org.eclipse.emf.common.util.Diagnostic#getCode() code} for constraint 'XNamed Element Name' of 'XNamed Element'.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 */
	public static final int XNAMED_ELEMENT__XNAMED_ELEMENT_NAME = 7;

	/**
	 * The {@link org.eclipse.emf.common.util.Diagnostic#getCode() code} for constraint 'XFeature Classifier' of 'XFeature'.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 */
	public static final int XFEATURE__XFEATURE_CLASSIFIER = 8;

	/**
	 * The {@link org.eclipse.emf.common.util.Diagnostic#getCode() code} for constraint 'XAssociation Is Binary' of 'XAssociation'.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 */
	public static final int XASSOCIATION__XASSOCIATION_IS_BINARY = 9;

	/**
	 * The {@link org.eclipse.emf.common.util.Diagnostic#getCode() code} for constraint 'XClassifier Features' of 'XClassifier'.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 */
	public static final int XCLASSIFIER__XCLASSIFIER_FEATURES = 10;

	/**
	 * The {@link org.eclipse.emf.common.util.Diagnostic#getCode() code} for constraint 'XClassifier Nested Classifiers' of 'XClassifier'.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 */
	public static final int XCLASSIFIER__XCLASSIFIER_NESTED_CLASSIFIERS = 11;

	/**
	 * The {@link org.eclipse.emf.common.util.Diagnostic#getCode() code} for constraint 'XClassifier Generals' of 'XClassifier'.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 */
	public static final int XCLASSIFIER__XCLASSIFIER_GENERALS = 12;

	/**
	 * The {@link org.eclipse.emf.common.util.Diagnostic#getCode() code} for constraint 'XClassifier Constraints' of 'XClassifier'.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 */
	public static final int XCLASSIFIER__XCLASSIFIER_CONSTRAINTS = 13;

	/**
	 * The {@link org.eclipse.emf.common.util.Diagnostic#getCode() code} for constraint 'XBehavior No Parameter Sets' of 'XBehavior'.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 */
	public static final int XBEHAVIOR__XBEHAVIOR_NO_PARAMETER_SETS = 14;

	/**
	 * The {@link org.eclipse.emf.common.util.Diagnostic#getCode() code} for constraint 'XEncapsulated Classifier Ports' of 'XEncapsulated Classifier'.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 */
	public static final int XENCAPSULATED_CLASSIFIER__XENCAPSULATED_CLASSIFIER_PORTS = 15;

	/**
	 * The {@link org.eclipse.emf.common.util.Diagnostic#getCode() code} for constraint 'XEncapsulated Classifierconnectors' of 'XEncapsulated Classifier'.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 */
	public static final int XENCAPSULATED_CLASSIFIER__XENCAPSULATED_CLASSIFIERCONNECTORS = 16;

	/**
	 * The {@link org.eclipse.emf.common.util.Diagnostic#getCode() code} for constraint 'XEncapsulated Classifier External' of 'XEncapsulated Classifier'.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 */
	public static final int XENCAPSULATED_CLASSIFIER__XENCAPSULATED_CLASSIFIER_EXTERNAL = 17;

	/**
	 * The {@link org.eclipse.emf.common.util.Diagnostic#getCode() code} for constraint 'XProtocol Incoming Interface' of 'XProtocol'.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 */
	public static final int XPROTOCOL__XPROTOCOL_INCOMING_INTERFACE = 18;

	/**
	 * The {@link org.eclipse.emf.common.util.Diagnostic#getCode() code} for constraint 'XProtocol Protocol Container' of 'XProtocol'.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 */
	public static final int XPROTOCOL__XPROTOCOL_PROTOCOL_CONTAINER = 19;

	/**
	 * The {@link org.eclipse.emf.common.util.Diagnostic#getCode() code} for constraint 'XProtocol Outgoing Interface' of 'XProtocol'.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 */
	public static final int XPROTOCOL__XPROTOCOL_OUTGOING_INTERFACE = 20;

	/**
	 * The {@link org.eclipse.emf.common.util.Diagnostic#getCode() code} for constraint 'XProtocol Symmetric Interface' of 'XProtocol'.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 */
	public static final int XPROTOCOL__XPROTOCOL_SYMMETRIC_INTERFACE = 21;

	/**
	 * The {@link org.eclipse.emf.common.util.Diagnostic#getCode() code} for constraint 'XSignal Visibility' of 'XSignal'.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 */
	public static final int XSIGNAL__XSIGNAL_VISIBILITY = 22;

	/**
	 * The {@link org.eclipse.emf.common.util.Diagnostic#getCode() code} for constraint 'XData Type Operations' of 'XData Type'.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 */
	public static final int XDATA_TYPE__XDATA_TYPE_OPERATIONS = 23;

	/**
	 * The {@link org.eclipse.emf.common.util.Diagnostic#getCode() code} for constraint 'XTyped Element Type' of 'XTyped Element'.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 */
	public static final int XTYPED_ELEMENT__XTYPED_ELEMENT_TYPE = 24;

	/**
	 * The {@link org.eclipse.emf.common.util.Diagnostic#getCode() code} for constraint 'XMultiplicity Element Is Ordered By Value' of 'XMultiplicity Element'.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 */
	public static final int XMULTIPLICITY_ELEMENT__XMULTIPLICITY_ELEMENT_IS_ORDERED_BY_VALUE = 25;

	/**
	 * The {@link org.eclipse.emf.common.util.Diagnostic#getCode() code} for constraint 'XMultiplicity Element Keys' of 'XMultiplicity Element'.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 */
	public static final int XMULTIPLICITY_ELEMENT__XMULTIPLICITY_ELEMENT_KEYS = 26;

	/**
	 * The {@link org.eclipse.emf.common.util.Diagnostic#getCode() code} for constraint 'XReception Signal' of 'XReception'.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 */
	public static final int XRECEPTION__XRECEPTION_SIGNAL = 27;

	/**
	 * The {@link org.eclipse.emf.common.util.Diagnostic#getCode() code} for constraint 'XPart Classifier' of 'XPart'.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 */
	public static final int XPART__XPART_CLASSIFIER = 28;

	/**
	 * The {@link org.eclipse.emf.common.util.Diagnostic#getCode() code} for constraint 'XPort Classifier' of 'XPort'.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 */
	public static final int XPORT__XPORT_CLASSIFIER = 29;

	/**
	 * The {@link org.eclipse.emf.common.util.Diagnostic#getCode() code} for constraint 'XPort Ordering Uniqueness' of 'XPort'.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 */
	public static final int XPORT__XPORT_ORDERING_UNIQUENESS = 30;

	/**
	 * The {@link org.eclipse.emf.common.util.Diagnostic#getCode() code} for constraint 'XPort Type' of 'XPort'.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 */
	public static final int XPORT__XPORT_TYPE = 31;

	/**
	 * The {@link org.eclipse.emf.common.util.Diagnostic#getCode() code} for constraint 'XPort Behavior Port' of 'XPort'.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 */
	public static final int XPORT__XPORT_BEHAVIOR_PORT = 32;

	/**
	 * The {@link org.eclipse.emf.common.util.Diagnostic#getCode() code} for constraint 'XPort Visibility' of 'XPort'.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 */
	public static final int XPORT__XPORT_VISIBILITY = 33;

	/**
	 * The {@link org.eclipse.emf.common.util.Diagnostic#getCode() code} for constraint 'XConnector Classifier' of 'XConnector'.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 */
	public static final int XCONNECTOR__XCONNECTOR_CLASSIFIER = 34;

	/**
	 * The {@link org.eclipse.emf.common.util.Diagnostic#getCode() code} for constraint 'XConnector Ends' of 'XConnector'.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 */
	public static final int XCONNECTOR__XCONNECTOR_ENDS = 35;

	/**
	 * The {@link org.eclipse.emf.common.util.Diagnostic#getCode() code} for constraint 'Xt Connector Type' of 'XConnector'.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 */
	public static final int XCONNECTOR__XT_CONNECTOR_TYPE = 36;

	/**
	 * The {@link org.eclipse.emf.common.util.Diagnostic#getCode() code} for constraint 'XProtocol Container Protocol' of 'XProtocol Container'.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 */
	public static final int XPROTOCOL_CONTAINER__XPROTOCOL_CONTAINER_PROTOCOL = 37;

	/**
	 * The {@link org.eclipse.emf.common.util.Diagnostic#getCode() code} for constraint 'XMessage Set Incoming' of 'XMessage Set'.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 */
	public static final int XMESSAGE_SET__XMESSAGE_SET_INCOMING = 38;

	/**
	 * The {@link org.eclipse.emf.common.util.Diagnostic#getCode() code} for constraint 'XMessage Set Outgoing' of 'XMessage Set'.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 */
	public static final int XMESSAGE_SET__XMESSAGE_SET_OUTGOING = 39;

	/**
	 * The {@link org.eclipse.emf.common.util.Diagnostic#getCode() code} for constraint 'XMessage Set Symmetric' of 'XMessage Set'.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 */
	public static final int XMESSAGE_SET__XMESSAGE_SET_SYMMETRIC = 40;

	/**
	 * The {@link org.eclipse.emf.common.util.Diagnostic#getCode() code} for constraint 'XEnumeration Attributes' of 'XEnumeration'.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 */
	public static final int XENUMERATION__XENUMERATION_ATTRIBUTES = 41;

	/**
	 * The {@link org.eclipse.emf.common.util.Diagnostic#getCode() code} for constraint 'XTrigger Signal Reception' of 'XTrigger'.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 */
	public static final int XTRIGGER__XTRIGGER_SIGNAL_RECEPTION = 42;

	/**
	 * The {@link org.eclipse.emf.common.util.Diagnostic#getCode() code} for constraint 'XTrigger Events' of 'XTrigger'.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 */
	public static final int XTRIGGER__XTRIGGER_EVENTS = 43;

	/**
	 * The {@link org.eclipse.emf.common.util.Diagnostic#getCode() code} for constraint 'XTrigger Called Operation' of 'XTrigger'.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 */
	public static final int XTRIGGER__XTRIGGER_CALLED_OPERATION = 44;

	/**
	 * The {@link org.eclipse.emf.common.util.Diagnostic#getCode() code} for constraint 'XState Machine One Region' of 'XState Machine'.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 */
	public static final int XSTATE_MACHINE__XSTATE_MACHINE_ONE_REGION = 45;

	/**
	 * The {@link org.eclipse.emf.common.util.Diagnostic#getCode() code} for constraint 'XState Machine Initial State' of 'XState Machine'.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 */
	public static final int XSTATE_MACHINE__XSTATE_MACHINE_INITIAL_STATE = 46;

	/**
	 * The {@link org.eclipse.emf.common.util.Diagnostic#getCode() code} for constraint 'XState Machine Context' of 'XState Machine'.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 */
	public static final int XSTATE_MACHINE__XSTATE_MACHINE_CONTEXT = 47;

	/**
	 * The {@link org.eclipse.emf.common.util.Diagnostic#getCode() code} for constraint 'XState Machine No Parameters' of 'XState Machine'.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 */
	public static final int XSTATE_MACHINE__XSTATE_MACHINE_NO_PARAMETERS = 48;

	/**
	 * The {@link org.eclipse.emf.common.util.Diagnostic#getCode() code} for constraint 'XState Machine Regions' of 'XState Machine'.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 */
	public static final int XSTATE_MACHINE__XSTATE_MACHINE_REGIONS = 49;

	/**
	 * The {@link org.eclipse.emf.common.util.Diagnostic#getCode() code} for constraint 'XRegion Subvertexes' of 'XRegion'.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 */
	public static final int XREGION__XREGION_SUBVERTEXES = 50;

	/**
	 * The {@link org.eclipse.emf.common.util.Diagnostic#getCode() code} for constraint 'XRegion Transitions' of 'XRegion'.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 */
	public static final int XREGION__XREGION_TRANSITIONS = 51;

	/**
	 * The {@link org.eclipse.emf.common.util.Diagnostic#getCode() code} for constraint 'XState Behaviors' of 'XState'.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 */
	public static final int XSTATE__XSTATE_BEHAVIORS = 52;

	/**
	 * The {@link org.eclipse.emf.common.util.Diagnostic#getCode() code} for constraint 'XState No Do Activity' of 'XState'.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 */
	public static final int XSTATE__XSTATE_NO_DO_ACTIVITY = 53;

	/**
	 * The {@link org.eclipse.emf.common.util.Diagnostic#getCode() code} for constraint 'XState One Region' of 'XState'.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 */
	public static final int XSTATE__XSTATE_ONE_REGION = 54;

	/**
	 * The {@link org.eclipse.emf.common.util.Diagnostic#getCode() code} for constraint 'XState No Submachine' of 'XState'.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 */
	public static final int XSTATE__XSTATE_NO_SUBMACHINE = 55;

	/**
	 * The {@link org.eclipse.emf.common.util.Diagnostic#getCode() code} for constraint 'XState Regions' of 'XState'.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 */
	public static final int XSTATE__XSTATE_REGIONS = 56;

	/**
	 * The {@link org.eclipse.emf.common.util.Diagnostic#getCode() code} for constraint 'XPsuedostate Kind' of 'XPseudostate'.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 */
	public static final int XPSEUDOSTATE__XPSUEDOSTATE_KIND = 57;

	/**
	 * The {@link org.eclipse.emf.common.util.Diagnostic#getCode() code} for constraint 'XTransition Trigger' of 'XTransition'.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 */
	public static final int XTRANSITION__XTRANSITION_TRIGGER = 58;

	/**
	 * The {@link org.eclipse.emf.common.util.Diagnostic#getCode() code} for constraint 'XTransition Guard' of 'XTransition'.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 */
	public static final int XTRANSITION__XTRANSITION_GUARD = 59;

	/**
	 * The {@link org.eclipse.emf.common.util.Diagnostic#getCode() code} for constraint 'XTransition Effect' of 'XTransition'.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 */
	public static final int XTRANSITION__XTRANSITION_EFFECT = 60;

	/**
	 * The {@link org.eclipse.emf.common.util.Diagnostic#getCode() code} for constraint 'XActivity Parameters' of 'XActivity'.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 */
	public static final int XACTIVITY__XACTIVITY_PARAMETERS = 61;

	/**
	 * The {@link org.eclipse.emf.common.util.Diagnostic#getCode() code} for constraint 'XActivity Textual Representation' of 'XActivity'.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 */
	public static final int XACTIVITY__XACTIVITY_TEXTUAL_REPRESENTATION = 62;

	/**
	 * The {@link org.eclipse.emf.common.util.Diagnostic#getCode() code} for constraint 'XConstraint Specification' of 'XConstraint'.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 */
	public static final int XCONSTRAINT__XCONSTRAINT_SPECIFICATION = 63;

	/**
	 * The {@link org.eclipse.emf.common.util.Diagnostic#getCode() code} for constraint 'XConstraint Behavior' of 'XConstraint'.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 */
	public static final int XCONSTRAINT__XCONSTRAINT_BEHAVIOR = 64;

	/**
	 * The {@link org.eclipse.emf.common.util.Diagnostic#getCode() code} for constraint 'XOpaque Behavior External' of 'XOpaque Behavior'.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 */
	public static final int XOPAQUE_BEHAVIOR__XOPAQUE_BEHAVIOR_EXTERNAL = 65;

	/**
	 * The {@link org.eclipse.emf.common.util.Diagnostic#getCode() code} for constraint 'XConstrained Type Primitive Type' of 'XConstrained Type'.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 */
	public static final int XCONSTRAINED_TYPE__XCONSTRAINED_TYPE_PRIMITIVE_TYPE = 66;

	/**
	 * The {@link org.eclipse.emf.common.util.Diagnostic#getCode() code} for constraint 'XConstrained Type Bounds' of 'XConstrained Type'.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 */
	public static final int XCONSTRAINED_TYPE__XCONSTRAINED_TYPE_BOUNDS = 67;

	/**
	 * The {@link org.eclipse.emf.common.util.Diagnostic#getCode() code} for constraint 'XGeneralization Classifiers' of 'XGeneralization'.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 */
	public static final int XGENERALIZATION__XGENERALIZATION_CLASSIFIERS = 68;

	/**
	 * The {@link org.eclipse.emf.common.util.Diagnostic#getCode() code} for constraint 'XGeneralization Generalization Set' of 'XGeneralization'.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 */
	public static final int XGENERALIZATION__XGENERALIZATION_GENERALIZATION_SET = 69;

	/**
	 * The {@link org.eclipse.emf.common.util.Diagnostic#getCode() code} for constraint 'XClass Metaclass' of 'XClass'.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 */
	public static final int XCLASS__XCLASS_METACLASS = 70;

	/**
	 * The {@link org.eclipse.emf.common.util.Diagnostic#getCode() code} for constraint 'XClass Nested Classifiers' of 'XClass'.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 */
	public static final int XCLASS__XCLASS_NESTED_CLASSIFIERS = 71;

	/**
	 * The {@link org.eclipse.emf.common.util.Diagnostic#getCode() code} for constraint 'XClass External' of 'XClass'.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 */
	public static final int XCLASS__XCLASS_EXTERNAL = 72;

	/**
	 * The {@link org.eclipse.emf.common.util.Diagnostic#getCode() code} for constraint 'XConnector End Connector' of 'XConnector End'.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 */
	public static final int XCONNECTOR_END__XCONNECTOR_END_CONNECTOR = 73;

	/**
	 * The {@link org.eclipse.emf.common.util.Diagnostic#getCode() code} for constraint 'XConnector End Role' of 'XConnector End'.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 */
	public static final int XCONNECTOR_END__XCONNECTOR_END_ROLE = 74;

	/**
	 * The {@link org.eclipse.emf.common.util.Diagnostic#getCode() code} for constraint 'XConnector End Uniqueness' of 'XConnector End'.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 */
	public static final int XCONNECTOR_END__XCONNECTOR_END_UNIQUENESS = 75;

	/**
	 * A constant with a fixed name that can be used as the base value for additional hand written constants.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 */
	private static final int GENERATED_DIAGNOSTIC_CODE_COUNT = 75;

	/**
	 * A constant with a fixed name that can be used as the base value for additional hand written constants in a derived class.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 */
	protected static final int DIAGNOSTIC_CODE_COUNT = GENERATED_DIAGNOSTIC_CODE_COUNT;

	/**
	 * Creates an instance of the switch.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 */
	public ExecutableModelingProfileValidator() {
		super();
	}

	/**
	 * Returns the package of this validator switch.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 */
	@Override
	protected EPackage getEPackage() {
	  return ExecutableModelingProfilePackage.eINSTANCE;
	}

	/**
	 * Calls <code>validateXXX</code> for the corresponding classifier of the model.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 */
	@Override
	protected boolean validate(int classifierID, Object value, DiagnosticChain diagnostics, Map<Object, Object> context) {
		switch (classifierID) {
			case ExecutableModelingProfilePackage.XOPERATION:
				return validateXOperation((XOperation)value, diagnostics, context);
			case ExecutableModelingProfilePackage.XNAMESPACE:
				return validateXNamespace((XNamespace)value, diagnostics, context);
			case ExecutableModelingProfilePackage.XNAMED_ELEMENT:
				return validateXNamedElement((XNamedElement)value, diagnostics, context);
			case ExecutableModelingProfilePackage.XFEATURE:
				return validateXFeature((XFeature)value, diagnostics, context);
			case ExecutableModelingProfilePackage.XASSOCIATION:
				return validateXAssociation((XAssociation)value, diagnostics, context);
			case ExecutableModelingProfilePackage.XCLASSIFIER:
				return validateXClassifier((XClassifier)value, diagnostics, context);
			case ExecutableModelingProfilePackage.XBEHAVIOR:
				return validateXBehavior((XBehavior)value, diagnostics, context);
			case ExecutableModelingProfilePackage.XENCAPSULATED_CLASSIFIER:
				return validateXEncapsulatedClassifier((XEncapsulatedClassifier)value, diagnostics, context);
			case ExecutableModelingProfilePackage.XPROTOCOL:
				return validateXProtocol((XProtocol)value, diagnostics, context);
			case ExecutableModelingProfilePackage.XSIGNAL:
				return validateXSignal((XSignal)value, diagnostics, context);
			case ExecutableModelingProfilePackage.XDATA_TYPE:
				return validateXDataType((XDataType)value, diagnostics, context);
			case ExecutableModelingProfilePackage.XPARAMETER:
				return validateXParameter((XParameter)value, diagnostics, context);
			case ExecutableModelingProfilePackage.XTYPED_ELEMENT:
				return validateXTypedElement((XTypedElement)value, diagnostics, context);
			case ExecutableModelingProfilePackage.XPROPERTY:
				return validateXProperty((XProperty)value, diagnostics, context);
			case ExecutableModelingProfilePackage.XMULTIPLICITY_ELEMENT:
				return validateXMultiplicityElement((XMultiplicityElement)value, diagnostics, context);
			case ExecutableModelingProfilePackage.XRECEPTION:
				return validateXReception((XReception)value, diagnostics, context);
			case ExecutableModelingProfilePackage.XPART:
				return validateXPart((XPart)value, diagnostics, context);
			case ExecutableModelingProfilePackage.XPORT:
				return validateXPort((XPort)value, diagnostics, context);
			case ExecutableModelingProfilePackage.XCONNECTOR:
				return validateXConnector((XConnector)value, diagnostics, context);
			case ExecutableModelingProfilePackage.XPROTOCOL_CONTAINER:
				return validateXProtocolContainer((XProtocolContainer)value, diagnostics, context);
			case ExecutableModelingProfilePackage.XMESSAGE_SET:
				return validateXMessageSet((XMessageSet)value, diagnostics, context);
			case ExecutableModelingProfilePackage.XENUMERATION:
				return validateXEnumeration((XEnumeration)value, diagnostics, context);
			case ExecutableModelingProfilePackage.XASSOCIATION_CLASS:
				return validateXAssociationClass((XAssociationClass)value, diagnostics, context);
			case ExecutableModelingProfilePackage.XTRIGGER:
				return validateXTrigger((XTrigger)value, diagnostics, context);
			case ExecutableModelingProfilePackage.XSTATE_MACHINE:
				return validateXStateMachine((XStateMachine)value, diagnostics, context);
			case ExecutableModelingProfilePackage.XREGION:
				return validateXRegion((XRegion)value, diagnostics, context);
			case ExecutableModelingProfilePackage.XSTATE:
				return validateXState((XState)value, diagnostics, context);
			case ExecutableModelingProfilePackage.XVERTEX:
				return validateXVertex((XVertex)value, diagnostics, context);
			case ExecutableModelingProfilePackage.XPSEUDOSTATE:
				return validateXPseudostate((XPseudostate)value, diagnostics, context);
			case ExecutableModelingProfilePackage.XTRANSITION:
				return validateXTransition((XTransition)value, diagnostics, context);
			case ExecutableModelingProfilePackage.XACTIVITY:
				return validateXActivity((XActivity)value, diagnostics, context);
			case ExecutableModelingProfilePackage.XACTION_BEHAVIOR:
				return validateXActionBehavior((XActionBehavior)value, diagnostics, context);
			case ExecutableModelingProfilePackage.XCONSTRAINT:
				return validateXConstraint((XConstraint)value, diagnostics, context);
			case ExecutableModelingProfilePackage.XOPAQUE_BEHAVIOR:
				return validateXOpaqueBehavior((XOpaqueBehavior)value, diagnostics, context);
			case ExecutableModelingProfilePackage.XCONSTRAINED_TYPE:
				return validateXConstrainedType((XConstrainedType)value, diagnostics, context);
			case ExecutableModelingProfilePackage.XGENERALIZATION:
				return validateXGeneralization((XGeneralization)value, diagnostics, context);
			case ExecutableModelingProfilePackage.XGENERALIZATION_SET:
				return validateXGeneralizationSet((XGeneralizationSet)value, diagnostics, context);
			case ExecutableModelingProfilePackage.XCLASS:
				return validateXClass((XClass)value, diagnostics, context);
			case ExecutableModelingProfilePackage.XCONNECTOR_END:
				return validateXConnectorEnd((XConnectorEnd)value, diagnostics, context);
			case ExecutableModelingProfilePackage.XMESSAGE_KIND:
				return validateXMessageKind((XMessageKind)value, diagnostics, context);
			default:
				return true;
		}
	}

	/**
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 */
	public boolean validateXOperation(XOperation xOperation, DiagnosticChain diagnostics, Map<Object, Object> context) {
		if (!validate_NoCircularContainment(xOperation, diagnostics, context)) return false;
		boolean result = validate_EveryMultiplicityConforms(xOperation, diagnostics, context);
		if (result || diagnostics != null) result &= validate_EveryDataValueConforms(xOperation, diagnostics, context);
		if (result || diagnostics != null) result &= validate_EveryReferenceIsContained(xOperation, diagnostics, context);
		if (result || diagnostics != null) result &= validate_EveryBidirectionalReferenceIsPaired(xOperation, diagnostics, context);
		if (result || diagnostics != null) result &= validate_EveryProxyResolves(xOperation, diagnostics, context);
		if (result || diagnostics != null) result &= validate_UniqueID(xOperation, diagnostics, context);
		if (result || diagnostics != null) result &= validate_EveryKeyUnique(xOperation, diagnostics, context);
		if (result || diagnostics != null) result &= validate_EveryMapEntryUnique(xOperation, diagnostics, context);
		if (result || diagnostics != null) result &= validateXNamedElement_xNamedElementName(xOperation, diagnostics, context);
		if (result || diagnostics != null) result &= validateXFeature_xFeatureClassifier(xOperation, diagnostics, context);
		if (result || diagnostics != null) result &= validateXOperation_xOperationParameters(xOperation, diagnostics, context);
		if (result || diagnostics != null) result &= validateXOperation_xOperationOneMethod(xOperation, diagnostics, context);
		if (result || diagnostics != null) result &= validateXOperation_xOperationImports(xOperation, diagnostics, context);
		if (result || diagnostics != null) result &= validateXOperation_xOperationOwnedRules(xOperation, diagnostics, context);
		if (result || diagnostics != null) result &= validateXOperation_xOperationMethods(xOperation, diagnostics, context);
		if (result || diagnostics != null) result &= validateXOperation_xOperationConstraints(xOperation, diagnostics, context);
		return result;
	}

	/**
	 * Validates the xOperationParameters constraint of '<em>XOperation</em>'.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 */
	public boolean validateXOperation_xOperationParameters(XOperation xOperation, DiagnosticChain diagnostics, Map<Object, Object> context) {
		return xOperation.xOperationParameters(diagnostics, context);
	}

	/**
	 * Validates the xOperationOneMethod constraint of '<em>XOperation</em>'.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 */
	public boolean validateXOperation_xOperationOneMethod(XOperation xOperation, DiagnosticChain diagnostics, Map<Object, Object> context) {
		return xOperation.xOperationOneMethod(diagnostics, context);
	}

	/**
	 * Validates the xOperationImports constraint of '<em>XOperation</em>'.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 */
	public boolean validateXOperation_xOperationImports(XOperation xOperation, DiagnosticChain diagnostics, Map<Object, Object> context) {
		return xOperation.xOperationImports(diagnostics, context);
	}

	/**
	 * Validates the xOperationOwnedRules constraint of '<em>XOperation</em>'.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 */
	public boolean validateXOperation_xOperationOwnedRules(XOperation xOperation, DiagnosticChain diagnostics, Map<Object, Object> context) {
		return xOperation.xOperationOwnedRules(diagnostics, context);
	}

	/**
	 * Validates the xOperationMethods constraint of '<em>XOperation</em>'.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 */
	public boolean validateXOperation_xOperationMethods(XOperation xOperation, DiagnosticChain diagnostics, Map<Object, Object> context) {
		return xOperation.xOperationMethods(diagnostics, context);
	}

	/**
	 * Validates the xOperationConstraints constraint of '<em>XOperation</em>'.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 */
	public boolean validateXOperation_xOperationConstraints(XOperation xOperation, DiagnosticChain diagnostics, Map<Object, Object> context) {
		return xOperation.xOperationConstraints(diagnostics, context);
	}

	/**
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 */
	public boolean validateXNamespace(XNamespace xNamespace, DiagnosticChain diagnostics, Map<Object, Object> context) {
		if (!validate_NoCircularContainment(xNamespace, diagnostics, context)) return false;
		boolean result = validate_EveryMultiplicityConforms(xNamespace, diagnostics, context);
		if (result || diagnostics != null) result &= validate_EveryDataValueConforms(xNamespace, diagnostics, context);
		if (result || diagnostics != null) result &= validate_EveryReferenceIsContained(xNamespace, diagnostics, context);
		if (result || diagnostics != null) result &= validate_EveryBidirectionalReferenceIsPaired(xNamespace, diagnostics, context);
		if (result || diagnostics != null) result &= validate_EveryProxyResolves(xNamespace, diagnostics, context);
		if (result || diagnostics != null) result &= validate_UniqueID(xNamespace, diagnostics, context);
		if (result || diagnostics != null) result &= validate_EveryKeyUnique(xNamespace, diagnostics, context);
		if (result || diagnostics != null) result &= validate_EveryMapEntryUnique(xNamespace, diagnostics, context);
		if (result || diagnostics != null) result &= validateXNamedElement_xNamedElementName(xNamespace, diagnostics, context);
		return result;
	}

	/**
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 */
	public boolean validateXNamedElement(XNamedElement xNamedElement, DiagnosticChain diagnostics, Map<Object, Object> context) {
		if (!validate_NoCircularContainment(xNamedElement, diagnostics, context)) return false;
		boolean result = validate_EveryMultiplicityConforms(xNamedElement, diagnostics, context);
		if (result || diagnostics != null) result &= validate_EveryDataValueConforms(xNamedElement, diagnostics, context);
		if (result || diagnostics != null) result &= validate_EveryReferenceIsContained(xNamedElement, diagnostics, context);
		if (result || diagnostics != null) result &= validate_EveryBidirectionalReferenceIsPaired(xNamedElement, diagnostics, context);
		if (result || diagnostics != null) result &= validate_EveryProxyResolves(xNamedElement, diagnostics, context);
		if (result || diagnostics != null) result &= validate_UniqueID(xNamedElement, diagnostics, context);
		if (result || diagnostics != null) result &= validate_EveryKeyUnique(xNamedElement, diagnostics, context);
		if (result || diagnostics != null) result &= validate_EveryMapEntryUnique(xNamedElement, diagnostics, context);
		if (result || diagnostics != null) result &= validateXNamedElement_xNamedElementName(xNamedElement, diagnostics, context);
		return result;
	}

	/**
	 * Validates the xNamedElementName constraint of '<em>XNamed Element</em>'.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 */
	public boolean validateXNamedElement_xNamedElementName(XNamedElement xNamedElement, DiagnosticChain diagnostics, Map<Object, Object> context) {
		return xNamedElement.xNamedElementName(diagnostics, context);
	}

	/**
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 */
	public boolean validateXFeature(XFeature xFeature, DiagnosticChain diagnostics, Map<Object, Object> context) {
		if (!validate_NoCircularContainment(xFeature, diagnostics, context)) return false;
		boolean result = validate_EveryMultiplicityConforms(xFeature, diagnostics, context);
		if (result || diagnostics != null) result &= validate_EveryDataValueConforms(xFeature, diagnostics, context);
		if (result || diagnostics != null) result &= validate_EveryReferenceIsContained(xFeature, diagnostics, context);
		if (result || diagnostics != null) result &= validate_EveryBidirectionalReferenceIsPaired(xFeature, diagnostics, context);
		if (result || diagnostics != null) result &= validate_EveryProxyResolves(xFeature, diagnostics, context);
		if (result || diagnostics != null) result &= validate_UniqueID(xFeature, diagnostics, context);
		if (result || diagnostics != null) result &= validate_EveryKeyUnique(xFeature, diagnostics, context);
		if (result || diagnostics != null) result &= validate_EveryMapEntryUnique(xFeature, diagnostics, context);
		if (result || diagnostics != null) result &= validateXNamedElement_xNamedElementName(xFeature, diagnostics, context);
		if (result || diagnostics != null) result &= validateXFeature_xFeatureClassifier(xFeature, diagnostics, context);
		return result;
	}

	/**
	 * Validates the xFeatureClassifier constraint of '<em>XFeature</em>'.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 */
	public boolean validateXFeature_xFeatureClassifier(XFeature xFeature, DiagnosticChain diagnostics, Map<Object, Object> context) {
		return xFeature.xFeatureClassifier(diagnostics, context);
	}

	/**
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 */
	public boolean validateXAssociation(XAssociation xAssociation, DiagnosticChain diagnostics, Map<Object, Object> context) {
		if (!validate_NoCircularContainment(xAssociation, diagnostics, context)) return false;
		boolean result = validate_EveryMultiplicityConforms(xAssociation, diagnostics, context);
		if (result || diagnostics != null) result &= validate_EveryDataValueConforms(xAssociation, diagnostics, context);
		if (result || diagnostics != null) result &= validate_EveryReferenceIsContained(xAssociation, diagnostics, context);
		if (result || diagnostics != null) result &= validate_EveryBidirectionalReferenceIsPaired(xAssociation, diagnostics, context);
		if (result || diagnostics != null) result &= validate_EveryProxyResolves(xAssociation, diagnostics, context);
		if (result || diagnostics != null) result &= validate_UniqueID(xAssociation, diagnostics, context);
		if (result || diagnostics != null) result &= validate_EveryKeyUnique(xAssociation, diagnostics, context);
		if (result || diagnostics != null) result &= validate_EveryMapEntryUnique(xAssociation, diagnostics, context);
		if (result || diagnostics != null) result &= validateXAssociation_xAssociationIsBinary(xAssociation, diagnostics, context);
		return result;
	}

	/**
	 * Validates the xAssociationIsBinary constraint of '<em>XAssociation</em>'.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 */
	public boolean validateXAssociation_xAssociationIsBinary(XAssociation xAssociation, DiagnosticChain diagnostics, Map<Object, Object> context) {
		return xAssociation.xAssociationIsBinary(diagnostics, context);
	}

	/**
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 */
	public boolean validateXClassifier(XClassifier xClassifier, DiagnosticChain diagnostics, Map<Object, Object> context) {
		if (!validate_NoCircularContainment(xClassifier, diagnostics, context)) return false;
		boolean result = validate_EveryMultiplicityConforms(xClassifier, diagnostics, context);
		if (result || diagnostics != null) result &= validate_EveryDataValueConforms(xClassifier, diagnostics, context);
		if (result || diagnostics != null) result &= validate_EveryReferenceIsContained(xClassifier, diagnostics, context);
		if (result || diagnostics != null) result &= validate_EveryBidirectionalReferenceIsPaired(xClassifier, diagnostics, context);
		if (result || diagnostics != null) result &= validate_EveryProxyResolves(xClassifier, diagnostics, context);
		if (result || diagnostics != null) result &= validate_UniqueID(xClassifier, diagnostics, context);
		if (result || diagnostics != null) result &= validate_EveryKeyUnique(xClassifier, diagnostics, context);
		if (result || diagnostics != null) result &= validate_EveryMapEntryUnique(xClassifier, diagnostics, context);
		if (result || diagnostics != null) result &= validateXNamedElement_xNamedElementName(xClassifier, diagnostics, context);
		if (result || diagnostics != null) result &= validateXClassifier_xClassifierFeatures(xClassifier, diagnostics, context);
		if (result || diagnostics != null) result &= validateXClassifier_xClassifierNestedClassifiers(xClassifier, diagnostics, context);
		if (result || diagnostics != null) result &= validateXClassifier_xClassifierGenerals(xClassifier, diagnostics, context);
		if (result || diagnostics != null) result &= validateXClassifier_xClassifierConstraints(xClassifier, diagnostics, context);
		return result;
	}

	/**
	 * Validates the xClassifierFeatures constraint of '<em>XClassifier</em>'.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 */
	public boolean validateXClassifier_xClassifierFeatures(XClassifier xClassifier, DiagnosticChain diagnostics, Map<Object, Object> context) {
		return xClassifier.xClassifierFeatures(diagnostics, context);
	}

	/**
	 * Validates the xClassifierNestedClassifiers constraint of '<em>XClassifier</em>'.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 */
	public boolean validateXClassifier_xClassifierNestedClassifiers(XClassifier xClassifier, DiagnosticChain diagnostics, Map<Object, Object> context) {
		return xClassifier.xClassifierNestedClassifiers(diagnostics, context);
	}

	/**
	 * Validates the xClassifierGenerals constraint of '<em>XClassifier</em>'.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 */
	public boolean validateXClassifier_xClassifierGenerals(XClassifier xClassifier, DiagnosticChain diagnostics, Map<Object, Object> context) {
		return xClassifier.xClassifierGenerals(diagnostics, context);
	}

	/**
	 * Validates the xClassifierConstraints constraint of '<em>XClassifier</em>'.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 */
	public boolean validateXClassifier_xClassifierConstraints(XClassifier xClassifier, DiagnosticChain diagnostics, Map<Object, Object> context) {
		return xClassifier.xClassifierConstraints(diagnostics, context);
	}

	/**
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 */
	public boolean validateXBehavior(XBehavior xBehavior, DiagnosticChain diagnostics, Map<Object, Object> context) {
		if (!validate_NoCircularContainment(xBehavior, diagnostics, context)) return false;
		boolean result = validate_EveryMultiplicityConforms(xBehavior, diagnostics, context);
		if (result || diagnostics != null) result &= validate_EveryDataValueConforms(xBehavior, diagnostics, context);
		if (result || diagnostics != null) result &= validate_EveryReferenceIsContained(xBehavior, diagnostics, context);
		if (result || diagnostics != null) result &= validate_EveryBidirectionalReferenceIsPaired(xBehavior, diagnostics, context);
		if (result || diagnostics != null) result &= validate_EveryProxyResolves(xBehavior, diagnostics, context);
		if (result || diagnostics != null) result &= validate_UniqueID(xBehavior, diagnostics, context);
		if (result || diagnostics != null) result &= validate_EveryKeyUnique(xBehavior, diagnostics, context);
		if (result || diagnostics != null) result &= validate_EveryMapEntryUnique(xBehavior, diagnostics, context);
		if (result || diagnostics != null) result &= validateXNamedElement_xNamedElementName(xBehavior, diagnostics, context);
		if (result || diagnostics != null) result &= validateXBehavior_xBehaviorNoParameterSets(xBehavior, diagnostics, context);
		return result;
	}

	/**
	 * Validates the xBehaviorNoParameterSets constraint of '<em>XBehavior</em>'.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 */
	public boolean validateXBehavior_xBehaviorNoParameterSets(XBehavior xBehavior, DiagnosticChain diagnostics, Map<Object, Object> context) {
		return xBehavior.xBehaviorNoParameterSets(diagnostics, context);
	}

	/**
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 */
	public boolean validateXEncapsulatedClassifier(XEncapsulatedClassifier xEncapsulatedClassifier, DiagnosticChain diagnostics, Map<Object, Object> context) {
		if (!validate_NoCircularContainment(xEncapsulatedClassifier, diagnostics, context)) return false;
		boolean result = validate_EveryMultiplicityConforms(xEncapsulatedClassifier, diagnostics, context);
		if (result || diagnostics != null) result &= validate_EveryDataValueConforms(xEncapsulatedClassifier, diagnostics, context);
		if (result || diagnostics != null) result &= validate_EveryReferenceIsContained(xEncapsulatedClassifier, diagnostics, context);
		if (result || diagnostics != null) result &= validate_EveryBidirectionalReferenceIsPaired(xEncapsulatedClassifier, diagnostics, context);
		if (result || diagnostics != null) result &= validate_EveryProxyResolves(xEncapsulatedClassifier, diagnostics, context);
		if (result || diagnostics != null) result &= validate_UniqueID(xEncapsulatedClassifier, diagnostics, context);
		if (result || diagnostics != null) result &= validate_EveryKeyUnique(xEncapsulatedClassifier, diagnostics, context);
		if (result || diagnostics != null) result &= validate_EveryMapEntryUnique(xEncapsulatedClassifier, diagnostics, context);
		if (result || diagnostics != null) result &= validateXNamedElement_xNamedElementName(xEncapsulatedClassifier, diagnostics, context);
		if (result || diagnostics != null) result &= validateXClassifier_xClassifierFeatures(xEncapsulatedClassifier, diagnostics, context);
		if (result || diagnostics != null) result &= validateXClassifier_xClassifierNestedClassifiers(xEncapsulatedClassifier, diagnostics, context);
		if (result || diagnostics != null) result &= validateXClassifier_xClassifierGenerals(xEncapsulatedClassifier, diagnostics, context);
		if (result || diagnostics != null) result &= validateXClassifier_xClassifierConstraints(xEncapsulatedClassifier, diagnostics, context);
		if (result || diagnostics != null) result &= validateXEncapsulatedClassifier_xEncapsulatedClassifierPorts(xEncapsulatedClassifier, diagnostics, context);
		if (result || diagnostics != null) result &= validateXEncapsulatedClassifier_xEncapsulatedClassifierconnectors(xEncapsulatedClassifier, diagnostics, context);
		if (result || diagnostics != null) result &= validateXEncapsulatedClassifier_xEncapsulatedClassifierExternal(xEncapsulatedClassifier, diagnostics, context);
		return result;
	}

	/**
	 * Validates the xEncapsulatedClassifierPorts constraint of '<em>XEncapsulated Classifier</em>'.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 */
	public boolean validateXEncapsulatedClassifier_xEncapsulatedClassifierPorts(XEncapsulatedClassifier xEncapsulatedClassifier, DiagnosticChain diagnostics, Map<Object, Object> context) {
		return xEncapsulatedClassifier.xEncapsulatedClassifierPorts(diagnostics, context);
	}

	/**
	 * Validates the xEncapsulatedClassifierconnectors constraint of '<em>XEncapsulated Classifier</em>'.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 */
	public boolean validateXEncapsulatedClassifier_xEncapsulatedClassifierconnectors(XEncapsulatedClassifier xEncapsulatedClassifier, DiagnosticChain diagnostics, Map<Object, Object> context) {
		return xEncapsulatedClassifier.xEncapsulatedClassifierconnectors(diagnostics, context);
	}

	/**
	 * Validates the xEncapsulatedClassifierExternal constraint of '<em>XEncapsulated Classifier</em>'.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 */
	public boolean validateXEncapsulatedClassifier_xEncapsulatedClassifierExternal(XEncapsulatedClassifier xEncapsulatedClassifier, DiagnosticChain diagnostics, Map<Object, Object> context) {
		return xEncapsulatedClassifier.xEncapsulatedClassifierExternal(diagnostics, context);
	}

	/**
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 */
	public boolean validateXProtocol(XProtocol xProtocol, DiagnosticChain diagnostics, Map<Object, Object> context) {
		if (!validate_NoCircularContainment(xProtocol, diagnostics, context)) return false;
		boolean result = validate_EveryMultiplicityConforms(xProtocol, diagnostics, context);
		if (result || diagnostics != null) result &= validate_EveryDataValueConforms(xProtocol, diagnostics, context);
		if (result || diagnostics != null) result &= validate_EveryReferenceIsContained(xProtocol, diagnostics, context);
		if (result || diagnostics != null) result &= validate_EveryBidirectionalReferenceIsPaired(xProtocol, diagnostics, context);
		if (result || diagnostics != null) result &= validate_EveryProxyResolves(xProtocol, diagnostics, context);
		if (result || diagnostics != null) result &= validate_UniqueID(xProtocol, diagnostics, context);
		if (result || diagnostics != null) result &= validate_EveryKeyUnique(xProtocol, diagnostics, context);
		if (result || diagnostics != null) result &= validate_EveryMapEntryUnique(xProtocol, diagnostics, context);
		if (result || diagnostics != null) result &= validateXNamedElement_xNamedElementName(xProtocol, diagnostics, context);
		if (result || diagnostics != null) result &= validateXClassifier_xClassifierFeatures(xProtocol, diagnostics, context);
		if (result || diagnostics != null) result &= validateXClassifier_xClassifierNestedClassifiers(xProtocol, diagnostics, context);
		if (result || diagnostics != null) result &= validateXClassifier_xClassifierGenerals(xProtocol, diagnostics, context);
		if (result || diagnostics != null) result &= validateXClassifier_xClassifierConstraints(xProtocol, diagnostics, context);
		if (result || diagnostics != null) result &= validateXProtocol_xProtocolIncomingInterface(xProtocol, diagnostics, context);
		if (result || diagnostics != null) result &= validateXProtocol_xProtocolProtocolContainer(xProtocol, diagnostics, context);
		if (result || diagnostics != null) result &= validateXProtocol_xProtocolOutgoingInterface(xProtocol, diagnostics, context);
		if (result || diagnostics != null) result &= validateXProtocol_xProtocolSymmetricInterface(xProtocol, diagnostics, context);
		return result;
	}

	/**
	 * Validates the xProtocolIncomingInterface constraint of '<em>XProtocol</em>'.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 */
	public boolean validateXProtocol_xProtocolIncomingInterface(XProtocol xProtocol, DiagnosticChain diagnostics, Map<Object, Object> context) {
		return xProtocol.xProtocolIncomingInterface(diagnostics, context);
	}

	/**
	 * Validates the xProtocolProtocolContainer constraint of '<em>XProtocol</em>'.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 */
	public boolean validateXProtocol_xProtocolProtocolContainer(XProtocol xProtocol, DiagnosticChain diagnostics, Map<Object, Object> context) {
		return xProtocol.xProtocolProtocolContainer(diagnostics, context);
	}

	/**
	 * Validates the xProtocolOutgoingInterface constraint of '<em>XProtocol</em>'.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 */
	public boolean validateXProtocol_xProtocolOutgoingInterface(XProtocol xProtocol, DiagnosticChain diagnostics, Map<Object, Object> context) {
		return xProtocol.xProtocolOutgoingInterface(diagnostics, context);
	}

	/**
	 * Validates the xProtocolSymmetricInterface constraint of '<em>XProtocol</em>'.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 */
	public boolean validateXProtocol_xProtocolSymmetricInterface(XProtocol xProtocol, DiagnosticChain diagnostics, Map<Object, Object> context) {
		return xProtocol.xProtocolSymmetricInterface(diagnostics, context);
	}

	/**
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 */
	public boolean validateXSignal(XSignal xSignal, DiagnosticChain diagnostics, Map<Object, Object> context) {
		if (!validate_NoCircularContainment(xSignal, diagnostics, context)) return false;
		boolean result = validate_EveryMultiplicityConforms(xSignal, diagnostics, context);
		if (result || diagnostics != null) result &= validate_EveryDataValueConforms(xSignal, diagnostics, context);
		if (result || diagnostics != null) result &= validate_EveryReferenceIsContained(xSignal, diagnostics, context);
		if (result || diagnostics != null) result &= validate_EveryBidirectionalReferenceIsPaired(xSignal, diagnostics, context);
		if (result || diagnostics != null) result &= validate_EveryProxyResolves(xSignal, diagnostics, context);
		if (result || diagnostics != null) result &= validate_UniqueID(xSignal, diagnostics, context);
		if (result || diagnostics != null) result &= validate_EveryKeyUnique(xSignal, diagnostics, context);
		if (result || diagnostics != null) result &= validate_EveryMapEntryUnique(xSignal, diagnostics, context);
		if (result || diagnostics != null) result &= validateXNamedElement_xNamedElementName(xSignal, diagnostics, context);
		if (result || diagnostics != null) result &= validateXClassifier_xClassifierFeatures(xSignal, diagnostics, context);
		if (result || diagnostics != null) result &= validateXClassifier_xClassifierNestedClassifiers(xSignal, diagnostics, context);
		if (result || diagnostics != null) result &= validateXClassifier_xClassifierGenerals(xSignal, diagnostics, context);
		if (result || diagnostics != null) result &= validateXClassifier_xClassifierConstraints(xSignal, diagnostics, context);
		if (result || diagnostics != null) result &= validateXSignal_xSignalVisibility(xSignal, diagnostics, context);
		return result;
	}

	/**
	 * Validates the xSignalVisibility constraint of '<em>XSignal</em>'.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 */
	public boolean validateXSignal_xSignalVisibility(XSignal xSignal, DiagnosticChain diagnostics, Map<Object, Object> context) {
		return xSignal.xSignalVisibility(diagnostics, context);
	}

	/**
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 */
	public boolean validateXDataType(XDataType xDataType, DiagnosticChain diagnostics, Map<Object, Object> context) {
		if (!validate_NoCircularContainment(xDataType, diagnostics, context)) return false;
		boolean result = validate_EveryMultiplicityConforms(xDataType, diagnostics, context);
		if (result || diagnostics != null) result &= validate_EveryDataValueConforms(xDataType, diagnostics, context);
		if (result || diagnostics != null) result &= validate_EveryReferenceIsContained(xDataType, diagnostics, context);
		if (result || diagnostics != null) result &= validate_EveryBidirectionalReferenceIsPaired(xDataType, diagnostics, context);
		if (result || diagnostics != null) result &= validate_EveryProxyResolves(xDataType, diagnostics, context);
		if (result || diagnostics != null) result &= validate_UniqueID(xDataType, diagnostics, context);
		if (result || diagnostics != null) result &= validate_EveryKeyUnique(xDataType, diagnostics, context);
		if (result || diagnostics != null) result &= validate_EveryMapEntryUnique(xDataType, diagnostics, context);
		if (result || diagnostics != null) result &= validateXNamedElement_xNamedElementName(xDataType, diagnostics, context);
		if (result || diagnostics != null) result &= validateXClassifier_xClassifierFeatures(xDataType, diagnostics, context);
		if (result || diagnostics != null) result &= validateXClassifier_xClassifierNestedClassifiers(xDataType, diagnostics, context);
		if (result || diagnostics != null) result &= validateXClassifier_xClassifierGenerals(xDataType, diagnostics, context);
		if (result || diagnostics != null) result &= validateXClassifier_xClassifierConstraints(xDataType, diagnostics, context);
		if (result || diagnostics != null) result &= validateXDataType_xDataTypeOperations(xDataType, diagnostics, context);
		return result;
	}

	/**
	 * Validates the xDataTypeOperations constraint of '<em>XData Type</em>'.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 */
	public boolean validateXDataType_xDataTypeOperations(XDataType xDataType, DiagnosticChain diagnostics, Map<Object, Object> context) {
		return xDataType.xDataTypeOperations(diagnostics, context);
	}

	/**
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 */
	public boolean validateXParameter(XParameter xParameter, DiagnosticChain diagnostics, Map<Object, Object> context) {
		if (!validate_NoCircularContainment(xParameter, diagnostics, context)) return false;
		boolean result = validate_EveryMultiplicityConforms(xParameter, diagnostics, context);
		if (result || diagnostics != null) result &= validate_EveryDataValueConforms(xParameter, diagnostics, context);
		if (result || diagnostics != null) result &= validate_EveryReferenceIsContained(xParameter, diagnostics, context);
		if (result || diagnostics != null) result &= validate_EveryBidirectionalReferenceIsPaired(xParameter, diagnostics, context);
		if (result || diagnostics != null) result &= validate_EveryProxyResolves(xParameter, diagnostics, context);
		if (result || diagnostics != null) result &= validate_UniqueID(xParameter, diagnostics, context);
		if (result || diagnostics != null) result &= validate_EveryKeyUnique(xParameter, diagnostics, context);
		if (result || diagnostics != null) result &= validate_EveryMapEntryUnique(xParameter, diagnostics, context);
		if (result || diagnostics != null) result &= validateXTypedElement_xTypedElementType(xParameter, diagnostics, context);
		return result;
	}

	/**
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 */
	public boolean validateXTypedElement(XTypedElement xTypedElement, DiagnosticChain diagnostics, Map<Object, Object> context) {
		if (!validate_NoCircularContainment(xTypedElement, diagnostics, context)) return false;
		boolean result = validate_EveryMultiplicityConforms(xTypedElement, diagnostics, context);
		if (result || diagnostics != null) result &= validate_EveryDataValueConforms(xTypedElement, diagnostics, context);
		if (result || diagnostics != null) result &= validate_EveryReferenceIsContained(xTypedElement, diagnostics, context);
		if (result || diagnostics != null) result &= validate_EveryBidirectionalReferenceIsPaired(xTypedElement, diagnostics, context);
		if (result || diagnostics != null) result &= validate_EveryProxyResolves(xTypedElement, diagnostics, context);
		if (result || diagnostics != null) result &= validate_UniqueID(xTypedElement, diagnostics, context);
		if (result || diagnostics != null) result &= validate_EveryKeyUnique(xTypedElement, diagnostics, context);
		if (result || diagnostics != null) result &= validate_EveryMapEntryUnique(xTypedElement, diagnostics, context);
		if (result || diagnostics != null) result &= validateXTypedElement_xTypedElementType(xTypedElement, diagnostics, context);
		return result;
	}

	/**
	 * Validates the xTypedElementType constraint of '<em>XTyped Element</em>'.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 */
	public boolean validateXTypedElement_xTypedElementType(XTypedElement xTypedElement, DiagnosticChain diagnostics, Map<Object, Object> context) {
		return xTypedElement.xTypedElementType(diagnostics, context);
	}

	/**
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 */
	public boolean validateXProperty(XProperty xProperty, DiagnosticChain diagnostics, Map<Object, Object> context) {
		if (!validate_NoCircularContainment(xProperty, diagnostics, context)) return false;
		boolean result = validate_EveryMultiplicityConforms(xProperty, diagnostics, context);
		if (result || diagnostics != null) result &= validate_EveryDataValueConforms(xProperty, diagnostics, context);
		if (result || diagnostics != null) result &= validate_EveryReferenceIsContained(xProperty, diagnostics, context);
		if (result || diagnostics != null) result &= validate_EveryBidirectionalReferenceIsPaired(xProperty, diagnostics, context);
		if (result || diagnostics != null) result &= validate_EveryProxyResolves(xProperty, diagnostics, context);
		if (result || diagnostics != null) result &= validate_UniqueID(xProperty, diagnostics, context);
		if (result || diagnostics != null) result &= validate_EveryKeyUnique(xProperty, diagnostics, context);
		if (result || diagnostics != null) result &= validate_EveryMapEntryUnique(xProperty, diagnostics, context);
		if (result || diagnostics != null) result &= validateXMultiplicityElement_xMultiplicityElementIsOrderedByValue(xProperty, diagnostics, context);
		if (result || diagnostics != null) result &= validateXMultiplicityElement_xMultiplicityElementKeys(xProperty, diagnostics, context);
		if (result || diagnostics != null) result &= validateXNamedElement_xNamedElementName(xProperty, diagnostics, context);
		if (result || diagnostics != null) result &= validateXFeature_xFeatureClassifier(xProperty, diagnostics, context);
		if (result || diagnostics != null) result &= validateXTypedElement_xTypedElementType(xProperty, diagnostics, context);
		return result;
	}

	/**
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 */
	public boolean validateXMultiplicityElement(XMultiplicityElement xMultiplicityElement, DiagnosticChain diagnostics, Map<Object, Object> context) {
		if (!validate_NoCircularContainment(xMultiplicityElement, diagnostics, context)) return false;
		boolean result = validate_EveryMultiplicityConforms(xMultiplicityElement, diagnostics, context);
		if (result || diagnostics != null) result &= validate_EveryDataValueConforms(xMultiplicityElement, diagnostics, context);
		if (result || diagnostics != null) result &= validate_EveryReferenceIsContained(xMultiplicityElement, diagnostics, context);
		if (result || diagnostics != null) result &= validate_EveryBidirectionalReferenceIsPaired(xMultiplicityElement, diagnostics, context);
		if (result || diagnostics != null) result &= validate_EveryProxyResolves(xMultiplicityElement, diagnostics, context);
		if (result || diagnostics != null) result &= validate_UniqueID(xMultiplicityElement, diagnostics, context);
		if (result || diagnostics != null) result &= validate_EveryKeyUnique(xMultiplicityElement, diagnostics, context);
		if (result || diagnostics != null) result &= validate_EveryMapEntryUnique(xMultiplicityElement, diagnostics, context);
		if (result || diagnostics != null) result &= validateXMultiplicityElement_xMultiplicityElementIsOrderedByValue(xMultiplicityElement, diagnostics, context);
		if (result || diagnostics != null) result &= validateXMultiplicityElement_xMultiplicityElementKeys(xMultiplicityElement, diagnostics, context);
		return result;
	}

	/**
	 * Validates the xMultiplicityElementIsOrderedByValue constraint of '<em>XMultiplicity Element</em>'.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 */
	public boolean validateXMultiplicityElement_xMultiplicityElementIsOrderedByValue(XMultiplicityElement xMultiplicityElement, DiagnosticChain diagnostics, Map<Object, Object> context) {
		return xMultiplicityElement.xMultiplicityElementIsOrderedByValue(diagnostics, context);
	}

	/**
	 * Validates the xMultiplicityElementKeys constraint of '<em>XMultiplicity Element</em>'.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 */
	public boolean validateXMultiplicityElement_xMultiplicityElementKeys(XMultiplicityElement xMultiplicityElement, DiagnosticChain diagnostics, Map<Object, Object> context) {
		return xMultiplicityElement.xMultiplicityElementKeys(diagnostics, context);
	}

	/**
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 */
	public boolean validateXReception(XReception xReception, DiagnosticChain diagnostics, Map<Object, Object> context) {
		if (!validate_NoCircularContainment(xReception, diagnostics, context)) return false;
		boolean result = validate_EveryMultiplicityConforms(xReception, diagnostics, context);
		if (result || diagnostics != null) result &= validate_EveryDataValueConforms(xReception, diagnostics, context);
		if (result || diagnostics != null) result &= validate_EveryReferenceIsContained(xReception, diagnostics, context);
		if (result || diagnostics != null) result &= validate_EveryBidirectionalReferenceIsPaired(xReception, diagnostics, context);
		if (result || diagnostics != null) result &= validate_EveryProxyResolves(xReception, diagnostics, context);
		if (result || diagnostics != null) result &= validate_UniqueID(xReception, diagnostics, context);
		if (result || diagnostics != null) result &= validate_EveryKeyUnique(xReception, diagnostics, context);
		if (result || diagnostics != null) result &= validate_EveryMapEntryUnique(xReception, diagnostics, context);
		if (result || diagnostics != null) result &= validateXNamedElement_xNamedElementName(xReception, diagnostics, context);
		if (result || diagnostics != null) result &= validateXFeature_xFeatureClassifier(xReception, diagnostics, context);
		if (result || diagnostics != null) result &= validateXReception_xReceptionSignal(xReception, diagnostics, context);
		return result;
	}

	/**
	 * Validates the xReceptionSignal constraint of '<em>XReception</em>'.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 */
	public boolean validateXReception_xReceptionSignal(XReception xReception, DiagnosticChain diagnostics, Map<Object, Object> context) {
		return xReception.xReceptionSignal(diagnostics, context);
	}

	/**
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 */
	public boolean validateXPart(XPart xPart, DiagnosticChain diagnostics, Map<Object, Object> context) {
		if (!validate_NoCircularContainment(xPart, diagnostics, context)) return false;
		boolean result = validate_EveryMultiplicityConforms(xPart, diagnostics, context);
		if (result || diagnostics != null) result &= validate_EveryDataValueConforms(xPart, diagnostics, context);
		if (result || diagnostics != null) result &= validate_EveryReferenceIsContained(xPart, diagnostics, context);
		if (result || diagnostics != null) result &= validate_EveryBidirectionalReferenceIsPaired(xPart, diagnostics, context);
		if (result || diagnostics != null) result &= validate_EveryProxyResolves(xPart, diagnostics, context);
		if (result || diagnostics != null) result &= validate_UniqueID(xPart, diagnostics, context);
		if (result || diagnostics != null) result &= validate_EveryKeyUnique(xPart, diagnostics, context);
		if (result || diagnostics != null) result &= validate_EveryMapEntryUnique(xPart, diagnostics, context);
		if (result || diagnostics != null) result &= validateXNamedElement_xNamedElementName(xPart, diagnostics, context);
		if (result || diagnostics != null) result &= validateXFeature_xFeatureClassifier(xPart, diagnostics, context);
		if (result || diagnostics != null) result &= validateXTypedElement_xTypedElementType(xPart, diagnostics, context);
		if (result || diagnostics != null) result &= validateXPart_xPartClassifier(xPart, diagnostics, context);
		return result;
	}

	/**
	 * Validates the xPartClassifier constraint of '<em>XPart</em>'.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 */
	public boolean validateXPart_xPartClassifier(XPart xPart, DiagnosticChain diagnostics, Map<Object, Object> context) {
		return xPart.xPartClassifier(diagnostics, context);
	}

	/**
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 */
	public boolean validateXPort(XPort xPort, DiagnosticChain diagnostics, Map<Object, Object> context) {
		if (!validate_NoCircularContainment(xPort, diagnostics, context)) return false;
		boolean result = validate_EveryMultiplicityConforms(xPort, diagnostics, context);
		if (result || diagnostics != null) result &= validate_EveryDataValueConforms(xPort, diagnostics, context);
		if (result || diagnostics != null) result &= validate_EveryReferenceIsContained(xPort, diagnostics, context);
		if (result || diagnostics != null) result &= validate_EveryBidirectionalReferenceIsPaired(xPort, diagnostics, context);
		if (result || diagnostics != null) result &= validate_EveryProxyResolves(xPort, diagnostics, context);
		if (result || diagnostics != null) result &= validate_UniqueID(xPort, diagnostics, context);
		if (result || diagnostics != null) result &= validate_EveryKeyUnique(xPort, diagnostics, context);
		if (result || diagnostics != null) result &= validate_EveryMapEntryUnique(xPort, diagnostics, context);
		if (result || diagnostics != null) result &= validateXNamedElement_xNamedElementName(xPort, diagnostics, context);
		if (result || diagnostics != null) result &= validateXFeature_xFeatureClassifier(xPort, diagnostics, context);
		if (result || diagnostics != null) result &= validateXPort_xPortClassifier(xPort, diagnostics, context);
		if (result || diagnostics != null) result &= validateXPort_xPortOrderingUniqueness(xPort, diagnostics, context);
		if (result || diagnostics != null) result &= validateXPort_xPortType(xPort, diagnostics, context);
		if (result || diagnostics != null) result &= validateXPort_xPortBehaviorPort(xPort, diagnostics, context);
		if (result || diagnostics != null) result &= validateXPort_xPortVisibility(xPort, diagnostics, context);
		return result;
	}

	/**
	 * Validates the xPortClassifier constraint of '<em>XPort</em>'.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 */
	public boolean validateXPort_xPortClassifier(XPort xPort, DiagnosticChain diagnostics, Map<Object, Object> context) {
		return xPort.xPortClassifier(diagnostics, context);
	}

	/**
	 * Validates the xPortOrderingUniqueness constraint of '<em>XPort</em>'.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 */
	public boolean validateXPort_xPortOrderingUniqueness(XPort xPort, DiagnosticChain diagnostics, Map<Object, Object> context) {
		return xPort.xPortOrderingUniqueness(diagnostics, context);
	}

	/**
	 * Validates the xPortType constraint of '<em>XPort</em>'.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 */
	public boolean validateXPort_xPortType(XPort xPort, DiagnosticChain diagnostics, Map<Object, Object> context) {
		return xPort.xPortType(diagnostics, context);
	}

	/**
	 * Validates the xPortBehaviorPort constraint of '<em>XPort</em>'.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 */
	public boolean validateXPort_xPortBehaviorPort(XPort xPort, DiagnosticChain diagnostics, Map<Object, Object> context) {
		return xPort.xPortBehaviorPort(diagnostics, context);
	}

	/**
	 * Validates the xPortVisibility constraint of '<em>XPort</em>'.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 */
	public boolean validateXPort_xPortVisibility(XPort xPort, DiagnosticChain diagnostics, Map<Object, Object> context) {
		return xPort.xPortVisibility(diagnostics, context);
	}

	/**
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 */
	public boolean validateXConnector(XConnector xConnector, DiagnosticChain diagnostics, Map<Object, Object> context) {
		if (!validate_NoCircularContainment(xConnector, diagnostics, context)) return false;
		boolean result = validate_EveryMultiplicityConforms(xConnector, diagnostics, context);
		if (result || diagnostics != null) result &= validate_EveryDataValueConforms(xConnector, diagnostics, context);
		if (result || diagnostics != null) result &= validate_EveryReferenceIsContained(xConnector, diagnostics, context);
		if (result || diagnostics != null) result &= validate_EveryBidirectionalReferenceIsPaired(xConnector, diagnostics, context);
		if (result || diagnostics != null) result &= validate_EveryProxyResolves(xConnector, diagnostics, context);
		if (result || diagnostics != null) result &= validate_UniqueID(xConnector, diagnostics, context);
		if (result || diagnostics != null) result &= validate_EveryKeyUnique(xConnector, diagnostics, context);
		if (result || diagnostics != null) result &= validate_EveryMapEntryUnique(xConnector, diagnostics, context);
		if (result || diagnostics != null) result &= validateXNamedElement_xNamedElementName(xConnector, diagnostics, context);
		if (result || diagnostics != null) result &= validateXFeature_xFeatureClassifier(xConnector, diagnostics, context);
		if (result || diagnostics != null) result &= validateXConnector_xConnectorClassifier(xConnector, diagnostics, context);
		if (result || diagnostics != null) result &= validateXConnector_xConnectorEnds(xConnector, diagnostics, context);
		if (result || diagnostics != null) result &= validateXConnector_xtConnectorType(xConnector, diagnostics, context);
		return result;
	}

	/**
	 * Validates the xConnectorClassifier constraint of '<em>XConnector</em>'.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 */
	public boolean validateXConnector_xConnectorClassifier(XConnector xConnector, DiagnosticChain diagnostics, Map<Object, Object> context) {
		return xConnector.xConnectorClassifier(diagnostics, context);
	}

	/**
	 * Validates the xConnectorEnds constraint of '<em>XConnector</em>'.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 */
	public boolean validateXConnector_xConnectorEnds(XConnector xConnector, DiagnosticChain diagnostics, Map<Object, Object> context) {
		return xConnector.xConnectorEnds(diagnostics, context);
	}

	/**
	 * Validates the xtConnectorType constraint of '<em>XConnector</em>'.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 */
	public boolean validateXConnector_xtConnectorType(XConnector xConnector, DiagnosticChain diagnostics, Map<Object, Object> context) {
		return xConnector.xtConnectorType(diagnostics, context);
	}

	/**
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 */
	public boolean validateXProtocolContainer(XProtocolContainer xProtocolContainer, DiagnosticChain diagnostics, Map<Object, Object> context) {
		if (!validate_NoCircularContainment(xProtocolContainer, diagnostics, context)) return false;
		boolean result = validate_EveryMultiplicityConforms(xProtocolContainer, diagnostics, context);
		if (result || diagnostics != null) result &= validate_EveryDataValueConforms(xProtocolContainer, diagnostics, context);
		if (result || diagnostics != null) result &= validate_EveryReferenceIsContained(xProtocolContainer, diagnostics, context);
		if (result || diagnostics != null) result &= validate_EveryBidirectionalReferenceIsPaired(xProtocolContainer, diagnostics, context);
		if (result || diagnostics != null) result &= validate_EveryProxyResolves(xProtocolContainer, diagnostics, context);
		if (result || diagnostics != null) result &= validate_UniqueID(xProtocolContainer, diagnostics, context);
		if (result || diagnostics != null) result &= validate_EveryKeyUnique(xProtocolContainer, diagnostics, context);
		if (result || diagnostics != null) result &= validate_EveryMapEntryUnique(xProtocolContainer, diagnostics, context);
		if (result || diagnostics != null) result &= validateXProtocolContainer_xProtocolContainerProtocol(xProtocolContainer, diagnostics, context);
		return result;
	}

	/**
	 * Validates the xProtocolContainerProtocol constraint of '<em>XProtocol Container</em>'.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 */
	public boolean validateXProtocolContainer_xProtocolContainerProtocol(XProtocolContainer xProtocolContainer, DiagnosticChain diagnostics, Map<Object, Object> context) {
		return xProtocolContainer.xProtocolContainerProtocol(diagnostics, context);
	}

	/**
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 */
	public boolean validateXMessageSet(XMessageSet xMessageSet, DiagnosticChain diagnostics, Map<Object, Object> context) {
		if (!validate_NoCircularContainment(xMessageSet, diagnostics, context)) return false;
		boolean result = validate_EveryMultiplicityConforms(xMessageSet, diagnostics, context);
		if (result || diagnostics != null) result &= validate_EveryDataValueConforms(xMessageSet, diagnostics, context);
		if (result || diagnostics != null) result &= validate_EveryReferenceIsContained(xMessageSet, diagnostics, context);
		if (result || diagnostics != null) result &= validate_EveryBidirectionalReferenceIsPaired(xMessageSet, diagnostics, context);
		if (result || diagnostics != null) result &= validate_EveryProxyResolves(xMessageSet, diagnostics, context);
		if (result || diagnostics != null) result &= validate_UniqueID(xMessageSet, diagnostics, context);
		if (result || diagnostics != null) result &= validate_EveryKeyUnique(xMessageSet, diagnostics, context);
		if (result || diagnostics != null) result &= validate_EveryMapEntryUnique(xMessageSet, diagnostics, context);
		if (result || diagnostics != null) result &= validateXNamedElement_xNamedElementName(xMessageSet, diagnostics, context);
		if (result || diagnostics != null) result &= validateXClassifier_xClassifierFeatures(xMessageSet, diagnostics, context);
		if (result || diagnostics != null) result &= validateXClassifier_xClassifierNestedClassifiers(xMessageSet, diagnostics, context);
		if (result || diagnostics != null) result &= validateXClassifier_xClassifierGenerals(xMessageSet, diagnostics, context);
		if (result || diagnostics != null) result &= validateXClassifier_xClassifierConstraints(xMessageSet, diagnostics, context);
		if (result || diagnostics != null) result &= validateXMessageSet_xMessageSetIncoming(xMessageSet, diagnostics, context);
		if (result || diagnostics != null) result &= validateXMessageSet_xMessageSetOutgoing(xMessageSet, diagnostics, context);
		if (result || diagnostics != null) result &= validateXMessageSet_xMessageSetSymmetric(xMessageSet, diagnostics, context);
		return result;
	}

	/**
	 * Validates the xMessageSetIncoming constraint of '<em>XMessage Set</em>'.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 */
	public boolean validateXMessageSet_xMessageSetIncoming(XMessageSet xMessageSet, DiagnosticChain diagnostics, Map<Object, Object> context) {
		return xMessageSet.xMessageSetIncoming(diagnostics, context);
	}

	/**
	 * Validates the xMessageSetOutgoing constraint of '<em>XMessage Set</em>'.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 */
	public boolean validateXMessageSet_xMessageSetOutgoing(XMessageSet xMessageSet, DiagnosticChain diagnostics, Map<Object, Object> context) {
		return xMessageSet.xMessageSetOutgoing(diagnostics, context);
	}

	/**
	 * Validates the xMessageSetSymmetric constraint of '<em>XMessage Set</em>'.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 */
	public boolean validateXMessageSet_xMessageSetSymmetric(XMessageSet xMessageSet, DiagnosticChain diagnostics, Map<Object, Object> context) {
		return xMessageSet.xMessageSetSymmetric(diagnostics, context);
	}

	/**
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 */
	public boolean validateXEnumeration(XEnumeration xEnumeration, DiagnosticChain diagnostics, Map<Object, Object> context) {
		if (!validate_NoCircularContainment(xEnumeration, diagnostics, context)) return false;
		boolean result = validate_EveryMultiplicityConforms(xEnumeration, diagnostics, context);
		if (result || diagnostics != null) result &= validate_EveryDataValueConforms(xEnumeration, diagnostics, context);
		if (result || diagnostics != null) result &= validate_EveryReferenceIsContained(xEnumeration, diagnostics, context);
		if (result || diagnostics != null) result &= validate_EveryBidirectionalReferenceIsPaired(xEnumeration, diagnostics, context);
		if (result || diagnostics != null) result &= validate_EveryProxyResolves(xEnumeration, diagnostics, context);
		if (result || diagnostics != null) result &= validate_UniqueID(xEnumeration, diagnostics, context);
		if (result || diagnostics != null) result &= validate_EveryKeyUnique(xEnumeration, diagnostics, context);
		if (result || diagnostics != null) result &= validate_EveryMapEntryUnique(xEnumeration, diagnostics, context);
		if (result || diagnostics != null) result &= validateXNamedElement_xNamedElementName(xEnumeration, diagnostics, context);
		if (result || diagnostics != null) result &= validateXClassifier_xClassifierFeatures(xEnumeration, diagnostics, context);
		if (result || diagnostics != null) result &= validateXClassifier_xClassifierNestedClassifiers(xEnumeration, diagnostics, context);
		if (result || diagnostics != null) result &= validateXClassifier_xClassifierGenerals(xEnumeration, diagnostics, context);
		if (result || diagnostics != null) result &= validateXClassifier_xClassifierConstraints(xEnumeration, diagnostics, context);
		if (result || diagnostics != null) result &= validateXDataType_xDataTypeOperations(xEnumeration, diagnostics, context);
		if (result || diagnostics != null) result &= validateXEnumeration_xEnumerationAttributes(xEnumeration, diagnostics, context);
		return result;
	}

	/**
	 * Validates the xEnumerationAttributes constraint of '<em>XEnumeration</em>'.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 */
	public boolean validateXEnumeration_xEnumerationAttributes(XEnumeration xEnumeration, DiagnosticChain diagnostics, Map<Object, Object> context) {
		return xEnumeration.xEnumerationAttributes(diagnostics, context);
	}

	/**
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 */
	public boolean validateXAssociationClass(XAssociationClass xAssociationClass, DiagnosticChain diagnostics, Map<Object, Object> context) {
		if (!validate_NoCircularContainment(xAssociationClass, diagnostics, context)) return false;
		boolean result = validate_EveryMultiplicityConforms(xAssociationClass, diagnostics, context);
		if (result || diagnostics != null) result &= validate_EveryDataValueConforms(xAssociationClass, diagnostics, context);
		if (result || diagnostics != null) result &= validate_EveryReferenceIsContained(xAssociationClass, diagnostics, context);
		if (result || diagnostics != null) result &= validate_EveryBidirectionalReferenceIsPaired(xAssociationClass, diagnostics, context);
		if (result || diagnostics != null) result &= validate_EveryProxyResolves(xAssociationClass, diagnostics, context);
		if (result || diagnostics != null) result &= validate_UniqueID(xAssociationClass, diagnostics, context);
		if (result || diagnostics != null) result &= validate_EveryKeyUnique(xAssociationClass, diagnostics, context);
		if (result || diagnostics != null) result &= validate_EveryMapEntryUnique(xAssociationClass, diagnostics, context);
		if (result || diagnostics != null) result &= validateXNamedElement_xNamedElementName(xAssociationClass, diagnostics, context);
		if (result || diagnostics != null) result &= validateXClassifier_xClassifierFeatures(xAssociationClass, diagnostics, context);
		if (result || diagnostics != null) result &= validateXClassifier_xClassifierNestedClassifiers(xAssociationClass, diagnostics, context);
		if (result || diagnostics != null) result &= validateXClassifier_xClassifierGenerals(xAssociationClass, diagnostics, context);
		if (result || diagnostics != null) result &= validateXClassifier_xClassifierConstraints(xAssociationClass, diagnostics, context);
		if (result || diagnostics != null) result &= validateXAssociation_xAssociationIsBinary(xAssociationClass, diagnostics, context);
		return result;
	}

	/**
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 */
	public boolean validateXTrigger(XTrigger xTrigger, DiagnosticChain diagnostics, Map<Object, Object> context) {
		if (!validate_NoCircularContainment(xTrigger, diagnostics, context)) return false;
		boolean result = validate_EveryMultiplicityConforms(xTrigger, diagnostics, context);
		if (result || diagnostics != null) result &= validate_EveryDataValueConforms(xTrigger, diagnostics, context);
		if (result || diagnostics != null) result &= validate_EveryReferenceIsContained(xTrigger, diagnostics, context);
		if (result || diagnostics != null) result &= validate_EveryBidirectionalReferenceIsPaired(xTrigger, diagnostics, context);
		if (result || diagnostics != null) result &= validate_EveryProxyResolves(xTrigger, diagnostics, context);
		if (result || diagnostics != null) result &= validate_UniqueID(xTrigger, diagnostics, context);
		if (result || diagnostics != null) result &= validate_EveryKeyUnique(xTrigger, diagnostics, context);
		if (result || diagnostics != null) result &= validate_EveryMapEntryUnique(xTrigger, diagnostics, context);
		if (result || diagnostics != null) result &= validateXTrigger_xTriggerSignalReception(xTrigger, diagnostics, context);
		if (result || diagnostics != null) result &= validateXTrigger_xTriggerEvents(xTrigger, diagnostics, context);
		if (result || diagnostics != null) result &= validateXTrigger_xTriggerCalledOperation(xTrigger, diagnostics, context);
		return result;
	}

	/**
	 * Validates the xTriggerSignalReception constraint of '<em>XTrigger</em>'.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 */
	public boolean validateXTrigger_xTriggerSignalReception(XTrigger xTrigger, DiagnosticChain diagnostics, Map<Object, Object> context) {
		return xTrigger.xTriggerSignalReception(diagnostics, context);
	}

	/**
	 * Validates the xTriggerEvents constraint of '<em>XTrigger</em>'.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 */
	public boolean validateXTrigger_xTriggerEvents(XTrigger xTrigger, DiagnosticChain diagnostics, Map<Object, Object> context) {
		return xTrigger.xTriggerEvents(diagnostics, context);
	}

	/**
	 * Validates the xTriggerCalledOperation constraint of '<em>XTrigger</em>'.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 */
	public boolean validateXTrigger_xTriggerCalledOperation(XTrigger xTrigger, DiagnosticChain diagnostics, Map<Object, Object> context) {
		return xTrigger.xTriggerCalledOperation(diagnostics, context);
	}

	/**
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 */
	public boolean validateXStateMachine(XStateMachine xStateMachine, DiagnosticChain diagnostics, Map<Object, Object> context) {
		if (!validate_NoCircularContainment(xStateMachine, diagnostics, context)) return false;
		boolean result = validate_EveryMultiplicityConforms(xStateMachine, diagnostics, context);
		if (result || diagnostics != null) result &= validate_EveryDataValueConforms(xStateMachine, diagnostics, context);
		if (result || diagnostics != null) result &= validate_EveryReferenceIsContained(xStateMachine, diagnostics, context);
		if (result || diagnostics != null) result &= validate_EveryBidirectionalReferenceIsPaired(xStateMachine, diagnostics, context);
		if (result || diagnostics != null) result &= validate_EveryProxyResolves(xStateMachine, diagnostics, context);
		if (result || diagnostics != null) result &= validate_UniqueID(xStateMachine, diagnostics, context);
		if (result || diagnostics != null) result &= validate_EveryKeyUnique(xStateMachine, diagnostics, context);
		if (result || diagnostics != null) result &= validate_EveryMapEntryUnique(xStateMachine, diagnostics, context);
		if (result || diagnostics != null) result &= validateXNamedElement_xNamedElementName(xStateMachine, diagnostics, context);
		if (result || diagnostics != null) result &= validateXBehavior_xBehaviorNoParameterSets(xStateMachine, diagnostics, context);
		if (result || diagnostics != null) result &= validateXStateMachine_xStateMachineOneRegion(xStateMachine, diagnostics, context);
		if (result || diagnostics != null) result &= validateXStateMachine_xStateMachineInitialState(xStateMachine, diagnostics, context);
		if (result || diagnostics != null) result &= validateXStateMachine_xStateMachineContext(xStateMachine, diagnostics, context);
		if (result || diagnostics != null) result &= validateXStateMachine_xStateMachineNoParameters(xStateMachine, diagnostics, context);
		if (result || diagnostics != null) result &= validateXStateMachine_xStateMachineRegions(xStateMachine, diagnostics, context);
		return result;
	}

	/**
	 * Validates the xStateMachineOneRegion constraint of '<em>XState Machine</em>'.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 */
	public boolean validateXStateMachine_xStateMachineOneRegion(XStateMachine xStateMachine, DiagnosticChain diagnostics, Map<Object, Object> context) {
		return xStateMachine.xStateMachineOneRegion(diagnostics, context);
	}

	/**
	 * Validates the xStateMachineInitialState constraint of '<em>XState Machine</em>'.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 */
	public boolean validateXStateMachine_xStateMachineInitialState(XStateMachine xStateMachine, DiagnosticChain diagnostics, Map<Object, Object> context) {
		return xStateMachine.xStateMachineInitialState(diagnostics, context);
	}

	/**
	 * Validates the xStateMachineContext constraint of '<em>XState Machine</em>'.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 */
	public boolean validateXStateMachine_xStateMachineContext(XStateMachine xStateMachine, DiagnosticChain diagnostics, Map<Object, Object> context) {
		return xStateMachine.xStateMachineContext(diagnostics, context);
	}

	/**
	 * Validates the xStateMachineNoParameters constraint of '<em>XState Machine</em>'.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 */
	public boolean validateXStateMachine_xStateMachineNoParameters(XStateMachine xStateMachine, DiagnosticChain diagnostics, Map<Object, Object> context) {
		return xStateMachine.xStateMachineNoParameters(diagnostics, context);
	}

	/**
	 * Validates the xStateMachineRegions constraint of '<em>XState Machine</em>'.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 */
	public boolean validateXStateMachine_xStateMachineRegions(XStateMachine xStateMachine, DiagnosticChain diagnostics, Map<Object, Object> context) {
		return xStateMachine.xStateMachineRegions(diagnostics, context);
	}

	/**
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 */
	public boolean validateXRegion(XRegion xRegion, DiagnosticChain diagnostics, Map<Object, Object> context) {
		if (!validate_NoCircularContainment(xRegion, diagnostics, context)) return false;
		boolean result = validate_EveryMultiplicityConforms(xRegion, diagnostics, context);
		if (result || diagnostics != null) result &= validate_EveryDataValueConforms(xRegion, diagnostics, context);
		if (result || diagnostics != null) result &= validate_EveryReferenceIsContained(xRegion, diagnostics, context);
		if (result || diagnostics != null) result &= validate_EveryBidirectionalReferenceIsPaired(xRegion, diagnostics, context);
		if (result || diagnostics != null) result &= validate_EveryProxyResolves(xRegion, diagnostics, context);
		if (result || diagnostics != null) result &= validate_UniqueID(xRegion, diagnostics, context);
		if (result || diagnostics != null) result &= validate_EveryKeyUnique(xRegion, diagnostics, context);
		if (result || diagnostics != null) result &= validate_EveryMapEntryUnique(xRegion, diagnostics, context);
		if (result || diagnostics != null) result &= validateXRegion_xRegionSubvertexes(xRegion, diagnostics, context);
		if (result || diagnostics != null) result &= validateXRegion_xRegionTransitions(xRegion, diagnostics, context);
		return result;
	}

	/**
	 * Validates the xRegionSubvertexes constraint of '<em>XRegion</em>'.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 */
	public boolean validateXRegion_xRegionSubvertexes(XRegion xRegion, DiagnosticChain diagnostics, Map<Object, Object> context) {
		return xRegion.xRegionSubvertexes(diagnostics, context);
	}

	/**
	 * Validates the xRegionTransitions constraint of '<em>XRegion</em>'.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 */
	public boolean validateXRegion_xRegionTransitions(XRegion xRegion, DiagnosticChain diagnostics, Map<Object, Object> context) {
		return xRegion.xRegionTransitions(diagnostics, context);
	}

	/**
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 */
	public boolean validateXState(XState xState, DiagnosticChain diagnostics, Map<Object, Object> context) {
		if (!validate_NoCircularContainment(xState, diagnostics, context)) return false;
		boolean result = validate_EveryMultiplicityConforms(xState, diagnostics, context);
		if (result || diagnostics != null) result &= validate_EveryDataValueConforms(xState, diagnostics, context);
		if (result || diagnostics != null) result &= validate_EveryReferenceIsContained(xState, diagnostics, context);
		if (result || diagnostics != null) result &= validate_EveryBidirectionalReferenceIsPaired(xState, diagnostics, context);
		if (result || diagnostics != null) result &= validate_EveryProxyResolves(xState, diagnostics, context);
		if (result || diagnostics != null) result &= validate_UniqueID(xState, diagnostics, context);
		if (result || diagnostics != null) result &= validate_EveryKeyUnique(xState, diagnostics, context);
		if (result || diagnostics != null) result &= validate_EveryMapEntryUnique(xState, diagnostics, context);
		if (result || diagnostics != null) result &= validateXState_xStateBehaviors(xState, diagnostics, context);
		if (result || diagnostics != null) result &= validateXState_xStateNoDoActivity(xState, diagnostics, context);
		if (result || diagnostics != null) result &= validateXState_xStateOneRegion(xState, diagnostics, context);
		if (result || diagnostics != null) result &= validateXState_xStateNoSubmachine(xState, diagnostics, context);
		if (result || diagnostics != null) result &= validateXState_xStateRegions(xState, diagnostics, context);
		return result;
	}

	/**
	 * Validates the xStateBehaviors constraint of '<em>XState</em>'.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 */
	public boolean validateXState_xStateBehaviors(XState xState, DiagnosticChain diagnostics, Map<Object, Object> context) {
		return xState.xStateBehaviors(diagnostics, context);
	}

	/**
	 * Validates the xStateNoDoActivity constraint of '<em>XState</em>'.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 */
	public boolean validateXState_xStateNoDoActivity(XState xState, DiagnosticChain diagnostics, Map<Object, Object> context) {
		return xState.xStateNoDoActivity(diagnostics, context);
	}

	/**
	 * Validates the xStateOneRegion constraint of '<em>XState</em>'.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 */
	public boolean validateXState_xStateOneRegion(XState xState, DiagnosticChain diagnostics, Map<Object, Object> context) {
		return xState.xStateOneRegion(diagnostics, context);
	}

	/**
	 * Validates the xStateNoSubmachine constraint of '<em>XState</em>'.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 */
	public boolean validateXState_xStateNoSubmachine(XState xState, DiagnosticChain diagnostics, Map<Object, Object> context) {
		return xState.xStateNoSubmachine(diagnostics, context);
	}

	/**
	 * Validates the xStateRegions constraint of '<em>XState</em>'.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 */
	public boolean validateXState_xStateRegions(XState xState, DiagnosticChain diagnostics, Map<Object, Object> context) {
		return xState.xStateRegions(diagnostics, context);
	}

	/**
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 */
	public boolean validateXVertex(XVertex xVertex, DiagnosticChain diagnostics, Map<Object, Object> context) {
		return validate_EveryDefaultConstraint(xVertex, diagnostics, context);
	}

	/**
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 */
	public boolean validateXPseudostate(XPseudostate xPseudostate, DiagnosticChain diagnostics, Map<Object, Object> context) {
		if (!validate_NoCircularContainment(xPseudostate, diagnostics, context)) return false;
		boolean result = validate_EveryMultiplicityConforms(xPseudostate, diagnostics, context);
		if (result || diagnostics != null) result &= validate_EveryDataValueConforms(xPseudostate, diagnostics, context);
		if (result || diagnostics != null) result &= validate_EveryReferenceIsContained(xPseudostate, diagnostics, context);
		if (result || diagnostics != null) result &= validate_EveryBidirectionalReferenceIsPaired(xPseudostate, diagnostics, context);
		if (result || diagnostics != null) result &= validate_EveryProxyResolves(xPseudostate, diagnostics, context);
		if (result || diagnostics != null) result &= validate_UniqueID(xPseudostate, diagnostics, context);
		if (result || diagnostics != null) result &= validate_EveryKeyUnique(xPseudostate, diagnostics, context);
		if (result || diagnostics != null) result &= validate_EveryMapEntryUnique(xPseudostate, diagnostics, context);
		if (result || diagnostics != null) result &= validateXPseudostate_xPsuedostateKind(xPseudostate, diagnostics, context);
		return result;
	}

	/**
	 * Validates the xPsuedostateKind constraint of '<em>XPseudostate</em>'.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 */
	public boolean validateXPseudostate_xPsuedostateKind(XPseudostate xPseudostate, DiagnosticChain diagnostics, Map<Object, Object> context) {
		return xPseudostate.xPsuedostateKind(diagnostics, context);
	}

	/**
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 */
	public boolean validateXTransition(XTransition xTransition, DiagnosticChain diagnostics, Map<Object, Object> context) {
		if (!validate_NoCircularContainment(xTransition, diagnostics, context)) return false;
		boolean result = validate_EveryMultiplicityConforms(xTransition, diagnostics, context);
		if (result || diagnostics != null) result &= validate_EveryDataValueConforms(xTransition, diagnostics, context);
		if (result || diagnostics != null) result &= validate_EveryReferenceIsContained(xTransition, diagnostics, context);
		if (result || diagnostics != null) result &= validate_EveryBidirectionalReferenceIsPaired(xTransition, diagnostics, context);
		if (result || diagnostics != null) result &= validate_EveryProxyResolves(xTransition, diagnostics, context);
		if (result || diagnostics != null) result &= validate_UniqueID(xTransition, diagnostics, context);
		if (result || diagnostics != null) result &= validate_EveryKeyUnique(xTransition, diagnostics, context);
		if (result || diagnostics != null) result &= validate_EveryMapEntryUnique(xTransition, diagnostics, context);
		if (result || diagnostics != null) result &= validateXTransition_xTransitionTrigger(xTransition, diagnostics, context);
		if (result || diagnostics != null) result &= validateXTransition_xTransitionGuard(xTransition, diagnostics, context);
		if (result || diagnostics != null) result &= validateXTransition_xTransitionEffect(xTransition, diagnostics, context);
		return result;
	}

	/**
	 * Validates the xTransitionTrigger constraint of '<em>XTransition</em>'.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 */
	public boolean validateXTransition_xTransitionTrigger(XTransition xTransition, DiagnosticChain diagnostics, Map<Object, Object> context) {
		return xTransition.xTransitionTrigger(diagnostics, context);
	}

	/**
	 * Validates the xTransitionGuard constraint of '<em>XTransition</em>'.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 */
	public boolean validateXTransition_xTransitionGuard(XTransition xTransition, DiagnosticChain diagnostics, Map<Object, Object> context) {
		return xTransition.xTransitionGuard(diagnostics, context);
	}

	/**
	 * Validates the xTransitionEffect constraint of '<em>XTransition</em>'.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 */
	public boolean validateXTransition_xTransitionEffect(XTransition xTransition, DiagnosticChain diagnostics, Map<Object, Object> context) {
		return xTransition.xTransitionEffect(diagnostics, context);
	}

	/**
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 */
	public boolean validateXActivity(XActivity xActivity, DiagnosticChain diagnostics, Map<Object, Object> context) {
		if (!validate_NoCircularContainment(xActivity, diagnostics, context)) return false;
		boolean result = validate_EveryMultiplicityConforms(xActivity, diagnostics, context);
		if (result || diagnostics != null) result &= validate_EveryDataValueConforms(xActivity, diagnostics, context);
		if (result || diagnostics != null) result &= validate_EveryReferenceIsContained(xActivity, diagnostics, context);
		if (result || diagnostics != null) result &= validate_EveryBidirectionalReferenceIsPaired(xActivity, diagnostics, context);
		if (result || diagnostics != null) result &= validate_EveryProxyResolves(xActivity, diagnostics, context);
		if (result || diagnostics != null) result &= validate_UniqueID(xActivity, diagnostics, context);
		if (result || diagnostics != null) result &= validate_EveryKeyUnique(xActivity, diagnostics, context);
		if (result || diagnostics != null) result &= validate_EveryMapEntryUnique(xActivity, diagnostics, context);
		if (result || diagnostics != null) result &= validateXNamedElement_xNamedElementName(xActivity, diagnostics, context);
		if (result || diagnostics != null) result &= validateXBehavior_xBehaviorNoParameterSets(xActivity, diagnostics, context);
		if (result || diagnostics != null) result &= validateXActivity_xActivityParameters(xActivity, diagnostics, context);
		if (result || diagnostics != null) result &= validateXActivity_xActivityTextualRepresentation(xActivity, diagnostics, context);
		return result;
	}

	/**
	 * Validates the xActivityParameters constraint of '<em>XActivity</em>'.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 */
	public boolean validateXActivity_xActivityParameters(XActivity xActivity, DiagnosticChain diagnostics, Map<Object, Object> context) {
		return xActivity.xActivityParameters(diagnostics, context);
	}

	/**
	 * Validates the xActivityTextualRepresentation constraint of '<em>XActivity</em>'.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 */
	public boolean validateXActivity_xActivityTextualRepresentation(XActivity xActivity, DiagnosticChain diagnostics, Map<Object, Object> context) {
		return xActivity.xActivityTextualRepresentation(diagnostics, context);
	}

	/**
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 */
	public boolean validateXActionBehavior(XActionBehavior xActionBehavior, DiagnosticChain diagnostics, Map<Object, Object> context) {
		if (!validate_NoCircularContainment(xActionBehavior, diagnostics, context)) return false;
		boolean result = validate_EveryMultiplicityConforms(xActionBehavior, diagnostics, context);
		if (result || diagnostics != null) result &= validate_EveryDataValueConforms(xActionBehavior, diagnostics, context);
		if (result || diagnostics != null) result &= validate_EveryReferenceIsContained(xActionBehavior, diagnostics, context);
		if (result || diagnostics != null) result &= validate_EveryBidirectionalReferenceIsPaired(xActionBehavior, diagnostics, context);
		if (result || diagnostics != null) result &= validate_EveryProxyResolves(xActionBehavior, diagnostics, context);
		if (result || diagnostics != null) result &= validate_UniqueID(xActionBehavior, diagnostics, context);
		if (result || diagnostics != null) result &= validate_EveryKeyUnique(xActionBehavior, diagnostics, context);
		if (result || diagnostics != null) result &= validate_EveryMapEntryUnique(xActionBehavior, diagnostics, context);
		if (result || diagnostics != null) result &= validateXNamedElement_xNamedElementName(xActionBehavior, diagnostics, context);
		if (result || diagnostics != null) result &= validateXBehavior_xBehaviorNoParameterSets(xActionBehavior, diagnostics, context);
		return result;
	}

	/**
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 */
	public boolean validateXConstraint(XConstraint xConstraint, DiagnosticChain diagnostics, Map<Object, Object> context) {
		if (!validate_NoCircularContainment(xConstraint, diagnostics, context)) return false;
		boolean result = validate_EveryMultiplicityConforms(xConstraint, diagnostics, context);
		if (result || diagnostics != null) result &= validate_EveryDataValueConforms(xConstraint, diagnostics, context);
		if (result || diagnostics != null) result &= validate_EveryReferenceIsContained(xConstraint, diagnostics, context);
		if (result || diagnostics != null) result &= validate_EveryBidirectionalReferenceIsPaired(xConstraint, diagnostics, context);
		if (result || diagnostics != null) result &= validate_EveryProxyResolves(xConstraint, diagnostics, context);
		if (result || diagnostics != null) result &= validate_UniqueID(xConstraint, diagnostics, context);
		if (result || diagnostics != null) result &= validate_EveryKeyUnique(xConstraint, diagnostics, context);
		if (result || diagnostics != null) result &= validate_EveryMapEntryUnique(xConstraint, diagnostics, context);
		if (result || diagnostics != null) result &= validateXNamedElement_xNamedElementName(xConstraint, diagnostics, context);
		if (result || diagnostics != null) result &= validateXConstraint_xConstraintSpecification(xConstraint, diagnostics, context);
		if (result || diagnostics != null) result &= validateXConstraint_xConstraintBehavior(xConstraint, diagnostics, context);
		return result;
	}

	/**
	 * Validates the xConstraintSpecification constraint of '<em>XConstraint</em>'.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 */
	public boolean validateXConstraint_xConstraintSpecification(XConstraint xConstraint, DiagnosticChain diagnostics, Map<Object, Object> context) {
		return xConstraint.xConstraintSpecification(diagnostics, context);
	}

	/**
	 * Validates the xConstraintBehavior constraint of '<em>XConstraint</em>'.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 */
	public boolean validateXConstraint_xConstraintBehavior(XConstraint xConstraint, DiagnosticChain diagnostics, Map<Object, Object> context) {
		return xConstraint.xConstraintBehavior(diagnostics, context);
	}

	/**
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 */
	public boolean validateXOpaqueBehavior(XOpaqueBehavior xOpaqueBehavior, DiagnosticChain diagnostics, Map<Object, Object> context) {
		if (!validate_NoCircularContainment(xOpaqueBehavior, diagnostics, context)) return false;
		boolean result = validate_EveryMultiplicityConforms(xOpaqueBehavior, diagnostics, context);
		if (result || diagnostics != null) result &= validate_EveryDataValueConforms(xOpaqueBehavior, diagnostics, context);
		if (result || diagnostics != null) result &= validate_EveryReferenceIsContained(xOpaqueBehavior, diagnostics, context);
		if (result || diagnostics != null) result &= validate_EveryBidirectionalReferenceIsPaired(xOpaqueBehavior, diagnostics, context);
		if (result || diagnostics != null) result &= validate_EveryProxyResolves(xOpaqueBehavior, diagnostics, context);
		if (result || diagnostics != null) result &= validate_UniqueID(xOpaqueBehavior, diagnostics, context);
		if (result || diagnostics != null) result &= validate_EveryKeyUnique(xOpaqueBehavior, diagnostics, context);
		if (result || diagnostics != null) result &= validate_EveryMapEntryUnique(xOpaqueBehavior, diagnostics, context);
		if (result || diagnostics != null) result &= validateXNamedElement_xNamedElementName(xOpaqueBehavior, diagnostics, context);
		if (result || diagnostics != null) result &= validateXBehavior_xBehaviorNoParameterSets(xOpaqueBehavior, diagnostics, context);
		if (result || diagnostics != null) result &= validateXOpaqueBehavior_xOpaqueBehaviorExternal(xOpaqueBehavior, diagnostics, context);
		return result;
	}

	/**
	 * Validates the xOpaqueBehaviorExternal constraint of '<em>XOpaque Behavior</em>'.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 */
	public boolean validateXOpaqueBehavior_xOpaqueBehaviorExternal(XOpaqueBehavior xOpaqueBehavior, DiagnosticChain diagnostics, Map<Object, Object> context) {
		return xOpaqueBehavior.xOpaqueBehaviorExternal(diagnostics, context);
	}

	/**
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 */
	public boolean validateXConstrainedType(XConstrainedType xConstrainedType, DiagnosticChain diagnostics, Map<Object, Object> context) {
		if (!validate_NoCircularContainment(xConstrainedType, diagnostics, context)) return false;
		boolean result = validate_EveryMultiplicityConforms(xConstrainedType, diagnostics, context);
		if (result || diagnostics != null) result &= validate_EveryDataValueConforms(xConstrainedType, diagnostics, context);
		if (result || diagnostics != null) result &= validate_EveryReferenceIsContained(xConstrainedType, diagnostics, context);
		if (result || diagnostics != null) result &= validate_EveryBidirectionalReferenceIsPaired(xConstrainedType, diagnostics, context);
		if (result || diagnostics != null) result &= validate_EveryProxyResolves(xConstrainedType, diagnostics, context);
		if (result || diagnostics != null) result &= validate_UniqueID(xConstrainedType, diagnostics, context);
		if (result || diagnostics != null) result &= validate_EveryKeyUnique(xConstrainedType, diagnostics, context);
		if (result || diagnostics != null) result &= validate_EveryMapEntryUnique(xConstrainedType, diagnostics, context);
		if (result || diagnostics != null) result &= validateXNamedElement_xNamedElementName(xConstrainedType, diagnostics, context);
		if (result || diagnostics != null) result &= validateXClassifier_xClassifierFeatures(xConstrainedType, diagnostics, context);
		if (result || diagnostics != null) result &= validateXClassifier_xClassifierNestedClassifiers(xConstrainedType, diagnostics, context);
		if (result || diagnostics != null) result &= validateXClassifier_xClassifierGenerals(xConstrainedType, diagnostics, context);
		if (result || diagnostics != null) result &= validateXClassifier_xClassifierConstraints(xConstrainedType, diagnostics, context);
		if (result || diagnostics != null) result &= validateXConstrainedType_xConstrainedTypePrimitiveType(xConstrainedType, diagnostics, context);
		if (result || diagnostics != null) result &= validateXConstrainedType_xConstrainedTypeBounds(xConstrainedType, diagnostics, context);
		return result;
	}

	/**
	 * Validates the xConstrainedTypePrimitiveType constraint of '<em>XConstrained Type</em>'.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 */
	public boolean validateXConstrainedType_xConstrainedTypePrimitiveType(XConstrainedType xConstrainedType, DiagnosticChain diagnostics, Map<Object, Object> context) {
		return xConstrainedType.xConstrainedTypePrimitiveType(diagnostics, context);
	}

	/**
	 * Validates the xConstrainedTypeBounds constraint of '<em>XConstrained Type</em>'.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 */
	public boolean validateXConstrainedType_xConstrainedTypeBounds(XConstrainedType xConstrainedType, DiagnosticChain diagnostics, Map<Object, Object> context) {
		return xConstrainedType.xConstrainedTypeBounds(diagnostics, context);
	}

	/**
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 */
	public boolean validateXGeneralization(XGeneralization xGeneralization, DiagnosticChain diagnostics, Map<Object, Object> context) {
		if (!validate_NoCircularContainment(xGeneralization, diagnostics, context)) return false;
		boolean result = validate_EveryMultiplicityConforms(xGeneralization, diagnostics, context);
		if (result || diagnostics != null) result &= validate_EveryDataValueConforms(xGeneralization, diagnostics, context);
		if (result || diagnostics != null) result &= validate_EveryReferenceIsContained(xGeneralization, diagnostics, context);
		if (result || diagnostics != null) result &= validate_EveryBidirectionalReferenceIsPaired(xGeneralization, diagnostics, context);
		if (result || diagnostics != null) result &= validate_EveryProxyResolves(xGeneralization, diagnostics, context);
		if (result || diagnostics != null) result &= validate_UniqueID(xGeneralization, diagnostics, context);
		if (result || diagnostics != null) result &= validate_EveryKeyUnique(xGeneralization, diagnostics, context);
		if (result || diagnostics != null) result &= validate_EveryMapEntryUnique(xGeneralization, diagnostics, context);
		if (result || diagnostics != null) result &= validateXGeneralization_xGeneralizationClassifiers(xGeneralization, diagnostics, context);
		if (result || diagnostics != null) result &= validateXGeneralization_xGeneralizationGeneralizationSet(xGeneralization, diagnostics, context);
		return result;
	}

	/**
	 * Validates the xGeneralizationClassifiers constraint of '<em>XGeneralization</em>'.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 */
	public boolean validateXGeneralization_xGeneralizationClassifiers(XGeneralization xGeneralization, DiagnosticChain diagnostics, Map<Object, Object> context) {
		return xGeneralization.xGeneralizationClassifiers(diagnostics, context);
	}

	/**
	 * Validates the xGeneralizationGeneralizationSet constraint of '<em>XGeneralization</em>'.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 */
	public boolean validateXGeneralization_xGeneralizationGeneralizationSet(XGeneralization xGeneralization, DiagnosticChain diagnostics, Map<Object, Object> context) {
		return xGeneralization.xGeneralizationGeneralizationSet(diagnostics, context);
	}

	/**
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 */
	public boolean validateXGeneralizationSet(XGeneralizationSet xGeneralizationSet, DiagnosticChain diagnostics, Map<Object, Object> context) {
		return validate_EveryDefaultConstraint(xGeneralizationSet, diagnostics, context);
	}

	/**
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 */
	public boolean validateXClass(XClass xClass, DiagnosticChain diagnostics, Map<Object, Object> context) {
		if (!validate_NoCircularContainment(xClass, diagnostics, context)) return false;
		boolean result = validate_EveryMultiplicityConforms(xClass, diagnostics, context);
		if (result || diagnostics != null) result &= validate_EveryDataValueConforms(xClass, diagnostics, context);
		if (result || diagnostics != null) result &= validate_EveryReferenceIsContained(xClass, diagnostics, context);
		if (result || diagnostics != null) result &= validate_EveryBidirectionalReferenceIsPaired(xClass, diagnostics, context);
		if (result || diagnostics != null) result &= validate_EveryProxyResolves(xClass, diagnostics, context);
		if (result || diagnostics != null) result &= validate_UniqueID(xClass, diagnostics, context);
		if (result || diagnostics != null) result &= validate_EveryKeyUnique(xClass, diagnostics, context);
		if (result || diagnostics != null) result &= validate_EveryMapEntryUnique(xClass, diagnostics, context);
		if (result || diagnostics != null) result &= validateXNamedElement_xNamedElementName(xClass, diagnostics, context);
		if (result || diagnostics != null) result &= validateXClassifier_xClassifierFeatures(xClass, diagnostics, context);
		if (result || diagnostics != null) result &= validateXClassifier_xClassifierNestedClassifiers(xClass, diagnostics, context);
		if (result || diagnostics != null) result &= validateXClassifier_xClassifierGenerals(xClass, diagnostics, context);
		if (result || diagnostics != null) result &= validateXClassifier_xClassifierConstraints(xClass, diagnostics, context);
		if (result || diagnostics != null) result &= validateXClass_xClassMetaclass(xClass, diagnostics, context);
		if (result || diagnostics != null) result &= validateXClass_xClassNestedClassifiers(xClass, diagnostics, context);
		if (result || diagnostics != null) result &= validateXClass_xClassExternal(xClass, diagnostics, context);
		return result;
	}

	/**
	 * Validates the xClassMetaclass constraint of '<em>XClass</em>'.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 */
	public boolean validateXClass_xClassMetaclass(XClass xClass, DiagnosticChain diagnostics, Map<Object, Object> context) {
		return xClass.xClassMetaclass(diagnostics, context);
	}

	/**
	 * Validates the xClassNestedClassifiers constraint of '<em>XClass</em>'.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 */
	public boolean validateXClass_xClassNestedClassifiers(XClass xClass, DiagnosticChain diagnostics, Map<Object, Object> context) {
		return xClass.xClassNestedClassifiers(diagnostics, context);
	}

	/**
	 * Validates the xClassExternal constraint of '<em>XClass</em>'.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 */
	public boolean validateXClass_xClassExternal(XClass xClass, DiagnosticChain diagnostics, Map<Object, Object> context) {
		return xClass.xClassExternal(diagnostics, context);
	}

	/**
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 */
	public boolean validateXConnectorEnd(XConnectorEnd xConnectorEnd, DiagnosticChain diagnostics, Map<Object, Object> context) {
		if (!validate_NoCircularContainment(xConnectorEnd, diagnostics, context)) return false;
		boolean result = validate_EveryMultiplicityConforms(xConnectorEnd, diagnostics, context);
		if (result || diagnostics != null) result &= validate_EveryDataValueConforms(xConnectorEnd, diagnostics, context);
		if (result || diagnostics != null) result &= validate_EveryReferenceIsContained(xConnectorEnd, diagnostics, context);
		if (result || diagnostics != null) result &= validate_EveryBidirectionalReferenceIsPaired(xConnectorEnd, diagnostics, context);
		if (result || diagnostics != null) result &= validate_EveryProxyResolves(xConnectorEnd, diagnostics, context);
		if (result || diagnostics != null) result &= validate_UniqueID(xConnectorEnd, diagnostics, context);
		if (result || diagnostics != null) result &= validate_EveryKeyUnique(xConnectorEnd, diagnostics, context);
		if (result || diagnostics != null) result &= validate_EveryMapEntryUnique(xConnectorEnd, diagnostics, context);
		if (result || diagnostics != null) result &= validateXConnectorEnd_xConnectorEndConnector(xConnectorEnd, diagnostics, context);
		if (result || diagnostics != null) result &= validateXConnectorEnd_xConnectorEndRole(xConnectorEnd, diagnostics, context);
		if (result || diagnostics != null) result &= validateXConnectorEnd_xConnectorEndUniqueness(xConnectorEnd, diagnostics, context);
		return result;
	}

	/**
	 * Validates the xConnectorEndConnector constraint of '<em>XConnector End</em>'.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 */
	public boolean validateXConnectorEnd_xConnectorEndConnector(XConnectorEnd xConnectorEnd, DiagnosticChain diagnostics, Map<Object, Object> context) {
		return xConnectorEnd.xConnectorEndConnector(diagnostics, context);
	}

	/**
	 * Validates the xConnectorEndRole constraint of '<em>XConnector End</em>'.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 */
	public boolean validateXConnectorEnd_xConnectorEndRole(XConnectorEnd xConnectorEnd, DiagnosticChain diagnostics, Map<Object, Object> context) {
		return xConnectorEnd.xConnectorEndRole(diagnostics, context);
	}

	/**
	 * Validates the xConnectorEndUniqueness constraint of '<em>XConnector End</em>'.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 */
	public boolean validateXConnectorEnd_xConnectorEndUniqueness(XConnectorEnd xConnectorEnd, DiagnosticChain diagnostics, Map<Object, Object> context) {
		return xConnectorEnd.xConnectorEndUniqueness(diagnostics, context);
	}

	/**
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 */
	public boolean validateXMessageKind(XMessageKind xMessageKind, DiagnosticChain diagnostics, Map<Object, Object> context) {
		return true;
	}

	/**
	 * Returns the resource locator that will be used to fetch messages for this validator's diagnostics.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 */
	@Override
	public ResourceLocator getResourceLocator() {
		// TODO
		// Specialize this to return a resource locator for messages specific to this validator.
		// Ensure that you remove @generated or mark it @generated NOT
		return super.getResourceLocator();
	}

} //ExecutableModelingProfileValidator
