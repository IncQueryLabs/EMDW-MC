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
import com.ericsson.executablemodeling.xtuml.profile.executablemodelingprofile.XOpaqueBehavior;

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

import org.eclipse.uml2.uml.OpaqueBehavior;

/**
 * <!-- begin-user-doc -->
 * An implementation of the model object '<em><b>XOpaque Behavior</b></em>'.
 * <!-- end-user-doc -->
 * <p>
 * The following features are implemented:
 * </p>
 * <ul>
 *   <li>{@link com.ericsson.executablemodeling.xtuml.profile.executablemodelingprofile.impl.XOpaqueBehaviorImpl#getBase_OpaqueBehavior <em>Base Opaque Behavior</em>}</li>
 *   <li>{@link com.ericsson.executablemodeling.xtuml.profile.executablemodelingprofile.impl.XOpaqueBehaviorImpl#isExternal <em>Is External</em>}</li>
 * </ul>
 *
 * @generated
 */
public abstract class XOpaqueBehaviorImpl extends XActionBehaviorImpl implements XOpaqueBehavior {
	/**
	 * The cached value of the '{@link #getBase_OpaqueBehavior() <em>Base Opaque Behavior</em>}' reference.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @see #getBase_OpaqueBehavior()
	 * @generated
	 * @ordered
	 */
	protected OpaqueBehavior base_OpaqueBehavior;

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
	protected XOpaqueBehaviorImpl() {
		super();
	}

	/**
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 */
	@Override
	protected EClass eStaticClass() {
		return ExecutableModelingProfilePackage.Literals.XOPAQUE_BEHAVIOR;
	}

	/**
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 */
	public OpaqueBehavior getBase_OpaqueBehavior() {
		if (base_OpaqueBehavior != null && base_OpaqueBehavior.eIsProxy()) {
			InternalEObject oldBase_OpaqueBehavior = (InternalEObject)base_OpaqueBehavior;
			base_OpaqueBehavior = (OpaqueBehavior)eResolveProxy(oldBase_OpaqueBehavior);
			if (base_OpaqueBehavior != oldBase_OpaqueBehavior) {
				if (eNotificationRequired())
					eNotify(new ENotificationImpl(this, Notification.RESOLVE, ExecutableModelingProfilePackage.XOPAQUE_BEHAVIOR__BASE_OPAQUE_BEHAVIOR, oldBase_OpaqueBehavior, base_OpaqueBehavior));
			}
		}
		return base_OpaqueBehavior;
	}

	/**
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 */
	public OpaqueBehavior basicGetBase_OpaqueBehavior() {
		return base_OpaqueBehavior;
	}

	/**
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 */
	public void setBase_OpaqueBehavior(OpaqueBehavior newBase_OpaqueBehavior) {
		OpaqueBehavior oldBase_OpaqueBehavior = base_OpaqueBehavior;
		base_OpaqueBehavior = newBase_OpaqueBehavior;
		if (eNotificationRequired())
			eNotify(new ENotificationImpl(this, Notification.SET, ExecutableModelingProfilePackage.XOPAQUE_BEHAVIOR__BASE_OPAQUE_BEHAVIOR, oldBase_OpaqueBehavior, base_OpaqueBehavior));
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
			eNotify(new ENotificationImpl(this, Notification.SET, ExecutableModelingProfilePackage.XOPAQUE_BEHAVIOR__IS_EXTERNAL, oldIsExternal, isExternal));
	}

	/**
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 */
	public boolean xOpaqueBehaviorExternal(DiagnosticChain diagnostics, Map<Object, Object> context) {
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
						 ExecutableModelingProfileValidator.XOPAQUE_BEHAVIOR__XOPAQUE_BEHAVIOR_EXTERNAL,
						 EcorePlugin.INSTANCE.getString("_UI_GenericInvariant_diagnostic", new Object[] { "xOpaqueBehaviorExternal", EObjectValidator.getObjectLabel(this, context) }),
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
			case ExecutableModelingProfilePackage.XOPAQUE_BEHAVIOR__BASE_OPAQUE_BEHAVIOR:
				if (resolve) return getBase_OpaqueBehavior();
				return basicGetBase_OpaqueBehavior();
			case ExecutableModelingProfilePackage.XOPAQUE_BEHAVIOR__IS_EXTERNAL:
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
			case ExecutableModelingProfilePackage.XOPAQUE_BEHAVIOR__BASE_OPAQUE_BEHAVIOR:
				setBase_OpaqueBehavior((OpaqueBehavior)newValue);
				return;
			case ExecutableModelingProfilePackage.XOPAQUE_BEHAVIOR__IS_EXTERNAL:
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
			case ExecutableModelingProfilePackage.XOPAQUE_BEHAVIOR__BASE_OPAQUE_BEHAVIOR:
				setBase_OpaqueBehavior((OpaqueBehavior)null);
				return;
			case ExecutableModelingProfilePackage.XOPAQUE_BEHAVIOR__IS_EXTERNAL:
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
			case ExecutableModelingProfilePackage.XOPAQUE_BEHAVIOR__BASE_OPAQUE_BEHAVIOR:
				return base_OpaqueBehavior != null;
			case ExecutableModelingProfilePackage.XOPAQUE_BEHAVIOR__IS_EXTERNAL:
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
			case ExecutableModelingProfilePackage.XOPAQUE_BEHAVIOR___XOPAQUE_BEHAVIOR_EXTERNAL__DIAGNOSTICCHAIN_MAP:
				return xOpaqueBehaviorExternal((DiagnosticChain)arguments.get(0), (Map<Object, Object>)arguments.get(1));
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

} //XOpaqueBehaviorImpl
