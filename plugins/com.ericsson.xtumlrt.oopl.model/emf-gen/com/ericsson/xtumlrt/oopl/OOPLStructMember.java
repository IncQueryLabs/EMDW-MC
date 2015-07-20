/**
 */
package com.ericsson.xtumlrt.oopl;

import org.eclipse.emf.ecore.EObject;

import org.eclipse.papyrusrt.xtumlrt.common.Attribute;

/**
 * <!-- begin-user-doc -->
 * A representation of the model object '<em><b>OOPL Struct Member</b></em>'.
 * <!-- end-user-doc -->
 *
 * <!-- begin-model-doc -->
 * Member of structure type ({@link com.ericsson.xtumlrt.oopl.OOPLStructType}) in OOP languages corresponding to ({@link org.eclipse.papyrusrt.xtumlrt.common.StructMember}).
 * <!-- end-model-doc -->
 *
 * <p>
 * The following features are supported:
 * </p>
 * <ul>
 *   <li>{@link com.ericsson.xtumlrt.oopl.OOPLStructMember#getCommonMember <em>Common Member</em>}</li>
 *   <li>{@link com.ericsson.xtumlrt.oopl.OOPLStructMember#getType <em>Type</em>}</li>
 * </ul>
 *
 * @see com.ericsson.xtumlrt.oopl.OoplPackage#getOOPLStructMember()
 * @model abstract="true"
 * @generated
 */
public interface OOPLStructMember extends EObject {
    /**
     * Returns the value of the '<em><b>Common Member</b></em>' reference.
     * <!-- begin-user-doc -->
     * <p>
     * If the meaning of the '<em>Common Member</em>' reference isn't clear,
     * there really should be more of a description here...
     * </p>
     * <!-- end-user-doc -->
     * @return the value of the '<em>Common Member</em>' reference.
     * @see #setCommonMember(Attribute)
     * @see com.ericsson.xtumlrt.oopl.OoplPackage#getOOPLStructMember_CommonMember()
     * @model required="true"
     * @generated
     */
    Attribute getCommonMember();

    /**
     * Sets the value of the '{@link com.ericsson.xtumlrt.oopl.OOPLStructMember#getCommonMember <em>Common Member</em>}' reference.
     * <!-- begin-user-doc -->
     * <!-- end-user-doc -->
     * @param value the new value of the '<em>Common Member</em>' reference.
     * @see #getCommonMember()
     * @generated
     */
    void setCommonMember(Attribute value);

    /**
     * Returns the value of the '<em><b>Type</b></em>' reference.
     * <!-- begin-user-doc -->
     * <!-- end-user-doc -->
     * <!-- begin-model-doc -->
     * {
     * 	OOPLStructMember.commonMember.type(ooplStructMember, type);
     * 	OOPLType.commonType(ooplType, type);
     * }
     * <!-- end-model-doc -->
     * @return the value of the '<em>Type</em>' reference.
     * @see com.ericsson.xtumlrt.oopl.OoplPackage#getOOPLStructMember_Type()
     * @model required="true" changeable="false" derived="true"
     * @generated
     */
    OOPLType getType();

} // OOPLStructMember
