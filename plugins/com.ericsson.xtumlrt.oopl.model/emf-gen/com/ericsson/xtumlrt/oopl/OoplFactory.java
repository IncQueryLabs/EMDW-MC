/**
 */
package com.ericsson.xtumlrt.oopl;

import org.eclipse.emf.ecore.EFactory;

/**
 * <!-- begin-user-doc -->
 * The <b>Factory</b> for the model.
 * It provides a create method for each non-abstract class of the model.
 * <!-- end-user-doc -->
 * @see com.ericsson.xtumlrt.oopl.OoplPackage
 * @generated
 */
public interface OoplFactory extends EFactory {
    /**
     * The singleton instance of the factory.
     * <!-- begin-user-doc -->
     * <!-- end-user-doc -->
     * @generated
     */
    OoplFactory eINSTANCE = com.ericsson.xtumlrt.oopl.impl.OoplFactoryImpl.init();

    /**
     * Returns a new object of class '<em>OOPL Class Ref Simple Collection</em>'.
     * <!-- begin-user-doc -->
     * <!-- end-user-doc -->
     * @return a new object of class '<em>OOPL Class Ref Simple Collection</em>'.
     * @generated
     */
    OOPLClassRefSimpleCollection createOOPLClassRefSimpleCollection();

    /**
     * Returns a new object of class '<em>OOPL Class Ref Assoc Collection</em>'.
     * <!-- begin-user-doc -->
     * <!-- end-user-doc -->
     * @return a new object of class '<em>OOPL Class Ref Assoc Collection</em>'.
     * @generated
     */
    OOPLClassRefAssocCollection createOOPLClassRefAssocCollection();

    /**
     * Returns a new object of class '<em>OOPL Derived Name Provider</em>'.
     * <!-- begin-user-doc -->
     * <!-- end-user-doc -->
     * @return a new object of class '<em>OOPL Derived Name Provider</em>'.
     * @generated
     */
    OOPLDerivedNameProvider createOOPLDerivedNameProvider();

    /**
     * Returns a new object of class '<em>OOPL Existing Name Provider</em>'.
     * <!-- begin-user-doc -->
     * <!-- end-user-doc -->
     * @return a new object of class '<em>OOPL Existing Name Provider</em>'.
     * @generated
     */
    OOPLExistingNameProvider createOOPLExistingNameProvider();

    /**
     * Returns a new object of class '<em>OOPL Sequence</em>'.
     * <!-- begin-user-doc -->
     * <!-- end-user-doc -->
     * @return a new object of class '<em>OOPL Sequence</em>'.
     * @generated
     */
    OOPLSequence createOOPLSequence();

    /**
     * Returns a new object of class '<em>OOPL Class Ref Assoc Collection Implementation</em>'.
     * <!-- begin-user-doc -->
     * <!-- end-user-doc -->
     * @return a new object of class '<em>OOPL Class Ref Assoc Collection Implementation</em>'.
     * @generated
     */
    OOPLClassRefAssocCollectionImplementation createOOPLClassRefAssocCollectionImplementation();

    /**
     * Returns a new object of class '<em>OOPL Class Ref Simple Collection Implementation</em>'.
     * <!-- begin-user-doc -->
     * <!-- end-user-doc -->
     * @return a new object of class '<em>OOPL Class Ref Simple Collection Implementation</em>'.
     * @generated
     */
    OOPLClassRefSimpleCollectionImplementation createOOPLClassRefSimpleCollectionImplementation();

    /**
     * Returns a new object of class '<em>OOPL Sequence Implementation</em>'.
     * <!-- begin-user-doc -->
     * <!-- end-user-doc -->
     * @return a new object of class '<em>OOPL Sequence Implementation</em>'.
     * @generated
     */
    OOPLSequenceImplementation createOOPLSequenceImplementation();

    /**
     * Returns the package supported by this factory.
     * <!-- begin-user-doc -->
     * <!-- end-user-doc -->
     * @return the package supported by this factory.
     * @generated
     */
    OoplPackage getOoplPackage();

} //OoplFactory
