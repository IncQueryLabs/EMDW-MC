/**
 */
package com.ericsson.xtumlrt.oopl;

import org.eclipse.emf.ecore.EObject;

import org.eclipse.papyrusrt.xtumlrt.common.Type;

/**
 * <!-- begin-user-doc -->
 * A representation of the model object '<em><b>OOPL Type</b></em>'.
 * <!-- end-user-doc -->
 *
 * <!-- begin-model-doc -->
 * Representation of common type ({@link org.eclipse.papyrusrt.xtumlrt.common.Type}) for OOP languages.
 * <!-- end-model-doc -->
 *
 * <p>
 * The following features are supported:
 * </p>
 * <ul>
 *   <li>{@link com.ericsson.xtumlrt.oopl.OOPLType#getCommonType <em>Common Type</em>}</li>
 * </ul>
 *
 * @see com.ericsson.xtumlrt.oopl.OoplPackage#getOOPLType()
 * @model abstract="true"
 * @generated
 */
public interface OOPLType extends EObject {
    /**
     * Returns the value of the '<em><b>Common Type</b></em>' reference.
     * <!-- begin-user-doc -->
     * <p>
     * If the meaning of the '<em>Common Type</em>' reference isn't clear,
     * there really should be more of a description here...
     * </p>
     * <!-- end-user-doc -->
     * @return the value of the '<em>Common Type</em>' reference.
     * @see #setCommonType(Type)
     * @see com.ericsson.xtumlrt.oopl.OoplPackage#getOOPLType_CommonType()
     * @model
     * @generated
     */
    Type getCommonType();

    /**
     * Sets the value of the '{@link com.ericsson.xtumlrt.oopl.OOPLType#getCommonType <em>Common Type</em>}' reference.
     * <!-- begin-user-doc -->
     * <!-- end-user-doc -->
     * @param value the new value of the '<em>Common Type</em>' reference.
     * @see #getCommonType()
     * @generated
     */
    void setCommonType(Type value);

} // OOPLType
