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
import com.ericsson.executablemodeling.xtuml.profile.executablemodelingprofile.XMultiplicityElement;

import com.ericsson.executablemodeling.xtuml.profile.executablemodelingprofile.util.ExecutableModelingProfileValidator;

import java.lang.reflect.InvocationTargetException;

import java.util.Collection;
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

import org.eclipse.emf.ecore.util.EObjectResolvingEList;
import org.eclipse.emf.ecore.util.EObjectValidator;

import org.eclipse.uml2.uml.MultiplicityElement;
import org.eclipse.uml2.uml.Property;
import org.eclipse.uml2.uml.Type;

/**
 * <!-- begin-user-doc -->
 * An implementation of the model object '<em><b>XMultiplicity Element</b></em>'.
 * <!-- end-user-doc -->
 * <p>
 * The following features are implemented:
 * </p>
 * <ul>
 *   <li>{@link com.ericsson.executablemodeling.xtuml.profile.executablemodelingprofile.impl.XMultiplicityElementImpl#getBase_MultiplicityElement <em>Base Multiplicity Element</em>}</li>
 *   <li>{@link com.ericsson.executablemodeling.xtuml.profile.executablemodelingprofile.impl.XMultiplicityElementImpl#isOrderedByValue <em>Is Ordered By Value</em>}</li>
 *   <li>{@link com.ericsson.executablemodeling.xtuml.profile.executablemodelingprofile.impl.XMultiplicityElementImpl#getKey <em>Key</em>}</li>
 *   <li>{@link com.ericsson.executablemodeling.xtuml.profile.executablemodelingprofile.impl.XMultiplicityElementImpl#isDescending <em>Is Descending</em>}</li>
 * </ul>
 *
 * @generated
 */
public abstract class XMultiplicityElementImpl extends MinimalEObjectImpl.Container implements XMultiplicityElement {
	/**
	 * The cached value of the '{@link #getBase_MultiplicityElement() <em>Base Multiplicity Element</em>}' reference.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @see #getBase_MultiplicityElement()
	 * @generated
	 * @ordered
	 */
	protected MultiplicityElement base_MultiplicityElement;

	/**
	 * The default value of the '{@link #isOrderedByValue() <em>Is Ordered By Value</em>}' attribute.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @see #isOrderedByValue()
	 * @generated
	 * @ordered
	 */
	protected static final boolean IS_ORDERED_BY_VALUE_EDEFAULT = false;

	/**
	 * The cached value of the '{@link #isOrderedByValue() <em>Is Ordered By Value</em>}' attribute.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @see #isOrderedByValue()
	 * @generated
	 * @ordered
	 */
	protected boolean isOrderedByValue = IS_ORDERED_BY_VALUE_EDEFAULT;

	/**
	 * The cached value of the '{@link #getKey() <em>Key</em>}' reference list.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @see #getKey()
	 * @generated
	 * @ordered
	 */
	protected EList<Property> key;

	/**
	 * The default value of the '{@link #isDescending() <em>Is Descending</em>}' attribute.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @see #isDescending()
	 * @generated
	 * @ordered
	 */
	protected static final boolean IS_DESCENDING_EDEFAULT = false;

	/**
	 * The cached value of the '{@link #isDescending() <em>Is Descending</em>}' attribute.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @see #isDescending()
	 * @generated
	 * @ordered
	 */
	protected boolean isDescending = IS_DESCENDING_EDEFAULT;

	/**
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 */
	protected XMultiplicityElementImpl() {
		super();
	}

	/**
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 */
	@Override
	protected EClass eStaticClass() {
		return ExecutableModelingProfilePackage.Literals.XMULTIPLICITY_ELEMENT;
	}

	/**
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 */
	public MultiplicityElement getBase_MultiplicityElement() {
		if (base_MultiplicityElement != null && base_MultiplicityElement.eIsProxy()) {
			InternalEObject oldBase_MultiplicityElement = (InternalEObject)base_MultiplicityElement;
			base_MultiplicityElement = (MultiplicityElement)eResolveProxy(oldBase_MultiplicityElement);
			if (base_MultiplicityElement != oldBase_MultiplicityElement) {
				if (eNotificationRequired())
					eNotify(new ENotificationImpl(this, Notification.RESOLVE, ExecutableModelingProfilePackage.XMULTIPLICITY_ELEMENT__BASE_MULTIPLICITY_ELEMENT, oldBase_MultiplicityElement, base_MultiplicityElement));
			}
		}
		return base_MultiplicityElement;
	}

	/**
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 */
	public MultiplicityElement basicGetBase_MultiplicityElement() {
		return base_MultiplicityElement;
	}

	/**
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 */
	public void setBase_MultiplicityElement(MultiplicityElement newBase_MultiplicityElement) {
		MultiplicityElement oldBase_MultiplicityElement = base_MultiplicityElement;
		base_MultiplicityElement = newBase_MultiplicityElement;
		if (eNotificationRequired())
			eNotify(new ENotificationImpl(this, Notification.SET, ExecutableModelingProfilePackage.XMULTIPLICITY_ELEMENT__BASE_MULTIPLICITY_ELEMENT, oldBase_MultiplicityElement, base_MultiplicityElement));
	}

	/**
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 */
	public boolean isOrderedByValue() {
		return isOrderedByValue;
	}

	/**
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 */
	public void setIsOrderedByValue(boolean newIsOrderedByValue) {
		boolean oldIsOrderedByValue = isOrderedByValue;
		isOrderedByValue = newIsOrderedByValue;
		if (eNotificationRequired())
			eNotify(new ENotificationImpl(this, Notification.SET, ExecutableModelingProfilePackage.XMULTIPLICITY_ELEMENT__IS_ORDERED_BY_VALUE, oldIsOrderedByValue, isOrderedByValue));
	}

	/**
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 */
	public EList<Property> getKey() {
		if (key == null) {
			key = new EObjectResolvingEList<Property>(Property.class, this, ExecutableModelingProfilePackage.XMULTIPLICITY_ELEMENT__KEY);
		}
		return key;
	}

	/**
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 */
	public Property getKey(String name, Type type) {
		return getKey(name, type, false, null);
	}

	/**
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 */
	public Property getKey(String name, Type type, boolean ignoreCase, EClass eClass) {
		keyLoop: for (Property key : getKey()) {
			if (eClass != null && !eClass.isInstance(key))
				continue keyLoop;
			if (name != null && !(ignoreCase ? name.equalsIgnoreCase(key.getName()) : name.equals(key.getName())))
				continue keyLoop;
			if (type != null && !type.equals(key.getType()))
				continue keyLoop;
			return key;
		}
		return null;
	}

	/**
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 */
	public boolean isDescending() {
		return isDescending;
	}

	/**
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 */
	public void setIsDescending(boolean newIsDescending) {
		boolean oldIsDescending = isDescending;
		isDescending = newIsDescending;
		if (eNotificationRequired())
			eNotify(new ENotificationImpl(this, Notification.SET, ExecutableModelingProfilePackage.XMULTIPLICITY_ELEMENT__IS_DESCENDING, oldIsDescending, isDescending));
	}

	/**
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 */
	public boolean xMultiplicityElementIsOrderedByValue(DiagnosticChain diagnostics, Map<Object, Object> context) {
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
						 ExecutableModelingProfileValidator.XMULTIPLICITY_ELEMENT__XMULTIPLICITY_ELEMENT_IS_ORDERED_BY_VALUE,
						 EcorePlugin.INSTANCE.getString("_UI_GenericInvariant_diagnostic", new Object[] { "xMultiplicityElementIsOrderedByValue", EObjectValidator.getObjectLabel(this, context) }),
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
	public boolean xMultiplicityElementKeys(DiagnosticChain diagnostics, Map<Object, Object> context) {
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
						 ExecutableModelingProfileValidator.XMULTIPLICITY_ELEMENT__XMULTIPLICITY_ELEMENT_KEYS,
						 EcorePlugin.INSTANCE.getString("_UI_GenericInvariant_diagnostic", new Object[] { "xMultiplicityElementKeys", EObjectValidator.getObjectLabel(this, context) }),
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
			case ExecutableModelingProfilePackage.XMULTIPLICITY_ELEMENT__BASE_MULTIPLICITY_ELEMENT:
				if (resolve) return getBase_MultiplicityElement();
				return basicGetBase_MultiplicityElement();
			case ExecutableModelingProfilePackage.XMULTIPLICITY_ELEMENT__IS_ORDERED_BY_VALUE:
				return isOrderedByValue();
			case ExecutableModelingProfilePackage.XMULTIPLICITY_ELEMENT__KEY:
				return getKey();
			case ExecutableModelingProfilePackage.XMULTIPLICITY_ELEMENT__IS_DESCENDING:
				return isDescending();
		}
		return super.eGet(featureID, resolve, coreType);
	}

	/**
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 */
	@SuppressWarnings("unchecked")
	@Override
	public void eSet(int featureID, Object newValue) {
		switch (featureID) {
			case ExecutableModelingProfilePackage.XMULTIPLICITY_ELEMENT__BASE_MULTIPLICITY_ELEMENT:
				setBase_MultiplicityElement((MultiplicityElement)newValue);
				return;
			case ExecutableModelingProfilePackage.XMULTIPLICITY_ELEMENT__IS_ORDERED_BY_VALUE:
				setIsOrderedByValue((Boolean)newValue);
				return;
			case ExecutableModelingProfilePackage.XMULTIPLICITY_ELEMENT__KEY:
				getKey().clear();
				getKey().addAll((Collection<? extends Property>)newValue);
				return;
			case ExecutableModelingProfilePackage.XMULTIPLICITY_ELEMENT__IS_DESCENDING:
				setIsDescending((Boolean)newValue);
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
			case ExecutableModelingProfilePackage.XMULTIPLICITY_ELEMENT__BASE_MULTIPLICITY_ELEMENT:
				setBase_MultiplicityElement((MultiplicityElement)null);
				return;
			case ExecutableModelingProfilePackage.XMULTIPLICITY_ELEMENT__IS_ORDERED_BY_VALUE:
				setIsOrderedByValue(IS_ORDERED_BY_VALUE_EDEFAULT);
				return;
			case ExecutableModelingProfilePackage.XMULTIPLICITY_ELEMENT__KEY:
				getKey().clear();
				return;
			case ExecutableModelingProfilePackage.XMULTIPLICITY_ELEMENT__IS_DESCENDING:
				setIsDescending(IS_DESCENDING_EDEFAULT);
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
			case ExecutableModelingProfilePackage.XMULTIPLICITY_ELEMENT__BASE_MULTIPLICITY_ELEMENT:
				return base_MultiplicityElement != null;
			case ExecutableModelingProfilePackage.XMULTIPLICITY_ELEMENT__IS_ORDERED_BY_VALUE:
				return isOrderedByValue != IS_ORDERED_BY_VALUE_EDEFAULT;
			case ExecutableModelingProfilePackage.XMULTIPLICITY_ELEMENT__KEY:
				return key != null && !key.isEmpty();
			case ExecutableModelingProfilePackage.XMULTIPLICITY_ELEMENT__IS_DESCENDING:
				return isDescending != IS_DESCENDING_EDEFAULT;
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
			case ExecutableModelingProfilePackage.XMULTIPLICITY_ELEMENT___XMULTIPLICITY_ELEMENT_IS_ORDERED_BY_VALUE__DIAGNOSTICCHAIN_MAP:
				return xMultiplicityElementIsOrderedByValue((DiagnosticChain)arguments.get(0), (Map<Object, Object>)arguments.get(1));
			case ExecutableModelingProfilePackage.XMULTIPLICITY_ELEMENT___XMULTIPLICITY_ELEMENT_KEYS__DIAGNOSTICCHAIN_MAP:
				return xMultiplicityElementKeys((DiagnosticChain)arguments.get(0), (Map<Object, Object>)arguments.get(1));
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
		result.append(" (isOrderedByValue: ");
		result.append(isOrderedByValue);
		result.append(", isDescending: ");
		result.append(isDescending);
		result.append(')');
		return result.toString();
	}

} //XMultiplicityElementImpl
