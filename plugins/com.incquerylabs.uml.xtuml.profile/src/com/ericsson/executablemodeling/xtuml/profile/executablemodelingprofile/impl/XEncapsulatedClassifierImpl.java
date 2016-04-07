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
import com.ericsson.executablemodeling.xtuml.profile.executablemodelingprofile.XEncapsulatedClassifier;

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

import org.eclipse.uml2.uml.EncapsulatedClassifier;

/**
 * <!-- begin-user-doc -->
 * An implementation of the model object '<em><b>XEncapsulated Classifier</b></em>'.
 * <!-- end-user-doc -->
 * <p>
 * The following features are implemented:
 * </p>
 * <ul>
 *   <li>{@link com.ericsson.executablemodeling.xtuml.profile.executablemodelingprofile.impl.XEncapsulatedClassifierImpl#getBase_EncapsulatedClassifier <em>Base Encapsulated Classifier</em>}</li>
 *   <li>{@link com.ericsson.executablemodeling.xtuml.profile.executablemodelingprofile.impl.XEncapsulatedClassifierImpl#isExternal <em>Is External</em>}</li>
 * </ul>
 *
 * @generated
 */
public abstract class XEncapsulatedClassifierImpl extends XClassifierImpl implements XEncapsulatedClassifier {
	/**
	 * The cached value of the '{@link #getBase_EncapsulatedClassifier() <em>Base Encapsulated Classifier</em>}' reference.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @see #getBase_EncapsulatedClassifier()
	 * @generated
	 * @ordered
	 */
	protected EncapsulatedClassifier base_EncapsulatedClassifier;

	/**
	 * The default value of the '{@link #isExternal() <em>Is External</em>}' attribute.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @see #isExternal()
	 * @generated
	 * @ordered
	 */
	protected static final boolean IS_EXTERNAL_EDEFAULT = false;

	/**
	 * The cached value of the '{@link #isExternal() <em>Is External</em>}' attribute.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @see #isExternal()
	 * @generated
	 * @ordered
	 */
	protected boolean isExternal = IS_EXTERNAL_EDEFAULT;

	/**
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 */
	protected XEncapsulatedClassifierImpl() {
		super();
	}

	/**
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 */
	@Override
	protected EClass eStaticClass() {
		return ExecutableModelingProfilePackage.Literals.XENCAPSULATED_CLASSIFIER;
	}

	/**
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 */
	public EncapsulatedClassifier getBase_EncapsulatedClassifier() {
		if (base_EncapsulatedClassifier != null && base_EncapsulatedClassifier.eIsProxy()) {
			InternalEObject oldBase_EncapsulatedClassifier = (InternalEObject)base_EncapsulatedClassifier;
			base_EncapsulatedClassifier = (EncapsulatedClassifier)eResolveProxy(oldBase_EncapsulatedClassifier);
			if (base_EncapsulatedClassifier != oldBase_EncapsulatedClassifier) {
				if (eNotificationRequired())
					eNotify(new ENotificationImpl(this, Notification.RESOLVE, ExecutableModelingProfilePackage.XENCAPSULATED_CLASSIFIER__BASE_ENCAPSULATED_CLASSIFIER, oldBase_EncapsulatedClassifier, base_EncapsulatedClassifier));
			}
		}
		return base_EncapsulatedClassifier;
	}

	/**
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 */
	public EncapsulatedClassifier basicGetBase_EncapsulatedClassifier() {
		return base_EncapsulatedClassifier;
	}

	/**
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 */
	public void setBase_EncapsulatedClassifier(EncapsulatedClassifier newBase_EncapsulatedClassifier) {
		EncapsulatedClassifier oldBase_EncapsulatedClassifier = base_EncapsulatedClassifier;
		base_EncapsulatedClassifier = newBase_EncapsulatedClassifier;
		if (eNotificationRequired())
			eNotify(new ENotificationImpl(this, Notification.SET, ExecutableModelingProfilePackage.XENCAPSULATED_CLASSIFIER__BASE_ENCAPSULATED_CLASSIFIER, oldBase_EncapsulatedClassifier, base_EncapsulatedClassifier));
	}

	/**
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 */
	public boolean isExternal() {
		return isExternal;
	}

	/**
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 */
	public void setIsExternal(boolean newIsExternal) {
		boolean oldIsExternal = isExternal;
		isExternal = newIsExternal;
		if (eNotificationRequired())
			eNotify(new ENotificationImpl(this, Notification.SET, ExecutableModelingProfilePackage.XENCAPSULATED_CLASSIFIER__IS_EXTERNAL, oldIsExternal, isExternal));
	}

	/**
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 */
	public boolean xEncapsulatedClassifierPorts(DiagnosticChain diagnostics, Map<Object, Object> context) {
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
						 ExecutableModelingProfileValidator.XENCAPSULATED_CLASSIFIER__XENCAPSULATED_CLASSIFIER_PORTS,
						 EcorePlugin.INSTANCE.getString("_UI_GenericInvariant_diagnostic", new Object[] { "xEncapsulatedClassifierPorts", EObjectValidator.getObjectLabel(this, context) }),
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
	public boolean xEncapsulatedClassifierconnectors(DiagnosticChain diagnostics, Map<Object, Object> context) {
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
						 ExecutableModelingProfileValidator.XENCAPSULATED_CLASSIFIER__XENCAPSULATED_CLASSIFIERCONNECTORS,
						 EcorePlugin.INSTANCE.getString("_UI_GenericInvariant_diagnostic", new Object[] { "xEncapsulatedClassifierconnectors", EObjectValidator.getObjectLabel(this, context) }),
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
	public boolean xEncapsulatedClassifierExternal(DiagnosticChain diagnostics, Map<Object, Object> context) {
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
						 ExecutableModelingProfileValidator.XENCAPSULATED_CLASSIFIER__XENCAPSULATED_CLASSIFIER_EXTERNAL,
						 EcorePlugin.INSTANCE.getString("_UI_GenericInvariant_diagnostic", new Object[] { "xEncapsulatedClassifierExternal", EObjectValidator.getObjectLabel(this, context) }),
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
			case ExecutableModelingProfilePackage.XENCAPSULATED_CLASSIFIER__BASE_ENCAPSULATED_CLASSIFIER:
				if (resolve) return getBase_EncapsulatedClassifier();
				return basicGetBase_EncapsulatedClassifier();
			case ExecutableModelingProfilePackage.XENCAPSULATED_CLASSIFIER__IS_EXTERNAL:
				return isExternal();
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
			case ExecutableModelingProfilePackage.XENCAPSULATED_CLASSIFIER__BASE_ENCAPSULATED_CLASSIFIER:
				setBase_EncapsulatedClassifier((EncapsulatedClassifier)newValue);
				return;
			case ExecutableModelingProfilePackage.XENCAPSULATED_CLASSIFIER__IS_EXTERNAL:
				setIsExternal((Boolean)newValue);
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
			case ExecutableModelingProfilePackage.XENCAPSULATED_CLASSIFIER__BASE_ENCAPSULATED_CLASSIFIER:
				setBase_EncapsulatedClassifier((EncapsulatedClassifier)null);
				return;
			case ExecutableModelingProfilePackage.XENCAPSULATED_CLASSIFIER__IS_EXTERNAL:
				setIsExternal(IS_EXTERNAL_EDEFAULT);
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
			case ExecutableModelingProfilePackage.XENCAPSULATED_CLASSIFIER__BASE_ENCAPSULATED_CLASSIFIER:
				return base_EncapsulatedClassifier != null;
			case ExecutableModelingProfilePackage.XENCAPSULATED_CLASSIFIER__IS_EXTERNAL:
				return isExternal != IS_EXTERNAL_EDEFAULT;
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
			case ExecutableModelingProfilePackage.XENCAPSULATED_CLASSIFIER___XENCAPSULATED_CLASSIFIER_PORTS__DIAGNOSTICCHAIN_MAP:
				return xEncapsulatedClassifierPorts((DiagnosticChain)arguments.get(0), (Map<Object, Object>)arguments.get(1));
			case ExecutableModelingProfilePackage.XENCAPSULATED_CLASSIFIER___XENCAPSULATED_CLASSIFIERCONNECTORS__DIAGNOSTICCHAIN_MAP:
				return xEncapsulatedClassifierconnectors((DiagnosticChain)arguments.get(0), (Map<Object, Object>)arguments.get(1));
			case ExecutableModelingProfilePackage.XENCAPSULATED_CLASSIFIER___XENCAPSULATED_CLASSIFIER_EXTERNAL__DIAGNOSTICCHAIN_MAP:
				return xEncapsulatedClassifierExternal((DiagnosticChain)arguments.get(0), (Map<Object, Object>)arguments.get(1));
		}
		return super.eInvoke(operationID, arguments);
	}

	/**
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 */
	@Override
	public String toString() {
		if (eIsProxy()) return super.toString();

		StringBuffer result = new StringBuffer(super.toString());
		result.append(" (isExternal: ");
		result.append(isExternal);
		result.append(')');
		return result.toString();
	}

} //XEncapsulatedClassifierImpl
