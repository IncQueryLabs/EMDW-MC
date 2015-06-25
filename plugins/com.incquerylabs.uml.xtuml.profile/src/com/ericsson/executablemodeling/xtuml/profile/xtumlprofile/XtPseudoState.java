/**
 */
package com.ericsson.executablemodeling.xtuml.profile.xtumlprofile;

import com.ericsson.executablemodeling.xtuml.profile.executablemodelingprofile.XPseudostate;

import java.util.Map;

import org.eclipse.emf.common.util.DiagnosticChain;

/**
 * <!-- begin-user-doc -->
 * A representation of the model object '<em><b>Xt Pseudo State</b></em>'.
 * <!-- end-user-doc -->
 *
 *
 * @see com.ericsson.executablemodeling.xtuml.profile.xtumlprofile.xtUMLProfilePackage#getXtPseudoState()
 * @model
 * @generated
 */
public interface XtPseudoState extends XPseudostate {
	/**
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * <!-- begin-model-doc -->
	 * The kind of the Pseudostate shall be initial.
	 * @param diagnostics The chain of diagnostics to which problems are to be appended.
	 * @param context The cache of context-specific information.
	 * <!-- end-model-doc -->
	 * @model
	 * @generated
	 */
	boolean xtPseudostateKind(DiagnosticChain diagnostics, Map<Object, Object> context);

} // XtPseudoState
