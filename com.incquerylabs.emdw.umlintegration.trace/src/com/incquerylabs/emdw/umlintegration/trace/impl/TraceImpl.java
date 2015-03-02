/**
 */
package com.incquerylabs.emdw.umlintegration.trace.impl;

import com.incquerylabs.emdw.umlintegration.trace.Trace;
import com.incquerylabs.emdw.umlintegration.trace.TracePackage;

import java.util.Collection;

import org.eclipse.emf.common.util.EList;

import org.eclipse.emf.ecore.EClass;

import org.eclipse.emf.ecore.impl.MinimalEObjectImpl;

import org.eclipse.emf.ecore.util.EObjectResolvingEList;

import org.eclipse.uml2.uml.NamedElement;

/**
 * <!-- begin-user-doc -->
 * An implementation of the model object '<em><b>Trace</b></em>'.
 * <!-- end-user-doc -->
 * <p>
 * The following features are implemented:
 * <ul>
 *   <li>{@link com.incquerylabs.emdw.umlintegration.trace.impl.TraceImpl#getUmlElements <em>Uml Elements</em>}</li>
 *   <li>{@link com.incquerylabs.emdw.umlintegration.trace.impl.TraceImpl#getXtumlrtElements <em>Xtumlrt Elements</em>}</li>
 * </ul>
 * </p>
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
	protected EList<NamedElement> umlElements;

	/**
	 * The cached value of the '{@link #getXtumlrtElements() <em>Xtumlrt Elements</em>}' reference list.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @see #getXtumlrtElements()
	 * @generated
	 * @ordered
	 */
	protected EList<com.zeligsoft.xtumlrt.common.NamedElement> xtumlrtElements;

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
	public EList<NamedElement> getUmlElements() {
		if (umlElements == null) {
			umlElements = new EObjectResolvingEList<NamedElement>(NamedElement.class, this, TracePackage.TRACE__UML_ELEMENTS);
		}
		return umlElements;
	}

	/**
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 */
	public EList<com.zeligsoft.xtumlrt.common.NamedElement> getXtumlrtElements() {
		if (xtumlrtElements == null) {
			xtumlrtElements = new EObjectResolvingEList<com.zeligsoft.xtumlrt.common.NamedElement>(com.zeligsoft.xtumlrt.common.NamedElement.class, this, TracePackage.TRACE__XTUMLRT_ELEMENTS);
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
				getUmlElements().addAll((Collection<? extends NamedElement>)newValue);
				return;
			case TracePackage.TRACE__XTUMLRT_ELEMENTS:
				getXtumlrtElements().clear();
				getXtumlrtElements().addAll((Collection<? extends com.zeligsoft.xtumlrt.common.NamedElement>)newValue);
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
