/**
 */
package com.incquerylabs.emdw.umlintegration.trace.impl;

import com.incquerylabs.emdw.umlintegration.trace.RootMapping;
import com.incquerylabs.emdw.umlintegration.trace.Trace;
import com.incquerylabs.emdw.umlintegration.trace.TracePackage;

import java.util.Collection;

import org.eclipse.emf.common.notify.Notification;
import org.eclipse.emf.common.notify.NotificationChain;

import org.eclipse.emf.common.util.EList;

import org.eclipse.emf.ecore.EClass;
import org.eclipse.emf.ecore.InternalEObject;

import org.eclipse.emf.ecore.impl.ENotificationImpl;
import org.eclipse.emf.ecore.impl.MinimalEObjectImpl;

import org.eclipse.emf.ecore.util.EObjectContainmentEList;
import org.eclipse.emf.ecore.util.InternalEList;
import org.eclipse.uml2.uml.Model;

/**
 * <!-- begin-user-doc -->
 * An implementation of the model object '<em><b>Root Mapping</b></em>'.
 * <!-- end-user-doc -->
 * <p>
 * The following features are implemented:
 * </p>
 * <ul>
 *   <li>{@link com.incquerylabs.emdw.umlintegration.trace.impl.RootMappingImpl#getUmlRoot <em>Uml Root</em>}</li>
 *   <li>{@link com.incquerylabs.emdw.umlintegration.trace.impl.RootMappingImpl#getXtumlrtRoot <em>Xtumlrt Root</em>}</li>
 *   <li>{@link com.incquerylabs.emdw.umlintegration.trace.impl.RootMappingImpl#getTraces <em>Traces</em>}</li>
 * </ul>
 *
 * @generated
 */
public class RootMappingImpl extends MinimalEObjectImpl.Container implements RootMapping {
	/**
	 * The cached value of the '{@link #getUmlRoot() <em>Uml Root</em>}' reference.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @see #getUmlRoot()
	 * @generated
	 * @ordered
	 */
	protected Model umlRoot;

	/**
	 * The cached value of the '{@link #getXtumlrtRoot() <em>Xtumlrt Root</em>}' reference.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @see #getXtumlrtRoot()
	 * @generated
	 * @ordered
	 */
	protected com.zeligsoft.xtumlrt.common.Model xtumlrtRoot;

	/**
	 * The cached value of the '{@link #getTraces() <em>Traces</em>}' containment reference list.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @see #getTraces()
	 * @generated
	 * @ordered
	 */
	protected EList<Trace> traces;

	/**
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 */
	protected RootMappingImpl() {
		super();
	}

	/**
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 */
	@Override
	protected EClass eStaticClass() {
		return TracePackage.Literals.ROOT_MAPPING;
	}

	/**
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 */
	public Model getUmlRoot() {
		if (umlRoot != null && umlRoot.eIsProxy()) {
			InternalEObject oldUmlRoot = (InternalEObject)umlRoot;
			umlRoot = (Model)eResolveProxy(oldUmlRoot);
			if (umlRoot != oldUmlRoot) {
				if (eNotificationRequired())
					eNotify(new ENotificationImpl(this, Notification.RESOLVE, TracePackage.ROOT_MAPPING__UML_ROOT, oldUmlRoot, umlRoot));
			}
		}
		return umlRoot;
	}

	/**
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 */
	public Model basicGetUmlRoot() {
		return umlRoot;
	}

	/**
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 */
	public void setUmlRoot(Model newUmlRoot) {
		Model oldUmlRoot = umlRoot;
		umlRoot = newUmlRoot;
		if (eNotificationRequired())
			eNotify(new ENotificationImpl(this, Notification.SET, TracePackage.ROOT_MAPPING__UML_ROOT, oldUmlRoot, umlRoot));
	}

	/**
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 */
	public com.zeligsoft.xtumlrt.common.Model getXtumlrtRoot() {
		if (xtumlrtRoot != null && xtumlrtRoot.eIsProxy()) {
			InternalEObject oldXtumlrtRoot = (InternalEObject)xtumlrtRoot;
			xtumlrtRoot = (com.zeligsoft.xtumlrt.common.Model)eResolveProxy(oldXtumlrtRoot);
			if (xtumlrtRoot != oldXtumlrtRoot) {
				if (eNotificationRequired())
					eNotify(new ENotificationImpl(this, Notification.RESOLVE, TracePackage.ROOT_MAPPING__XTUMLRT_ROOT, oldXtumlrtRoot, xtumlrtRoot));
			}
		}
		return xtumlrtRoot;
	}

	/**
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 */
	public com.zeligsoft.xtumlrt.common.Model basicGetXtumlrtRoot() {
		return xtumlrtRoot;
	}

	/**
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 */
	public void setXtumlrtRoot(com.zeligsoft.xtumlrt.common.Model newXtumlrtRoot) {
		com.zeligsoft.xtumlrt.common.Model oldXtumlrtRoot = xtumlrtRoot;
		xtumlrtRoot = newXtumlrtRoot;
		if (eNotificationRequired())
			eNotify(new ENotificationImpl(this, Notification.SET, TracePackage.ROOT_MAPPING__XTUMLRT_ROOT, oldXtumlrtRoot, xtumlrtRoot));
	}

	/**
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 */
	public EList<Trace> getTraces() {
		if (traces == null) {
			traces = new EObjectContainmentEList<Trace>(Trace.class, this, TracePackage.ROOT_MAPPING__TRACES);
		}
		return traces;
	}

	/**
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 */
	@Override
	public NotificationChain eInverseRemove(InternalEObject otherEnd, int featureID, NotificationChain msgs) {
		switch (featureID) {
			case TracePackage.ROOT_MAPPING__TRACES:
				return ((InternalEList<?>)getTraces()).basicRemove(otherEnd, msgs);
		}
		return super.eInverseRemove(otherEnd, featureID, msgs);
	}

	/**
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 */
	@Override
	public Object eGet(int featureID, boolean resolve, boolean coreType) {
		switch (featureID) {
			case TracePackage.ROOT_MAPPING__UML_ROOT:
				if (resolve) return getUmlRoot();
				return basicGetUmlRoot();
			case TracePackage.ROOT_MAPPING__XTUMLRT_ROOT:
				if (resolve) return getXtumlrtRoot();
				return basicGetXtumlrtRoot();
			case TracePackage.ROOT_MAPPING__TRACES:
				return getTraces();
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
			case TracePackage.ROOT_MAPPING__UML_ROOT:
				setUmlRoot((Model)newValue);
				return;
			case TracePackage.ROOT_MAPPING__XTUMLRT_ROOT:
				setXtumlrtRoot((com.zeligsoft.xtumlrt.common.Model)newValue);
				return;
			case TracePackage.ROOT_MAPPING__TRACES:
				getTraces().clear();
				getTraces().addAll((Collection<? extends Trace>)newValue);
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
			case TracePackage.ROOT_MAPPING__UML_ROOT:
				setUmlRoot((Model)null);
				return;
			case TracePackage.ROOT_MAPPING__XTUMLRT_ROOT:
				setXtumlrtRoot((com.zeligsoft.xtumlrt.common.Model)null);
				return;
			case TracePackage.ROOT_MAPPING__TRACES:
				getTraces().clear();
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
			case TracePackage.ROOT_MAPPING__UML_ROOT:
				return umlRoot != null;
			case TracePackage.ROOT_MAPPING__XTUMLRT_ROOT:
				return xtumlrtRoot != null;
			case TracePackage.ROOT_MAPPING__TRACES:
				return traces != null && !traces.isEmpty();
		}
		return super.eIsSet(featureID);
	}

} //RootMappingImpl
