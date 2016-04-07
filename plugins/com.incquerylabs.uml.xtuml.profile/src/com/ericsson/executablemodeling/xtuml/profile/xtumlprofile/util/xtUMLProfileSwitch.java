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
package com.ericsson.executablemodeling.xtuml.profile.xtumlprofile.util;

import com.ericsson.executablemodeling.xtuml.profile.executablemodelingprofile.XActionBehavior;
import com.ericsson.executablemodeling.xtuml.profile.executablemodelingprofile.XActivity;
import com.ericsson.executablemodeling.xtuml.profile.executablemodelingprofile.XAssociation;
import com.ericsson.executablemodeling.xtuml.profile.executablemodelingprofile.XAssociationClass;
import com.ericsson.executablemodeling.xtuml.profile.executablemodelingprofile.XBehavior;
import com.ericsson.executablemodeling.xtuml.profile.executablemodelingprofile.XClass;
import com.ericsson.executablemodeling.xtuml.profile.executablemodelingprofile.XClassifier;
import com.ericsson.executablemodeling.xtuml.profile.executablemodelingprofile.XConnector;
import com.ericsson.executablemodeling.xtuml.profile.executablemodelingprofile.XConnectorEnd;
import com.ericsson.executablemodeling.xtuml.profile.executablemodelingprofile.XConstrainedType;
import com.ericsson.executablemodeling.xtuml.profile.executablemodelingprofile.XConstraint;
import com.ericsson.executablemodeling.xtuml.profile.executablemodelingprofile.XDataType;
import com.ericsson.executablemodeling.xtuml.profile.executablemodelingprofile.XEncapsulatedClassifier;
import com.ericsson.executablemodeling.xtuml.profile.executablemodelingprofile.XEnumeration;
import com.ericsson.executablemodeling.xtuml.profile.executablemodelingprofile.XFeature;
import com.ericsson.executablemodeling.xtuml.profile.executablemodelingprofile.XGeneralization;
import com.ericsson.executablemodeling.xtuml.profile.executablemodelingprofile.XGeneralizationSet;
import com.ericsson.executablemodeling.xtuml.profile.executablemodelingprofile.XMessageSet;
import com.ericsson.executablemodeling.xtuml.profile.executablemodelingprofile.XMultiplicityElement;
import com.ericsson.executablemodeling.xtuml.profile.executablemodelingprofile.XNamedElement;
import com.ericsson.executablemodeling.xtuml.profile.executablemodelingprofile.XNamespace;
import com.ericsson.executablemodeling.xtuml.profile.executablemodelingprofile.XOpaqueBehavior;
import com.ericsson.executablemodeling.xtuml.profile.executablemodelingprofile.XOperation;
import com.ericsson.executablemodeling.xtuml.profile.executablemodelingprofile.XParameter;
import com.ericsson.executablemodeling.xtuml.profile.executablemodelingprofile.XPart;
import com.ericsson.executablemodeling.xtuml.profile.executablemodelingprofile.XPort;
import com.ericsson.executablemodeling.xtuml.profile.executablemodelingprofile.XProperty;
import com.ericsson.executablemodeling.xtuml.profile.executablemodelingprofile.XProtocol;
import com.ericsson.executablemodeling.xtuml.profile.executablemodelingprofile.XProtocolContainer;
import com.ericsson.executablemodeling.xtuml.profile.executablemodelingprofile.XPseudostate;
import com.ericsson.executablemodeling.xtuml.profile.executablemodelingprofile.XReception;
import com.ericsson.executablemodeling.xtuml.profile.executablemodelingprofile.XRegion;
import com.ericsson.executablemodeling.xtuml.profile.executablemodelingprofile.XSignal;
import com.ericsson.executablemodeling.xtuml.profile.executablemodelingprofile.XState;
import com.ericsson.executablemodeling.xtuml.profile.executablemodelingprofile.XStateMachine;
import com.ericsson.executablemodeling.xtuml.profile.executablemodelingprofile.XTransition;
import com.ericsson.executablemodeling.xtuml.profile.executablemodelingprofile.XTrigger;
import com.ericsson.executablemodeling.xtuml.profile.executablemodelingprofile.XTypedElement;
import com.ericsson.executablemodeling.xtuml.profile.executablemodelingprofile.XVertex;

import com.ericsson.executablemodeling.xtuml.profile.xtumlprofile.*;

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
 * @see com.ericsson.executablemodeling.xtuml.profile.xtumlprofile.xtUMLProfilePackage
 * @generated
 */
public class xtUMLProfileSwitch<T> extends Switch<T> {
	/**
	 * The cached model package
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 */
	protected static xtUMLProfilePackage modelPackage;

	/**
	 * Creates an instance of the switch.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 */
	public xtUMLProfileSwitch() {
		if (modelPackage == null) {
			modelPackage = xtUMLProfilePackage.eINSTANCE;
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
			case xtUMLProfilePackage.XT_CONNECTOR_END: {
				XtConnectorEnd xtConnectorEnd = (XtConnectorEnd)theEObject;
				T result = caseXtConnectorEnd(xtConnectorEnd);
				if (result == null) result = caseXConnectorEnd(xtConnectorEnd);
				if (result == null) result = defaultCase(theEObject);
				return result;
			}
			case xtUMLProfilePackage.XT_PROPERTY: {
				XtProperty xtProperty = (XtProperty)theEObject;
				T result = caseXtProperty(xtProperty);
				if (result == null) result = caseXProperty(xtProperty);
				if (result == null) result = caseXMultiplicityElement(xtProperty);
				if (result == null) result = caseXFeature(xtProperty);
				if (result == null) result = caseXTypedElement(xtProperty);
				if (result == null) result = caseXNamedElement(xtProperty);
				if (result == null) result = defaultCase(theEObject);
				return result;
			}
			case xtUMLProfilePackage.XT_COMPONENT: {
				XtComponent xtComponent = (XtComponent)theEObject;
				T result = caseXtComponent(xtComponent);
				if (result == null) result = caseXEncapsulatedClassifier(xtComponent);
				if (result == null) result = caseXClassifier(xtComponent);
				if (result == null) result = caseXNamespace(xtComponent);
				if (result == null) result = caseXNamedElement(xtComponent);
				if (result == null) result = defaultCase(theEObject);
				return result;
			}
			case xtUMLProfilePackage.XT_OPERATION: {
				XtOperation xtOperation = (XtOperation)theEObject;
				T result = caseXtOperation(xtOperation);
				if (result == null) result = caseXOperation(xtOperation);
				if (result == null) result = caseXFeature(xtOperation);
				if (result == null) result = caseXNamespace(xtOperation);
				if (result == null) result = caseXNamedElement(xtOperation);
				if (result == null) result = defaultCase(theEObject);
				return result;
			}
			case xtUMLProfilePackage.XT_PARAMETER: {
				XtParameter xtParameter = (XtParameter)theEObject;
				T result = caseXtParameter(xtParameter);
				if (result == null) result = caseXParameter(xtParameter);
				if (result == null) result = caseXTypedElement(xtParameter);
				if (result == null) result = defaultCase(theEObject);
				return result;
			}
			case xtUMLProfilePackage.XT_RECEPTION: {
				XtReception xtReception = (XtReception)theEObject;
				T result = caseXtReception(xtReception);
				if (result == null) result = caseXReception(xtReception);
				if (result == null) result = caseXFeature(xtReception);
				if (result == null) result = caseXNamedElement(xtReception);
				if (result == null) result = defaultCase(theEObject);
				return result;
			}
			case xtUMLProfilePackage.XT_PART: {
				XtPart xtPart = (XtPart)theEObject;
				T result = caseXtPart(xtPart);
				if (result == null) result = caseXPart(xtPart);
				if (result == null) result = caseXFeature(xtPart);
				if (result == null) result = caseXTypedElement(xtPart);
				if (result == null) result = caseXNamedElement(xtPart);
				if (result == null) result = defaultCase(theEObject);
				return result;
			}
			case xtUMLProfilePackage.XT_PORT: {
				XtPort xtPort = (XtPort)theEObject;
				T result = caseXtPort(xtPort);
				if (result == null) result = caseXPort(xtPort);
				if (result == null) result = caseXFeature(xtPort);
				if (result == null) result = caseXNamedElement(xtPort);
				if (result == null) result = defaultCase(theEObject);
				return result;
			}
			case xtUMLProfilePackage.XT_CONNECTOR: {
				XtConnector xtConnector = (XtConnector)theEObject;
				T result = caseXtConnector(xtConnector);
				if (result == null) result = caseXConnector(xtConnector);
				if (result == null) result = caseXFeature(xtConnector);
				if (result == null) result = caseXNamedElement(xtConnector);
				if (result == null) result = defaultCase(theEObject);
				return result;
			}
			case xtUMLProfilePackage.XT_PROTOCOL_CONTAINER: {
				XtProtocolContainer xtProtocolContainer = (XtProtocolContainer)theEObject;
				T result = caseXtProtocolContainer(xtProtocolContainer);
				if (result == null) result = caseXProtocolContainer(xtProtocolContainer);
				if (result == null) result = defaultCase(theEObject);
				return result;
			}
			case xtUMLProfilePackage.XT_PROTOCOL: {
				XtProtocol xtProtocol = (XtProtocol)theEObject;
				T result = caseXtProtocol(xtProtocol);
				if (result == null) result = caseXProtocol(xtProtocol);
				if (result == null) result = caseXClassifier(xtProtocol);
				if (result == null) result = caseXNamespace(xtProtocol);
				if (result == null) result = caseXNamedElement(xtProtocol);
				if (result == null) result = defaultCase(theEObject);
				return result;
			}
			case xtUMLProfilePackage.XT_MESSAGE_SET: {
				XtMessageSet xtMessageSet = (XtMessageSet)theEObject;
				T result = caseXtMessageSet(xtMessageSet);
				if (result == null) result = caseXMessageSet(xtMessageSet);
				if (result == null) result = caseXClassifier(xtMessageSet);
				if (result == null) result = caseXNamespace(xtMessageSet);
				if (result == null) result = caseXNamedElement(xtMessageSet);
				if (result == null) result = defaultCase(theEObject);
				return result;
			}
			case xtUMLProfilePackage.XT_SIGNAL: {
				XtSignal xtSignal = (XtSignal)theEObject;
				T result = caseXtSignal(xtSignal);
				if (result == null) result = caseXSignal(xtSignal);
				if (result == null) result = caseXClassifier(xtSignal);
				if (result == null) result = caseXNamespace(xtSignal);
				if (result == null) result = caseXNamedElement(xtSignal);
				if (result == null) result = defaultCase(theEObject);
				return result;
			}
			case xtUMLProfilePackage.XT_DATA_TYPE: {
				XtDataType xtDataType = (XtDataType)theEObject;
				T result = caseXtDataType(xtDataType);
				if (result == null) result = caseXDataType(xtDataType);
				if (result == null) result = caseXClassifier(xtDataType);
				if (result == null) result = caseXNamespace(xtDataType);
				if (result == null) result = caseXNamedElement(xtDataType);
				if (result == null) result = defaultCase(theEObject);
				return result;
			}
			case xtUMLProfilePackage.XT_ENUMERATION: {
				XtEnumeration xtEnumeration = (XtEnumeration)theEObject;
				T result = caseXtEnumeration(xtEnumeration);
				if (result == null) result = caseXEnumeration(xtEnumeration);
				if (result == null) result = caseXDataType(xtEnumeration);
				if (result == null) result = caseXClassifier(xtEnumeration);
				if (result == null) result = caseXNamespace(xtEnumeration);
				if (result == null) result = caseXNamedElement(xtEnumeration);
				if (result == null) result = defaultCase(theEObject);
				return result;
			}
			case xtUMLProfilePackage.XT_ASSOCIATION: {
				XtAssociation xtAssociation = (XtAssociation)theEObject;
				T result = caseXtAssociation(xtAssociation);
				if (result == null) result = caseXClassifier(xtAssociation);
				if (result == null) result = caseXAssociation(xtAssociation);
				if (result == null) result = caseXNamespace(xtAssociation);
				if (result == null) result = caseXNamedElement(xtAssociation);
				if (result == null) result = defaultCase(theEObject);
				return result;
			}
			case xtUMLProfilePackage.XT_ASSOCIATION_CLASS: {
				XtAssociationClass xtAssociationClass = (XtAssociationClass)theEObject;
				T result = caseXtAssociationClass(xtAssociationClass);
				if (result == null) result = caseXAssociationClass(xtAssociationClass);
				if (result == null) result = caseXtAssociation(xtAssociationClass);
				if (result == null) result = caseXClassifier(xtAssociationClass);
				if (result == null) result = caseXAssociation(xtAssociationClass);
				if (result == null) result = caseXNamespace(xtAssociationClass);
				if (result == null) result = caseXNamedElement(xtAssociationClass);
				if (result == null) result = defaultCase(theEObject);
				return result;
			}
			case xtUMLProfilePackage.XT_TRIGGER: {
				XtTrigger xtTrigger = (XtTrigger)theEObject;
				T result = caseXtTrigger(xtTrigger);
				if (result == null) result = caseXTrigger(xtTrigger);
				if (result == null) result = defaultCase(theEObject);
				return result;
			}
			case xtUMLProfilePackage.XT_STATE_MACHINE: {
				XtStateMachine xtStateMachine = (XtStateMachine)theEObject;
				T result = caseXtStateMachine(xtStateMachine);
				if (result == null) result = caseXStateMachine(xtStateMachine);
				if (result == null) result = caseXBehavior(xtStateMachine);
				if (result == null) result = caseXNamespace(xtStateMachine);
				if (result == null) result = caseXNamedElement(xtStateMachine);
				if (result == null) result = defaultCase(theEObject);
				return result;
			}
			case xtUMLProfilePackage.XT_REGION: {
				XtRegion xtRegion = (XtRegion)theEObject;
				T result = caseXtRegion(xtRegion);
				if (result == null) result = caseXRegion(xtRegion);
				if (result == null) result = defaultCase(theEObject);
				return result;
			}
			case xtUMLProfilePackage.XT_PSEUDO_STATE: {
				XtPseudoState xtPseudoState = (XtPseudoState)theEObject;
				T result = caseXtPseudoState(xtPseudoState);
				if (result == null) result = caseXPseudostate(xtPseudoState);
				if (result == null) result = caseXVertex(xtPseudoState);
				if (result == null) result = defaultCase(theEObject);
				return result;
			}
			case xtUMLProfilePackage.XT_TRANSITION: {
				XtTransition xtTransition = (XtTransition)theEObject;
				T result = caseXtTransition(xtTransition);
				if (result == null) result = caseXTransition(xtTransition);
				if (result == null) result = defaultCase(theEObject);
				return result;
			}
			case xtUMLProfilePackage.XT_STATE: {
				XtState xtState = (XtState)theEObject;
				T result = caseXtState(xtState);
				if (result == null) result = caseXState(xtState);
				if (result == null) result = caseXVertex(xtState);
				if (result == null) result = defaultCase(theEObject);
				return result;
			}
			case xtUMLProfilePackage.XT_ACTIVITY: {
				XtActivity xtActivity = (XtActivity)theEObject;
				T result = caseXtActivity(xtActivity);
				if (result == null) result = caseXActivity(xtActivity);
				if (result == null) result = caseXActionBehavior(xtActivity);
				if (result == null) result = caseXBehavior(xtActivity);
				if (result == null) result = caseXNamespace(xtActivity);
				if (result == null) result = caseXNamedElement(xtActivity);
				if (result == null) result = defaultCase(theEObject);
				return result;
			}
			case xtUMLProfilePackage.XT_CONSTRAINT: {
				XtConstraint xtConstraint = (XtConstraint)theEObject;
				T result = caseXtConstraint(xtConstraint);
				if (result == null) result = caseXConstraint(xtConstraint);
				if (result == null) result = caseXNamedElement(xtConstraint);
				if (result == null) result = defaultCase(theEObject);
				return result;
			}
			case xtUMLProfilePackage.XT_CLASS: {
				XtClass xtClass = (XtClass)theEObject;
				T result = caseXtClass(xtClass);
				if (result == null) result = caseXClass(xtClass);
				if (result == null) result = caseXClassifier(xtClass);
				if (result == null) result = caseXNamespace(xtClass);
				if (result == null) result = caseXNamedElement(xtClass);
				if (result == null) result = defaultCase(theEObject);
				return result;
			}
			case xtUMLProfilePackage.XT_CONSTRAINED_TYPE: {
				XtConstrainedType xtConstrainedType = (XtConstrainedType)theEObject;
				T result = caseXtConstrainedType(xtConstrainedType);
				if (result == null) result = caseXConstrainedType(xtConstrainedType);
				if (result == null) result = caseXClassifier(xtConstrainedType);
				if (result == null) result = caseXNamespace(xtConstrainedType);
				if (result == null) result = caseXNamedElement(xtConstrainedType);
				if (result == null) result = defaultCase(theEObject);
				return result;
			}
			case xtUMLProfilePackage.XT_OPAQUE_BEHAVIOR: {
				XtOpaqueBehavior xtOpaqueBehavior = (XtOpaqueBehavior)theEObject;
				T result = caseXtOpaqueBehavior(xtOpaqueBehavior);
				if (result == null) result = caseXOpaqueBehavior(xtOpaqueBehavior);
				if (result == null) result = caseXActionBehavior(xtOpaqueBehavior);
				if (result == null) result = caseXBehavior(xtOpaqueBehavior);
				if (result == null) result = caseXNamespace(xtOpaqueBehavior);
				if (result == null) result = caseXNamedElement(xtOpaqueBehavior);
				if (result == null) result = defaultCase(theEObject);
				return result;
			}
			case xtUMLProfilePackage.XT_GENERALIZATION: {
				XtGeneralization xtGeneralization = (XtGeneralization)theEObject;
				T result = caseXtGeneralization(xtGeneralization);
				if (result == null) result = caseXGeneralization(xtGeneralization);
				if (result == null) result = defaultCase(theEObject);
				return result;
			}
			case xtUMLProfilePackage.XT_GENERALIZATION_SET: {
				XtGeneralizationSet xtGeneralizationSet = (XtGeneralizationSet)theEObject;
				T result = caseXtGeneralizationSet(xtGeneralizationSet);
				if (result == null) result = caseXGeneralizationSet(xtGeneralizationSet);
				if (result == null) result = defaultCase(theEObject);
				return result;
			}
			default: return defaultCase(theEObject);
		}
	}

	/**
	 * Returns the result of interpreting the object as an instance of '<em>Xt Connector End</em>'.
	 * <!-- begin-user-doc -->
	 * This implementation returns null;
	 * returning a non-null result will terminate the switch.
	 * <!-- end-user-doc -->
	 * @param object the target of the switch.
	 * @return the result of interpreting the object as an instance of '<em>Xt Connector End</em>'.
	 * @see #doSwitch(org.eclipse.emf.ecore.EObject) doSwitch(EObject)
	 * @generated
	 */
	public T caseXtConnectorEnd(XtConnectorEnd object) {
		return null;
	}

	/**
	 * Returns the result of interpreting the object as an instance of '<em>Xt Property</em>'.
	 * <!-- begin-user-doc -->
	 * This implementation returns null;
	 * returning a non-null result will terminate the switch.
	 * <!-- end-user-doc -->
	 * @param object the target of the switch.
	 * @return the result of interpreting the object as an instance of '<em>Xt Property</em>'.
	 * @see #doSwitch(org.eclipse.emf.ecore.EObject) doSwitch(EObject)
	 * @generated
	 */
	public T caseXtProperty(XtProperty object) {
		return null;
	}

	/**
	 * Returns the result of interpreting the object as an instance of '<em>Xt Component</em>'.
	 * <!-- begin-user-doc -->
	 * This implementation returns null;
	 * returning a non-null result will terminate the switch.
	 * <!-- end-user-doc -->
	 * @param object the target of the switch.
	 * @return the result of interpreting the object as an instance of '<em>Xt Component</em>'.
	 * @see #doSwitch(org.eclipse.emf.ecore.EObject) doSwitch(EObject)
	 * @generated
	 */
	public T caseXtComponent(XtComponent object) {
		return null;
	}

	/**
	 * Returns the result of interpreting the object as an instance of '<em>Xt Operation</em>'.
	 * <!-- begin-user-doc -->
	 * This implementation returns null;
	 * returning a non-null result will terminate the switch.
	 * <!-- end-user-doc -->
	 * @param object the target of the switch.
	 * @return the result of interpreting the object as an instance of '<em>Xt Operation</em>'.
	 * @see #doSwitch(org.eclipse.emf.ecore.EObject) doSwitch(EObject)
	 * @generated
	 */
	public T caseXtOperation(XtOperation object) {
		return null;
	}

	/**
	 * Returns the result of interpreting the object as an instance of '<em>Xt Parameter</em>'.
	 * <!-- begin-user-doc -->
	 * This implementation returns null;
	 * returning a non-null result will terminate the switch.
	 * <!-- end-user-doc -->
	 * @param object the target of the switch.
	 * @return the result of interpreting the object as an instance of '<em>Xt Parameter</em>'.
	 * @see #doSwitch(org.eclipse.emf.ecore.EObject) doSwitch(EObject)
	 * @generated
	 */
	public T caseXtParameter(XtParameter object) {
		return null;
	}

	/**
	 * Returns the result of interpreting the object as an instance of '<em>Xt Reception</em>'.
	 * <!-- begin-user-doc -->
	 * This implementation returns null;
	 * returning a non-null result will terminate the switch.
	 * <!-- end-user-doc -->
	 * @param object the target of the switch.
	 * @return the result of interpreting the object as an instance of '<em>Xt Reception</em>'.
	 * @see #doSwitch(org.eclipse.emf.ecore.EObject) doSwitch(EObject)
	 * @generated
	 */
	public T caseXtReception(XtReception object) {
		return null;
	}

	/**
	 * Returns the result of interpreting the object as an instance of '<em>Xt Part</em>'.
	 * <!-- begin-user-doc -->
	 * This implementation returns null;
	 * returning a non-null result will terminate the switch.
	 * <!-- end-user-doc -->
	 * @param object the target of the switch.
	 * @return the result of interpreting the object as an instance of '<em>Xt Part</em>'.
	 * @see #doSwitch(org.eclipse.emf.ecore.EObject) doSwitch(EObject)
	 * @generated
	 */
	public T caseXtPart(XtPart object) {
		return null;
	}

	/**
	 * Returns the result of interpreting the object as an instance of '<em>Xt Port</em>'.
	 * <!-- begin-user-doc -->
	 * This implementation returns null;
	 * returning a non-null result will terminate the switch.
	 * <!-- end-user-doc -->
	 * @param object the target of the switch.
	 * @return the result of interpreting the object as an instance of '<em>Xt Port</em>'.
	 * @see #doSwitch(org.eclipse.emf.ecore.EObject) doSwitch(EObject)
	 * @generated
	 */
	public T caseXtPort(XtPort object) {
		return null;
	}

	/**
	 * Returns the result of interpreting the object as an instance of '<em>Xt Connector</em>'.
	 * <!-- begin-user-doc -->
	 * This implementation returns null;
	 * returning a non-null result will terminate the switch.
	 * <!-- end-user-doc -->
	 * @param object the target of the switch.
	 * @return the result of interpreting the object as an instance of '<em>Xt Connector</em>'.
	 * @see #doSwitch(org.eclipse.emf.ecore.EObject) doSwitch(EObject)
	 * @generated
	 */
	public T caseXtConnector(XtConnector object) {
		return null;
	}

	/**
	 * Returns the result of interpreting the object as an instance of '<em>Xt Protocol Container</em>'.
	 * <!-- begin-user-doc -->
	 * This implementation returns null;
	 * returning a non-null result will terminate the switch.
	 * <!-- end-user-doc -->
	 * @param object the target of the switch.
	 * @return the result of interpreting the object as an instance of '<em>Xt Protocol Container</em>'.
	 * @see #doSwitch(org.eclipse.emf.ecore.EObject) doSwitch(EObject)
	 * @generated
	 */
	public T caseXtProtocolContainer(XtProtocolContainer object) {
		return null;
	}

	/**
	 * Returns the result of interpreting the object as an instance of '<em>Xt Protocol</em>'.
	 * <!-- begin-user-doc -->
	 * This implementation returns null;
	 * returning a non-null result will terminate the switch.
	 * <!-- end-user-doc -->
	 * @param object the target of the switch.
	 * @return the result of interpreting the object as an instance of '<em>Xt Protocol</em>'.
	 * @see #doSwitch(org.eclipse.emf.ecore.EObject) doSwitch(EObject)
	 * @generated
	 */
	public T caseXtProtocol(XtProtocol object) {
		return null;
	}

	/**
	 * Returns the result of interpreting the object as an instance of '<em>Xt Message Set</em>'.
	 * <!-- begin-user-doc -->
	 * This implementation returns null;
	 * returning a non-null result will terminate the switch.
	 * <!-- end-user-doc -->
	 * @param object the target of the switch.
	 * @return the result of interpreting the object as an instance of '<em>Xt Message Set</em>'.
	 * @see #doSwitch(org.eclipse.emf.ecore.EObject) doSwitch(EObject)
	 * @generated
	 */
	public T caseXtMessageSet(XtMessageSet object) {
		return null;
	}

	/**
	 * Returns the result of interpreting the object as an instance of '<em>Xt Signal</em>'.
	 * <!-- begin-user-doc -->
	 * This implementation returns null;
	 * returning a non-null result will terminate the switch.
	 * <!-- end-user-doc -->
	 * @param object the target of the switch.
	 * @return the result of interpreting the object as an instance of '<em>Xt Signal</em>'.
	 * @see #doSwitch(org.eclipse.emf.ecore.EObject) doSwitch(EObject)
	 * @generated
	 */
	public T caseXtSignal(XtSignal object) {
		return null;
	}

	/**
	 * Returns the result of interpreting the object as an instance of '<em>Xt Data Type</em>'.
	 * <!-- begin-user-doc -->
	 * This implementation returns null;
	 * returning a non-null result will terminate the switch.
	 * <!-- end-user-doc -->
	 * @param object the target of the switch.
	 * @return the result of interpreting the object as an instance of '<em>Xt Data Type</em>'.
	 * @see #doSwitch(org.eclipse.emf.ecore.EObject) doSwitch(EObject)
	 * @generated
	 */
	public T caseXtDataType(XtDataType object) {
		return null;
	}

	/**
	 * Returns the result of interpreting the object as an instance of '<em>Xt Enumeration</em>'.
	 * <!-- begin-user-doc -->
	 * This implementation returns null;
	 * returning a non-null result will terminate the switch.
	 * <!-- end-user-doc -->
	 * @param object the target of the switch.
	 * @return the result of interpreting the object as an instance of '<em>Xt Enumeration</em>'.
	 * @see #doSwitch(org.eclipse.emf.ecore.EObject) doSwitch(EObject)
	 * @generated
	 */
	public T caseXtEnumeration(XtEnumeration object) {
		return null;
	}

	/**
	 * Returns the result of interpreting the object as an instance of '<em>Xt Association</em>'.
	 * <!-- begin-user-doc -->
	 * This implementation returns null;
	 * returning a non-null result will terminate the switch.
	 * <!-- end-user-doc -->
	 * @param object the target of the switch.
	 * @return the result of interpreting the object as an instance of '<em>Xt Association</em>'.
	 * @see #doSwitch(org.eclipse.emf.ecore.EObject) doSwitch(EObject)
	 * @generated
	 */
	public T caseXtAssociation(XtAssociation object) {
		return null;
	}

	/**
	 * Returns the result of interpreting the object as an instance of '<em>Xt Association Class</em>'.
	 * <!-- begin-user-doc -->
	 * This implementation returns null;
	 * returning a non-null result will terminate the switch.
	 * <!-- end-user-doc -->
	 * @param object the target of the switch.
	 * @return the result of interpreting the object as an instance of '<em>Xt Association Class</em>'.
	 * @see #doSwitch(org.eclipse.emf.ecore.EObject) doSwitch(EObject)
	 * @generated
	 */
	public T caseXtAssociationClass(XtAssociationClass object) {
		return null;
	}

	/**
	 * Returns the result of interpreting the object as an instance of '<em>Xt Trigger</em>'.
	 * <!-- begin-user-doc -->
	 * This implementation returns null;
	 * returning a non-null result will terminate the switch.
	 * <!-- end-user-doc -->
	 * @param object the target of the switch.
	 * @return the result of interpreting the object as an instance of '<em>Xt Trigger</em>'.
	 * @see #doSwitch(org.eclipse.emf.ecore.EObject) doSwitch(EObject)
	 * @generated
	 */
	public T caseXtTrigger(XtTrigger object) {
		return null;
	}

	/**
	 * Returns the result of interpreting the object as an instance of '<em>Xt State Machine</em>'.
	 * <!-- begin-user-doc -->
	 * This implementation returns null;
	 * returning a non-null result will terminate the switch.
	 * <!-- end-user-doc -->
	 * @param object the target of the switch.
	 * @return the result of interpreting the object as an instance of '<em>Xt State Machine</em>'.
	 * @see #doSwitch(org.eclipse.emf.ecore.EObject) doSwitch(EObject)
	 * @generated
	 */
	public T caseXtStateMachine(XtStateMachine object) {
		return null;
	}

	/**
	 * Returns the result of interpreting the object as an instance of '<em>Xt Region</em>'.
	 * <!-- begin-user-doc -->
	 * This implementation returns null;
	 * returning a non-null result will terminate the switch.
	 * <!-- end-user-doc -->
	 * @param object the target of the switch.
	 * @return the result of interpreting the object as an instance of '<em>Xt Region</em>'.
	 * @see #doSwitch(org.eclipse.emf.ecore.EObject) doSwitch(EObject)
	 * @generated
	 */
	public T caseXtRegion(XtRegion object) {
		return null;
	}

	/**
	 * Returns the result of interpreting the object as an instance of '<em>Xt Pseudo State</em>'.
	 * <!-- begin-user-doc -->
	 * This implementation returns null;
	 * returning a non-null result will terminate the switch.
	 * <!-- end-user-doc -->
	 * @param object the target of the switch.
	 * @return the result of interpreting the object as an instance of '<em>Xt Pseudo State</em>'.
	 * @see #doSwitch(org.eclipse.emf.ecore.EObject) doSwitch(EObject)
	 * @generated
	 */
	public T caseXtPseudoState(XtPseudoState object) {
		return null;
	}

	/**
	 * Returns the result of interpreting the object as an instance of '<em>Xt Transition</em>'.
	 * <!-- begin-user-doc -->
	 * This implementation returns null;
	 * returning a non-null result will terminate the switch.
	 * <!-- end-user-doc -->
	 * @param object the target of the switch.
	 * @return the result of interpreting the object as an instance of '<em>Xt Transition</em>'.
	 * @see #doSwitch(org.eclipse.emf.ecore.EObject) doSwitch(EObject)
	 * @generated
	 */
	public T caseXtTransition(XtTransition object) {
		return null;
	}

	/**
	 * Returns the result of interpreting the object as an instance of '<em>Xt State</em>'.
	 * <!-- begin-user-doc -->
	 * This implementation returns null;
	 * returning a non-null result will terminate the switch.
	 * <!-- end-user-doc -->
	 * @param object the target of the switch.
	 * @return the result of interpreting the object as an instance of '<em>Xt State</em>'.
	 * @see #doSwitch(org.eclipse.emf.ecore.EObject) doSwitch(EObject)
	 * @generated
	 */
	public T caseXtState(XtState object) {
		return null;
	}

	/**
	 * Returns the result of interpreting the object as an instance of '<em>Xt Activity</em>'.
	 * <!-- begin-user-doc -->
	 * This implementation returns null;
	 * returning a non-null result will terminate the switch.
	 * <!-- end-user-doc -->
	 * @param object the target of the switch.
	 * @return the result of interpreting the object as an instance of '<em>Xt Activity</em>'.
	 * @see #doSwitch(org.eclipse.emf.ecore.EObject) doSwitch(EObject)
	 * @generated
	 */
	public T caseXtActivity(XtActivity object) {
		return null;
	}

	/**
	 * Returns the result of interpreting the object as an instance of '<em>Xt Constraint</em>'.
	 * <!-- begin-user-doc -->
	 * This implementation returns null;
	 * returning a non-null result will terminate the switch.
	 * <!-- end-user-doc -->
	 * @param object the target of the switch.
	 * @return the result of interpreting the object as an instance of '<em>Xt Constraint</em>'.
	 * @see #doSwitch(org.eclipse.emf.ecore.EObject) doSwitch(EObject)
	 * @generated
	 */
	public T caseXtConstraint(XtConstraint object) {
		return null;
	}

	/**
	 * Returns the result of interpreting the object as an instance of '<em>Xt Class</em>'.
	 * <!-- begin-user-doc -->
	 * This implementation returns null;
	 * returning a non-null result will terminate the switch.
	 * <!-- end-user-doc -->
	 * @param object the target of the switch.
	 * @return the result of interpreting the object as an instance of '<em>Xt Class</em>'.
	 * @see #doSwitch(org.eclipse.emf.ecore.EObject) doSwitch(EObject)
	 * @generated
	 */
	public T caseXtClass(XtClass object) {
		return null;
	}

	/**
	 * Returns the result of interpreting the object as an instance of '<em>Xt Constrained Type</em>'.
	 * <!-- begin-user-doc -->
	 * This implementation returns null;
	 * returning a non-null result will terminate the switch.
	 * <!-- end-user-doc -->
	 * @param object the target of the switch.
	 * @return the result of interpreting the object as an instance of '<em>Xt Constrained Type</em>'.
	 * @see #doSwitch(org.eclipse.emf.ecore.EObject) doSwitch(EObject)
	 * @generated
	 */
	public T caseXtConstrainedType(XtConstrainedType object) {
		return null;
	}

	/**
	 * Returns the result of interpreting the object as an instance of '<em>Xt Opaque Behavior</em>'.
	 * <!-- begin-user-doc -->
	 * This implementation returns null;
	 * returning a non-null result will terminate the switch.
	 * <!-- end-user-doc -->
	 * @param object the target of the switch.
	 * @return the result of interpreting the object as an instance of '<em>Xt Opaque Behavior</em>'.
	 * @see #doSwitch(org.eclipse.emf.ecore.EObject) doSwitch(EObject)
	 * @generated
	 */
	public T caseXtOpaqueBehavior(XtOpaqueBehavior object) {
		return null;
	}

	/**
	 * Returns the result of interpreting the object as an instance of '<em>Xt Generalization</em>'.
	 * <!-- begin-user-doc -->
	 * This implementation returns null;
	 * returning a non-null result will terminate the switch.
	 * <!-- end-user-doc -->
	 * @param object the target of the switch.
	 * @return the result of interpreting the object as an instance of '<em>Xt Generalization</em>'.
	 * @see #doSwitch(org.eclipse.emf.ecore.EObject) doSwitch(EObject)
	 * @generated
	 */
	public T caseXtGeneralization(XtGeneralization object) {
		return null;
	}

	/**
	 * Returns the result of interpreting the object as an instance of '<em>Xt Generalization Set</em>'.
	 * <!-- begin-user-doc -->
	 * This implementation returns null;
	 * returning a non-null result will terminate the switch.
	 * <!-- end-user-doc -->
	 * @param object the target of the switch.
	 * @return the result of interpreting the object as an instance of '<em>Xt Generalization Set</em>'.
	 * @see #doSwitch(org.eclipse.emf.ecore.EObject) doSwitch(EObject)
	 * @generated
	 */
	public T caseXtGeneralizationSet(XtGeneralizationSet object) {
		return null;
	}

	/**
	 * Returns the result of interpreting the object as an instance of '<em>XConnector End</em>'.
	 * <!-- begin-user-doc -->
	 * This implementation returns null;
	 * returning a non-null result will terminate the switch.
	 * <!-- end-user-doc -->
	 * @param object the target of the switch.
	 * @return the result of interpreting the object as an instance of '<em>XConnector End</em>'.
	 * @see #doSwitch(org.eclipse.emf.ecore.EObject) doSwitch(EObject)
	 * @generated
	 */
	public T caseXConnectorEnd(XConnectorEnd object) {
		return null;
	}

	/**
	 * Returns the result of interpreting the object as an instance of '<em>XMultiplicity Element</em>'.
	 * <!-- begin-user-doc -->
	 * This implementation returns null;
	 * returning a non-null result will terminate the switch.
	 * <!-- end-user-doc -->
	 * @param object the target of the switch.
	 * @return the result of interpreting the object as an instance of '<em>XMultiplicity Element</em>'.
	 * @see #doSwitch(org.eclipse.emf.ecore.EObject) doSwitch(EObject)
	 * @generated
	 */
	public T caseXMultiplicityElement(XMultiplicityElement object) {
		return null;
	}

	/**
	 * Returns the result of interpreting the object as an instance of '<em>XNamed Element</em>'.
	 * <!-- begin-user-doc -->
	 * This implementation returns null;
	 * returning a non-null result will terminate the switch.
	 * <!-- end-user-doc -->
	 * @param object the target of the switch.
	 * @return the result of interpreting the object as an instance of '<em>XNamed Element</em>'.
	 * @see #doSwitch(org.eclipse.emf.ecore.EObject) doSwitch(EObject)
	 * @generated
	 */
	public T caseXNamedElement(XNamedElement object) {
		return null;
	}

	/**
	 * Returns the result of interpreting the object as an instance of '<em>XFeature</em>'.
	 * <!-- begin-user-doc -->
	 * This implementation returns null;
	 * returning a non-null result will terminate the switch.
	 * <!-- end-user-doc -->
	 * @param object the target of the switch.
	 * @return the result of interpreting the object as an instance of '<em>XFeature</em>'.
	 * @see #doSwitch(org.eclipse.emf.ecore.EObject) doSwitch(EObject)
	 * @generated
	 */
	public T caseXFeature(XFeature object) {
		return null;
	}

	/**
	 * Returns the result of interpreting the object as an instance of '<em>XTyped Element</em>'.
	 * <!-- begin-user-doc -->
	 * This implementation returns null;
	 * returning a non-null result will terminate the switch.
	 * <!-- end-user-doc -->
	 * @param object the target of the switch.
	 * @return the result of interpreting the object as an instance of '<em>XTyped Element</em>'.
	 * @see #doSwitch(org.eclipse.emf.ecore.EObject) doSwitch(EObject)
	 * @generated
	 */
	public T caseXTypedElement(XTypedElement object) {
		return null;
	}

	/**
	 * Returns the result of interpreting the object as an instance of '<em>XProperty</em>'.
	 * <!-- begin-user-doc -->
	 * This implementation returns null;
	 * returning a non-null result will terminate the switch.
	 * <!-- end-user-doc -->
	 * @param object the target of the switch.
	 * @return the result of interpreting the object as an instance of '<em>XProperty</em>'.
	 * @see #doSwitch(org.eclipse.emf.ecore.EObject) doSwitch(EObject)
	 * @generated
	 */
	public T caseXProperty(XProperty object) {
		return null;
	}

	/**
	 * Returns the result of interpreting the object as an instance of '<em>XNamespace</em>'.
	 * <!-- begin-user-doc -->
	 * This implementation returns null;
	 * returning a non-null result will terminate the switch.
	 * <!-- end-user-doc -->
	 * @param object the target of the switch.
	 * @return the result of interpreting the object as an instance of '<em>XNamespace</em>'.
	 * @see #doSwitch(org.eclipse.emf.ecore.EObject) doSwitch(EObject)
	 * @generated
	 */
	public T caseXNamespace(XNamespace object) {
		return null;
	}

	/**
	 * Returns the result of interpreting the object as an instance of '<em>XClassifier</em>'.
	 * <!-- begin-user-doc -->
	 * This implementation returns null;
	 * returning a non-null result will terminate the switch.
	 * <!-- end-user-doc -->
	 * @param object the target of the switch.
	 * @return the result of interpreting the object as an instance of '<em>XClassifier</em>'.
	 * @see #doSwitch(org.eclipse.emf.ecore.EObject) doSwitch(EObject)
	 * @generated
	 */
	public T caseXClassifier(XClassifier object) {
		return null;
	}

	/**
	 * Returns the result of interpreting the object as an instance of '<em>XEncapsulated Classifier</em>'.
	 * <!-- begin-user-doc -->
	 * This implementation returns null;
	 * returning a non-null result will terminate the switch.
	 * <!-- end-user-doc -->
	 * @param object the target of the switch.
	 * @return the result of interpreting the object as an instance of '<em>XEncapsulated Classifier</em>'.
	 * @see #doSwitch(org.eclipse.emf.ecore.EObject) doSwitch(EObject)
	 * @generated
	 */
	public T caseXEncapsulatedClassifier(XEncapsulatedClassifier object) {
		return null;
	}

	/**
	 * Returns the result of interpreting the object as an instance of '<em>XOperation</em>'.
	 * <!-- begin-user-doc -->
	 * This implementation returns null;
	 * returning a non-null result will terminate the switch.
	 * <!-- end-user-doc -->
	 * @param object the target of the switch.
	 * @return the result of interpreting the object as an instance of '<em>XOperation</em>'.
	 * @see #doSwitch(org.eclipse.emf.ecore.EObject) doSwitch(EObject)
	 * @generated
	 */
	public T caseXOperation(XOperation object) {
		return null;
	}

	/**
	 * Returns the result of interpreting the object as an instance of '<em>XParameter</em>'.
	 * <!-- begin-user-doc -->
	 * This implementation returns null;
	 * returning a non-null result will terminate the switch.
	 * <!-- end-user-doc -->
	 * @param object the target of the switch.
	 * @return the result of interpreting the object as an instance of '<em>XParameter</em>'.
	 * @see #doSwitch(org.eclipse.emf.ecore.EObject) doSwitch(EObject)
	 * @generated
	 */
	public T caseXParameter(XParameter object) {
		return null;
	}

	/**
	 * Returns the result of interpreting the object as an instance of '<em>XReception</em>'.
	 * <!-- begin-user-doc -->
	 * This implementation returns null;
	 * returning a non-null result will terminate the switch.
	 * <!-- end-user-doc -->
	 * @param object the target of the switch.
	 * @return the result of interpreting the object as an instance of '<em>XReception</em>'.
	 * @see #doSwitch(org.eclipse.emf.ecore.EObject) doSwitch(EObject)
	 * @generated
	 */
	public T caseXReception(XReception object) {
		return null;
	}

	/**
	 * Returns the result of interpreting the object as an instance of '<em>XPart</em>'.
	 * <!-- begin-user-doc -->
	 * This implementation returns null;
	 * returning a non-null result will terminate the switch.
	 * <!-- end-user-doc -->
	 * @param object the target of the switch.
	 * @return the result of interpreting the object as an instance of '<em>XPart</em>'.
	 * @see #doSwitch(org.eclipse.emf.ecore.EObject) doSwitch(EObject)
	 * @generated
	 */
	public T caseXPart(XPart object) {
		return null;
	}

	/**
	 * Returns the result of interpreting the object as an instance of '<em>XPort</em>'.
	 * <!-- begin-user-doc -->
	 * This implementation returns null;
	 * returning a non-null result will terminate the switch.
	 * <!-- end-user-doc -->
	 * @param object the target of the switch.
	 * @return the result of interpreting the object as an instance of '<em>XPort</em>'.
	 * @see #doSwitch(org.eclipse.emf.ecore.EObject) doSwitch(EObject)
	 * @generated
	 */
	public T caseXPort(XPort object) {
		return null;
	}

	/**
	 * Returns the result of interpreting the object as an instance of '<em>XConnector</em>'.
	 * <!-- begin-user-doc -->
	 * This implementation returns null;
	 * returning a non-null result will terminate the switch.
	 * <!-- end-user-doc -->
	 * @param object the target of the switch.
	 * @return the result of interpreting the object as an instance of '<em>XConnector</em>'.
	 * @see #doSwitch(org.eclipse.emf.ecore.EObject) doSwitch(EObject)
	 * @generated
	 */
	public T caseXConnector(XConnector object) {
		return null;
	}

	/**
	 * Returns the result of interpreting the object as an instance of '<em>XProtocol Container</em>'.
	 * <!-- begin-user-doc -->
	 * This implementation returns null;
	 * returning a non-null result will terminate the switch.
	 * <!-- end-user-doc -->
	 * @param object the target of the switch.
	 * @return the result of interpreting the object as an instance of '<em>XProtocol Container</em>'.
	 * @see #doSwitch(org.eclipse.emf.ecore.EObject) doSwitch(EObject)
	 * @generated
	 */
	public T caseXProtocolContainer(XProtocolContainer object) {
		return null;
	}

	/**
	 * Returns the result of interpreting the object as an instance of '<em>XProtocol</em>'.
	 * <!-- begin-user-doc -->
	 * This implementation returns null;
	 * returning a non-null result will terminate the switch.
	 * <!-- end-user-doc -->
	 * @param object the target of the switch.
	 * @return the result of interpreting the object as an instance of '<em>XProtocol</em>'.
	 * @see #doSwitch(org.eclipse.emf.ecore.EObject) doSwitch(EObject)
	 * @generated
	 */
	public T caseXProtocol(XProtocol object) {
		return null;
	}

	/**
	 * Returns the result of interpreting the object as an instance of '<em>XMessage Set</em>'.
	 * <!-- begin-user-doc -->
	 * This implementation returns null;
	 * returning a non-null result will terminate the switch.
	 * <!-- end-user-doc -->
	 * @param object the target of the switch.
	 * @return the result of interpreting the object as an instance of '<em>XMessage Set</em>'.
	 * @see #doSwitch(org.eclipse.emf.ecore.EObject) doSwitch(EObject)
	 * @generated
	 */
	public T caseXMessageSet(XMessageSet object) {
		return null;
	}

	/**
	 * Returns the result of interpreting the object as an instance of '<em>XSignal</em>'.
	 * <!-- begin-user-doc -->
	 * This implementation returns null;
	 * returning a non-null result will terminate the switch.
	 * <!-- end-user-doc -->
	 * @param object the target of the switch.
	 * @return the result of interpreting the object as an instance of '<em>XSignal</em>'.
	 * @see #doSwitch(org.eclipse.emf.ecore.EObject) doSwitch(EObject)
	 * @generated
	 */
	public T caseXSignal(XSignal object) {
		return null;
	}

	/**
	 * Returns the result of interpreting the object as an instance of '<em>XData Type</em>'.
	 * <!-- begin-user-doc -->
	 * This implementation returns null;
	 * returning a non-null result will terminate the switch.
	 * <!-- end-user-doc -->
	 * @param object the target of the switch.
	 * @return the result of interpreting the object as an instance of '<em>XData Type</em>'.
	 * @see #doSwitch(org.eclipse.emf.ecore.EObject) doSwitch(EObject)
	 * @generated
	 */
	public T caseXDataType(XDataType object) {
		return null;
	}

	/**
	 * Returns the result of interpreting the object as an instance of '<em>XEnumeration</em>'.
	 * <!-- begin-user-doc -->
	 * This implementation returns null;
	 * returning a non-null result will terminate the switch.
	 * <!-- end-user-doc -->
	 * @param object the target of the switch.
	 * @return the result of interpreting the object as an instance of '<em>XEnumeration</em>'.
	 * @see #doSwitch(org.eclipse.emf.ecore.EObject) doSwitch(EObject)
	 * @generated
	 */
	public T caseXEnumeration(XEnumeration object) {
		return null;
	}

	/**
	 * Returns the result of interpreting the object as an instance of '<em>XAssociation</em>'.
	 * <!-- begin-user-doc -->
	 * This implementation returns null;
	 * returning a non-null result will terminate the switch.
	 * <!-- end-user-doc -->
	 * @param object the target of the switch.
	 * @return the result of interpreting the object as an instance of '<em>XAssociation</em>'.
	 * @see #doSwitch(org.eclipse.emf.ecore.EObject) doSwitch(EObject)
	 * @generated
	 */
	public T caseXAssociation(XAssociation object) {
		return null;
	}

	/**
	 * Returns the result of interpreting the object as an instance of '<em>XAssociation Class</em>'.
	 * <!-- begin-user-doc -->
	 * This implementation returns null;
	 * returning a non-null result will terminate the switch.
	 * <!-- end-user-doc -->
	 * @param object the target of the switch.
	 * @return the result of interpreting the object as an instance of '<em>XAssociation Class</em>'.
	 * @see #doSwitch(org.eclipse.emf.ecore.EObject) doSwitch(EObject)
	 * @generated
	 */
	public T caseXAssociationClass(XAssociationClass object) {
		return null;
	}

	/**
	 * Returns the result of interpreting the object as an instance of '<em>XTrigger</em>'.
	 * <!-- begin-user-doc -->
	 * This implementation returns null;
	 * returning a non-null result will terminate the switch.
	 * <!-- end-user-doc -->
	 * @param object the target of the switch.
	 * @return the result of interpreting the object as an instance of '<em>XTrigger</em>'.
	 * @see #doSwitch(org.eclipse.emf.ecore.EObject) doSwitch(EObject)
	 * @generated
	 */
	public T caseXTrigger(XTrigger object) {
		return null;
	}

	/**
	 * Returns the result of interpreting the object as an instance of '<em>XBehavior</em>'.
	 * <!-- begin-user-doc -->
	 * This implementation returns null;
	 * returning a non-null result will terminate the switch.
	 * <!-- end-user-doc -->
	 * @param object the target of the switch.
	 * @return the result of interpreting the object as an instance of '<em>XBehavior</em>'.
	 * @see #doSwitch(org.eclipse.emf.ecore.EObject) doSwitch(EObject)
	 * @generated
	 */
	public T caseXBehavior(XBehavior object) {
		return null;
	}

	/**
	 * Returns the result of interpreting the object as an instance of '<em>XState Machine</em>'.
	 * <!-- begin-user-doc -->
	 * This implementation returns null;
	 * returning a non-null result will terminate the switch.
	 * <!-- end-user-doc -->
	 * @param object the target of the switch.
	 * @return the result of interpreting the object as an instance of '<em>XState Machine</em>'.
	 * @see #doSwitch(org.eclipse.emf.ecore.EObject) doSwitch(EObject)
	 * @generated
	 */
	public T caseXStateMachine(XStateMachine object) {
		return null;
	}

	/**
	 * Returns the result of interpreting the object as an instance of '<em>XRegion</em>'.
	 * <!-- begin-user-doc -->
	 * This implementation returns null;
	 * returning a non-null result will terminate the switch.
	 * <!-- end-user-doc -->
	 * @param object the target of the switch.
	 * @return the result of interpreting the object as an instance of '<em>XRegion</em>'.
	 * @see #doSwitch(org.eclipse.emf.ecore.EObject) doSwitch(EObject)
	 * @generated
	 */
	public T caseXRegion(XRegion object) {
		return null;
	}

	/**
	 * Returns the result of interpreting the object as an instance of '<em>XVertex</em>'.
	 * <!-- begin-user-doc -->
	 * This implementation returns null;
	 * returning a non-null result will terminate the switch.
	 * <!-- end-user-doc -->
	 * @param object the target of the switch.
	 * @return the result of interpreting the object as an instance of '<em>XVertex</em>'.
	 * @see #doSwitch(org.eclipse.emf.ecore.EObject) doSwitch(EObject)
	 * @generated
	 */
	public T caseXVertex(XVertex object) {
		return null;
	}

	/**
	 * Returns the result of interpreting the object as an instance of '<em>XPseudostate</em>'.
	 * <!-- begin-user-doc -->
	 * This implementation returns null;
	 * returning a non-null result will terminate the switch.
	 * <!-- end-user-doc -->
	 * @param object the target of the switch.
	 * @return the result of interpreting the object as an instance of '<em>XPseudostate</em>'.
	 * @see #doSwitch(org.eclipse.emf.ecore.EObject) doSwitch(EObject)
	 * @generated
	 */
	public T caseXPseudostate(XPseudostate object) {
		return null;
	}

	/**
	 * Returns the result of interpreting the object as an instance of '<em>XTransition</em>'.
	 * <!-- begin-user-doc -->
	 * This implementation returns null;
	 * returning a non-null result will terminate the switch.
	 * <!-- end-user-doc -->
	 * @param object the target of the switch.
	 * @return the result of interpreting the object as an instance of '<em>XTransition</em>'.
	 * @see #doSwitch(org.eclipse.emf.ecore.EObject) doSwitch(EObject)
	 * @generated
	 */
	public T caseXTransition(XTransition object) {
		return null;
	}

	/**
	 * Returns the result of interpreting the object as an instance of '<em>XState</em>'.
	 * <!-- begin-user-doc -->
	 * This implementation returns null;
	 * returning a non-null result will terminate the switch.
	 * <!-- end-user-doc -->
	 * @param object the target of the switch.
	 * @return the result of interpreting the object as an instance of '<em>XState</em>'.
	 * @see #doSwitch(org.eclipse.emf.ecore.EObject) doSwitch(EObject)
	 * @generated
	 */
	public T caseXState(XState object) {
		return null;
	}

	/**
	 * Returns the result of interpreting the object as an instance of '<em>XAction Behavior</em>'.
	 * <!-- begin-user-doc -->
	 * This implementation returns null;
	 * returning a non-null result will terminate the switch.
	 * <!-- end-user-doc -->
	 * @param object the target of the switch.
	 * @return the result of interpreting the object as an instance of '<em>XAction Behavior</em>'.
	 * @see #doSwitch(org.eclipse.emf.ecore.EObject) doSwitch(EObject)
	 * @generated
	 */
	public T caseXActionBehavior(XActionBehavior object) {
		return null;
	}

	/**
	 * Returns the result of interpreting the object as an instance of '<em>XActivity</em>'.
	 * <!-- begin-user-doc -->
	 * This implementation returns null;
	 * returning a non-null result will terminate the switch.
	 * <!-- end-user-doc -->
	 * @param object the target of the switch.
	 * @return the result of interpreting the object as an instance of '<em>XActivity</em>'.
	 * @see #doSwitch(org.eclipse.emf.ecore.EObject) doSwitch(EObject)
	 * @generated
	 */
	public T caseXActivity(XActivity object) {
		return null;
	}

	/**
	 * Returns the result of interpreting the object as an instance of '<em>XConstraint</em>'.
	 * <!-- begin-user-doc -->
	 * This implementation returns null;
	 * returning a non-null result will terminate the switch.
	 * <!-- end-user-doc -->
	 * @param object the target of the switch.
	 * @return the result of interpreting the object as an instance of '<em>XConstraint</em>'.
	 * @see #doSwitch(org.eclipse.emf.ecore.EObject) doSwitch(EObject)
	 * @generated
	 */
	public T caseXConstraint(XConstraint object) {
		return null;
	}

	/**
	 * Returns the result of interpreting the object as an instance of '<em>XClass</em>'.
	 * <!-- begin-user-doc -->
	 * This implementation returns null;
	 * returning a non-null result will terminate the switch.
	 * <!-- end-user-doc -->
	 * @param object the target of the switch.
	 * @return the result of interpreting the object as an instance of '<em>XClass</em>'.
	 * @see #doSwitch(org.eclipse.emf.ecore.EObject) doSwitch(EObject)
	 * @generated
	 */
	public T caseXClass(XClass object) {
		return null;
	}

	/**
	 * Returns the result of interpreting the object as an instance of '<em>XConstrained Type</em>'.
	 * <!-- begin-user-doc -->
	 * This implementation returns null;
	 * returning a non-null result will terminate the switch.
	 * <!-- end-user-doc -->
	 * @param object the target of the switch.
	 * @return the result of interpreting the object as an instance of '<em>XConstrained Type</em>'.
	 * @see #doSwitch(org.eclipse.emf.ecore.EObject) doSwitch(EObject)
	 * @generated
	 */
	public T caseXConstrainedType(XConstrainedType object) {
		return null;
	}

	/**
	 * Returns the result of interpreting the object as an instance of '<em>XOpaque Behavior</em>'.
	 * <!-- begin-user-doc -->
	 * This implementation returns null;
	 * returning a non-null result will terminate the switch.
	 * <!-- end-user-doc -->
	 * @param object the target of the switch.
	 * @return the result of interpreting the object as an instance of '<em>XOpaque Behavior</em>'.
	 * @see #doSwitch(org.eclipse.emf.ecore.EObject) doSwitch(EObject)
	 * @generated
	 */
	public T caseXOpaqueBehavior(XOpaqueBehavior object) {
		return null;
	}

	/**
	 * Returns the result of interpreting the object as an instance of '<em>XGeneralization</em>'.
	 * <!-- begin-user-doc -->
	 * This implementation returns null;
	 * returning a non-null result will terminate the switch.
	 * <!-- end-user-doc -->
	 * @param object the target of the switch.
	 * @return the result of interpreting the object as an instance of '<em>XGeneralization</em>'.
	 * @see #doSwitch(org.eclipse.emf.ecore.EObject) doSwitch(EObject)
	 * @generated
	 */
	public T caseXGeneralization(XGeneralization object) {
		return null;
	}

	/**
	 * Returns the result of interpreting the object as an instance of '<em>XGeneralization Set</em>'.
	 * <!-- begin-user-doc -->
	 * This implementation returns null;
	 * returning a non-null result will terminate the switch.
	 * <!-- end-user-doc -->
	 * @param object the target of the switch.
	 * @return the result of interpreting the object as an instance of '<em>XGeneralization Set</em>'.
	 * @see #doSwitch(org.eclipse.emf.ecore.EObject) doSwitch(EObject)
	 * @generated
	 */
	public T caseXGeneralizationSet(XGeneralizationSet object) {
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

} //xtUMLProfileSwitch
