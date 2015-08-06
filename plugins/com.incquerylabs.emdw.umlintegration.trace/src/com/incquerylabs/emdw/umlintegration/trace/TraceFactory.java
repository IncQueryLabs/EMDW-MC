/**
 */
package com.incquerylabs.emdw.umlintegration.trace;

import org.eclipse.emf.ecore.EFactory;

/**
 * <!-- begin-user-doc -->
 * The <b>Factory</b> for the model.
 * It provides a create method for each non-abstract class of the model.
 * <!-- end-user-doc -->
 * @see com.incquerylabs.emdw.umlintegration.trace.TracePackage
 * @generated
 */
public interface TraceFactory extends EFactory {
	/**
     * The singleton instance of the factory.
     * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
     * @generated
     */
	TraceFactory eINSTANCE = com.incquerylabs.emdw.umlintegration.trace.impl.TraceFactoryImpl.init();

	/**
     * Returns a new object of class '<em>Root Mapping</em>'.
     * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
     * @return a new object of class '<em>Root Mapping</em>'.
     * @generated
     */
	RootMapping createRootMapping();

	/**
     * Returns a new object of class '<em>Trace</em>'.
     * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
     * @return a new object of class '<em>Trace</em>'.
     * @generated
     */
	Trace createTrace();

	/**
     * Returns the package supported by this factory.
     * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
     * @return the package supported by this factory.
     * @generated
     */
	TracePackage getTracePackage();

} //TraceFactory
