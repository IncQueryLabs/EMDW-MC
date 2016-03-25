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
import com.ericsson.executablemodeling.xtuml.profile.executablemodelingprofile.XTypedElement;

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
import org.eclipse.emf.ecore.impl.MinimalEObjectImpl;

import org.eclipse.emf.ecore.plugin.EcorePlugin;

import org.eclipse.emf.ecore.util.EObjectValidator;

import org.eclipse.uml2.uml.TypedElement;

/**
 * <!-- begin-user-doc -->
 * An implementation of the model object '<em><b>XTyped Element</b></em>'.
 * <!-- end-user-doc -->
 * <p>
 * The following features are implemented:
 * </p>
 * <ul>
 *   <li>{@link com.ericsson.executablemodeling.xtuml.profile.executablemodelingprofile.impl.XTypedElementImpl#getBase_TypedElement <em>Base Typed Element</em>}</li>
 * </ul>
 *
 * @generated
 */
public abstract class XTypedElementImpl extends MinimalEObjectImpl.Container implements XTypedElement {
	/**
	 * The cached value of the '{@link #getBase_TypedElement() <em>Base Typed Element</em>}' reference.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @see #getBase_TypedElement()
	 * @generated
	 * @ordered
	 */
	protected TypedElement base_TypedElement;

	/**
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 */
	protected XTypedElementImpl() {
		super();
	}

	/**
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 */
	@Override
	protected EClass eStaticClass() {
		return ExecutableModelingProfilePackage.Literals.XTYPED_ELEMENT;
	}

	/**
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 */
	public TypedElement getBase_TypedElement() {
		if (base_TypedElement != null && base_TypedElement.eIsProxy()) {
			InternalEObject oldBase_TypedElement = (InternalEObject)base_TypedElement;
			base_TypedElement = (TypedElement)eResolveProxy(oldBase_TypedElement);
			if (base_TypedElement != oldBase_TypedElement) {
				if (eNotificationRequired())
					eNotify(new ENotificationImpl(this, Notification.RESOLVE, ExecutableModelingProfilePackage.XTYPED_ELEMENT__BASE_TYPED_ELEMENT, oldBase_TypedElement, base_TypedElement));
			}
		}
		return base_TypedElement;
	}

	/**
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 */
	public TypedElement basicGetBase_TypedElement() {
		return base_TypedElement;
	}

	/**
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 */
	public void setBase_TypedElement(TypedElement newBase_TypedElement) {
		TypedElement oldBase_TypedElement = base_TypedElement;
		base_TypedElement = newBase_TypedElement;
		if (eNotificationRequired())
			eNotify(new ENotificationImpl(this, Notification.SET, ExecutableModelingProfilePackage.XTYPED_ELEMENT__BASE_TYPED_ELEMENT, oldBase_TypedElement, base_TypedElement));
	}

	/**
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 */
	public boolean xTypedElementType(DiagnosticChain diagnostics, Map<Object, Object> context) {
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
						 ExecutableModelingProfileValidator.XTYPED_ELEMENT__XTYPED_ELEMENT_TYPE,
						 EcorePlugin.INSTANCE.getString("_UI_GenericInvariant_diagnostic", new Object[] { "xTypedElementType", EObjectValidator.getObjectLabel(this, context) }),
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
			case ExecutableModelingProfilePackage.XTYPED_ELEMENT__BASE_TYPED_ELEMENT:
				if (resolve) return getBase_TypedElement();
				return basicGetBase_TypedElement();
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
			case ExecutableModelingProfilePackage.XTYPED_ELEMENT__BASE_TYPED_ELEMENT:
				setBase_TypedElement((TypedElement)newValue);
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
			case ExecutableModelingProfilePackage.XTYPED_ELEMENT__BASE_TYPED_ELEMENT:
				setBase_TypedElement((TypedElement)null);
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
			case ExecutableModelingProfilePackage.XTYPED_ELEMENT__BASE_TYPED_ELEMENT:
				return base_TypedElement != null;
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
			case ExecutableModelingProfilePackage.XTYPED_ELEMENT___XTYPED_ELEMENT_TYPE__DIAGNOSTICCHAIN_MAP:
				return xTypedElementType((DiagnosticChain)arguments.get(0), (Map<Object, Object>)arguments.get(1));
		}
		return super.eInvoke(operationID, arguments);
	}

} //XTypedElementImpl
