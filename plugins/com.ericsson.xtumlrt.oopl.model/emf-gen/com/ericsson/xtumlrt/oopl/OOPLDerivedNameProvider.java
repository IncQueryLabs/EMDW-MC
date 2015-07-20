/**
 */
package com.ericsson.xtumlrt.oopl;


/**
 * <!-- begin-user-doc -->
 * A representation of the model object '<em><b>OOPL Derived Name Provider</b></em>'.
 * <!-- end-user-doc -->
 *
 * <!-- begin-model-doc -->
 * Provider class for names of elements in the target language domain that do not exist in the model domain but are derived during population of the target-language dependent part of the translation metamodel.
 * <!-- end-model-doc -->
 *
 * <p>
 * The following features are supported:
 * </p>
 * <ul>
 *   <li>{@link com.ericsson.xtumlrt.oopl.OOPLDerivedNameProvider#getName <em>Name</em>}</li>
 * </ul>
 *
 * @see com.ericsson.xtumlrt.oopl.OoplPackage#getOOPLDerivedNameProvider()
 * @model
 * @generated
 */
public interface OOPLDerivedNameProvider extends OOPLNameProvider {
    /**
     * Returns the value of the '<em><b>Name</b></em>' attribute.
     * <!-- begin-user-doc -->
     * <p>
     * If the meaning of the '<em>Name</em>' attribute isn't clear,
     * there really should be more of a description here...
     * </p>
     * <!-- end-user-doc -->
     * @return the value of the '<em>Name</em>' attribute.
     * @see #setName(String)
     * @see com.ericsson.xtumlrt.oopl.OoplPackage#getOOPLDerivedNameProvider_Name()
     * @model unique="false" required="true" ordered="false"
     * @generated
     */
    String getName();

    /**
     * Sets the value of the '{@link com.ericsson.xtumlrt.oopl.OOPLDerivedNameProvider#getName <em>Name</em>}' attribute.
     * <!-- begin-user-doc -->
     * <!-- end-user-doc -->
     * @param value the new value of the '<em>Name</em>' attribute.
     * @see #getName()
     * @generated
     */
    void setName(String value);

} // OOPLDerivedNameProvider
