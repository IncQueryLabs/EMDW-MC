/**
 */
package com.ericsson.xtumlrt.oopl.impl;

import com.ericsson.xtumlrt.oopl.OOPLSequenceImplementation;
import com.ericsson.xtumlrt.oopl.OoplPackage;
import com.ericsson.xtumlrt.oopl.SequenceOrderednessKind;
import com.ericsson.xtumlrt.oopl.SequenceUniquenessKind;

import java.lang.reflect.InvocationTargetException;

import org.eclipse.emf.common.notify.Notification;

import org.eclipse.emf.common.util.EList;

import org.eclipse.emf.ecore.EClass;

import org.eclipse.emf.ecore.impl.ENotificationImpl;

/**
 * <!-- begin-user-doc -->
 * An implementation of the model object '<em><b>OOPL Sequence Implementation</b></em>'.
 * <!-- end-user-doc -->
 * <p>
 * The following features are implemented:
 * </p>
 * <ul>
 *   <li>{@link com.ericsson.xtumlrt.oopl.impl.OOPLSequenceImplementationImpl#getUniqueness <em>Uniqueness</em>}</li>
 *   <li>{@link com.ericsson.xtumlrt.oopl.impl.OOPLSequenceImplementationImpl#getOrderedness <em>Orderedness</em>}</li>
 * </ul>
 *
 * @generated
 */
public class OOPLSequenceImplementationImpl extends BaseContainerImplementationImpl implements OOPLSequenceImplementation {
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
     * <!-- begin-user-doc -->
     * <!-- end-user-doc -->
     * @generated
     */
    protected OOPLSequenceImplementationImpl() {
        super();
    }

    /**
     * <!-- begin-user-doc -->
     * <!-- end-user-doc -->
     * @generated
     */
    @Override
    protected EClass eStaticClass() {
        return OoplPackage.Literals.OOPL_SEQUENCE_IMPLEMENTATION;
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
            eNotify(new ENotificationImpl(this, Notification.SET, OoplPackage.OOPL_SEQUENCE_IMPLEMENTATION__UNIQUENESS, oldUniqueness, uniqueness));
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
            eNotify(new ENotificationImpl(this, Notification.SET, OoplPackage.OOPL_SEQUENCE_IMPLEMENTATION__ORDEREDNESS, oldOrderedness, orderedness));
    }

    /**
     * <!-- begin-user-doc -->
     * <!-- end-user-doc -->
     * @generated
     */
    public String generateAny(final String collection, final String valueType, final String result) {
        String template = com.ericsson.xtumlrt.oopl.OOPLSequenceImplementationTemplateReplacer.generateAny(this, collection, valueType, result);
        return template;
    }

    /**
     * <!-- begin-user-doc -->
     * <!-- end-user-doc -->
     * @generated
     */
    public String generateCountOf(final String collection, final String value, final String result) {
        String template = com.ericsson.xtumlrt.oopl.OOPLSequenceImplementationTemplateReplacer.generateCountOf(this, collection, value, result);
        return template;
    }

    /**
     * <!-- begin-user-doc -->
     * <!-- end-user-doc -->
     * @generated
     */
    public String generateElementAtIndex(final String collection, final String valueType, final String index, final String result) {
        String template = com.ericsson.xtumlrt.oopl.OOPLSequenceImplementationTemplateReplacer.generateElementAtIndex(this, collection, valueType, index, result);
        return template;
    }

    /**
     * <!-- begin-user-doc -->
     * <!-- end-user-doc -->
     * @generated
     */
    public String generateInsertElementAtIndex(final String collection, final String value, final String valueType, final String index) {
        String template = com.ericsson.xtumlrt.oopl.OOPLSequenceImplementationTemplateReplacer.generateInsertElementAtIndex(this, collection, value, valueType, index);
        return template;
    }

    /**
     * <!-- begin-user-doc -->
     * <!-- end-user-doc -->
     * @generated
     */
    public String generateReplaceElementAtIndex(final String collection, final String value, final String valueType, final String index) {
        String template = com.ericsson.xtumlrt.oopl.OOPLSequenceImplementationTemplateReplacer.generateReplaceElementAtIndex(this, collection, value, valueType, index);
        return template;
    }

    /**
     * <!-- begin-user-doc -->
     * <!-- end-user-doc -->
     * @generated
     */
    @Override
    public Object eGet(int featureID, boolean resolve, boolean coreType) {
        switch (featureID) {
            case OoplPackage.OOPL_SEQUENCE_IMPLEMENTATION__UNIQUENESS:
                return getUniqueness();
            case OoplPackage.OOPL_SEQUENCE_IMPLEMENTATION__ORDEREDNESS:
                return getOrderedness();
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
            case OoplPackage.OOPL_SEQUENCE_IMPLEMENTATION__UNIQUENESS:
                setUniqueness((SequenceUniquenessKind)newValue);
                return;
            case OoplPackage.OOPL_SEQUENCE_IMPLEMENTATION__ORDEREDNESS:
                setOrderedness((SequenceOrderednessKind)newValue);
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
            case OoplPackage.OOPL_SEQUENCE_IMPLEMENTATION__UNIQUENESS:
                setUniqueness(UNIQUENESS_EDEFAULT);
                return;
            case OoplPackage.OOPL_SEQUENCE_IMPLEMENTATION__ORDEREDNESS:
                setOrderedness(ORDEREDNESS_EDEFAULT);
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
            case OoplPackage.OOPL_SEQUENCE_IMPLEMENTATION__UNIQUENESS:
                return uniqueness != UNIQUENESS_EDEFAULT;
            case OoplPackage.OOPL_SEQUENCE_IMPLEMENTATION__ORDEREDNESS:
                return orderedness != ORDEREDNESS_EDEFAULT;
        }
        return super.eIsSet(featureID);
    }

    /**
     * <!-- begin-user-doc -->
     * <!-- end-user-doc -->
     * @generated
     */
    @Override
    public Object eInvoke(int operationID, EList<?> arguments) throws InvocationTargetException {
        switch (operationID) {
            case OoplPackage.OOPL_SEQUENCE_IMPLEMENTATION___GENERATE_ANY__STRING_STRING_STRING:
                return generateAny((String)arguments.get(0), (String)arguments.get(1), (String)arguments.get(2));
            case OoplPackage.OOPL_SEQUENCE_IMPLEMENTATION___GENERATE_COUNT_OF__STRING_STRING_STRING:
                return generateCountOf((String)arguments.get(0), (String)arguments.get(1), (String)arguments.get(2));
            case OoplPackage.OOPL_SEQUENCE_IMPLEMENTATION___GENERATE_ELEMENT_AT_INDEX__STRING_STRING_STRING_STRING:
                return generateElementAtIndex((String)arguments.get(0), (String)arguments.get(1), (String)arguments.get(2), (String)arguments.get(3));
            case OoplPackage.OOPL_SEQUENCE_IMPLEMENTATION___GENERATE_INSERT_ELEMENT_AT_INDEX__STRING_STRING_STRING_STRING:
                return generateInsertElementAtIndex((String)arguments.get(0), (String)arguments.get(1), (String)arguments.get(2), (String)arguments.get(3));
            case OoplPackage.OOPL_SEQUENCE_IMPLEMENTATION___GENERATE_REPLACE_ELEMENT_AT_INDEX__STRING_STRING_STRING_STRING:
                return generateReplaceElementAtIndex((String)arguments.get(0), (String)arguments.get(1), (String)arguments.get(2), (String)arguments.get(3));
        }
        return super.eInvoke(operationID, arguments);
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
        result.append(" (uniqueness: ");
        result.append(uniqueness);
        result.append(", orderedness: ");
        result.append(orderedness);
        result.append(')');
        return result.toString();
    }

} //OOPLSequenceImplementationImpl
