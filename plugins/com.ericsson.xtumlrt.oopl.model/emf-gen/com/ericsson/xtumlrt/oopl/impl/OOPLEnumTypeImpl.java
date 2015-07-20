/**
 */
package com.ericsson.xtumlrt.oopl.impl;

import com.ericsson.xtumlrt.oopl.OOPLEnumType;
import com.ericsson.xtumlrt.oopl.OOPLEnumerator;
import com.ericsson.xtumlrt.oopl.OoplPackage;

import org.eclipse.emf.common.notify.Notification;

import org.eclipse.emf.common.util.EList;

import org.eclipse.emf.ecore.EClass;
import org.eclipse.emf.ecore.InternalEObject;

import org.eclipse.emf.ecore.impl.ENotificationImpl;

import org.eclipse.emf.ecore.util.EObjectResolvingEList;

/**
 * <!-- begin-user-doc -->
 * An implementation of the model object '<em><b>OOPL Enum Type</b></em>'.
 * <!-- end-user-doc -->
 * <p>
 * The following features are implemented:
 * </p>
 * <ul>
 *   <li>{@link com.ericsson.xtumlrt.oopl.impl.OOPLEnumTypeImpl#getEnumerators <em>Enumerators</em>}</li>
 *   <li>{@link com.ericsson.xtumlrt.oopl.impl.OOPLEnumTypeImpl#getDefaultValue <em>Default Value</em>}</li>
 * </ul>
 *
 * @generated
 */
public abstract class OOPLEnumTypeImpl extends OOPLTypeImpl implements OOPLEnumType {
    /**
     * The cached value of the '{@link #getEnumerators() <em>Enumerators</em>}' reference list.
     * <!-- begin-user-doc -->
     * <!-- end-user-doc -->
     * @see #getEnumerators()
     * @generated
     * @ordered
     */
    protected EList<OOPLEnumerator> enumerators;

    /**
     * The cached value of the '{@link #getDefaultValue() <em>Default Value</em>}' reference.
     * <!-- begin-user-doc -->
     * <!-- end-user-doc -->
     * @see #getDefaultValue()
     * @generated
     * @ordered
     */
    protected OOPLEnumerator defaultValue;

    /**
     * <!-- begin-user-doc -->
     * <!-- end-user-doc -->
     * @generated
     */
    protected OOPLEnumTypeImpl() {
        super();
    }

    /**
     * <!-- begin-user-doc -->
     * <!-- end-user-doc -->
     * @generated
     */
    @Override
    protected EClass eStaticClass() {
        return OoplPackage.Literals.OOPL_ENUM_TYPE;
    }

    /**
     * <!-- begin-user-doc -->
     * <!-- end-user-doc -->
     * @generated
     */
    public EList<OOPLEnumerator> getEnumerators() {
        if (enumerators == null) {
            enumerators = new EObjectResolvingEList<OOPLEnumerator>(OOPLEnumerator.class, this, OoplPackage.OOPL_ENUM_TYPE__ENUMERATORS);
        }
        return enumerators;
    }

    /**
     * <!-- begin-user-doc -->
     * <!-- end-user-doc -->
     * @generated
     */
    public OOPLEnumerator getDefaultValue() {
        if (defaultValue != null && defaultValue.eIsProxy()) {
            InternalEObject oldDefaultValue = (InternalEObject)defaultValue;
            defaultValue = (OOPLEnumerator)eResolveProxy(oldDefaultValue);
            if (defaultValue != oldDefaultValue) {
                if (eNotificationRequired())
                    eNotify(new ENotificationImpl(this, Notification.RESOLVE, OoplPackage.OOPL_ENUM_TYPE__DEFAULT_VALUE, oldDefaultValue, defaultValue));
            }
        }
        return defaultValue;
    }

    /**
     * <!-- begin-user-doc -->
     * <!-- end-user-doc -->
     * @generated
     */
    public OOPLEnumerator basicGetDefaultValue() {
        return defaultValue;
    }

    /**
     * <!-- begin-user-doc -->
     * <!-- end-user-doc -->
     * @generated
     */
    @Override
    public Object eGet(int featureID, boolean resolve, boolean coreType) {
        switch (featureID) {
            case OoplPackage.OOPL_ENUM_TYPE__ENUMERATORS:
                return getEnumerators();
            case OoplPackage.OOPL_ENUM_TYPE__DEFAULT_VALUE:
                if (resolve) return getDefaultValue();
                return basicGetDefaultValue();
        }
        return super.eGet(featureID, resolve, coreType);
    }

    /**
     * <!-- begin-user-doc -->
     * <!-- end-user-doc -->
     * @generated
     */
    @Override
    public boolean eIsSet(int featureID) {
        switch (featureID) {
            case OoplPackage.OOPL_ENUM_TYPE__ENUMERATORS:
                return enumerators != null && !enumerators.isEmpty();
            case OoplPackage.OOPL_ENUM_TYPE__DEFAULT_VALUE:
                return defaultValue != null;
        }
        return super.eIsSet(featureID);
    }

} //OOPLEnumTypeImpl
