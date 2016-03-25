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

import org.eclipse.uml2.uml.OpaqueBehavior;

/**
 * <!-- begin-user-doc -->
 * A representation of the model object '<em><b>XOpaque Behavior</b></em>'.
 * <!-- end-user-doc -->
 *
 * <p>
 * The following features are supported:
 * </p>
 * <ul>
 *   <li>{@link com.ericsson.executablemodeling.xtuml.profile.executablemodelingprofile.XOpaqueBehavior#getBase_OpaqueBehavior <em>Base Opaque Behavior</em>}</li>
 *   <li>{@link com.ericsson.executablemodeling.xtuml.profile.executablemodelingprofile.XOpaqueBehavior#isExternal <em>Is External</em>}</li>
 * </ul>
 *
 * @see com.ericsson.executablemodeling.xtuml.profile.executablemodelingprofile.ExecutableModelingProfilePackage#getXOpaqueBehavior()
 * @model abstract="true"
 * @generated
 */
public interface XOpaqueBehavior extends XActionBehavior {
	/**
	 * Returns the value of the '<em><b>Base Opaque Behavior</b></em>' reference.
	 * <!-- begin-user-doc -->
	 * <p>
	 * If the meaning of the '<em>Base Opaque Behavior</em>' reference isn't clear,
	 * there really should be more of a description here...
	 * </p>
	 * <!-- end-user-doc -->
	 * @return the value of the '<em>Base Opaque Behavior</em>' reference.
	 * @see #setBase_OpaqueBehavior(OpaqueBehavior)
	 * @see com.ericsson.executablemodeling.xtuml.profile.executablemodelingprofile.ExecutableModelingProfilePackage#getXOpaqueBehavior_Base_OpaqueBehavior()
	 * @model required="true" ordered="false"
	 * @generated
	 */
	OpaqueBehavior getBase_OpaqueBehavior();

	/**
	 * Sets the value of the '{@link com.ericsson.executablemodeling.xtuml.profile.executablemodelingprofile.XOpaqueBehavior#getBase_OpaqueBehavior <em>Base Opaque Behavior</em>}' reference.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @param value the new value of the '<em>Base Opaque Behavior</em>' reference.
	 * @see #getBase_OpaqueBehavior()
	 * @generated
	 */
	void setBase_OpaqueBehavior(OpaqueBehavior value);

	/**
	 * Returns the value of the '<em><b>Is External</b></em>' attribute.
	 * The default value is <code>"false"</code>.
	 * <!-- begin-user-doc -->
	 * <p>
	 * If the meaning of the '<em>Is External</em>' attribute isn't clear,
	 * there really should be more of a description here...
	 * </p>
	 * <!-- end-user-doc -->
	 * @return the value of the '<em>Is External</em>' attribute.
	 * @see #setIsExternal(boolean)
	 * @see com.ericsson.executablemodeling.xtuml.profile.executablemodelingprofile.ExecutableModelingProfilePackage#getXOpaqueBehavior_IsExternal()
	 * @model default="false" unique="false" dataType="org.eclipse.uml2.types.Boolean" required="true" ordered="false"
	 * @generated
	 */
	boolean isExternal();

	/**
	 * Sets the value of the '{@link com.ericsson.executablemodeling.xtuml.profile.executablemodelingprofile.XOpaqueBehavior#isExternal <em>Is External</em>}' attribute.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @param value the new value of the '<em>Is External</em>' attribute.
	 * @see #isExternal()
	 * @generated
	 */
	void setIsExternal(boolean value);

	/**
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * <!-- begin-model-doc -->
	 * If isExternal = true, then the OpaqueBehavior shall not have a body.
	 * @param diagnostics The chain of diagnostics to which problems are to be appended.
	 * @param context The cache of context-specific information.
	 * <!-- end-model-doc -->
	 * @model
	 * @generated
	 */
	boolean xOpaqueBehaviorExternal(DiagnosticChain diagnostics, Map<Object, Object> context);

} // XOpaqueBehavior
