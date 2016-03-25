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
import com.ericsson.executablemodeling.xtuml.profile.executablemodelingprofile.XFeature;

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

import org.eclipse.uml2.uml.Feature;

/**
 * <!-- begin-user-doc -->
 * An implementation of the model object '<em><b>XFeature</b></em>'.
 * <!-- end-user-doc -->
 * <p>
 * The following features are implemented:
 * </p>
 * <ul>
 *   <li>{@link com.ericsson.executablemodeling.xtuml.profile.executablemodelingprofile.impl.XFeatureImpl#getBase_Feature <em>Base Feature</em>}</li>
 * </ul>
 *
 * @generated
 */
public abstract class XFeatureImpl extends XNamedElementImpl implements XFeature {
	/**
	 * The cached value of the '{@link #getBase_Feature() <em>Base Feature</em>}' reference.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @see #getBase_Feature()
	 * @generated
	 * @ordered
	 */
	protected Feature base_Feature;

	/**
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 */
	protected XFeatureImpl() {
		super();
	}

	/**
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 */
	@Override
	protected EClass eStaticClass() {
		return ExecutableModelingProfilePackage.Literals.XFEATURE;
	}

	/**
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 */
	public Feature getBase_Feature() {
		if (base_Feature != null && base_Feature.eIsProxy()) {
			InternalEObject oldBase_Feature = (InternalEObject)base_Feature;
			base_Feature = (Feature)eResolveProxy(oldBase_Feature);
			if (base_Feature != oldBase_Feature) {
				if (eNotificationRequired())
					eNotify(new ENotificationImpl(this, Notification.RESOLVE, ExecutableModelingProfilePackage.XFEATURE__BASE_FEATURE, oldBase_Feature, base_Feature));
			}
		}
		return base_Feature;
	}

	/**
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 */
	public Feature basicGetBase_Feature() {
		return base_Feature;
	}

	/**
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 */
	public void setBase_Feature(Feature newBase_Feature) {
		Feature oldBase_Feature = base_Feature;
		base_Feature = newBase_Feature;
		if (eNotificationRequired())
			eNotify(new ENotificationImpl(this, Notification.SET, ExecutableModelingProfilePackage.XFEATURE__BASE_FEATURE, oldBase_Feature, base_Feature));
	}

	/**
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 */
	public boolean xFeatureClassifier(DiagnosticChain diagnostics, Map<Object, Object> context) {
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
						 ExecutableModelingProfileValidator.XFEATURE__XFEATURE_CLASSIFIER,
						 EcorePlugin.INSTANCE.getString("_UI_GenericInvariant_diagnostic", new Object[] { "xFeatureClassifier", EObjectValidator.getObjectLabel(this, context) }),
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
			case ExecutableModelingProfilePackage.XFEATURE__BASE_FEATURE:
				if (resolve) return getBase_Feature();
				return basicGetBase_Feature();
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
			case ExecutableModelingProfilePackage.XFEATURE__BASE_FEATURE:
				setBase_Feature((Feature)newValue);
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
			case ExecutableModelingProfilePackage.XFEATURE__BASE_FEATURE:
				setBase_Feature((Feature)null);
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
			case ExecutableModelingProfilePackage.XFEATURE__BASE_FEATURE:
				return base_Feature != null;
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
			case ExecutableModelingProfilePackage.XFEATURE___XFEATURE_CLASSIFIER__DIAGNOSTICCHAIN_MAP:
				return xFeatureClassifier((DiagnosticChain)arguments.get(0), (Map<Object, Object>)arguments.get(1));
		}
		return super.eInvoke(operationID, arguments);
	}

} //XFeatureImpl
