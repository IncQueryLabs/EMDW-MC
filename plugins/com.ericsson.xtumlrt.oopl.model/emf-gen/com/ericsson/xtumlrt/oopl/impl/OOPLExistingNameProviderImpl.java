/**
 */
package com.ericsson.xtumlrt.oopl.impl;

import com.ericsson.xtumlrt.oopl.OOPLExistingNameProvider;
import com.ericsson.xtumlrt.oopl.OoplPackage;

import org.eclipse.emf.common.notify.Notification;

import org.eclipse.emf.ecore.EClass;
import org.eclipse.emf.ecore.InternalEObject;

import org.eclipse.emf.ecore.impl.ENotificationImpl;

import org.eclipse.papyrusrt.xtumlrt.common.NamedElement;

/**
 * <!-- begin-user-doc -->
 * An implementation of the model object '<em><b>OOPL Existing Name Provider</b></em>'.
 * <!-- end-user-doc -->
 * <p>
 * The following features are implemented:
 * </p>
 * <ul>
 *   <li>{@link com.ericsson.xtumlrt.oopl.impl.OOPLExistingNameProviderImpl#getCommonNamedElement <em>Common Named Element</em>}</li>
 * </ul>
 *
 * @generated
 */
public class OOPLExistingNameProviderImpl extends OOPLNameProviderImpl implements OOPLExistingNameProvider {
    /**
     * The cached value of the '{@link #getCommonNamedElement() <em>Common Named Element</em>}' reference.
     * <!-- begin-user-doc -->
     * <!-- end-user-doc -->
     * @see #getCommonNamedElement()
     * @generated
     * @ordered
     */
    protected NamedElement commonNamedElement;

    /**
     * <!-- begin-user-doc -->
     * <!-- end-user-doc -->
     * @generated
     */
    protected OOPLExistingNameProviderImpl() {
        super();
    }

    /**
     * <!-- begin-user-doc -->
     * <!-- end-user-doc -->
     * @generated
     */
    @Override
    protected EClass eStaticClass() {
        return OoplPackage.Literals.OOPL_EXISTING_NAME_PROVIDER;
    }

    /**
     * <!-- begin-user-doc -->
     * <!-- end-user-doc -->
     * @generated
     */
    public NamedElement getCommonNamedElement() {
        if (commonNamedElement != null && commonNamedElement.eIsProxy()) {
            InternalEObject oldCommonNamedElement = (InternalEObject)commonNamedElement;
            commonNamedElement = (NamedElement)eResolveProxy(oldCommonNamedElement);
            if (commonNamedElement != oldCommonNamedElement) {
                if (eNotificationRequired())
                    eNotify(new ENotificationImpl(this, Notification.RESOLVE, OoplPackage.OOPL_EXISTING_NAME_PROVIDER__COMMON_NAMED_ELEMENT, oldCommonNamedElement, commonNamedElement));
            }
        }
        return commonNamedElement;
    }

    /**
     * <!-- begin-user-doc -->
     * <!-- end-user-doc -->
     * @generated
     */
    public NamedElement basicGetCommonNamedElement() {
        return commonNamedElement;
    }

    /**
     * <!-- begin-user-doc -->
     * <!-- end-user-doc -->
     * @generated
     */
    public void setCommonNamedElement(NamedElement newCommonNamedElement) {
        NamedElement oldCommonNamedElement = commonNamedElement;
        commonNamedElement = newCommonNamedElement;
        if (eNotificationRequired())
            eNotify(new ENotificationImpl(this, Notification.SET, OoplPackage.OOPL_EXISTING_NAME_PROVIDER__COMMON_NAMED_ELEMENT, oldCommonNamedElement, commonNamedElement));
    }

    /**
     * <!-- begin-user-doc -->
     * <!-- end-user-doc -->
     * @generated
     */
    @Override
    public Object eGet(int featureID, boolean resolve, boolean coreType) {
        switch (featureID) {
            case OoplPackage.OOPL_EXISTING_NAME_PROVIDER__COMMON_NAMED_ELEMENT:
                if (resolve) return getCommonNamedElement();
                return basicGetCommonNamedElement();
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
            case OoplPackage.OOPL_EXISTING_NAME_PROVIDER__COMMON_NAMED_ELEMENT:
                setCommonNamedElement((NamedElement)newValue);
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
            case OoplPackage.OOPL_EXISTING_NAME_PROVIDER__COMMON_NAMED_ELEMENT:
                setCommonNamedElement((NamedElement)null);
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
            case OoplPackage.OOPL_EXISTING_NAME_PROVIDER__COMMON_NAMED_ELEMENT:
                return commonNamedElement != null;
        }
        return super.eIsSet(featureID);
    }

} //OOPLExistingNameProviderImpl
