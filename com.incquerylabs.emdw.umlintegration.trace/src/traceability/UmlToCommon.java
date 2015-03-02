/**
 */
package traceability;

import org.eclipse.emf.common.util.EList;

import org.eclipse.emf.ecore.EObject;

/**
 * <!-- begin-user-doc -->
 * A representation of the model object '<em><b>Uml To Common</b></em>'.
 * <!-- end-user-doc -->
 *
 * <p>
 * The following features are supported:
 * <ul>
 *   <li>{@link traceability.UmlToCommon#getUml <em>Uml</em>}</li>
 *   <li>{@link traceability.UmlToCommon#getCommon <em>Common</em>}</li>
 *   <li>{@link traceability.UmlToCommon#getTraces <em>Traces</em>}</li>
 * </ul>
 * </p>
 *
 * @see traceability.TraceabilityPackage#getUmlToCommon()
 * @model
 * @generated
 */
public interface UmlToCommon extends EObject {
	/**
	 * Returns the value of the '<em><b>Uml</b></em>' reference.
	 * <!-- begin-user-doc -->
	 * <p>
	 * If the meaning of the '<em>Uml</em>' reference isn't clear,
	 * there really should be more of a description here...
	 * </p>
	 * <!-- end-user-doc -->
	 * @return the value of the '<em>Uml</em>' reference.
	 * @see #setUml(org.eclipse.uml2.uml.Package)
	 * @see traceability.TraceabilityPackage#getUmlToCommon_Uml()
	 * @model
	 * @generated
	 */
	org.eclipse.uml2.uml.Package getUml();

	/**
	 * Sets the value of the '{@link traceability.UmlToCommon#getUml <em>Uml</em>}' reference.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @param value the new value of the '<em>Uml</em>' reference.
	 * @see #getUml()
	 * @generated
	 */
	void setUml(org.eclipse.uml2.uml.Package value);

	/**
	 * Returns the value of the '<em><b>Common</b></em>' reference.
	 * <!-- begin-user-doc -->
	 * <p>
	 * If the meaning of the '<em>Common</em>' reference isn't clear,
	 * there really should be more of a description here...
	 * </p>
	 * <!-- end-user-doc -->
	 * @return the value of the '<em>Common</em>' reference.
	 * @see #setCommon(com.zeligsoft.xtumlrt.common.Package)
	 * @see traceability.TraceabilityPackage#getUmlToCommon_Common()
	 * @model
	 * @generated
	 */
	com.zeligsoft.xtumlrt.common.Package getCommon();

	/**
	 * Sets the value of the '{@link traceability.UmlToCommon#getCommon <em>Common</em>}' reference.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @param value the new value of the '<em>Common</em>' reference.
	 * @see #getCommon()
	 * @generated
	 */
	void setCommon(com.zeligsoft.xtumlrt.common.Package value);

	/**
	 * Returns the value of the '<em><b>Traces</b></em>' containment reference list.
	 * The list contents are of type {@link traceability.UmlToCommonTrace}.
	 * <!-- begin-user-doc -->
	 * <p>
	 * If the meaning of the '<em>Traces</em>' containment reference list isn't clear,
	 * there really should be more of a description here...
	 * </p>
	 * <!-- end-user-doc -->
	 * @return the value of the '<em>Traces</em>' containment reference list.
	 * @see traceability.TraceabilityPackage#getUmlToCommon_Traces()
	 * @model containment="true"
	 * @generated
	 */
	EList<UmlToCommonTrace> getTraces();

} // UmlToCommon
