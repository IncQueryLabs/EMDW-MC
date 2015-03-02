/**
 */
package traceability;

import org.eclipse.emf.ecore.EClass;
import org.eclipse.emf.ecore.EPackage;
import org.eclipse.emf.ecore.EReference;

/**
 * <!-- begin-user-doc -->
 * The <b>Package</b> for the model.
 * It contains accessors for the meta objects to represent
 * <ul>
 *   <li>each class,</li>
 *   <li>each feature of each class,</li>
 *   <li>each operation of each class,</li>
 *   <li>each enum,</li>
 *   <li>and each data type</li>
 * </ul>
 * <!-- end-user-doc -->
 * @see traceability.TraceabilityFactory
 * @model kind="package"
 * @generated
 */
public interface TraceabilityPackage extends EPackage {
	/**
	 * The package name.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 */
	String eNAME = "traceability";

	/**
	 * The package namespace URI.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 */
	String eNS_URI = "http://www.example.org/traceability";

	/**
	 * The package namespace name.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 */
	String eNS_PREFIX = "traceability";

	/**
	 * The singleton instance of the package.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 */
	TraceabilityPackage eINSTANCE = traceability.impl.TraceabilityPackageImpl.init();

	/**
	 * The meta object id for the '{@link traceability.impl.UmlToCommonImpl <em>Uml To Common</em>}' class.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @see traceability.impl.UmlToCommonImpl
	 * @see traceability.impl.TraceabilityPackageImpl#getUmlToCommon()
	 * @generated
	 */
	int UML_TO_COMMON = 0;

	/**
	 * The feature id for the '<em><b>Uml</b></em>' reference.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 * @ordered
	 */
	int UML_TO_COMMON__UML = 0;

	/**
	 * The feature id for the '<em><b>Common</b></em>' reference.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 * @ordered
	 */
	int UML_TO_COMMON__COMMON = 1;

	/**
	 * The feature id for the '<em><b>Traces</b></em>' containment reference list.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 * @ordered
	 */
	int UML_TO_COMMON__TRACES = 2;

	/**
	 * The number of structural features of the '<em>Uml To Common</em>' class.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 * @ordered
	 */
	int UML_TO_COMMON_FEATURE_COUNT = 3;

	/**
	 * The number of operations of the '<em>Uml To Common</em>' class.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 * @ordered
	 */
	int UML_TO_COMMON_OPERATION_COUNT = 0;

	/**
	 * The meta object id for the '{@link traceability.impl.UmlToCommonTraceImpl <em>Uml To Common Trace</em>}' class.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @see traceability.impl.UmlToCommonTraceImpl
	 * @see traceability.impl.TraceabilityPackageImpl#getUmlToCommonTrace()
	 * @generated
	 */
	int UML_TO_COMMON_TRACE = 1;

	/**
	 * The feature id for the '<em><b>Uml Elements</b></em>' reference list.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 * @ordered
	 */
	int UML_TO_COMMON_TRACE__UML_ELEMENTS = 0;

	/**
	 * The feature id for the '<em><b>Common Elements</b></em>' reference list.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 * @ordered
	 */
	int UML_TO_COMMON_TRACE__COMMON_ELEMENTS = 1;

	/**
	 * The number of structural features of the '<em>Uml To Common Trace</em>' class.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 * @ordered
	 */
	int UML_TO_COMMON_TRACE_FEATURE_COUNT = 2;

	/**
	 * The number of operations of the '<em>Uml To Common Trace</em>' class.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 * @ordered
	 */
	int UML_TO_COMMON_TRACE_OPERATION_COUNT = 0;


	/**
	 * Returns the meta object for class '{@link traceability.UmlToCommon <em>Uml To Common</em>}'.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @return the meta object for class '<em>Uml To Common</em>'.
	 * @see traceability.UmlToCommon
	 * @generated
	 */
	EClass getUmlToCommon();

	/**
	 * Returns the meta object for the reference '{@link traceability.UmlToCommon#getUml <em>Uml</em>}'.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @return the meta object for the reference '<em>Uml</em>'.
	 * @see traceability.UmlToCommon#getUml()
	 * @see #getUmlToCommon()
	 * @generated
	 */
	EReference getUmlToCommon_Uml();

	/**
	 * Returns the meta object for the reference '{@link traceability.UmlToCommon#getCommon <em>Common</em>}'.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @return the meta object for the reference '<em>Common</em>'.
	 * @see traceability.UmlToCommon#getCommon()
	 * @see #getUmlToCommon()
	 * @generated
	 */
	EReference getUmlToCommon_Common();

	/**
	 * Returns the meta object for the containment reference list '{@link traceability.UmlToCommon#getTraces <em>Traces</em>}'.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @return the meta object for the containment reference list '<em>Traces</em>'.
	 * @see traceability.UmlToCommon#getTraces()
	 * @see #getUmlToCommon()
	 * @generated
	 */
	EReference getUmlToCommon_Traces();

	/**
	 * Returns the meta object for class '{@link traceability.UmlToCommonTrace <em>Uml To Common Trace</em>}'.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @return the meta object for class '<em>Uml To Common Trace</em>'.
	 * @see traceability.UmlToCommonTrace
	 * @generated
	 */
	EClass getUmlToCommonTrace();

	/**
	 * Returns the meta object for the reference list '{@link traceability.UmlToCommonTrace#getUmlElements <em>Uml Elements</em>}'.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @return the meta object for the reference list '<em>Uml Elements</em>'.
	 * @see traceability.UmlToCommonTrace#getUmlElements()
	 * @see #getUmlToCommonTrace()
	 * @generated
	 */
	EReference getUmlToCommonTrace_UmlElements();

	/**
	 * Returns the meta object for the reference list '{@link traceability.UmlToCommonTrace#getCommonElements <em>Common Elements</em>}'.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @return the meta object for the reference list '<em>Common Elements</em>'.
	 * @see traceability.UmlToCommonTrace#getCommonElements()
	 * @see #getUmlToCommonTrace()
	 * @generated
	 */
	EReference getUmlToCommonTrace_CommonElements();

	/**
	 * Returns the factory that creates the instances of the model.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @return the factory that creates the instances of the model.
	 * @generated
	 */
	TraceabilityFactory getTraceabilityFactory();

	/**
	 * <!-- begin-user-doc -->
	 * Defines literals for the meta objects that represent
	 * <ul>
	 *   <li>each class,</li>
	 *   <li>each feature of each class,</li>
	 *   <li>each operation of each class,</li>
	 *   <li>each enum,</li>
	 *   <li>and each data type</li>
	 * </ul>
	 * <!-- end-user-doc -->
	 * @generated
	 */
	interface Literals {
		/**
		 * The meta object literal for the '{@link traceability.impl.UmlToCommonImpl <em>Uml To Common</em>}' class.
		 * <!-- begin-user-doc -->
		 * <!-- end-user-doc -->
		 * @see traceability.impl.UmlToCommonImpl
		 * @see traceability.impl.TraceabilityPackageImpl#getUmlToCommon()
		 * @generated
		 */
		EClass UML_TO_COMMON = eINSTANCE.getUmlToCommon();

		/**
		 * The meta object literal for the '<em><b>Uml</b></em>' reference feature.
		 * <!-- begin-user-doc -->
		 * <!-- end-user-doc -->
		 * @generated
		 */
		EReference UML_TO_COMMON__UML = eINSTANCE.getUmlToCommon_Uml();

		/**
		 * The meta object literal for the '<em><b>Common</b></em>' reference feature.
		 * <!-- begin-user-doc -->
		 * <!-- end-user-doc -->
		 * @generated
		 */
		EReference UML_TO_COMMON__COMMON = eINSTANCE.getUmlToCommon_Common();

		/**
		 * The meta object literal for the '<em><b>Traces</b></em>' containment reference list feature.
		 * <!-- begin-user-doc -->
		 * <!-- end-user-doc -->
		 * @generated
		 */
		EReference UML_TO_COMMON__TRACES = eINSTANCE.getUmlToCommon_Traces();

		/**
		 * The meta object literal for the '{@link traceability.impl.UmlToCommonTraceImpl <em>Uml To Common Trace</em>}' class.
		 * <!-- begin-user-doc -->
		 * <!-- end-user-doc -->
		 * @see traceability.impl.UmlToCommonTraceImpl
		 * @see traceability.impl.TraceabilityPackageImpl#getUmlToCommonTrace()
		 * @generated
		 */
		EClass UML_TO_COMMON_TRACE = eINSTANCE.getUmlToCommonTrace();

		/**
		 * The meta object literal for the '<em><b>Uml Elements</b></em>' reference list feature.
		 * <!-- begin-user-doc -->
		 * <!-- end-user-doc -->
		 * @generated
		 */
		EReference UML_TO_COMMON_TRACE__UML_ELEMENTS = eINSTANCE.getUmlToCommonTrace_UmlElements();

		/**
		 * The meta object literal for the '<em><b>Common Elements</b></em>' reference list feature.
		 * <!-- begin-user-doc -->
		 * <!-- end-user-doc -->
		 * @generated
		 */
		EReference UML_TO_COMMON_TRACE__COMMON_ELEMENTS = eINSTANCE.getUmlToCommonTrace_CommonElements();

	}

} //TraceabilityPackage
