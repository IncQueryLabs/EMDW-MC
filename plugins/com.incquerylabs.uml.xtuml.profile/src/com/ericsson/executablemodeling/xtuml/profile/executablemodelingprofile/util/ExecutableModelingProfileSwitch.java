/**
 */
package com.ericsson.executablemodeling.xtuml.profile.executablemodelingprofile.util;

import com.ericsson.executablemodeling.xtuml.profile.executablemodelingprofile.*;

import org.eclipse.emf.ecore.EObject;
import org.eclipse.emf.ecore.EPackage;

import org.eclipse.emf.ecore.util.Switch;

/**
 * <!-- begin-user-doc -->
 * The <b>Switch</b> for the model's inheritance hierarchy.
 * It supports the call {@link #doSwitch(EObject) doSwitch(object)}
 * to invoke the <code>caseXXX</code> method for each class of the model,
 * starting with the actual class of the object
 * and proceeding up the inheritance hierarchy
 * until a non-null result is returned,
 * which is the result of the switch.
 * <!-- end-user-doc -->
 * @see com.ericsson.executablemodeling.xtuml.profile.executablemodelingprofile.ExecutableModelingProfilePackage
 * @generated
 */
public class ExecutableModelingProfileSwitch<T> extends Switch<T> {
	/**
	 * The cached model package
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 */
	protected static ExecutableModelingProfilePackage modelPackage;

	/**
	 * Creates an instance of the switch.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 */
	public ExecutableModelingProfileSwitch() {
		if (modelPackage == null) {
			modelPackage = ExecutableModelingProfilePackage.eINSTANCE;
		}
	}

	/**
	 * Checks whether this is a switch for the given package.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @param ePackage the package in question.
	 * @return whether this is a switch for the given package.
	 * @generated
	 */
	@Override
	protected boolean isSwitchFor(EPackage ePackage) {
		return ePackage == modelPackage;
	}

	/**
	 * Calls <code>caseXXX</code> for each class of the model until one returns a non null result; it yields that result.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @return the first non-null result returned by a <code>caseXXX</code> call.
	 * @generated
	 */
	@Override
	protected T doSwitch(int classifierID, EObject theEObject) {
		switch (classifierID) {
			case ExecutableModelingProfilePackage.XOPERATION: {
				XOperation xOperation = (XOperation)theEObject;
				T result = caseXOperation(xOperation);
				if (result == null) result = caseXFeature(xOperation);
				if (result == null) result = caseXNamespace(xOperation);
				if (result == null) result = caseXNamedElement(xOperation);
				if (result == null) result = defaultCase(theEObject);
				return result;
			}
			case ExecutableModelingProfilePackage.XNAMESPACE: {
				XNamespace xNamespace = (XNamespace)theEObject;
				T result = caseXNamespace(xNamespace);
				if (result == null) result = caseXNamedElement(xNamespace);
				if (result == null) result = defaultCase(theEObject);
				return result;
			}
			case ExecutableModelingProfilePackage.XNAMED_ELEMENT: {
				XNamedElement xNamedElement = (XNamedElement)theEObject;
				T result = caseXNamedElement(xNamedElement);
				if (result == null) result = defaultCase(theEObject);
				return result;
			}
			case ExecutableModelingProfilePackage.XFEATURE: {
				XFeature xFeature = (XFeature)theEObject;
				T result = caseXFeature(xFeature);
				if (result == null) result = caseXNamedElement(xFeature);
				if (result == null) result = defaultCase(theEObject);
				return result;
			}
			case ExecutableModelingProfilePackage.XASSOCIATION: {
				XAssociation xAssociation = (XAssociation)theEObject;
				T result = caseXAssociation(xAssociation);
				if (result == null) result = defaultCase(theEObject);
				return result;
			}
			case ExecutableModelingProfilePackage.XCLASSIFIER: {
				XClassifier xClassifier = (XClassifier)theEObject;
				T result = caseXClassifier(xClassifier);
				if (result == null) result = caseXNamespace(xClassifier);
				if (result == null) result = caseXNamedElement(xClassifier);
				if (result == null) result = defaultCase(theEObject);
				return result;
			}
			case ExecutableModelingProfilePackage.XBEHAVIOR: {
				XBehavior xBehavior = (XBehavior)theEObject;
				T result = caseXBehavior(xBehavior);
				if (result == null) result = caseXNamespace(xBehavior);
				if (result == null) result = caseXNamedElement(xBehavior);
				if (result == null) result = defaultCase(theEObject);
				return result;
			}
			case ExecutableModelingProfilePackage.XENCAPSULATED_CLASSIFIER: {
				XEncapsulatedClassifier xEncapsulatedClassifier = (XEncapsulatedClassifier)theEObject;
				T result = caseXEncapsulatedClassifier(xEncapsulatedClassifier);
				if (result == null) result = caseXClassifier(xEncapsulatedClassifier);
				if (result == null) result = caseXNamespace(xEncapsulatedClassifier);
				if (result == null) result = caseXNamedElement(xEncapsulatedClassifier);
				if (result == null) result = defaultCase(theEObject);
				return result;
			}
			case ExecutableModelingProfilePackage.XPROTOCOL: {
				XProtocol xProtocol = (XProtocol)theEObject;
				T result = caseXProtocol(xProtocol);
				if (result == null) result = caseXClassifier(xProtocol);
				if (result == null) result = caseXNamespace(xProtocol);
				if (result == null) result = caseXNamedElement(xProtocol);
				if (result == null) result = defaultCase(theEObject);
				return result;
			}
			case ExecutableModelingProfilePackage.XSIGNAL: {
				XSignal xSignal = (XSignal)theEObject;
				T result = caseXSignal(xSignal);
				if (result == null) result = caseXClassifier(xSignal);
				if (result == null) result = caseXNamespace(xSignal);
				if (result == null) result = caseXNamedElement(xSignal);
				if (result == null) result = defaultCase(theEObject);
				return result;
			}
			case ExecutableModelingProfilePackage.XDATA_TYPE: {
				XDataType xDataType = (XDataType)theEObject;
				T result = caseXDataType(xDataType);
				if (result == null) result = caseXClassifier(xDataType);
				if (result == null) result = caseXNamespace(xDataType);
				if (result == null) result = caseXNamedElement(xDataType);
				if (result == null) result = defaultCase(theEObject);
				return result;
			}
			case ExecutableModelingProfilePackage.XPARAMETER: {
				XParameter xParameter = (XParameter)theEObject;
				T result = caseXParameter(xParameter);
				if (result == null) result = caseXTypedElement(xParameter);
				if (result == null) result = defaultCase(theEObject);
				return result;
			}
			case ExecutableModelingProfilePackage.XTYPED_ELEMENT: {
				XTypedElement xTypedElement = (XTypedElement)theEObject;
				T result = caseXTypedElement(xTypedElement);
				if (result == null) result = defaultCase(theEObject);
				return result;
			}
			case ExecutableModelingProfilePackage.XPROPERTY: {
				XProperty xProperty = (XProperty)theEObject;
				T result = caseXProperty(xProperty);
				if (result == null) result = caseXMultiplicityElement(xProperty);
				if (result == null) result = caseXFeature(xProperty);
				if (result == null) result = caseXTypedElement(xProperty);
				if (result == null) result = caseXNamedElement(xProperty);
				if (result == null) result = defaultCase(theEObject);
				return result;
			}
			case ExecutableModelingProfilePackage.XMULTIPLICITY_ELEMENT: {
				XMultiplicityElement xMultiplicityElement = (XMultiplicityElement)theEObject;
				T result = caseXMultiplicityElement(xMultiplicityElement);
				if (result == null) result = defaultCase(theEObject);
				return result;
			}
			case ExecutableModelingProfilePackage.XRECEPTION: {
				XReception xReception = (XReception)theEObject;
				T result = caseXReception(xReception);
				if (result == null) result = caseXFeature(xReception);
				if (result == null) result = caseXNamedElement(xReception);
				if (result == null) result = defaultCase(theEObject);
				return result;
			}
			case ExecutableModelingProfilePackage.XPART: {
				XPart xPart = (XPart)theEObject;
				T result = caseXPart(xPart);
				if (result == null) result = caseXFeature(xPart);
				if (result == null) result = caseXTypedElement(xPart);
				if (result == null) result = caseXNamedElement(xPart);
				if (result == null) result = defaultCase(theEObject);
				return result;
			}
			case ExecutableModelingProfilePackage.XPORT: {
				XPort xPort = (XPort)theEObject;
				T result = caseXPort(xPort);
				if (result == null) result = caseXFeature(xPort);
				if (result == null) result = caseXNamedElement(xPort);
				if (result == null) result = defaultCase(theEObject);
				return result;
			}
			case ExecutableModelingProfilePackage.XCONNECTOR: {
				XConnector xConnector = (XConnector)theEObject;
				T result = caseXConnector(xConnector);
				if (result == null) result = caseXFeature(xConnector);
				if (result == null) result = caseXNamedElement(xConnector);
				if (result == null) result = defaultCase(theEObject);
				return result;
			}
			case ExecutableModelingProfilePackage.XPROTOCOL_CONTAINER: {
				XProtocolContainer xProtocolContainer = (XProtocolContainer)theEObject;
				T result = caseXProtocolContainer(xProtocolContainer);
				if (result == null) result = defaultCase(theEObject);
				return result;
			}
			case ExecutableModelingProfilePackage.XMESSAGE_SET: {
				XMessageSet xMessageSet = (XMessageSet)theEObject;
				T result = caseXMessageSet(xMessageSet);
				if (result == null) result = caseXClassifier(xMessageSet);
				if (result == null) result = caseXNamespace(xMessageSet);
				if (result == null) result = caseXNamedElement(xMessageSet);
				if (result == null) result = defaultCase(theEObject);
				return result;
			}
			case ExecutableModelingProfilePackage.XENUMERATION: {
				XEnumeration xEnumeration = (XEnumeration)theEObject;
				T result = caseXEnumeration(xEnumeration);
				if (result == null) result = caseXDataType(xEnumeration);
				if (result == null) result = caseXClassifier(xEnumeration);
				if (result == null) result = caseXNamespace(xEnumeration);
				if (result == null) result = caseXNamedElement(xEnumeration);
				if (result == null) result = defaultCase(theEObject);
				return result;
			}
			case ExecutableModelingProfilePackage.XASSOCIATION_CLASS: {
				XAssociationClass xAssociationClass = (XAssociationClass)theEObject;
				T result = caseXAssociationClass(xAssociationClass);
				if (result == null) result = caseXClassifier(xAssociationClass);
				if (result == null) result = caseXAssociation(xAssociationClass);
				if (result == null) result = caseXNamespace(xAssociationClass);
				if (result == null) result = caseXNamedElement(xAssociationClass);
				if (result == null) result = defaultCase(theEObject);
				return result;
			}
			case ExecutableModelingProfilePackage.XTRIGGER: {
				XTrigger xTrigger = (XTrigger)theEObject;
				T result = caseXTrigger(xTrigger);
				if (result == null) result = defaultCase(theEObject);
				return result;
			}
			case ExecutableModelingProfilePackage.XSTATE_MACHINE: {
				XStateMachine xStateMachine = (XStateMachine)theEObject;
				T result = caseXStateMachine(xStateMachine);
				if (result == null) result = caseXBehavior(xStateMachine);
				if (result == null) result = caseXNamespace(xStateMachine);
				if (result == null) result = caseXNamedElement(xStateMachine);
				if (result == null) result = defaultCase(theEObject);
				return result;
			}
			case ExecutableModelingProfilePackage.XREGION: {
				XRegion xRegion = (XRegion)theEObject;
				T result = caseXRegion(xRegion);
				if (result == null) result = defaultCase(theEObject);
				return result;
			}
			case ExecutableModelingProfilePackage.XSTATE: {
				XState xState = (XState)theEObject;
				T result = caseXState(xState);
				if (result == null) result = caseXVertex(xState);
				if (result == null) result = defaultCase(theEObject);
				return result;
			}
			case ExecutableModelingProfilePackage.XVERTEX: {
				XVertex xVertex = (XVertex)theEObject;
				T result = caseXVertex(xVertex);
				if (result == null) result = defaultCase(theEObject);
				return result;
			}
			case ExecutableModelingProfilePackage.XPSEUDOSTATE: {
				XPseudostate xPseudostate = (XPseudostate)theEObject;
				T result = caseXPseudostate(xPseudostate);
				if (result == null) result = caseXVertex(xPseudostate);
				if (result == null) result = defaultCase(theEObject);
				return result;
			}
			case ExecutableModelingProfilePackage.XTRANSITION: {
				XTransition xTransition = (XTransition)theEObject;
				T result = caseXTransition(xTransition);
				if (result == null) result = defaultCase(theEObject);
				return result;
			}
			case ExecutableModelingProfilePackage.XACTIVITY: {
				XActivity xActivity = (XActivity)theEObject;
				T result = caseXActivity(xActivity);
				if (result == null) result = caseXActionBehavior(xActivity);
				if (result == null) result = caseXBehavior(xActivity);
				if (result == null) result = caseXNamespace(xActivity);
				if (result == null) result = caseXNamedElement(xActivity);
				if (result == null) result = defaultCase(theEObject);
				return result;
			}
			case ExecutableModelingProfilePackage.XACTION_BEHAVIOR: {
				XActionBehavior xActionBehavior = (XActionBehavior)theEObject;
				T result = caseXActionBehavior(xActionBehavior);
				if (result == null) result = caseXBehavior(xActionBehavior);
				if (result == null) result = caseXNamespace(xActionBehavior);
				if (result == null) result = caseXNamedElement(xActionBehavior);
				if (result == null) result = defaultCase(theEObject);
				return result;
			}
			case ExecutableModelingProfilePackage.XCONSTRAINT: {
				XConstraint xConstraint = (XConstraint)theEObject;
				T result = caseXConstraint(xConstraint);
				if (result == null) result = caseXNamedElement(xConstraint);
				if (result == null) result = defaultCase(theEObject);
				return result;
			}
			case ExecutableModelingProfilePackage.XOPAQUE_BEHAVIOR: {
				XOpaqueBehavior xOpaqueBehavior = (XOpaqueBehavior)theEObject;
				T result = caseXOpaqueBehavior(xOpaqueBehavior);
				if (result == null) result = caseXActionBehavior(xOpaqueBehavior);
				if (result == null) result = caseXBehavior(xOpaqueBehavior);
				if (result == null) result = caseXNamespace(xOpaqueBehavior);
				if (result == null) result = caseXNamedElement(xOpaqueBehavior);
				if (result == null) result = defaultCase(theEObject);
				return result;
			}
			case ExecutableModelingProfilePackage.XCONSTRAINED_TYPE: {
				XConstrainedType xConstrainedType = (XConstrainedType)theEObject;
				T result = caseXConstrainedType(xConstrainedType);
				if (result == null) result = caseXClassifier(xConstrainedType);
				if (result == null) result = caseXNamespace(xConstrainedType);
				if (result == null) result = caseXNamedElement(xConstrainedType);
				if (result == null) result = defaultCase(theEObject);
				return result;
			}
			case ExecutableModelingProfilePackage.XGENERALIZATION: {
				XGeneralization xGeneralization = (XGeneralization)theEObject;
				T result = caseXGeneralization(xGeneralization);
				if (result == null) result = defaultCase(theEObject);
				return result;
			}
			case ExecutableModelingProfilePackage.XGENERALIZATION_SET: {
				XGeneralizationSet xGeneralizationSet = (XGeneralizationSet)theEObject;
				T result = caseXGeneralizationSet(xGeneralizationSet);
				if (result == null) result = defaultCase(theEObject);
				return result;
			}
			case ExecutableModelingProfilePackage.XCLASS: {
				XClass xClass = (XClass)theEObject;
				T result = caseXClass(xClass);
				if (result == null) result = caseXClassifier(xClass);
				if (result == null) result = caseXNamespace(xClass);
				if (result == null) result = caseXNamedElement(xClass);
				if (result == null) result = defaultCase(theEObject);
				return result;
			}
			case ExecutableModelingProfilePackage.XCONNECTOR_END: {
				XConnectorEnd xConnectorEnd = (XConnectorEnd)theEObject;
				T result = caseXConnectorEnd(xConnectorEnd);
				if (result == null) result = defaultCase(theEObject);
				return result;
			}
			default: return defaultCase(theEObject);
		}
	}

	/**
	 * Returns the result of interpreting the object as an instance of '<em>XOperation</em>'.
	 * <!-- begin-user-doc -->
	 * This implementation returns null;
	 * returning a non-null result will terminate the switch.
	 * <!-- end-user-doc -->
	 * @param object the target of the switch.
	 * @return the result of interpreting the object as an instance of '<em>XOperation</em>'.
	 * @see #doSwitch(org.eclipse.emf.ecore.EObject) doSwitch(EObject)
	 * @generated
	 */
	public T caseXOperation(XOperation object) {
		return null;
	}

	/**
	 * Returns the result of interpreting the object as an instance of '<em>XNamespace</em>'.
	 * <!-- begin-user-doc -->
	 * This implementation returns null;
	 * returning a non-null result will terminate the switch.
	 * <!-- end-user-doc -->
	 * @param object the target of the switch.
	 * @return the result of interpreting the object as an instance of '<em>XNamespace</em>'.
	 * @see #doSwitch(org.eclipse.emf.ecore.EObject) doSwitch(EObject)
	 * @generated
	 */
	public T caseXNamespace(XNamespace object) {
		return null;
	}

	/**
	 * Returns the result of interpreting the object as an instance of '<em>XNamed Element</em>'.
	 * <!-- begin-user-doc -->
	 * This implementation returns null;
	 * returning a non-null result will terminate the switch.
	 * <!-- end-user-doc -->
	 * @param object the target of the switch.
	 * @return the result of interpreting the object as an instance of '<em>XNamed Element</em>'.
	 * @see #doSwitch(org.eclipse.emf.ecore.EObject) doSwitch(EObject)
	 * @generated
	 */
	public T caseXNamedElement(XNamedElement object) {
		return null;
	}

	/**
	 * Returns the result of interpreting the object as an instance of '<em>XFeature</em>'.
	 * <!-- begin-user-doc -->
	 * This implementation returns null;
	 * returning a non-null result will terminate the switch.
	 * <!-- end-user-doc -->
	 * @param object the target of the switch.
	 * @return the result of interpreting the object as an instance of '<em>XFeature</em>'.
	 * @see #doSwitch(org.eclipse.emf.ecore.EObject) doSwitch(EObject)
	 * @generated
	 */
	public T caseXFeature(XFeature object) {
		return null;
	}

	/**
	 * Returns the result of interpreting the object as an instance of '<em>XAssociation</em>'.
	 * <!-- begin-user-doc -->
	 * This implementation returns null;
	 * returning a non-null result will terminate the switch.
	 * <!-- end-user-doc -->
	 * @param object the target of the switch.
	 * @return the result of interpreting the object as an instance of '<em>XAssociation</em>'.
	 * @see #doSwitch(org.eclipse.emf.ecore.EObject) doSwitch(EObject)
	 * @generated
	 */
	public T caseXAssociation(XAssociation object) {
		return null;
	}

	/**
	 * Returns the result of interpreting the object as an instance of '<em>XClassifier</em>'.
	 * <!-- begin-user-doc -->
	 * This implementation returns null;
	 * returning a non-null result will terminate the switch.
	 * <!-- end-user-doc -->
	 * @param object the target of the switch.
	 * @return the result of interpreting the object as an instance of '<em>XClassifier</em>'.
	 * @see #doSwitch(org.eclipse.emf.ecore.EObject) doSwitch(EObject)
	 * @generated
	 */
	public T caseXClassifier(XClassifier object) {
		return null;
	}

	/**
	 * Returns the result of interpreting the object as an instance of '<em>XBehavior</em>'.
	 * <!-- begin-user-doc -->
	 * This implementation returns null;
	 * returning a non-null result will terminate the switch.
	 * <!-- end-user-doc -->
	 * @param object the target of the switch.
	 * @return the result of interpreting the object as an instance of '<em>XBehavior</em>'.
	 * @see #doSwitch(org.eclipse.emf.ecore.EObject) doSwitch(EObject)
	 * @generated
	 */
	public T caseXBehavior(XBehavior object) {
		return null;
	}

	/**
	 * Returns the result of interpreting the object as an instance of '<em>XEncapsulated Classifier</em>'.
	 * <!-- begin-user-doc -->
	 * This implementation returns null;
	 * returning a non-null result will terminate the switch.
	 * <!-- end-user-doc -->
	 * @param object the target of the switch.
	 * @return the result of interpreting the object as an instance of '<em>XEncapsulated Classifier</em>'.
	 * @see #doSwitch(org.eclipse.emf.ecore.EObject) doSwitch(EObject)
	 * @generated
	 */
	public T caseXEncapsulatedClassifier(XEncapsulatedClassifier object) {
		return null;
	}

	/**
	 * Returns the result of interpreting the object as an instance of '<em>XProtocol</em>'.
	 * <!-- begin-user-doc -->
	 * This implementation returns null;
	 * returning a non-null result will terminate the switch.
	 * <!-- end-user-doc -->
	 * @param object the target of the switch.
	 * @return the result of interpreting the object as an instance of '<em>XProtocol</em>'.
	 * @see #doSwitch(org.eclipse.emf.ecore.EObject) doSwitch(EObject)
	 * @generated
	 */
	public T caseXProtocol(XProtocol object) {
		return null;
	}

	/**
	 * Returns the result of interpreting the object as an instance of '<em>XSignal</em>'.
	 * <!-- begin-user-doc -->
	 * This implementation returns null;
	 * returning a non-null result will terminate the switch.
	 * <!-- end-user-doc -->
	 * @param object the target of the switch.
	 * @return the result of interpreting the object as an instance of '<em>XSignal</em>'.
	 * @see #doSwitch(org.eclipse.emf.ecore.EObject) doSwitch(EObject)
	 * @generated
	 */
	public T caseXSignal(XSignal object) {
		return null;
	}

	/**
	 * Returns the result of interpreting the object as an instance of '<em>XData Type</em>'.
	 * <!-- begin-user-doc -->
	 * This implementation returns null;
	 * returning a non-null result will terminate the switch.
	 * <!-- end-user-doc -->
	 * @param object the target of the switch.
	 * @return the result of interpreting the object as an instance of '<em>XData Type</em>'.
	 * @see #doSwitch(org.eclipse.emf.ecore.EObject) doSwitch(EObject)
	 * @generated
	 */
	public T caseXDataType(XDataType object) {
		return null;
	}

	/**
	 * Returns the result of interpreting the object as an instance of '<em>XParameter</em>'.
	 * <!-- begin-user-doc -->
	 * This implementation returns null;
	 * returning a non-null result will terminate the switch.
	 * <!-- end-user-doc -->
	 * @param object the target of the switch.
	 * @return the result of interpreting the object as an instance of '<em>XParameter</em>'.
	 * @see #doSwitch(org.eclipse.emf.ecore.EObject) doSwitch(EObject)
	 * @generated
	 */
	public T caseXParameter(XParameter object) {
		return null;
	}

	/**
	 * Returns the result of interpreting the object as an instance of '<em>XTyped Element</em>'.
	 * <!-- begin-user-doc -->
	 * This implementation returns null;
	 * returning a non-null result will terminate the switch.
	 * <!-- end-user-doc -->
	 * @param object the target of the switch.
	 * @return the result of interpreting the object as an instance of '<em>XTyped Element</em>'.
	 * @see #doSwitch(org.eclipse.emf.ecore.EObject) doSwitch(EObject)
	 * @generated
	 */
	public T caseXTypedElement(XTypedElement object) {
		return null;
	}

	/**
	 * Returns the result of interpreting the object as an instance of '<em>XProperty</em>'.
	 * <!-- begin-user-doc -->
	 * This implementation returns null;
	 * returning a non-null result will terminate the switch.
	 * <!-- end-user-doc -->
	 * @param object the target of the switch.
	 * @return the result of interpreting the object as an instance of '<em>XProperty</em>'.
	 * @see #doSwitch(org.eclipse.emf.ecore.EObject) doSwitch(EObject)
	 * @generated
	 */
	public T caseXProperty(XProperty object) {
		return null;
	}

	/**
	 * Returns the result of interpreting the object as an instance of '<em>XMultiplicity Element</em>'.
	 * <!-- begin-user-doc -->
	 * This implementation returns null;
	 * returning a non-null result will terminate the switch.
	 * <!-- end-user-doc -->
	 * @param object the target of the switch.
	 * @return the result of interpreting the object as an instance of '<em>XMultiplicity Element</em>'.
	 * @see #doSwitch(org.eclipse.emf.ecore.EObject) doSwitch(EObject)
	 * @generated
	 */
	public T caseXMultiplicityElement(XMultiplicityElement object) {
		return null;
	}

	/**
	 * Returns the result of interpreting the object as an instance of '<em>XReception</em>'.
	 * <!-- begin-user-doc -->
	 * This implementation returns null;
	 * returning a non-null result will terminate the switch.
	 * <!-- end-user-doc -->
	 * @param object the target of the switch.
	 * @return the result of interpreting the object as an instance of '<em>XReception</em>'.
	 * @see #doSwitch(org.eclipse.emf.ecore.EObject) doSwitch(EObject)
	 * @generated
	 */
	public T caseXReception(XReception object) {
		return null;
	}

	/**
	 * Returns the result of interpreting the object as an instance of '<em>XPart</em>'.
	 * <!-- begin-user-doc -->
	 * This implementation returns null;
	 * returning a non-null result will terminate the switch.
	 * <!-- end-user-doc -->
	 * @param object the target of the switch.
	 * @return the result of interpreting the object as an instance of '<em>XPart</em>'.
	 * @see #doSwitch(org.eclipse.emf.ecore.EObject) doSwitch(EObject)
	 * @generated
	 */
	public T caseXPart(XPart object) {
		return null;
	}

	/**
	 * Returns the result of interpreting the object as an instance of '<em>XPort</em>'.
	 * <!-- begin-user-doc -->
	 * This implementation returns null;
	 * returning a non-null result will terminate the switch.
	 * <!-- end-user-doc -->
	 * @param object the target of the switch.
	 * @return the result of interpreting the object as an instance of '<em>XPort</em>'.
	 * @see #doSwitch(org.eclipse.emf.ecore.EObject) doSwitch(EObject)
	 * @generated
	 */
	public T caseXPort(XPort object) {
		return null;
	}

	/**
	 * Returns the result of interpreting the object as an instance of '<em>XConnector</em>'.
	 * <!-- begin-user-doc -->
	 * This implementation returns null;
	 * returning a non-null result will terminate the switch.
	 * <!-- end-user-doc -->
	 * @param object the target of the switch.
	 * @return the result of interpreting the object as an instance of '<em>XConnector</em>'.
	 * @see #doSwitch(org.eclipse.emf.ecore.EObject) doSwitch(EObject)
	 * @generated
	 */
	public T caseXConnector(XConnector object) {
		return null;
	}

	/**
	 * Returns the result of interpreting the object as an instance of '<em>XProtocol Container</em>'.
	 * <!-- begin-user-doc -->
	 * This implementation returns null;
	 * returning a non-null result will terminate the switch.
	 * <!-- end-user-doc -->
	 * @param object the target of the switch.
	 * @return the result of interpreting the object as an instance of '<em>XProtocol Container</em>'.
	 * @see #doSwitch(org.eclipse.emf.ecore.EObject) doSwitch(EObject)
	 * @generated
	 */
	public T caseXProtocolContainer(XProtocolContainer object) {
		return null;
	}

	/**
	 * Returns the result of interpreting the object as an instance of '<em>XMessage Set</em>'.
	 * <!-- begin-user-doc -->
	 * This implementation returns null;
	 * returning a non-null result will terminate the switch.
	 * <!-- end-user-doc -->
	 * @param object the target of the switch.
	 * @return the result of interpreting the object as an instance of '<em>XMessage Set</em>'.
	 * @see #doSwitch(org.eclipse.emf.ecore.EObject) doSwitch(EObject)
	 * @generated
	 */
	public T caseXMessageSet(XMessageSet object) {
		return null;
	}

	/**
	 * Returns the result of interpreting the object as an instance of '<em>XEnumeration</em>'.
	 * <!-- begin-user-doc -->
	 * This implementation returns null;
	 * returning a non-null result will terminate the switch.
	 * <!-- end-user-doc -->
	 * @param object the target of the switch.
	 * @return the result of interpreting the object as an instance of '<em>XEnumeration</em>'.
	 * @see #doSwitch(org.eclipse.emf.ecore.EObject) doSwitch(EObject)
	 * @generated
	 */
	public T caseXEnumeration(XEnumeration object) {
		return null;
	}

	/**
	 * Returns the result of interpreting the object as an instance of '<em>XAssociation Class</em>'.
	 * <!-- begin-user-doc -->
	 * This implementation returns null;
	 * returning a non-null result will terminate the switch.
	 * <!-- end-user-doc -->
	 * @param object the target of the switch.
	 * @return the result of interpreting the object as an instance of '<em>XAssociation Class</em>'.
	 * @see #doSwitch(org.eclipse.emf.ecore.EObject) doSwitch(EObject)
	 * @generated
	 */
	public T caseXAssociationClass(XAssociationClass object) {
		return null;
	}

	/**
	 * Returns the result of interpreting the object as an instance of '<em>XTrigger</em>'.
	 * <!-- begin-user-doc -->
	 * This implementation returns null;
	 * returning a non-null result will terminate the switch.
	 * <!-- end-user-doc -->
	 * @param object the target of the switch.
	 * @return the result of interpreting the object as an instance of '<em>XTrigger</em>'.
	 * @see #doSwitch(org.eclipse.emf.ecore.EObject) doSwitch(EObject)
	 * @generated
	 */
	public T caseXTrigger(XTrigger object) {
		return null;
	}

	/**
	 * Returns the result of interpreting the object as an instance of '<em>XState Machine</em>'.
	 * <!-- begin-user-doc -->
	 * This implementation returns null;
	 * returning a non-null result will terminate the switch.
	 * <!-- end-user-doc -->
	 * @param object the target of the switch.
	 * @return the result of interpreting the object as an instance of '<em>XState Machine</em>'.
	 * @see #doSwitch(org.eclipse.emf.ecore.EObject) doSwitch(EObject)
	 * @generated
	 */
	public T caseXStateMachine(XStateMachine object) {
		return null;
	}

	/**
	 * Returns the result of interpreting the object as an instance of '<em>XRegion</em>'.
	 * <!-- begin-user-doc -->
	 * This implementation returns null;
	 * returning a non-null result will terminate the switch.
	 * <!-- end-user-doc -->
	 * @param object the target of the switch.
	 * @return the result of interpreting the object as an instance of '<em>XRegion</em>'.
	 * @see #doSwitch(org.eclipse.emf.ecore.EObject) doSwitch(EObject)
	 * @generated
	 */
	public T caseXRegion(XRegion object) {
		return null;
	}

	/**
	 * Returns the result of interpreting the object as an instance of '<em>XState</em>'.
	 * <!-- begin-user-doc -->
	 * This implementation returns null;
	 * returning a non-null result will terminate the switch.
	 * <!-- end-user-doc -->
	 * @param object the target of the switch.
	 * @return the result of interpreting the object as an instance of '<em>XState</em>'.
	 * @see #doSwitch(org.eclipse.emf.ecore.EObject) doSwitch(EObject)
	 * @generated
	 */
	public T caseXState(XState object) {
		return null;
	}

	/**
	 * Returns the result of interpreting the object as an instance of '<em>XVertex</em>'.
	 * <!-- begin-user-doc -->
	 * This implementation returns null;
	 * returning a non-null result will terminate the switch.
	 * <!-- end-user-doc -->
	 * @param object the target of the switch.
	 * @return the result of interpreting the object as an instance of '<em>XVertex</em>'.
	 * @see #doSwitch(org.eclipse.emf.ecore.EObject) doSwitch(EObject)
	 * @generated
	 */
	public T caseXVertex(XVertex object) {
		return null;
	}

	/**
	 * Returns the result of interpreting the object as an instance of '<em>XPseudostate</em>'.
	 * <!-- begin-user-doc -->
	 * This implementation returns null;
	 * returning a non-null result will terminate the switch.
	 * <!-- end-user-doc -->
	 * @param object the target of the switch.
	 * @return the result of interpreting the object as an instance of '<em>XPseudostate</em>'.
	 * @see #doSwitch(org.eclipse.emf.ecore.EObject) doSwitch(EObject)
	 * @generated
	 */
	public T caseXPseudostate(XPseudostate object) {
		return null;
	}

	/**
	 * Returns the result of interpreting the object as an instance of '<em>XTransition</em>'.
	 * <!-- begin-user-doc -->
	 * This implementation returns null;
	 * returning a non-null result will terminate the switch.
	 * <!-- end-user-doc -->
	 * @param object the target of the switch.
	 * @return the result of interpreting the object as an instance of '<em>XTransition</em>'.
	 * @see #doSwitch(org.eclipse.emf.ecore.EObject) doSwitch(EObject)
	 * @generated
	 */
	public T caseXTransition(XTransition object) {
		return null;
	}

	/**
	 * Returns the result of interpreting the object as an instance of '<em>XActivity</em>'.
	 * <!-- begin-user-doc -->
	 * This implementation returns null;
	 * returning a non-null result will terminate the switch.
	 * <!-- end-user-doc -->
	 * @param object the target of the switch.
	 * @return the result of interpreting the object as an instance of '<em>XActivity</em>'.
	 * @see #doSwitch(org.eclipse.emf.ecore.EObject) doSwitch(EObject)
	 * @generated
	 */
	public T caseXActivity(XActivity object) {
		return null;
	}

	/**
	 * Returns the result of interpreting the object as an instance of '<em>XAction Behavior</em>'.
	 * <!-- begin-user-doc -->
	 * This implementation returns null;
	 * returning a non-null result will terminate the switch.
	 * <!-- end-user-doc -->
	 * @param object the target of the switch.
	 * @return the result of interpreting the object as an instance of '<em>XAction Behavior</em>'.
	 * @see #doSwitch(org.eclipse.emf.ecore.EObject) doSwitch(EObject)
	 * @generated
	 */
	public T caseXActionBehavior(XActionBehavior object) {
		return null;
	}

	/**
	 * Returns the result of interpreting the object as an instance of '<em>XConstraint</em>'.
	 * <!-- begin-user-doc -->
	 * This implementation returns null;
	 * returning a non-null result will terminate the switch.
	 * <!-- end-user-doc -->
	 * @param object the target of the switch.
	 * @return the result of interpreting the object as an instance of '<em>XConstraint</em>'.
	 * @see #doSwitch(org.eclipse.emf.ecore.EObject) doSwitch(EObject)
	 * @generated
	 */
	public T caseXConstraint(XConstraint object) {
		return null;
	}

	/**
	 * Returns the result of interpreting the object as an instance of '<em>XOpaque Behavior</em>'.
	 * <!-- begin-user-doc -->
	 * This implementation returns null;
	 * returning a non-null result will terminate the switch.
	 * <!-- end-user-doc -->
	 * @param object the target of the switch.
	 * @return the result of interpreting the object as an instance of '<em>XOpaque Behavior</em>'.
	 * @see #doSwitch(org.eclipse.emf.ecore.EObject) doSwitch(EObject)
	 * @generated
	 */
	public T caseXOpaqueBehavior(XOpaqueBehavior object) {
		return null;
	}

	/**
	 * Returns the result of interpreting the object as an instance of '<em>XConstrained Type</em>'.
	 * <!-- begin-user-doc -->
	 * This implementation returns null;
	 * returning a non-null result will terminate the switch.
	 * <!-- end-user-doc -->
	 * @param object the target of the switch.
	 * @return the result of interpreting the object as an instance of '<em>XConstrained Type</em>'.
	 * @see #doSwitch(org.eclipse.emf.ecore.EObject) doSwitch(EObject)
	 * @generated
	 */
	public T caseXConstrainedType(XConstrainedType object) {
		return null;
	}

	/**
	 * Returns the result of interpreting the object as an instance of '<em>XGeneralization</em>'.
	 * <!-- begin-user-doc -->
	 * This implementation returns null;
	 * returning a non-null result will terminate the switch.
	 * <!-- end-user-doc -->
	 * @param object the target of the switch.
	 * @return the result of interpreting the object as an instance of '<em>XGeneralization</em>'.
	 * @see #doSwitch(org.eclipse.emf.ecore.EObject) doSwitch(EObject)
	 * @generated
	 */
	public T caseXGeneralization(XGeneralization object) {
		return null;
	}

	/**
	 * Returns the result of interpreting the object as an instance of '<em>XGeneralization Set</em>'.
	 * <!-- begin-user-doc -->
	 * This implementation returns null;
	 * returning a non-null result will terminate the switch.
	 * <!-- end-user-doc -->
	 * @param object the target of the switch.
	 * @return the result of interpreting the object as an instance of '<em>XGeneralization Set</em>'.
	 * @see #doSwitch(org.eclipse.emf.ecore.EObject) doSwitch(EObject)
	 * @generated
	 */
	public T caseXGeneralizationSet(XGeneralizationSet object) {
		return null;
	}

	/**
	 * Returns the result of interpreting the object as an instance of '<em>XClass</em>'.
	 * <!-- begin-user-doc -->
	 * This implementation returns null;
	 * returning a non-null result will terminate the switch.
	 * <!-- end-user-doc -->
	 * @param object the target of the switch.
	 * @return the result of interpreting the object as an instance of '<em>XClass</em>'.
	 * @see #doSwitch(org.eclipse.emf.ecore.EObject) doSwitch(EObject)
	 * @generated
	 */
	public T caseXClass(XClass object) {
		return null;
	}

	/**
	 * Returns the result of interpreting the object as an instance of '<em>XConnector End</em>'.
	 * <!-- begin-user-doc -->
	 * This implementation returns null;
	 * returning a non-null result will terminate the switch.
	 * <!-- end-user-doc -->
	 * @param object the target of the switch.
	 * @return the result of interpreting the object as an instance of '<em>XConnector End</em>'.
	 * @see #doSwitch(org.eclipse.emf.ecore.EObject) doSwitch(EObject)
	 * @generated
	 */
	public T caseXConnectorEnd(XConnectorEnd object) {
		return null;
	}

	/**
	 * Returns the result of interpreting the object as an instance of '<em>EObject</em>'.
	 * <!-- begin-user-doc -->
	 * This implementation returns null;
	 * returning a non-null result will terminate the switch, but this is the last case anyway.
	 * <!-- end-user-doc -->
	 * @param object the target of the switch.
	 * @return the result of interpreting the object as an instance of '<em>EObject</em>'.
	 * @see #doSwitch(org.eclipse.emf.ecore.EObject)
	 * @generated
	 */
	@Override
	public T defaultCase(EObject object) {
		return null;
	}

} //ExecutableModelingProfileSwitch
