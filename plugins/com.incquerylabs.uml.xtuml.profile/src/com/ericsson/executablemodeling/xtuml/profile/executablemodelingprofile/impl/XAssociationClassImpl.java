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
import com.ericsson.executablemodeling.xtuml.profile.executablemodelingprofile.XAssociation;
import com.ericsson.executablemodeling.xtuml.profile.executablemodelingprofile.XAssociationClass;

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

import org.eclipse.uml2.uml.Association;
import org.eclipse.uml2.uml.AssociationClass;

/**
 * <!-- begin-user-doc -->
 * An implementation of the model object '<em><b>XAssociation Class</b></em>'.
 * <!-- end-user-doc -->
 * <p>
 * The following features are implemented:
 * </p>
 * <ul>
 *   <li>{@link com.ericsson.executablemodeling.xtuml.profile.executablemodelingprofile.impl.XAssociationClassImpl#getBase_Association <em>Base Association</em>}</li>
 *   <li>{@link com.ericsson.executablemodeling.xtuml.profile.executablemodelingprofile.impl.XAssociationClassImpl#getBase_AssociationClass <em>Base Association Class</em>}</li>
 * </ul>
 *
 * @generated
 */
public abstract class XAssociationClassImpl extends XClassifierImpl implements XAssociationClass {
	/**
	 * The cached value of the '{@link #getBase_Association() <em>Base Association</em>}' reference.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @see #getBase_Association()
	 * @generated
	 * @ordered
	 */
	protected Association base_Association;

	/**
	 * The cached value of the '{@link #getBase_AssociationClass() <em>Base Association Class</em>}' reference.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @see #getBase_AssociationClass()
	 * @generated
	 * @ordered
	 */
	protected AssociationClass base_AssociationClass;

	/**
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 */
	protected XAssociationClassImpl() {
		super();
	}

	/**
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 */
	@Override
	protected EClass eStaticClass() {
		return ExecutableModelingProfilePackage.Literals.XASSOCIATION_CLASS;
	}

	/**
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 */
	public Association getBase_Association() {
		if (base_Association != null && base_Association.eIsProxy()) {
			InternalEObject oldBase_Association = (InternalEObject)base_Association;
			base_Association = (Association)eResolveProxy(oldBase_Association);
			if (base_Association != oldBase_Association) {
				if (eNotificationRequired())
					eNotify(new ENotificationImpl(this, Notification.RESOLVE, ExecutableModelingProfilePackage.XASSOCIATION_CLASS__BASE_ASSOCIATION, oldBase_Association, base_Association));
			}
		}
		return base_Association;
	}

	/**
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 */
	public Association basicGetBase_Association() {
		return base_Association;
	}

	/**
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 */
	public void setBase_Association(Association newBase_Association) {
		Association oldBase_Association = base_Association;
		base_Association = newBase_Association;
		if (eNotificationRequired())
			eNotify(new ENotificationImpl(this, Notification.SET, ExecutableModelingProfilePackage.XASSOCIATION_CLASS__BASE_ASSOCIATION, oldBase_Association, base_Association));
	}

	/**
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 */
	public AssociationClass getBase_AssociationClass() {
		if (base_AssociationClass != null && base_AssociationClass.eIsProxy()) {
			InternalEObject oldBase_AssociationClass = (InternalEObject)base_AssociationClass;
			base_AssociationClass = (AssociationClass)eResolveProxy(oldBase_AssociationClass);
			if (base_AssociationClass != oldBase_AssociationClass) {
				if (eNotificationRequired())
					eNotify(new ENotificationImpl(this, Notification.RESOLVE, ExecutableModelingProfilePackage.XASSOCIATION_CLASS__BASE_ASSOCIATION_CLASS, oldBase_AssociationClass, base_AssociationClass));
			}
		}
		return base_AssociationClass;
	}

	/**
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 */
	public AssociationClass basicGetBase_AssociationClass() {
		return base_AssociationClass;
	}

	/**
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 */
	public void setBase_AssociationClass(AssociationClass newBase_AssociationClass) {
		AssociationClass oldBase_AssociationClass = base_AssociationClass;
		base_AssociationClass = newBase_AssociationClass;
		if (eNotificationRequired())
			eNotify(new ENotificationImpl(this, Notification.SET, ExecutableModelingProfilePackage.XASSOCIATION_CLASS__BASE_ASSOCIATION_CLASS, oldBase_AssociationClass, base_AssociationClass));
	}

	/**
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 */
	public boolean xAssociationIsBinary(DiagnosticChain diagnostics, Map<Object, Object> context) {
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
						 ExecutableModelingProfileValidator.XASSOCIATION__XASSOCIATION_IS_BINARY,
						 EcorePlugin.INSTANCE.getString("_UI_GenericInvariant_diagnostic", new Object[] { "xAssociationIsBinary", EObjectValidator.getObjectLabel(this, context) }),
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
			case ExecutableModelingProfilePackage.XASSOCIATION_CLASS__BASE_ASSOCIATION:
				if (resolve) return getBase_Association();
				return basicGetBase_Association();
			case ExecutableModelingProfilePackage.XASSOCIATION_CLASS__BASE_ASSOCIATION_CLASS:
				if (resolve) return getBase_AssociationClass();
				return basicGetBase_AssociationClass();
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
			case ExecutableModelingProfilePackage.XASSOCIATION_CLASS__BASE_ASSOCIATION:
				setBase_Association((Association)newValue);
				return;
			case ExecutableModelingProfilePackage.XASSOCIATION_CLASS__BASE_ASSOCIATION_CLASS:
				setBase_AssociationClass((AssociationClass)newValue);
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
			case ExecutableModelingProfilePackage.XASSOCIATION_CLASS__BASE_ASSOCIATION:
				setBase_Association((Association)null);
				return;
			case ExecutableModelingProfilePackage.XASSOCIATION_CLASS__BASE_ASSOCIATION_CLASS:
				setBase_AssociationClass((AssociationClass)null);
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
			case ExecutableModelingProfilePackage.XASSOCIATION_CLASS__BASE_ASSOCIATION:
				return base_Association != null;
			case ExecutableModelingProfilePackage.XASSOCIATION_CLASS__BASE_ASSOCIATION_CLASS:
				return base_AssociationClass != null;
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
		if (baseClass == XAssociation.class) {
			switch (derivedFeatureID) {
				case ExecutableModelingProfilePackage.XASSOCIATION_CLASS__BASE_ASSOCIATION: return ExecutableModelingProfilePackage.XASSOCIATION__BASE_ASSOCIATION;
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
		if (baseClass == XAssociation.class) {
			switch (baseFeatureID) {
				case ExecutableModelingProfilePackage.XASSOCIATION__BASE_ASSOCIATION: return ExecutableModelingProfilePackage.XASSOCIATION_CLASS__BASE_ASSOCIATION;
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
		if (baseClass == XAssociation.class) {
			switch (baseOperationID) {
				case ExecutableModelingProfilePackage.XASSOCIATION___XASSOCIATION_IS_BINARY__DIAGNOSTICCHAIN_MAP: return ExecutableModelingProfilePackage.XASSOCIATION_CLASS___XASSOCIATION_IS_BINARY__DIAGNOSTICCHAIN_MAP;
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
			case ExecutableModelingProfilePackage.XASSOCIATION_CLASS___XASSOCIATION_IS_BINARY__DIAGNOSTICCHAIN_MAP:
				return xAssociationIsBinary((DiagnosticChain)arguments.get(0), (Map<Object, Object>)arguments.get(1));
		}
		return super.eInvoke(operationID, arguments);
	}

} //XAssociationClassImpl
