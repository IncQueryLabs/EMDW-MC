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
import com.ericsson.executablemodeling.xtuml.profile.executablemodelingprofile.XGeneralizationSet;

import org.eclipse.emf.common.notify.Notification;

import org.eclipse.emf.ecore.EClass;
import org.eclipse.emf.ecore.InternalEObject;

import org.eclipse.emf.ecore.impl.ENotificationImpl;
import org.eclipse.emf.ecore.impl.MinimalEObjectImpl;

import org.eclipse.uml2.uml.GeneralizationSet;

/**
 * <!-- begin-user-doc -->
 * An implementation of the model object '<em><b>XGeneralization Set</b></em>'.
 * <!-- end-user-doc -->
 * <p>
 * The following features are implemented:
 * </p>
 * <ul>
 *   <li>{@link com.ericsson.executablemodeling.xtuml.profile.executablemodelingprofile.impl.XGeneralizationSetImpl#getBase_GeneralizationSet <em>Base Generalization Set</em>}</li>
 * </ul>
 *
 * @generated
 */
public abstract class XGeneralizationSetImpl extends MinimalEObjectImpl.Container implements XGeneralizationSet {
	/**
	 * The cached value of the '{@link #getBase_GeneralizationSet() <em>Base Generalization Set</em>}' reference.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @see #getBase_GeneralizationSet()
	 * @generated
	 * @ordered
	 */
	protected GeneralizationSet base_GeneralizationSet;

	/**
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 */
	protected XGeneralizationSetImpl() {
		super();
	}

	/**
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 */
	@Override
	protected EClass eStaticClass() {
		return ExecutableModelingProfilePackage.Literals.XGENERALIZATION_SET;
	}

	/**
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 */
	public GeneralizationSet getBase_GeneralizationSet() {
		if (base_GeneralizationSet != null && base_GeneralizationSet.eIsProxy()) {
			InternalEObject oldBase_GeneralizationSet = (InternalEObject)base_GeneralizationSet;
			base_GeneralizationSet = (GeneralizationSet)eResolveProxy(oldBase_GeneralizationSet);
			if (base_GeneralizationSet != oldBase_GeneralizationSet) {
				if (eNotificationRequired())
					eNotify(new ENotificationImpl(this, Notification.RESOLVE, ExecutableModelingProfilePackage.XGENERALIZATION_SET__BASE_GENERALIZATION_SET, oldBase_GeneralizationSet, base_GeneralizationSet));
			}
		}
		return base_GeneralizationSet;
	}

	/**
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 */
	public GeneralizationSet basicGetBase_GeneralizationSet() {
		return base_GeneralizationSet;
	}

	/**
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 */
	public void setBase_GeneralizationSet(GeneralizationSet newBase_GeneralizationSet) {
		GeneralizationSet oldBase_GeneralizationSet = base_GeneralizationSet;
		base_GeneralizationSet = newBase_GeneralizationSet;
		if (eNotificationRequired())
			eNotify(new ENotificationImpl(this, Notification.SET, ExecutableModelingProfilePackage.XGENERALIZATION_SET__BASE_GENERALIZATION_SET, oldBase_GeneralizationSet, base_GeneralizationSet));
	}

	/**
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 */
	@Override
	public Object eGet(int featureID, boolean resolve, boolean coreType) {
		switch (featureID) {
			case ExecutableModelingProfilePackage.XGENERALIZATION_SET__BASE_GENERALIZATION_SET:
				if (resolve) return getBase_GeneralizationSet();
				return basicGetBase_GeneralizationSet();
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
			case ExecutableModelingProfilePackage.XGENERALIZATION_SET__BASE_GENERALIZATION_SET:
				setBase_GeneralizationSet((GeneralizationSet)newValue);
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
			case ExecutableModelingProfilePackage.XGENERALIZATION_SET__BASE_GENERALIZATION_SET:
				setBase_GeneralizationSet((GeneralizationSet)null);
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
			case ExecutableModelingProfilePackage.XGENERALIZATION_SET__BASE_GENERALIZATION_SET:
				return base_GeneralizationSet != null;
		}
		return super.eIsSet(featureID);
	}

} //XGeneralizationSetImpl
