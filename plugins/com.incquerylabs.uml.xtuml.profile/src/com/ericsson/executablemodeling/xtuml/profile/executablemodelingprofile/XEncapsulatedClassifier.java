/**
 */
package com.ericsson.executablemodeling.xtuml.profile.executablemodelingprofile;

import java.util.Map;

import org.eclipse.emf.common.util.DiagnosticChain;

import org.eclipse.uml2.uml.EncapsulatedClassifier;

/**
 * <!-- begin-user-doc -->
 * A representation of the model object '<em><b>XEncapsulated Classifier</b></em>'.
 * <!-- end-user-doc -->
 *
 * <p>
 * The following features are supported:
 * </p>
 * <ul>
 *   <li>{@link com.ericsson.executablemodeling.xtuml.profile.executablemodelingprofile.XEncapsulatedClassifier#getBase_EncapsulatedClassifier <em>Base Encapsulated Classifier</em>}</li>
 *   <li>{@link com.ericsson.executablemodeling.xtuml.profile.executablemodelingprofile.XEncapsulatedClassifier#isExternal <em>Is External</em>}</li>
 * </ul>
 *
 * @see com.ericsson.executablemodeling.xtuml.profile.executablemodelingprofile.ExecutableModelingProfilePackage#getXEncapsulatedClassifier()
 * @model abstract="true"
 * @generated
 */
public interface XEncapsulatedClassifier extends XClassifier {
	/**
	 * Returns the value of the '<em><b>Base Encapsulated Classifier</b></em>' reference.
	 * <!-- begin-user-doc -->
	 * <p>
	 * If the meaning of the '<em>Base Encapsulated Classifier</em>' reference isn't clear,
	 * there really should be more of a description here...
	 * </p>
	 * <!-- end-user-doc -->
	 * @return the value of the '<em>Base Encapsulated Classifier</em>' reference.
	 * @see #setBase_EncapsulatedClassifier(EncapsulatedClassifier)
	 * @see com.ericsson.executablemodeling.xtuml.profile.executablemodelingprofile.ExecutableModelingProfilePackage#getXEncapsulatedClassifier_Base_EncapsulatedClassifier()
	 * @model required="true" ordered="false"
	 * @generated
	 */
	EncapsulatedClassifier getBase_EncapsulatedClassifier();

	/**
	 * Sets the value of the '{@link com.ericsson.executablemodeling.xtuml.profile.executablemodelingprofile.XEncapsulatedClassifier#getBase_EncapsulatedClassifier <em>Base Encapsulated Classifier</em>}' reference.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @param value the new value of the '<em>Base Encapsulated Classifier</em>' reference.
	 * @see #getBase_EncapsulatedClassifier()
	 * @generated
	 */
	void setBase_EncapsulatedClassifier(EncapsulatedClassifier value);

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
	 * @see com.ericsson.executablemodeling.xtuml.profile.executablemodelingprofile.ExecutableModelingProfilePackage#getXEncapsulatedClassifier_IsExternal()
	 * @model default="false" unique="false" dataType="org.eclipse.uml2.types.Boolean" required="true" ordered="false"
	 * @generated
	 */
	boolean isExternal();

	/**
	 * Sets the value of the '{@link com.ericsson.executablemodeling.xtuml.profile.executablemodelingprofile.XEncapsulatedClassifier#isExternal <em>Is External</em>}' attribute.
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
	 * All ports owned by the EncapsulatedClassifier must have an XPort stereotype applied.
	 * @param diagnostics The chain of diagnostics to which problems are to be appended.
	 * @param context The cache of context-specific information.
	 * <!-- end-model-doc -->
	 * @model
	 * @generated
	 */
	boolean xEncapsulatedClassifierPorts(DiagnosticChain diagnostics, Map<Object, Object> context);

	/**
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * <!-- begin-model-doc -->
	 * All ownedConnectors of the EncapsulatedClassifier shall have an XConnector stereotype applied.
	 * @param diagnostics The chain of diagnostics to which problems are to be appended.
	 * @param context The cache of context-specific information.
	 * <!-- end-model-doc -->
	 * @model
	 * @generated
	 */
	boolean xEncapsulatedClassifierconnectors(DiagnosticChain diagnostics, Map<Object, Object> context);

	/**
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * <!-- begin-model-doc -->
	 * If isExternal = true, then the EncapsulatedClassifier shall have no internal structure and all general Classifiers shall also have isExternal = true.
	 * @param diagnostics The chain of diagnostics to which problems are to be appended.
	 * @param context The cache of context-specific information.
	 * <!-- end-model-doc -->
	 * @model
	 * @generated
	 */
	boolean xEncapsulatedClassifierExternal(DiagnosticChain diagnostics, Map<Object, Object> context);

} // XEncapsulatedClassifier
