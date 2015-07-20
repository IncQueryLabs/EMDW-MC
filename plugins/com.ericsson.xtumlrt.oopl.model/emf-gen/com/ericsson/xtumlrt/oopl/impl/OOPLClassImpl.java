/**
 */
package com.ericsson.xtumlrt.oopl.impl;

import com.ericsson.xtumlrt.oopl.OOPLClass;
import com.ericsson.xtumlrt.oopl.OOPLClassReferenceStorage;
import com.ericsson.xtumlrt.oopl.OoplPackage;

import java.util.Collection;

import org.eclipse.emf.common.notify.Notification;

import org.eclipse.emf.common.util.EList;

import org.eclipse.emf.ecore.EClass;
import org.eclipse.emf.ecore.InternalEObject;

import org.eclipse.emf.ecore.impl.ENotificationImpl;
import org.eclipse.emf.ecore.impl.MinimalEObjectImpl;

import org.eclipse.emf.ecore.util.EObjectResolvingEList;

import org.eclipse.papyrusrt.xtumlrt.xtuml.XTClass;

/**
 * <!-- begin-user-doc -->
 * An implementation of the model object '<em><b>OOPL Class</b></em>'.
 * <!-- end-user-doc -->
 * <p>
 * The following features are implemented:
 * </p>
 * <ul>
 *   <li>{@link com.ericsson.xtumlrt.oopl.impl.OOPLClassImpl#getXtClass <em>Xt Class</em>}</li>
 *   <li>{@link com.ericsson.xtumlrt.oopl.impl.OOPLClassImpl#getReferenceStorage <em>Reference Storage</em>}</li>
 * </ul>
 *
 * @generated
 */
public abstract class OOPLClassImpl extends MinimalEObjectImpl.Container implements OOPLClass {
    /**
     * The cached value of the '{@link #getXtClass() <em>Xt Class</em>}' reference.
     * <!-- begin-user-doc -->
     * <!-- end-user-doc -->
     * @see #getXtClass()
     * @generated
     * @ordered
     */
    protected XTClass xtClass;

    /**
     * The cached value of the '{@link #getReferenceStorage() <em>Reference Storage</em>}' reference list.
     * <!-- begin-user-doc -->
     * <!-- end-user-doc -->
     * @see #getReferenceStorage()
     * @generated
     * @ordered
     */
    protected EList<OOPLClassReferenceStorage> referenceStorage;

    /**
     * <!-- begin-user-doc -->
     * <!-- end-user-doc -->
     * @generated
     */
    protected OOPLClassImpl() {
        super();
    }

    /**
     * <!-- begin-user-doc -->
     * <!-- end-user-doc -->
     * @generated
     */
    @Override
    protected EClass eStaticClass() {
        return OoplPackage.Literals.OOPL_CLASS;
    }

    /**
     * <!-- begin-user-doc -->
     * <!-- end-user-doc -->
     * @generated
     */
    public XTClass getXtClass() {
        if (xtClass != null && xtClass.eIsProxy()) {
            InternalEObject oldXtClass = (InternalEObject)xtClass;
            xtClass = (XTClass)eResolveProxy(oldXtClass);
            if (xtClass != oldXtClass) {
                if (eNotificationRequired())
                    eNotify(new ENotificationImpl(this, Notification.RESOLVE, OoplPackage.OOPL_CLASS__XT_CLASS, oldXtClass, xtClass));
            }
        }
        return xtClass;
    }

    /**
     * <!-- begin-user-doc -->
     * <!-- end-user-doc -->
     * @generated
     */
    public XTClass basicGetXtClass() {
        return xtClass;
    }

    /**
     * <!-- begin-user-doc -->
     * <!-- end-user-doc -->
     * @generated
     */
    public void setXtClass(XTClass newXtClass) {
        XTClass oldXtClass = xtClass;
        xtClass = newXtClass;
        if (eNotificationRequired())
            eNotify(new ENotificationImpl(this, Notification.SET, OoplPackage.OOPL_CLASS__XT_CLASS, oldXtClass, xtClass));
    }

    /**
     * <!-- begin-user-doc -->
     * <!-- end-user-doc -->
     * @generated
     */
    public EList<OOPLClassReferenceStorage> getReferenceStorage() {
        if (referenceStorage == null) {
            referenceStorage = new EObjectResolvingEList<OOPLClassReferenceStorage>(OOPLClassReferenceStorage.class, this, OoplPackage.OOPL_CLASS__REFERENCE_STORAGE);
        }
        return referenceStorage;
    }

    /**
     * <!-- begin-user-doc -->
     * <!-- end-user-doc -->
     * @generated
     */
    @Override
    public Object eGet(int featureID, boolean resolve, boolean coreType) {
        switch (featureID) {
            case OoplPackage.OOPL_CLASS__XT_CLASS:
                if (resolve) return getXtClass();
                return basicGetXtClass();
            case OoplPackage.OOPL_CLASS__REFERENCE_STORAGE:
                return getReferenceStorage();
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
            case OoplPackage.OOPL_CLASS__XT_CLASS:
                setXtClass((XTClass)newValue);
                return;
            case OoplPackage.OOPL_CLASS__REFERENCE_STORAGE:
                getReferenceStorage().clear();
                getReferenceStorage().addAll((Collection<? extends OOPLClassReferenceStorage>)newValue);
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
            case OoplPackage.OOPL_CLASS__XT_CLASS:
                setXtClass((XTClass)null);
                return;
            case OoplPackage.OOPL_CLASS__REFERENCE_STORAGE:
                getReferenceStorage().clear();
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
            case OoplPackage.OOPL_CLASS__XT_CLASS:
                return xtClass != null;
            case OoplPackage.OOPL_CLASS__REFERENCE_STORAGE:
                return referenceStorage != null && !referenceStorage.isEmpty();
        }
        return super.eIsSet(featureID);
    }

} //OOPLClassImpl
