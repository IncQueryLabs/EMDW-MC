/**
 */
package traceability.impl;

import java.util.Collection;
import org.eclipse.emf.common.util.EList;
import org.eclipse.emf.ecore.EClass;
import org.eclipse.emf.ecore.impl.MinimalEObjectImpl;
import org.eclipse.emf.ecore.util.EObjectResolvingEList;
import org.eclipse.uml2.uml.NamedElement;
import traceability.TraceabilityPackage;
import traceability.UmlToCommonTrace;

/**
 * <!-- begin-user-doc -->
 * An implementation of the model object '<em><b>Uml To Common Trace</b></em>'.
 * <!-- end-user-doc -->
 * <p>
 * The following features are implemented:
 * <ul>
 *   <li>{@link traceability.impl.UmlToCommonTraceImpl#getUmlElements <em>Uml Elements</em>}</li>
 *   <li>{@link traceability.impl.UmlToCommonTraceImpl#getCommonElements <em>Common Elements</em>}</li>
 * </ul>
 * </p>
 *
 * @generated
 */
public class UmlToCommonTraceImpl extends MinimalEObjectImpl.Container implements UmlToCommonTrace {
	/**
	 * The cached value of the '{@link #getUmlElements() <em>Uml Elements</em>}' reference list.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @see #getUmlElements()
	 * @generated
	 * @ordered
	 */
	protected EList<NamedElement> umlElements;

	/**
	 * The cached value of the '{@link #getCommonElements() <em>Common Elements</em>}' reference list.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @see #getCommonElements()
	 * @generated
	 * @ordered
	 */
	protected EList<com.zeligsoft.xtumlrt.common.NamedElement> commonElements;

	/**
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 */
	protected UmlToCommonTraceImpl() {
		super();
	}

	/**
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 */
	@Override
	protected EClass eStaticClass() {
		return TraceabilityPackage.Literals.UML_TO_COMMON_TRACE;
	}

	/**
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 */
	public EList<NamedElement> getUmlElements() {
		if (umlElements == null) {
			umlElements = new EObjectResolvingEList<NamedElement>(NamedElement.class, this, TraceabilityPackage.UML_TO_COMMON_TRACE__UML_ELEMENTS);
		}
		return umlElements;
	}

	/**
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 */
	public EList<com.zeligsoft.xtumlrt.common.NamedElement> getCommonElements() {
		if (commonElements == null) {
			commonElements = new EObjectResolvingEList<com.zeligsoft.xtumlrt.common.NamedElement>(com.zeligsoft.xtumlrt.common.NamedElement.class, this, TraceabilityPackage.UML_TO_COMMON_TRACE__COMMON_ELEMENTS);
		}
		return commonElements;
	}

	/**
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 */
	@Override
	public Object eGet(int featureID, boolean resolve, boolean coreType) {
		switch (featureID) {
			case TraceabilityPackage.UML_TO_COMMON_TRACE__UML_ELEMENTS:
				return getUmlElements();
			case TraceabilityPackage.UML_TO_COMMON_TRACE__COMMON_ELEMENTS:
				return getCommonElements();
		}
		return super.eGet(featureID, resolve, coreType);
	}

	/**
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 */
	@SuppressWarnings("unchecked")
	@Override
	public void eSet(int featureID, Object newValue) {
		switch (featureID) {
			case TraceabilityPackage.UML_TO_COMMON_TRACE__UML_ELEMENTS:
				getUmlElements().clear();
				getUmlElements().addAll((Collection<? extends NamedElement>)newValue);
				return;
			case TraceabilityPackage.UML_TO_COMMON_TRACE__COMMON_ELEMENTS:
				getCommonElements().clear();
				getCommonElements().addAll((Collection<? extends com.zeligsoft.xtumlrt.common.NamedElement>)newValue);
				return;
		}
		super.eSet(featureID, newValue);
	}

	/**
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 */
	@Override
	public void eUnset(int featureID) {
		switch (featureID) {
			case TraceabilityPackage.UML_TO_COMMON_TRACE__UML_ELEMENTS:
				getUmlElements().clear();
				return;
			case TraceabilityPackage.UML_TO_COMMON_TRACE__COMMON_ELEMENTS:
				getCommonElements().clear();
				return;
		}
		super.eUnset(featureID);
	}

	/**
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 */
	@Override
	public boolean eIsSet(int featureID) {
		switch (featureID) {
			case TraceabilityPackage.UML_TO_COMMON_TRACE__UML_ELEMENTS:
				return umlElements != null && !umlElements.isEmpty();
			case TraceabilityPackage.UML_TO_COMMON_TRACE__COMMON_ELEMENTS:
				return commonElements != null && !commonElements.isEmpty();
		}
		return super.eIsSet(featureID);
	}

} //UmlToCommonTraceImpl
