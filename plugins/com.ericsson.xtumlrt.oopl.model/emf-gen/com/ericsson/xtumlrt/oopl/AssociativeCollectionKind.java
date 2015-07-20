/**
 */
package com.ericsson.xtumlrt.oopl;

import java.util.Arrays;
import java.util.Collections;
import java.util.List;

import org.eclipse.emf.common.util.Enumerator;

/**
 * <!-- begin-user-doc -->
 * A representation of the literals of the enumeration '<em><b>Associative Collection Kind</b></em>',
 * and utility methods for working with them.
 * <!-- end-user-doc -->
 * <!-- begin-model-doc -->
 * Enumeration of the possible associative class reference collection kinds to be used for attribute kind in class {@link com.ericsson.xtumlrt.oopl.OOPLClassRefAssocCollection}.
 * <!-- end-model-doc -->
 * @see com.ericsson.xtumlrt.oopl.OoplPackage#getAssociativeCollectionKind()
 * @model
 * @generated
 */
public enum AssociativeCollectionKind implements Enumerator {
    /**
     * The '<em><b>UNORDERED SET</b></em>' literal object.
     * <!-- begin-user-doc -->
     * <!-- end-user-doc -->
     * @see #UNORDERED_SET_VALUE
     * @generated
     * @ordered
     */
    UNORDERED_SET(0, "UNORDERED_SET", "UNORDERED_SET"),

    /**
     * The '<em><b>ORDERED SET</b></em>' literal object.
     * <!-- begin-user-doc -->
     * <!-- end-user-doc -->
     * @see #ORDERED_SET_VALUE
     * @generated
     * @ordered
     */
    ORDERED_SET(1, "ORDERED_SET", "ORDERED_SET"),

    /**
     * The '<em><b>UNORDERED MULTISET</b></em>' literal object.
     * <!-- begin-user-doc -->
     * <!-- end-user-doc -->
     * @see #UNORDERED_MULTISET_VALUE
     * @generated
     * @ordered
     */
    UNORDERED_MULTISET(2, "UNORDERED_MULTISET", "UNORDERED_MULTISET"),

    /**
     * The '<em><b>ORDERED MULTISET</b></em>' literal object.
     * <!-- begin-user-doc -->
     * <!-- end-user-doc -->
     * @see #ORDERED_MULTISET_VALUE
     * @generated
     * @ordered
     */
    ORDERED_MULTISET(3, "ORDERED_MULTISET", "ORDERED_MULTISET"),

    /**
     * The '<em><b>UNORDERED MAP</b></em>' literal object.
     * <!-- begin-user-doc -->
     * <!-- end-user-doc -->
     * @see #UNORDERED_MAP_VALUE
     * @generated
     * @ordered
     */
    UNORDERED_MAP(4, "UNORDERED_MAP", "UNORDERED_MAP"),

    /**
     * The '<em><b>ORDERED MAP</b></em>' literal object.
     * <!-- begin-user-doc -->
     * <!-- end-user-doc -->
     * @see #ORDERED_MAP_VALUE
     * @generated
     * @ordered
     */
    ORDERED_MAP(5, "ORDERED_MAP", "ORDERED_MAP"),

    /**
     * The '<em><b>UNORDERED MULTIMAP</b></em>' literal object.
     * <!-- begin-user-doc -->
     * <!-- end-user-doc -->
     * @see #UNORDERED_MULTIMAP_VALUE
     * @generated
     * @ordered
     */
    UNORDERED_MULTIMAP(6, "UNORDERED_MULTIMAP", "UNORDERED_MULTIMAP"),

    /**
     * The '<em><b>ORDERED MULTIMAP</b></em>' literal object.
     * <!-- begin-user-doc -->
     * <!-- end-user-doc -->
     * @see #ORDERED_MULTIMAP_VALUE
     * @generated
     * @ordered
     */
    ORDERED_MULTIMAP(7, "ORDERED_MULTIMAP", "ORDERED_MULTIMAP");

    /**
     * The '<em><b>UNORDERED SET</b></em>' literal value.
     * <!-- begin-user-doc -->
     * <p>
     * If the meaning of '<em><b>UNORDERED SET</b></em>' literal object isn't clear,
     * there really should be more of a description here...
     * </p>
     * <!-- end-user-doc -->
     * @see #UNORDERED_SET
     * @model
     * @generated
     * @ordered
     */
    public static final int UNORDERED_SET_VALUE = 0;

    /**
     * The '<em><b>ORDERED SET</b></em>' literal value.
     * <!-- begin-user-doc -->
     * <p>
     * If the meaning of '<em><b>ORDERED SET</b></em>' literal object isn't clear,
     * there really should be more of a description here...
     * </p>
     * <!-- end-user-doc -->
     * @see #ORDERED_SET
     * @model
     * @generated
     * @ordered
     */
    public static final int ORDERED_SET_VALUE = 1;

    /**
     * The '<em><b>UNORDERED MULTISET</b></em>' literal value.
     * <!-- begin-user-doc -->
     * <p>
     * If the meaning of '<em><b>UNORDERED MULTISET</b></em>' literal object isn't clear,
     * there really should be more of a description here...
     * </p>
     * <!-- end-user-doc -->
     * @see #UNORDERED_MULTISET
     * @model
     * @generated
     * @ordered
     */
    public static final int UNORDERED_MULTISET_VALUE = 2;

    /**
     * The '<em><b>ORDERED MULTISET</b></em>' literal value.
     * <!-- begin-user-doc -->
     * <p>
     * If the meaning of '<em><b>ORDERED MULTISET</b></em>' literal object isn't clear,
     * there really should be more of a description here...
     * </p>
     * <!-- end-user-doc -->
     * @see #ORDERED_MULTISET
     * @model
     * @generated
     * @ordered
     */
    public static final int ORDERED_MULTISET_VALUE = 3;

    /**
     * The '<em><b>UNORDERED MAP</b></em>' literal value.
     * <!-- begin-user-doc -->
     * <p>
     * If the meaning of '<em><b>UNORDERED MAP</b></em>' literal object isn't clear,
     * there really should be more of a description here...
     * </p>
     * <!-- end-user-doc -->
     * @see #UNORDERED_MAP
     * @model
     * @generated
     * @ordered
     */
    public static final int UNORDERED_MAP_VALUE = 4;

    /**
     * The '<em><b>ORDERED MAP</b></em>' literal value.
     * <!-- begin-user-doc -->
     * <p>
     * If the meaning of '<em><b>ORDERED MAP</b></em>' literal object isn't clear,
     * there really should be more of a description here...
     * </p>
     * <!-- end-user-doc -->
     * @see #ORDERED_MAP
     * @model
     * @generated
     * @ordered
     */
    public static final int ORDERED_MAP_VALUE = 5;

    /**
     * The '<em><b>UNORDERED MULTIMAP</b></em>' literal value.
     * <!-- begin-user-doc -->
     * <p>
     * If the meaning of '<em><b>UNORDERED MULTIMAP</b></em>' literal object isn't clear,
     * there really should be more of a description here...
     * </p>
     * <!-- end-user-doc -->
     * @see #UNORDERED_MULTIMAP
     * @model
     * @generated
     * @ordered
     */
    public static final int UNORDERED_MULTIMAP_VALUE = 6;

    /**
     * The '<em><b>ORDERED MULTIMAP</b></em>' literal value.
     * <!-- begin-user-doc -->
     * <p>
     * If the meaning of '<em><b>ORDERED MULTIMAP</b></em>' literal object isn't clear,
     * there really should be more of a description here...
     * </p>
     * <!-- end-user-doc -->
     * @see #ORDERED_MULTIMAP
     * @model
     * @generated
     * @ordered
     */
    public static final int ORDERED_MULTIMAP_VALUE = 7;

    /**
     * An array of all the '<em><b>Associative Collection Kind</b></em>' enumerators.
     * <!-- begin-user-doc -->
     * <!-- end-user-doc -->
     * @generated
     */
    private static final AssociativeCollectionKind[] VALUES_ARRAY =
        new AssociativeCollectionKind[] {
            UNORDERED_SET,
            ORDERED_SET,
            UNORDERED_MULTISET,
            ORDERED_MULTISET,
            UNORDERED_MAP,
            ORDERED_MAP,
            UNORDERED_MULTIMAP,
            ORDERED_MULTIMAP,
        };

    /**
     * A public read-only list of all the '<em><b>Associative Collection Kind</b></em>' enumerators.
     * <!-- begin-user-doc -->
     * <!-- end-user-doc -->
     * @generated
     */
    public static final List<AssociativeCollectionKind> VALUES = Collections.unmodifiableList(Arrays.asList(VALUES_ARRAY));

    /**
     * Returns the '<em><b>Associative Collection Kind</b></em>' literal with the specified literal value.
     * <!-- begin-user-doc -->
     * <!-- end-user-doc -->
     * @param literal the literal.
     * @return the matching enumerator or <code>null</code>.
     * @generated
     */
    public static AssociativeCollectionKind get(String literal) {
        for (int i = 0; i < VALUES_ARRAY.length; ++i) {
            AssociativeCollectionKind result = VALUES_ARRAY[i];
            if (result.toString().equals(literal)) {
                return result;
            }
        }
        return null;
    }

    /**
     * Returns the '<em><b>Associative Collection Kind</b></em>' literal with the specified name.
     * <!-- begin-user-doc -->
     * <!-- end-user-doc -->
     * @param name the name.
     * @return the matching enumerator or <code>null</code>.
     * @generated
     */
    public static AssociativeCollectionKind getByName(String name) {
        for (int i = 0; i < VALUES_ARRAY.length; ++i) {
            AssociativeCollectionKind result = VALUES_ARRAY[i];
            if (result.getName().equals(name)) {
                return result;
            }
        }
        return null;
    }

    /**
     * Returns the '<em><b>Associative Collection Kind</b></em>' literal with the specified integer value.
     * <!-- begin-user-doc -->
     * <!-- end-user-doc -->
     * @param value the integer value.
     * @return the matching enumerator or <code>null</code>.
     * @generated
     */
    public static AssociativeCollectionKind get(int value) {
        switch (value) {
            case UNORDERED_SET_VALUE: return UNORDERED_SET;
            case ORDERED_SET_VALUE: return ORDERED_SET;
            case UNORDERED_MULTISET_VALUE: return UNORDERED_MULTISET;
            case ORDERED_MULTISET_VALUE: return ORDERED_MULTISET;
            case UNORDERED_MAP_VALUE: return UNORDERED_MAP;
            case ORDERED_MAP_VALUE: return ORDERED_MAP;
            case UNORDERED_MULTIMAP_VALUE: return UNORDERED_MULTIMAP;
            case ORDERED_MULTIMAP_VALUE: return ORDERED_MULTIMAP;
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
    private AssociativeCollectionKind(int value, String name, String literal) {
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
    
} //AssociativeCollectionKind
