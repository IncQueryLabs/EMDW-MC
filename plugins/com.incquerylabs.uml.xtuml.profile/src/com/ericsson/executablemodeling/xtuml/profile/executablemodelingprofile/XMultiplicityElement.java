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
import org.eclipse.emf.common.util.EList;

import org.eclipse.emf.ecore.EClass;
import org.eclipse.emf.ecore.EObject;

import org.eclipse.uml2.uml.MultiplicityElement;
import org.eclipse.uml2.uml.Property;
import org.eclipse.uml2.uml.Type;

/**
 * <!-- begin-user-doc -->
 * A representation of the model object '<em><b>XMultiplicity Element</b></em>'.
 * <!-- end-user-doc -->
 *
 * <p>
 * The following features are supported:
 * </p>
 * <ul>
 *   <li>{@link com.ericsson.executablemodeling.xtuml.profile.executablemodelingprofile.XMultiplicityElement#getBase_MultiplicityElement <em>Base Multiplicity Element</em>}</li>
 *   <li>{@link com.ericsson.executablemodeling.xtuml.profile.executablemodelingprofile.XMultiplicityElement#isOrderedByValue <em>Is Ordered By Value</em>}</li>
 *   <li>{@link com.ericsson.executablemodeling.xtuml.profile.executablemodelingprofile.XMultiplicityElement#getKey <em>Key</em>}</li>
 *   <li>{@link com.ericsson.executablemodeling.xtuml.profile.executablemodelingprofile.XMultiplicityElement#isDescending <em>Is Descending</em>}</li>
 * </ul>
 *
 * @see com.ericsson.executablemodeling.xtuml.profile.executablemodelingprofile.ExecutableModelingProfilePackage#getXMultiplicityElement()
 * @model abstract="true"
 * @generated
 */
public interface XMultiplicityElement extends EObject {
	/**
	 * Returns the value of the '<em><b>Base Multiplicity Element</b></em>' reference.
	 * <!-- begin-user-doc -->
	 * <p>
	 * If the meaning of the '<em>Base Multiplicity Element</em>' reference isn't clear,
	 * there really should be more of a description here...
	 * </p>
	 * <!-- end-user-doc -->
	 * @return the value of the '<em>Base Multiplicity Element</em>' reference.
	 * @see #setBase_MultiplicityElement(MultiplicityElement)
	 * @see com.ericsson.executablemodeling.xtuml.profile.executablemodelingprofile.ExecutableModelingProfilePackage#getXMultiplicityElement_Base_MultiplicityElement()
	 * @model required="true" ordered="false"
	 * @generated
	 */
	MultiplicityElement getBase_MultiplicityElement();

	/**
	 * Sets the value of the '{@link com.ericsson.executablemodeling.xtuml.profile.executablemodelingprofile.XMultiplicityElement#getBase_MultiplicityElement <em>Base Multiplicity Element</em>}' reference.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @param value the new value of the '<em>Base Multiplicity Element</em>' reference.
	 * @see #getBase_MultiplicityElement()
	 * @generated
	 */
	void setBase_MultiplicityElement(MultiplicityElement value);

	/**
	 * Returns the value of the '<em><b>Is Ordered By Value</b></em>' attribute.
	 * The default value is <code>"false"</code>.
	 * <!-- begin-user-doc -->
	 * <p>
	 * If the meaning of the '<em>Is Ordered By Value</em>' attribute isn't clear,
	 * there really should be more of a description here...
	 * </p>
	 * <!-- end-user-doc -->
	 * @return the value of the '<em>Is Ordered By Value</em>' attribute.
	 * @see #setIsOrderedByValue(boolean)
	 * @see com.ericsson.executablemodeling.xtuml.profile.executablemodelingprofile.ExecutableModelingProfilePackage#getXMultiplicityElement_IsOrderedByValue()
	 * @model default="false" unique="false" dataType="org.eclipse.uml2.types.Boolean" required="true" ordered="false"
	 * @generated
	 */
	boolean isOrderedByValue();

	/**
	 * Sets the value of the '{@link com.ericsson.executablemodeling.xtuml.profile.executablemodelingprofile.XMultiplicityElement#isOrderedByValue <em>Is Ordered By Value</em>}' attribute.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @param value the new value of the '<em>Is Ordered By Value</em>' attribute.
	 * @see #isOrderedByValue()
	 * @generated
	 */
	void setIsOrderedByValue(boolean value);

	/**
	 * Returns the value of the '<em><b>Key</b></em>' reference list.
	 * The list contents are of type {@link org.eclipse.uml2.uml.Property}.
	 * <!-- begin-user-doc -->
	 * <p>
	 * If the meaning of the '<em>Key</em>' reference list isn't clear,
	 * there really should be more of a description here...
	 * </p>
	 * <!-- end-user-doc -->
	 * @return the value of the '<em>Key</em>' reference list.
	 * @see com.ericsson.executablemodeling.xtuml.profile.executablemodelingprofile.ExecutableModelingProfilePackage#getXMultiplicityElement_Key()
	 * @model ordered="false"
	 * @generated
	 */
	EList<Property> getKey();

	/**
	 * Retrieves the first {@link org.eclipse.uml2.uml.Property} with the specified '<em><b>Name</b></em>', and '<em><b>Type</b></em>' from the '<em><b>Key</b></em>' reference list.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @param name The '<em><b>Name</b></em>' of the {@link org.eclipse.uml2.uml.Property} to retrieve, or <code>null</code>.
	 * @param type The '<em><b>Type</b></em>' of the {@link org.eclipse.uml2.uml.Property} to retrieve, or <code>null</code>.
	 * @return The first {@link org.eclipse.uml2.uml.Property} with the specified '<em><b>Name</b></em>', and '<em><b>Type</b></em>', or <code>null</code>.
	 * @see #getKey()
	 * @generated
	 */
	Property getKey(String name, Type type);

	/**
	 * Retrieves the first {@link org.eclipse.uml2.uml.Property} with the specified '<em><b>Name</b></em>', and '<em><b>Type</b></em>' from the '<em><b>Key</b></em>' reference list.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @param name The '<em><b>Name</b></em>' of the {@link org.eclipse.uml2.uml.Property} to retrieve, or <code>null</code>.
	 * @param type The '<em><b>Type</b></em>' of the {@link org.eclipse.uml2.uml.Property} to retrieve, or <code>null</code>.
	 * @param ignoreCase Whether to ignore case in {@link java.lang.String} comparisons.
	 * @param eClass The Ecore class of the {@link org.eclipse.uml2.uml.Property} to retrieve, or <code>null</code>.
	 * @return The first {@link org.eclipse.uml2.uml.Property} with the specified '<em><b>Name</b></em>', and '<em><b>Type</b></em>', or <code>null</code>.
	 * @see #getKey()
	 * @generated
	 */
	Property getKey(String name, Type type, boolean ignoreCase, EClass eClass);

	/**
	 * Returns the value of the '<em><b>Is Descending</b></em>' attribute.
	 * The default value is <code>"false"</code>.
	 * <!-- begin-user-doc -->
	 * <p>
	 * If the meaning of the '<em>Is Descending</em>' attribute isn't clear,
	 * there really should be more of a description here...
	 * </p>
	 * <!-- end-user-doc -->
	 * @return the value of the '<em>Is Descending</em>' attribute.
	 * @see #setIsDescending(boolean)
	 * @see com.ericsson.executablemodeling.xtuml.profile.executablemodelingprofile.ExecutableModelingProfilePackage#getXMultiplicityElement_IsDescending()
	 * @model default="false" unique="false" dataType="org.eclipse.uml2.types.Boolean" required="true" ordered="false"
	 * @generated
	 */
	boolean isDescending();

	/**
	 * Sets the value of the '{@link com.ericsson.executablemodeling.xtuml.profile.executablemodelingprofile.XMultiplicityElement#isDescending <em>Is Descending</em>}' attribute.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @param value the new value of the '<em>Is Descending</em>' attribute.
	 * @see #isDescending()
	 * @generated
	 */
	void setIsDescending(boolean value);

	/**
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * <!-- begin-model-doc -->
	 * If a Property is ordered by value, then it shall be ordered.
	 * @param diagnostics The chain of diagnostics to which problems are to be appended.
	 * @param context The cache of context-specific information.
	 * <!-- end-model-doc -->
	 * @model
	 * @generated
	 */
	boolean xMultiplicityElementIsOrderedByValue(DiagnosticChain diagnostics, Map<Object, Object> context);

	/**
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * <!-- begin-model-doc -->
	 * If a Property is ordered by value and has a type that is not a PrimitiveType or Enumeration, then it shall have at least one key and all keys shall be features of the type of the Property. Otherwise the Property shall have no keys.
	 * @param diagnostics The chain of diagnostics to which problems are to be appended.
	 * @param context The cache of context-specific information.
	 * <!-- end-model-doc -->
	 * @model
	 * @generated
	 */
	boolean xMultiplicityElementKeys(DiagnosticChain diagnostics, Map<Object, Object> context);

} // XMultiplicityElement
