/**
 */
package traceability;

import org.eclipse.emf.common.util.EList;
import org.eclipse.emf.ecore.EObject;
import org.eclipse.uml2.uml.NamedElement;

/**
 * <!-- begin-user-doc -->
 * A representation of the model object '<em><b>Uml To Common Trace</b></em>'.
 * <!-- end-user-doc -->
 *
 * <p>
 * The following features are supported:
 * <ul>
 *   <li>{@link traceability.UmlToCommonTrace#getUmlElements <em>Uml Elements</em>}</li>
 *   <li>{@link traceability.UmlToCommonTrace#getCommonElements <em>Common Elements</em>}</li>
 * </ul>
 * </p>
 *
 * @see traceability.TraceabilityPackage#getUmlToCommonTrace()
 * @model
 * @generated
 */
public interface UmlToCommonTrace extends EObject {
	/**
	 * Returns the value of the '<em><b>Uml Elements</b></em>' reference list.
	 * The list contents are of type {@link org.eclipse.uml2.uml.NamedElement}.
	 * <!-- begin-user-doc -->
	 * <p>
	 * If the meaning of the '<em>Uml Elements</em>' reference list isn't clear,
	 * there really should be more of a description here...
	 * </p>
	 * <!-- end-user-doc -->
	 * @return the value of the '<em>Uml Elements</em>' reference list.
	 * @see traceability.TraceabilityPackage#getUmlToCommonTrace_UmlElements()
	 * @model
	 * @generated
	 */
	EList<NamedElement> getUmlElements();

	/**
	 * Returns the value of the '<em><b>Common Elements</b></em>' reference list.
	 * The list contents are of type {@link com.zeligsoft.xtumlrt.common.NamedElement}.
	 * <!-- begin-user-doc -->
	 * <p>
	 * If the meaning of the '<em>Common Elements</em>' reference list isn't clear,
	 * there really should be more of a description here...
	 * </p>
	 * <!-- end-user-doc -->
	 * @return the value of the '<em>Common Elements</em>' reference list.
	 * @see traceability.TraceabilityPackage#getUmlToCommonTrace_CommonElements()
	 * @model
	 * @generated
	 */
	EList<com.zeligsoft.xtumlrt.common.NamedElement> getCommonElements();

} // UmlToCommonTrace
