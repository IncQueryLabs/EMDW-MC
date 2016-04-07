/*******************************************************************************
 * Copyright (c) 2015-2016 IncQuery Labs Ltd. and Ericsson AB
 * All rights reserved. This program and the accompanying materials
 * are made available under the terms of the Eclipse Public License v1.0
 * which accompanies this distribution, and is available at
 * http://www.eclipse.org/legal/epl-v10.html
 *
 * Contributors:
 *     Akos Horvath, Abel Hegedus, Zoltan Ujhelyi, Denes Harmath - initial API and implementation
 *******************************************************************************/
/**
 */
package com.incquerylabs.emdw.umlintegration.trace;

import org.eclipse.emf.common.util.EList;
import org.eclipse.emf.ecore.EObject;
import org.eclipse.uml2.uml.Element;

/**
 * <!-- begin-user-doc -->
 * A representation of the model object '<em><b>Trace</b></em>'.
 * <!-- end-user-doc -->
 *
 * <p>
 * The following features are supported:
 * </p>
 * <ul>
 *   <li>{@link com.incquerylabs.emdw.umlintegration.trace.Trace#getUmlElements <em>Uml Elements</em>}</li>
 *   <li>{@link com.incquerylabs.emdw.umlintegration.trace.Trace#getXtumlrtElements <em>Xtumlrt Elements</em>}</li>
 * </ul>
 *
 * @see com.incquerylabs.emdw.umlintegration.trace.TracePackage#getTrace()
 * @model
 * @generated
 */
public interface Trace extends EObject {
	/**
     * Returns the value of the '<em><b>Uml Elements</b></em>' reference list.
     * The list contents are of type {@link org.eclipse.uml2.uml.Element}.
     * <!-- begin-user-doc -->
	 * <p>
	 * If the meaning of the '<em>Uml Elements</em>' reference list isn't clear,
	 * there really should be more of a description here...
	 * </p>
	 * <!-- end-user-doc -->
     * @return the value of the '<em>Uml Elements</em>' reference list.
     * @see com.incquerylabs.emdw.umlintegration.trace.TracePackage#getTrace_UmlElements()
     * @model
     * @generated
     */
	EList<Element> getUmlElements();

	/**
     * Returns the value of the '<em><b>Xtumlrt Elements</b></em>' reference list.
     * The list contents are of type {@link org.eclipse.emf.ecore.EObject}.
     * <!-- begin-user-doc -->
	 * <p>
	 * If the meaning of the '<em>Xtumlrt Elements</em>' reference list isn't clear,
	 * there really should be more of a description here...
	 * </p>
	 * <!-- end-user-doc -->
     * @return the value of the '<em>Xtumlrt Elements</em>' reference list.
     * @see com.incquerylabs.emdw.umlintegration.trace.TracePackage#getTrace_XtumlrtElements()
     * @model
     * @generated
     */
	EList<EObject> getXtumlrtElements();

} // Trace
