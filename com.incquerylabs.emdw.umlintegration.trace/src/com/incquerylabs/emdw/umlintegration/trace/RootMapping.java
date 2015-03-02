/**
 */
package com.incquerylabs.emdw.umlintegration.trace;

import org.eclipse.emf.common.util.EList;

import org.eclipse.emf.ecore.EObject;

/**
 * <!-- begin-user-doc -->
 * A representation of the model object '<em><b>Root Mapping</b></em>'.
 * <!-- end-user-doc -->
 *
 * <p>
 * The following features are supported:
 * <ul>
 *   <li>{@link com.incquerylabs.emdw.umlintegration.trace.RootMapping#getUmlRoot <em>Uml Root</em>}</li>
 *   <li>{@link com.incquerylabs.emdw.umlintegration.trace.RootMapping#getXtumlrtRoot <em>Xtumlrt Root</em>}</li>
 *   <li>{@link com.incquerylabs.emdw.umlintegration.trace.RootMapping#getTraces <em>Traces</em>}</li>
 * </ul>
 * </p>
 *
 * @see com.incquerylabs.emdw.umlintegration.trace.TracePackage#getRootMapping()
 * @model
 * @generated
 */
public interface RootMapping extends EObject {
	/**
	 * Returns the value of the '<em><b>Uml Root</b></em>' reference.
	 * <!-- begin-user-doc -->
	 * <p>
	 * If the meaning of the '<em>Uml Root</em>' reference isn't clear,
	 * there really should be more of a description here...
	 * </p>
	 * <!-- end-user-doc -->
	 * @return the value of the '<em>Uml Root</em>' reference.
	 * @see #setUmlRoot(org.eclipse.uml2.uml.Package)
	 * @see com.incquerylabs.emdw.umlintegration.trace.TracePackage#getRootMapping_UmlRoot()
	 * @model
	 * @generated
	 */
	org.eclipse.uml2.uml.Package getUmlRoot();

	/**
	 * Sets the value of the '{@link com.incquerylabs.emdw.umlintegration.trace.RootMapping#getUmlRoot <em>Uml Root</em>}' reference.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @param value the new value of the '<em>Uml Root</em>' reference.
	 * @see #getUmlRoot()
	 * @generated
	 */
	void setUmlRoot(org.eclipse.uml2.uml.Package value);

	/**
	 * Returns the value of the '<em><b>Xtumlrt Root</b></em>' reference.
	 * <!-- begin-user-doc -->
	 * <p>
	 * If the meaning of the '<em>Xtumlrt Root</em>' reference isn't clear,
	 * there really should be more of a description here...
	 * </p>
	 * <!-- end-user-doc -->
	 * @return the value of the '<em>Xtumlrt Root</em>' reference.
	 * @see #setXtumlrtRoot(com.zeligsoft.xtumlrt.common.Package)
	 * @see com.incquerylabs.emdw.umlintegration.trace.TracePackage#getRootMapping_XtumlrtRoot()
	 * @model
	 * @generated
	 */
	com.zeligsoft.xtumlrt.common.Package getXtumlrtRoot();

	/**
	 * Sets the value of the '{@link com.incquerylabs.emdw.umlintegration.trace.RootMapping#getXtumlrtRoot <em>Xtumlrt Root</em>}' reference.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @param value the new value of the '<em>Xtumlrt Root</em>' reference.
	 * @see #getXtumlrtRoot()
	 * @generated
	 */
	void setXtumlrtRoot(com.zeligsoft.xtumlrt.common.Package value);

	/**
	 * Returns the value of the '<em><b>Traces</b></em>' containment reference list.
	 * The list contents are of type {@link com.incquerylabs.emdw.umlintegration.trace.Trace}.
	 * <!-- begin-user-doc -->
	 * <p>
	 * If the meaning of the '<em>Traces</em>' containment reference list isn't clear,
	 * there really should be more of a description here...
	 * </p>
	 * <!-- end-user-doc -->
	 * @return the value of the '<em>Traces</em>' containment reference list.
	 * @see com.incquerylabs.emdw.umlintegration.trace.TracePackage#getRootMapping_Traces()
	 * @model containment="true"
	 * @generated
	 */
	EList<Trace> getTraces();

} // RootMapping
