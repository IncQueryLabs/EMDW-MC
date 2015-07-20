/**
 */
package com.ericsson.xtumlrt.oopl;


/**
 * <!-- begin-user-doc -->
 * A representation of the model object '<em><b>OOPL User Defined Type</b></em>'.
 * <!-- end-user-doc -->
 *
 * <!-- begin-model-doc -->
 * User defined type in OOP languages corresponding to common type {@link org.eclipse.papyrusrt.xtumlrt.common.UserDefinedType}. Based on any OOP type ({@link com.ericsson.xtumlrt.oopl.OOPLType}).
 * <!-- end-model-doc -->
 *
 * <p>
 * The following features are supported:
 * </p>
 * <ul>
 *   <li>{@link com.ericsson.xtumlrt.oopl.OOPLUserDefinedType#getBaseType <em>Base Type</em>}</li>
 * </ul>
 *
 * @see com.ericsson.xtumlrt.oopl.OoplPackage#getOOPLUserDefinedType()
 * @model abstract="true"
 * @generated
 */
public interface OOPLUserDefinedType extends OOPLType {
    /**
     * Returns the value of the '<em><b>Base Type</b></em>' reference.
     * <!-- begin-user-doc -->
     * <p>
     * If the meaning of the '<em>Base Type</em>' reference isn't clear,
     * there really should be more of a description here...
     * </p>
     * <!-- end-user-doc -->
     * @return the value of the '<em>Base Type</em>' reference.
     * @see #setBaseType(OOPLType)
     * @see com.ericsson.xtumlrt.oopl.OoplPackage#getOOPLUserDefinedType_BaseType()
     * @model required="true"
     * @generated
     */
    OOPLType getBaseType();

    /**
     * Sets the value of the '{@link com.ericsson.xtumlrt.oopl.OOPLUserDefinedType#getBaseType <em>Base Type</em>}' reference.
     * <!-- begin-user-doc -->
     * <!-- end-user-doc -->
     * @param value the new value of the '<em>Base Type</em>' reference.
     * @see #getBaseType()
     * @generated
     */
    void setBaseType(OOPLType value);

} // OOPLUserDefinedType
