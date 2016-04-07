/*******************************************************************************
 * Copyright (c) 2015-2016 IncQuery Labs Ltd. and Ericsson AB
 * All rights reserved. This program and the accompanying materials
 * are made available under the terms of the Eclipse Public License v1.0
 * which accompanies this distribution, and is available at
 * http://www.eclipse.org/legal/epl-v10.html
 *
 * Contributors:
 *     Akos Horvath, Abel Hegedus, Zoltan Ujhelyi, Adam Balogh - initial API and implementation
 *******************************************************************************/
/**
 */
package com.ericsson.executablemodeling.xtuml.profile.xtumlprofile.util;

import com.ericsson.executablemodeling.xtuml.profile.executablemodelingprofile.XActionBehavior;
import com.ericsson.executablemodeling.xtuml.profile.executablemodelingprofile.XActivity;
import com.ericsson.executablemodeling.xtuml.profile.executablemodelingprofile.XAssociation;
import com.ericsson.executablemodeling.xtuml.profile.executablemodelingprofile.XAssociationClass;
import com.ericsson.executablemodeling.xtuml.profile.executablemodelingprofile.XBehavior;
import com.ericsson.executablemodeling.xtuml.profile.executablemodelingprofile.XClass;
import com.ericsson.executablemodeling.xtuml.profile.executablemodelingprofile.XClassifier;
import com.ericsson.executablemodeling.xtuml.profile.executablemodelingprofile.XConnector;
import com.ericsson.executablemodeling.xtuml.profile.executablemodelingprofile.XConnectorEnd;
import com.ericsson.executablemodeling.xtuml.profile.executablemodelingprofile.XConstrainedType;
import com.ericsson.executablemodeling.xtuml.profile.executablemodelingprofile.XConstraint;
import com.ericsson.executablemodeling.xtuml.profile.executablemodelingprofile.XDataType;
import com.ericsson.executablemodeling.xtuml.profile.executablemodelingprofile.XEncapsulatedClassifier;
import com.ericsson.executablemodeling.xtuml.profile.executablemodelingprofile.XEnumeration;
import com.ericsson.executablemodeling.xtuml.profile.executablemodelingprofile.XFeature;
import com.ericsson.executablemodeling.xtuml.profile.executablemodelingprofile.XGeneralization;
import com.ericsson.executablemodeling.xtuml.profile.executablemodelingprofile.XGeneralizationSet;
import com.ericsson.executablemodeling.xtuml.profile.executablemodelingprofile.XMessageSet;
import com.ericsson.executablemodeling.xtuml.profile.executablemodelingprofile.XMultiplicityElement;
import com.ericsson.executablemodeling.xtuml.profile.executablemodelingprofile.XNamedElement;
import com.ericsson.executablemodeling.xtuml.profile.executablemodelingprofile.XNamespace;
import com.ericsson.executablemodeling.xtuml.profile.executablemodelingprofile.XOpaqueBehavior;
import com.ericsson.executablemodeling.xtuml.profile.executablemodelingprofile.XOperation;
import com.ericsson.executablemodeling.xtuml.profile.executablemodelingprofile.XParameter;
import com.ericsson.executablemodeling.xtuml.profile.executablemodelingprofile.XPart;
import com.ericsson.executablemodeling.xtuml.profile.executablemodelingprofile.XPort;
import com.ericsson.executablemodeling.xtuml.profile.executablemodelingprofile.XProperty;
import com.ericsson.executablemodeling.xtuml.profile.executablemodelingprofile.XProtocol;
import com.ericsson.executablemodeling.xtuml.profile.executablemodelingprofile.XProtocolContainer;
import com.ericsson.executablemodeling.xtuml.profile.executablemodelingprofile.XPseudostate;
import com.ericsson.executablemodeling.xtuml.profile.executablemodelingprofile.XReception;
import com.ericsson.executablemodeling.xtuml.profile.executablemodelingprofile.XRegion;
import com.ericsson.executablemodeling.xtuml.profile.executablemodelingprofile.XSignal;
import com.ericsson.executablemodeling.xtuml.profile.executablemodelingprofile.XState;
import com.ericsson.executablemodeling.xtuml.profile.executablemodelingprofile.XStateMachine;
import com.ericsson.executablemodeling.xtuml.profile.executablemodelingprofile.XTransition;
import com.ericsson.executablemodeling.xtuml.profile.executablemodelingprofile.XTrigger;
import com.ericsson.executablemodeling.xtuml.profile.executablemodelingprofile.XTypedElement;
import com.ericsson.executablemodeling.xtuml.profile.executablemodelingprofile.XVertex;

import com.ericsson.executablemodeling.xtuml.profile.xtumlprofile.*;

import org.eclipse.emf.common.notify.Adapter;
import org.eclipse.emf.common.notify.Notifier;

import org.eclipse.emf.common.notify.impl.AdapterFactoryImpl;

import org.eclipse.emf.ecore.EObject;

/**
 * <!-- begin-user-doc -->
 * The <b>Adapter Factory</b> for the model.
 * It provides an adapter <code>createXXX</code> method for each class of the model.
 * <!-- end-user-doc -->
 * @see com.ericsson.executablemodeling.xtuml.profile.xtumlprofile.xtUMLProfilePackage
 * @generated
 */
public class xtUMLProfileAdapterFactory extends AdapterFactoryImpl {
	/**
	 * The cached model package.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 */
	protected static xtUMLProfilePackage modelPackage;

	/**
	 * Creates an instance of the adapter factory.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 */
	public xtUMLProfileAdapterFactory() {
		if (modelPackage == null) {
			modelPackage = xtUMLProfilePackage.eINSTANCE;
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
	protected xtUMLProfileSwitch<Adapter> modelSwitch =
		new xtUMLProfileSwitch<Adapter>() {
			@Override
			public Adapter caseXtConnectorEnd(XtConnectorEnd object) {
				return createXtConnectorEndAdapter();
			}
			@Override
			public Adapter caseXtProperty(XtProperty object) {
				return createXtPropertyAdapter();
			}
			@Override
			public Adapter caseXtComponent(XtComponent object) {
				return createXtComponentAdapter();
			}
			@Override
			public Adapter caseXtOperation(XtOperation object) {
				return createXtOperationAdapter();
			}
			@Override
			public Adapter caseXtParameter(XtParameter object) {
				return createXtParameterAdapter();
			}
			@Override
			public Adapter caseXtReception(XtReception object) {
				return createXtReceptionAdapter();
			}
			@Override
			public Adapter caseXtPart(XtPart object) {
				return createXtPartAdapter();
			}
			@Override
			public Adapter caseXtPort(XtPort object) {
				return createXtPortAdapter();
			}
			@Override
			public Adapter caseXtConnector(XtConnector object) {
				return createXtConnectorAdapter();
			}
			@Override
			public Adapter caseXtProtocolContainer(XtProtocolContainer object) {
				return createXtProtocolContainerAdapter();
			}
			@Override
			public Adapter caseXtProtocol(XtProtocol object) {
				return createXtProtocolAdapter();
			}
			@Override
			public Adapter caseXtMessageSet(XtMessageSet object) {
				return createXtMessageSetAdapter();
			}
			@Override
			public Adapter caseXtSignal(XtSignal object) {
				return createXtSignalAdapter();
			}
			@Override
			public Adapter caseXtDataType(XtDataType object) {
				return createXtDataTypeAdapter();
			}
			@Override
			public Adapter caseXtEnumeration(XtEnumeration object) {
				return createXtEnumerationAdapter();
			}
			@Override
			public Adapter caseXtAssociation(XtAssociation object) {
				return createXtAssociationAdapter();
			}
			@Override
			public Adapter caseXtAssociationClass(XtAssociationClass object) {
				return createXtAssociationClassAdapter();
			}
			@Override
			public Adapter caseXtTrigger(XtTrigger object) {
				return createXtTriggerAdapter();
			}
			@Override
			public Adapter caseXtStateMachine(XtStateMachine object) {
				return createXtStateMachineAdapter();
			}
			@Override
			public Adapter caseXtRegion(XtRegion object) {
				return createXtRegionAdapter();
			}
			@Override
			public Adapter caseXtPseudoState(XtPseudoState object) {
				return createXtPseudoStateAdapter();
			}
			@Override
			public Adapter caseXtTransition(XtTransition object) {
				return createXtTransitionAdapter();
			}
			@Override
			public Adapter caseXtState(XtState object) {
				return createXtStateAdapter();
			}
			@Override
			public Adapter caseXtActivity(XtActivity object) {
				return createXtActivityAdapter();
			}
			@Override
			public Adapter caseXtConstraint(XtConstraint object) {
				return createXtConstraintAdapter();
			}
			@Override
			public Adapter caseXtClass(XtClass object) {
				return createXtClassAdapter();
			}
			@Override
			public Adapter caseXtConstrainedType(XtConstrainedType object) {
				return createXtConstrainedTypeAdapter();
			}
			@Override
			public Adapter caseXtOpaqueBehavior(XtOpaqueBehavior object) {
				return createXtOpaqueBehaviorAdapter();
			}
			@Override
			public Adapter caseXtGeneralization(XtGeneralization object) {
				return createXtGeneralizationAdapter();
			}
			@Override
			public Adapter caseXtGeneralizationSet(XtGeneralizationSet object) {
				return createXtGeneralizationSetAdapter();
			}
			@Override
			public Adapter caseXConnectorEnd(XConnectorEnd object) {
				return createXConnectorEndAdapter();
			}
			@Override
			public Adapter caseXMultiplicityElement(XMultiplicityElement object) {
				return createXMultiplicityElementAdapter();
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
			public Adapter caseXTypedElement(XTypedElement object) {
				return createXTypedElementAdapter();
			}
			@Override
			public Adapter caseXProperty(XProperty object) {
				return createXPropertyAdapter();
			}
			@Override
			public Adapter caseXNamespace(XNamespace object) {
				return createXNamespaceAdapter();
			}
			@Override
			public Adapter caseXClassifier(XClassifier object) {
				return createXClassifierAdapter();
			}
			@Override
			public Adapter caseXEncapsulatedClassifier(XEncapsulatedClassifier object) {
				return createXEncapsulatedClassifierAdapter();
			}
			@Override
			public Adapter caseXOperation(XOperation object) {
				return createXOperationAdapter();
			}
			@Override
			public Adapter caseXParameter(XParameter object) {
				return createXParameterAdapter();
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
			public Adapter caseXProtocol(XProtocol object) {
				return createXProtocolAdapter();
			}
			@Override
			public Adapter caseXMessageSet(XMessageSet object) {
				return createXMessageSetAdapter();
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
			public Adapter caseXEnumeration(XEnumeration object) {
				return createXEnumerationAdapter();
			}
			@Override
			public Adapter caseXAssociation(XAssociation object) {
				return createXAssociationAdapter();
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
			public Adapter caseXBehavior(XBehavior object) {
				return createXBehaviorAdapter();
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
			public Adapter caseXState(XState object) {
				return createXStateAdapter();
			}
			@Override
			public Adapter caseXActionBehavior(XActionBehavior object) {
				return createXActionBehaviorAdapter();
			}
			@Override
			public Adapter caseXActivity(XActivity object) {
				return createXActivityAdapter();
			}
			@Override
			public Adapter caseXConstraint(XConstraint object) {
				return createXConstraintAdapter();
			}
			@Override
			public Adapter caseXClass(XClass object) {
				return createXClassAdapter();
			}
			@Override
			public Adapter caseXConstrainedType(XConstrainedType object) {
				return createXConstrainedTypeAdapter();
			}
			@Override
			public Adapter caseXOpaqueBehavior(XOpaqueBehavior object) {
				return createXOpaqueBehaviorAdapter();
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
	 * Creates a new adapter for an object of class '{@link com.ericsson.executablemodeling.xtuml.profile.xtumlprofile.XtConnectorEnd <em>Xt Connector End</em>}'.
	 * <!-- begin-user-doc -->
	 * This default implementation returns null so that we can easily ignore cases;
	 * it's useful to ignore a case when inheritance will catch all the cases anyway.
	 * <!-- end-user-doc -->
	 * @return the new adapter.
	 * @see com.ericsson.executablemodeling.xtuml.profile.xtumlprofile.XtConnectorEnd
	 * @generated
	 */
	public Adapter createXtConnectorEndAdapter() {
		return null;
	}

	/**
	 * Creates a new adapter for an object of class '{@link com.ericsson.executablemodeling.xtuml.profile.xtumlprofile.XtProperty <em>Xt Property</em>}'.
	 * <!-- begin-user-doc -->
	 * This default implementation returns null so that we can easily ignore cases;
	 * it's useful to ignore a case when inheritance will catch all the cases anyway.
	 * <!-- end-user-doc -->
	 * @return the new adapter.
	 * @see com.ericsson.executablemodeling.xtuml.profile.xtumlprofile.XtProperty
	 * @generated
	 */
	public Adapter createXtPropertyAdapter() {
		return null;
	}

	/**
	 * Creates a new adapter for an object of class '{@link com.ericsson.executablemodeling.xtuml.profile.xtumlprofile.XtComponent <em>Xt Component</em>}'.
	 * <!-- begin-user-doc -->
	 * This default implementation returns null so that we can easily ignore cases;
	 * it's useful to ignore a case when inheritance will catch all the cases anyway.
	 * <!-- end-user-doc -->
	 * @return the new adapter.
	 * @see com.ericsson.executablemodeling.xtuml.profile.xtumlprofile.XtComponent
	 * @generated
	 */
	public Adapter createXtComponentAdapter() {
		return null;
	}

	/**
	 * Creates a new adapter for an object of class '{@link com.ericsson.executablemodeling.xtuml.profile.xtumlprofile.XtOperation <em>Xt Operation</em>}'.
	 * <!-- begin-user-doc -->
	 * This default implementation returns null so that we can easily ignore cases;
	 * it's useful to ignore a case when inheritance will catch all the cases anyway.
	 * <!-- end-user-doc -->
	 * @return the new adapter.
	 * @see com.ericsson.executablemodeling.xtuml.profile.xtumlprofile.XtOperation
	 * @generated
	 */
	public Adapter createXtOperationAdapter() {
		return null;
	}

	/**
	 * Creates a new adapter for an object of class '{@link com.ericsson.executablemodeling.xtuml.profile.xtumlprofile.XtParameter <em>Xt Parameter</em>}'.
	 * <!-- begin-user-doc -->
	 * This default implementation returns null so that we can easily ignore cases;
	 * it's useful to ignore a case when inheritance will catch all the cases anyway.
	 * <!-- end-user-doc -->
	 * @return the new adapter.
	 * @see com.ericsson.executablemodeling.xtuml.profile.xtumlprofile.XtParameter
	 * @generated
	 */
	public Adapter createXtParameterAdapter() {
		return null;
	}

	/**
	 * Creates a new adapter for an object of class '{@link com.ericsson.executablemodeling.xtuml.profile.xtumlprofile.XtReception <em>Xt Reception</em>}'.
	 * <!-- begin-user-doc -->
	 * This default implementation returns null so that we can easily ignore cases;
	 * it's useful to ignore a case when inheritance will catch all the cases anyway.
	 * <!-- end-user-doc -->
	 * @return the new adapter.
	 * @see com.ericsson.executablemodeling.xtuml.profile.xtumlprofile.XtReception
	 * @generated
	 */
	public Adapter createXtReceptionAdapter() {
		return null;
	}

	/**
	 * Creates a new adapter for an object of class '{@link com.ericsson.executablemodeling.xtuml.profile.xtumlprofile.XtPart <em>Xt Part</em>}'.
	 * <!-- begin-user-doc -->
	 * This default implementation returns null so that we can easily ignore cases;
	 * it's useful to ignore a case when inheritance will catch all the cases anyway.
	 * <!-- end-user-doc -->
	 * @return the new adapter.
	 * @see com.ericsson.executablemodeling.xtuml.profile.xtumlprofile.XtPart
	 * @generated
	 */
	public Adapter createXtPartAdapter() {
		return null;
	}

	/**
	 * Creates a new adapter for an object of class '{@link com.ericsson.executablemodeling.xtuml.profile.xtumlprofile.XtPort <em>Xt Port</em>}'.
	 * <!-- begin-user-doc -->
	 * This default implementation returns null so that we can easily ignore cases;
	 * it's useful to ignore a case when inheritance will catch all the cases anyway.
	 * <!-- end-user-doc -->
	 * @return the new adapter.
	 * @see com.ericsson.executablemodeling.xtuml.profile.xtumlprofile.XtPort
	 * @generated
	 */
	public Adapter createXtPortAdapter() {
		return null;
	}

	/**
	 * Creates a new adapter for an object of class '{@link com.ericsson.executablemodeling.xtuml.profile.xtumlprofile.XtConnector <em>Xt Connector</em>}'.
	 * <!-- begin-user-doc -->
	 * This default implementation returns null so that we can easily ignore cases;
	 * it's useful to ignore a case when inheritance will catch all the cases anyway.
	 * <!-- end-user-doc -->
	 * @return the new adapter.
	 * @see com.ericsson.executablemodeling.xtuml.profile.xtumlprofile.XtConnector
	 * @generated
	 */
	public Adapter createXtConnectorAdapter() {
		return null;
	}

	/**
	 * Creates a new adapter for an object of class '{@link com.ericsson.executablemodeling.xtuml.profile.xtumlprofile.XtProtocolContainer <em>Xt Protocol Container</em>}'.
	 * <!-- begin-user-doc -->
	 * This default implementation returns null so that we can easily ignore cases;
	 * it's useful to ignore a case when inheritance will catch all the cases anyway.
	 * <!-- end-user-doc -->
	 * @return the new adapter.
	 * @see com.ericsson.executablemodeling.xtuml.profile.xtumlprofile.XtProtocolContainer
	 * @generated
	 */
	public Adapter createXtProtocolContainerAdapter() {
		return null;
	}

	/**
	 * Creates a new adapter for an object of class '{@link com.ericsson.executablemodeling.xtuml.profile.xtumlprofile.XtProtocol <em>Xt Protocol</em>}'.
	 * <!-- begin-user-doc -->
	 * This default implementation returns null so that we can easily ignore cases;
	 * it's useful to ignore a case when inheritance will catch all the cases anyway.
	 * <!-- end-user-doc -->
	 * @return the new adapter.
	 * @see com.ericsson.executablemodeling.xtuml.profile.xtumlprofile.XtProtocol
	 * @generated
	 */
	public Adapter createXtProtocolAdapter() {
		return null;
	}

	/**
	 * Creates a new adapter for an object of class '{@link com.ericsson.executablemodeling.xtuml.profile.xtumlprofile.XtMessageSet <em>Xt Message Set</em>}'.
	 * <!-- begin-user-doc -->
	 * This default implementation returns null so that we can easily ignore cases;
	 * it's useful to ignore a case when inheritance will catch all the cases anyway.
	 * <!-- end-user-doc -->
	 * @return the new adapter.
	 * @see com.ericsson.executablemodeling.xtuml.profile.xtumlprofile.XtMessageSet
	 * @generated
	 */
	public Adapter createXtMessageSetAdapter() {
		return null;
	}

	/**
	 * Creates a new adapter for an object of class '{@link com.ericsson.executablemodeling.xtuml.profile.xtumlprofile.XtSignal <em>Xt Signal</em>}'.
	 * <!-- begin-user-doc -->
	 * This default implementation returns null so that we can easily ignore cases;
	 * it's useful to ignore a case when inheritance will catch all the cases anyway.
	 * <!-- end-user-doc -->
	 * @return the new adapter.
	 * @see com.ericsson.executablemodeling.xtuml.profile.xtumlprofile.XtSignal
	 * @generated
	 */
	public Adapter createXtSignalAdapter() {
		return null;
	}

	/**
	 * Creates a new adapter for an object of class '{@link com.ericsson.executablemodeling.xtuml.profile.xtumlprofile.XtDataType <em>Xt Data Type</em>}'.
	 * <!-- begin-user-doc -->
	 * This default implementation returns null so that we can easily ignore cases;
	 * it's useful to ignore a case when inheritance will catch all the cases anyway.
	 * <!-- end-user-doc -->
	 * @return the new adapter.
	 * @see com.ericsson.executablemodeling.xtuml.profile.xtumlprofile.XtDataType
	 * @generated
	 */
	public Adapter createXtDataTypeAdapter() {
		return null;
	}

	/**
	 * Creates a new adapter for an object of class '{@link com.ericsson.executablemodeling.xtuml.profile.xtumlprofile.XtEnumeration <em>Xt Enumeration</em>}'.
	 * <!-- begin-user-doc -->
	 * This default implementation returns null so that we can easily ignore cases;
	 * it's useful to ignore a case when inheritance will catch all the cases anyway.
	 * <!-- end-user-doc -->
	 * @return the new adapter.
	 * @see com.ericsson.executablemodeling.xtuml.profile.xtumlprofile.XtEnumeration
	 * @generated
	 */
	public Adapter createXtEnumerationAdapter() {
		return null;
	}

	/**
	 * Creates a new adapter for an object of class '{@link com.ericsson.executablemodeling.xtuml.profile.xtumlprofile.XtAssociation <em>Xt Association</em>}'.
	 * <!-- begin-user-doc -->
	 * This default implementation returns null so that we can easily ignore cases;
	 * it's useful to ignore a case when inheritance will catch all the cases anyway.
	 * <!-- end-user-doc -->
	 * @return the new adapter.
	 * @see com.ericsson.executablemodeling.xtuml.profile.xtumlprofile.XtAssociation
	 * @generated
	 */
	public Adapter createXtAssociationAdapter() {
		return null;
	}

	/**
	 * Creates a new adapter for an object of class '{@link com.ericsson.executablemodeling.xtuml.profile.xtumlprofile.XtAssociationClass <em>Xt Association Class</em>}'.
	 * <!-- begin-user-doc -->
	 * This default implementation returns null so that we can easily ignore cases;
	 * it's useful to ignore a case when inheritance will catch all the cases anyway.
	 * <!-- end-user-doc -->
	 * @return the new adapter.
	 * @see com.ericsson.executablemodeling.xtuml.profile.xtumlprofile.XtAssociationClass
	 * @generated
	 */
	public Adapter createXtAssociationClassAdapter() {
		return null;
	}

	/**
	 * Creates a new adapter for an object of class '{@link com.ericsson.executablemodeling.xtuml.profile.xtumlprofile.XtTrigger <em>Xt Trigger</em>}'.
	 * <!-- begin-user-doc -->
	 * This default implementation returns null so that we can easily ignore cases;
	 * it's useful to ignore a case when inheritance will catch all the cases anyway.
	 * <!-- end-user-doc -->
	 * @return the new adapter.
	 * @see com.ericsson.executablemodeling.xtuml.profile.xtumlprofile.XtTrigger
	 * @generated
	 */
	public Adapter createXtTriggerAdapter() {
		return null;
	}

	/**
	 * Creates a new adapter for an object of class '{@link com.ericsson.executablemodeling.xtuml.profile.xtumlprofile.XtStateMachine <em>Xt State Machine</em>}'.
	 * <!-- begin-user-doc -->
	 * This default implementation returns null so that we can easily ignore cases;
	 * it's useful to ignore a case when inheritance will catch all the cases anyway.
	 * <!-- end-user-doc -->
	 * @return the new adapter.
	 * @see com.ericsson.executablemodeling.xtuml.profile.xtumlprofile.XtStateMachine
	 * @generated
	 */
	public Adapter createXtStateMachineAdapter() {
		return null;
	}

	/**
	 * Creates a new adapter for an object of class '{@link com.ericsson.executablemodeling.xtuml.profile.xtumlprofile.XtRegion <em>Xt Region</em>}'.
	 * <!-- begin-user-doc -->
	 * This default implementation returns null so that we can easily ignore cases;
	 * it's useful to ignore a case when inheritance will catch all the cases anyway.
	 * <!-- end-user-doc -->
	 * @return the new adapter.
	 * @see com.ericsson.executablemodeling.xtuml.profile.xtumlprofile.XtRegion
	 * @generated
	 */
	public Adapter createXtRegionAdapter() {
		return null;
	}

	/**
	 * Creates a new adapter for an object of class '{@link com.ericsson.executablemodeling.xtuml.profile.xtumlprofile.XtPseudoState <em>Xt Pseudo State</em>}'.
	 * <!-- begin-user-doc -->
	 * This default implementation returns null so that we can easily ignore cases;
	 * it's useful to ignore a case when inheritance will catch all the cases anyway.
	 * <!-- end-user-doc -->
	 * @return the new adapter.
	 * @see com.ericsson.executablemodeling.xtuml.profile.xtumlprofile.XtPseudoState
	 * @generated
	 */
	public Adapter createXtPseudoStateAdapter() {
		return null;
	}

	/**
	 * Creates a new adapter for an object of class '{@link com.ericsson.executablemodeling.xtuml.profile.xtumlprofile.XtTransition <em>Xt Transition</em>}'.
	 * <!-- begin-user-doc -->
	 * This default implementation returns null so that we can easily ignore cases;
	 * it's useful to ignore a case when inheritance will catch all the cases anyway.
	 * <!-- end-user-doc -->
	 * @return the new adapter.
	 * @see com.ericsson.executablemodeling.xtuml.profile.xtumlprofile.XtTransition
	 * @generated
	 */
	public Adapter createXtTransitionAdapter() {
		return null;
	}

	/**
	 * Creates a new adapter for an object of class '{@link com.ericsson.executablemodeling.xtuml.profile.xtumlprofile.XtState <em>Xt State</em>}'.
	 * <!-- begin-user-doc -->
	 * This default implementation returns null so that we can easily ignore cases;
	 * it's useful to ignore a case when inheritance will catch all the cases anyway.
	 * <!-- end-user-doc -->
	 * @return the new adapter.
	 * @see com.ericsson.executablemodeling.xtuml.profile.xtumlprofile.XtState
	 * @generated
	 */
	public Adapter createXtStateAdapter() {
		return null;
	}

	/**
	 * Creates a new adapter for an object of class '{@link com.ericsson.executablemodeling.xtuml.profile.xtumlprofile.XtActivity <em>Xt Activity</em>}'.
	 * <!-- begin-user-doc -->
	 * This default implementation returns null so that we can easily ignore cases;
	 * it's useful to ignore a case when inheritance will catch all the cases anyway.
	 * <!-- end-user-doc -->
	 * @return the new adapter.
	 * @see com.ericsson.executablemodeling.xtuml.profile.xtumlprofile.XtActivity
	 * @generated
	 */
	public Adapter createXtActivityAdapter() {
		return null;
	}

	/**
	 * Creates a new adapter for an object of class '{@link com.ericsson.executablemodeling.xtuml.profile.xtumlprofile.XtConstraint <em>Xt Constraint</em>}'.
	 * <!-- begin-user-doc -->
	 * This default implementation returns null so that we can easily ignore cases;
	 * it's useful to ignore a case when inheritance will catch all the cases anyway.
	 * <!-- end-user-doc -->
	 * @return the new adapter.
	 * @see com.ericsson.executablemodeling.xtuml.profile.xtumlprofile.XtConstraint
	 * @generated
	 */
	public Adapter createXtConstraintAdapter() {
		return null;
	}

	/**
	 * Creates a new adapter for an object of class '{@link com.ericsson.executablemodeling.xtuml.profile.xtumlprofile.XtClass <em>Xt Class</em>}'.
	 * <!-- begin-user-doc -->
	 * This default implementation returns null so that we can easily ignore cases;
	 * it's useful to ignore a case when inheritance will catch all the cases anyway.
	 * <!-- end-user-doc -->
	 * @return the new adapter.
	 * @see com.ericsson.executablemodeling.xtuml.profile.xtumlprofile.XtClass
	 * @generated
	 */
	public Adapter createXtClassAdapter() {
		return null;
	}

	/**
	 * Creates a new adapter for an object of class '{@link com.ericsson.executablemodeling.xtuml.profile.xtumlprofile.XtConstrainedType <em>Xt Constrained Type</em>}'.
	 * <!-- begin-user-doc -->
	 * This default implementation returns null so that we can easily ignore cases;
	 * it's useful to ignore a case when inheritance will catch all the cases anyway.
	 * <!-- end-user-doc -->
	 * @return the new adapter.
	 * @see com.ericsson.executablemodeling.xtuml.profile.xtumlprofile.XtConstrainedType
	 * @generated
	 */
	public Adapter createXtConstrainedTypeAdapter() {
		return null;
	}

	/**
	 * Creates a new adapter for an object of class '{@link com.ericsson.executablemodeling.xtuml.profile.xtumlprofile.XtOpaqueBehavior <em>Xt Opaque Behavior</em>}'.
	 * <!-- begin-user-doc -->
	 * This default implementation returns null so that we can easily ignore cases;
	 * it's useful to ignore a case when inheritance will catch all the cases anyway.
	 * <!-- end-user-doc -->
	 * @return the new adapter.
	 * @see com.ericsson.executablemodeling.xtuml.profile.xtumlprofile.XtOpaqueBehavior
	 * @generated
	 */
	public Adapter createXtOpaqueBehaviorAdapter() {
		return null;
	}

	/**
	 * Creates a new adapter for an object of class '{@link com.ericsson.executablemodeling.xtuml.profile.xtumlprofile.XtGeneralization <em>Xt Generalization</em>}'.
	 * <!-- begin-user-doc -->
	 * This default implementation returns null so that we can easily ignore cases;
	 * it's useful to ignore a case when inheritance will catch all the cases anyway.
	 * <!-- end-user-doc -->
	 * @return the new adapter.
	 * @see com.ericsson.executablemodeling.xtuml.profile.xtumlprofile.XtGeneralization
	 * @generated
	 */
	public Adapter createXtGeneralizationAdapter() {
		return null;
	}

	/**
	 * Creates a new adapter for an object of class '{@link com.ericsson.executablemodeling.xtuml.profile.xtumlprofile.XtGeneralizationSet <em>Xt Generalization Set</em>}'.
	 * <!-- begin-user-doc -->
	 * This default implementation returns null so that we can easily ignore cases;
	 * it's useful to ignore a case when inheritance will catch all the cases anyway.
	 * <!-- end-user-doc -->
	 * @return the new adapter.
	 * @see com.ericsson.executablemodeling.xtuml.profile.xtumlprofile.XtGeneralizationSet
	 * @generated
	 */
	public Adapter createXtGeneralizationSetAdapter() {
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

} //xtUMLProfileAdapterFactory
