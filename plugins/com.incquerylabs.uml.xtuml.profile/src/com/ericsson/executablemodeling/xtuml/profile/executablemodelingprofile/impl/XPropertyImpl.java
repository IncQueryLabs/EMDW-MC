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
import com.ericsson.executablemodeling.xtuml.profile.executablemodelingprofile.XNamedElement;
import com.ericsson.executablemodeling.xtuml.profile.executablemodelingprofile.XProperty;
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

import org.eclipse.emf.ecore.plugin.EcorePlugin;

import org.eclipse.emf.ecore.util.EObjectValidator;

import org.eclipse.uml2.uml.Feature;
import org.eclipse.uml2.uml.NamedElement;
import org.eclipse.uml2.uml.Property;
import org.eclipse.uml2.uml.TypedElement;

/**
 * <!-- begin-user-doc -->
 * An implementation of the model object '<em><b>XProperty</b></em>'.
 * <!-- end-user-doc -->
 * <p>
 * The following features are implemented:
 * </p>
 * <ul>
 *   <li>{@link com.ericsson.executablemodeling.xtuml.profile.executablemodelingprofile.impl.XPropertyImpl#getBase_NamedElement <em>Base Named Element</em>}</li>
 *   <li>{@link com.ericsson.executablemodeling.xtuml.profile.executablemodelingprofile.impl.XPropertyImpl#getBase_Feature <em>Base Feature</em>}</li>
 *   <li>{@link com.ericsson.executablemodeling.xtuml.profile.executablemodelingprofile.impl.XPropertyImpl#getBase_TypedElement <em>Base Typed Element</em>}</li>
 *   <li>{@link com.ericsson.executablemodeling.xtuml.profile.executablemodelingprofile.impl.XPropertyImpl#getBase_Property <em>Base Property</em>}</li>
 * </ul>
 *
 * @generated
 */
public abstract class XPropertyImpl extends XMultiplicityElementImpl implements XProperty {
	/**
	 * The cached value of the '{@link #getBase_NamedElement() <em>Base Named Element</em>}' reference.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @see #getBase_NamedElement()
	 * @generated
	 * @ordered
	 */
	protected NamedElement base_NamedElement;

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
	 * The cached value of the '{@link #getBase_TypedElement() <em>Base Typed Element</em>}' reference.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @see #getBase_TypedElement()
	 * @generated
	 * @ordered
	 */
	protected TypedElement base_TypedElement;

	/**
	 * The cached value of the '{@link #getBase_Property() <em>Base Property</em>}' reference.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @see #getBase_Property()
	 * @generated
	 * @ordered
	 */
	protected Property base_Property;

	/**
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 */
	protected XPropertyImpl() {
		super();
	}

	/**
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 */
	@Override
	protected EClass eStaticClass() {
		return ExecutableModelingProfilePackage.Literals.XPROPERTY;
	}

	/**
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 */
	public NamedElement getBase_NamedElement() {
		if (base_NamedElement != null && base_NamedElement.eIsProxy()) {
			InternalEObject oldBase_NamedElement = (InternalEObject)base_NamedElement;
			base_NamedElement = (NamedElement)eResolveProxy(oldBase_NamedElement);
			if (base_NamedElement != oldBase_NamedElement) {
				if (eNotificationRequired())
					eNotify(new ENotificationImpl(this, Notification.RESOLVE, ExecutableModelingProfilePackage.XPROPERTY__BASE_NAMED_ELEMENT, oldBase_NamedElement, base_NamedElement));
			}
		}
		return base_NamedElement;
	}

	/**
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 */
	public NamedElement basicGetBase_NamedElement() {
		return base_NamedElement;
	}

	/**
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 */
	public void setBase_NamedElement(NamedElement newBase_NamedElement) {
		NamedElement oldBase_NamedElement = base_NamedElement;
		base_NamedElement = newBase_NamedElement;
		if (eNotificationRequired())
			eNotify(new ENotificationImpl(this, Notification.SET, ExecutableModelingProfilePackage.XPROPERTY__BASE_NAMED_ELEMENT, oldBase_NamedElement, base_NamedElement));
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
					eNotify(new ENotificationImpl(this, Notification.RESOLVE, ExecutableModelingProfilePackage.XPROPERTY__BASE_FEATURE, oldBase_Feature, base_Feature));
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
			eNotify(new ENotificationImpl(this, Notification.SET, ExecutableModelingProfilePackage.XPROPERTY__BASE_FEATURE, oldBase_Feature, base_Feature));
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
					eNotify(new ENotificationImpl(this, Notification.RESOLVE, ExecutableModelingProfilePackage.XPROPERTY__BASE_TYPED_ELEMENT, oldBase_TypedElement, base_TypedElement));
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
			eNotify(new ENotificationImpl(this, Notification.SET, ExecutableModelingProfilePackage.XPROPERTY__BASE_TYPED_ELEMENT, oldBase_TypedElement, base_TypedElement));
	}

	/**
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 */
	public Property getBase_Property() {
		if (base_Property != null && base_Property.eIsProxy()) {
			InternalEObject oldBase_Property = (InternalEObject)base_Property;
			base_Property = (Property)eResolveProxy(oldBase_Property);
			if (base_Property != oldBase_Property) {
				if (eNotificationRequired())
					eNotify(new ENotificationImpl(this, Notification.RESOLVE, ExecutableModelingProfilePackage.XPROPERTY__BASE_PROPERTY, oldBase_Property, base_Property));
			}
		}
		return base_Property;
	}

	/**
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 */
	public Property basicGetBase_Property() {
		return base_Property;
	}

	/**
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 */
	public void setBase_Property(Property newBase_Property) {
		Property oldBase_Property = base_Property;
		base_Property = newBase_Property;
		if (eNotificationRequired())
			eNotify(new ENotificationImpl(this, Notification.SET, ExecutableModelingProfilePackage.XPROPERTY__BASE_PROPERTY, oldBase_Property, base_Property));
	}

	/**
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 */
	public boolean xNamedElementName(DiagnosticChain diagnostics, Map<Object, Object> context) {
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
						 ExecutableModelingProfileValidator.XNAMED_ELEMENT__XNAMED_ELEMENT_NAME,
						 EcorePlugin.INSTANCE.getString("_UI_GenericInvariant_diagnostic", new Object[] { "xNamedElementName", EObjectValidator.getObjectLabel(this, context) }),
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
			case ExecutableModelingProfilePackage.XPROPERTY__BASE_NAMED_ELEMENT:
				if (resolve) return getBase_NamedElement();
				return basicGetBase_NamedElement();
			case ExecutableModelingProfilePackage.XPROPERTY__BASE_FEATURE:
				if (resolve) return getBase_Feature();
				return basicGetBase_Feature();
			case ExecutableModelingProfilePackage.XPROPERTY__BASE_TYPED_ELEMENT:
				if (resolve) return getBase_TypedElement();
				return basicGetBase_TypedElement();
			case ExecutableModelingProfilePackage.XPROPERTY__BASE_PROPERTY:
				if (resolve) return getBase_Property();
				return basicGetBase_Property();
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
			case ExecutableModelingProfilePackage.XPROPERTY__BASE_NAMED_ELEMENT:
				setBase_NamedElement((NamedElement)newValue);
				return;
			case ExecutableModelingProfilePackage.XPROPERTY__BASE_FEATURE:
				setBase_Feature((Feature)newValue);
				return;
			case ExecutableModelingProfilePackage.XPROPERTY__BASE_TYPED_ELEMENT:
				setBase_TypedElement((TypedElement)newValue);
				return;
			case ExecutableModelingProfilePackage.XPROPERTY__BASE_PROPERTY:
				setBase_Property((Property)newValue);
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
			case ExecutableModelingProfilePackage.XPROPERTY__BASE_NAMED_ELEMENT:
				setBase_NamedElement((NamedElement)null);
				return;
			case ExecutableModelingProfilePackage.XPROPERTY__BASE_FEATURE:
				setBase_Feature((Feature)null);
				return;
			case ExecutableModelingProfilePackage.XPROPERTY__BASE_TYPED_ELEMENT:
				setBase_TypedElement((TypedElement)null);
				return;
			case ExecutableModelingProfilePackage.XPROPERTY__BASE_PROPERTY:
				setBase_Property((Property)null);
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
			case ExecutableModelingProfilePackage.XPROPERTY__BASE_NAMED_ELEMENT:
				return base_NamedElement != null;
			case ExecutableModelingProfilePackage.XPROPERTY__BASE_FEATURE:
				return base_Feature != null;
			case ExecutableModelingProfilePackage.XPROPERTY__BASE_TYPED_ELEMENT:
				return base_TypedElement != null;
			case ExecutableModelingProfilePackage.XPROPERTY__BASE_PROPERTY:
				return base_Property != null;
		}
		return super.eIsSet(featureID);
	}

	/**
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 */
	@Override
	public int eBaseStructuralFeatureID(int derivedFeatureID, Class<?> baseClass) {
		if (baseClass == XNamedElement.class) {
			switch (derivedFeatureID) {
				case ExecutableModelingProfilePackage.XPROPERTY__BASE_NAMED_ELEMENT: return ExecutableModelingProfilePackage.XNAMED_ELEMENT__BASE_NAMED_ELEMENT;
				default: return -1;
			}
		}
		if (baseClass == XFeature.class) {
			switch (derivedFeatureID) {
				case ExecutableModelingProfilePackage.XPROPERTY__BASE_FEATURE: return ExecutableModelingProfilePackage.XFEATURE__BASE_FEATURE;
				default: return -1;
			}
		}
		if (baseClass == XTypedElement.class) {
			switch (derivedFeatureID) {
				case ExecutableModelingProfilePackage.XPROPERTY__BASE_TYPED_ELEMENT: return ExecutableModelingProfilePackage.XTYPED_ELEMENT__BASE_TYPED_ELEMENT;
				default: return -1;
			}
		}
		return super.eBaseStructuralFeatureID(derivedFeatureID, baseClass);
	}

	/**
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 */
	@Override
	public int eDerivedStructuralFeatureID(int baseFeatureID, Class<?> baseClass) {
		if (baseClass == XNamedElement.class) {
			switch (baseFeatureID) {
				case ExecutableModelingProfilePackage.XNAMED_ELEMENT__BASE_NAMED_ELEMENT: return ExecutableModelingProfilePackage.XPROPERTY__BASE_NAMED_ELEMENT;
				default: return -1;
			}
		}
		if (baseClass == XFeature.class) {
			switch (baseFeatureID) {
				case ExecutableModelingProfilePackage.XFEATURE__BASE_FEATURE: return ExecutableModelingProfilePackage.XPROPERTY__BASE_FEATURE;
				default: return -1;
			}
		}
		if (baseClass == XTypedElement.class) {
			switch (baseFeatureID) {
				case ExecutableModelingProfilePackage.XTYPED_ELEMENT__BASE_TYPED_ELEMENT: return ExecutableModelingProfilePackage.XPROPERTY__BASE_TYPED_ELEMENT;
				default: return -1;
			}
		}
		return super.eDerivedStructuralFeatureID(baseFeatureID, baseClass);
	}

	/**
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 */
	@Override
	public int eDerivedOperationID(int baseOperationID, Class<?> baseClass) {
		if (baseClass == XNamedElement.class) {
			switch (baseOperationID) {
				case ExecutableModelingProfilePackage.XNAMED_ELEMENT___XNAMED_ELEMENT_NAME__DIAGNOSTICCHAIN_MAP: return ExecutableModelingProfilePackage.XPROPERTY___XNAMED_ELEMENT_NAME__DIAGNOSTICCHAIN_MAP;
				default: return -1;
			}
		}
		if (baseClass == XFeature.class) {
			switch (baseOperationID) {
				case ExecutableModelingProfilePackage.XFEATURE___XFEATURE_CLASSIFIER__DIAGNOSTICCHAIN_MAP: return ExecutableModelingProfilePackage.XPROPERTY___XFEATURE_CLASSIFIER__DIAGNOSTICCHAIN_MAP;
				default: return -1;
			}
		}
		if (baseClass == XTypedElement.class) {
			switch (baseOperationID) {
				case ExecutableModelingProfilePackage.XTYPED_ELEMENT___XTYPED_ELEMENT_TYPE__DIAGNOSTICCHAIN_MAP: return ExecutableModelingProfilePackage.XPROPERTY___XTYPED_ELEMENT_TYPE__DIAGNOSTICCHAIN_MAP;
				default: return -1;
			}
		}
		return super.eDerivedOperationID(baseOperationID, baseClass);
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
			case ExecutableModelingProfilePackage.XPROPERTY___XNAMED_ELEMENT_NAME__DIAGNOSTICCHAIN_MAP:
				return xNamedElementName((DiagnosticChain)arguments.get(0), (Map<Object, Object>)arguments.get(1));
			case ExecutableModelingProfilePackage.XPROPERTY___XFEATURE_CLASSIFIER__DIAGNOSTICCHAIN_MAP:
				return xFeatureClassifier((DiagnosticChain)arguments.get(0), (Map<Object, Object>)arguments.get(1));
			case ExecutableModelingProfilePackage.XPROPERTY___XTYPED_ELEMENT_TYPE__DIAGNOSTICCHAIN_MAP:
				return xTypedElementType((DiagnosticChain)arguments.get(0), (Map<Object, Object>)arguments.get(1));
		}
		return super.eInvoke(operationID, arguments);
	}

} //XPropertyImpl
