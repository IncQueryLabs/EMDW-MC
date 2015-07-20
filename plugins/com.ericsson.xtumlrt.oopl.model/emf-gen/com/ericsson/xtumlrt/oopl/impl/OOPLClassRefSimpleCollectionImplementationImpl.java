/**
 */
package com.ericsson.xtumlrt.oopl.impl;

import com.ericsson.xtumlrt.oopl.OOPLClassRefSimpleCollectionImplementation;
import com.ericsson.xtumlrt.oopl.OoplPackage;
import com.ericsson.xtumlrt.oopl.SimpleCollectionKind;

import java.lang.reflect.InvocationTargetException;

import org.eclipse.emf.common.notify.Notification;

import org.eclipse.emf.common.util.EList;

import org.eclipse.emf.ecore.EClass;

import org.eclipse.emf.ecore.impl.ENotificationImpl;

/**
 * <!-- begin-user-doc -->
 * An implementation of the model object '<em><b>OOPL Class Ref Simple Collection Implementation</b></em>'.
 * <!-- end-user-doc -->
 * <p>
 * The following features are implemented:
 * </p>
 * <ul>
 *   <li>{@link com.ericsson.xtumlrt.oopl.impl.OOPLClassRefSimpleCollectionImplementationImpl#getKind <em>Kind</em>}</li>
 * </ul>
 *
 * @generated
 */
public class OOPLClassRefSimpleCollectionImplementationImpl extends BaseContainerImplementationImpl implements OOPLClassRefSimpleCollectionImplementation {
    /**
     * The default value of the '{@link #getKind() <em>Kind</em>}' attribute.
     * <!-- begin-user-doc -->
     * <!-- end-user-doc -->
     * @see #getKind()
     * @generated
     * @ordered
     */
    protected static final SimpleCollectionKind KIND_EDEFAULT = SimpleCollectionKind.SIMPLY_LINKED_LIST;

    /**
     * The cached value of the '{@link #getKind() <em>Kind</em>}' attribute.
     * <!-- begin-user-doc -->
     * <!-- end-user-doc -->
     * @see #getKind()
     * @generated
     * @ordered
     */
    protected SimpleCollectionKind kind = KIND_EDEFAULT;

    /**
     * <!-- begin-user-doc -->
     * <!-- end-user-doc -->
     * @generated
     */
    protected OOPLClassRefSimpleCollectionImplementationImpl() {
        super();
    }

    /**
     * <!-- begin-user-doc -->
     * <!-- end-user-doc -->
     * @generated
     */
    @Override
    protected EClass eStaticClass() {
        return OoplPackage.Literals.OOPL_CLASS_REF_SIMPLE_COLLECTION_IMPLEMENTATION;
    }

    /**
     * <!-- begin-user-doc -->
     * <!-- end-user-doc -->
     * @generated
     */
    public SimpleCollectionKind getKind() {
        return kind;
    }

    /**
     * <!-- begin-user-doc -->
     * <!-- end-user-doc -->
     * @generated
     */
    public void setKind(SimpleCollectionKind newKind) {
        SimpleCollectionKind oldKind = kind;
        kind = newKind == null ? KIND_EDEFAULT : newKind;
        if (eNotificationRequired())
            eNotify(new ENotificationImpl(this, Notification.SET, OoplPackage.OOPL_CLASS_REF_SIMPLE_COLLECTION_IMPLEMENTATION__KIND, oldKind, kind));
    }

    /**
     * <!-- begin-user-doc -->
     * <!-- end-user-doc -->
     * @generated
     */
    public String generateElementAtIndex(final String collection, final String valueType, final String index, final String result) {
        String template = com.ericsson.xtumlrt.oopl.OOPLClassRefSimpleCollectionImplementationTemplateReplacer.generateElementAtIndex(this, collection, valueType, index, result);
        return template;
    }

    /**
     * <!-- begin-user-doc -->
     * <!-- end-user-doc -->
     * @generated
     */
    public String generateInsertElementAtIndex(final String collection, final String value, final String valueType, final String index) {
        String template = com.ericsson.xtumlrt.oopl.OOPLClassRefSimpleCollectionImplementationTemplateReplacer.generateInsertElementAtIndex(this, collection, value, valueType, index);
        return template;
    }

    /**
     * <!-- begin-user-doc -->
     * <!-- end-user-doc -->
     * @generated
     */
    public String generateReplaceElementAtIndex(final String collection, final String value, final String valueType, final String index) {
        String template = com.ericsson.xtumlrt.oopl.OOPLClassRefSimpleCollectionImplementationTemplateReplacer.generateReplaceElementAtIndex(this, collection, value, valueType, index);
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
            case OoplPackage.OOPL_CLASS_REF_SIMPLE_COLLECTION_IMPLEMENTATION__KIND:
                return getKind();
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
            case OoplPackage.OOPL_CLASS_REF_SIMPLE_COLLECTION_IMPLEMENTATION__KIND:
                setKind((SimpleCollectionKind)newValue);
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
            case OoplPackage.OOPL_CLASS_REF_SIMPLE_COLLECTION_IMPLEMENTATION__KIND:
                setKind(KIND_EDEFAULT);
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
            case OoplPackage.OOPL_CLASS_REF_SIMPLE_COLLECTION_IMPLEMENTATION__KIND:
                return kind != KIND_EDEFAULT;
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
            case OoplPackage.OOPL_CLASS_REF_SIMPLE_COLLECTION_IMPLEMENTATION___GENERATE_ELEMENT_AT_INDEX__STRING_STRING_STRING_STRING:
                return generateElementAtIndex((String)arguments.get(0), (String)arguments.get(1), (String)arguments.get(2), (String)arguments.get(3));
            case OoplPackage.OOPL_CLASS_REF_SIMPLE_COLLECTION_IMPLEMENTATION___GENERATE_INSERT_ELEMENT_AT_INDEX__STRING_STRING_STRING_STRING:
                return generateInsertElementAtIndex((String)arguments.get(0), (String)arguments.get(1), (String)arguments.get(2), (String)arguments.get(3));
            case OoplPackage.OOPL_CLASS_REF_SIMPLE_COLLECTION_IMPLEMENTATION___GENERATE_REPLACE_ELEMENT_AT_INDEX__STRING_STRING_STRING_STRING:
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
        result.append(" (kind: ");
        result.append(kind);
        result.append(')');
        return result.toString();
    }

} //OOPLClassRefSimpleCollectionImplementationImpl
