/**
 */
package com.ericsson.xtumlrt.oopl.impl;

import com.ericsson.xtumlrt.oopl.OOPLSequence;
import com.ericsson.xtumlrt.oopl.OOPLSequenceImplementation;
import com.ericsson.xtumlrt.oopl.OOPLType;
import com.ericsson.xtumlrt.oopl.OoplPackage;
import com.ericsson.xtumlrt.oopl.SequenceOrderednessKind;
import com.ericsson.xtumlrt.oopl.SequenceUniquenessKind;

import org.eclipse.emf.common.notify.Notification;

import org.eclipse.emf.ecore.EClass;
import org.eclipse.emf.ecore.InternalEObject;

import org.eclipse.emf.ecore.impl.ENotificationImpl;

/**
 * <!-- begin-user-doc -->
 * An implementation of the model object '<em><b>OOPL Sequence</b></em>'.
 * <!-- end-user-doc -->
 * <p>
 * The following features are implemented:
 * </p>
 * <ul>
 *   <li>{@link com.ericsson.xtumlrt.oopl.impl.OOPLSequenceImpl#getElementType <em>Element Type</em>}</li>
 *   <li>{@link com.ericsson.xtumlrt.oopl.impl.OOPLSequenceImpl#getOrderedness <em>Orderedness</em>}</li>
 *   <li>{@link com.ericsson.xtumlrt.oopl.impl.OOPLSequenceImpl#getUniqueness <em>Uniqueness</em>}</li>
 *   <li>{@link com.ericsson.xtumlrt.oopl.impl.OOPLSequenceImpl#getImplementation <em>Implementation</em>}</li>
 * </ul>
 *
 * @generated
 */
public class OOPLSequenceImpl extends OOPLTypeImpl implements OOPLSequence {
    /**
     * The cached value of the '{@link #getElementType() <em>Element Type</em>}' reference.
     * <!-- begin-user-doc -->
     * <!-- end-user-doc -->
     * @see #getElementType()
     * @generated
     * @ordered
     */
    protected OOPLType elementType;

    /**
     * The default value of the '{@link #getOrderedness() <em>Orderedness</em>}' attribute.
     * <!-- begin-user-doc -->
     * <!-- end-user-doc -->
     * @see #getOrderedness()
     * @generated
     * @ordered
     */
    protected static final SequenceOrderednessKind ORDEREDNESS_EDEFAULT = SequenceOrderednessKind.UNORDERED;

    /**
     * The cached value of the '{@link #getOrderedness() <em>Orderedness</em>}' attribute.
     * <!-- begin-user-doc -->
     * <!-- end-user-doc -->
     * @see #getOrderedness()
     * @generated
     * @ordered
     */
    protected SequenceOrderednessKind orderedness = ORDEREDNESS_EDEFAULT;

    /**
     * The default value of the '{@link #getUniqueness() <em>Uniqueness</em>}' attribute.
     * <!-- begin-user-doc -->
     * <!-- end-user-doc -->
     * @see #getUniqueness()
     * @generated
     * @ordered
     */
    protected static final SequenceUniquenessKind UNIQUENESS_EDEFAULT = SequenceUniquenessKind.NON_UNIQUE;

    /**
     * The cached value of the '{@link #getUniqueness() <em>Uniqueness</em>}' attribute.
     * <!-- begin-user-doc -->
     * <!-- end-user-doc -->
     * @see #getUniqueness()
     * @generated
     * @ordered
     */
    protected SequenceUniquenessKind uniqueness = UNIQUENESS_EDEFAULT;

    /**
     * The cached value of the '{@link #getImplementation() <em>Implementation</em>}' reference.
     * <!-- begin-user-doc -->
     * <!-- end-user-doc -->
     * @see #getImplementation()
     * @generated
     * @ordered
     */
    protected OOPLSequenceImplementation implementation;

    /**
     * <!-- begin-user-doc -->
     * <!-- end-user-doc -->
     * @generated
     */
    protected OOPLSequenceImpl() {
        super();
    }

    /**
     * <!-- begin-user-doc -->
     * <!-- end-user-doc -->
     * @generated
     */
    @Override
    protected EClass eStaticClass() {
        return OoplPackage.Literals.OOPL_SEQUENCE;
    }

    /**
     * <!-- begin-user-doc -->
     * <!-- end-user-doc -->
     * @generated
     */
    public OOPLType getElementType() {
        if (elementType != null && elementType.eIsProxy()) {
            InternalEObject oldElementType = (InternalEObject)elementType;
            elementType = (OOPLType)eResolveProxy(oldElementType);
            if (elementType != oldElementType) {
                if (eNotificationRequired())
                    eNotify(new ENotificationImpl(this, Notification.RESOLVE, OoplPackage.OOPL_SEQUENCE__ELEMENT_TYPE, oldElementType, elementType));
            }
        }
        return elementType;
    }

    /**
     * <!-- begin-user-doc -->
     * <!-- end-user-doc -->
     * @generated
     */
    public OOPLType basicGetElementType() {
        return elementType;
    }

    /**
     * <!-- begin-user-doc -->
     * <!-- end-user-doc -->
     * @generated
     */
    public void setElementType(OOPLType newElementType) {
        OOPLType oldElementType = elementType;
        elementType = newElementType;
        if (eNotificationRequired())
            eNotify(new ENotificationImpl(this, Notification.SET, OoplPackage.OOPL_SEQUENCE__ELEMENT_TYPE, oldElementType, elementType));
    }

    /**
     * <!-- begin-user-doc -->
     * <!-- end-user-doc -->
     * @generated
     */
    public SequenceOrderednessKind getOrderedness() {
        return orderedness;
    }

    /**
     * <!-- begin-user-doc -->
     * <!-- end-user-doc -->
     * @generated
     */
    public void setOrderedness(SequenceOrderednessKind newOrderedness) {
        SequenceOrderednessKind oldOrderedness = orderedness;
        orderedness = newOrderedness == null ? ORDEREDNESS_EDEFAULT : newOrderedness;
        if (eNotificationRequired())
            eNotify(new ENotificationImpl(this, Notification.SET, OoplPackage.OOPL_SEQUENCE__ORDEREDNESS, oldOrderedness, orderedness));
    }

    /**
     * <!-- begin-user-doc -->
     * <!-- end-user-doc -->
     * @generated
     */
    public SequenceUniquenessKind getUniqueness() {
        return uniqueness;
    }

    /**
     * <!-- begin-user-doc -->
     * <!-- end-user-doc -->
     * @generated
     */
    public void setUniqueness(SequenceUniquenessKind newUniqueness) {
        SequenceUniquenessKind oldUniqueness = uniqueness;
        uniqueness = newUniqueness == null ? UNIQUENESS_EDEFAULT : newUniqueness;
        if (eNotificationRequired())
            eNotify(new ENotificationImpl(this, Notification.SET, OoplPackage.OOPL_SEQUENCE__UNIQUENESS, oldUniqueness, uniqueness));
    }

    /**
     * <!-- begin-user-doc -->
     * <!-- end-user-doc -->
     * @generated
     */
    public OOPLSequenceImplementation getImplementation() {
        if (implementation != null && implementation.eIsProxy()) {
            InternalEObject oldImplementation = (InternalEObject)implementation;
            implementation = (OOPLSequenceImplementation)eResolveProxy(oldImplementation);
            if (implementation != oldImplementation) {
                if (eNotificationRequired())
                    eNotify(new ENotificationImpl(this, Notification.RESOLVE, OoplPackage.OOPL_SEQUENCE__IMPLEMENTATION, oldImplementation, implementation));
            }
        }
        return implementation;
    }

    /**
     * <!-- begin-user-doc -->
     * <!-- end-user-doc -->
     * @generated
     */
    public OOPLSequenceImplementation basicGetImplementation() {
        return implementation;
    }

    /**
     * <!-- begin-user-doc -->
     * <!-- end-user-doc -->
     * @generated
     */
    public void setImplementation(OOPLSequenceImplementation newImplementation) {
        OOPLSequenceImplementation oldImplementation = implementation;
        implementation = newImplementation;
        if (eNotificationRequired())
            eNotify(new ENotificationImpl(this, Notification.SET, OoplPackage.OOPL_SEQUENCE__IMPLEMENTATION, oldImplementation, implementation));
    }

    /**
     * <!-- begin-user-doc -->
     * <!-- end-user-doc -->
     * @generated
     */
    @Override
    public Object eGet(int featureID, boolean resolve, boolean coreType) {
        switch (featureID) {
            case OoplPackage.OOPL_SEQUENCE__ELEMENT_TYPE:
                if (resolve) return getElementType();
                return basicGetElementType();
            case OoplPackage.OOPL_SEQUENCE__ORDEREDNESS:
                return getOrderedness();
            case OoplPackage.OOPL_SEQUENCE__UNIQUENESS:
                return getUniqueness();
            case OoplPackage.OOPL_SEQUENCE__IMPLEMENTATION:
                if (resolve) return getImplementation();
                return basicGetImplementation();
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
            case OoplPackage.OOPL_SEQUENCE__ELEMENT_TYPE:
                setElementType((OOPLType)newValue);
                return;
            case OoplPackage.OOPL_SEQUENCE__ORDEREDNESS:
                setOrderedness((SequenceOrderednessKind)newValue);
                return;
            case OoplPackage.OOPL_SEQUENCE__UNIQUENESS:
                setUniqueness((SequenceUniquenessKind)newValue);
                return;
            case OoplPackage.OOPL_SEQUENCE__IMPLEMENTATION:
                setImplementation((OOPLSequenceImplementation)newValue);
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
            case OoplPackage.OOPL_SEQUENCE__ELEMENT_TYPE:
                setElementType((OOPLType)null);
                return;
            case OoplPackage.OOPL_SEQUENCE__ORDEREDNESS:
                setOrderedness(ORDEREDNESS_EDEFAULT);
                return;
            case OoplPackage.OOPL_SEQUENCE__UNIQUENESS:
                setUniqueness(UNIQUENESS_EDEFAULT);
                return;
            case OoplPackage.OOPL_SEQUENCE__IMPLEMENTATION:
                setImplementation((OOPLSequenceImplementation)null);
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
            case OoplPackage.OOPL_SEQUENCE__ELEMENT_TYPE:
                return elementType != null;
            case OoplPackage.OOPL_SEQUENCE__ORDEREDNESS:
                return orderedness != ORDEREDNESS_EDEFAULT;
            case OoplPackage.OOPL_SEQUENCE__UNIQUENESS:
                return uniqueness != UNIQUENESS_EDEFAULT;
            case OoplPackage.OOPL_SEQUENCE__IMPLEMENTATION:
                return implementation != null;
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
        result.append(" (orderedness: ");
        result.append(orderedness);
        result.append(", uniqueness: ");
        result.append(uniqueness);
        result.append(')');
        return result.toString();
    }

} //OOPLSequenceImpl
