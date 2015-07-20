/**
 */
package com.ericsson.xtumlrt.oopl;

import org.eclipse.emf.common.util.EList;

/**
 * <!-- begin-user-doc -->
 * A representation of the model object '<em><b>OOPL Enum Type</b></em>'.
 * <!-- end-user-doc -->
 *
 * <!-- begin-model-doc -->
 * Enumeration type in OOP languages corresponding to common type {@link org.eclipse.papyrusrt.xtumlrt.common.Enumeration}. Consists of structure members ({@link com.ericsson.xtumlrt.oopl.OOPLEnumerator}).
 * <!-- end-model-doc -->
 *
 * <p>
 * The following features are supported:
 * </p>
 * <ul>
 *   <li>{@link com.ericsson.xtumlrt.oopl.OOPLEnumType#getEnumerators <em>Enumerators</em>}</li>
 *   <li>{@link com.ericsson.xtumlrt.oopl.OOPLEnumType#getDefaultValue <em>Default Value</em>}</li>
 * </ul>
 *
 * @see com.ericsson.xtumlrt.oopl.OoplPackage#getOOPLEnumType()
 * @model abstract="true"
 * @generated
 */
public interface OOPLEnumType extends OOPLType {
    /**
     * Returns the value of the '<em><b>Enumerators</b></em>' reference list.
     * The list contents are of type {@link com.ericsson.xtumlrt.oopl.OOPLEnumerator}.
     * <!-- begin-user-doc -->
     * <!-- end-user-doc -->
     * <!-- begin-model-doc -->
     * {
     * 	OOPLType.commonType(ooplType, type);
     * 	Enumeration(type);
     * 	Enumeration.literals(type, enumerator);
     * 	OOPLEnumerator.commonEnumerationLiteral(ooplEnumerator, enumerator);
     * }
     * 
     * <!-- end-model-doc -->
     * @return the value of the '<em>Enumerators</em>' reference list.
     * @see com.ericsson.xtumlrt.oopl.OoplPackage#getOOPLEnumType_Enumerators()
     * @model required="true" changeable="false" derived="true"
     * @generated
     */
    EList<OOPLEnumerator> getEnumerators();

    /**
     * Returns the value of the '<em><b>Default Value</b></em>' reference.
     * <!-- begin-user-doc -->
     * <!-- end-user-doc -->
     * <!-- begin-model-doc -->
     * {
     * 	OOPLType.commonType(ooplType, type);
     * 	Enumeration(type);
     * 	Enumeration.defaultValue(type, enumerator);
     * 	OOPLEnumerator.commonEnumerationLiteral(ooplEnumerator, enumerator);
     * }
     * 
     * <!-- end-model-doc -->
     * @return the value of the '<em>Default Value</em>' reference.
     * @see com.ericsson.xtumlrt.oopl.OoplPackage#getOOPLEnumType_DefaultValue()
     * @model required="true" changeable="false" derived="true"
     * @generated
     */
    OOPLEnumerator getDefaultValue();

} // OOPLEnumType
