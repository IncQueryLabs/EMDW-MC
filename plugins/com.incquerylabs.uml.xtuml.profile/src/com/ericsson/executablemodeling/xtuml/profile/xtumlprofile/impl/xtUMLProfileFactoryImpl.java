/**
 */
package com.ericsson.executablemodeling.xtuml.profile.xtumlprofile.impl;

import com.ericsson.executablemodeling.xtuml.profile.xtumlprofile.*;

import org.eclipse.emf.ecore.EClass;
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
public class xtUMLProfileFactoryImpl extends EFactoryImpl implements xtUMLProfileFactory {
	/**
	 * Creates the default factory implementation.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 */
	public static xtUMLProfileFactory init() {
		try {
			xtUMLProfileFactory thextUMLProfileFactory = (xtUMLProfileFactory)EPackage.Registry.INSTANCE.getEFactory(xtUMLProfilePackage.eNS_URI);
			if (thextUMLProfileFactory != null) {
				return thextUMLProfileFactory;
			}
		}
		catch (Exception exception) {
			EcorePlugin.INSTANCE.log(exception);
		}
		return new xtUMLProfileFactoryImpl();
	}

	/**
	 * Creates an instance of the factory.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 */
	public xtUMLProfileFactoryImpl() {
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
			case xtUMLProfilePackage.XT_CONNECTOR_END: return createXtConnectorEnd();
			case xtUMLProfilePackage.XT_PROPERTY: return createXtProperty();
			case xtUMLProfilePackage.XT_COMPONENT: return createXtComponent();
			case xtUMLProfilePackage.XT_OPERATION: return createXtOperation();
			case xtUMLProfilePackage.XT_PARAMETER: return createXtParameter();
			case xtUMLProfilePackage.XT_RECEPTION: return createXtReception();
			case xtUMLProfilePackage.XT_PART: return createXtPart();
			case xtUMLProfilePackage.XT_PORT: return createXtPort();
			case xtUMLProfilePackage.XT_CONNECTOR: return createXtConnector();
			case xtUMLProfilePackage.XT_PROTOCOL_CONTAINER: return createXtProtocolContainer();
			case xtUMLProfilePackage.XT_PROTOCOL: return createXtProtocol();
			case xtUMLProfilePackage.XT_MESSAGE_SET: return createXtMessageSet();
			case xtUMLProfilePackage.XT_SIGNAL: return createXtSignal();
			case xtUMLProfilePackage.XT_DATA_TYPE: return createXtDataType();
			case xtUMLProfilePackage.XT_ENUMERATION: return createXtEnumeration();
			case xtUMLProfilePackage.XT_ASSOCIATION: return createXtAssociation();
			case xtUMLProfilePackage.XT_ASSOCIATION_CLASS: return createXtAssociationClass();
			case xtUMLProfilePackage.XT_TRIGGER: return createXtTrigger();
			case xtUMLProfilePackage.XT_STATE_MACHINE: return createXtStateMachine();
			case xtUMLProfilePackage.XT_REGION: return createXtRegion();
			case xtUMLProfilePackage.XT_PSEUDO_STATE: return createXtPseudoState();
			case xtUMLProfilePackage.XT_TRANSITION: return createXtTransition();
			case xtUMLProfilePackage.XT_STATE: return createXtState();
			case xtUMLProfilePackage.XT_ACTIVITY: return createXtActivity();
			case xtUMLProfilePackage.XT_CONSTRAINT: return createXtConstraint();
			case xtUMLProfilePackage.XT_CLASS: return createXtClass();
			case xtUMLProfilePackage.XT_CONSTRAINED_TYPE: return createXtConstrainedType();
			case xtUMLProfilePackage.XT_OPAQUE_BEHAVIOR: return createXtOpaqueBehavior();
			case xtUMLProfilePackage.XT_GENERALIZATION: return createXtGeneralization();
			case xtUMLProfilePackage.XT_GENERALIZATION_SET: return createXtGeneralizationSet();
			default:
				throw new IllegalArgumentException("The class '" + eClass.getName() + "' is not a valid classifier");
		}
	}

	/**
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 */
	public XtConnectorEnd createXtConnectorEnd() {
		XtConnectorEndImpl xtConnectorEnd = new XtConnectorEndImpl();
		return xtConnectorEnd;
	}

	/**
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 */
	public XtProperty createXtProperty() {
		XtPropertyImpl xtProperty = new XtPropertyImpl();
		return xtProperty;
	}

	/**
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 */
	public XtComponent createXtComponent() {
		XtComponentImpl xtComponent = new XtComponentImpl();
		return xtComponent;
	}

	/**
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 */
	public XtOperation createXtOperation() {
		XtOperationImpl xtOperation = new XtOperationImpl();
		return xtOperation;
	}

	/**
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 */
	public XtParameter createXtParameter() {
		XtParameterImpl xtParameter = new XtParameterImpl();
		return xtParameter;
	}

	/**
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 */
	public XtReception createXtReception() {
		XtReceptionImpl xtReception = new XtReceptionImpl();
		return xtReception;
	}

	/**
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 */
	public XtPart createXtPart() {
		XtPartImpl xtPart = new XtPartImpl();
		return xtPart;
	}

	/**
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 */
	public XtPort createXtPort() {
		XtPortImpl xtPort = new XtPortImpl();
		return xtPort;
	}

	/**
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 */
	public XtConnector createXtConnector() {
		XtConnectorImpl xtConnector = new XtConnectorImpl();
		return xtConnector;
	}

	/**
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 */
	public XtProtocolContainer createXtProtocolContainer() {
		XtProtocolContainerImpl xtProtocolContainer = new XtProtocolContainerImpl();
		return xtProtocolContainer;
	}

	/**
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 */
	public XtProtocol createXtProtocol() {
		XtProtocolImpl xtProtocol = new XtProtocolImpl();
		return xtProtocol;
	}

	/**
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 */
	public XtMessageSet createXtMessageSet() {
		XtMessageSetImpl xtMessageSet = new XtMessageSetImpl();
		return xtMessageSet;
	}

	/**
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 */
	public XtSignal createXtSignal() {
		XtSignalImpl xtSignal = new XtSignalImpl();
		return xtSignal;
	}

	/**
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 */
	public XtDataType createXtDataType() {
		XtDataTypeImpl xtDataType = new XtDataTypeImpl();
		return xtDataType;
	}

	/**
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 */
	public XtEnumeration createXtEnumeration() {
		XtEnumerationImpl xtEnumeration = new XtEnumerationImpl();
		return xtEnumeration;
	}

	/**
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 */
	public XtAssociation createXtAssociation() {
		XtAssociationImpl xtAssociation = new XtAssociationImpl();
		return xtAssociation;
	}

	/**
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 */
	public XtAssociationClass createXtAssociationClass() {
		XtAssociationClassImpl xtAssociationClass = new XtAssociationClassImpl();
		return xtAssociationClass;
	}

	/**
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 */
	public XtTrigger createXtTrigger() {
		XtTriggerImpl xtTrigger = new XtTriggerImpl();
		return xtTrigger;
	}

	/**
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 */
	public XtStateMachine createXtStateMachine() {
		XtStateMachineImpl xtStateMachine = new XtStateMachineImpl();
		return xtStateMachine;
	}

	/**
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 */
	public XtRegion createXtRegion() {
		XtRegionImpl xtRegion = new XtRegionImpl();
		return xtRegion;
	}

	/**
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 */
	public XtPseudoState createXtPseudoState() {
		XtPseudoStateImpl xtPseudoState = new XtPseudoStateImpl();
		return xtPseudoState;
	}

	/**
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 */
	public XtTransition createXtTransition() {
		XtTransitionImpl xtTransition = new XtTransitionImpl();
		return xtTransition;
	}

	/**
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 */
	public XtState createXtState() {
		XtStateImpl xtState = new XtStateImpl();
		return xtState;
	}

	/**
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 */
	public XtActivity createXtActivity() {
		XtActivityImpl xtActivity = new XtActivityImpl();
		return xtActivity;
	}

	/**
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 */
	public XtConstraint createXtConstraint() {
		XtConstraintImpl xtConstraint = new XtConstraintImpl();
		return xtConstraint;
	}

	/**
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 */
	public XtClass createXtClass() {
		XtClassImpl xtClass = new XtClassImpl();
		return xtClass;
	}

	/**
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 */
	public XtConstrainedType createXtConstrainedType() {
		XtConstrainedTypeImpl xtConstrainedType = new XtConstrainedTypeImpl();
		return xtConstrainedType;
	}

	/**
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 */
	public XtOpaqueBehavior createXtOpaqueBehavior() {
		XtOpaqueBehaviorImpl xtOpaqueBehavior = new XtOpaqueBehaviorImpl();
		return xtOpaqueBehavior;
	}

	/**
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 */
	public XtGeneralization createXtGeneralization() {
		XtGeneralizationImpl xtGeneralization = new XtGeneralizationImpl();
		return xtGeneralization;
	}

	/**
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 */
	public XtGeneralizationSet createXtGeneralizationSet() {
		XtGeneralizationSetImpl xtGeneralizationSet = new XtGeneralizationSetImpl();
		return xtGeneralizationSet;
	}

	/**
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 */
	public xtUMLProfilePackage getxtUMLProfilePackage() {
		return (xtUMLProfilePackage)getEPackage();
	}

	/**
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @deprecated
	 * @generated
	 */
	@Deprecated
	public static xtUMLProfilePackage getPackage() {
		return xtUMLProfilePackage.eINSTANCE;
	}

} //xtUMLProfileFactoryImpl
