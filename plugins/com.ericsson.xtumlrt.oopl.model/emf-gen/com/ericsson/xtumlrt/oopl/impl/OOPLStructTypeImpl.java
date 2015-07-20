/**
 */
package com.ericsson.xtumlrt.oopl.impl;

import com.ericsson.xtumlrt.oopl.OOPLStructMember;
import com.ericsson.xtumlrt.oopl.OOPLStructType;
import com.ericsson.xtumlrt.oopl.OoplPackage;

import org.eclipse.emf.common.util.EList;

import org.eclipse.emf.ecore.EClass;

import org.eclipse.emf.ecore.util.EObjectResolvingEList;

/**
 * <!-- begin-user-doc -->
 * An implementation of the model object '<em><b>OOPL Struct Type</b></em>'.
 * <!-- end-user-doc -->
 * <p>
 * The following features are implemented:
 * </p>
 * <ul>
 *   <li>{@link com.ericsson.xtumlrt.oopl.impl.OOPLStructTypeImpl#getMembers <em>Members</em>}</li>
 * </ul>
 *
 * @generated
 */
public abstract class OOPLStructTypeImpl extends OOPLTypeImpl implements OOPLStructType {
    /**
     * The cached value of the '{@link #getMembers() <em>Members</em>}' reference list.
     * <!-- begin-user-doc -->
     * <!-- end-user-doc -->
     * @see #getMembers()
     * @generated
     * @ordered
     */
    protected EList<OOPLStructMember> members;

    /**
     * <!-- begin-user-doc -->
     * <!-- end-user-doc -->
     * @generated
     */
    protected OOPLStructTypeImpl() {
        super();
    }

    /**
     * <!-- begin-user-doc -->
     * <!-- end-user-doc -->
     * @generated
     */
    @Override
    protected EClass eStaticClass() {
        return OoplPackage.Literals.OOPL_STRUCT_TYPE;
    }

    /**
     * <!-- begin-user-doc -->
     * <!-- end-user-doc -->
     * @generated
     */
    public EList<OOPLStructMember> getMembers() {
        if (members == null) {
            members = new EObjectResolvingEList<OOPLStructMember>(OOPLStructMember.class, this, OoplPackage.OOPL_STRUCT_TYPE__MEMBERS);
        }
        return members;
    }

    /**
     * <!-- begin-user-doc -->
     * <!-- end-user-doc -->
     * @generated
     */
    @Override
    public Object eGet(int featureID, boolean resolve, boolean coreType) {
        switch (featureID) {
            case OoplPackage.OOPL_STRUCT_TYPE__MEMBERS:
                return getMembers();
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
            case OoplPackage.OOPL_STRUCT_TYPE__MEMBERS:
                return members != null && !members.isEmpty();
        }
        return super.eIsSet(featureID);
    }

} //OOPLStructTypeImpl
