/**
 */
package com.ericsson.xtumlrt.oopl;


/**
 * <!-- begin-user-doc -->
 * A representation of the model object '<em><b>OOPL Sequence Implementation</b></em>'.
 * <!-- end-user-doc -->
 *
 * <p>
 * The following features are supported:
 * </p>
 * <ul>
 *   <li>{@link com.ericsson.xtumlrt.oopl.OOPLSequenceImplementation#getUniqueness <em>Uniqueness</em>}</li>
 *   <li>{@link com.ericsson.xtumlrt.oopl.OOPLSequenceImplementation#getOrderedness <em>Orderedness</em>}</li>
 * </ul>
 *
 * @see com.ericsson.xtumlrt.oopl.OoplPackage#getOOPLSequenceImplementation()
 * @model
 * @generated
 */
public interface OOPLSequenceImplementation extends BaseContainerImplementation {
    /**
     * Returns the value of the '<em><b>Uniqueness</b></em>' attribute.
     * The default value is <code>"NON_UNIQUE"</code>.
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
     * @see com.ericsson.xtumlrt.oopl.OoplPackage#getOOPLSequenceImplementation_Uniqueness()
     * @model default="NON_UNIQUE" required="true"
     * @generated
     */
    SequenceUniquenessKind getUniqueness();

    /**
     * Sets the value of the '{@link com.ericsson.xtumlrt.oopl.OOPLSequenceImplementation#getUniqueness <em>Uniqueness</em>}' attribute.
     * <!-- begin-user-doc -->
     * <!-- end-user-doc -->
     * @param value the new value of the '<em>Uniqueness</em>' attribute.
     * @see com.ericsson.xtumlrt.oopl.SequenceUniquenessKind
     * @see #getUniqueness()
     * @generated
     */
    void setUniqueness(SequenceUniquenessKind value);

    /**
     * Returns the value of the '<em><b>Orderedness</b></em>' attribute.
     * The default value is <code>"UNORDERED"</code>.
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
     * @see com.ericsson.xtumlrt.oopl.OoplPackage#getOOPLSequenceImplementation_Orderedness()
     * @model default="UNORDERED" required="true"
     * @generated
     */
    SequenceOrderednessKind getOrderedness();

    /**
     * Sets the value of the '{@link com.ericsson.xtumlrt.oopl.OOPLSequenceImplementation#getOrderedness <em>Orderedness</em>}' attribute.
     * <!-- begin-user-doc -->
     * <!-- end-user-doc -->
     * @param value the new value of the '<em>Orderedness</em>' attribute.
     * @see com.ericsson.xtumlrt.oopl.SequenceOrderednessKind
     * @see #getOrderedness()
     * @generated
     */
    void setOrderedness(SequenceOrderednessKind value);

    /**
     * <!-- begin-user-doc -->
     * <!-- end-user-doc -->
     * @model annotation="http://www.eclipse.org/emf/2002/GenModel body='String template = com.ericsson.xtumlrt.oopl.OOPLSequenceImplementationTemplateReplacer.generateAny(this, collection, valueType, result);\r\nreturn template;'"
     * @generated
     */
    String generateAny(String collection, String valueType, String result);

    /**
     * <!-- begin-user-doc -->
     * <!-- end-user-doc -->
     * @model annotation="http://www.eclipse.org/emf/2002/GenModel body='String template = com.ericsson.xtumlrt.oopl.OOPLSequenceImplementationTemplateReplacer.generateCountOf(this, collection, value, result);\r\nreturn template;'"
     * @generated
     */
    String generateCountOf(String collection, String value, String result);

    /**
     * <!-- begin-user-doc -->
     * <!-- end-user-doc -->
     * @model annotation="http://www.eclipse.org/emf/2002/GenModel body='String template = com.ericsson.xtumlrt.oopl.OOPLSequenceImplementationTemplateReplacer.generateElementAtIndex(this, collection, valueType, index, result);\r\nreturn template;'"
     * @generated
     */
    String generateElementAtIndex(String collection, String valueType, String index, String result);

    /**
     * <!-- begin-user-doc -->
     * <!-- end-user-doc -->
     * @model annotation="http://www.eclipse.org/emf/2002/GenModel body='String template = com.ericsson.xtumlrt.oopl.OOPLSequenceImplementationTemplateReplacer.generateInsertElementAtIndex(this, collection, value, valueType, index);\r\nreturn template;'"
     * @generated
     */
    String generateInsertElementAtIndex(String collection, String value, String valueType, String index);

    /**
     * <!-- begin-user-doc -->
     * <!-- end-user-doc -->
     * @model annotation="http://www.eclipse.org/emf/2002/GenModel body='String template = com.ericsson.xtumlrt.oopl.OOPLSequenceImplementationTemplateReplacer.generateReplaceElementAtIndex(this, collection, value, valueType, index);\r\nreturn template;'"
     * @generated
     */
    String generateReplaceElementAtIndex(String collection, String value, String valueType, String index);

} // OOPLSequenceImplementation
