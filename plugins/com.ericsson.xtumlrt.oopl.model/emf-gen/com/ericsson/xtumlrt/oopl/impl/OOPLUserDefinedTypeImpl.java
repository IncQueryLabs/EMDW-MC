/**
 */
package com.ericsson.xtumlrt.oopl.impl;

import com.ericsson.xtumlrt.oopl.OOPLType;
import com.ericsson.xtumlrt.oopl.OOPLUserDefinedType;
import com.ericsson.xtumlrt.oopl.OoplPackage;

import org.eclipse.emf.common.notify.Notification;

import org.eclipse.emf.ecore.EClass;
import org.eclipse.emf.ecore.InternalEObject;

import org.eclipse.emf.ecore.impl.ENotificationImpl;

/**
 * <!-- begin-user-doc -->
 * An implementation of the model object '<em><b>OOPL User Defined Type</b></em>'.
 * <!-- end-user-doc -->
 * <p>
 * The following features are implemented:
 * </p>
 * <ul>
 *   <li>{@link com.ericsson.xtumlrt.oopl.impl.OOPLUserDefinedTypeImpl#getBaseType <em>Base Type</em>}</li>
 * </ul>
 *
 * @generated
 */
public abstract class OOPLUserDefinedTypeImpl extends OOPLTypeImpl implements OOPLUserDefinedType {
    /**
     * The cached value of the '{@link #getBaseType() <em>Base Type</em>}' reference.
     * <!-- begin-user-doc -->
     * <!-- end-user-doc -->
     * @see #getBaseType()
     * @generated
     * @ordered
     */
    protected OOPLType baseType;

    /**
     * <!-- begin-user-doc -->
     * <!-- end-user-doc -->
     * @generated
     */
    protected OOPLUserDefinedTypeImpl() {
        super();
    }

    /**
     * <!-- begin-user-doc -->
     * <!-- end-user-doc -->
     * @generated
     */
    @Override
    protected EClass eStaticClass() {
        return OoplPackage.Literals.OOPL_USER_DEFINED_TYPE;
    }

    /**
     * <!-- begin-user-doc -->
     * <!-- end-user-doc -->
     * @generated
     */
    public OOPLType getBaseType() {
        if (baseType != null && baseType.eIsProxy()) {
            InternalEObject oldBaseType = (InternalEObject)baseType;
            baseType = (OOPLType)eResolveProxy(oldBaseType);
            if (baseType != oldBaseType) {
                if (eNotificationRequired())
                    eNotify(new ENotificationImpl(this, Notification.RESOLVE, OoplPackage.OOPL_USER_DEFINED_TYPE__BASE_TYPE, oldBaseType, baseType));
            }
        }
        return baseType;
    }

    /**
     * <!-- begin-user-doc -->
     * <!-- end-user-doc -->
     * @generated
     */
    public OOPLType basicGetBaseType() {
        return baseType;
    }

    /**
     * <!-- begin-user-doc -->
     * <!-- end-user-doc -->
     * @generated
     */
    public void setBaseType(OOPLType newBaseType) {
        OOPLType oldBaseType = baseType;
        baseType = newBaseType;
        if (eNotificationRequired())
            eNotify(new ENotificationImpl(this, Notification.SET, OoplPackage.OOPL_USER_DEFINED_TYPE__BASE_TYPE, oldBaseType, baseType));
    }

    /**
     * <!-- begin-user-doc -->
     * <!-- end-user-doc -->
     * @generated
     */
    @Override
    public Object eGet(int featureID, boolean resolve, boolean coreType) {
        switch (featureID) {
            case OoplPackage.OOPL_USER_DEFINED_TYPE__BASE_TYPE:
                if (resolve) return getBaseType();
                return basicGetBaseType();
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
            case OoplPackage.OOPL_USER_DEFINED_TYPE__BASE_TYPE:
                setBaseType((OOPLType)newValue);
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
            case OoplPackage.OOPL_USER_DEFINED_TYPE__BASE_TYPE:
                setBaseType((OOPLType)null);
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
            case OoplPackage.OOPL_USER_DEFINED_TYPE__BASE_TYPE:
                return baseType != null;
        }
        return super.eIsSet(featureID);
    }

} //OOPLUserDefinedTypeImpl
