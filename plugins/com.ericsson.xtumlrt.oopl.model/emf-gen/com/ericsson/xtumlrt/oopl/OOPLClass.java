/**
 */
package com.ericsson.xtumlrt.oopl;

import org.eclipse.emf.common.util.EList;

import org.eclipse.emf.ecore.EObject;

import org.eclipse.papyrusrt.xtumlrt.xtuml.XTClass;

/**
 * <!-- begin-user-doc -->
 * A representation of the model object '<em><b>OOPL Class</b></em>'.
 * <!-- end-user-doc -->
 *
 * <!-- begin-model-doc -->
 * Representation of XTUML class ({@link org.eclipse.papyrusrt.xtumlrt.xtuml.XTClass}) for OOP languages.
 * <!-- end-model-doc -->
 *
 * <p>
 * The following features are supported:
 * </p>
 * <ul>
 *   <li>{@link com.ericsson.xtumlrt.oopl.OOPLClass#getXtClass <em>Xt Class</em>}</li>
 *   <li>{@link com.ericsson.xtumlrt.oopl.OOPLClass#getReferenceStorage <em>Reference Storage</em>}</li>
 * </ul>
 *
 * @see com.ericsson.xtumlrt.oopl.OoplPackage#getOOPLClass()
 * @model abstract="true"
 * @generated
 */
public interface OOPLClass extends EObject {
    /**
     * Returns the value of the '<em><b>Xt Class</b></em>' reference.
     * <!-- begin-user-doc -->
     * <p>
     * If the meaning of the '<em>Xt Class</em>' reference isn't clear,
     * there really should be more of a description here...
     * </p>
     * <!-- end-user-doc -->
     * @return the value of the '<em>Xt Class</em>' reference.
     * @see #setXtClass(XTClass)
     * @see com.ericsson.xtumlrt.oopl.OoplPackage#getOOPLClass_XtClass()
     * @model required="true"
     * @generated
     */
    XTClass getXtClass();

    /**
     * Sets the value of the '{@link com.ericsson.xtumlrt.oopl.OOPLClass#getXtClass <em>Xt Class</em>}' reference.
     * <!-- begin-user-doc -->
     * <!-- end-user-doc -->
     * @param value the new value of the '<em>Xt Class</em>' reference.
     * @see #getXtClass()
     * @generated
     */
    void setXtClass(XTClass value);

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
     * @see com.ericsson.xtumlrt.oopl.OoplPackage#getOOPLClass_ReferenceStorage()
     * @model
     * @generated
     */
    EList<OOPLClassReferenceStorage> getReferenceStorage();

} // OOPLClass
