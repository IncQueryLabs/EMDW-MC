/**
 */
package com.ericsson.xtumlrt.oopl;

import java.util.Arrays;
import java.util.Collections;
import java.util.List;

import org.eclipse.emf.common.util.Enumerator;

/**
 * <!-- begin-user-doc -->
 * A representation of the literals of the enumeration '<em><b>Simple Collection Kind</b></em>',
 * and utility methods for working with them.
 * <!-- end-user-doc -->
 * <!-- begin-model-doc -->
 * Enumeration of the possible simple class reference collection kinds to be used for attribute kind in class {@link com.ericsson.xtumlrt.oopl.OOPLClassRefSimpleCollection}.
 * <!-- end-model-doc -->
 * @see com.ericsson.xtumlrt.oopl.OoplPackage#getSimpleCollectionKind()
 * @model
 * @generated
 */
public enum SimpleCollectionKind implements Enumerator {
    /**
     * The '<em><b>INDEXED ARRAY</b></em>' literal object.
     * <!-- begin-user-doc -->
     * <!-- end-user-doc -->
     * @see #INDEXED_ARRAY_VALUE
     * @generated
     * @ordered
     */
    INDEXED_ARRAY(0, "INDEXED_ARRAY", "INDEXED_ARRAY"),

    /**
     * The '<em><b>SIMPLY LINKED LIST</b></em>' literal object.
     * <!-- begin-user-doc -->
     * <!-- end-user-doc -->
     * @see #SIMPLY_LINKED_LIST_VALUE
     * @generated
     * @ordered
     */
    SIMPLY_LINKED_LIST(1, "SIMPLY_LINKED_LIST", "SIMPLY_LINKED_LIST"),

    /**
     * The '<em><b>DOUBLY LINKED LIST</b></em>' literal object.
     * <!-- begin-user-doc -->
     * <!-- end-user-doc -->
     * @see #DOUBLY_LINKED_LIST_VALUE
     * @generated
     * @ordered
     */
    DOUBLY_LINKED_LIST(2, "DOUBLY_LINKED_LIST", "DOUBLY_LINKED_LIST"),

    /**
     * The '<em><b>DOUBLE ENDED QUEUE</b></em>' literal object.
     * <!-- begin-user-doc -->
     * <!-- end-user-doc -->
     * @see #DOUBLE_ENDED_QUEUE_VALUE
     * @generated
     * @ordered
     */
    DOUBLE_ENDED_QUEUE(3, "DOUBLE_ENDED_QUEUE", "DOUBLE_ENDED_QUEUE");

    /**
     * The '<em><b>INDEXED ARRAY</b></em>' literal value.
     * <!-- begin-user-doc -->
     * <p>
     * If the meaning of '<em><b>INDEXED ARRAY</b></em>' literal object isn't clear,
     * there really should be more of a description here...
     * </p>
     * <!-- end-user-doc -->
     * @see #INDEXED_ARRAY
     * @model
     * @generated
     * @ordered
     */
    public static final int INDEXED_ARRAY_VALUE = 0;

    /**
     * The '<em><b>SIMPLY LINKED LIST</b></em>' literal value.
     * <!-- begin-user-doc -->
     * <p>
     * If the meaning of '<em><b>SIMPLY LINKED LIST</b></em>' literal object isn't clear,
     * there really should be more of a description here...
     * </p>
     * <!-- end-user-doc -->
     * @see #SIMPLY_LINKED_LIST
     * @model
     * @generated
     * @ordered
     */
    public static final int SIMPLY_LINKED_LIST_VALUE = 1;

    /**
     * The '<em><b>DOUBLY LINKED LIST</b></em>' literal value.
     * <!-- begin-user-doc -->
     * <p>
     * If the meaning of '<em><b>DOUBLY LINKED LIST</b></em>' literal object isn't clear,
     * there really should be more of a description here...
     * </p>
     * <!-- end-user-doc -->
     * @see #DOUBLY_LINKED_LIST
     * @model
     * @generated
     * @ordered
     */
    public static final int DOUBLY_LINKED_LIST_VALUE = 2;

    /**
     * The '<em><b>DOUBLE ENDED QUEUE</b></em>' literal value.
     * <!-- begin-user-doc -->
     * <p>
     * If the meaning of '<em><b>DOUBLE ENDED QUEUE</b></em>' literal object isn't clear,
     * there really should be more of a description here...
     * </p>
     * <!-- end-user-doc -->
     * @see #DOUBLE_ENDED_QUEUE
     * @model
     * @generated
     * @ordered
     */
    public static final int DOUBLE_ENDED_QUEUE_VALUE = 3;

    /**
     * An array of all the '<em><b>Simple Collection Kind</b></em>' enumerators.
     * <!-- begin-user-doc -->
     * <!-- end-user-doc -->
     * @generated
     */
    private static final SimpleCollectionKind[] VALUES_ARRAY =
        new SimpleCollectionKind[] {
            INDEXED_ARRAY,
            SIMPLY_LINKED_LIST,
            DOUBLY_LINKED_LIST,
            DOUBLE_ENDED_QUEUE,
        };

    /**
     * A public read-only list of all the '<em><b>Simple Collection Kind</b></em>' enumerators.
     * <!-- begin-user-doc -->
     * <!-- end-user-doc -->
     * @generated
     */
    public static final List<SimpleCollectionKind> VALUES = Collections.unmodifiableList(Arrays.asList(VALUES_ARRAY));

    /**
     * Returns the '<em><b>Simple Collection Kind</b></em>' literal with the specified literal value.
     * <!-- begin-user-doc -->
     * <!-- end-user-doc -->
     * @param literal the literal.
     * @return the matching enumerator or <code>null</code>.
     * @generated
     */
    public static SimpleCollectionKind get(String literal) {
        for (int i = 0; i < VALUES_ARRAY.length; ++i) {
            SimpleCollectionKind result = VALUES_ARRAY[i];
            if (result.toString().equals(literal)) {
                return result;
            }
        }
        return null;
    }

    /**
     * Returns the '<em><b>Simple Collection Kind</b></em>' literal with the specified name.
     * <!-- begin-user-doc -->
     * <!-- end-user-doc -->
     * @param name the name.
     * @return the matching enumerator or <code>null</code>.
     * @generated
     */
    public static SimpleCollectionKind getByName(String name) {
        for (int i = 0; i < VALUES_ARRAY.length; ++i) {
            SimpleCollectionKind result = VALUES_ARRAY[i];
            if (result.getName().equals(name)) {
                return result;
            }
        }
        return null;
    }

    /**
     * Returns the '<em><b>Simple Collection Kind</b></em>' literal with the specified integer value.
     * <!-- begin-user-doc -->
     * <!-- end-user-doc -->
     * @param value the integer value.
     * @return the matching enumerator or <code>null</code>.
     * @generated
     */
    public static SimpleCollectionKind get(int value) {
        switch (value) {
            case INDEXED_ARRAY_VALUE: return INDEXED_ARRAY;
            case SIMPLY_LINKED_LIST_VALUE: return SIMPLY_LINKED_LIST;
            case DOUBLY_LINKED_LIST_VALUE: return DOUBLY_LINKED_LIST;
            case DOUBLE_ENDED_QUEUE_VALUE: return DOUBLE_ENDED_QUEUE;
        }
        return null;
    }

    /**
     * <!-- begin-user-doc -->
     * <!-- end-user-doc -->
     * @generated
     */
    private final int value;

    /**
     * <!-- begin-user-doc -->
     * <!-- end-user-doc -->
     * @generated
     */
    private final String name;

    /**
     * <!-- begin-user-doc -->
     * <!-- end-user-doc -->
     * @generated
     */
    private final String literal;

    /**
     * Only this class can construct instances.
     * <!-- begin-user-doc -->
     * <!-- end-user-doc -->
     * @generated
     */
    private SimpleCollectionKind(int value, String name, String literal) {
        this.value = value;
        this.name = name;
        this.literal = literal;
    }

    /**
     * <!-- begin-user-doc -->
     * <!-- end-user-doc -->
     * @generated
     */
    public int getValue() {
      return value;
    }

    /**
     * <!-- begin-user-doc -->
     * <!-- end-user-doc -->
     * @generated
     */
    public String getName() {
      return name;
    }

    /**
     * <!-- begin-user-doc -->
     * <!-- end-user-doc -->
     * @generated
     */
    public String getLiteral() {
      return literal;
    }

    /**
     * Returns the literal value of the enumerator, which is its string representation.
     * <!-- begin-user-doc -->
     * <!-- end-user-doc -->
     * @generated
     */
    @Override
    public String toString() {
        return literal;
    }
    
} //SimpleCollectionKind
