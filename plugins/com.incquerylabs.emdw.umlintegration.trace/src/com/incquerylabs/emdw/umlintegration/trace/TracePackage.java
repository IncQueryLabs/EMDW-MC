/**
 */
package com.incquerylabs.emdw.umlintegration.trace;

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
 * @see com.incquerylabs.emdw.umlintegration.trace.TraceFactory
 * @model kind="package"
 * @generated
 */
public interface TracePackage extends EPackage {
	/**
	 * The package name.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 */
	String eNAME = "trace";

	/**
	 * The package namespace URI.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 */
	String eNS_URI = "http://incquerylabs.com/emdw/umlintegration/trace";

	/**
	 * The package namespace name.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 */
	String eNS_PREFIX = "trace";

	/**
	 * The singleton instance of the package.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 */
	TracePackage eINSTANCE = com.incquerylabs.emdw.umlintegration.trace.impl.TracePackageImpl.init();

	/**
	 * The meta object id for the '{@link com.incquerylabs.emdw.umlintegration.trace.impl.RootMappingImpl <em>Root Mapping</em>}' class.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @see com.incquerylabs.emdw.umlintegration.trace.impl.RootMappingImpl
	 * @see com.incquerylabs.emdw.umlintegration.trace.impl.TracePackageImpl#getRootMapping()
	 * @generated
	 */
	int ROOT_MAPPING = 0;

	/**
	 * The feature id for the '<em><b>Uml Root</b></em>' reference.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 * @ordered
	 */
	int ROOT_MAPPING__UML_ROOT = 0;

	/**
	 * The feature id for the '<em><b>Xtumlrt Root</b></em>' reference.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 * @ordered
	 */
	int ROOT_MAPPING__XTUMLRT_ROOT = 1;

	/**
	 * The feature id for the '<em><b>Traces</b></em>' containment reference list.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 * @ordered
	 */
	int ROOT_MAPPING__TRACES = 2;

	/**
	 * The number of structural features of the '<em>Root Mapping</em>' class.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 * @ordered
	 */
	int ROOT_MAPPING_FEATURE_COUNT = 3;

	/**
	 * The number of operations of the '<em>Root Mapping</em>' class.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 * @ordered
	 */
	int ROOT_MAPPING_OPERATION_COUNT = 0;

	/**
	 * The meta object id for the '{@link com.incquerylabs.emdw.umlintegration.trace.impl.TraceImpl <em>Trace</em>}' class.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @see com.incquerylabs.emdw.umlintegration.trace.impl.TraceImpl
	 * @see com.incquerylabs.emdw.umlintegration.trace.impl.TracePackageImpl#getTrace()
	 * @generated
	 */
	int TRACE = 1;

	/**
	 * The feature id for the '<em><b>Uml Elements</b></em>' reference list.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 * @ordered
	 */
	int TRACE__UML_ELEMENTS = 0;

	/**
	 * The feature id for the '<em><b>Xtumlrt Elements</b></em>' reference list.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 * @ordered
	 */
	int TRACE__XTUMLRT_ELEMENTS = 1;

	/**
	 * The number of structural features of the '<em>Trace</em>' class.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 * @ordered
	 */
	int TRACE_FEATURE_COUNT = 2;

	/**
	 * The number of operations of the '<em>Trace</em>' class.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 * @ordered
	 */
	int TRACE_OPERATION_COUNT = 0;


	/**
	 * Returns the meta object for class '{@link com.incquerylabs.emdw.umlintegration.trace.RootMapping <em>Root Mapping</em>}'.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @return the meta object for class '<em>Root Mapping</em>'.
	 * @see com.incquerylabs.emdw.umlintegration.trace.RootMapping
	 * @generated
	 */
	EClass getRootMapping();

	/**
	 * Returns the meta object for the reference '{@link com.incquerylabs.emdw.umlintegration.trace.RootMapping#getUmlRoot <em>Uml Root</em>}'.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @return the meta object for the reference '<em>Uml Root</em>'.
	 * @see com.incquerylabs.emdw.umlintegration.trace.RootMapping#getUmlRoot()
	 * @see #getRootMapping()
	 * @generated
	 */
	EReference getRootMapping_UmlRoot();

	/**
	 * Returns the meta object for the reference '{@link com.incquerylabs.emdw.umlintegration.trace.RootMapping#getXtumlrtRoot <em>Xtumlrt Root</em>}'.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @return the meta object for the reference '<em>Xtumlrt Root</em>'.
	 * @see com.incquerylabs.emdw.umlintegration.trace.RootMapping#getXtumlrtRoot()
	 * @see #getRootMapping()
	 * @generated
	 */
	EReference getRootMapping_XtumlrtRoot();

	/**
	 * Returns the meta object for the containment reference list '{@link com.incquerylabs.emdw.umlintegration.trace.RootMapping#getTraces <em>Traces</em>}'.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @return the meta object for the containment reference list '<em>Traces</em>'.
	 * @see com.incquerylabs.emdw.umlintegration.trace.RootMapping#getTraces()
	 * @see #getRootMapping()
	 * @generated
	 */
	EReference getRootMapping_Traces();

	/**
	 * Returns the meta object for class '{@link com.incquerylabs.emdw.umlintegration.trace.Trace <em>Trace</em>}'.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @return the meta object for class '<em>Trace</em>'.
	 * @see com.incquerylabs.emdw.umlintegration.trace.Trace
	 * @generated
	 */
	EClass getTrace();

	/**
	 * Returns the meta object for the reference list '{@link com.incquerylabs.emdw.umlintegration.trace.Trace#getUmlElements <em>Uml Elements</em>}'.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @return the meta object for the reference list '<em>Uml Elements</em>'.
	 * @see com.incquerylabs.emdw.umlintegration.trace.Trace#getUmlElements()
	 * @see #getTrace()
	 * @generated
	 */
	EReference getTrace_UmlElements();

	/**
	 * Returns the meta object for the reference list '{@link com.incquerylabs.emdw.umlintegration.trace.Trace#getXtumlrtElements <em>Xtumlrt Elements</em>}'.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @return the meta object for the reference list '<em>Xtumlrt Elements</em>'.
	 * @see com.incquerylabs.emdw.umlintegration.trace.Trace#getXtumlrtElements()
	 * @see #getTrace()
	 * @generated
	 */
	EReference getTrace_XtumlrtElements();

	/**
	 * Returns the factory that creates the instances of the model.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @return the factory that creates the instances of the model.
	 * @generated
	 */
	TraceFactory getTraceFactory();

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
		 * The meta object literal for the '{@link com.incquerylabs.emdw.umlintegration.trace.impl.RootMappingImpl <em>Root Mapping</em>}' class.
		 * <!-- begin-user-doc -->
		 * <!-- end-user-doc -->
		 * @see com.incquerylabs.emdw.umlintegration.trace.impl.RootMappingImpl
		 * @see com.incquerylabs.emdw.umlintegration.trace.impl.TracePackageImpl#getRootMapping()
		 * @generated
		 */
		EClass ROOT_MAPPING = eINSTANCE.getRootMapping();

		/**
		 * The meta object literal for the '<em><b>Uml Root</b></em>' reference feature.
		 * <!-- begin-user-doc -->
		 * <!-- end-user-doc -->
		 * @generated
		 */
		EReference ROOT_MAPPING__UML_ROOT = eINSTANCE.getRootMapping_UmlRoot();

		/**
		 * The meta object literal for the '<em><b>Xtumlrt Root</b></em>' reference feature.
		 * <!-- begin-user-doc -->
		 * <!-- end-user-doc -->
		 * @generated
		 */
		EReference ROOT_MAPPING__XTUMLRT_ROOT = eINSTANCE.getRootMapping_XtumlrtRoot();

		/**
		 * The meta object literal for the '<em><b>Traces</b></em>' containment reference list feature.
		 * <!-- begin-user-doc -->
		 * <!-- end-user-doc -->
		 * @generated
		 */
		EReference ROOT_MAPPING__TRACES = eINSTANCE.getRootMapping_Traces();

		/**
		 * The meta object literal for the '{@link com.incquerylabs.emdw.umlintegration.trace.impl.TraceImpl <em>Trace</em>}' class.
		 * <!-- begin-user-doc -->
		 * <!-- end-user-doc -->
		 * @see com.incquerylabs.emdw.umlintegration.trace.impl.TraceImpl
		 * @see com.incquerylabs.emdw.umlintegration.trace.impl.TracePackageImpl#getTrace()
		 * @generated
		 */
		EClass TRACE = eINSTANCE.getTrace();

		/**
		 * The meta object literal for the '<em><b>Uml Elements</b></em>' reference list feature.
		 * <!-- begin-user-doc -->
		 * <!-- end-user-doc -->
		 * @generated
		 */
		EReference TRACE__UML_ELEMENTS = eINSTANCE.getTrace_UmlElements();

		/**
		 * The meta object literal for the '<em><b>Xtumlrt Elements</b></em>' reference list feature.
		 * <!-- begin-user-doc -->
		 * <!-- end-user-doc -->
		 * @generated
		 */
		EReference TRACE__XTUMLRT_ELEMENTS = eINSTANCE.getTrace_XtumlrtElements();

	}

} //TracePackage
