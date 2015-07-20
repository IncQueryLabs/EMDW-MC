/**
 */
package com.ericsson.xtumlrt.oopl;


/**
 * <!-- begin-user-doc -->
 * A representation of the model object '<em><b>OOPL Class Ref Simple Collection Implementation</b></em>'.
 * <!-- end-user-doc -->
 *
 * <p>
 * The following features are supported:
 * </p>
 * <ul>
 *   <li>{@link com.ericsson.xtumlrt.oopl.OOPLClassRefSimpleCollectionImplementation#getKind <em>Kind</em>}</li>
 * </ul>
 *
 * @see com.ericsson.xtumlrt.oopl.OoplPackage#getOOPLClassRefSimpleCollectionImplementation()
 * @model
 * @generated
 */
public interface OOPLClassRefSimpleCollectionImplementation extends BaseContainerImplementation {
    /**
     * Returns the value of the '<em><b>Kind</b></em>' attribute.
     * The default value is <code>"SIMPLY_LINKED_LIST"</code>.
     * The literals are from the enumeration {@link com.ericsson.xtumlrt.oopl.SimpleCollectionKind}.
     * <!-- begin-user-doc -->
     * <p>
     * If the meaning of the '<em>Kind</em>' attribute isn't clear,
     * there really should be more of a description here...
     * </p>
     * <!-- end-user-doc -->
     * @return the value of the '<em>Kind</em>' attribute.
     * @see com.ericsson.xtumlrt.oopl.SimpleCollectionKind
     * @see #setKind(SimpleCollectionKind)
     * @see com.ericsson.xtumlrt.oopl.OoplPackage#getOOPLClassRefSimpleCollectionImplementation_Kind()
     * @model default="SIMPLY_LINKED_LIST" required="true"
     * @generated
     */
    SimpleCollectionKind getKind();

    /**
     * Sets the value of the '{@link com.ericsson.xtumlrt.oopl.OOPLClassRefSimpleCollectionImplementation#getKind <em>Kind</em>}' attribute.
     * <!-- begin-user-doc -->
     * <!-- end-user-doc -->
     * @param value the new value of the '<em>Kind</em>' attribute.
     * @see com.ericsson.xtumlrt.oopl.SimpleCollectionKind
     * @see #getKind()
     * @generated
     */
    void setKind(SimpleCollectionKind value);

    /**
     * <!-- begin-user-doc -->
     * <!-- end-user-doc -->
     * @model annotation="http://www.eclipse.org/emf/2002/GenModel body='String template = com.ericsson.xtumlrt.oopl.OOPLClassRefSimpleCollectionImplementationTemplateReplacer.generateElementAtIndex(this, collection, valueType, index, result);\r\nreturn template;'"
     * @generated
     */
    String generateElementAtIndex(String collection, String valueType, String index, String result);

    /**
     * <!-- begin-user-doc -->
     * <!-- end-user-doc -->
     * @model annotation="http://www.eclipse.org/emf/2002/GenModel body='String template = com.ericsson.xtumlrt.oopl.OOPLClassRefSimpleCollectionImplementationTemplateReplacer.generateInsertElementAtIndex(this, collection, value, valueType, index);\r\nreturn template;'"
     * @generated
     */
    String generateInsertElementAtIndex(String collection, String value, String valueType, String index);

    /**
     * <!-- begin-user-doc -->
     * <!-- end-user-doc -->
     * @model annotation="http://www.eclipse.org/emf/2002/GenModel body='String template = com.ericsson.xtumlrt.oopl.OOPLClassRefSimpleCollectionImplementationTemplateReplacer.generateReplaceElementAtIndex(this, collection, value, valueType, index);\r\nreturn template;'"
     * @generated
     */
    String generateReplaceElementAtIndex(String collection, String value, String valueType, String index);

} // OOPLClassRefSimpleCollectionImplementation
