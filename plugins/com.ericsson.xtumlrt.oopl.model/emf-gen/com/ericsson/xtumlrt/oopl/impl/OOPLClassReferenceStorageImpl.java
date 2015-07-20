/**
 */
package com.ericsson.xtumlrt.oopl.impl;

import com.ericsson.xtumlrt.oopl.OOPLClassReferenceStorage;
import com.ericsson.xtumlrt.oopl.OOPLType;
import com.ericsson.xtumlrt.oopl.OoplPackage;

import org.eclipse.emf.common.notify.Notification;

import org.eclipse.emf.ecore.EClass;
import org.eclipse.emf.ecore.InternalEObject;

import org.eclipse.emf.ecore.impl.ENotificationImpl;
import org.eclipse.emf.ecore.impl.MinimalEObjectImpl;

/**
 * <!-- begin-user-doc -->
 * An implementation of the model object '<em><b>OOPL Class Reference Storage</b></em>'.
 * <!-- end-user-doc -->
 * <p>
 * The following features are implemented:
 * </p>
 * <ul>
 *   <li>{@link com.ericsson.xtumlrt.oopl.impl.OOPLClassReferenceStorageImpl#getType <em>Type</em>}</li>
 *   <li>{@link com.ericsson.xtumlrt.oopl.impl.OOPLClassReferenceStorageImpl#isRequired <em>Required</em>}</li>
 * </ul>
 *
 * @generated
 */
public abstract class OOPLClassReferenceStorageImpl extends MinimalEObjectImpl.Container implements OOPLClassReferenceStorage {
    /**
     * The cached value of the '{@link #getType() <em>Type</em>}' reference.
     * <!-- begin-user-doc -->
     * <!-- end-user-doc -->
     * @see #getType()
     * @generated
     * @ordered
     */
    protected OOPLType type;

    /**
     * The default value of the '{@link #isRequired() <em>Required</em>}' attribute.
     * <!-- begin-user-doc -->
     * <!-- end-user-doc -->
     * @see #isRequired()
     * @generated
     * @ordered
     */
    protected static final boolean REQUIRED_EDEFAULT = false;

    /**
     * The cached value of the '{@link #isRequired() <em>Required</em>}' attribute.
     * <!-- begin-user-doc -->
     * <!-- end-user-doc -->
     * @see #isRequired()
     * @generated
     * @ordered
     */
    protected boolean required = REQUIRED_EDEFAULT;

    /**
     * <!-- begin-user-doc -->
     * <!-- end-user-doc -->
     * @generated
     */
    protected OOPLClassReferenceStorageImpl() {
        super();
    }

    /**
     * <!-- begin-user-doc -->
     * <!-- end-user-doc -->
     * @generated
     */
    @Override
    protected EClass eStaticClass() {
        return OoplPackage.Literals.OOPL_CLASS_REFERENCE_STORAGE;
    }

    /**
     * <!-- begin-user-doc -->
     * <!-- end-user-doc -->
     * @generated
     */
    public OOPLType getType() {
        if (type != null && type.eIsProxy()) {
            InternalEObject oldType = (InternalEObject)type;
            type = (OOPLType)eResolveProxy(oldType);
            if (type != oldType) {
                if (eNotificationRequired())
                    eNotify(new ENotificationImpl(this, Notification.RESOLVE, OoplPackage.OOPL_CLASS_REFERENCE_STORAGE__TYPE, oldType, type));
            }
        }
        return type;
    }

    /**
     * <!-- begin-user-doc -->
     * <!-- end-user-doc -->
     * @generated
     */
    public OOPLType basicGetType() {
        return type;
    }

    /**
     * <!-- begin-user-doc -->
     * <!-- end-user-doc -->
     * @generated
     */
    public void setType(OOPLType newType) {
        OOPLType oldType = type;
        type = newType;
        if (eNotificationRequired())
            eNotify(new ENotificationImpl(this, Notification.SET, OoplPackage.OOPL_CLASS_REFERENCE_STORAGE__TYPE, oldType, type));
    }

    /**
     * <!-- begin-user-doc -->
     * <!-- end-user-doc -->
     * @generated
     */
    public boolean isRequired() {
        return required;
    }

    /**
     * <!-- begin-user-doc -->
     * <!-- end-user-doc -->
     * @generated
     */
    public void setRequired(boolean newRequired) {
        boolean oldRequired = required;
        required = newRequired;
        if (eNotificationRequired())
            eNotify(new ENotificationImpl(this, Notification.SET, OoplPackage.OOPL_CLASS_REFERENCE_STORAGE__REQUIRED, oldRequired, required));
    }

    /**
     * <!-- begin-user-doc -->
     * <!-- end-user-doc -->
     * @generated
     */
    @Override
    public Object eGet(int featureID, boolean resolve, boolean coreType) {
        switch (featureID) {
            case OoplPackage.OOPL_CLASS_REFERENCE_STORAGE__TYPE:
                if (resolve) return getType();
                return basicGetType();
            case OoplPackage.OOPL_CLASS_REFERENCE_STORAGE__REQUIRED:
                return isRequired();
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
            case OoplPackage.OOPL_CLASS_REFERENCE_STORAGE__TYPE:
                setType((OOPLType)newValue);
                return;
            case OoplPackage.OOPL_CLASS_REFERENCE_STORAGE__REQUIRED:
                setRequired((Boolean)newValue);
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
            case OoplPackage.OOPL_CLASS_REFERENCE_STORAGE__TYPE:
                setType((OOPLType)null);
                return;
            case OoplPackage.OOPL_CLASS_REFERENCE_STORAGE__REQUIRED:
                setRequired(REQUIRED_EDEFAULT);
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
            case OoplPackage.OOPL_CLASS_REFERENCE_STORAGE__TYPE:
                return type != null;
            case OoplPackage.OOPL_CLASS_REFERENCE_STORAGE__REQUIRED:
                return required != REQUIRED_EDEFAULT;
        }
        return super.eIsSet(featureID);
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
        result.append(" (required: ");
        result.append(required);
        result.append(')');
        return result.toString();
    }

} //OOPLClassReferenceStorageImpl
