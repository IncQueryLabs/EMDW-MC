/**
 */
package com.ericsson.xtumlrt.oopl;

import org.eclipse.papyrusrt.xtumlrt.common.NamedElement;

/**
 * <!-- begin-user-doc -->
 * A representation of the model object '<em><b>OOPL Existing Name Provider</b></em>'.
 * <!-- end-user-doc -->
 *
 * <!-- begin-model-doc -->
 * Provider class for names of elements in the target language domain that also exist in the model domain (descendats of {@link org.eclipse.papyrusrt.xtumlrt.common.NamedElement}).
 * <!-- end-model-doc -->
 *
 * <p>
 * The following features are supported:
 * </p>
 * <ul>
 *   <li>{@link com.ericsson.xtumlrt.oopl.OOPLExistingNameProvider#getCommonNamedElement <em>Common Named Element</em>}</li>
 * </ul>
 *
 * @see com.ericsson.xtumlrt.oopl.OoplPackage#getOOPLExistingNameProvider()
 * @model
 * @generated
 */
public interface OOPLExistingNameProvider extends OOPLNameProvider {
    /**
     * Returns the value of the '<em><b>Common Named Element</b></em>' reference.
     * <!-- begin-user-doc -->
     * <p>
     * If the meaning of the '<em>Common Named Element</em>' reference isn't clear,
     * there really should be more of a description here...
     * </p>
     * <!-- end-user-doc -->
     * @return the value of the '<em>Common Named Element</em>' reference.
     * @see #setCommonNamedElement(NamedElement)
     * @see com.ericsson.xtumlrt.oopl.OoplPackage#getOOPLExistingNameProvider_CommonNamedElement()
     * @model
     * @generated
     */
    NamedElement getCommonNamedElement();

    /**
     * Sets the value of the '{@link com.ericsson.xtumlrt.oopl.OOPLExistingNameProvider#getCommonNamedElement <em>Common Named Element</em>}' reference.
     * <!-- begin-user-doc -->
     * <!-- end-user-doc -->
     * @param value the new value of the '<em>Common Named Element</em>' reference.
     * @see #getCommonNamedElement()
     * @generated
     */
    void setCommonNamedElement(NamedElement value);

} // OOPLExistingNameProvider
