/**
 */
package com.ericsson.xtumlrt.oopl;

import org.eclipse.papyrusrt.xtumlrt.common.Attribute;

/**
 * <!-- begin-user-doc -->
 * A representation of the model object '<em><b>OOPL Class Ref Assoc Collection</b></em>'.
 * <!-- end-user-doc -->
 *
 * <!-- begin-model-doc -->
 * Associative collection type in OOP languages to store references to the OOP representation of model classes ({@link com.ericsson.xtumlrt.oopl.OOPLClass}) indexed by one of the attributes ({@link org.eclipse.papyrusrt.xtumlrt.common.Attribute}) of the class.
 * <!-- end-model-doc -->
 *
 * <p>
 * The following features are supported:
 * </p>
 * <ul>
 *   <li>{@link com.ericsson.xtumlrt.oopl.OOPLClassRefAssocCollection#getKey <em>Key</em>}</li>
 *   <li>{@link com.ericsson.xtumlrt.oopl.OOPLClassRefAssocCollection#getKind <em>Kind</em>}</li>
 *   <li>{@link com.ericsson.xtumlrt.oopl.OOPLClassRefAssocCollection#getImplementation <em>Implementation</em>}</li>
 * </ul>
 *
 * @see com.ericsson.xtumlrt.oopl.OoplPackage#getOOPLClassRefAssocCollection()
 * @model
 * @generated
 */
public interface OOPLClassRefAssocCollection extends OOPLClassReferenceCollection {
    /**
     * Returns the value of the '<em><b>Key</b></em>' reference.
     * <!-- begin-user-doc -->
     * <p>
     * If the meaning of the '<em>Key</em>' reference isn't clear,
     * there really should be more of a description here...
     * </p>
     * <!-- end-user-doc -->
     * @return the value of the '<em>Key</em>' reference.
     * @see #setKey(Attribute)
     * @see com.ericsson.xtumlrt.oopl.OoplPackage#getOOPLClassRefAssocCollection_Key()
     * @model required="true"
     * @generated
     */
    Attribute getKey();

    /**
     * Sets the value of the '{@link com.ericsson.xtumlrt.oopl.OOPLClassRefAssocCollection#getKey <em>Key</em>}' reference.
     * <!-- begin-user-doc -->
     * <!-- end-user-doc -->
     * @param value the new value of the '<em>Key</em>' reference.
     * @see #getKey()
     * @generated
     */
    void setKey(Attribute value);

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
     * @see com.ericsson.xtumlrt.oopl.OoplPackage#getOOPLClassRefAssocCollection_Kind()
     * @model default="UNORDERED_SET" unique="false" required="true" ordered="false"
     * @generated
     */
    AssociativeCollectionKind getKind();

    /**
     * Sets the value of the '{@link com.ericsson.xtumlrt.oopl.OOPLClassRefAssocCollection#getKind <em>Kind</em>}' attribute.
     * <!-- begin-user-doc -->
     * <!-- end-user-doc -->
     * @param value the new value of the '<em>Kind</em>' attribute.
     * @see com.ericsson.xtumlrt.oopl.AssociativeCollectionKind
     * @see #getKind()
     * @generated
     */
    void setKind(AssociativeCollectionKind value);

    /**
     * Returns the value of the '<em><b>Implementation</b></em>' reference.
     * <!-- begin-user-doc -->
     * <p>
     * If the meaning of the '<em>Implementation</em>' reference isn't clear,
     * there really should be more of a description here...
     * </p>
     * <!-- end-user-doc -->
     * @return the value of the '<em>Implementation</em>' reference.
     * @see #setImplementation(OOPLClassRefAssocCollectionImplementation)
     * @see com.ericsson.xtumlrt.oopl.OoplPackage#getOOPLClassRefAssocCollection_Implementation()
     * @model required="true"
     * @generated
     */
    OOPLClassRefAssocCollectionImplementation getImplementation();

    /**
     * Sets the value of the '{@link com.ericsson.xtumlrt.oopl.OOPLClassRefAssocCollection#getImplementation <em>Implementation</em>}' reference.
     * <!-- begin-user-doc -->
     * <!-- end-user-doc -->
     * @param value the new value of the '<em>Implementation</em>' reference.
     * @see #getImplementation()
     * @generated
     */
    void setImplementation(OOPLClassRefAssocCollectionImplementation value);

} // OOPLClassRefAssocCollection
