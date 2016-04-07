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

import org.eclipse.emf.ecore.EObject;

import org.eclipse.uml2.uml.Vertex;

/**
 * <!-- begin-user-doc -->
 * A representation of the model object '<em><b>XVertex</b></em>'.
 * <!-- end-user-doc -->
 *
 * <p>
 * The following features are supported:
 * </p>
 * <ul>
 *   <li>{@link com.ericsson.executablemodeling.xtuml.profile.executablemodelingprofile.XVertex#getBase_Vertex <em>Base Vertex</em>}</li>
 * </ul>
 *
 * @see com.ericsson.executablemodeling.xtuml.profile.executablemodelingprofile.ExecutableModelingProfilePackage#getXVertex()
 * @model abstract="true"
 * @generated
 */
public interface XVertex extends EObject {
	/**
	 * Returns the value of the '<em><b>Base Vertex</b></em>' reference.
	 * <!-- begin-user-doc -->
	 * <p>
	 * If the meaning of the '<em>Base Vertex</em>' reference isn't clear,
	 * there really should be more of a description here...
	 * </p>
	 * <!-- end-user-doc -->
	 * @return the value of the '<em>Base Vertex</em>' reference.
	 * @see #setBase_Vertex(Vertex)
	 * @see com.ericsson.executablemodeling.xtuml.profile.executablemodelingprofile.ExecutableModelingProfilePackage#getXVertex_Base_Vertex()
	 * @model required="true" ordered="false"
	 * @generated
	 */
	Vertex getBase_Vertex();

	/**
	 * Sets the value of the '{@link com.ericsson.executablemodeling.xtuml.profile.executablemodelingprofile.XVertex#getBase_Vertex <em>Base Vertex</em>}' reference.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @param value the new value of the '<em>Base Vertex</em>' reference.
	 * @see #getBase_Vertex()
	 * @generated
	 */
	void setBase_Vertex(Vertex value);

} // XVertex
