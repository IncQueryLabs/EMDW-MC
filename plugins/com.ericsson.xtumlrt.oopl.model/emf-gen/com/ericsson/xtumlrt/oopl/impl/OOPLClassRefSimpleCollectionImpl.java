/**
 */
package com.ericsson.xtumlrt.oopl.impl;

import com.ericsson.xtumlrt.oopl.OOPLClassRefSimpleCollection;
import com.ericsson.xtumlrt.oopl.OOPLClassRefSimpleCollectionImplementation;
import com.ericsson.xtumlrt.oopl.OoplPackage;
import com.ericsson.xtumlrt.oopl.SimpleCollectionKind;

import org.eclipse.emf.common.notify.Notification;

import org.eclipse.emf.ecore.EClass;
import org.eclipse.emf.ecore.InternalEObject;

import org.eclipse.emf.ecore.impl.ENotificationImpl;

/**
 * <!-- begin-user-doc -->
 * An implementation of the model object '<em><b>OOPL Class Ref Simple Collection</b></em>'.
 * <!-- end-user-doc -->
 * <p>
 * The following features are implemented:
 * </p>
 * <ul>
 *   <li>{@link com.ericsson.xtumlrt.oopl.impl.OOPLClassRefSimpleCollectionImpl#getKind <em>Kind</em>}</li>
 *   <li>{@link com.ericsson.xtumlrt.oopl.impl.OOPLClassRefSimpleCollectionImpl#getImplementation <em>Implementation</em>}</li>
 * </ul>
 *
 * @generated
 */
public class OOPLClassRefSimpleCollectionImpl extends OOPLClassReferenceCollectionImpl implements OOPLClassRefSimpleCollection {
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
     * The cached value of the '{@link #getImplementation() <em>Implementation</em>}' reference.
     * <!-- begin-user-doc -->
     * <!-- end-user-doc -->
     * @see #getImplementation()
     * @generated
     * @ordered
     */
    protected OOPLClassRefSimpleCollectionImplementation implementation;

    /**
     * <!-- begin-user-doc -->
     * <!-- end-user-doc -->
     * @generated
     */
    protected OOPLClassRefSimpleCollectionImpl() {
        super();
    }

    /**
     * <!-- begin-user-doc -->
     * <!-- end-user-doc -->
     * @generated
     */
    @Override
    protected EClass eStaticClass() {
        return OoplPackage.Literals.OOPL_CLASS_REF_SIMPLE_COLLECTION;
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
            eNotify(new ENotificationImpl(this, Notification.SET, OoplPackage.OOPL_CLASS_REF_SIMPLE_COLLECTION__KIND, oldKind, kind));
    }

    /**
     * <!-- begin-user-doc -->
     * <!-- end-user-doc -->
     * @generated
     */
    public OOPLClassRefSimpleCollectionImplementation getImplementation() {
        if (implementation != null && implementation.eIsProxy()) {
            InternalEObject oldImplementation = (InternalEObject)implementation;
            implementation = (OOPLClassRefSimpleCollectionImplementation)eResolveProxy(oldImplementation);
            if (implementation != oldImplementation) {
                if (eNotificationRequired())
                    eNotify(new ENotificationImpl(this, Notification.RESOLVE, OoplPackage.OOPL_CLASS_REF_SIMPLE_COLLECTION__IMPLEMENTATION, oldImplementation, implementation));
            }
        }
        return implementation;
    }

    /**
     * <!-- begin-user-doc -->
     * <!-- end-user-doc -->
     * @generated
     */
    public OOPLClassRefSimpleCollectionImplementation basicGetImplementation() {
        return implementation;
    }

    /**
     * <!-- begin-user-doc -->
     * <!-- end-user-doc -->
     * @generated
     */
    public void setImplementation(OOPLClassRefSimpleCollectionImplementation newImplementation) {
        OOPLClassRefSimpleCollectionImplementation oldImplementation = implementation;
        implementation = newImplementation;
        if (eNotificationRequired())
            eNotify(new ENotificationImpl(this, Notification.SET, OoplPackage.OOPL_CLASS_REF_SIMPLE_COLLECTION__IMPLEMENTATION, oldImplementation, implementation));
    }

    /**
     * <!-- begin-user-doc -->
     * <!-- end-user-doc -->
     * @generated
     */
    @Override
    public Object eGet(int featureID, boolean resolve, boolean coreType) {
        switch (featureID) {
            case OoplPackage.OOPL_CLASS_REF_SIMPLE_COLLECTION__KIND:
                return getKind();
            case OoplPackage.OOPL_CLASS_REF_SIMPLE_COLLECTION__IMPLEMENTATION:
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
            case OoplPackage.OOPL_CLASS_REF_SIMPLE_COLLECTION__KIND:
                setKind((SimpleCollectionKind)newValue);
                return;
            case OoplPackage.OOPL_CLASS_REF_SIMPLE_COLLECTION__IMPLEMENTATION:
                setImplementation((OOPLClassRefSimpleCollectionImplementation)newValue);
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
            case OoplPackage.OOPL_CLASS_REF_SIMPLE_COLLECTION__KIND:
                setKind(KIND_EDEFAULT);
                return;
            case OoplPackage.OOPL_CLASS_REF_SIMPLE_COLLECTION__IMPLEMENTATION:
                setImplementation((OOPLClassRefSimpleCollectionImplementation)null);
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
            case OoplPackage.OOPL_CLASS_REF_SIMPLE_COLLECTION__KIND:
                return kind != KIND_EDEFAULT;
            case OoplPackage.OOPL_CLASS_REF_SIMPLE_COLLECTION__IMPLEMENTATION:
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
        result.append(" (kind: ");
        result.append(kind);
        result.append(')');
        return result.toString();
    }

} //OOPLClassRefSimpleCollectionImpl
