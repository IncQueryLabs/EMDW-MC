/**
 */
package com.ericsson.xtumlrt.oopl;

import org.eclipse.emf.ecore.EObject;

import org.eclipse.papyrusrt.xtumlrt.common.EnumerationLiteral;

/**
 * <!-- begin-user-doc -->
 * A representation of the model object '<em><b>OOPL Enumerator</b></em>'.
 * <!-- end-user-doc -->
 *
 * <!-- begin-model-doc -->
 * Member of structure type ({@link com.ericsson.xtumlrt.oopl.OOPLEnumType}) in OOP languages corresponding to ({@link org.eclipse.papyrusrt.xtumlrt.common.EnumerationLiteral}).
 * <!-- end-model-doc -->
 *
 * <p>
 * The following features are supported:
 * </p>
 * <ul>
 *   <li>{@link com.ericsson.xtumlrt.oopl.OOPLEnumerator#getCommonEnumerationLiteral <em>Common Enumeration Literal</em>}</li>
 * </ul>
 *
 * @see com.ericsson.xtumlrt.oopl.OoplPackage#getOOPLEnumerator()
 * @model abstract="true"
 * @generated
 */
public interface OOPLEnumerator extends EObject {
    /**
     * Returns the value of the '<em><b>Common Enumeration Literal</b></em>' reference.
     * <!-- begin-user-doc -->
     * <p>
     * If the meaning of the '<em>Common Enumeration Literal</em>' reference isn't clear,
     * there really should be more of a description here...
     * </p>
     * <!-- end-user-doc -->
     * @return the value of the '<em>Common Enumeration Literal</em>' reference.
     * @see #setCommonEnumerationLiteral(EnumerationLiteral)
     * @see com.ericsson.xtumlrt.oopl.OoplPackage#getOOPLEnumerator_CommonEnumerationLiteral()
     * @model required="true"
     * @generated
     */
    EnumerationLiteral getCommonEnumerationLiteral();

    /**
     * Sets the value of the '{@link com.ericsson.xtumlrt.oopl.OOPLEnumerator#getCommonEnumerationLiteral <em>Common Enumeration Literal</em>}' reference.
     * <!-- begin-user-doc -->
     * <!-- end-user-doc -->
     * @param value the new value of the '<em>Common Enumeration Literal</em>' reference.
     * @see #getCommonEnumerationLiteral()
     * @generated
     */
    void setCommonEnumerationLiteral(EnumerationLiteral value);

} // OOPLEnumerator
