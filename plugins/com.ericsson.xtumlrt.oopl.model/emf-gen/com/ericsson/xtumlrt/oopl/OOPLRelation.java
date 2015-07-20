/**
 */
package com.ericsson.xtumlrt.oopl;

import org.eclipse.emf.common.util.EList;

import org.eclipse.emf.ecore.EObject;

import org.eclipse.papyrusrt.xtumlrt.xtuml.XTRelation;

/**
 * <!-- begin-user-doc -->
 * A representation of the model object '<em><b>OOPL Relation</b></em>'.
 * <!-- end-user-doc -->
 *
 * <!-- begin-model-doc -->
 * Representation of XTUML relation ({@link org.eclipse.papyrusrt.xtumlrt.xtuml.XTRelation}) for OOP languages.
 * <!-- end-model-doc -->
 *
 * <p>
 * The following features are supported:
 * </p>
 * <ul>
 *   <li>{@link com.ericsson.xtumlrt.oopl.OOPLRelation#getXtRelation <em>Xt Relation</em>}</li>
 *   <li>{@link com.ericsson.xtumlrt.oopl.OOPLRelation#getReferenceStorage <em>Reference Storage</em>}</li>
 * </ul>
 *
 * @see com.ericsson.xtumlrt.oopl.OoplPackage#getOOPLRelation()
 * @model abstract="true"
 * @generated
 */
public interface OOPLRelation extends EObject {
    /**
     * Returns the value of the '<em><b>Xt Relation</b></em>' reference.
     * <!-- begin-user-doc -->
     * <p>
     * If the meaning of the '<em>Xt Relation</em>' reference isn't clear,
     * there really should be more of a description here...
     * </p>
     * <!-- end-user-doc -->
     * @return the value of the '<em>Xt Relation</em>' reference.
     * @see #setXtRelation(XTRelation)
     * @see com.ericsson.xtumlrt.oopl.OoplPackage#getOOPLRelation_XtRelation()
     * @model required="true"
     * @generated
     */
    XTRelation getXtRelation();

    /**
     * Sets the value of the '{@link com.ericsson.xtumlrt.oopl.OOPLRelation#getXtRelation <em>Xt Relation</em>}' reference.
     * <!-- begin-user-doc -->
     * <!-- end-user-doc -->
     * @param value the new value of the '<em>Xt Relation</em>' reference.
     * @see #getXtRelation()
     * @generated
     */
    void setXtRelation(XTRelation value);

    /**
     * Returns the value of the '<em><b>Reference Storage</b></em>' reference list.
     * The list contents are of type {@link com.ericsson.xtumlrt.oopl.OOPLClassReferenceStorage}.
     * <!-- begin-user-doc -->
     * <p>
     * If the meaning of the '<em>Reference Storage</em>' reference list isn't clear,
     * there really should be more of a description here...
     * </p>
     * <!-- end-user-doc -->
     * @return the value of the '<em>Reference Storage</em>' reference list.
     * @see com.ericsson.xtumlrt.oopl.OoplPackage#getOOPLRelation_ReferenceStorage()
     * @model
     * @generated
     */
    EList<OOPLClassReferenceStorage> getReferenceStorage();

} // OOPLRelation
