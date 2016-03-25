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

import org.eclipse.uml2.uml.Activity;

/**
 * <!-- begin-user-doc -->
 * A representation of the model object '<em><b>XActivity</b></em>'.
 * <!-- end-user-doc -->
 *
 * <p>
 * The following features are supported:
 * </p>
 * <ul>
 *   <li>{@link com.ericsson.executablemodeling.xtuml.profile.executablemodelingprofile.XActivity#getBase_Activity <em>Base Activity</em>}</li>
 * </ul>
 *
 * @see com.ericsson.executablemodeling.xtuml.profile.executablemodelingprofile.ExecutableModelingProfilePackage#getXActivity()
 * @model abstract="true"
 * @generated
 */
public interface XActivity extends XActionBehavior {
	/**
	 * Returns the value of the '<em><b>Base Activity</b></em>' reference.
	 * <!-- begin-user-doc -->
	 * <p>
	 * If the meaning of the '<em>Base Activity</em>' reference isn't clear,
	 * there really should be more of a description here...
	 * </p>
	 * <!-- end-user-doc -->
	 * @return the value of the '<em>Base Activity</em>' reference.
	 * @see #setBase_Activity(Activity)
	 * @see com.ericsson.executablemodeling.xtuml.profile.executablemodelingprofile.ExecutableModelingProfilePackage#getXActivity_Base_Activity()
	 * @model required="true" ordered="false"
	 * @generated
	 */
	Activity getBase_Activity();

	/**
	 * Sets the value of the '{@link com.ericsson.executablemodeling.xtuml.profile.executablemodelingprofile.XActivity#getBase_Activity <em>Base Activity</em>}' reference.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @param value the new value of the '<em>Base Activity</em>' reference.
	 * @see #getBase_Activity()
	 * @generated
	 */
	void setBase_Activity(Activity value);

	/**
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * <!-- begin-model-doc -->
	 * The ownedParameters of the Activity shall have an XParameter stereotype applied.
	 * @param diagnostics The chain of diagnostics to which problems are to be appended.
	 * @param context The cache of context-specific information.
	 * <!-- end-model-doc -->
	 * @model
	 * @generated
	 */
	boolean xActivityParameters(DiagnosticChain diagnostics, Map<Object, Object> context);

	/**
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * <!-- begin-model-doc -->
	 * If the Activity has an ownedComment with the ActionLanguage::TextualRepresentation stereotype applied, then the language tagged value shall be "Alf".
	 * @param diagnostics The chain of diagnostics to which problems are to be appended.
	 * @param context The cache of context-specific information.
	 * <!-- end-model-doc -->
	 * @model
	 * @generated
	 */
	boolean xActivityTextualRepresentation(DiagnosticChain diagnostics, Map<Object, Object> context);

} // XActivity
