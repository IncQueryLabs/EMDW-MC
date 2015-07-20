/**
 */
package com.ericsson.xtumlrt.oopl;

import java.util.Arrays;
import java.util.Collections;
import java.util.List;

import org.eclipse.emf.common.util.Enumerator;

/**
 * <!-- begin-user-doc -->
 * A representation of the literals of the enumeration '<em><b>Sequence Uniqueness Kind</b></em>',
 * and utility methods for working with them.
 * <!-- end-user-doc -->
 * @see com.ericsson.xtumlrt.oopl.OoplPackage#getSequenceUniquenessKind()
 * @model
 * @generated
 */
public enum SequenceUniquenessKind implements Enumerator {
    /**
     * The '<em><b>NON UNIQUE</b></em>' literal object.
     * <!-- begin-user-doc -->
     * <!-- end-user-doc -->
     * @see #NON_UNIQUE_VALUE
     * @generated
     * @ordered
     */
    NON_UNIQUE(0, "NON_UNIQUE", "NON_UNIQUE"),

    /**
     * The '<em><b>UNIQUE</b></em>' literal object.
     * <!-- begin-user-doc -->
     * <!-- end-user-doc -->
     * @see #UNIQUE_VALUE
     * @generated
     * @ordered
     */
    UNIQUE(1, "UNIQUE", "UNIQUE");

    /**
     * The '<em><b>NON UNIQUE</b></em>' literal value.
     * <!-- begin-user-doc -->
     * <p>
     * If the meaning of '<em><b>NON UNIQUE</b></em>' literal object isn't clear,
     * there really should be more of a description here...
     * </p>
     * <!-- end-user-doc -->
     * @see #NON_UNIQUE
     * @model
     * @generated
     * @ordered
     */
    public static final int NON_UNIQUE_VALUE = 0;

    /**
     * The '<em><b>UNIQUE</b></em>' literal value.
     * <!-- begin-user-doc -->
     * <p>
     * If the meaning of '<em><b>UNIQUE</b></em>' literal object isn't clear,
     * there really should be more of a description here...
     * </p>
     * <!-- end-user-doc -->
     * @see #UNIQUE
     * @model
     * @generated
     * @ordered
     */
    public static final int UNIQUE_VALUE = 1;

    /**
     * An array of all the '<em><b>Sequence Uniqueness Kind</b></em>' enumerators.
     * <!-- begin-user-doc -->
     * <!-- end-user-doc -->
     * @generated
     */
    private static final SequenceUniquenessKind[] VALUES_ARRAY =
        new SequenceUniquenessKind[] {
            NON_UNIQUE,
            UNIQUE,
        };

    /**
     * A public read-only list of all the '<em><b>Sequence Uniqueness Kind</b></em>' enumerators.
     * <!-- begin-user-doc -->
     * <!-- end-user-doc -->
     * @generated
     */
    public static final List<SequenceUniquenessKind> VALUES = Collections.unmodifiableList(Arrays.asList(VALUES_ARRAY));

    /**
     * Returns the '<em><b>Sequence Uniqueness Kind</b></em>' literal with the specified literal value.
     * <!-- begin-user-doc -->
     * <!-- end-user-doc -->
     * @param literal the literal.
     * @return the matching enumerator or <code>null</code>.
     * @generated
     */
    public static SequenceUniquenessKind get(String literal) {
        for (int i = 0; i < VALUES_ARRAY.length; ++i) {
            SequenceUniquenessKind result = VALUES_ARRAY[i];
            if (result.toString().equals(literal)) {
                return result;
            }
        }
        return null;
    }

    /**
     * Returns the '<em><b>Sequence Uniqueness Kind</b></em>' literal with the specified name.
     * <!-- begin-user-doc -->
     * <!-- end-user-doc -->
     * @param name the name.
     * @return the matching enumerator or <code>null</code>.
     * @generated
     */
    public static SequenceUniquenessKind getByName(String name) {
        for (int i = 0; i < VALUES_ARRAY.length; ++i) {
            SequenceUniquenessKind result = VALUES_ARRAY[i];
            if (result.getName().equals(name)) {
                return result;
            }
        }
        return null;
    }

    /**
     * Returns the '<em><b>Sequence Uniqueness Kind</b></em>' literal with the specified integer value.
     * <!-- begin-user-doc -->
     * <!-- end-user-doc -->
     * @param value the integer value.
     * @return the matching enumerator or <code>null</code>.
     * @generated
     */
    public static SequenceUniquenessKind get(int value) {
        switch (value) {
            case NON_UNIQUE_VALUE: return NON_UNIQUE;
            case UNIQUE_VALUE: return UNIQUE;
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
    private SequenceUniquenessKind(int value, String name, String literal) {
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
    
} //SequenceUniquenessKind
