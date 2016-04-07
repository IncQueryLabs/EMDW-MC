/*******************************************************************************
 * Copyright (c) 2015-2016 IncQuery Labs Ltd. and Ericsson AB
 * All rights reserved. This program and the accompanying materials
 * are made available under the terms of the Eclipse Public License v1.0
 * which accompanies this distribution, and is available at
 * http://www.eclipse.org/legal/epl-v10.html
 *
 * Contributors:
 *     Akos Horvath, Abel Hegedus, Zoltan Ujhelyi, Adam Balogh - initial API and implementation
 *******************************************************************************/
/**
 */
package com.ericsson.executablemodeling.xtuml.profile.executablemodelingprofile;

import java.util.Map;

import org.eclipse.emf.common.util.DiagnosticChain;

import org.eclipse.uml2.uml.Reception;

/**
 * <!-- begin-user-doc -->
 * A representation of the model object '<em><b>XReception</b></em>'.
 * <!-- end-user-doc -->
 *
 * <p>
 * The following features are supported:
 * </p>
 * <ul>
 *   <li>{@link com.ericsson.executablemodeling.xtuml.profile.executablemodelingprofile.XReception#getBase_Reception <em>Base Reception</em>}</li>
 * </ul>
 *
 * @see com.ericsson.executablemodeling.xtuml.profile.executablemodelingprofile.ExecutableModelingProfilePackage#getXReception()
 * @model abstract="true"
 * @generated
 */
public interface XReception extends XFeature {
	/**
	 * Returns the value of the '<em><b>Base Reception</b></em>' reference.
	 * <!-- begin-user-doc -->
	 * <p>
	 * If the meaning of the '<em>Base Reception</em>' reference isn't clear,
	 * there really should be more of a description here...
	 * </p>
	 * <!-- end-user-doc -->
	 * @return the value of the '<em>Base Reception</em>' reference.
	 * @see #setBase_Reception(Reception)
	 * @see com.ericsson.executablemodeling.xtuml.profile.executablemodelingprofile.ExecutableModelingProfilePackage#getXReception_Base_Reception()
	 * @model required="true" ordered="false"
	 * @generated
	 */
	Reception getBase_Reception();

	/**
	 * Sets the value of the '{@link com.ericsson.executablemodeling.xtuml.profile.executablemodelingprofile.XReception#getBase_Reception <em>Base Reception</em>}' reference.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @param value the new value of the '<em>Base Reception</em>' reference.
	 * @see #getBase_Reception()
	 * @generated
	 */
	void setBase_Reception(Reception value);

	/**
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * <!-- begin-model-doc -->
	 * The signal of the Reception shall have an XSignal stereotype applied.
	 * @param diagnostics The chain of diagnostics to which problems are to be appended.
	 * @param context The cache of context-specific information.
	 * <!-- end-model-doc -->
	 * @model
	 * @generated
	 */
	boolean xReceptionSignal(DiagnosticChain diagnostics, Map<Object, Object> context);

} // XReception
