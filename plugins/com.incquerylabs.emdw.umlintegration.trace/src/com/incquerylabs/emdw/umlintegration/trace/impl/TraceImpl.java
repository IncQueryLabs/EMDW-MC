/*******************************************************************************
 * Copyright (c) 2015-2016 IncQuery Labs Ltd. and Ericsson AB
 * All rights reserved. This program and the accompanying materials
 * are made available under the terms of the Eclipse Public License v1.0
 * which accompanies this distribution, and is available at
 * http://www.eclipse.org/legal/epl-v10.html
 *
 * Contributors:
 *     Akos Horvath, Abel Hegedus, Zoltan Ujhelyi, Denes Harmath - initial API and implementation
 *******************************************************************************/
/**
 */
package com.incquerylabs.emdw.umlintegration.trace.impl;

import com.incquerylabs.emdw.umlintegration.trace.Trace;
import com.incquerylabs.emdw.umlintegration.trace.TracePackage;
import java.util.Collection;
import org.eclipse.emf.common.util.EList;
import org.eclipse.emf.ecore.EClass;
import org.eclipse.emf.ecore.EObject;
import org.eclipse.emf.ecore.impl.MinimalEObjectImpl;
import org.eclipse.emf.ecore.util.EObjectResolvingEList;
import org.eclipse.uml2.uml.Element;

/**
 * <!-- begin-user-doc -->
 * An implementation of the model object '<em><b>Trace</b></em>'.
 * <!-- end-user-doc -->
 * <p>
 * The following features are implemented:
 * </p>
 * <ul>
 *   <li>{@link com.incquerylabs.emdw.umlintegration.trace.impl.TraceImpl#getUmlElements <em>Uml Elements</em>}</li>
 *   <li>{@link com.incquerylabs.emdw.umlintegration.trace.impl.TraceImpl#getXtumlrtElements <em>Xtumlrt Elements</em>}</li>
 * </ul>
 *
 * @generated
 */
public class TraceImpl extends MinimalEObjectImpl.Container implements Trace {
	/**
     * The cached value of the '{@link #getUmlElements() <em>Uml Elements</em>}' reference list.
     * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
     * @see #getUmlElements()
     * @generated
     * @ordered
     */
	protected EList<Element> umlElements;

	/**
     * The cached value of the '{@link #getXtumlrtElements() <em>Xtumlrt Elements</em>}' reference list.
     * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
     * @see #getXtumlrtElements()
     * @generated
     * @ordered
     */
	protected EList<EObject> xtumlrtElements;

	/**
     * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
     * @generated
     */
	protected TraceImpl() {
        super();
    }

	/**
     * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
     * @generated
     */
	@Override
	protected EClass eStaticClass() {
        return TracePackage.Literals.TRACE;
    }

	/**
     * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
     * @generated
     */
	public EList<Element> getUmlElements() {
        if (umlElements == null) {
            umlElements = new EObjectResolvingEList<Element>(Element.class, this, TracePackage.TRACE__UML_ELEMENTS);
        }
        return umlElements;
    }

	/**
     * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
     * @generated
     */
	public EList<EObject> getXtumlrtElements() {
        if (xtumlrtElements == null) {
            xtumlrtElements = new EObjectResolvingEList<EObject>(EObject.class, this, TracePackage.TRACE__XTUMLRT_ELEMENTS);
        }
        return xtumlrtElements;
    }

	/**
     * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
     * @generated
     */
	@Override
	public Object eGet(int featureID, boolean resolve, boolean coreType) {
        switch (featureID) {
            case TracePackage.TRACE__UML_ELEMENTS:
                return getUmlElements();
            case TracePackage.TRACE__XTUMLRT_ELEMENTS:
                return getXtumlrtElements();
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
            case TracePackage.TRACE__UML_ELEMENTS:
                getUmlElements().clear();
                getUmlElements().addAll((Collection<? extends Element>)newValue);
                return;
            case TracePackage.TRACE__XTUMLRT_ELEMENTS:
                getXtumlrtElements().clear();
                getXtumlrtElements().addAll((Collection<? extends EObject>)newValue);
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
            case TracePackage.TRACE__UML_ELEMENTS:
                getUmlElements().clear();
                return;
            case TracePackage.TRACE__XTUMLRT_ELEMENTS:
                getXtumlrtElements().clear();
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
            case TracePackage.TRACE__UML_ELEMENTS:
                return umlElements != null && !umlElements.isEmpty();
            case TracePackage.TRACE__XTUMLRT_ELEMENTS:
                return xtumlrtElements != null && !xtumlrtElements.isEmpty();
        }
        return super.eIsSet(featureID);
    }

} //TraceImpl
