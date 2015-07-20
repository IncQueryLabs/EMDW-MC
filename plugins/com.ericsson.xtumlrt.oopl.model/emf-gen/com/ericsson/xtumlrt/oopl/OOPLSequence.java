/**
 */
package com.ericsson.xtumlrt.oopl;


/**
 * <!-- begin-user-doc -->
 * A representation of the model object '<em><b>OOPL Sequence</b></em>'.
 * <!-- end-user-doc -->
 *
 * <!-- begin-model-doc -->
 * Sequence (array, set or multiset) type in OOP languages. Elements are OOP types ({@link com.ericsson.xtumlrt.oopl.OOPLType}).
 * <!-- end-model-doc -->
 *
 * <p>
 * The following features are supported:
 * </p>
 * <ul>
 *   <li>{@link com.ericsson.xtumlrt.oopl.OOPLSequence#getElementType <em>Element Type</em>}</li>
 *   <li>{@link com.ericsson.xtumlrt.oopl.OOPLSequence#getOrderedness <em>Orderedness</em>}</li>
 *   <li>{@link com.ericsson.xtumlrt.oopl.OOPLSequence#getUniqueness <em>Uniqueness</em>}</li>
 *   <li>{@link com.ericsson.xtumlrt.oopl.OOPLSequence#getImplementation <em>Implementation</em>}</li>
 * </ul>
 *
 * @see com.ericsson.xtumlrt.oopl.OoplPackage#getOOPLSequence()
 * @model
 * @generated
 */
public interface OOPLSequence extends OOPLType {
    /**
     * Returns the value of the '<em><b>Element Type</b></em>' reference.
     * <!-- begin-user-doc -->
     * <p>
     * If the meaning of the '<em>Element Type</em>' reference isn't clear,
     * there really should be more of a description here...
     * </p>
     * <!-- end-user-doc -->
     * @return the value of the '<em>Element Type</em>' reference.
     * @see #setElementType(OOPLType)
     * @see com.ericsson.xtumlrt.oopl.OoplPackage#getOOPLSequence_ElementType()
     * @model required="true"
     * @generated
     */
    OOPLType getElementType();

    /**
     * Sets the value of the '{@link com.ericsson.xtumlrt.oopl.OOPLSequence#getElementType <em>Element Type</em>}' reference.
     * <!-- begin-user-doc -->
     * <!-- end-user-doc -->
     * @param value the new value of the '<em>Element Type</em>' reference.
     * @see #getElementType()
     * @generated
     */
    void setElementType(OOPLType value);

    /**
     * Returns the value of the '<em><b>Orderedness</b></em>' attribute.
     * The literals are from the enumeration {@link com.ericsson.xtumlrt.oopl.SequenceOrderednessKind}.
     * <!-- begin-user-doc -->
     * <p>
     * If the meaning of the '<em>Orderedness</em>' attribute isn't clear,
     * there really should be more of a description here...
     * </p>
     * <!-- end-user-doc -->
     * @return the value of the '<em>Orderedness</em>' attribute.
     * @see com.ericsson.xtumlrt.oopl.SequenceOrderednessKind
     * @see #setOrderedness(SequenceOrderednessKind)
     * @see com.ericsson.xtumlrt.oopl.OoplPackage#getOOPLSequence_Orderedness()
     * @model unique="false" required="true" ordered="false"
     * @generated
     */
    SequenceOrderednessKind getOrderedness();

    /**
     * Sets the value of the '{@link com.ericsson.xtumlrt.oopl.OOPLSequence#getOrderedness <em>Orderedness</em>}' attribute.
     * <!-- begin-user-doc -->
     * <!-- end-user-doc -->
     * @param value the new value of the '<em>Orderedness</em>' attribute.
     * @see com.ericsson.xtumlrt.oopl.SequenceOrderednessKind
     * @see #getOrderedness()
     * @generated
     */
    void setOrderedness(SequenceOrderednessKind value);

    /**
     * Returns the value of the '<em><b>Uniqueness</b></em>' attribute.
     * The literals are from the enumeration {@link com.ericsson.xtumlrt.oopl.SequenceUniquenessKind}.
     * <!-- begin-user-doc -->
     * <p>
     * If the meaning of the '<em>Uniqueness</em>' attribute isn't clear,
     * there really should be more of a description here...
     * </p>
     * <!-- end-user-doc -->
     * @return the value of the '<em>Uniqueness</em>' attribute.
     * @see com.ericsson.xtumlrt.oopl.SequenceUniquenessKind
     * @see #setUniqueness(SequenceUniquenessKind)
     * @see com.ericsson.xtumlrt.oopl.OoplPackage#getOOPLSequence_Uniqueness()
     * @model unique="false" required="true" ordered="false"
     * @generated
     */
    SequenceUniquenessKind getUniqueness();

    /**
     * Sets the value of the '{@link com.ericsson.xtumlrt.oopl.OOPLSequence#getUniqueness <em>Uniqueness</em>}' attribute.
     * <!-- begin-user-doc -->
     * <!-- end-user-doc -->
     * @param value the new value of the '<em>Uniqueness</em>' attribute.
     * @see com.ericsson.xtumlrt.oopl.SequenceUniquenessKind
     * @see #getUniqueness()
     * @generated
     */
    void setUniqueness(SequenceUniquenessKind value);

    /**
     * Returns the value of the '<em><b>Implementation</b></em>' reference.
     * <!-- begin-user-doc -->
     * <p>
     * If the meaning of the '<em>Implementation</em>' reference isn't clear,
     * there really should be more of a description here...
     * </p>
     * <!-- end-user-doc -->
     * @return the value of the '<em>Implementation</em>' reference.
     * @see #setImplementation(OOPLSequenceImplementation)
     * @see com.ericsson.xtumlrt.oopl.OoplPackage#getOOPLSequence_Implementation()
     * @model required="true"
     * @generated
     */
    OOPLSequenceImplementation getImplementation();

    /**
     * Sets the value of the '{@link com.ericsson.xtumlrt.oopl.OOPLSequence#getImplementation <em>Implementation</em>}' reference.
     * <!-- begin-user-doc -->
     * <!-- end-user-doc -->
     * @param value the new value of the '<em>Implementation</em>' reference.
     * @see #getImplementation()
     * @generated
     */
    void setImplementation(OOPLSequenceImplementation value);

} // OOPLSequence
