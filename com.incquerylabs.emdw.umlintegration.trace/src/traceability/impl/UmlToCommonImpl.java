/**
 */
package traceability.impl;

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

import traceability.TraceabilityPackage;
import traceability.UmlToCommon;
import traceability.UmlToCommonTrace;

/**
 * <!-- begin-user-doc -->
 * An implementation of the model object '<em><b>Uml To Common</b></em>'.
 * <!-- end-user-doc -->
 * <p>
 * The following features are implemented:
 * <ul>
 *   <li>{@link traceability.impl.UmlToCommonImpl#getUml <em>Uml</em>}</li>
 *   <li>{@link traceability.impl.UmlToCommonImpl#getCommon <em>Common</em>}</li>
 *   <li>{@link traceability.impl.UmlToCommonImpl#getTraces <em>Traces</em>}</li>
 * </ul>
 * </p>
 *
 * @generated
 */
public class UmlToCommonImpl extends MinimalEObjectImpl.Container implements UmlToCommon {
	/**
	 * The cached value of the '{@link #getUml() <em>Uml</em>}' reference.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @see #getUml()
	 * @generated
	 * @ordered
	 */
	protected org.eclipse.uml2.uml.Package uml;

	/**
	 * The cached value of the '{@link #getCommon() <em>Common</em>}' reference.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @see #getCommon()
	 * @generated
	 * @ordered
	 */
	protected com.zeligsoft.xtumlrt.common.Package common;

	/**
	 * The cached value of the '{@link #getTraces() <em>Traces</em>}' containment reference list.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @see #getTraces()
	 * @generated
	 * @ordered
	 */
	protected EList<UmlToCommonTrace> traces;

	/**
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 */
	protected UmlToCommonImpl() {
		super();
	}

	/**
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 */
	@Override
	protected EClass eStaticClass() {
		return TraceabilityPackage.Literals.UML_TO_COMMON;
	}

	/**
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 */
	public org.eclipse.uml2.uml.Package getUml() {
		if (uml != null && uml.eIsProxy()) {
			InternalEObject oldUml = (InternalEObject)uml;
			uml = (org.eclipse.uml2.uml.Package)eResolveProxy(oldUml);
			if (uml != oldUml) {
				if (eNotificationRequired())
					eNotify(new ENotificationImpl(this, Notification.RESOLVE, TraceabilityPackage.UML_TO_COMMON__UML, oldUml, uml));
			}
		}
		return uml;
	}

	/**
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 */
	public org.eclipse.uml2.uml.Package basicGetUml() {
		return uml;
	}

	/**
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 */
	public void setUml(org.eclipse.uml2.uml.Package newUml) {
		org.eclipse.uml2.uml.Package oldUml = uml;
		uml = newUml;
		if (eNotificationRequired())
			eNotify(new ENotificationImpl(this, Notification.SET, TraceabilityPackage.UML_TO_COMMON__UML, oldUml, uml));
	}

	/**
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 */
	public com.zeligsoft.xtumlrt.common.Package getCommon() {
		if (common != null && common.eIsProxy()) {
			InternalEObject oldCommon = (InternalEObject)common;
			common = (com.zeligsoft.xtumlrt.common.Package)eResolveProxy(oldCommon);
			if (common != oldCommon) {
				if (eNotificationRequired())
					eNotify(new ENotificationImpl(this, Notification.RESOLVE, TraceabilityPackage.UML_TO_COMMON__COMMON, oldCommon, common));
			}
		}
		return common;
	}

	/**
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 */
	public com.zeligsoft.xtumlrt.common.Package basicGetCommon() {
		return common;
	}

	/**
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 */
	public void setCommon(com.zeligsoft.xtumlrt.common.Package newCommon) {
		com.zeligsoft.xtumlrt.common.Package oldCommon = common;
		common = newCommon;
		if (eNotificationRequired())
			eNotify(new ENotificationImpl(this, Notification.SET, TraceabilityPackage.UML_TO_COMMON__COMMON, oldCommon, common));
	}

	/**
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 */
	public EList<UmlToCommonTrace> getTraces() {
		if (traces == null) {
			traces = new EObjectContainmentEList<UmlToCommonTrace>(UmlToCommonTrace.class, this, TraceabilityPackage.UML_TO_COMMON__TRACES);
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
			case TraceabilityPackage.UML_TO_COMMON__TRACES:
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
			case TraceabilityPackage.UML_TO_COMMON__UML:
				if (resolve) return getUml();
				return basicGetUml();
			case TraceabilityPackage.UML_TO_COMMON__COMMON:
				if (resolve) return getCommon();
				return basicGetCommon();
			case TraceabilityPackage.UML_TO_COMMON__TRACES:
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
			case TraceabilityPackage.UML_TO_COMMON__UML:
				setUml((org.eclipse.uml2.uml.Package)newValue);
				return;
			case TraceabilityPackage.UML_TO_COMMON__COMMON:
				setCommon((com.zeligsoft.xtumlrt.common.Package)newValue);
				return;
			case TraceabilityPackage.UML_TO_COMMON__TRACES:
				getTraces().clear();
				getTraces().addAll((Collection<? extends UmlToCommonTrace>)newValue);
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
			case TraceabilityPackage.UML_TO_COMMON__UML:
				setUml((org.eclipse.uml2.uml.Package)null);
				return;
			case TraceabilityPackage.UML_TO_COMMON__COMMON:
				setCommon((com.zeligsoft.xtumlrt.common.Package)null);
				return;
			case TraceabilityPackage.UML_TO_COMMON__TRACES:
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
			case TraceabilityPackage.UML_TO_COMMON__UML:
				return uml != null;
			case TraceabilityPackage.UML_TO_COMMON__COMMON:
				return common != null;
			case TraceabilityPackage.UML_TO_COMMON__TRACES:
				return traces != null && !traces.isEmpty();
		}
		return super.eIsSet(featureID);
	}

} //UmlToCommonImpl
