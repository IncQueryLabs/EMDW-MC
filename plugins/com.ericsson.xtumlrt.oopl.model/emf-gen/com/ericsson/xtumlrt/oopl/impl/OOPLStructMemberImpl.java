/**
 */
package com.ericsson.xtumlrt.oopl.impl;

import com.ericsson.xtumlrt.oopl.OOPLStructMember;
import com.ericsson.xtumlrt.oopl.OOPLType;
import com.ericsson.xtumlrt.oopl.OoplPackage;

import org.eclipse.emf.common.notify.Notification;

import org.eclipse.emf.ecore.EClass;
import org.eclipse.emf.ecore.InternalEObject;

import org.eclipse.emf.ecore.impl.ENotificationImpl;
import org.eclipse.emf.ecore.impl.MinimalEObjectImpl;

import org.eclipse.papyrusrt.xtumlrt.common.Attribute;

/**
 * <!-- begin-user-doc -->
 * An implementation of the model object '<em><b>OOPL Struct Member</b></em>'.
 * <!-- end-user-doc -->
 * <p>
 * The following features are implemented:
 * </p>
 * <ul>
 *   <li>{@link com.ericsson.xtumlrt.oopl.impl.OOPLStructMemberImpl#getCommonMember <em>Common Member</em>}</li>
 *   <li>{@link com.ericsson.xtumlrt.oopl.impl.OOPLStructMemberImpl#getType <em>Type</em>}</li>
 * </ul>
 *
 * @generated
 */
public abstract class OOPLStructMemberImpl extends MinimalEObjectImpl.Container implements OOPLStructMember {
    /**
     * The cached value of the '{@link #getCommonMember() <em>Common Member</em>}' reference.
     * <!-- begin-user-doc -->
     * <!-- end-user-doc -->
     * @see #getCommonMember()
     * @generated
     * @ordered
     */
    protected Attribute commonMember;

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
     * <!-- begin-user-doc -->
     * <!-- end-user-doc -->
     * @generated
     */
    protected OOPLStructMemberImpl() {
        super();
    }

    /**
     * <!-- begin-user-doc -->
     * <!-- end-user-doc -->
     * @generated
     */
    @Override
    protected EClass eStaticClass() {
        return OoplPackage.Literals.OOPL_STRUCT_MEMBER;
    }

    /**
     * <!-- begin-user-doc -->
     * <!-- end-user-doc -->
     * @generated
     */
    public Attribute getCommonMember() {
        if (commonMember != null && commonMember.eIsProxy()) {
            InternalEObject oldCommonMember = (InternalEObject)commonMember;
            commonMember = (Attribute)eResolveProxy(oldCommonMember);
            if (commonMember != oldCommonMember) {
                if (eNotificationRequired())
                    eNotify(new ENotificationImpl(this, Notification.RESOLVE, OoplPackage.OOPL_STRUCT_MEMBER__COMMON_MEMBER, oldCommonMember, commonMember));
            }
        }
        return commonMember;
    }

    /**
     * <!-- begin-user-doc -->
     * <!-- end-user-doc -->
     * @generated
     */
    public Attribute basicGetCommonMember() {
        return commonMember;
    }

    /**
     * <!-- begin-user-doc -->
     * <!-- end-user-doc -->
     * @generated
     */
    public void setCommonMember(Attribute newCommonMember) {
        Attribute oldCommonMember = commonMember;
        commonMember = newCommonMember;
        if (eNotificationRequired())
            eNotify(new ENotificationImpl(this, Notification.SET, OoplPackage.OOPL_STRUCT_MEMBER__COMMON_MEMBER, oldCommonMember, commonMember));
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
                    eNotify(new ENotificationImpl(this, Notification.RESOLVE, OoplPackage.OOPL_STRUCT_MEMBER__TYPE, oldType, type));
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
    @Override
    public Object eGet(int featureID, boolean resolve, boolean coreType) {
        switch (featureID) {
            case OoplPackage.OOPL_STRUCT_MEMBER__COMMON_MEMBER:
                if (resolve) return getCommonMember();
                return basicGetCommonMember();
            case OoplPackage.OOPL_STRUCT_MEMBER__TYPE:
                if (resolve) return getType();
                return basicGetType();
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
            case OoplPackage.OOPL_STRUCT_MEMBER__COMMON_MEMBER:
                setCommonMember((Attribute)newValue);
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
            case OoplPackage.OOPL_STRUCT_MEMBER__COMMON_MEMBER:
                setCommonMember((Attribute)null);
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
            case OoplPackage.OOPL_STRUCT_MEMBER__COMMON_MEMBER:
                return commonMember != null;
            case OoplPackage.OOPL_STRUCT_MEMBER__TYPE:
                return type != null;
        }
        return super.eIsSet(featureID);
    }

} //OOPLStructMemberImpl
