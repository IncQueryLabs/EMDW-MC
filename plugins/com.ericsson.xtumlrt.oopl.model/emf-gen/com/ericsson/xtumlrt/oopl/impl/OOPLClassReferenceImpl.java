/**
 */
package com.ericsson.xtumlrt.oopl.impl;

import com.ericsson.xtumlrt.oopl.OOPLClass;
import com.ericsson.xtumlrt.oopl.OOPLClassReference;
import com.ericsson.xtumlrt.oopl.OoplPackage;

import org.eclipse.emf.common.notify.Notification;

import org.eclipse.emf.ecore.EClass;
import org.eclipse.emf.ecore.InternalEObject;

import org.eclipse.emf.ecore.impl.ENotificationImpl;

/**
 * <!-- begin-user-doc -->
 * An implementation of the model object '<em><b>OOPL Class Reference</b></em>'.
 * <!-- end-user-doc -->
 * <p>
 * The following features are implemented:
 * </p>
 * <ul>
 *   <li>{@link com.ericsson.xtumlrt.oopl.impl.OOPLClassReferenceImpl#getOoplClass <em>Oopl Class</em>}</li>
 * </ul>
 *
 * @generated
 */
public abstract class OOPLClassReferenceImpl extends OOPLTypeImpl implements OOPLClassReference {
    /**
     * The cached value of the '{@link #getOoplClass() <em>Oopl Class</em>}' reference.
     * <!-- begin-user-doc -->
     * <!-- end-user-doc -->
     * @see #getOoplClass()
     * @generated
     * @ordered
     */
    protected OOPLClass ooplClass;

    /**
     * <!-- begin-user-doc -->
     * <!-- end-user-doc -->
     * @generated
     */
    protected OOPLClassReferenceImpl() {
        super();
    }

    /**
     * <!-- begin-user-doc -->
     * <!-- end-user-doc -->
     * @generated
     */
    @Override
    protected EClass eStaticClass() {
        return OoplPackage.Literals.OOPL_CLASS_REFERENCE;
    }

    /**
     * <!-- begin-user-doc -->
     * <!-- end-user-doc -->
     * @generated
     */
    public OOPLClass getOoplClass() {
        if (ooplClass != null && ooplClass.eIsProxy()) {
            InternalEObject oldOoplClass = (InternalEObject)ooplClass;
            ooplClass = (OOPLClass)eResolveProxy(oldOoplClass);
            if (ooplClass != oldOoplClass) {
                if (eNotificationRequired())
                    eNotify(new ENotificationImpl(this, Notification.RESOLVE, OoplPackage.OOPL_CLASS_REFERENCE__OOPL_CLASS, oldOoplClass, ooplClass));
            }
        }
        return ooplClass;
    }

    /**
     * <!-- begin-user-doc -->
     * <!-- end-user-doc -->
     * @generated
     */
    public OOPLClass basicGetOoplClass() {
        return ooplClass;
    }

    /**
     * <!-- begin-user-doc -->
     * <!-- end-user-doc -->
     * @generated
     */
    public void setOoplClass(OOPLClass newOoplClass) {
        OOPLClass oldOoplClass = ooplClass;
        ooplClass = newOoplClass;
        if (eNotificationRequired())
            eNotify(new ENotificationImpl(this, Notification.SET, OoplPackage.OOPL_CLASS_REFERENCE__OOPL_CLASS, oldOoplClass, ooplClass));
    }

    /**
     * <!-- begin-user-doc -->
     * <!-- end-user-doc -->
     * @generated
     */
    @Override
    public Object eGet(int featureID, boolean resolve, boolean coreType) {
        switch (featureID) {
            case OoplPackage.OOPL_CLASS_REFERENCE__OOPL_CLASS:
                if (resolve) return getOoplClass();
                return basicGetOoplClass();
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
            case OoplPackage.OOPL_CLASS_REFERENCE__OOPL_CLASS:
                setOoplClass((OOPLClass)newValue);
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
            case OoplPackage.OOPL_CLASS_REFERENCE__OOPL_CLASS:
                setOoplClass((OOPLClass)null);
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
            case OoplPackage.OOPL_CLASS_REFERENCE__OOPL_CLASS:
                return ooplClass != null;
        }
        return super.eIsSet(featureID);
    }

} //OOPLClassReferenceImpl
