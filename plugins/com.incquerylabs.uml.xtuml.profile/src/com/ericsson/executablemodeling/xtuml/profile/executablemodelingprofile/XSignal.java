/**
 */
package com.ericsson.executablemodeling.xtuml.profile.executablemodelingprofile;

import java.util.Map;

import org.eclipse.emf.common.util.DiagnosticChain;

import org.eclipse.uml2.uml.Signal;

/**
 * <!-- begin-user-doc -->
 * A representation of the model object '<em><b>XSignal</b></em>'.
 * <!-- end-user-doc -->
 *
 * <p>
 * The following features are supported:
 * </p>
 * <ul>
 *   <li>{@link com.ericsson.executablemodeling.xtuml.profile.executablemodelingprofile.XSignal#getBase_Signal <em>Base Signal</em>}</li>
 * </ul>
 *
 * @see com.ericsson.executablemodeling.xtuml.profile.executablemodelingprofile.ExecutableModelingProfilePackage#getXSignal()
 * @model abstract="true"
 * @generated
 */
public interface XSignal extends XClassifier {
	/**
	 * Returns the value of the '<em><b>Base Signal</b></em>' reference.
	 * <!-- begin-user-doc -->
	 * <p>
	 * If the meaning of the '<em>Base Signal</em>' reference isn't clear,
	 * there really should be more of a description here...
	 * </p>
	 * <!-- end-user-doc -->
	 * @return the value of the '<em>Base Signal</em>' reference.
	 * @see #setBase_Signal(Signal)
	 * @see com.ericsson.executablemodeling.xtuml.profile.executablemodelingprofile.ExecutableModelingProfilePackage#getXSignal_Base_Signal()
	 * @model required="true" ordered="false"
	 * @generated
	 */
	Signal getBase_Signal();

	/**
	 * Sets the value of the '{@link com.ericsson.executablemodeling.xtuml.profile.executablemodelingprofile.XSignal#getBase_Signal <em>Base Signal</em>}' reference.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @param value the new value of the '<em>Base Signal</em>' reference.
	 * @see #getBase_Signal()
	 * @generated
	 */
	void setBase_Signal(Signal value);

	/**
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * <!-- begin-model-doc -->
	 * All attributes of the Signal shall have public visibility.
	 * @param diagnostics The chain of diagnostics to which problems are to be appended.
	 * @param context The cache of context-specific information.
	 * <!-- end-model-doc -->
	 * @model
	 * @generated
	 */
	boolean xSignalVisibility(DiagnosticChain diagnostics, Map<Object, Object> context);

} // XSignal
