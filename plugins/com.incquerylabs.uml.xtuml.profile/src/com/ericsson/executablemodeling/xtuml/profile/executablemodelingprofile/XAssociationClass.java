/**
 */
package com.ericsson.executablemodeling.xtuml.profile.executablemodelingprofile;

import org.eclipse.uml2.uml.AssociationClass;

/**
 * <!-- begin-user-doc -->
 * A representation of the model object '<em><b>XAssociation Class</b></em>'.
 * <!-- end-user-doc -->
 *
 * <p>
 * The following features are supported:
 * </p>
 * <ul>
 *   <li>{@link com.ericsson.executablemodeling.xtuml.profile.executablemodelingprofile.XAssociationClass#getBase_AssociationClass <em>Base Association Class</em>}</li>
 * </ul>
 *
 * @see com.ericsson.executablemodeling.xtuml.profile.executablemodelingprofile.ExecutableModelingProfilePackage#getXAssociationClass()
 * @model abstract="true"
 * @generated
 */
public interface XAssociationClass extends XClassifier, XAssociation {
	/**
	 * Returns the value of the '<em><b>Base Association Class</b></em>' reference.
	 * <!-- begin-user-doc -->
	 * <p>
	 * If the meaning of the '<em>Base Association Class</em>' reference isn't clear,
	 * there really should be more of a description here...
	 * </p>
	 * <!-- end-user-doc -->
	 * @return the value of the '<em>Base Association Class</em>' reference.
	 * @see #setBase_AssociationClass(AssociationClass)
	 * @see com.ericsson.executablemodeling.xtuml.profile.executablemodelingprofile.ExecutableModelingProfilePackage#getXAssociationClass_Base_AssociationClass()
	 * @model required="true" ordered="false"
	 * @generated
	 */
	AssociationClass getBase_AssociationClass();

	/**
	 * Sets the value of the '{@link com.ericsson.executablemodeling.xtuml.profile.executablemodelingprofile.XAssociationClass#getBase_AssociationClass <em>Base Association Class</em>}' reference.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @param value the new value of the '<em>Base Association Class</em>' reference.
	 * @see #getBase_AssociationClass()
	 * @generated
	 */
	void setBase_AssociationClass(AssociationClass value);

} // XAssociationClass
