/**
 */
package com.ericsson.xtumlrt.oopl;

import org.eclipse.emf.ecore.EObject;

/**
 * <!-- begin-user-doc -->
 * A representation of the model object '<em><b>OOPL Class Reference Storage</b></em>'.
 * <!-- end-user-doc -->
 *
 * <!-- begin-model-doc -->
 * Storage for references of a class ({@link com.ericsson.xtumlrt.oopl.OOPLClass}) for queries that are made directly on the class or for a relation ({@link com.ericsson.xtumlrt.oopl.OOPLRelation}) if queries are made across the relation. Storage may be a single reference (for signleton classes and x-to-one relations) or a collection of references (for all other classes and x-to-many relations). Multiple storages for the same class or relation are possible if different queries require different access to the references (e.g. maps with different keys).
 * <!-- end-model-doc -->
 *
 * <p>
 * The following features are supported:
 * </p>
 * <ul>
 *   <li>{@link com.ericsson.xtumlrt.oopl.OOPLClassReferenceStorage#getType <em>Type</em>}</li>
 *   <li>{@link com.ericsson.xtumlrt.oopl.OOPLClassReferenceStorage#isRequired <em>Required</em>}</li>
 * </ul>
 *
 * @see com.ericsson.xtumlrt.oopl.OoplPackage#getOOPLClassReferenceStorage()
 * @model abstract="true"
 * @generated
 */
public interface OOPLClassReferenceStorage extends EObject {
    /**
     * Returns the value of the '<em><b>Type</b></em>' reference.
     * <!-- begin-user-doc -->
     * <p>
     * If the meaning of the '<em>Type</em>' reference isn't clear,
     * there really should be more of a description here...
     * </p>
     * <!-- end-user-doc -->
     * @return the value of the '<em>Type</em>' reference.
     * @see #setType(OOPLType)
     * @see com.ericsson.xtumlrt.oopl.OoplPackage#getOOPLClassReferenceStorage_Type()
     * @model required="true"
     * @generated
     */
    OOPLType getType();

    /**
     * Sets the value of the '{@link com.ericsson.xtumlrt.oopl.OOPLClassReferenceStorage#getType <em>Type</em>}' reference.
     * <!-- begin-user-doc -->
     * <!-- end-user-doc -->
     * @param value the new value of the '<em>Type</em>' reference.
     * @see #getType()
     * @generated
     */
    void setType(OOPLType value);

    /**
     * Returns the value of the '<em><b>Required</b></em>' attribute.
     * <!-- begin-user-doc -->
     * <p>
     * If the meaning of the '<em>Required</em>' attribute isn't clear,
     * there really should be more of a description here...
     * </p>
     * <!-- end-user-doc -->
     * @return the value of the '<em>Required</em>' attribute.
     * @see #setRequired(boolean)
     * @see com.ericsson.xtumlrt.oopl.OoplPackage#getOOPLClassReferenceStorage_Required()
     * @model
     * @generated
     */
    boolean isRequired();

    /**
     * Sets the value of the '{@link com.ericsson.xtumlrt.oopl.OOPLClassReferenceStorage#isRequired <em>Required</em>}' attribute.
     * <!-- begin-user-doc -->
     * <!-- end-user-doc -->
     * @param value the new value of the '<em>Required</em>' attribute.
     * @see #isRequired()
     * @generated
     */
    void setRequired(boolean value);

} // OOPLClassReferenceStorage
