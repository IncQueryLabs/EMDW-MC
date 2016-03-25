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

import org.eclipse.uml2.uml.Interface;

/**
 * <!-- begin-user-doc -->
 * A representation of the model object '<em><b>XMessage Set</b></em>'.
 * <!-- end-user-doc -->
 *
 * <p>
 * The following features are supported:
 * </p>
 * <ul>
 *   <li>{@link com.ericsson.executablemodeling.xtuml.profile.executablemodelingprofile.XMessageSet#getBase_Interface <em>Base Interface</em>}</li>
 *   <li>{@link com.ericsson.executablemodeling.xtuml.profile.executablemodelingprofile.XMessageSet#getMessageKind <em>Message Kind</em>}</li>
 * </ul>
 *
 * @see com.ericsson.executablemodeling.xtuml.profile.executablemodelingprofile.ExecutableModelingProfilePackage#getXMessageSet()
 * @model abstract="true"
 * @generated
 */
public interface XMessageSet extends XClassifier {
	/**
	 * Returns the value of the '<em><b>Base Interface</b></em>' reference.
	 * <!-- begin-user-doc -->
	 * <p>
	 * If the meaning of the '<em>Base Interface</em>' reference isn't clear,
	 * there really should be more of a description here...
	 * </p>
	 * <!-- end-user-doc -->
	 * @return the value of the '<em>Base Interface</em>' reference.
	 * @see #setBase_Interface(Interface)
	 * @see com.ericsson.executablemodeling.xtuml.profile.executablemodelingprofile.ExecutableModelingProfilePackage#getXMessageSet_Base_Interface()
	 * @model required="true" ordered="false"
	 * @generated
	 */
	Interface getBase_Interface();

	/**
	 * Sets the value of the '{@link com.ericsson.executablemodeling.xtuml.profile.executablemodelingprofile.XMessageSet#getBase_Interface <em>Base Interface</em>}' reference.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @param value the new value of the '<em>Base Interface</em>' reference.
	 * @see #getBase_Interface()
	 * @generated
	 */
	void setBase_Interface(Interface value);

	/**
	 * Returns the value of the '<em><b>Message Kind</b></em>' attribute.
	 * The default value is <code>"in"</code>.
	 * The literals are from the enumeration {@link com.ericsson.executablemodeling.xtuml.profile.executablemodelingprofile.XMessageKind}.
	 * <!-- begin-user-doc -->
	 * <p>
	 * If the meaning of the '<em>Message Kind</em>' attribute isn't clear,
	 * there really should be more of a description here...
	 * </p>
	 * <!-- end-user-doc -->
	 * @return the value of the '<em>Message Kind</em>' attribute.
	 * @see com.ericsson.executablemodeling.xtuml.profile.executablemodelingprofile.XMessageKind
	 * @see #setMessageKind(XMessageKind)
	 * @see com.ericsson.executablemodeling.xtuml.profile.executablemodelingprofile.ExecutableModelingProfilePackage#getXMessageSet_MessageKind()
	 * @model default="in" unique="false" required="true" ordered="false"
	 * @generated
	 */
	XMessageKind getMessageKind();

	/**
	 * Sets the value of the '{@link com.ericsson.executablemodeling.xtuml.profile.executablemodelingprofile.XMessageSet#getMessageKind <em>Message Kind</em>}' attribute.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @param value the new value of the '<em>Message Kind</em>' attribute.
	 * @see com.ericsson.executablemodeling.xtuml.profile.executablemodelingprofile.XMessageKind
	 * @see #getMessageKind()
	 * @generated
	 */
	void setMessageKind(XMessageKind value);

	/**
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * <!-- begin-model-doc -->
	 * If messageKind = in, then the Interface shall be the target of an InterfaceRealization relationship with a BehavioredClassifier, which shall be in the same Package and have an XProtocol stereotype applied, and the Interface shall have the same name as the BehavioredClassifier.
	 * @param diagnostics The chain of diagnostics to which problems are to be appended.
	 * @param context The cache of context-specific information.
	 * <!-- end-model-doc -->
	 * @model
	 * @generated
	 */
	boolean xMessageSetIncoming(DiagnosticChain diagnostics, Map<Object, Object> context);

	/**
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * <!-- begin-model-doc -->
	 * If messageKind = out, then the Interface shall be the target of a Usage relationship with a BehavioredClassifier, which shall be in the same Package and have an XProtocol stereotype applied, and the name of the Interface shall be the name of the BehavioredClassifier with the character "~" appended.
	 * @param diagnostics The chain of diagnostics to which problems are to be appended.
	 * @param context The cache of context-specific information.
	 * <!-- end-model-doc -->
	 * @model
	 * @generated
	 */
	boolean xMessageSetOutgoing(DiagnosticChain diagnostics, Map<Object, Object> context);

	/**
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * <!-- begin-model-doc -->
	 * If messageKind = inout, then the Interface shall be the target of both an InterfaceRealization relationship and a Usage relationship with the same BehavioredClassifier, which shall be in the same Package and have an XProtocol stereotype applied, and the name of the Interface shall be the name of the BehavioriedClassifier with the string "Sym" appended.
	 * @param diagnostics The chain of diagnostics to which problems are to be appended.
	 * @param context The cache of context-specific information.
	 * <!-- end-model-doc -->
	 * @model
	 * @generated
	 */
	boolean xMessageSetSymmetric(DiagnosticChain diagnostics, Map<Object, Object> context);

} // XMessageSet
