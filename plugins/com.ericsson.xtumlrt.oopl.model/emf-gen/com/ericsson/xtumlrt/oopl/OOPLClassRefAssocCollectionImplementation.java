/**
 */
package com.ericsson.xtumlrt.oopl;


/**
 * <!-- begin-user-doc -->
 * A representation of the model object '<em><b>OOPL Class Ref Assoc Collection Implementation</b></em>'.
 * <!-- end-user-doc -->
 *
 * <p>
 * The following features are supported:
 * </p>
 * <ul>
 *   <li>{@link com.ericsson.xtumlrt.oopl.OOPLClassRefAssocCollectionImplementation#getKind <em>Kind</em>}</li>
 * </ul>
 *
 * @see com.ericsson.xtumlrt.oopl.OoplPackage#getOOPLClassRefAssocCollectionImplementation()
 * @model
 * @generated
 */
public interface OOPLClassRefAssocCollectionImplementation extends BaseContainerImplementation {
    /**
     * Returns the value of the '<em><b>Kind</b></em>' attribute.
     * The default value is <code>"UNORDERED_SET"</code>.
     * The literals are from the enumeration {@link com.ericsson.xtumlrt.oopl.AssociativeCollectionKind}.
     * <!-- begin-user-doc -->
     * <p>
     * If the meaning of the '<em>Kind</em>' attribute isn't clear,
     * there really should be more of a description here...
     * </p>
     * <!-- end-user-doc -->
     * @return the value of the '<em>Kind</em>' attribute.
     * @see com.ericsson.xtumlrt.oopl.AssociativeCollectionKind
     * @see #setKind(AssociativeCollectionKind)
     * @see com.ericsson.xtumlrt.oopl.OoplPackage#getOOPLClassRefAssocCollectionImplementation_Kind()
     * @model default="UNORDERED_SET" required="true"
     * @generated
     */
    AssociativeCollectionKind getKind();

    /**
     * Sets the value of the '{@link com.ericsson.xtumlrt.oopl.OOPLClassRefAssocCollectionImplementation#getKind <em>Kind</em>}' attribute.
     * <!-- begin-user-doc -->
     * <!-- end-user-doc -->
     * @param value the new value of the '<em>Kind</em>' attribute.
     * @see com.ericsson.xtumlrt.oopl.AssociativeCollectionKind
     * @see #getKind()
     * @generated
     */
    void setKind(AssociativeCollectionKind value);

    /**
     * <!-- begin-user-doc -->
     * <!-- end-user-doc -->
     * @model
     * @generated
     */
    String generateCountOf(String collection, String value, String result);

    /**
     * <!-- begin-user-doc -->
     * <!-- end-user-doc -->
     * @model
     * @generated
     */
    String generateAny(String collection, String valueType, String result);

} // OOPLClassRefAssocCollectionImplementation
