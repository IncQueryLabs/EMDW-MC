/**
 */
package com.ericsson.xtumlrt.oopl;

import java.util.Arrays;
import java.util.Collections;
import java.util.List;

import org.eclipse.emf.common.util.Enumerator;

/**
 * <!-- begin-user-doc -->
 * A representation of the literals of the enumeration '<em><b>Sequence Orderedness Kind</b></em>',
 * and utility methods for working with them.
 * <!-- end-user-doc -->
 * @see com.ericsson.xtumlrt.oopl.OoplPackage#getSequenceOrderednessKind()
 * @model
 * @generated
 */
public enum SequenceOrderednessKind implements Enumerator {
    /**
     * The '<em><b>UNORDERED</b></em>' literal object.
     * <!-- begin-user-doc -->
     * <!-- end-user-doc -->
     * @see #UNORDERED_VALUE
     * @generated
     * @ordered
     */
    UNORDERED(0, "UNORDERED", "UNORDERED"),

    /**
     * The '<em><b>ORDERED</b></em>' literal object.
     * <!-- begin-user-doc -->
     * <!-- end-user-doc -->
     * @see #ORDERED_VALUE
     * @generated
     * @ordered
     */
    ORDERED(1, "ORDERED", "ORDERED"),

    /**
     * The '<em><b>SORTED</b></em>' literal object.
     * <!-- begin-user-doc -->
     * <!-- end-user-doc -->
     * @see #SORTED_VALUE
     * @generated
     * @ordered
     */
    SORTED(2, "SORTED", "");

    /**
     * The '<em><b>UNORDERED</b></em>' literal value.
     * <!-- begin-user-doc -->
     * <p>
     * If the meaning of '<em><b>UNORDERED</b></em>' literal object isn't clear,
     * there really should be more of a description here...
     * </p>
     * <!-- end-user-doc -->
     * @see #UNORDERED
     * @model
     * @generated
     * @ordered
     */
    public static final int UNORDERED_VALUE = 0;

    /**
     * The '<em><b>ORDERED</b></em>' literal value.
     * <!-- begin-user-doc -->
     * <p>
     * If the meaning of '<em><b>ORDERED</b></em>' literal object isn't clear,
     * there really should be more of a description here...
     * </p>
     * <!-- end-user-doc -->
     * @see #ORDERED
     * @model
     * @generated
     * @ordered
     */
    public static final int ORDERED_VALUE = 1;

    /**
     * The '<em><b>SORTED</b></em>' literal value.
     * <!-- begin-user-doc -->
     * <p>
     * If the meaning of '<em><b>SORTED</b></em>' literal object isn't clear,
     * there really should be more of a description here...
     * </p>
     * <!-- end-user-doc -->
     * @see #SORTED
     * @model literal=""
     * @generated
     * @ordered
     */
    public static final int SORTED_VALUE = 2;

    /**
     * An array of all the '<em><b>Sequence Orderedness Kind</b></em>' enumerators.
     * <!-- begin-user-doc -->
     * <!-- end-user-doc -->
     * @generated
     */
    private static final SequenceOrderednessKind[] VALUES_ARRAY =
        new SequenceOrderednessKind[] {
            UNORDERED,
            ORDERED,
            SORTED,
        };

    /**
     * A public read-only list of all the '<em><b>Sequence Orderedness Kind</b></em>' enumerators.
     * <!-- begin-user-doc -->
     * <!-- end-user-doc -->
     * @generated
     */
    public static final List<SequenceOrderednessKind> VALUES = Collections.unmodifiableList(Arrays.asList(VALUES_ARRAY));

    /**
     * Returns the '<em><b>Sequence Orderedness Kind</b></em>' literal with the specified literal value.
     * <!-- begin-user-doc -->
     * <!-- end-user-doc -->
     * @param literal the literal.
     * @return the matching enumerator or <code>null</code>.
     * @generated
     */
    public static SequenceOrderednessKind get(String literal) {
        for (int i = 0; i < VALUES_ARRAY.length; ++i) {
            SequenceOrderednessKind result = VALUES_ARRAY[i];
            if (result.toString().equals(literal)) {
                return result;
            }
        }
        return null;
    }

    /**
     * Returns the '<em><b>Sequence Orderedness Kind</b></em>' literal with the specified name.
     * <!-- begin-user-doc -->
     * <!-- end-user-doc -->
     * @param name the name.
     * @return the matching enumerator or <code>null</code>.
     * @generated
     */
    public static SequenceOrderednessKind getByName(String name) {
        for (int i = 0; i < VALUES_ARRAY.length; ++i) {
            SequenceOrderednessKind result = VALUES_ARRAY[i];
            if (result.getName().equals(name)) {
                return result;
            }
        }
        return null;
    }

    /**
     * Returns the '<em><b>Sequence Orderedness Kind</b></em>' literal with the specified integer value.
     * <!-- begin-user-doc -->
     * <!-- end-user-doc -->
     * @param value the integer value.
     * @return the matching enumerator or <code>null</code>.
     * @generated
     */
    public static SequenceOrderednessKind get(int value) {
        switch (value) {
            case UNORDERED_VALUE: return UNORDERED;
            case ORDERED_VALUE: return ORDERED;
            case SORTED_VALUE: return SORTED;
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
    private SequenceOrderednessKind(int value, String name, String literal) {
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
    
} //SequenceOrderednessKind
