/**
 */
package com.ericsson.executablemodeling.xtuml.profile.executablemodelingprofile;

import org.eclipse.emf.ecore.EObject;

import org.eclipse.uml2.uml.GeneralizationSet;

/**
 * <!-- begin-user-doc -->
 * A representation of the model object '<em><b>XGeneralization Set</b></em>'.
 * <!-- end-user-doc -->
 *
 * <p>
 * The following features are supported:
 * </p>
 * <ul>
 *   <li>{@link com.ericsson.executablemodeling.xtuml.profile.executablemodelingprofile.XGeneralizationSet#getBase_GeneralizationSet <em>Base Generalization Set</em>}</li>
 * </ul>
 *
 * @see com.ericsson.executablemodeling.xtuml.profile.executablemodelingprofile.ExecutableModelingProfilePackage#getXGeneralizationSet()
 * @model abstract="true"
 * @generated
 */
public interface XGeneralizationSet extends EObject {
	/**
	 * Returns the value of the '<em><b>Base Generalization Set</b></em>' reference.
	 * <!-- begin-user-doc -->
	 * <p>
	 * If the meaning of the '<em>Base Generalization Set</em>' reference isn't clear,
	 * there really should be more of a description here...
	 * </p>
	 * <!-- end-user-doc -->
	 * @return the value of the '<em>Base Generalization Set</em>' reference.
	 * @see #setBase_GeneralizationSet(GeneralizationSet)
	 * @see com.ericsson.executablemodeling.xtuml.profile.executablemodelingprofile.ExecutableModelingProfilePackage#getXGeneralizationSet_Base_GeneralizationSet()
	 * @model required="true" ordered="false"
	 * @generated
	 */
	GeneralizationSet getBase_GeneralizationSet();

	/**
	 * Sets the value of the '{@link com.ericsson.executablemodeling.xtuml.profile.executablemodelingprofile.XGeneralizationSet#getBase_GeneralizationSet <em>Base Generalization Set</em>}' reference.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @param value the new value of the '<em>Base Generalization Set</em>' reference.
	 * @see #getBase_GeneralizationSet()
	 * @generated
	 */
	void setBase_GeneralizationSet(GeneralizationSet value);

} // XGeneralizationSet
