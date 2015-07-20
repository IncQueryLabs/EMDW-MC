/**
 */
package com.ericsson.xtumlrt.oopl;


/**
 * <!-- begin-user-doc -->
 * A representation of the model object '<em><b>OOPL Class Ref Simple Collection</b></em>'.
 * <!-- end-user-doc -->
 *
 * <!-- begin-model-doc -->
 * Simple (non-associative) collection type in OOP languages to store references to the OOP representation of model classes ({@link com.ericsson.xtumlrt.oopl.OOPLClass}).
 * <!-- end-model-doc -->
 *
 * <p>
 * The following features are supported:
 * </p>
 * <ul>
 *   <li>{@link com.ericsson.xtumlrt.oopl.OOPLClassRefSimpleCollection#getKind <em>Kind</em>}</li>
 *   <li>{@link com.ericsson.xtumlrt.oopl.OOPLClassRefSimpleCollection#getImplementation <em>Implementation</em>}</li>
 * </ul>
 *
 * @see com.ericsson.xtumlrt.oopl.OoplPackage#getOOPLClassRefSimpleCollection()
 * @model
 * @generated
 */
public interface OOPLClassRefSimpleCollection extends OOPLClassReferenceCollection {
    /**
     * Returns the value of the '<em><b>Kind</b></em>' attribute.
     * The default value is <code>"SIMPLY_LINKED_LIST"</code>.
     * The literals are from the enumeration {@link com.ericsson.xtumlrt.oopl.SimpleCollectionKind}.
     * <!-- begin-user-doc -->
     * <p>
     * If the meaning of the '<em>Kind</em>' attribute isn't clear,
     * there really should be more of a description here...
     * </p>
     * <!-- end-user-doc -->
     * @return the value of the '<em>Kind</em>' attribute.
     * @see com.ericsson.xtumlrt.oopl.SimpleCollectionKind
     * @see #setKind(SimpleCollectionKind)
     * @see com.ericsson.xtumlrt.oopl.OoplPackage#getOOPLClassRefSimpleCollection_Kind()
     * @model default="SIMPLY_LINKED_LIST" unique="false" required="true" ordered="false"
     * @generated
     */
    SimpleCollectionKind getKind();

    /**
     * Sets the value of the '{@link com.ericsson.xtumlrt.oopl.OOPLClassRefSimpleCollection#getKind <em>Kind</em>}' attribute.
     * <!-- begin-user-doc -->
     * <!-- end-user-doc -->
     * @param value the new value of the '<em>Kind</em>' attribute.
     * @see com.ericsson.xtumlrt.oopl.SimpleCollectionKind
     * @see #getKind()
     * @generated
     */
    void setKind(SimpleCollectionKind value);

    /**
     * Returns the value of the '<em><b>Implementation</b></em>' reference.
     * <!-- begin-user-doc -->
     * <p>
     * If the meaning of the '<em>Implementation</em>' reference isn't clear,
     * there really should be more of a description here...
     * </p>
     * <!-- end-user-doc -->
     * @return the value of the '<em>Implementation</em>' reference.
     * @see #setImplementation(OOPLClassRefSimpleCollectionImplementation)
     * @see com.ericsson.xtumlrt.oopl.OoplPackage#getOOPLClassRefSimpleCollection_Implementation()
     * @model required="true"
     * @generated
     */
    OOPLClassRefSimpleCollectionImplementation getImplementation();

    /**
     * Sets the value of the '{@link com.ericsson.xtumlrt.oopl.OOPLClassRefSimpleCollection#getImplementation <em>Implementation</em>}' reference.
     * <!-- begin-user-doc -->
     * <!-- end-user-doc -->
     * @param value the new value of the '<em>Implementation</em>' reference.
     * @see #getImplementation()
     * @generated
     */
    void setImplementation(OOPLClassRefSimpleCollectionImplementation value);

} // OOPLClassRefSimpleCollection
