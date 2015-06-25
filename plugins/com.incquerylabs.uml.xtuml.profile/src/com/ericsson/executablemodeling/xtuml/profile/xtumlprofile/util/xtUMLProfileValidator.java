/**
 */
package com.ericsson.executablemodeling.xtuml.profile.xtumlprofile.util;

import com.ericsson.executablemodeling.xtuml.profile.executablemodelingprofile.util.ExecutableModelingProfileValidator;

import com.ericsson.executablemodeling.xtuml.profile.xtumlprofile.*;

import java.util.Map;

import org.eclipse.emf.common.util.DiagnosticChain;
import org.eclipse.emf.common.util.ResourceLocator;

import org.eclipse.emf.ecore.EPackage;

import org.eclipse.emf.ecore.util.EObjectValidator;

/**
 * <!-- begin-user-doc -->
 * The <b>Validator</b> for the model.
 * <!-- end-user-doc -->
 * @see com.ericsson.executablemodeling.xtuml.profile.xtumlprofile.xtUMLProfilePackage
 * @generated
 */
public class xtUMLProfileValidator extends EObjectValidator {
	/**
	 * The cached model package
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 */
	public static final xtUMLProfileValidator INSTANCE = new xtUMLProfileValidator();

	/**
	 * A constant for the {@link org.eclipse.emf.common.util.Diagnostic#getSource() source} of diagnostic {@link org.eclipse.emf.common.util.Diagnostic#getCode() codes} from this package.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @see org.eclipse.emf.common.util.Diagnostic#getSource()
	 * @see org.eclipse.emf.common.util.Diagnostic#getCode()
	 * @generated
	 */
	public static final String DIAGNOSTIC_SOURCE = "com.ericsson.executablemodeling.xtuml.profile.xtumlprofile";

	/**
	 * The {@link org.eclipse.emf.common.util.Diagnostic#getCode() code} for constraint 'Xt Connector End Role' of 'Xt Connector End'.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 */
	public static final int XT_CONNECTOR_END__XT_CONNECTOR_END_ROLE = 1;

	/**
	 * The {@link org.eclipse.emf.common.util.Diagnostic#getCode() code} for constraint 'Xt Property Aggregation' of 'Xt Property'.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 */
	public static final int XT_PROPERTY__XT_PROPERTY_AGGREGATION = 2;

	/**
	 * The {@link org.eclipse.emf.common.util.Diagnostic#getCode() code} for constraint 'Xt Property Redefinition' of 'Xt Property'.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 */
	public static final int XT_PROPERTY__XT_PROPERTY_REDEFINITION = 3;

	/**
	 * The {@link org.eclipse.emf.common.util.Diagnostic#getCode() code} for constraint 'Xt Property Derivation' of 'Xt Property'.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 */
	public static final int XT_PROPERTY__XT_PROPERTY_DERIVATION = 4;

	/**
	 * The {@link org.eclipse.emf.common.util.Diagnostic#getCode() code} for constraint 'Xt Component Attributes' of 'Xt Component'.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 */
	public static final int XT_COMPONENT__XT_COMPONENT_ATTRIBUTES = 5;

	/**
	 * The {@link org.eclipse.emf.common.util.Diagnostic#getCode() code} for constraint 'Xt Component Behavioral Features' of 'Xt Component'.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 */
	public static final int XT_COMPONENT__XT_COMPONENT_BEHAVIORAL_FEATURES = 6;

	/**
	 * The {@link org.eclipse.emf.common.util.Diagnostic#getCode() code} for constraint 'Xt Component Owned Behaviors' of 'Xt Component'.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 */
	public static final int XT_COMPONENT__XT_COMPONENT_OWNED_BEHAVIORS = 7;

	/**
	 * The {@link org.eclipse.emf.common.util.Diagnostic#getCode() code} for constraint 'Xt Component Nested Classifiers' of 'Xt Component'.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 */
	public static final int XT_COMPONENT__XT_COMPONENT_NESTED_CLASSIFIERS = 8;

	/**
	 * The {@link org.eclipse.emf.common.util.Diagnostic#getCode() code} for constraint 'Xt Component Parts' of 'Xt Component'.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 */
	public static final int XT_COMPONENT__XT_COMPONENT_PARTS = 9;

	/**
	 * The {@link org.eclipse.emf.common.util.Diagnostic#getCode() code} for constraint 'Xt Component Generalization' of 'Xt Component'.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 */
	public static final int XT_COMPONENT__XT_COMPONENT_GENERALIZATION = 10;

	/**
	 * The {@link org.eclipse.emf.common.util.Diagnostic#getCode() code} for constraint 'Xt Part Type' of 'Xt Part'.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 */
	public static final int XT_PART__XT_PART_TYPE = 11;

	/**
	 * The {@link org.eclipse.emf.common.util.Diagnostic#getCode() code} for constraint 'Xt Part Composition' of 'Xt Part'.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 */
	public static final int XT_PART__XT_PART_COMPOSITION = 12;

	/**
	 * The {@link org.eclipse.emf.common.util.Diagnostic#getCode() code} for constraint 'Xt Part Visibility' of 'Xt Part'.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 */
	public static final int XT_PART__XT_PART_VISIBILITY = 13;

	/**
	 * The {@link org.eclipse.emf.common.util.Diagnostic#getCode() code} for constraint 'Xt Port Visibility' of 'Xt Port'.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 */
	public static final int XT_PORT__XT_PORT_VISIBILITY = 14;

	/**
	 * The {@link org.eclipse.emf.common.util.Diagnostic#getCode() code} for constraint 'Xt Connector Visibility' of 'Xt Port'.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 */
	public static final int XT_PORT__XT_CONNECTOR_VISIBILITY = 15;

	/**
	 * The {@link org.eclipse.emf.common.util.Diagnostic#getCode() code} for constraint 'Xt Port Behavior Port' of 'Xt Port'.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 */
	public static final int XT_PORT__XT_PORT_BEHAVIOR_PORT = 16;

	/**
	 * The {@link org.eclipse.emf.common.util.Diagnostic#getCode() code} for constraint 'Xt Connector Connector Ends' of 'Xt Connector'.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 */
	public static final int XT_CONNECTOR__XT_CONNECTOR_CONNECTOR_ENDS = 17;

	/**
	 * The {@link org.eclipse.emf.common.util.Diagnostic#getCode() code} for constraint 'Xt Protocol Nested Classifiers' of 'Xt Protocol'.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 */
	public static final int XT_PROTOCOL__XT_PROTOCOL_NESTED_CLASSIFIERS = 18;

	/**
	 * The {@link org.eclipse.emf.common.util.Diagnostic#getCode() code} for constraint 'Xt Protocol Behaviors' of 'Xt Protocol'.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 */
	public static final int XT_PROTOCOL__XT_PROTOCOL_BEHAVIORS = 19;

	/**
	 * The {@link org.eclipse.emf.common.util.Diagnostic#getCode() code} for constraint 'Xt Message Set Nested Classifiers' of 'Xt Message Set'.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 */
	public static final int XT_MESSAGE_SET__XT_MESSAGE_SET_NESTED_CLASSIFIERS = 20;

	/**
	 * The {@link org.eclipse.emf.common.util.Diagnostic#getCode() code} for constraint 'Xt Message Set Attributes' of 'Xt Message Set'.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 */
	public static final int XT_MESSAGE_SET__XT_MESSAGE_SET_ATTRIBUTES = 21;

	/**
	 * The {@link org.eclipse.emf.common.util.Diagnostic#getCode() code} for constraint 'Xt Association End Ownership' of 'Xt Association'.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 */
	public static final int XT_ASSOCIATION__XT_ASSOCIATION_END_OWNERSHIP = 22;

	/**
	 * The {@link org.eclipse.emf.common.util.Diagnostic#getCode() code} for constraint 'Xt Association Ends' of 'Xt Association'.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 */
	public static final int XT_ASSOCIATION__XT_ASSOCIATION_ENDS = 23;

	/**
	 * The {@link org.eclipse.emf.common.util.Diagnostic#getCode() code} for constraint 'Xt Association End Type' of 'Xt Association'.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 */
	public static final int XT_ASSOCIATION__XT_ASSOCIATION_END_TYPE = 24;

	/**
	 * The {@link org.eclipse.emf.common.util.Diagnostic#getCode() code} for constraint 'Xt Association Generalization' of 'Xt Association'.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 */
	public static final int XT_ASSOCIATION__XT_ASSOCIATION_GENERALIZATION = 25;

	/**
	 * The {@link org.eclipse.emf.common.util.Diagnostic#getCode() code} for constraint 'Xt Trigger Event' of 'Xt Trigger'.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 */
	public static final int XT_TRIGGER__XT_TRIGGER_EVENT = 26;

	/**
	 * The {@link org.eclipse.emf.common.util.Diagnostic#getCode() code} for constraint 'Xt Pseudostate Kind' of 'Xt Pseudo State'.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 */
	public static final int XT_PSEUDO_STATE__XT_PSEUDOSTATE_KIND = 27;

	/**
	 * The {@link org.eclipse.emf.common.util.Diagnostic#getCode() code} for constraint 'Xt Transition No Guard' of 'Xt Transition'.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 */
	public static final int XT_TRANSITION__XT_TRANSITION_NO_GUARD = 28;

	/**
	 * The {@link org.eclipse.emf.common.util.Diagnostic#getCode() code} for constraint 'XState Not Composite' of 'Xt State'.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 */
	public static final int XT_STATE__XSTATE_NOT_COMPOSITE = 29;

	/**
	 * The {@link org.eclipse.emf.common.util.Diagnostic#getCode() code} for constraint 'Xt Activity Textual Representation' of 'Xt Activity'.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 */
	public static final int XT_ACTIVITY__XT_ACTIVITY_TEXTUAL_REPRESENTATION = 30;

	/**
	 * The {@link org.eclipse.emf.common.util.Diagnostic#getCode() code} for constraint 'Xt Class Constructors' of 'Xt Class'.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 */
	public static final int XT_CLASS__XT_CLASS_CONSTRUCTORS = 31;

	/**
	 * The {@link org.eclipse.emf.common.util.Diagnostic#getCode() code} for constraint 'Xt Class Classifier Behavior' of 'Xt Class'.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 */
	public static final int XT_CLASS__XT_CLASS_CLASSIFIER_BEHAVIOR = 32;

	/**
	 * The {@link org.eclipse.emf.common.util.Diagnostic#getCode() code} for constraint 'Xt Class Visibility' of 'Xt Class'.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 */
	public static final int XT_CLASS__XT_CLASS_VISIBILITY = 33;

	/**
	 * The {@link org.eclipse.emf.common.util.Diagnostic#getCode() code} for constraint 'Xt Class Generalization Sets' of 'Xt Class'.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 */
	public static final int XT_CLASS__XT_CLASS_GENERALIZATION_SETS = 34;

	/**
	 * The {@link org.eclipse.emf.common.util.Diagnostic#getCode() code} for constraint 'Xt Opaque Behavior Language' of 'Xt Opaque Behavior'.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 */
	public static final int XT_OPAQUE_BEHAVIOR__XT_OPAQUE_BEHAVIOR_LANGUAGE = 35;

	/**
	 * The {@link org.eclipse.emf.common.util.Diagnostic#getCode() code} for constraint 'Xt Generalization Generalization Set' of 'Xt Generalization'.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 */
	public static final int XT_GENERALIZATION__XT_GENERALIZATION_GENERALIZATION_SET = 36;

	/**
	 * The {@link org.eclipse.emf.common.util.Diagnostic#getCode() code} for constraint 'Xt Generalization Set' of 'Xt Generalization Set'.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 */
	public static final int XT_GENERALIZATION_SET__XT_GENERALIZATION_SET = 37;

	/**
	 * A constant with a fixed name that can be used as the base value for additional hand written constants.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 */
	private static final int GENERATED_DIAGNOSTIC_CODE_COUNT = 37;

	/**
	 * A constant with a fixed name that can be used as the base value for additional hand written constants in a derived class.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 */
	protected static final int DIAGNOSTIC_CODE_COUNT = GENERATED_DIAGNOSTIC_CODE_COUNT;

	/**
	 * The cached base package validator.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 */
	protected ExecutableModelingProfileValidator executableModelingProfileValidator;

	/**
	 * Creates an instance of the switch.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 */
	public xtUMLProfileValidator() {
		super();
		executableModelingProfileValidator = ExecutableModelingProfileValidator.INSTANCE;
	}

	/**
	 * Returns the package of this validator switch.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 */
	@Override
	protected EPackage getEPackage() {
	  return xtUMLProfilePackage.eINSTANCE;
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
			case xtUMLProfilePackage.XT_CONNECTOR_END:
				return validateXtConnectorEnd((XtConnectorEnd)value, diagnostics, context);
			case xtUMLProfilePackage.XT_PROPERTY:
				return validateXtProperty((XtProperty)value, diagnostics, context);
			case xtUMLProfilePackage.XT_COMPONENT:
				return validateXtComponent((XtComponent)value, diagnostics, context);
			case xtUMLProfilePackage.XT_OPERATION:
				return validateXtOperation((XtOperation)value, diagnostics, context);
			case xtUMLProfilePackage.XT_PARAMETER:
				return validateXtParameter((XtParameter)value, diagnostics, context);
			case xtUMLProfilePackage.XT_RECEPTION:
				return validateXtReception((XtReception)value, diagnostics, context);
			case xtUMLProfilePackage.XT_PART:
				return validateXtPart((XtPart)value, diagnostics, context);
			case xtUMLProfilePackage.XT_PORT:
				return validateXtPort((XtPort)value, diagnostics, context);
			case xtUMLProfilePackage.XT_CONNECTOR:
				return validateXtConnector((XtConnector)value, diagnostics, context);
			case xtUMLProfilePackage.XT_PROTOCOL_CONTAINER:
				return validateXtProtocolContainer((XtProtocolContainer)value, diagnostics, context);
			case xtUMLProfilePackage.XT_PROTOCOL:
				return validateXtProtocol((XtProtocol)value, diagnostics, context);
			case xtUMLProfilePackage.XT_MESSAGE_SET:
				return validateXtMessageSet((XtMessageSet)value, diagnostics, context);
			case xtUMLProfilePackage.XT_SIGNAL:
				return validateXtSignal((XtSignal)value, diagnostics, context);
			case xtUMLProfilePackage.XT_DATA_TYPE:
				return validateXtDataType((XtDataType)value, diagnostics, context);
			case xtUMLProfilePackage.XT_ENUMERATION:
				return validateXtEnumeration((XtEnumeration)value, diagnostics, context);
			case xtUMLProfilePackage.XT_ASSOCIATION:
				return validateXtAssociation((XtAssociation)value, diagnostics, context);
			case xtUMLProfilePackage.XT_ASSOCIATION_CLASS:
				return validateXtAssociationClass((XtAssociationClass)value, diagnostics, context);
			case xtUMLProfilePackage.XT_TRIGGER:
				return validateXtTrigger((XtTrigger)value, diagnostics, context);
			case xtUMLProfilePackage.XT_STATE_MACHINE:
				return validateXtStateMachine((XtStateMachine)value, diagnostics, context);
			case xtUMLProfilePackage.XT_REGION:
				return validateXtRegion((XtRegion)value, diagnostics, context);
			case xtUMLProfilePackage.XT_PSEUDO_STATE:
				return validateXtPseudoState((XtPseudoState)value, diagnostics, context);
			case xtUMLProfilePackage.XT_TRANSITION:
				return validateXtTransition((XtTransition)value, diagnostics, context);
			case xtUMLProfilePackage.XT_STATE:
				return validateXtState((XtState)value, diagnostics, context);
			case xtUMLProfilePackage.XT_ACTIVITY:
				return validateXtActivity((XtActivity)value, diagnostics, context);
			case xtUMLProfilePackage.XT_CONSTRAINT:
				return validateXtConstraint((XtConstraint)value, diagnostics, context);
			case xtUMLProfilePackage.XT_CLASS:
				return validateXtClass((XtClass)value, diagnostics, context);
			case xtUMLProfilePackage.XT_CONSTRAINED_TYPE:
				return validateXtConstrainedType((XtConstrainedType)value, diagnostics, context);
			case xtUMLProfilePackage.XT_OPAQUE_BEHAVIOR:
				return validateXtOpaqueBehavior((XtOpaqueBehavior)value, diagnostics, context);
			case xtUMLProfilePackage.XT_GENERALIZATION:
				return validateXtGeneralization((XtGeneralization)value, diagnostics, context);
			case xtUMLProfilePackage.XT_GENERALIZATION_SET:
				return validateXtGeneralizationSet((XtGeneralizationSet)value, diagnostics, context);
			default:
				return true;
		}
	}

	/**
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 */
	public boolean validateXtConnectorEnd(XtConnectorEnd xtConnectorEnd, DiagnosticChain diagnostics, Map<Object, Object> context) {
		if (!validate_NoCircularContainment(xtConnectorEnd, diagnostics, context)) return false;
		boolean result = validate_EveryMultiplicityConforms(xtConnectorEnd, diagnostics, context);
		if (result || diagnostics != null) result &= validate_EveryDataValueConforms(xtConnectorEnd, diagnostics, context);
		if (result || diagnostics != null) result &= validate_EveryReferenceIsContained(xtConnectorEnd, diagnostics, context);
		if (result || diagnostics != null) result &= validate_EveryBidirectionalReferenceIsPaired(xtConnectorEnd, diagnostics, context);
		if (result || diagnostics != null) result &= validate_EveryProxyResolves(xtConnectorEnd, diagnostics, context);
		if (result || diagnostics != null) result &= validate_UniqueID(xtConnectorEnd, diagnostics, context);
		if (result || diagnostics != null) result &= validate_EveryKeyUnique(xtConnectorEnd, diagnostics, context);
		if (result || diagnostics != null) result &= validate_EveryMapEntryUnique(xtConnectorEnd, diagnostics, context);
		if (result || diagnostics != null) result &= executableModelingProfileValidator.validateXConnectorEnd_xConnectorEndConnector(xtConnectorEnd, diagnostics, context);
		if (result || diagnostics != null) result &= executableModelingProfileValidator.validateXConnectorEnd_xConnectorEndRole(xtConnectorEnd, diagnostics, context);
		if (result || diagnostics != null) result &= executableModelingProfileValidator.validateXConnectorEnd_xConnectorEndUniqueness(xtConnectorEnd, diagnostics, context);
		if (result || diagnostics != null) result &= validateXtConnectorEnd_xtConnectorEndRole(xtConnectorEnd, diagnostics, context);
		return result;
	}

	/**
	 * Validates the xtConnectorEndRole constraint of '<em>Xt Connector End</em>'.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 */
	public boolean validateXtConnectorEnd_xtConnectorEndRole(XtConnectorEnd xtConnectorEnd, DiagnosticChain diagnostics, Map<Object, Object> context) {
		return xtConnectorEnd.xtConnectorEndRole(diagnostics, context);
	}

	/**
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 */
	public boolean validateXtProperty(XtProperty xtProperty, DiagnosticChain diagnostics, Map<Object, Object> context) {
		if (!validate_NoCircularContainment(xtProperty, diagnostics, context)) return false;
		boolean result = validate_EveryMultiplicityConforms(xtProperty, diagnostics, context);
		if (result || diagnostics != null) result &= validate_EveryDataValueConforms(xtProperty, diagnostics, context);
		if (result || diagnostics != null) result &= validate_EveryReferenceIsContained(xtProperty, diagnostics, context);
		if (result || diagnostics != null) result &= validate_EveryBidirectionalReferenceIsPaired(xtProperty, diagnostics, context);
		if (result || diagnostics != null) result &= validate_EveryProxyResolves(xtProperty, diagnostics, context);
		if (result || diagnostics != null) result &= validate_UniqueID(xtProperty, diagnostics, context);
		if (result || diagnostics != null) result &= validate_EveryKeyUnique(xtProperty, diagnostics, context);
		if (result || diagnostics != null) result &= validate_EveryMapEntryUnique(xtProperty, diagnostics, context);
		if (result || diagnostics != null) result &= executableModelingProfileValidator.validateXMultiplicityElement_xMultiplicityElementIsOrderedByValue(xtProperty, diagnostics, context);
		if (result || diagnostics != null) result &= executableModelingProfileValidator.validateXMultiplicityElement_xMultiplicityElementKeys(xtProperty, diagnostics, context);
		if (result || diagnostics != null) result &= executableModelingProfileValidator.validateXNamedElement_xNamedElementName(xtProperty, diagnostics, context);
		if (result || diagnostics != null) result &= executableModelingProfileValidator.validateXFeature_xFeatureClassifier(xtProperty, diagnostics, context);
		if (result || diagnostics != null) result &= executableModelingProfileValidator.validateXTypedElement_xTypedElementType(xtProperty, diagnostics, context);
		if (result || diagnostics != null) result &= validateXtProperty_xtPropertyAggregation(xtProperty, diagnostics, context);
		if (result || diagnostics != null) result &= validateXtProperty_xtPropertyRedefinition(xtProperty, diagnostics, context);
		if (result || diagnostics != null) result &= validateXtProperty_xtPropertyDerivation(xtProperty, diagnostics, context);
		return result;
	}

	/**
	 * Validates the xtPropertyAggregation constraint of '<em>Xt Property</em>'.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 */
	public boolean validateXtProperty_xtPropertyAggregation(XtProperty xtProperty, DiagnosticChain diagnostics, Map<Object, Object> context) {
		return xtProperty.xtPropertyAggregation(diagnostics, context);
	}

	/**
	 * Validates the xtPropertyRedefinition constraint of '<em>Xt Property</em>'.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 */
	public boolean validateXtProperty_xtPropertyRedefinition(XtProperty xtProperty, DiagnosticChain diagnostics, Map<Object, Object> context) {
		return xtProperty.xtPropertyRedefinition(diagnostics, context);
	}

	/**
	 * Validates the xtPropertyDerivation constraint of '<em>Xt Property</em>'.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 */
	public boolean validateXtProperty_xtPropertyDerivation(XtProperty xtProperty, DiagnosticChain diagnostics, Map<Object, Object> context) {
		return xtProperty.xtPropertyDerivation(diagnostics, context);
	}

	/**
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 */
	public boolean validateXtComponent(XtComponent xtComponent, DiagnosticChain diagnostics, Map<Object, Object> context) {
		if (!validate_NoCircularContainment(xtComponent, diagnostics, context)) return false;
		boolean result = validate_EveryMultiplicityConforms(xtComponent, diagnostics, context);
		if (result || diagnostics != null) result &= validate_EveryDataValueConforms(xtComponent, diagnostics, context);
		if (result || diagnostics != null) result &= validate_EveryReferenceIsContained(xtComponent, diagnostics, context);
		if (result || diagnostics != null) result &= validate_EveryBidirectionalReferenceIsPaired(xtComponent, diagnostics, context);
		if (result || diagnostics != null) result &= validate_EveryProxyResolves(xtComponent, diagnostics, context);
		if (result || diagnostics != null) result &= validate_UniqueID(xtComponent, diagnostics, context);
		if (result || diagnostics != null) result &= validate_EveryKeyUnique(xtComponent, diagnostics, context);
		if (result || diagnostics != null) result &= validate_EveryMapEntryUnique(xtComponent, diagnostics, context);
		if (result || diagnostics != null) result &= executableModelingProfileValidator.validateXNamedElement_xNamedElementName(xtComponent, diagnostics, context);
		if (result || diagnostics != null) result &= executableModelingProfileValidator.validateXClassifier_xClassifierFeatures(xtComponent, diagnostics, context);
		if (result || diagnostics != null) result &= executableModelingProfileValidator.validateXClassifier_xClassifierNestedClassifiers(xtComponent, diagnostics, context);
		if (result || diagnostics != null) result &= executableModelingProfileValidator.validateXClassifier_xClassifierGenerals(xtComponent, diagnostics, context);
		if (result || diagnostics != null) result &= executableModelingProfileValidator.validateXClassifier_xClassifierConstraints(xtComponent, diagnostics, context);
		if (result || diagnostics != null) result &= executableModelingProfileValidator.validateXEncapsulatedClassifier_xEncapsulatedClassifierPorts(xtComponent, diagnostics, context);
		if (result || diagnostics != null) result &= executableModelingProfileValidator.validateXEncapsulatedClassifier_xEncapsulatedClassifierconnectors(xtComponent, diagnostics, context);
		if (result || diagnostics != null) result &= executableModelingProfileValidator.validateXEncapsulatedClassifier_xEncapsulatedClassifierExternal(xtComponent, diagnostics, context);
		if (result || diagnostics != null) result &= validateXtComponent_xtComponentAttributes(xtComponent, diagnostics, context);
		if (result || diagnostics != null) result &= validateXtComponent_xtComponentBehavioralFeatures(xtComponent, diagnostics, context);
		if (result || diagnostics != null) result &= validateXtComponent_xtComponentOwnedBehaviors(xtComponent, diagnostics, context);
		if (result || diagnostics != null) result &= validateXtComponent_xtComponentNestedClassifiers(xtComponent, diagnostics, context);
		if (result || diagnostics != null) result &= validateXtComponent_xtComponentParts(xtComponent, diagnostics, context);
		if (result || diagnostics != null) result &= validateXtComponent_xtComponentGeneralization(xtComponent, diagnostics, context);
		return result;
	}

	/**
	 * Validates the xtComponentAttributes constraint of '<em>Xt Component</em>'.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 */
	public boolean validateXtComponent_xtComponentAttributes(XtComponent xtComponent, DiagnosticChain diagnostics, Map<Object, Object> context) {
		return xtComponent.xtComponentAttributes(diagnostics, context);
	}

	/**
	 * Validates the xtComponentBehavioralFeatures constraint of '<em>Xt Component</em>'.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 */
	public boolean validateXtComponent_xtComponentBehavioralFeatures(XtComponent xtComponent, DiagnosticChain diagnostics, Map<Object, Object> context) {
		return xtComponent.xtComponentBehavioralFeatures(diagnostics, context);
	}

	/**
	 * Validates the xtComponentOwnedBehaviors constraint of '<em>Xt Component</em>'.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 */
	public boolean validateXtComponent_xtComponentOwnedBehaviors(XtComponent xtComponent, DiagnosticChain diagnostics, Map<Object, Object> context) {
		return xtComponent.xtComponentOwnedBehaviors(diagnostics, context);
	}

	/**
	 * Validates the xtComponentNestedClassifiers constraint of '<em>Xt Component</em>'.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 */
	public boolean validateXtComponent_xtComponentNestedClassifiers(XtComponent xtComponent, DiagnosticChain diagnostics, Map<Object, Object> context) {
		return xtComponent.xtComponentNestedClassifiers(diagnostics, context);
	}

	/**
	 * Validates the xtComponentParts constraint of '<em>Xt Component</em>'.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 */
	public boolean validateXtComponent_xtComponentParts(XtComponent xtComponent, DiagnosticChain diagnostics, Map<Object, Object> context) {
		return xtComponent.xtComponentParts(diagnostics, context);
	}

	/**
	 * Validates the xtComponentGeneralization constraint of '<em>Xt Component</em>'.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 */
	public boolean validateXtComponent_xtComponentGeneralization(XtComponent xtComponent, DiagnosticChain diagnostics, Map<Object, Object> context) {
		return xtComponent.xtComponentGeneralization(diagnostics, context);
	}

	/**
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 */
	public boolean validateXtOperation(XtOperation xtOperation, DiagnosticChain diagnostics, Map<Object, Object> context) {
		if (!validate_NoCircularContainment(xtOperation, diagnostics, context)) return false;
		boolean result = validate_EveryMultiplicityConforms(xtOperation, diagnostics, context);
		if (result || diagnostics != null) result &= validate_EveryDataValueConforms(xtOperation, diagnostics, context);
		if (result || diagnostics != null) result &= validate_EveryReferenceIsContained(xtOperation, diagnostics, context);
		if (result || diagnostics != null) result &= validate_EveryBidirectionalReferenceIsPaired(xtOperation, diagnostics, context);
		if (result || diagnostics != null) result &= validate_EveryProxyResolves(xtOperation, diagnostics, context);
		if (result || diagnostics != null) result &= validate_UniqueID(xtOperation, diagnostics, context);
		if (result || diagnostics != null) result &= validate_EveryKeyUnique(xtOperation, diagnostics, context);
		if (result || diagnostics != null) result &= validate_EveryMapEntryUnique(xtOperation, diagnostics, context);
		if (result || diagnostics != null) result &= executableModelingProfileValidator.validateXNamedElement_xNamedElementName(xtOperation, diagnostics, context);
		if (result || diagnostics != null) result &= executableModelingProfileValidator.validateXFeature_xFeatureClassifier(xtOperation, diagnostics, context);
		if (result || diagnostics != null) result &= executableModelingProfileValidator.validateXOperation_xOperationParameters(xtOperation, diagnostics, context);
		if (result || diagnostics != null) result &= executableModelingProfileValidator.validateXOperation_xOperationOneMethod(xtOperation, diagnostics, context);
		if (result || diagnostics != null) result &= executableModelingProfileValidator.validateXOperation_xOperationImports(xtOperation, diagnostics, context);
		if (result || diagnostics != null) result &= executableModelingProfileValidator.validateXOperation_xOperationOwnedRules(xtOperation, diagnostics, context);
		if (result || diagnostics != null) result &= executableModelingProfileValidator.validateXOperation_xOperationMethods(xtOperation, diagnostics, context);
		if (result || diagnostics != null) result &= executableModelingProfileValidator.validateXOperation_xOperationConstraints(xtOperation, diagnostics, context);
		return result;
	}

	/**
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 */
	public boolean validateXtParameter(XtParameter xtParameter, DiagnosticChain diagnostics, Map<Object, Object> context) {
		if (!validate_NoCircularContainment(xtParameter, diagnostics, context)) return false;
		boolean result = validate_EveryMultiplicityConforms(xtParameter, diagnostics, context);
		if (result || diagnostics != null) result &= validate_EveryDataValueConforms(xtParameter, diagnostics, context);
		if (result || diagnostics != null) result &= validate_EveryReferenceIsContained(xtParameter, diagnostics, context);
		if (result || diagnostics != null) result &= validate_EveryBidirectionalReferenceIsPaired(xtParameter, diagnostics, context);
		if (result || diagnostics != null) result &= validate_EveryProxyResolves(xtParameter, diagnostics, context);
		if (result || diagnostics != null) result &= validate_UniqueID(xtParameter, diagnostics, context);
		if (result || diagnostics != null) result &= validate_EveryKeyUnique(xtParameter, diagnostics, context);
		if (result || diagnostics != null) result &= validate_EveryMapEntryUnique(xtParameter, diagnostics, context);
		if (result || diagnostics != null) result &= executableModelingProfileValidator.validateXTypedElement_xTypedElementType(xtParameter, diagnostics, context);
		return result;
	}

	/**
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 */
	public boolean validateXtReception(XtReception xtReception, DiagnosticChain diagnostics, Map<Object, Object> context) {
		if (!validate_NoCircularContainment(xtReception, diagnostics, context)) return false;
		boolean result = validate_EveryMultiplicityConforms(xtReception, diagnostics, context);
		if (result || diagnostics != null) result &= validate_EveryDataValueConforms(xtReception, diagnostics, context);
		if (result || diagnostics != null) result &= validate_EveryReferenceIsContained(xtReception, diagnostics, context);
		if (result || diagnostics != null) result &= validate_EveryBidirectionalReferenceIsPaired(xtReception, diagnostics, context);
		if (result || diagnostics != null) result &= validate_EveryProxyResolves(xtReception, diagnostics, context);
		if (result || diagnostics != null) result &= validate_UniqueID(xtReception, diagnostics, context);
		if (result || diagnostics != null) result &= validate_EveryKeyUnique(xtReception, diagnostics, context);
		if (result || diagnostics != null) result &= validate_EveryMapEntryUnique(xtReception, diagnostics, context);
		if (result || diagnostics != null) result &= executableModelingProfileValidator.validateXNamedElement_xNamedElementName(xtReception, diagnostics, context);
		if (result || diagnostics != null) result &= executableModelingProfileValidator.validateXFeature_xFeatureClassifier(xtReception, diagnostics, context);
		if (result || diagnostics != null) result &= executableModelingProfileValidator.validateXReception_xReceptionSignal(xtReception, diagnostics, context);
		return result;
	}

	/**
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 */
	public boolean validateXtPart(XtPart xtPart, DiagnosticChain diagnostics, Map<Object, Object> context) {
		if (!validate_NoCircularContainment(xtPart, diagnostics, context)) return false;
		boolean result = validate_EveryMultiplicityConforms(xtPart, diagnostics, context);
		if (result || diagnostics != null) result &= validate_EveryDataValueConforms(xtPart, diagnostics, context);
		if (result || diagnostics != null) result &= validate_EveryReferenceIsContained(xtPart, diagnostics, context);
		if (result || diagnostics != null) result &= validate_EveryBidirectionalReferenceIsPaired(xtPart, diagnostics, context);
		if (result || diagnostics != null) result &= validate_EveryProxyResolves(xtPart, diagnostics, context);
		if (result || diagnostics != null) result &= validate_UniqueID(xtPart, diagnostics, context);
		if (result || diagnostics != null) result &= validate_EveryKeyUnique(xtPart, diagnostics, context);
		if (result || diagnostics != null) result &= validate_EveryMapEntryUnique(xtPart, diagnostics, context);
		if (result || diagnostics != null) result &= executableModelingProfileValidator.validateXNamedElement_xNamedElementName(xtPart, diagnostics, context);
		if (result || diagnostics != null) result &= executableModelingProfileValidator.validateXFeature_xFeatureClassifier(xtPart, diagnostics, context);
		if (result || diagnostics != null) result &= executableModelingProfileValidator.validateXTypedElement_xTypedElementType(xtPart, diagnostics, context);
		if (result || diagnostics != null) result &= executableModelingProfileValidator.validateXPart_xPartClassifier(xtPart, diagnostics, context);
		if (result || diagnostics != null) result &= validateXtPart_xtPartType(xtPart, diagnostics, context);
		if (result || diagnostics != null) result &= validateXtPart_xtPartComposition(xtPart, diagnostics, context);
		if (result || diagnostics != null) result &= validateXtPart_xtPartVisibility(xtPart, diagnostics, context);
		return result;
	}

	/**
	 * Validates the xtPartType constraint of '<em>Xt Part</em>'.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 */
	public boolean validateXtPart_xtPartType(XtPart xtPart, DiagnosticChain diagnostics, Map<Object, Object> context) {
		return xtPart.xtPartType(diagnostics, context);
	}

	/**
	 * Validates the xtPartComposition constraint of '<em>Xt Part</em>'.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 */
	public boolean validateXtPart_xtPartComposition(XtPart xtPart, DiagnosticChain diagnostics, Map<Object, Object> context) {
		return xtPart.xtPartComposition(diagnostics, context);
	}

	/**
	 * Validates the xtPartVisibility constraint of '<em>Xt Part</em>'.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 */
	public boolean validateXtPart_xtPartVisibility(XtPart xtPart, DiagnosticChain diagnostics, Map<Object, Object> context) {
		return xtPart.xtPartVisibility(diagnostics, context);
	}

	/**
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 */
	public boolean validateXtPort(XtPort xtPort, DiagnosticChain diagnostics, Map<Object, Object> context) {
		if (!validate_NoCircularContainment(xtPort, diagnostics, context)) return false;
		boolean result = validate_EveryMultiplicityConforms(xtPort, diagnostics, context);
		if (result || diagnostics != null) result &= validate_EveryDataValueConforms(xtPort, diagnostics, context);
		if (result || diagnostics != null) result &= validate_EveryReferenceIsContained(xtPort, diagnostics, context);
		if (result || diagnostics != null) result &= validate_EveryBidirectionalReferenceIsPaired(xtPort, diagnostics, context);
		if (result || diagnostics != null) result &= validate_EveryProxyResolves(xtPort, diagnostics, context);
		if (result || diagnostics != null) result &= validate_UniqueID(xtPort, diagnostics, context);
		if (result || diagnostics != null) result &= validate_EveryKeyUnique(xtPort, diagnostics, context);
		if (result || diagnostics != null) result &= validate_EveryMapEntryUnique(xtPort, diagnostics, context);
		if (result || diagnostics != null) result &= executableModelingProfileValidator.validateXNamedElement_xNamedElementName(xtPort, diagnostics, context);
		if (result || diagnostics != null) result &= executableModelingProfileValidator.validateXFeature_xFeatureClassifier(xtPort, diagnostics, context);
		if (result || diagnostics != null) result &= executableModelingProfileValidator.validateXPort_xPortClassifier(xtPort, diagnostics, context);
		if (result || diagnostics != null) result &= executableModelingProfileValidator.validateXPort_xPortOrderingUniqueness(xtPort, diagnostics, context);
		if (result || diagnostics != null) result &= executableModelingProfileValidator.validateXPort_xPortType(xtPort, diagnostics, context);
		if (result || diagnostics != null) result &= executableModelingProfileValidator.validateXPort_xPortBehaviorPort(xtPort, diagnostics, context);
		if (result || diagnostics != null) result &= executableModelingProfileValidator.validateXPort_xPortVisibility(xtPort, diagnostics, context);
		if (result || diagnostics != null) result &= validateXtPort_xtPortVisibility(xtPort, diagnostics, context);
		if (result || diagnostics != null) result &= validateXtPort_xtConnectorVisibility(xtPort, diagnostics, context);
		if (result || diagnostics != null) result &= validateXtPort_xtPortBehaviorPort(xtPort, diagnostics, context);
		return result;
	}

	/**
	 * Validates the xtPortVisibility constraint of '<em>Xt Port</em>'.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 */
	public boolean validateXtPort_xtPortVisibility(XtPort xtPort, DiagnosticChain diagnostics, Map<Object, Object> context) {
		return xtPort.xtPortVisibility(diagnostics, context);
	}

	/**
	 * Validates the xtConnectorVisibility constraint of '<em>Xt Port</em>'.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 */
	public boolean validateXtPort_xtConnectorVisibility(XtPort xtPort, DiagnosticChain diagnostics, Map<Object, Object> context) {
		return xtPort.xtConnectorVisibility(diagnostics, context);
	}

	/**
	 * Validates the xtPortBehaviorPort constraint of '<em>Xt Port</em>'.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 */
	public boolean validateXtPort_xtPortBehaviorPort(XtPort xtPort, DiagnosticChain diagnostics, Map<Object, Object> context) {
		return xtPort.xtPortBehaviorPort(diagnostics, context);
	}

	/**
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 */
	public boolean validateXtConnector(XtConnector xtConnector, DiagnosticChain diagnostics, Map<Object, Object> context) {
		if (!validate_NoCircularContainment(xtConnector, diagnostics, context)) return false;
		boolean result = validate_EveryMultiplicityConforms(xtConnector, diagnostics, context);
		if (result || diagnostics != null) result &= validate_EveryDataValueConforms(xtConnector, diagnostics, context);
		if (result || diagnostics != null) result &= validate_EveryReferenceIsContained(xtConnector, diagnostics, context);
		if (result || diagnostics != null) result &= validate_EveryBidirectionalReferenceIsPaired(xtConnector, diagnostics, context);
		if (result || diagnostics != null) result &= validate_EveryProxyResolves(xtConnector, diagnostics, context);
		if (result || diagnostics != null) result &= validate_UniqueID(xtConnector, diagnostics, context);
		if (result || diagnostics != null) result &= validate_EveryKeyUnique(xtConnector, diagnostics, context);
		if (result || diagnostics != null) result &= validate_EveryMapEntryUnique(xtConnector, diagnostics, context);
		if (result || diagnostics != null) result &= executableModelingProfileValidator.validateXNamedElement_xNamedElementName(xtConnector, diagnostics, context);
		if (result || diagnostics != null) result &= executableModelingProfileValidator.validateXFeature_xFeatureClassifier(xtConnector, diagnostics, context);
		if (result || diagnostics != null) result &= executableModelingProfileValidator.validateXConnector_xConnectorClassifier(xtConnector, diagnostics, context);
		if (result || diagnostics != null) result &= executableModelingProfileValidator.validateXConnector_xConnectorEnds(xtConnector, diagnostics, context);
		if (result || diagnostics != null) result &= executableModelingProfileValidator.validateXConnector_xtConnectorType(xtConnector, diagnostics, context);
		if (result || diagnostics != null) result &= validateXtConnector_xtConnectorConnectorEnds(xtConnector, diagnostics, context);
		return result;
	}

	/**
	 * Validates the xtConnectorConnectorEnds constraint of '<em>Xt Connector</em>'.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 */
	public boolean validateXtConnector_xtConnectorConnectorEnds(XtConnector xtConnector, DiagnosticChain diagnostics, Map<Object, Object> context) {
		return xtConnector.xtConnectorConnectorEnds(diagnostics, context);
	}

	/**
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 */
	public boolean validateXtProtocolContainer(XtProtocolContainer xtProtocolContainer, DiagnosticChain diagnostics, Map<Object, Object> context) {
		if (!validate_NoCircularContainment(xtProtocolContainer, diagnostics, context)) return false;
		boolean result = validate_EveryMultiplicityConforms(xtProtocolContainer, diagnostics, context);
		if (result || diagnostics != null) result &= validate_EveryDataValueConforms(xtProtocolContainer, diagnostics, context);
		if (result || diagnostics != null) result &= validate_EveryReferenceIsContained(xtProtocolContainer, diagnostics, context);
		if (result || diagnostics != null) result &= validate_EveryBidirectionalReferenceIsPaired(xtProtocolContainer, diagnostics, context);
		if (result || diagnostics != null) result &= validate_EveryProxyResolves(xtProtocolContainer, diagnostics, context);
		if (result || diagnostics != null) result &= validate_UniqueID(xtProtocolContainer, diagnostics, context);
		if (result || diagnostics != null) result &= validate_EveryKeyUnique(xtProtocolContainer, diagnostics, context);
		if (result || diagnostics != null) result &= validate_EveryMapEntryUnique(xtProtocolContainer, diagnostics, context);
		if (result || diagnostics != null) result &= executableModelingProfileValidator.validateXProtocolContainer_xProtocolContainerProtocol(xtProtocolContainer, diagnostics, context);
		return result;
	}

	/**
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 */
	public boolean validateXtProtocol(XtProtocol xtProtocol, DiagnosticChain diagnostics, Map<Object, Object> context) {
		if (!validate_NoCircularContainment(xtProtocol, diagnostics, context)) return false;
		boolean result = validate_EveryMultiplicityConforms(xtProtocol, diagnostics, context);
		if (result || diagnostics != null) result &= validate_EveryDataValueConforms(xtProtocol, diagnostics, context);
		if (result || diagnostics != null) result &= validate_EveryReferenceIsContained(xtProtocol, diagnostics, context);
		if (result || diagnostics != null) result &= validate_EveryBidirectionalReferenceIsPaired(xtProtocol, diagnostics, context);
		if (result || diagnostics != null) result &= validate_EveryProxyResolves(xtProtocol, diagnostics, context);
		if (result || diagnostics != null) result &= validate_UniqueID(xtProtocol, diagnostics, context);
		if (result || diagnostics != null) result &= validate_EveryKeyUnique(xtProtocol, diagnostics, context);
		if (result || diagnostics != null) result &= validate_EveryMapEntryUnique(xtProtocol, diagnostics, context);
		if (result || diagnostics != null) result &= executableModelingProfileValidator.validateXNamedElement_xNamedElementName(xtProtocol, diagnostics, context);
		if (result || diagnostics != null) result &= executableModelingProfileValidator.validateXClassifier_xClassifierFeatures(xtProtocol, diagnostics, context);
		if (result || diagnostics != null) result &= executableModelingProfileValidator.validateXClassifier_xClassifierNestedClassifiers(xtProtocol, diagnostics, context);
		if (result || diagnostics != null) result &= executableModelingProfileValidator.validateXClassifier_xClassifierGenerals(xtProtocol, diagnostics, context);
		if (result || diagnostics != null) result &= executableModelingProfileValidator.validateXClassifier_xClassifierConstraints(xtProtocol, diagnostics, context);
		if (result || diagnostics != null) result &= executableModelingProfileValidator.validateXProtocol_xProtocolIncomingInterface(xtProtocol, diagnostics, context);
		if (result || diagnostics != null) result &= executableModelingProfileValidator.validateXProtocol_xProtocolProtocolContainer(xtProtocol, diagnostics, context);
		if (result || diagnostics != null) result &= executableModelingProfileValidator.validateXProtocol_xProtocolOutgoingInterface(xtProtocol, diagnostics, context);
		if (result || diagnostics != null) result &= executableModelingProfileValidator.validateXProtocol_xProtocolSymmetricInterface(xtProtocol, diagnostics, context);
		if (result || diagnostics != null) result &= validateXtProtocol_xtProtocolNestedClassifiers(xtProtocol, diagnostics, context);
		if (result || diagnostics != null) result &= validateXtProtocol_xtProtocolBehaviors(xtProtocol, diagnostics, context);
		return result;
	}

	/**
	 * Validates the xtProtocolNestedClassifiers constraint of '<em>Xt Protocol</em>'.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 */
	public boolean validateXtProtocol_xtProtocolNestedClassifiers(XtProtocol xtProtocol, DiagnosticChain diagnostics, Map<Object, Object> context) {
		return xtProtocol.xtProtocolNestedClassifiers(diagnostics, context);
	}

	/**
	 * Validates the xtProtocolBehaviors constraint of '<em>Xt Protocol</em>'.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 */
	public boolean validateXtProtocol_xtProtocolBehaviors(XtProtocol xtProtocol, DiagnosticChain diagnostics, Map<Object, Object> context) {
		return xtProtocol.xtProtocolBehaviors(diagnostics, context);
	}

	/**
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 */
	public boolean validateXtMessageSet(XtMessageSet xtMessageSet, DiagnosticChain diagnostics, Map<Object, Object> context) {
		if (!validate_NoCircularContainment(xtMessageSet, diagnostics, context)) return false;
		boolean result = validate_EveryMultiplicityConforms(xtMessageSet, diagnostics, context);
		if (result || diagnostics != null) result &= validate_EveryDataValueConforms(xtMessageSet, diagnostics, context);
		if (result || diagnostics != null) result &= validate_EveryReferenceIsContained(xtMessageSet, diagnostics, context);
		if (result || diagnostics != null) result &= validate_EveryBidirectionalReferenceIsPaired(xtMessageSet, diagnostics, context);
		if (result || diagnostics != null) result &= validate_EveryProxyResolves(xtMessageSet, diagnostics, context);
		if (result || diagnostics != null) result &= validate_UniqueID(xtMessageSet, diagnostics, context);
		if (result || diagnostics != null) result &= validate_EveryKeyUnique(xtMessageSet, diagnostics, context);
		if (result || diagnostics != null) result &= validate_EveryMapEntryUnique(xtMessageSet, diagnostics, context);
		if (result || diagnostics != null) result &= executableModelingProfileValidator.validateXNamedElement_xNamedElementName(xtMessageSet, diagnostics, context);
		if (result || diagnostics != null) result &= executableModelingProfileValidator.validateXClassifier_xClassifierFeatures(xtMessageSet, diagnostics, context);
		if (result || diagnostics != null) result &= executableModelingProfileValidator.validateXClassifier_xClassifierNestedClassifiers(xtMessageSet, diagnostics, context);
		if (result || diagnostics != null) result &= executableModelingProfileValidator.validateXClassifier_xClassifierGenerals(xtMessageSet, diagnostics, context);
		if (result || diagnostics != null) result &= executableModelingProfileValidator.validateXClassifier_xClassifierConstraints(xtMessageSet, diagnostics, context);
		if (result || diagnostics != null) result &= executableModelingProfileValidator.validateXMessageSet_xMessageSetIncoming(xtMessageSet, diagnostics, context);
		if (result || diagnostics != null) result &= executableModelingProfileValidator.validateXMessageSet_xMessageSetOutgoing(xtMessageSet, diagnostics, context);
		if (result || diagnostics != null) result &= executableModelingProfileValidator.validateXMessageSet_xMessageSetSymmetric(xtMessageSet, diagnostics, context);
		if (result || diagnostics != null) result &= validateXtMessageSet_xtMessageSetNestedClassifiers(xtMessageSet, diagnostics, context);
		if (result || diagnostics != null) result &= validateXtMessageSet_xtMessageSetAttributes(xtMessageSet, diagnostics, context);
		return result;
	}

	/**
	 * Validates the xtMessageSetNestedClassifiers constraint of '<em>Xt Message Set</em>'.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 */
	public boolean validateXtMessageSet_xtMessageSetNestedClassifiers(XtMessageSet xtMessageSet, DiagnosticChain diagnostics, Map<Object, Object> context) {
		return xtMessageSet.xtMessageSetNestedClassifiers(diagnostics, context);
	}

	/**
	 * Validates the xtMessageSetAttributes constraint of '<em>Xt Message Set</em>'.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 */
	public boolean validateXtMessageSet_xtMessageSetAttributes(XtMessageSet xtMessageSet, DiagnosticChain diagnostics, Map<Object, Object> context) {
		return xtMessageSet.xtMessageSetAttributes(diagnostics, context);
	}

	/**
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 */
	public boolean validateXtSignal(XtSignal xtSignal, DiagnosticChain diagnostics, Map<Object, Object> context) {
		if (!validate_NoCircularContainment(xtSignal, diagnostics, context)) return false;
		boolean result = validate_EveryMultiplicityConforms(xtSignal, diagnostics, context);
		if (result || diagnostics != null) result &= validate_EveryDataValueConforms(xtSignal, diagnostics, context);
		if (result || diagnostics != null) result &= validate_EveryReferenceIsContained(xtSignal, diagnostics, context);
		if (result || diagnostics != null) result &= validate_EveryBidirectionalReferenceIsPaired(xtSignal, diagnostics, context);
		if (result || diagnostics != null) result &= validate_EveryProxyResolves(xtSignal, diagnostics, context);
		if (result || diagnostics != null) result &= validate_UniqueID(xtSignal, diagnostics, context);
		if (result || diagnostics != null) result &= validate_EveryKeyUnique(xtSignal, diagnostics, context);
		if (result || diagnostics != null) result &= validate_EveryMapEntryUnique(xtSignal, diagnostics, context);
		if (result || diagnostics != null) result &= executableModelingProfileValidator.validateXNamedElement_xNamedElementName(xtSignal, diagnostics, context);
		if (result || diagnostics != null) result &= executableModelingProfileValidator.validateXClassifier_xClassifierFeatures(xtSignal, diagnostics, context);
		if (result || diagnostics != null) result &= executableModelingProfileValidator.validateXClassifier_xClassifierNestedClassifiers(xtSignal, diagnostics, context);
		if (result || diagnostics != null) result &= executableModelingProfileValidator.validateXClassifier_xClassifierGenerals(xtSignal, diagnostics, context);
		if (result || diagnostics != null) result &= executableModelingProfileValidator.validateXClassifier_xClassifierConstraints(xtSignal, diagnostics, context);
		if (result || diagnostics != null) result &= executableModelingProfileValidator.validateXSignal_xSignalVisibility(xtSignal, diagnostics, context);
		return result;
	}

	/**
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 */
	public boolean validateXtDataType(XtDataType xtDataType, DiagnosticChain diagnostics, Map<Object, Object> context) {
		if (!validate_NoCircularContainment(xtDataType, diagnostics, context)) return false;
		boolean result = validate_EveryMultiplicityConforms(xtDataType, diagnostics, context);
		if (result || diagnostics != null) result &= validate_EveryDataValueConforms(xtDataType, diagnostics, context);
		if (result || diagnostics != null) result &= validate_EveryReferenceIsContained(xtDataType, diagnostics, context);
		if (result || diagnostics != null) result &= validate_EveryBidirectionalReferenceIsPaired(xtDataType, diagnostics, context);
		if (result || diagnostics != null) result &= validate_EveryProxyResolves(xtDataType, diagnostics, context);
		if (result || diagnostics != null) result &= validate_UniqueID(xtDataType, diagnostics, context);
		if (result || diagnostics != null) result &= validate_EveryKeyUnique(xtDataType, diagnostics, context);
		if (result || diagnostics != null) result &= validate_EveryMapEntryUnique(xtDataType, diagnostics, context);
		if (result || diagnostics != null) result &= executableModelingProfileValidator.validateXNamedElement_xNamedElementName(xtDataType, diagnostics, context);
		if (result || diagnostics != null) result &= executableModelingProfileValidator.validateXClassifier_xClassifierFeatures(xtDataType, diagnostics, context);
		if (result || diagnostics != null) result &= executableModelingProfileValidator.validateXClassifier_xClassifierNestedClassifiers(xtDataType, diagnostics, context);
		if (result || diagnostics != null) result &= executableModelingProfileValidator.validateXClassifier_xClassifierGenerals(xtDataType, diagnostics, context);
		if (result || diagnostics != null) result &= executableModelingProfileValidator.validateXClassifier_xClassifierConstraints(xtDataType, diagnostics, context);
		if (result || diagnostics != null) result &= executableModelingProfileValidator.validateXDataType_xDataTypeOperations(xtDataType, diagnostics, context);
		return result;
	}

	/**
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 */
	public boolean validateXtEnumeration(XtEnumeration xtEnumeration, DiagnosticChain diagnostics, Map<Object, Object> context) {
		if (!validate_NoCircularContainment(xtEnumeration, diagnostics, context)) return false;
		boolean result = validate_EveryMultiplicityConforms(xtEnumeration, diagnostics, context);
		if (result || diagnostics != null) result &= validate_EveryDataValueConforms(xtEnumeration, diagnostics, context);
		if (result || diagnostics != null) result &= validate_EveryReferenceIsContained(xtEnumeration, diagnostics, context);
		if (result || diagnostics != null) result &= validate_EveryBidirectionalReferenceIsPaired(xtEnumeration, diagnostics, context);
		if (result || diagnostics != null) result &= validate_EveryProxyResolves(xtEnumeration, diagnostics, context);
		if (result || diagnostics != null) result &= validate_UniqueID(xtEnumeration, diagnostics, context);
		if (result || diagnostics != null) result &= validate_EveryKeyUnique(xtEnumeration, diagnostics, context);
		if (result || diagnostics != null) result &= validate_EveryMapEntryUnique(xtEnumeration, diagnostics, context);
		if (result || diagnostics != null) result &= executableModelingProfileValidator.validateXNamedElement_xNamedElementName(xtEnumeration, diagnostics, context);
		if (result || diagnostics != null) result &= executableModelingProfileValidator.validateXClassifier_xClassifierFeatures(xtEnumeration, diagnostics, context);
		if (result || diagnostics != null) result &= executableModelingProfileValidator.validateXClassifier_xClassifierNestedClassifiers(xtEnumeration, diagnostics, context);
		if (result || diagnostics != null) result &= executableModelingProfileValidator.validateXClassifier_xClassifierGenerals(xtEnumeration, diagnostics, context);
		if (result || diagnostics != null) result &= executableModelingProfileValidator.validateXClassifier_xClassifierConstraints(xtEnumeration, diagnostics, context);
		if (result || diagnostics != null) result &= executableModelingProfileValidator.validateXDataType_xDataTypeOperations(xtEnumeration, diagnostics, context);
		if (result || diagnostics != null) result &= executableModelingProfileValidator.validateXEnumeration_xEnumerationAttributes(xtEnumeration, diagnostics, context);
		return result;
	}

	/**
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 */
	public boolean validateXtAssociation(XtAssociation xtAssociation, DiagnosticChain diagnostics, Map<Object, Object> context) {
		if (!validate_NoCircularContainment(xtAssociation, diagnostics, context)) return false;
		boolean result = validate_EveryMultiplicityConforms(xtAssociation, diagnostics, context);
		if (result || diagnostics != null) result &= validate_EveryDataValueConforms(xtAssociation, diagnostics, context);
		if (result || diagnostics != null) result &= validate_EveryReferenceIsContained(xtAssociation, diagnostics, context);
		if (result || diagnostics != null) result &= validate_EveryBidirectionalReferenceIsPaired(xtAssociation, diagnostics, context);
		if (result || diagnostics != null) result &= validate_EveryProxyResolves(xtAssociation, diagnostics, context);
		if (result || diagnostics != null) result &= validate_UniqueID(xtAssociation, diagnostics, context);
		if (result || diagnostics != null) result &= validate_EveryKeyUnique(xtAssociation, diagnostics, context);
		if (result || diagnostics != null) result &= validate_EveryMapEntryUnique(xtAssociation, diagnostics, context);
		if (result || diagnostics != null) result &= executableModelingProfileValidator.validateXNamedElement_xNamedElementName(xtAssociation, diagnostics, context);
		if (result || diagnostics != null) result &= executableModelingProfileValidator.validateXClassifier_xClassifierFeatures(xtAssociation, diagnostics, context);
		if (result || diagnostics != null) result &= executableModelingProfileValidator.validateXClassifier_xClassifierNestedClassifiers(xtAssociation, diagnostics, context);
		if (result || diagnostics != null) result &= executableModelingProfileValidator.validateXClassifier_xClassifierGenerals(xtAssociation, diagnostics, context);
		if (result || diagnostics != null) result &= executableModelingProfileValidator.validateXClassifier_xClassifierConstraints(xtAssociation, diagnostics, context);
		if (result || diagnostics != null) result &= executableModelingProfileValidator.validateXAssociation_xAssociationIsBinary(xtAssociation, diagnostics, context);
		if (result || diagnostics != null) result &= validateXtAssociation_xtAssociationEndOwnership(xtAssociation, diagnostics, context);
		if (result || diagnostics != null) result &= validateXtAssociation_xtAssociationEnds(xtAssociation, diagnostics, context);
		if (result || diagnostics != null) result &= validateXtAssociation_xtAssociationEndType(xtAssociation, diagnostics, context);
		if (result || diagnostics != null) result &= validateXtAssociation_xtAssociationGeneralization(xtAssociation, diagnostics, context);
		return result;
	}

	/**
	 * Validates the xtAssociationEndOwnership constraint of '<em>Xt Association</em>'.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 */
	public boolean validateXtAssociation_xtAssociationEndOwnership(XtAssociation xtAssociation, DiagnosticChain diagnostics, Map<Object, Object> context) {
		return xtAssociation.xtAssociationEndOwnership(diagnostics, context);
	}

	/**
	 * Validates the xtAssociationEnds constraint of '<em>Xt Association</em>'.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 */
	public boolean validateXtAssociation_xtAssociationEnds(XtAssociation xtAssociation, DiagnosticChain diagnostics, Map<Object, Object> context) {
		return xtAssociation.xtAssociationEnds(diagnostics, context);
	}

	/**
	 * Validates the xtAssociationEndType constraint of '<em>Xt Association</em>'.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 */
	public boolean validateXtAssociation_xtAssociationEndType(XtAssociation xtAssociation, DiagnosticChain diagnostics, Map<Object, Object> context) {
		return xtAssociation.xtAssociationEndType(diagnostics, context);
	}

	/**
	 * Validates the xtAssociationGeneralization constraint of '<em>Xt Association</em>'.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 */
	public boolean validateXtAssociation_xtAssociationGeneralization(XtAssociation xtAssociation, DiagnosticChain diagnostics, Map<Object, Object> context) {
		return xtAssociation.xtAssociationGeneralization(diagnostics, context);
	}

	/**
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 */
	public boolean validateXtAssociationClass(XtAssociationClass xtAssociationClass, DiagnosticChain diagnostics, Map<Object, Object> context) {
		if (!validate_NoCircularContainment(xtAssociationClass, diagnostics, context)) return false;
		boolean result = validate_EveryMultiplicityConforms(xtAssociationClass, diagnostics, context);
		if (result || diagnostics != null) result &= validate_EveryDataValueConforms(xtAssociationClass, diagnostics, context);
		if (result || diagnostics != null) result &= validate_EveryReferenceIsContained(xtAssociationClass, diagnostics, context);
		if (result || diagnostics != null) result &= validate_EveryBidirectionalReferenceIsPaired(xtAssociationClass, diagnostics, context);
		if (result || diagnostics != null) result &= validate_EveryProxyResolves(xtAssociationClass, diagnostics, context);
		if (result || diagnostics != null) result &= validate_UniqueID(xtAssociationClass, diagnostics, context);
		if (result || diagnostics != null) result &= validate_EveryKeyUnique(xtAssociationClass, diagnostics, context);
		if (result || diagnostics != null) result &= validate_EveryMapEntryUnique(xtAssociationClass, diagnostics, context);
		if (result || diagnostics != null) result &= executableModelingProfileValidator.validateXNamedElement_xNamedElementName(xtAssociationClass, diagnostics, context);
		if (result || diagnostics != null) result &= executableModelingProfileValidator.validateXClassifier_xClassifierFeatures(xtAssociationClass, diagnostics, context);
		if (result || diagnostics != null) result &= executableModelingProfileValidator.validateXClassifier_xClassifierNestedClassifiers(xtAssociationClass, diagnostics, context);
		if (result || diagnostics != null) result &= executableModelingProfileValidator.validateXClassifier_xClassifierGenerals(xtAssociationClass, diagnostics, context);
		if (result || diagnostics != null) result &= executableModelingProfileValidator.validateXClassifier_xClassifierConstraints(xtAssociationClass, diagnostics, context);
		if (result || diagnostics != null) result &= executableModelingProfileValidator.validateXAssociation_xAssociationIsBinary(xtAssociationClass, diagnostics, context);
		if (result || diagnostics != null) result &= validateXtAssociation_xtAssociationEndOwnership(xtAssociationClass, diagnostics, context);
		if (result || diagnostics != null) result &= validateXtAssociation_xtAssociationEnds(xtAssociationClass, diagnostics, context);
		if (result || diagnostics != null) result &= validateXtAssociation_xtAssociationEndType(xtAssociationClass, diagnostics, context);
		if (result || diagnostics != null) result &= validateXtAssociation_xtAssociationGeneralization(xtAssociationClass, diagnostics, context);
		return result;
	}

	/**
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 */
	public boolean validateXtTrigger(XtTrigger xtTrigger, DiagnosticChain diagnostics, Map<Object, Object> context) {
		if (!validate_NoCircularContainment(xtTrigger, diagnostics, context)) return false;
		boolean result = validate_EveryMultiplicityConforms(xtTrigger, diagnostics, context);
		if (result || diagnostics != null) result &= validate_EveryDataValueConforms(xtTrigger, diagnostics, context);
		if (result || diagnostics != null) result &= validate_EveryReferenceIsContained(xtTrigger, diagnostics, context);
		if (result || diagnostics != null) result &= validate_EveryBidirectionalReferenceIsPaired(xtTrigger, diagnostics, context);
		if (result || diagnostics != null) result &= validate_EveryProxyResolves(xtTrigger, diagnostics, context);
		if (result || diagnostics != null) result &= validate_UniqueID(xtTrigger, diagnostics, context);
		if (result || diagnostics != null) result &= validate_EveryKeyUnique(xtTrigger, diagnostics, context);
		if (result || diagnostics != null) result &= validate_EveryMapEntryUnique(xtTrigger, diagnostics, context);
		if (result || diagnostics != null) result &= executableModelingProfileValidator.validateXTrigger_xTriggerSignalReception(xtTrigger, diagnostics, context);
		if (result || diagnostics != null) result &= executableModelingProfileValidator.validateXTrigger_xTriggerEvents(xtTrigger, diagnostics, context);
		if (result || diagnostics != null) result &= executableModelingProfileValidator.validateXTrigger_xTriggerCalledOperation(xtTrigger, diagnostics, context);
		if (result || diagnostics != null) result &= validateXtTrigger_xtTriggerEvent(xtTrigger, diagnostics, context);
		return result;
	}

	/**
	 * Validates the xtTriggerEvent constraint of '<em>Xt Trigger</em>'.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 */
	public boolean validateXtTrigger_xtTriggerEvent(XtTrigger xtTrigger, DiagnosticChain diagnostics, Map<Object, Object> context) {
		return xtTrigger.xtTriggerEvent(diagnostics, context);
	}

	/**
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 */
	public boolean validateXtStateMachine(XtStateMachine xtStateMachine, DiagnosticChain diagnostics, Map<Object, Object> context) {
		if (!validate_NoCircularContainment(xtStateMachine, diagnostics, context)) return false;
		boolean result = validate_EveryMultiplicityConforms(xtStateMachine, diagnostics, context);
		if (result || diagnostics != null) result &= validate_EveryDataValueConforms(xtStateMachine, diagnostics, context);
		if (result || diagnostics != null) result &= validate_EveryReferenceIsContained(xtStateMachine, diagnostics, context);
		if (result || diagnostics != null) result &= validate_EveryBidirectionalReferenceIsPaired(xtStateMachine, diagnostics, context);
		if (result || diagnostics != null) result &= validate_EveryProxyResolves(xtStateMachine, diagnostics, context);
		if (result || diagnostics != null) result &= validate_UniqueID(xtStateMachine, diagnostics, context);
		if (result || diagnostics != null) result &= validate_EveryKeyUnique(xtStateMachine, diagnostics, context);
		if (result || diagnostics != null) result &= validate_EveryMapEntryUnique(xtStateMachine, diagnostics, context);
		if (result || diagnostics != null) result &= executableModelingProfileValidator.validateXNamedElement_xNamedElementName(xtStateMachine, diagnostics, context);
		if (result || diagnostics != null) result &= executableModelingProfileValidator.validateXBehavior_xBehaviorNoParameterSets(xtStateMachine, diagnostics, context);
		if (result || diagnostics != null) result &= executableModelingProfileValidator.validateXStateMachine_xStateMachineOneRegion(xtStateMachine, diagnostics, context);
		if (result || diagnostics != null) result &= executableModelingProfileValidator.validateXStateMachine_xStateMachineInitialState(xtStateMachine, diagnostics, context);
		if (result || diagnostics != null) result &= executableModelingProfileValidator.validateXStateMachine_xStateMachineContext(xtStateMachine, diagnostics, context);
		if (result || diagnostics != null) result &= executableModelingProfileValidator.validateXStateMachine_xStateMachineNoParameters(xtStateMachine, diagnostics, context);
		if (result || diagnostics != null) result &= executableModelingProfileValidator.validateXStateMachine_xStateMachineRegions(xtStateMachine, diagnostics, context);
		return result;
	}

	/**
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 */
	public boolean validateXtRegion(XtRegion xtRegion, DiagnosticChain diagnostics, Map<Object, Object> context) {
		if (!validate_NoCircularContainment(xtRegion, diagnostics, context)) return false;
		boolean result = validate_EveryMultiplicityConforms(xtRegion, diagnostics, context);
		if (result || diagnostics != null) result &= validate_EveryDataValueConforms(xtRegion, diagnostics, context);
		if (result || diagnostics != null) result &= validate_EveryReferenceIsContained(xtRegion, diagnostics, context);
		if (result || diagnostics != null) result &= validate_EveryBidirectionalReferenceIsPaired(xtRegion, diagnostics, context);
		if (result || diagnostics != null) result &= validate_EveryProxyResolves(xtRegion, diagnostics, context);
		if (result || diagnostics != null) result &= validate_UniqueID(xtRegion, diagnostics, context);
		if (result || diagnostics != null) result &= validate_EveryKeyUnique(xtRegion, diagnostics, context);
		if (result || diagnostics != null) result &= validate_EveryMapEntryUnique(xtRegion, diagnostics, context);
		if (result || diagnostics != null) result &= executableModelingProfileValidator.validateXRegion_xRegionSubvertexes(xtRegion, diagnostics, context);
		if (result || diagnostics != null) result &= executableModelingProfileValidator.validateXRegion_xRegionTransitions(xtRegion, diagnostics, context);
		return result;
	}

	/**
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 */
	public boolean validateXtPseudoState(XtPseudoState xtPseudoState, DiagnosticChain diagnostics, Map<Object, Object> context) {
		if (!validate_NoCircularContainment(xtPseudoState, diagnostics, context)) return false;
		boolean result = validate_EveryMultiplicityConforms(xtPseudoState, diagnostics, context);
		if (result || diagnostics != null) result &= validate_EveryDataValueConforms(xtPseudoState, diagnostics, context);
		if (result || diagnostics != null) result &= validate_EveryReferenceIsContained(xtPseudoState, diagnostics, context);
		if (result || diagnostics != null) result &= validate_EveryBidirectionalReferenceIsPaired(xtPseudoState, diagnostics, context);
		if (result || diagnostics != null) result &= validate_EveryProxyResolves(xtPseudoState, diagnostics, context);
		if (result || diagnostics != null) result &= validate_UniqueID(xtPseudoState, diagnostics, context);
		if (result || diagnostics != null) result &= validate_EveryKeyUnique(xtPseudoState, diagnostics, context);
		if (result || diagnostics != null) result &= validate_EveryMapEntryUnique(xtPseudoState, diagnostics, context);
		if (result || diagnostics != null) result &= executableModelingProfileValidator.validateXPseudostate_xPsuedostateKind(xtPseudoState, diagnostics, context);
		if (result || diagnostics != null) result &= validateXtPseudoState_xtPseudostateKind(xtPseudoState, diagnostics, context);
		return result;
	}

	/**
	 * Validates the xtPseudostateKind constraint of '<em>Xt Pseudo State</em>'.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 */
	public boolean validateXtPseudoState_xtPseudostateKind(XtPseudoState xtPseudoState, DiagnosticChain diagnostics, Map<Object, Object> context) {
		return xtPseudoState.xtPseudostateKind(diagnostics, context);
	}

	/**
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 */
	public boolean validateXtTransition(XtTransition xtTransition, DiagnosticChain diagnostics, Map<Object, Object> context) {
		if (!validate_NoCircularContainment(xtTransition, diagnostics, context)) return false;
		boolean result = validate_EveryMultiplicityConforms(xtTransition, diagnostics, context);
		if (result || diagnostics != null) result &= validate_EveryDataValueConforms(xtTransition, diagnostics, context);
		if (result || diagnostics != null) result &= validate_EveryReferenceIsContained(xtTransition, diagnostics, context);
		if (result || diagnostics != null) result &= validate_EveryBidirectionalReferenceIsPaired(xtTransition, diagnostics, context);
		if (result || diagnostics != null) result &= validate_EveryProxyResolves(xtTransition, diagnostics, context);
		if (result || diagnostics != null) result &= validate_UniqueID(xtTransition, diagnostics, context);
		if (result || diagnostics != null) result &= validate_EveryKeyUnique(xtTransition, diagnostics, context);
		if (result || diagnostics != null) result &= validate_EveryMapEntryUnique(xtTransition, diagnostics, context);
		if (result || diagnostics != null) result &= executableModelingProfileValidator.validateXTransition_xTransitionTrigger(xtTransition, diagnostics, context);
		if (result || diagnostics != null) result &= executableModelingProfileValidator.validateXTransition_xTransitionGuard(xtTransition, diagnostics, context);
		if (result || diagnostics != null) result &= executableModelingProfileValidator.validateXTransition_xTransitionEffect(xtTransition, diagnostics, context);
		if (result || diagnostics != null) result &= validateXtTransition_xtTransitionNoGuard(xtTransition, diagnostics, context);
		return result;
	}

	/**
	 * Validates the xtTransitionNoGuard constraint of '<em>Xt Transition</em>'.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 */
	public boolean validateXtTransition_xtTransitionNoGuard(XtTransition xtTransition, DiagnosticChain diagnostics, Map<Object, Object> context) {
		return xtTransition.xtTransitionNoGuard(diagnostics, context);
	}

	/**
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 */
	public boolean validateXtState(XtState xtState, DiagnosticChain diagnostics, Map<Object, Object> context) {
		if (!validate_NoCircularContainment(xtState, diagnostics, context)) return false;
		boolean result = validate_EveryMultiplicityConforms(xtState, diagnostics, context);
		if (result || diagnostics != null) result &= validate_EveryDataValueConforms(xtState, diagnostics, context);
		if (result || diagnostics != null) result &= validate_EveryReferenceIsContained(xtState, diagnostics, context);
		if (result || diagnostics != null) result &= validate_EveryBidirectionalReferenceIsPaired(xtState, diagnostics, context);
		if (result || diagnostics != null) result &= validate_EveryProxyResolves(xtState, diagnostics, context);
		if (result || diagnostics != null) result &= validate_UniqueID(xtState, diagnostics, context);
		if (result || diagnostics != null) result &= validate_EveryKeyUnique(xtState, diagnostics, context);
		if (result || diagnostics != null) result &= validate_EveryMapEntryUnique(xtState, diagnostics, context);
		if (result || diagnostics != null) result &= executableModelingProfileValidator.validateXState_xStateBehaviors(xtState, diagnostics, context);
		if (result || diagnostics != null) result &= executableModelingProfileValidator.validateXState_xStateNoDoActivity(xtState, diagnostics, context);
		if (result || diagnostics != null) result &= executableModelingProfileValidator.validateXState_xStateOneRegion(xtState, diagnostics, context);
		if (result || diagnostics != null) result &= executableModelingProfileValidator.validateXState_xStateNoSubmachine(xtState, diagnostics, context);
		if (result || diagnostics != null) result &= executableModelingProfileValidator.validateXState_xStateRegions(xtState, diagnostics, context);
		if (result || diagnostics != null) result &= validateXtState_xStateNotComposite(xtState, diagnostics, context);
		return result;
	}

	/**
	 * Validates the xStateNotComposite constraint of '<em>Xt State</em>'.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 */
	public boolean validateXtState_xStateNotComposite(XtState xtState, DiagnosticChain diagnostics, Map<Object, Object> context) {
		return xtState.xStateNotComposite(diagnostics, context);
	}

	/**
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 */
	public boolean validateXtActivity(XtActivity xtActivity, DiagnosticChain diagnostics, Map<Object, Object> context) {
		if (!validate_NoCircularContainment(xtActivity, diagnostics, context)) return false;
		boolean result = validate_EveryMultiplicityConforms(xtActivity, diagnostics, context);
		if (result || diagnostics != null) result &= validate_EveryDataValueConforms(xtActivity, diagnostics, context);
		if (result || diagnostics != null) result &= validate_EveryReferenceIsContained(xtActivity, diagnostics, context);
		if (result || diagnostics != null) result &= validate_EveryBidirectionalReferenceIsPaired(xtActivity, diagnostics, context);
		if (result || diagnostics != null) result &= validate_EveryProxyResolves(xtActivity, diagnostics, context);
		if (result || diagnostics != null) result &= validate_UniqueID(xtActivity, diagnostics, context);
		if (result || diagnostics != null) result &= validate_EveryKeyUnique(xtActivity, diagnostics, context);
		if (result || diagnostics != null) result &= validate_EveryMapEntryUnique(xtActivity, diagnostics, context);
		if (result || diagnostics != null) result &= executableModelingProfileValidator.validateXNamedElement_xNamedElementName(xtActivity, diagnostics, context);
		if (result || diagnostics != null) result &= executableModelingProfileValidator.validateXBehavior_xBehaviorNoParameterSets(xtActivity, diagnostics, context);
		if (result || diagnostics != null) result &= executableModelingProfileValidator.validateXActivity_xActivityParameters(xtActivity, diagnostics, context);
		if (result || diagnostics != null) result &= executableModelingProfileValidator.validateXActivity_xActivityTextualRepresentation(xtActivity, diagnostics, context);
		if (result || diagnostics != null) result &= validateXtActivity_xtActivityTextualRepresentation(xtActivity, diagnostics, context);
		return result;
	}

	/**
	 * Validates the xtActivityTextualRepresentation constraint of '<em>Xt Activity</em>'.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 */
	public boolean validateXtActivity_xtActivityTextualRepresentation(XtActivity xtActivity, DiagnosticChain diagnostics, Map<Object, Object> context) {
		return xtActivity.xtActivityTextualRepresentation(diagnostics, context);
	}

	/**
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 */
	public boolean validateXtConstraint(XtConstraint xtConstraint, DiagnosticChain diagnostics, Map<Object, Object> context) {
		if (!validate_NoCircularContainment(xtConstraint, diagnostics, context)) return false;
		boolean result = validate_EveryMultiplicityConforms(xtConstraint, diagnostics, context);
		if (result || diagnostics != null) result &= validate_EveryDataValueConforms(xtConstraint, diagnostics, context);
		if (result || diagnostics != null) result &= validate_EveryReferenceIsContained(xtConstraint, diagnostics, context);
		if (result || diagnostics != null) result &= validate_EveryBidirectionalReferenceIsPaired(xtConstraint, diagnostics, context);
		if (result || diagnostics != null) result &= validate_EveryProxyResolves(xtConstraint, diagnostics, context);
		if (result || diagnostics != null) result &= validate_UniqueID(xtConstraint, diagnostics, context);
		if (result || diagnostics != null) result &= validate_EveryKeyUnique(xtConstraint, diagnostics, context);
		if (result || diagnostics != null) result &= validate_EveryMapEntryUnique(xtConstraint, diagnostics, context);
		if (result || diagnostics != null) result &= executableModelingProfileValidator.validateXNamedElement_xNamedElementName(xtConstraint, diagnostics, context);
		if (result || diagnostics != null) result &= executableModelingProfileValidator.validateXConstraint_xConstraintSpecification(xtConstraint, diagnostics, context);
		if (result || diagnostics != null) result &= executableModelingProfileValidator.validateXConstraint_xConstraintBehavior(xtConstraint, diagnostics, context);
		return result;
	}

	/**
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 */
	public boolean validateXtClass(XtClass xtClass, DiagnosticChain diagnostics, Map<Object, Object> context) {
		if (!validate_NoCircularContainment(xtClass, diagnostics, context)) return false;
		boolean result = validate_EveryMultiplicityConforms(xtClass, diagnostics, context);
		if (result || diagnostics != null) result &= validate_EveryDataValueConforms(xtClass, diagnostics, context);
		if (result || diagnostics != null) result &= validate_EveryReferenceIsContained(xtClass, diagnostics, context);
		if (result || diagnostics != null) result &= validate_EveryBidirectionalReferenceIsPaired(xtClass, diagnostics, context);
		if (result || diagnostics != null) result &= validate_EveryProxyResolves(xtClass, diagnostics, context);
		if (result || diagnostics != null) result &= validate_UniqueID(xtClass, diagnostics, context);
		if (result || diagnostics != null) result &= validate_EveryKeyUnique(xtClass, diagnostics, context);
		if (result || diagnostics != null) result &= validate_EveryMapEntryUnique(xtClass, diagnostics, context);
		if (result || diagnostics != null) result &= executableModelingProfileValidator.validateXNamedElement_xNamedElementName(xtClass, diagnostics, context);
		if (result || diagnostics != null) result &= executableModelingProfileValidator.validateXClassifier_xClassifierFeatures(xtClass, diagnostics, context);
		if (result || diagnostics != null) result &= executableModelingProfileValidator.validateXClassifier_xClassifierNestedClassifiers(xtClass, diagnostics, context);
		if (result || diagnostics != null) result &= executableModelingProfileValidator.validateXClassifier_xClassifierGenerals(xtClass, diagnostics, context);
		if (result || diagnostics != null) result &= executableModelingProfileValidator.validateXClassifier_xClassifierConstraints(xtClass, diagnostics, context);
		if (result || diagnostics != null) result &= executableModelingProfileValidator.validateXClass_xClassMetaclass(xtClass, diagnostics, context);
		if (result || diagnostics != null) result &= executableModelingProfileValidator.validateXClass_xClassNestedClassifiers(xtClass, diagnostics, context);
		if (result || diagnostics != null) result &= executableModelingProfileValidator.validateXClass_xClassExternal(xtClass, diagnostics, context);
		if (result || diagnostics != null) result &= validateXtClass_xtClassConstructors(xtClass, diagnostics, context);
		if (result || diagnostics != null) result &= validateXtClass_xtClassClassifierBehavior(xtClass, diagnostics, context);
		if (result || diagnostics != null) result &= validateXtClass_xtClassVisibility(xtClass, diagnostics, context);
		if (result || diagnostics != null) result &= validateXtClass_xtClassGeneralizationSets(xtClass, diagnostics, context);
		return result;
	}

	/**
	 * Validates the xtClassConstructors constraint of '<em>Xt Class</em>'.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 */
	public boolean validateXtClass_xtClassConstructors(XtClass xtClass, DiagnosticChain diagnostics, Map<Object, Object> context) {
		return xtClass.xtClassConstructors(diagnostics, context);
	}

	/**
	 * Validates the xtClassClassifierBehavior constraint of '<em>Xt Class</em>'.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 */
	public boolean validateXtClass_xtClassClassifierBehavior(XtClass xtClass, DiagnosticChain diagnostics, Map<Object, Object> context) {
		return xtClass.xtClassClassifierBehavior(diagnostics, context);
	}

	/**
	 * Validates the xtClassVisibility constraint of '<em>Xt Class</em>'.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 */
	public boolean validateXtClass_xtClassVisibility(XtClass xtClass, DiagnosticChain diagnostics, Map<Object, Object> context) {
		return xtClass.xtClassVisibility(diagnostics, context);
	}

	/**
	 * Validates the xtClassGeneralizationSets constraint of '<em>Xt Class</em>'.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 */
	public boolean validateXtClass_xtClassGeneralizationSets(XtClass xtClass, DiagnosticChain diagnostics, Map<Object, Object> context) {
		return xtClass.xtClassGeneralizationSets(diagnostics, context);
	}

	/**
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 */
	public boolean validateXtConstrainedType(XtConstrainedType xtConstrainedType, DiagnosticChain diagnostics, Map<Object, Object> context) {
		if (!validate_NoCircularContainment(xtConstrainedType, diagnostics, context)) return false;
		boolean result = validate_EveryMultiplicityConforms(xtConstrainedType, diagnostics, context);
		if (result || diagnostics != null) result &= validate_EveryDataValueConforms(xtConstrainedType, diagnostics, context);
		if (result || diagnostics != null) result &= validate_EveryReferenceIsContained(xtConstrainedType, diagnostics, context);
		if (result || diagnostics != null) result &= validate_EveryBidirectionalReferenceIsPaired(xtConstrainedType, diagnostics, context);
		if (result || diagnostics != null) result &= validate_EveryProxyResolves(xtConstrainedType, diagnostics, context);
		if (result || diagnostics != null) result &= validate_UniqueID(xtConstrainedType, diagnostics, context);
		if (result || diagnostics != null) result &= validate_EveryKeyUnique(xtConstrainedType, diagnostics, context);
		if (result || diagnostics != null) result &= validate_EveryMapEntryUnique(xtConstrainedType, diagnostics, context);
		if (result || diagnostics != null) result &= executableModelingProfileValidator.validateXNamedElement_xNamedElementName(xtConstrainedType, diagnostics, context);
		if (result || diagnostics != null) result &= executableModelingProfileValidator.validateXClassifier_xClassifierFeatures(xtConstrainedType, diagnostics, context);
		if (result || diagnostics != null) result &= executableModelingProfileValidator.validateXClassifier_xClassifierNestedClassifiers(xtConstrainedType, diagnostics, context);
		if (result || diagnostics != null) result &= executableModelingProfileValidator.validateXClassifier_xClassifierGenerals(xtConstrainedType, diagnostics, context);
		if (result || diagnostics != null) result &= executableModelingProfileValidator.validateXClassifier_xClassifierConstraints(xtConstrainedType, diagnostics, context);
		if (result || diagnostics != null) result &= executableModelingProfileValidator.validateXConstrainedType_xConstrainedTypePrimitiveType(xtConstrainedType, diagnostics, context);
		if (result || diagnostics != null) result &= executableModelingProfileValidator.validateXConstrainedType_xConstrainedTypeBounds(xtConstrainedType, diagnostics, context);
		return result;
	}

	/**
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 */
	public boolean validateXtOpaqueBehavior(XtOpaqueBehavior xtOpaqueBehavior, DiagnosticChain diagnostics, Map<Object, Object> context) {
		if (!validate_NoCircularContainment(xtOpaqueBehavior, diagnostics, context)) return false;
		boolean result = validate_EveryMultiplicityConforms(xtOpaqueBehavior, diagnostics, context);
		if (result || diagnostics != null) result &= validate_EveryDataValueConforms(xtOpaqueBehavior, diagnostics, context);
		if (result || diagnostics != null) result &= validate_EveryReferenceIsContained(xtOpaqueBehavior, diagnostics, context);
		if (result || diagnostics != null) result &= validate_EveryBidirectionalReferenceIsPaired(xtOpaqueBehavior, diagnostics, context);
		if (result || diagnostics != null) result &= validate_EveryProxyResolves(xtOpaqueBehavior, diagnostics, context);
		if (result || diagnostics != null) result &= validate_UniqueID(xtOpaqueBehavior, diagnostics, context);
		if (result || diagnostics != null) result &= validate_EveryKeyUnique(xtOpaqueBehavior, diagnostics, context);
		if (result || diagnostics != null) result &= validate_EveryMapEntryUnique(xtOpaqueBehavior, diagnostics, context);
		if (result || diagnostics != null) result &= executableModelingProfileValidator.validateXNamedElement_xNamedElementName(xtOpaqueBehavior, diagnostics, context);
		if (result || diagnostics != null) result &= executableModelingProfileValidator.validateXBehavior_xBehaviorNoParameterSets(xtOpaqueBehavior, diagnostics, context);
		if (result || diagnostics != null) result &= executableModelingProfileValidator.validateXOpaqueBehavior_xOpaqueBehaviorExternal(xtOpaqueBehavior, diagnostics, context);
		if (result || diagnostics != null) result &= validateXtOpaqueBehavior_xtOpaqueBehaviorLanguage(xtOpaqueBehavior, diagnostics, context);
		return result;
	}

	/**
	 * Validates the xtOpaqueBehaviorLanguage constraint of '<em>Xt Opaque Behavior</em>'.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 */
	public boolean validateXtOpaqueBehavior_xtOpaqueBehaviorLanguage(XtOpaqueBehavior xtOpaqueBehavior, DiagnosticChain diagnostics, Map<Object, Object> context) {
		return xtOpaqueBehavior.xtOpaqueBehaviorLanguage(diagnostics, context);
	}

	/**
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 */
	public boolean validateXtGeneralization(XtGeneralization xtGeneralization, DiagnosticChain diagnostics, Map<Object, Object> context) {
		if (!validate_NoCircularContainment(xtGeneralization, diagnostics, context)) return false;
		boolean result = validate_EveryMultiplicityConforms(xtGeneralization, diagnostics, context);
		if (result || diagnostics != null) result &= validate_EveryDataValueConforms(xtGeneralization, diagnostics, context);
		if (result || diagnostics != null) result &= validate_EveryReferenceIsContained(xtGeneralization, diagnostics, context);
		if (result || diagnostics != null) result &= validate_EveryBidirectionalReferenceIsPaired(xtGeneralization, diagnostics, context);
		if (result || diagnostics != null) result &= validate_EveryProxyResolves(xtGeneralization, diagnostics, context);
		if (result || diagnostics != null) result &= validate_UniqueID(xtGeneralization, diagnostics, context);
		if (result || diagnostics != null) result &= validate_EveryKeyUnique(xtGeneralization, diagnostics, context);
		if (result || diagnostics != null) result &= validate_EveryMapEntryUnique(xtGeneralization, diagnostics, context);
		if (result || diagnostics != null) result &= executableModelingProfileValidator.validateXGeneralization_xGeneralizationClassifiers(xtGeneralization, diagnostics, context);
		if (result || diagnostics != null) result &= executableModelingProfileValidator.validateXGeneralization_xGeneralizationGeneralizationSet(xtGeneralization, diagnostics, context);
		if (result || diagnostics != null) result &= validateXtGeneralization_xtGeneralizationGeneralizationSet(xtGeneralization, diagnostics, context);
		return result;
	}

	/**
	 * Validates the xtGeneralizationGeneralizationSet constraint of '<em>Xt Generalization</em>'.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 */
	public boolean validateXtGeneralization_xtGeneralizationGeneralizationSet(XtGeneralization xtGeneralization, DiagnosticChain diagnostics, Map<Object, Object> context) {
		return xtGeneralization.xtGeneralizationGeneralizationSet(diagnostics, context);
	}

	/**
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 */
	public boolean validateXtGeneralizationSet(XtGeneralizationSet xtGeneralizationSet, DiagnosticChain diagnostics, Map<Object, Object> context) {
		if (!validate_NoCircularContainment(xtGeneralizationSet, diagnostics, context)) return false;
		boolean result = validate_EveryMultiplicityConforms(xtGeneralizationSet, diagnostics, context);
		if (result || diagnostics != null) result &= validate_EveryDataValueConforms(xtGeneralizationSet, diagnostics, context);
		if (result || diagnostics != null) result &= validate_EveryReferenceIsContained(xtGeneralizationSet, diagnostics, context);
		if (result || diagnostics != null) result &= validate_EveryBidirectionalReferenceIsPaired(xtGeneralizationSet, diagnostics, context);
		if (result || diagnostics != null) result &= validate_EveryProxyResolves(xtGeneralizationSet, diagnostics, context);
		if (result || diagnostics != null) result &= validate_UniqueID(xtGeneralizationSet, diagnostics, context);
		if (result || diagnostics != null) result &= validate_EveryKeyUnique(xtGeneralizationSet, diagnostics, context);
		if (result || diagnostics != null) result &= validate_EveryMapEntryUnique(xtGeneralizationSet, diagnostics, context);
		if (result || diagnostics != null) result &= validateXtGeneralizationSet_xtGeneralizationSet(xtGeneralizationSet, diagnostics, context);
		return result;
	}

	/**
	 * Validates the xtGeneralizationSet constraint of '<em>Xt Generalization Set</em>'.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 */
	public boolean validateXtGeneralizationSet_xtGeneralizationSet(XtGeneralizationSet xtGeneralizationSet, DiagnosticChain diagnostics, Map<Object, Object> context) {
		return xtGeneralizationSet.xtGeneralizationSet(diagnostics, context);
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

} //xtUMLProfileValidator
