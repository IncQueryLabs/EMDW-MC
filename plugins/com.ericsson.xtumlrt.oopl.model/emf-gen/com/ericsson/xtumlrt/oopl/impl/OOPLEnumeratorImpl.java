/**
 */
package com.ericsson.xtumlrt.oopl.impl;

import com.ericsson.xtumlrt.oopl.OOPLEnumerator;
import com.ericsson.xtumlrt.oopl.OoplPackage;

import org.eclipse.emf.common.notify.Notification;

import org.eclipse.emf.ecore.EClass;
import org.eclipse.emf.ecore.InternalEObject;

import org.eclipse.emf.ecore.impl.ENotificationImpl;
import org.eclipse.emf.ecore.impl.MinimalEObjectImpl;

import org.eclipse.papyrusrt.xtumlrt.common.EnumerationLiteral;

/**
 * <!-- begin-user-doc -->
 * An implementation of the model object '<em><b>OOPL Enumerator</b></em>'.
 * <!-- end-user-doc -->
 * <p>
 * The following features are implemented:
 * </p>
 * <ul>
 *   <li>{@link com.ericsson.xtumlrt.oopl.impl.OOPLEnumeratorImpl#getCommonEnumerationLiteral <em>Common Enumeration Literal</em>}</li>
 * </ul>
 *
 * @generated
 */
public abstract class OOPLEnumeratorImpl extends MinimalEObjectImpl.Container implements OOPLEnumerator {
    /**
     * The cached value of the '{@link #getCommonEnumerationLiteral() <em>Common Enumeration Literal</em>}' reference.
     * <!-- begin-user-doc -->
     * <!-- end-user-doc -->
     * @see #getCommonEnumerationLiteral()
     * @generated
     * @ordered
     */
    protected EnumerationLiteral commonEnumerationLiteral;

    /**
     * <!-- begin-user-doc -->
     * <!-- end-user-doc -->
     * @generated
     */
    protected OOPLEnumeratorImpl() {
        super();
    }

    /**
     * <!-- begin-user-doc -->
     * <!-- end-user-doc -->
     * @generated
     */
    @Override
    protected EClass eStaticClass() {
        return OoplPackage.Literals.OOPL_ENUMERATOR;
    }

    /**
     * <!-- begin-user-doc -->
     * <!-- end-user-doc -->
     * @generated
     */
    public EnumerationLiteral getCommonEnumerationLiteral() {
        if (commonEnumerationLiteral != null && commonEnumerationLiteral.eIsProxy()) {
            InternalEObject oldCommonEnumerationLiteral = (InternalEObject)commonEnumerationLiteral;
            commonEnumerationLiteral = (EnumerationLiteral)eResolveProxy(oldCommonEnumerationLiteral);
            if (commonEnumerationLiteral != oldCommonEnumerationLiteral) {
                if (eNotificationRequired())
                    eNotify(new ENotificationImpl(this, Notification.RESOLVE, OoplPackage.OOPL_ENUMERATOR__COMMON_ENUMERATION_LITERAL, oldCommonEnumerationLiteral, commonEnumerationLiteral));
            }
        }
        return commonEnumerationLiteral;
    }

    /**
     * <!-- begin-user-doc -->
     * <!-- end-user-doc -->
     * @generated
     */
    public EnumerationLiteral basicGetCommonEnumerationLiteral() {
        return commonEnumerationLiteral;
    }

    /**
     * <!-- begin-user-doc -->
     * <!-- end-user-doc -->
     * @generated
     */
    public void setCommonEnumerationLiteral(EnumerationLiteral newCommonEnumerationLiteral) {
        EnumerationLiteral oldCommonEnumerationLiteral = commonEnumerationLiteral;
        commonEnumerationLiteral = newCommonEnumerationLiteral;
        if (eNotificationRequired())
            eNotify(new ENotificationImpl(this, Notification.SET, OoplPackage.OOPL_ENUMERATOR__COMMON_ENUMERATION_LITERAL, oldCommonEnumerationLiteral, commonEnumerationLiteral));
    }

    /**
     * <!-- begin-user-doc -->
     * <!-- end-user-doc -->
     * @generated
     */
    @Override
    public Object eGet(int featureID, boolean resolve, boolean coreType) {
        switch (featureID) {
            case OoplPackage.OOPL_ENUMERATOR__COMMON_ENUMERATION_LITERAL:
                if (resolve) return getCommonEnumerationLiteral();
                return basicGetCommonEnumerationLiteral();
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
            case OoplPackage.OOPL_ENUMERATOR__COMMON_ENUMERATION_LITERAL:
                setCommonEnumerationLiteral((EnumerationLiteral)newValue);
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
            case OoplPackage.OOPL_ENUMERATOR__COMMON_ENUMERATION_LITERAL:
                setCommonEnumerationLiteral((EnumerationLiteral)null);
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
            case OoplPackage.OOPL_ENUMERATOR__COMMON_ENUMERATION_LITERAL:
                return commonEnumerationLiteral != null;
        }
        return super.eIsSet(featureID);
    }

} //OOPLEnumeratorImpl
