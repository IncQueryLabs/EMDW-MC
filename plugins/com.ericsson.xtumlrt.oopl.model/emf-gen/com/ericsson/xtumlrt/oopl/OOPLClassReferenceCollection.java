/**
 */
package com.ericsson.xtumlrt.oopl;


/**
 * <!-- begin-user-doc -->
 * A representation of the model object '<em><b>OOPL Class Reference Collection</b></em>'.
 * <!-- end-user-doc -->
 *
 * <!-- begin-model-doc -->
 * Collection type in OOP languages to store references to the OOP representation of model classes ({@link com.ericsson.xtumlrt.oopl.OOPLClass}).
 * <!-- end-model-doc -->
 *
 * <p>
 * The following features are supported:
 * </p>
 * <ul>
 *   <li>{@link com.ericsson.xtumlrt.oopl.OOPLClassReferenceCollection#getOoplClass <em>Oopl Class</em>}</li>
 * </ul>
 *
 * @see com.ericsson.xtumlrt.oopl.OoplPackage#getOOPLClassReferenceCollection()
 * @model abstract="true"
 * @generated
 */
public interface OOPLClassReferenceCollection extends OOPLType {
    /**
     * Returns the value of the '<em><b>Oopl Class</b></em>' reference.
     * <!-- begin-user-doc -->
     * <p>
     * If the meaning of the '<em>Oopl Class</em>' reference isn't clear,
     * there really should be more of a description here...
     * </p>
     * <!-- end-user-doc -->
     * @return the value of the '<em>Oopl Class</em>' reference.
     * @see #setOoplClass(OOPLClass)
     * @see com.ericsson.xtumlrt.oopl.OoplPackage#getOOPLClassReferenceCollection_OoplClass()
     * @model required="true"
     * @generated
     */
    OOPLClass getOoplClass();

    /**
     * Sets the value of the '{@link com.ericsson.xtumlrt.oopl.OOPLClassReferenceCollection#getOoplClass <em>Oopl Class</em>}' reference.
     * <!-- begin-user-doc -->
     * <!-- end-user-doc -->
     * @param value the new value of the '<em>Oopl Class</em>' reference.
     * @see #getOoplClass()
     * @generated
     */
    void setOoplClass(OOPLClass value);

} // OOPLClassReferenceCollection
