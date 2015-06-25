/**
 */
package com.ericsson.executablemodeling.xtuml.profile.xtumlprofile;

import com.ericsson.executablemodeling.xtuml.profile.executablemodelingprofile.XTransition;

import java.util.Map;

import org.eclipse.emf.common.util.DiagnosticChain;

/**
 * <!-- begin-user-doc -->
 * A representation of the model object '<em><b>Xt Transition</b></em>'.
 * <!-- end-user-doc -->
 *
 *
 * @see com.ericsson.executablemodeling.xtuml.profile.xtumlprofile.xtUMLProfilePackage#getXtTransition()
 * @model
 * @generated
 */
public interface XtTransition extends XTransition {
	/**
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * <!-- begin-model-doc -->
	 * The Transition shall not have a guard.
	 * @param diagnostics The chain of diagnostics to which problems are to be appended.
	 * @param context The cache of context-specific information.
	 * <!-- end-model-doc -->
	 * @model
	 * @generated
	 */
	boolean xtTransitionNoGuard(DiagnosticChain diagnostics, Map<Object, Object> context);

} // XtTransition
