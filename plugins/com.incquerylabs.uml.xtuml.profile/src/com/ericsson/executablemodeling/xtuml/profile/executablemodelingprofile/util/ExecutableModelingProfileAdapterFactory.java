/**
 */
package com.ericsson.executablemodeling.xtuml.profile.executablemodelingprofile.util;

import com.ericsson.executablemodeling.xtuml.profile.executablemodelingprofile.*;

import org.eclipse.emf.common.notify.Adapter;
import org.eclipse.emf.common.notify.Notifier;

import org.eclipse.emf.common.notify.impl.AdapterFactoryImpl;

import org.eclipse.emf.ecore.EObject;

/**
 * <!-- begin-user-doc -->
 * The <b>Adapter Factory</b> for the model.
 * It provides an adapter <code>createXXX</code> method for each class of the model.
 * <!-- end-user-doc -->
 * @see com.ericsson.executablemodeling.xtuml.profile.executablemodelingprofile.ExecutableModelingProfilePackage
 * @generated
 */
public class ExecutableModelingProfileAdapterFactory extends AdapterFactoryImpl {
	/**
	 * The cached model package.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 */
	protected static ExecutableModelingProfilePackage modelPackage;

	/**
	 * Creates an instance of the adapter factory.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 */
	public ExecutableModelingProfileAdapterFactory() {
		if (modelPackage == null) {
			modelPackage = ExecutableModelingProfilePackage.eINSTANCE;
		}
	}

	/**
	 * Returns whether this factory is applicable for the type of the object.
	 * <!-- begin-user-doc -->
	 * This implementation returns <code>true</code> if the object is either the model's package or is an instance object of the model.
	 * <!-- end-user-doc -->
	 * @return whether this factory is applicable for the type of the object.
	 * @generated
	 */
	@Override
	public boolean isFactoryForType(Object object) {
		if (object == modelPackage) {
			return true;
		}
		if (object instanceof EObject) {
			return ((EObject)object).eClass().getEPackage() == modelPackage;
		}
		return false;
	}

	/**
	 * The switch that delegates to the <code>createXXX</code> methods.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 */
	protected ExecutableModelingProfileSwitch<Adapter> modelSwitch =
		new ExecutableModelingProfileSwitch<Adapter>() {
			@Override
			public Adapter caseXOperation(XOperation object) {
				return createXOperationAdapter();
			}
			@Override
			public Adapter caseXNamespace(XNamespace object) {
				return createXNamespaceAdapter();
			}
			@Override
			public Adapter caseXNamedElement(XNamedElement object) {
				return createXNamedElementAdapter();
			}
			@Override
			public Adapter caseXFeature(XFeature object) {
				return createXFeatureAdapter();
			}
			@Override
			public Adapter caseXAssociation(XAssociation object) {
				return createXAssociationAdapter();
			}
			@Override
			public Adapter caseXClassifier(XClassifier object) {
				return createXClassifierAdapter();
			}
			@Override
			public Adapter caseXBehavior(XBehavior object) {
				return createXBehaviorAdapter();
			}
			@Override
			public Adapter caseXEncapsulatedClassifier(XEncapsulatedClassifier object) {
				return createXEncapsulatedClassifierAdapter();
			}
			@Override
			public Adapter caseXProtocol(XProtocol object) {
				return createXProtocolAdapter();
			}
			@Override
			public Adapter caseXSignal(XSignal object) {
				return createXSignalAdapter();
			}
			@Override
			public Adapter caseXDataType(XDataType object) {
				return createXDataTypeAdapter();
			}
			@Override
			public Adapter caseXParameter(XParameter object) {
				return createXParameterAdapter();
			}
			@Override
			public Adapter caseXTypedElement(XTypedElement object) {
				return createXTypedElementAdapter();
			}
			@Override
			public Adapter caseXProperty(XProperty object) {
				return createXPropertyAdapter();
			}
			@Override
			public Adapter caseXMultiplicityElement(XMultiplicityElement object) {
				return createXMultiplicityElementAdapter();
			}
			@Override
			public Adapter caseXReception(XReception object) {
				return createXReceptionAdapter();
			}
			@Override
			public Adapter caseXPart(XPart object) {
				return createXPartAdapter();
			}
			@Override
			public Adapter caseXPort(XPort object) {
				return createXPortAdapter();
			}
			@Override
			public Adapter caseXConnector(XConnector object) {
				return createXConnectorAdapter();
			}
			@Override
			public Adapter caseXProtocolContainer(XProtocolContainer object) {
				return createXProtocolContainerAdapter();
			}
			@Override
			public Adapter caseXMessageSet(XMessageSet object) {
				return createXMessageSetAdapter();
			}
			@Override
			public Adapter caseXEnumeration(XEnumeration object) {
				return createXEnumerationAdapter();
			}
			@Override
			public Adapter caseXAssociationClass(XAssociationClass object) {
				return createXAssociationClassAdapter();
			}
			@Override
			public Adapter caseXTrigger(XTrigger object) {
				return createXTriggerAdapter();
			}
			@Override
			public Adapter caseXStateMachine(XStateMachine object) {
				return createXStateMachineAdapter();
			}
			@Override
			public Adapter caseXRegion(XRegion object) {
				return createXRegionAdapter();
			}
			@Override
			public Adapter caseXState(XState object) {
				return createXStateAdapter();
			}
			@Override
			public Adapter caseXVertex(XVertex object) {
				return createXVertexAdapter();
			}
			@Override
			public Adapter caseXPseudostate(XPseudostate object) {
				return createXPseudostateAdapter();
			}
			@Override
			public Adapter caseXTransition(XTransition object) {
				return createXTransitionAdapter();
			}
			@Override
			public Adapter caseXActivity(XActivity object) {
				return createXActivityAdapter();
			}
			@Override
			public Adapter caseXActionBehavior(XActionBehavior object) {
				return createXActionBehaviorAdapter();
			}
			@Override
			public Adapter caseXConstraint(XConstraint object) {
				return createXConstraintAdapter();
			}
			@Override
			public Adapter caseXOpaqueBehavior(XOpaqueBehavior object) {
				return createXOpaqueBehaviorAdapter();
			}
			@Override
			public Adapter caseXConstrainedType(XConstrainedType object) {
				return createXConstrainedTypeAdapter();
			}
			@Override
			public Adapter caseXGeneralization(XGeneralization object) {
				return createXGeneralizationAdapter();
			}
			@Override
			public Adapter caseXGeneralizationSet(XGeneralizationSet object) {
				return createXGeneralizationSetAdapter();
			}
			@Override
			public Adapter caseXClass(XClass object) {
				return createXClassAdapter();
			}
			@Override
			public Adapter caseXConnectorEnd(XConnectorEnd object) {
				return createXConnectorEndAdapter();
			}
			@Override
			public Adapter defaultCase(EObject object) {
				return createEObjectAdapter();
			}
		};

	/**
	 * Creates an adapter for the <code>target</code>.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @param target the object to adapt.
	 * @return the adapter for the <code>target</code>.
	 * @generated
	 */
	@Override
	public Adapter createAdapter(Notifier target) {
		return modelSwitch.doSwitch((EObject)target);
	}


	/**
	 * Creates a new adapter for an object of class '{@link com.ericsson.executablemodeling.xtuml.profile.executablemodelingprofile.XOperation <em>XOperation</em>}'.
	 * <!-- begin-user-doc -->
	 * This default implementation returns null so that we can easily ignore cases;
	 * it's useful to ignore a case when inheritance will catch all the cases anyway.
	 * <!-- end-user-doc -->
	 * @return the new adapter.
	 * @see com.ericsson.executablemodeling.xtuml.profile.executablemodelingprofile.XOperation
	 * @generated
	 */
	public Adapter createXOperationAdapter() {
		return null;
	}

	/**
	 * Creates a new adapter for an object of class '{@link com.ericsson.executablemodeling.xtuml.profile.executablemodelingprofile.XNamespace <em>XNamespace</em>}'.
	 * <!-- begin-user-doc -->
	 * This default implementation returns null so that we can easily ignore cases;
	 * it's useful to ignore a case when inheritance will catch all the cases anyway.
	 * <!-- end-user-doc -->
	 * @return the new adapter.
	 * @see com.ericsson.executablemodeling.xtuml.profile.executablemodelingprofile.XNamespace
	 * @generated
	 */
	public Adapter createXNamespaceAdapter() {
		return null;
	}

	/**
	 * Creates a new adapter for an object of class '{@link com.ericsson.executablemodeling.xtuml.profile.executablemodelingprofile.XNamedElement <em>XNamed Element</em>}'.
	 * <!-- begin-user-doc -->
	 * This default implementation returns null so that we can easily ignore cases;
	 * it's useful to ignore a case when inheritance will catch all the cases anyway.
	 * <!-- end-user-doc -->
	 * @return the new adapter.
	 * @see com.ericsson.executablemodeling.xtuml.profile.executablemodelingprofile.XNamedElement
	 * @generated
	 */
	public Adapter createXNamedElementAdapter() {
		return null;
	}

	/**
	 * Creates a new adapter for an object of class '{@link com.ericsson.executablemodeling.xtuml.profile.executablemodelingprofile.XFeature <em>XFeature</em>}'.
	 * <!-- begin-user-doc -->
	 * This default implementation returns null so that we can easily ignore cases;
	 * it's useful to ignore a case when inheritance will catch all the cases anyway.
	 * <!-- end-user-doc -->
	 * @return the new adapter.
	 * @see com.ericsson.executablemodeling.xtuml.profile.executablemodelingprofile.XFeature
	 * @generated
	 */
	public Adapter createXFeatureAdapter() {
		return null;
	}

	/**
	 * Creates a new adapter for an object of class '{@link com.ericsson.executablemodeling.xtuml.profile.executablemodelingprofile.XAssociation <em>XAssociation</em>}'.
	 * <!-- begin-user-doc -->
	 * This default implementation returns null so that we can easily ignore cases;
	 * it's useful to ignore a case when inheritance will catch all the cases anyway.
	 * <!-- end-user-doc -->
	 * @return the new adapter.
	 * @see com.ericsson.executablemodeling.xtuml.profile.executablemodelingprofile.XAssociation
	 * @generated
	 */
	public Adapter createXAssociationAdapter() {
		return null;
	}

	/**
	 * Creates a new adapter for an object of class '{@link com.ericsson.executablemodeling.xtuml.profile.executablemodelingprofile.XClassifier <em>XClassifier</em>}'.
	 * <!-- begin-user-doc -->
	 * This default implementation returns null so that we can easily ignore cases;
	 * it's useful to ignore a case when inheritance will catch all the cases anyway.
	 * <!-- end-user-doc -->
	 * @return the new adapter.
	 * @see com.ericsson.executablemodeling.xtuml.profile.executablemodelingprofile.XClassifier
	 * @generated
	 */
	public Adapter createXClassifierAdapter() {
		return null;
	}

	/**
	 * Creates a new adapter for an object of class '{@link com.ericsson.executablemodeling.xtuml.profile.executablemodelingprofile.XBehavior <em>XBehavior</em>}'.
	 * <!-- begin-user-doc -->
	 * This default implementation returns null so that we can easily ignore cases;
	 * it's useful to ignore a case when inheritance will catch all the cases anyway.
	 * <!-- end-user-doc -->
	 * @return the new adapter.
	 * @see com.ericsson.executablemodeling.xtuml.profile.executablemodelingprofile.XBehavior
	 * @generated
	 */
	public Adapter createXBehaviorAdapter() {
		return null;
	}

	/**
	 * Creates a new adapter for an object of class '{@link com.ericsson.executablemodeling.xtuml.profile.executablemodelingprofile.XEncapsulatedClassifier <em>XEncapsulated Classifier</em>}'.
	 * <!-- begin-user-doc -->
	 * This default implementation returns null so that we can easily ignore cases;
	 * it's useful to ignore a case when inheritance will catch all the cases anyway.
	 * <!-- end-user-doc -->
	 * @return the new adapter.
	 * @see com.ericsson.executablemodeling.xtuml.profile.executablemodelingprofile.XEncapsulatedClassifier
	 * @generated
	 */
	public Adapter createXEncapsulatedClassifierAdapter() {
		return null;
	}

	/**
	 * Creates a new adapter for an object of class '{@link com.ericsson.executablemodeling.xtuml.profile.executablemodelingprofile.XProtocol <em>XProtocol</em>}'.
	 * <!-- begin-user-doc -->
	 * This default implementation returns null so that we can easily ignore cases;
	 * it's useful to ignore a case when inheritance will catch all the cases anyway.
	 * <!-- end-user-doc -->
	 * @return the new adapter.
	 * @see com.ericsson.executablemodeling.xtuml.profile.executablemodelingprofile.XProtocol
	 * @generated
	 */
	public Adapter createXProtocolAdapter() {
		return null;
	}

	/**
	 * Creates a new adapter for an object of class '{@link com.ericsson.executablemodeling.xtuml.profile.executablemodelingprofile.XSignal <em>XSignal</em>}'.
	 * <!-- begin-user-doc -->
	 * This default implementation returns null so that we can easily ignore cases;
	 * it's useful to ignore a case when inheritance will catch all the cases anyway.
	 * <!-- end-user-doc -->
	 * @return the new adapter.
	 * @see com.ericsson.executablemodeling.xtuml.profile.executablemodelingprofile.XSignal
	 * @generated
	 */
	public Adapter createXSignalAdapter() {
		return null;
	}

	/**
	 * Creates a new adapter for an object of class '{@link com.ericsson.executablemodeling.xtuml.profile.executablemodelingprofile.XDataType <em>XData Type</em>}'.
	 * <!-- begin-user-doc -->
	 * This default implementation returns null so that we can easily ignore cases;
	 * it's useful to ignore a case when inheritance will catch all the cases anyway.
	 * <!-- end-user-doc -->
	 * @return the new adapter.
	 * @see com.ericsson.executablemodeling.xtuml.profile.executablemodelingprofile.XDataType
	 * @generated
	 */
	public Adapter createXDataTypeAdapter() {
		return null;
	}

	/**
	 * Creates a new adapter for an object of class '{@link com.ericsson.executablemodeling.xtuml.profile.executablemodelingprofile.XParameter <em>XParameter</em>}'.
	 * <!-- begin-user-doc -->
	 * This default implementation returns null so that we can easily ignore cases;
	 * it's useful to ignore a case when inheritance will catch all the cases anyway.
	 * <!-- end-user-doc -->
	 * @return the new adapter.
	 * @see com.ericsson.executablemodeling.xtuml.profile.executablemodelingprofile.XParameter
	 * @generated
	 */
	public Adapter createXParameterAdapter() {
		return null;
	}

	/**
	 * Creates a new adapter for an object of class '{@link com.ericsson.executablemodeling.xtuml.profile.executablemodelingprofile.XTypedElement <em>XTyped Element</em>}'.
	 * <!-- begin-user-doc -->
	 * This default implementation returns null so that we can easily ignore cases;
	 * it's useful to ignore a case when inheritance will catch all the cases anyway.
	 * <!-- end-user-doc -->
	 * @return the new adapter.
	 * @see com.ericsson.executablemodeling.xtuml.profile.executablemodelingprofile.XTypedElement
	 * @generated
	 */
	public Adapter createXTypedElementAdapter() {
		return null;
	}

	/**
	 * Creates a new adapter for an object of class '{@link com.ericsson.executablemodeling.xtuml.profile.executablemodelingprofile.XProperty <em>XProperty</em>}'.
	 * <!-- begin-user-doc -->
	 * This default implementation returns null so that we can easily ignore cases;
	 * it's useful to ignore a case when inheritance will catch all the cases anyway.
	 * <!-- end-user-doc -->
	 * @return the new adapter.
	 * @see com.ericsson.executablemodeling.xtuml.profile.executablemodelingprofile.XProperty
	 * @generated
	 */
	public Adapter createXPropertyAdapter() {
		return null;
	}

	/**
	 * Creates a new adapter for an object of class '{@link com.ericsson.executablemodeling.xtuml.profile.executablemodelingprofile.XMultiplicityElement <em>XMultiplicity Element</em>}'.
	 * <!-- begin-user-doc -->
	 * This default implementation returns null so that we can easily ignore cases;
	 * it's useful to ignore a case when inheritance will catch all the cases anyway.
	 * <!-- end-user-doc -->
	 * @return the new adapter.
	 * @see com.ericsson.executablemodeling.xtuml.profile.executablemodelingprofile.XMultiplicityElement
	 * @generated
	 */
	public Adapter createXMultiplicityElementAdapter() {
		return null;
	}

	/**
	 * Creates a new adapter for an object of class '{@link com.ericsson.executablemodeling.xtuml.profile.executablemodelingprofile.XReception <em>XReception</em>}'.
	 * <!-- begin-user-doc -->
	 * This default implementation returns null so that we can easily ignore cases;
	 * it's useful to ignore a case when inheritance will catch all the cases anyway.
	 * <!-- end-user-doc -->
	 * @return the new adapter.
	 * @see com.ericsson.executablemodeling.xtuml.profile.executablemodelingprofile.XReception
	 * @generated
	 */
	public Adapter createXReceptionAdapter() {
		return null;
	}

	/**
	 * Creates a new adapter for an object of class '{@link com.ericsson.executablemodeling.xtuml.profile.executablemodelingprofile.XPart <em>XPart</em>}'.
	 * <!-- begin-user-doc -->
	 * This default implementation returns null so that we can easily ignore cases;
	 * it's useful to ignore a case when inheritance will catch all the cases anyway.
	 * <!-- end-user-doc -->
	 * @return the new adapter.
	 * @see com.ericsson.executablemodeling.xtuml.profile.executablemodelingprofile.XPart
	 * @generated
	 */
	public Adapter createXPartAdapter() {
		return null;
	}

	/**
	 * Creates a new adapter for an object of class '{@link com.ericsson.executablemodeling.xtuml.profile.executablemodelingprofile.XPort <em>XPort</em>}'.
	 * <!-- begin-user-doc -->
	 * This default implementation returns null so that we can easily ignore cases;
	 * it's useful to ignore a case when inheritance will catch all the cases anyway.
	 * <!-- end-user-doc -->
	 * @return the new adapter.
	 * @see com.ericsson.executablemodeling.xtuml.profile.executablemodelingprofile.XPort
	 * @generated
	 */
	public Adapter createXPortAdapter() {
		return null;
	}

	/**
	 * Creates a new adapter for an object of class '{@link com.ericsson.executablemodeling.xtuml.profile.executablemodelingprofile.XConnector <em>XConnector</em>}'.
	 * <!-- begin-user-doc -->
	 * This default implementation returns null so that we can easily ignore cases;
	 * it's useful to ignore a case when inheritance will catch all the cases anyway.
	 * <!-- end-user-doc -->
	 * @return the new adapter.
	 * @see com.ericsson.executablemodeling.xtuml.profile.executablemodelingprofile.XConnector
	 * @generated
	 */
	public Adapter createXConnectorAdapter() {
		return null;
	}

	/**
	 * Creates a new adapter for an object of class '{@link com.ericsson.executablemodeling.xtuml.profile.executablemodelingprofile.XProtocolContainer <em>XProtocol Container</em>}'.
	 * <!-- begin-user-doc -->
	 * This default implementation returns null so that we can easily ignore cases;
	 * it's useful to ignore a case when inheritance will catch all the cases anyway.
	 * <!-- end-user-doc -->
	 * @return the new adapter.
	 * @see com.ericsson.executablemodeling.xtuml.profile.executablemodelingprofile.XProtocolContainer
	 * @generated
	 */
	public Adapter createXProtocolContainerAdapter() {
		return null;
	}

	/**
	 * Creates a new adapter for an object of class '{@link com.ericsson.executablemodeling.xtuml.profile.executablemodelingprofile.XMessageSet <em>XMessage Set</em>}'.
	 * <!-- begin-user-doc -->
	 * This default implementation returns null so that we can easily ignore cases;
	 * it's useful to ignore a case when inheritance will catch all the cases anyway.
	 * <!-- end-user-doc -->
	 * @return the new adapter.
	 * @see com.ericsson.executablemodeling.xtuml.profile.executablemodelingprofile.XMessageSet
	 * @generated
	 */
	public Adapter createXMessageSetAdapter() {
		return null;
	}

	/**
	 * Creates a new adapter for an object of class '{@link com.ericsson.executablemodeling.xtuml.profile.executablemodelingprofile.XEnumeration <em>XEnumeration</em>}'.
	 * <!-- begin-user-doc -->
	 * This default implementation returns null so that we can easily ignore cases;
	 * it's useful to ignore a case when inheritance will catch all the cases anyway.
	 * <!-- end-user-doc -->
	 * @return the new adapter.
	 * @see com.ericsson.executablemodeling.xtuml.profile.executablemodelingprofile.XEnumeration
	 * @generated
	 */
	public Adapter createXEnumerationAdapter() {
		return null;
	}

	/**
	 * Creates a new adapter for an object of class '{@link com.ericsson.executablemodeling.xtuml.profile.executablemodelingprofile.XAssociationClass <em>XAssociation Class</em>}'.
	 * <!-- begin-user-doc -->
	 * This default implementation returns null so that we can easily ignore cases;
	 * it's useful to ignore a case when inheritance will catch all the cases anyway.
	 * <!-- end-user-doc -->
	 * @return the new adapter.
	 * @see com.ericsson.executablemodeling.xtuml.profile.executablemodelingprofile.XAssociationClass
	 * @generated
	 */
	public Adapter createXAssociationClassAdapter() {
		return null;
	}

	/**
	 * Creates a new adapter for an object of class '{@link com.ericsson.executablemodeling.xtuml.profile.executablemodelingprofile.XTrigger <em>XTrigger</em>}'.
	 * <!-- begin-user-doc -->
	 * This default implementation returns null so that we can easily ignore cases;
	 * it's useful to ignore a case when inheritance will catch all the cases anyway.
	 * <!-- end-user-doc -->
	 * @return the new adapter.
	 * @see com.ericsson.executablemodeling.xtuml.profile.executablemodelingprofile.XTrigger
	 * @generated
	 */
	public Adapter createXTriggerAdapter() {
		return null;
	}

	/**
	 * Creates a new adapter for an object of class '{@link com.ericsson.executablemodeling.xtuml.profile.executablemodelingprofile.XStateMachine <em>XState Machine</em>}'.
	 * <!-- begin-user-doc -->
	 * This default implementation returns null so that we can easily ignore cases;
	 * it's useful to ignore a case when inheritance will catch all the cases anyway.
	 * <!-- end-user-doc -->
	 * @return the new adapter.
	 * @see com.ericsson.executablemodeling.xtuml.profile.executablemodelingprofile.XStateMachine
	 * @generated
	 */
	public Adapter createXStateMachineAdapter() {
		return null;
	}

	/**
	 * Creates a new adapter for an object of class '{@link com.ericsson.executablemodeling.xtuml.profile.executablemodelingprofile.XRegion <em>XRegion</em>}'.
	 * <!-- begin-user-doc -->
	 * This default implementation returns null so that we can easily ignore cases;
	 * it's useful to ignore a case when inheritance will catch all the cases anyway.
	 * <!-- end-user-doc -->
	 * @return the new adapter.
	 * @see com.ericsson.executablemodeling.xtuml.profile.executablemodelingprofile.XRegion
	 * @generated
	 */
	public Adapter createXRegionAdapter() {
		return null;
	}

	/**
	 * Creates a new adapter for an object of class '{@link com.ericsson.executablemodeling.xtuml.profile.executablemodelingprofile.XState <em>XState</em>}'.
	 * <!-- begin-user-doc -->
	 * This default implementation returns null so that we can easily ignore cases;
	 * it's useful to ignore a case when inheritance will catch all the cases anyway.
	 * <!-- end-user-doc -->
	 * @return the new adapter.
	 * @see com.ericsson.executablemodeling.xtuml.profile.executablemodelingprofile.XState
	 * @generated
	 */
	public Adapter createXStateAdapter() {
		return null;
	}

	/**
	 * Creates a new adapter for an object of class '{@link com.ericsson.executablemodeling.xtuml.profile.executablemodelingprofile.XVertex <em>XVertex</em>}'.
	 * <!-- begin-user-doc -->
	 * This default implementation returns null so that we can easily ignore cases;
	 * it's useful to ignore a case when inheritance will catch all the cases anyway.
	 * <!-- end-user-doc -->
	 * @return the new adapter.
	 * @see com.ericsson.executablemodeling.xtuml.profile.executablemodelingprofile.XVertex
	 * @generated
	 */
	public Adapter createXVertexAdapter() {
		return null;
	}

	/**
	 * Creates a new adapter for an object of class '{@link com.ericsson.executablemodeling.xtuml.profile.executablemodelingprofile.XPseudostate <em>XPseudostate</em>}'.
	 * <!-- begin-user-doc -->
	 * This default implementation returns null so that we can easily ignore cases;
	 * it's useful to ignore a case when inheritance will catch all the cases anyway.
	 * <!-- end-user-doc -->
	 * @return the new adapter.
	 * @see com.ericsson.executablemodeling.xtuml.profile.executablemodelingprofile.XPseudostate
	 * @generated
	 */
	public Adapter createXPseudostateAdapter() {
		return null;
	}

	/**
	 * Creates a new adapter for an object of class '{@link com.ericsson.executablemodeling.xtuml.profile.executablemodelingprofile.XTransition <em>XTransition</em>}'.
	 * <!-- begin-user-doc -->
	 * This default implementation returns null so that we can easily ignore cases;
	 * it's useful to ignore a case when inheritance will catch all the cases anyway.
	 * <!-- end-user-doc -->
	 * @return the new adapter.
	 * @see com.ericsson.executablemodeling.xtuml.profile.executablemodelingprofile.XTransition
	 * @generated
	 */
	public Adapter createXTransitionAdapter() {
		return null;
	}

	/**
	 * Creates a new adapter for an object of class '{@link com.ericsson.executablemodeling.xtuml.profile.executablemodelingprofile.XActivity <em>XActivity</em>}'.
	 * <!-- begin-user-doc -->
	 * This default implementation returns null so that we can easily ignore cases;
	 * it's useful to ignore a case when inheritance will catch all the cases anyway.
	 * <!-- end-user-doc -->
	 * @return the new adapter.
	 * @see com.ericsson.executablemodeling.xtuml.profile.executablemodelingprofile.XActivity
	 * @generated
	 */
	public Adapter createXActivityAdapter() {
		return null;
	}

	/**
	 * Creates a new adapter for an object of class '{@link com.ericsson.executablemodeling.xtuml.profile.executablemodelingprofile.XActionBehavior <em>XAction Behavior</em>}'.
	 * <!-- begin-user-doc -->
	 * This default implementation returns null so that we can easily ignore cases;
	 * it's useful to ignore a case when inheritance will catch all the cases anyway.
	 * <!-- end-user-doc -->
	 * @return the new adapter.
	 * @see com.ericsson.executablemodeling.xtuml.profile.executablemodelingprofile.XActionBehavior
	 * @generated
	 */
	public Adapter createXActionBehaviorAdapter() {
		return null;
	}

	/**
	 * Creates a new adapter for an object of class '{@link com.ericsson.executablemodeling.xtuml.profile.executablemodelingprofile.XConstraint <em>XConstraint</em>}'.
	 * <!-- begin-user-doc -->
	 * This default implementation returns null so that we can easily ignore cases;
	 * it's useful to ignore a case when inheritance will catch all the cases anyway.
	 * <!-- end-user-doc -->
	 * @return the new adapter.
	 * @see com.ericsson.executablemodeling.xtuml.profile.executablemodelingprofile.XConstraint
	 * @generated
	 */
	public Adapter createXConstraintAdapter() {
		return null;
	}

	/**
	 * Creates a new adapter for an object of class '{@link com.ericsson.executablemodeling.xtuml.profile.executablemodelingprofile.XOpaqueBehavior <em>XOpaque Behavior</em>}'.
	 * <!-- begin-user-doc -->
	 * This default implementation returns null so that we can easily ignore cases;
	 * it's useful to ignore a case when inheritance will catch all the cases anyway.
	 * <!-- end-user-doc -->
	 * @return the new adapter.
	 * @see com.ericsson.executablemodeling.xtuml.profile.executablemodelingprofile.XOpaqueBehavior
	 * @generated
	 */
	public Adapter createXOpaqueBehaviorAdapter() {
		return null;
	}

	/**
	 * Creates a new adapter for an object of class '{@link com.ericsson.executablemodeling.xtuml.profile.executablemodelingprofile.XConstrainedType <em>XConstrained Type</em>}'.
	 * <!-- begin-user-doc -->
	 * This default implementation returns null so that we can easily ignore cases;
	 * it's useful to ignore a case when inheritance will catch all the cases anyway.
	 * <!-- end-user-doc -->
	 * @return the new adapter.
	 * @see com.ericsson.executablemodeling.xtuml.profile.executablemodelingprofile.XConstrainedType
	 * @generated
	 */
	public Adapter createXConstrainedTypeAdapter() {
		return null;
	}

	/**
	 * Creates a new adapter for an object of class '{@link com.ericsson.executablemodeling.xtuml.profile.executablemodelingprofile.XGeneralization <em>XGeneralization</em>}'.
	 * <!-- begin-user-doc -->
	 * This default implementation returns null so that we can easily ignore cases;
	 * it's useful to ignore a case when inheritance will catch all the cases anyway.
	 * <!-- end-user-doc -->
	 * @return the new adapter.
	 * @see com.ericsson.executablemodeling.xtuml.profile.executablemodelingprofile.XGeneralization
	 * @generated
	 */
	public Adapter createXGeneralizationAdapter() {
		return null;
	}

	/**
	 * Creates a new adapter for an object of class '{@link com.ericsson.executablemodeling.xtuml.profile.executablemodelingprofile.XGeneralizationSet <em>XGeneralization Set</em>}'.
	 * <!-- begin-user-doc -->
	 * This default implementation returns null so that we can easily ignore cases;
	 * it's useful to ignore a case when inheritance will catch all the cases anyway.
	 * <!-- end-user-doc -->
	 * @return the new adapter.
	 * @see com.ericsson.executablemodeling.xtuml.profile.executablemodelingprofile.XGeneralizationSet
	 * @generated
	 */
	public Adapter createXGeneralizationSetAdapter() {
		return null;
	}

	/**
	 * Creates a new adapter for an object of class '{@link com.ericsson.executablemodeling.xtuml.profile.executablemodelingprofile.XClass <em>XClass</em>}'.
	 * <!-- begin-user-doc -->
	 * This default implementation returns null so that we can easily ignore cases;
	 * it's useful to ignore a case when inheritance will catch all the cases anyway.
	 * <!-- end-user-doc -->
	 * @return the new adapter.
	 * @see com.ericsson.executablemodeling.xtuml.profile.executablemodelingprofile.XClass
	 * @generated
	 */
	public Adapter createXClassAdapter() {
		return null;
	}

	/**
	 * Creates a new adapter for an object of class '{@link com.ericsson.executablemodeling.xtuml.profile.executablemodelingprofile.XConnectorEnd <em>XConnector End</em>}'.
	 * <!-- begin-user-doc -->
	 * This default implementation returns null so that we can easily ignore cases;
	 * it's useful to ignore a case when inheritance will catch all the cases anyway.
	 * <!-- end-user-doc -->
	 * @return the new adapter.
	 * @see com.ericsson.executablemodeling.xtuml.profile.executablemodelingprofile.XConnectorEnd
	 * @generated
	 */
	public Adapter createXConnectorEndAdapter() {
		return null;
	}

	/**
	 * Creates a new adapter for the default case.
	 * <!-- begin-user-doc -->
	 * This default implementation returns null.
	 * <!-- end-user-doc -->
	 * @return the new adapter.
	 * @generated
	 */
	public Adapter createEObjectAdapter() {
		return null;
	}

} //ExecutableModelingProfileAdapterFactory
