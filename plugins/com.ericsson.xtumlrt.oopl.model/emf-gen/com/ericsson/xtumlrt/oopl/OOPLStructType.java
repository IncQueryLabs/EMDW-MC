/**
 */
package com.ericsson.xtumlrt.oopl;

import org.eclipse.emf.common.util.EList;

/**
 * <!-- begin-user-doc -->
 * A representation of the model object '<em><b>OOPL Struct Type</b></em>'.
 * <!-- end-user-doc -->
 *
 * <!-- begin-model-doc -->
 * Structure type in OOP languages corresponding to common type {@link org.eclipse.papyrusrt.xtumlrt.common.StructType}. Consists of structure members ({@link com.ericsson.xtumlrt.oopl.OOPLStructMember}).
 * <!-- end-model-doc -->
 *
 * <p>
 * The following features are supported:
 * </p>
 * <ul>
 *   <li>{@link com.ericsson.xtumlrt.oopl.OOPLStructType#getMembers <em>Members</em>}</li>
 * </ul>
 *
 * @see com.ericsson.xtumlrt.oopl.OoplPackage#getOOPLStructType()
 * @model abstract="true"
 * @generated
 */
public interface OOPLStructType extends OOPLType {
    /**
     * Returns the value of the '<em><b>Members</b></em>' reference list.
     * The list contents are of type {@link com.ericsson.xtumlrt.oopl.OOPLStructMember}.
     * <!-- begin-user-doc -->
     * <!-- end-user-doc -->
     * <!-- begin-model-doc -->
     * {
     * 	OOPLType.commonType(ooplType, type);
     * 	StructType(type);
     * 	StructType.structMembers(type, member);
     * 	OOPLStructMember.commonMember(ooplStructMember, member);
     * }
     * 
     * <!-- end-model-doc -->
     * @return the value of the '<em>Members</em>' reference list.
     * @see com.ericsson.xtumlrt.oopl.OoplPackage#getOOPLStructType_Members()
     * @model required="true" changeable="false" derived="true"
     * @generated
     */
    EList<OOPLStructMember> getMembers();

} // OOPLStructType
