/**
 */
package com.ericsson.executablemodeling.xtuml.profile.xtumlprofile;

import com.ericsson.executablemodeling.xtuml.profile.executablemodelingprofile.XPart;

import java.util.Map;

import org.eclipse.emf.common.util.DiagnosticChain;

/**
 * <!-- begin-user-doc -->
 * A representation of the model object '<em><b>Xt Part</b></em>'.
 * <!-- end-user-doc -->
 *
 *
 * @see com.ericsson.executablemodeling.xtuml.profile.xtumlprofile.xtUMLProfilePackage#getXtPart()
 * @model
 * @generated
 */
public interface XtPart extends XPart {
	/**
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * <!-- begin-model-doc -->
	 * The type of the part shall be either a Component with the XtComponent stereotype applied or a Class with the XtClass stereotype applied.
	 * @param diagnostics The chain of diagnostics to which problems are to be appended.
	 * @param context The cache of context-specific information.
	 * <!-- end-model-doc -->
	 * @model
	 * @generated
	 */
	boolean xtPartType(DiagnosticChain diagnostics, Map<Object, Object> context);

	/**
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * <!-- begin-model-doc -->
	 * The part shall have composite aggregation.
	 * @param diagnostics The chain of diagnostics to which problems are to be appended.
	 * @param context The cache of context-specific information.
	 * <!-- end-model-doc -->
	 * @model
	 * @generated
	 */
	boolean xtPartComposition(DiagnosticChain diagnostics, Map<Object, Object> context);

	/**
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * <!-- begin-model-doc -->
	 * The part shall have private visibility.
	 * @param diagnostics The chain of diagnostics to which problems are to be appended.
	 * @param context The cache of context-specific information.
	 * <!-- end-model-doc -->
	 * @model
	 * @generated
	 */
	boolean xtPartVisibility(DiagnosticChain diagnostics, Map<Object, Object> context);

} // XtPart
