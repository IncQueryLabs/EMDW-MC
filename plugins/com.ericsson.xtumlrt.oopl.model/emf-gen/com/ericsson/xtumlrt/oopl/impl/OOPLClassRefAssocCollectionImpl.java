/**
 */
package com.ericsson.xtumlrt.oopl.impl;

import com.ericsson.xtumlrt.oopl.AssociativeCollectionKind;
import com.ericsson.xtumlrt.oopl.OOPLClassRefAssocCollection;
import com.ericsson.xtumlrt.oopl.OOPLClassRefAssocCollectionImplementation;
import com.ericsson.xtumlrt.oopl.OoplPackage;

import org.eclipse.emf.common.notify.Notification;

import org.eclipse.emf.ecore.EClass;
import org.eclipse.emf.ecore.InternalEObject;

import org.eclipse.emf.ecore.impl.ENotificationImpl;

import org.eclipse.papyrusrt.xtumlrt.common.Attribute;

/**
 * <!-- begin-user-doc -->
 * An implementation of the model object '<em><b>OOPL Class Ref Assoc Collection</b></em>'.
 * <!-- end-user-doc -->
 * <p>
 * The following features are implemented:
 * </p>
 * <ul>
 *   <li>{@link com.ericsson.xtumlrt.oopl.impl.OOPLClassRefAssocCollectionImpl#getKey <em>Key</em>}</li>
 *   <li>{@link com.ericsson.xtumlrt.oopl.impl.OOPLClassRefAssocCollectionImpl#getKind <em>Kind</em>}</li>
 *   <li>{@link com.ericsson.xtumlrt.oopl.impl.OOPLClassRefAssocCollectionImpl#getImplementation <em>Implementation</em>}</li>
 * </ul>
 *
 * @generated
 */
public class OOPLClassRefAssocCollectionImpl extends OOPLClassReferenceCollectionImpl implements OOPLClassRefAssocCollection {
    /**
     * The cached value of the '{@link #getKey() <em>Key</em>}' reference.
     * <!-- begin-user-doc -->
     * <!-- end-user-doc -->
     * @see #getKey()
     * @generated
     * @ordered
     */
    protected Attribute key;

    /**
     * The default value of the '{@link #getKind() <em>Kind</em>}' attribute.
     * <!-- begin-user-doc -->
     * <!-- end-user-doc -->
     * @see #getKind()
     * @generated
     * @ordered
     */
    protected static final AssociativeCollectionKind KIND_EDEFAULT = AssociativeCollectionKind.UNORDERED_SET;

    /**
     * The cached value of the '{@link #getKind() <em>Kind</em>}' attribute.
     * <!-- begin-user-doc -->
     * <!-- end-user-doc -->
     * @see #getKind()
     * @generated
     * @ordered
     */
    protected AssociativeCollectionKind kind = KIND_EDEFAULT;

    /**
     * The cached value of the '{@link #getImplementation() <em>Implementation</em>}' reference.
     * <!-- begin-user-doc -->
     * <!-- end-user-doc -->
     * @see #getImplementation()
     * @generated
     * @ordered
     */
    protected OOPLClassRefAssocCollectionImplementation implementation;

    /**
     * <!-- begin-user-doc -->
     * <!-- end-user-doc -->
     * @generated
     */
    protected OOPLClassRefAssocCollectionImpl() {
        super();
    }

    /**
     * <!-- begin-user-doc -->
     * <!-- end-user-doc -->
     * @generated
     */
    @Override
    protected EClass eStaticClass() {
        return OoplPackage.Literals.OOPL_CLASS_REF_ASSOC_COLLECTION;
    }

    /**
     * <!-- begin-user-doc -->
     * <!-- end-user-doc -->
     * @generated
     */
    public Attribute getKey() {
        if (key != null && key.eIsProxy()) {
            InternalEObject oldKey = (InternalEObject)key;
            key = (Attribute)eResolveProxy(oldKey);
            if (key != oldKey) {
                if (eNotificationRequired())
                    eNotify(new ENotificationImpl(this, Notification.RESOLVE, OoplPackage.OOPL_CLASS_REF_ASSOC_COLLECTION__KEY, oldKey, key));
            }
        }
        return key;
    }

    /**
     * <!-- begin-user-doc -->
     * <!-- end-user-doc -->
     * @generated
     */
    public Attribute basicGetKey() {
        return key;
    }

    /**
     * <!-- begin-user-doc -->
     * <!-- end-user-doc -->
     * @generated
     */
    public void setKey(Attribute newKey) {
        Attribute oldKey = key;
        key = newKey;
        if (eNotificationRequired())
            eNotify(new ENotificationImpl(this, Notification.SET, OoplPackage.OOPL_CLASS_REF_ASSOC_COLLECTION__KEY, oldKey, key));
    }

    /**
     * <!-- begin-user-doc -->
     * <!-- end-user-doc -->
     * @generated
     */
    public AssociativeCollectionKind getKind() {
        return kind;
    }

    /**
     * <!-- begin-user-doc -->
     * <!-- end-user-doc -->
     * @generated
     */
    public void setKind(AssociativeCollectionKind newKind) {
        AssociativeCollectionKind oldKind = kind;
        kind = newKind == null ? KIND_EDEFAULT : newKind;
        if (eNotificationRequired())
            eNotify(new ENotificationImpl(this, Notification.SET, OoplPackage.OOPL_CLASS_REF_ASSOC_COLLECTION__KIND, oldKind, kind));
    }

    /**
     * <!-- begin-user-doc -->
     * <!-- end-user-doc -->
     * @generated
     */
    public OOPLClassRefAssocCollectionImplementation getImplementation() {
        if (implementation != null && implementation.eIsProxy()) {
            InternalEObject oldImplementation = (InternalEObject)implementation;
            implementation = (OOPLClassRefAssocCollectionImplementation)eResolveProxy(oldImplementation);
            if (implementation != oldImplementation) {
                if (eNotificationRequired())
                    eNotify(new ENotificationImpl(this, Notification.RESOLVE, OoplPackage.OOPL_CLASS_REF_ASSOC_COLLECTION__IMPLEMENTATION, oldImplementation, implementation));
            }
        }
        return implementation;
    }

    /**
     * <!-- begin-user-doc -->
     * <!-- end-user-doc -->
     * @generated
     */
    public OOPLClassRefAssocCollectionImplementation basicGetImplementation() {
        return implementation;
    }

    /**
     * <!-- begin-user-doc -->
     * <!-- end-user-doc -->
     * @generated
     */
    public void setImplementation(OOPLClassRefAssocCollectionImplementation newImplementation) {
        OOPLClassRefAssocCollectionImplementation oldImplementation = implementation;
        implementation = newImplementation;
        if (eNotificationRequired())
            eNotify(new ENotificationImpl(this, Notification.SET, OoplPackage.OOPL_CLASS_REF_ASSOC_COLLECTION__IMPLEMENTATION, oldImplementation, implementation));
    }

    /**
     * <!-- begin-user-doc -->
     * <!-- end-user-doc -->
     * @generated
     */
    @Override
    public Object eGet(int featureID, boolean resolve, boolean coreType) {
        switch (featureID) {
            case OoplPackage.OOPL_CLASS_REF_ASSOC_COLLECTION__KEY:
                if (resolve) return getKey();
                return basicGetKey();
            case OoplPackage.OOPL_CLASS_REF_ASSOC_COLLECTION__KIND:
                return getKind();
            case OoplPackage.OOPL_CLASS_REF_ASSOC_COLLECTION__IMPLEMENTATION:
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
            case OoplPackage.OOPL_CLASS_REF_ASSOC_COLLECTION__KEY:
                setKey((Attribute)newValue);
                return;
            case OoplPackage.OOPL_CLASS_REF_ASSOC_COLLECTION__KIND:
                setKind((AssociativeCollectionKind)newValue);
                return;
            case OoplPackage.OOPL_CLASS_REF_ASSOC_COLLECTION__IMPLEMENTATION:
                setImplementation((OOPLClassRefAssocCollectionImplementation)newValue);
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
            case OoplPackage.OOPL_CLASS_REF_ASSOC_COLLECTION__KEY:
                setKey((Attribute)null);
                return;
            case OoplPackage.OOPL_CLASS_REF_ASSOC_COLLECTION__KIND:
                setKind(KIND_EDEFAULT);
                return;
            case OoplPackage.OOPL_CLASS_REF_ASSOC_COLLECTION__IMPLEMENTATION:
                setImplementation((OOPLClassRefAssocCollectionImplementation)null);
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
            case OoplPackage.OOPL_CLASS_REF_ASSOC_COLLECTION__KEY:
                return key != null;
            case OoplPackage.OOPL_CLASS_REF_ASSOC_COLLECTION__KIND:
                return kind != KIND_EDEFAULT;
            case OoplPackage.OOPL_CLASS_REF_ASSOC_COLLECTION__IMPLEMENTATION:
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

} //OOPLClassRefAssocCollectionImpl
