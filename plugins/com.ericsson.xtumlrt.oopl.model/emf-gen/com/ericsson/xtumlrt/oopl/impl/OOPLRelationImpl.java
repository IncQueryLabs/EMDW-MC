/**
 */
package com.ericsson.xtumlrt.oopl.impl;

import com.ericsson.xtumlrt.oopl.OOPLClassReferenceStorage;
import com.ericsson.xtumlrt.oopl.OOPLRelation;
import com.ericsson.xtumlrt.oopl.OoplPackage;

import java.util.Collection;

import org.eclipse.emf.common.notify.Notification;

import org.eclipse.emf.common.util.EList;

import org.eclipse.emf.ecore.EClass;
import org.eclipse.emf.ecore.InternalEObject;

import org.eclipse.emf.ecore.impl.ENotificationImpl;
import org.eclipse.emf.ecore.impl.MinimalEObjectImpl;

import org.eclipse.emf.ecore.util.EObjectResolvingEList;

import org.eclipse.papyrusrt.xtumlrt.xtuml.XTRelation;

/**
 * <!-- begin-user-doc -->
 * An implementation of the model object '<em><b>OOPL Relation</b></em>'.
 * <!-- end-user-doc -->
 * <p>
 * The following features are implemented:
 * </p>
 * <ul>
 *   <li>{@link com.ericsson.xtumlrt.oopl.impl.OOPLRelationImpl#getXtRelation <em>Xt Relation</em>}</li>
 *   <li>{@link com.ericsson.xtumlrt.oopl.impl.OOPLRelationImpl#getReferenceStorage <em>Reference Storage</em>}</li>
 * </ul>
 *
 * @generated
 */
public abstract class OOPLRelationImpl extends MinimalEObjectImpl.Container implements OOPLRelation {
    /**
     * The cached value of the '{@link #getXtRelation() <em>Xt Relation</em>}' reference.
     * <!-- begin-user-doc -->
     * <!-- end-user-doc -->
     * @see #getXtRelation()
     * @generated
     * @ordered
     */
    protected XTRelation xtRelation;

    /**
     * The cached value of the '{@link #getReferenceStorage() <em>Reference Storage</em>}' reference list.
     * <!-- begin-user-doc -->
     * <!-- end-user-doc -->
     * @see #getReferenceStorage()
     * @generated
     * @ordered
     */
    protected EList<OOPLClassReferenceStorage> referenceStorage;

    /**
     * <!-- begin-user-doc -->
     * <!-- end-user-doc -->
     * @generated
     */
    protected OOPLRelationImpl() {
        super();
    }

    /**
     * <!-- begin-user-doc -->
     * <!-- end-user-doc -->
     * @generated
     */
    @Override
    protected EClass eStaticClass() {
        return OoplPackage.Literals.OOPL_RELATION;
    }

    /**
     * <!-- begin-user-doc -->
     * <!-- end-user-doc -->
     * @generated
     */
    public XTRelation getXtRelation() {
        if (xtRelation != null && xtRelation.eIsProxy()) {
            InternalEObject oldXtRelation = (InternalEObject)xtRelation;
            xtRelation = (XTRelation)eResolveProxy(oldXtRelation);
            if (xtRelation != oldXtRelation) {
                if (eNotificationRequired())
                    eNotify(new ENotificationImpl(this, Notification.RESOLVE, OoplPackage.OOPL_RELATION__XT_RELATION, oldXtRelation, xtRelation));
            }
        }
        return xtRelation;
    }

    /**
     * <!-- begin-user-doc -->
     * <!-- end-user-doc -->
     * @generated
     */
    public XTRelation basicGetXtRelation() {
        return xtRelation;
    }

    /**
     * <!-- begin-user-doc -->
     * <!-- end-user-doc -->
     * @generated
     */
    public void setXtRelation(XTRelation newXtRelation) {
        XTRelation oldXtRelation = xtRelation;
        xtRelation = newXtRelation;
        if (eNotificationRequired())
            eNotify(new ENotificationImpl(this, Notification.SET, OoplPackage.OOPL_RELATION__XT_RELATION, oldXtRelation, xtRelation));
    }

    /**
     * <!-- begin-user-doc -->
     * <!-- end-user-doc -->
     * @generated
     */
    public EList<OOPLClassReferenceStorage> getReferenceStorage() {
        if (referenceStorage == null) {
            referenceStorage = new EObjectResolvingEList<OOPLClassReferenceStorage>(OOPLClassReferenceStorage.class, this, OoplPackage.OOPL_RELATION__REFERENCE_STORAGE);
        }
        return referenceStorage;
    }

    /**
     * <!-- begin-user-doc -->
     * <!-- end-user-doc -->
     * @generated
     */
    @Override
    public Object eGet(int featureID, boolean resolve, boolean coreType) {
        switch (featureID) {
            case OoplPackage.OOPL_RELATION__XT_RELATION:
                if (resolve) return getXtRelation();
                return basicGetXtRelation();
            case OoplPackage.OOPL_RELATION__REFERENCE_STORAGE:
                return getReferenceStorage();
        }
        return super.eGet(featureID, resolve, coreType);
    }

    /**
     * <!-- begin-user-doc -->
     * <!-- end-user-doc -->
     * @generated
     */
    @SuppressWarnings("unchecked")
    @Override
    public void eSet(int featureID, Object newValue) {
        switch (featureID) {
            case OoplPackage.OOPL_RELATION__XT_RELATION:
                setXtRelation((XTRelation)newValue);
                return;
            case OoplPackage.OOPL_RELATION__REFERENCE_STORAGE:
                getReferenceStorage().clear();
                getReferenceStorage().addAll((Collection<? extends OOPLClassReferenceStorage>)newValue);
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
            case OoplPackage.OOPL_RELATION__XT_RELATION:
                setXtRelation((XTRelation)null);
                return;
            case OoplPackage.OOPL_RELATION__REFERENCE_STORAGE:
                getReferenceStorage().clear();
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
            case OoplPackage.OOPL_RELATION__XT_RELATION:
                return xtRelation != null;
            case OoplPackage.OOPL_RELATION__REFERENCE_STORAGE:
                return referenceStorage != null && !referenceStorage.isEmpty();
        }
        return super.eIsSet(featureID);
    }

} //OOPLRelationImpl
