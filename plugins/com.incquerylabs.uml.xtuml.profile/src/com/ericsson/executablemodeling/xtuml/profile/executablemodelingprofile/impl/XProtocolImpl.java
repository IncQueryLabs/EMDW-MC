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
package com.ericsson.executablemodeling.xtuml.profile.executablemodelingprofile.impl;

import com.ericsson.executablemodeling.xtuml.profile.executablemodelingprofile.ExecutableModelingProfilePackage;
import com.ericsson.executablemodeling.xtuml.profile.executablemodelingprofile.XProtocol;

import com.ericsson.executablemodeling.xtuml.profile.executablemodelingprofile.util.ExecutableModelingProfileValidator;

import java.lang.reflect.InvocationTargetException;

import java.util.Map;

import org.eclipse.emf.common.notify.Notification;

import org.eclipse.emf.common.util.BasicDiagnostic;
import org.eclipse.emf.common.util.Diagnostic;
import org.eclipse.emf.common.util.DiagnosticChain;
import org.eclipse.emf.common.util.EList;

import org.eclipse.emf.ecore.EClass;
import org.eclipse.emf.ecore.InternalEObject;

import org.eclipse.emf.ecore.impl.ENotificationImpl;

import org.eclipse.emf.ecore.plugin.EcorePlugin;

import org.eclipse.emf.ecore.util.EObjectValidator;

import org.eclipse.uml2.uml.BehavioredClassifier;

/**
 * <!-- begin-user-doc -->
 * An implementation of the model object '<em><b>XProtocol</b></em>'.
 * <!-- end-user-doc -->
 * <p>
 * The following features are implemented:
 * </p>
 * <ul>
 *   <li>{@link com.ericsson.executablemodeling.xtuml.profile.executablemodelingprofile.impl.XProtocolImpl#getBase_BehavioredClassifier <em>Base Behaviored Classifier</em>}</li>
 * </ul>
 *
 * @generated
 */
public abstract class XProtocolImpl extends XClassifierImpl implements XProtocol {
	/**
	 * The cached value of the '{@link #getBase_BehavioredClassifier() <em>Base Behaviored Classifier</em>}' reference.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @see #getBase_BehavioredClassifier()
	 * @generated
	 * @ordered
	 */
	protected BehavioredClassifier base_BehavioredClassifier;

	/**
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 */
	protected XProtocolImpl() {
		super();
	}

	/**
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 */
	@Override
	protected EClass eStaticClass() {
		return ExecutableModelingProfilePackage.Literals.XPROTOCOL;
	}

	/**
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 */
	public BehavioredClassifier getBase_BehavioredClassifier() {
		if (base_BehavioredClassifier != null && base_BehavioredClassifier.eIsProxy()) {
			InternalEObject oldBase_BehavioredClassifier = (InternalEObject)base_BehavioredClassifier;
			base_BehavioredClassifier = (BehavioredClassifier)eResolveProxy(oldBase_BehavioredClassifier);
			if (base_BehavioredClassifier != oldBase_BehavioredClassifier) {
				if (eNotificationRequired())
					eNotify(new ENotificationImpl(this, Notification.RESOLVE, ExecutableModelingProfilePackage.XPROTOCOL__BASE_BEHAVIORED_CLASSIFIER, oldBase_BehavioredClassifier, base_BehavioredClassifier));
			}
		}
		return base_BehavioredClassifier;
	}

	/**
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 */
	public BehavioredClassifier basicGetBase_BehavioredClassifier() {
		return base_BehavioredClassifier;
	}

	/**
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 */
	public void setBase_BehavioredClassifier(BehavioredClassifier newBase_BehavioredClassifier) {
		BehavioredClassifier oldBase_BehavioredClassifier = base_BehavioredClassifier;
		base_BehavioredClassifier = newBase_BehavioredClassifier;
		if (eNotificationRequired())
			eNotify(new ENotificationImpl(this, Notification.SET, ExecutableModelingProfilePackage.XPROTOCOL__BASE_BEHAVIORED_CLASSIFIER, oldBase_BehavioredClassifier, base_BehavioredClassifier));
	}

	/**
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 */
	public boolean xProtocolIncomingInterface(DiagnosticChain diagnostics, Map<Object, Object> context) {
		// TODO: implement this method
		// -> specify the condition that violates the invariant
		// -> verify the details of the diagnostic, including severity and message
		// Ensure that you remove @generated or mark it @generated NOT
		if (false) {
			if (diagnostics != null) {
				diagnostics.add
					(new BasicDiagnostic
						(Diagnostic.ERROR,
						 ExecutableModelingProfileValidator.DIAGNOSTIC_SOURCE,
						 ExecutableModelingProfileValidator.XPROTOCOL__XPROTOCOL_INCOMING_INTERFACE,
						 EcorePlugin.INSTANCE.getString("_UI_GenericInvariant_diagnostic", new Object[] { "xProtocolIncomingInterface", EObjectValidator.getObjectLabel(this, context) }),
						 new Object [] { this }));
			}
			return false;
		}
		return true;
	}

	/**
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 */
	public boolean xProtocolProtocolContainer(DiagnosticChain diagnostics, Map<Object, Object> context) {
		// TODO: implement this method
		// -> specify the condition that violates the invariant
		// -> verify the details of the diagnostic, including severity and message
		// Ensure that you remove @generated or mark it @generated NOT
		if (false) {
			if (diagnostics != null) {
				diagnostics.add
					(new BasicDiagnostic
						(Diagnostic.ERROR,
						 ExecutableModelingProfileValidator.DIAGNOSTIC_SOURCE,
						 ExecutableModelingProfileValidator.XPROTOCOL__XPROTOCOL_PROTOCOL_CONTAINER,
						 EcorePlugin.INSTANCE.getString("_UI_GenericInvariant_diagnostic", new Object[] { "xProtocolProtocolContainer", EObjectValidator.getObjectLabel(this, context) }),
						 new Object [] { this }));
			}
			return false;
		}
		return true;
	}

	/**
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 */
	public boolean xProtocolOutgoingInterface(DiagnosticChain diagnostics, Map<Object, Object> context) {
		// TODO: implement this method
		// -> specify the condition that violates the invariant
		// -> verify the details of the diagnostic, including severity and message
		// Ensure that you remove @generated or mark it @generated NOT
		if (false) {
			if (diagnostics != null) {
				diagnostics.add
					(new BasicDiagnostic
						(Diagnostic.ERROR,
						 ExecutableModelingProfileValidator.DIAGNOSTIC_SOURCE,
						 ExecutableModelingProfileValidator.XPROTOCOL__XPROTOCOL_OUTGOING_INTERFACE,
						 EcorePlugin.INSTANCE.getString("_UI_GenericInvariant_diagnostic", new Object[] { "xProtocolOutgoingInterface", EObjectValidator.getObjectLabel(this, context) }),
						 new Object [] { this }));
			}
			return false;
		}
		return true;
	}

	/**
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 */
	public boolean xProtocolSymmetricInterface(DiagnosticChain diagnostics, Map<Object, Object> context) {
		// TODO: implement this method
		// -> specify the condition that violates the invariant
		// -> verify the details of the diagnostic, including severity and message
		// Ensure that you remove @generated or mark it @generated NOT
		if (false) {
			if (diagnostics != null) {
				diagnostics.add
					(new BasicDiagnostic
						(Diagnostic.ERROR,
						 ExecutableModelingProfileValidator.DIAGNOSTIC_SOURCE,
						 ExecutableModelingProfileValidator.XPROTOCOL__XPROTOCOL_SYMMETRIC_INTERFACE,
						 EcorePlugin.INSTANCE.getString("_UI_GenericInvariant_diagnostic", new Object[] { "xProtocolSymmetricInterface", EObjectValidator.getObjectLabel(this, context) }),
						 new Object [] { this }));
			}
			return false;
		}
		return true;
	}

	/**
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 */
	@Override
	public Object eGet(int featureID, boolean resolve, boolean coreType) {
		switch (featureID) {
			case ExecutableModelingProfilePackage.XPROTOCOL__BASE_BEHAVIORED_CLASSIFIER:
				if (resolve) return getBase_BehavioredClassifier();
				return basicGetBase_BehavioredClassifier();
		}
		return super.eGet(featureID, resolve, coreType);
	}

	/**
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 */
	@Override
	public void eSet(int featureID, Object newValue) {
		switch (featureID) {
			case ExecutableModelingProfilePackage.XPROTOCOL__BASE_BEHAVIORED_CLASSIFIER:
				setBase_BehavioredClassifier((BehavioredClassifier)newValue);
				return;
		}
		super.eSet(featureID, newValue);
	}

	/**
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 */
	@Override
	public void eUnset(int featureID) {
		switch (featureID) {
			case ExecutableModelingProfilePackage.XPROTOCOL__BASE_BEHAVIORED_CLASSIFIER:
				setBase_BehavioredClassifier((BehavioredClassifier)null);
				return;
		}
		super.eUnset(featureID);
	}

	/**
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 */
	@Override
	public boolean eIsSet(int featureID) {
		switch (featureID) {
			case ExecutableModelingProfilePackage.XPROTOCOL__BASE_BEHAVIORED_CLASSIFIER:
				return base_BehavioredClassifier != null;
		}
		return super.eIsSet(featureID);
	}

	/**
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 */
	@Override
	@SuppressWarnings("unchecked")
	public Object eInvoke(int operationID, EList<?> arguments) throws InvocationTargetException {
		switch (operationID) {
			case ExecutableModelingProfilePackage.XPROTOCOL___XPROTOCOL_INCOMING_INTERFACE__DIAGNOSTICCHAIN_MAP:
				return xProtocolIncomingInterface((DiagnosticChain)arguments.get(0), (Map<Object, Object>)arguments.get(1));
			case ExecutableModelingProfilePackage.XPROTOCOL___XPROTOCOL_PROTOCOL_CONTAINER__DIAGNOSTICCHAIN_MAP:
				return xProtocolProtocolContainer((DiagnosticChain)arguments.get(0), (Map<Object, Object>)arguments.get(1));
			case ExecutableModelingProfilePackage.XPROTOCOL___XPROTOCOL_OUTGOING_INTERFACE__DIAGNOSTICCHAIN_MAP:
				return xProtocolOutgoingInterface((DiagnosticChain)arguments.get(0), (Map<Object, Object>)arguments.get(1));
			case ExecutableModelingProfilePackage.XPROTOCOL___XPROTOCOL_SYMMETRIC_INTERFACE__DIAGNOSTICCHAIN_MAP:
				return xProtocolSymmetricInterface((DiagnosticChain)arguments.get(0), (Map<Object, Object>)arguments.get(1));
		}
		return super.eInvoke(operationID, arguments);
	}

} //XProtocolImpl
