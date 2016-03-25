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
package com.ericsson.executablemodeling.xtuml.profile.xtumlprofile.impl;

import com.ericsson.executablemodeling.xtuml.profile.executablemodelingprofile.ExecutableModelingProfilePackage;

import com.ericsson.executablemodeling.xtuml.profile.executablemodelingprofile.impl.ExecutableModelingProfilePackageImpl;

import com.ericsson.executablemodeling.xtuml.profile.xtumlprofile.XtActivity;
import com.ericsson.executablemodeling.xtuml.profile.xtumlprofile.XtAssociation;
import com.ericsson.executablemodeling.xtuml.profile.xtumlprofile.XtAssociationClass;
import com.ericsson.executablemodeling.xtuml.profile.xtumlprofile.XtClass;
import com.ericsson.executablemodeling.xtuml.profile.xtumlprofile.XtComponent;
import com.ericsson.executablemodeling.xtuml.profile.xtumlprofile.XtConnector;
import com.ericsson.executablemodeling.xtuml.profile.xtumlprofile.XtConnectorEnd;
import com.ericsson.executablemodeling.xtuml.profile.xtumlprofile.XtConstrainedType;
import com.ericsson.executablemodeling.xtuml.profile.xtumlprofile.XtConstraint;
import com.ericsson.executablemodeling.xtuml.profile.xtumlprofile.XtDataType;
import com.ericsson.executablemodeling.xtuml.profile.xtumlprofile.XtEnumeration;
import com.ericsson.executablemodeling.xtuml.profile.xtumlprofile.XtGeneralization;
import com.ericsson.executablemodeling.xtuml.profile.xtumlprofile.XtGeneralizationSet;
import com.ericsson.executablemodeling.xtuml.profile.xtumlprofile.XtMessageSet;
import com.ericsson.executablemodeling.xtuml.profile.xtumlprofile.XtOpaqueBehavior;
import com.ericsson.executablemodeling.xtuml.profile.xtumlprofile.XtOperation;
import com.ericsson.executablemodeling.xtuml.profile.xtumlprofile.XtParameter;
import com.ericsson.executablemodeling.xtuml.profile.xtumlprofile.XtPart;
import com.ericsson.executablemodeling.xtuml.profile.xtumlprofile.XtPort;
import com.ericsson.executablemodeling.xtuml.profile.xtumlprofile.XtProperty;
import com.ericsson.executablemodeling.xtuml.profile.xtumlprofile.XtProtocol;
import com.ericsson.executablemodeling.xtuml.profile.xtumlprofile.XtProtocolContainer;
import com.ericsson.executablemodeling.xtuml.profile.xtumlprofile.XtPseudoState;
import com.ericsson.executablemodeling.xtuml.profile.xtumlprofile.XtReception;
import com.ericsson.executablemodeling.xtuml.profile.xtumlprofile.XtRegion;
import com.ericsson.executablemodeling.xtuml.profile.xtumlprofile.XtSignal;
import com.ericsson.executablemodeling.xtuml.profile.xtumlprofile.XtState;
import com.ericsson.executablemodeling.xtuml.profile.xtumlprofile.XtStateMachine;
import com.ericsson.executablemodeling.xtuml.profile.xtumlprofile.XtTransition;
import com.ericsson.executablemodeling.xtuml.profile.xtumlprofile.XtTrigger;

import com.ericsson.executablemodeling.xtuml.profile.xtumlprofile.util.xtUMLProfileValidator;

import com.ericsson.executablemodeling.xtuml.profile.xtumlprofile.xtUMLProfileFactory;
import com.ericsson.executablemodeling.xtuml.profile.xtumlprofile.xtUMLProfilePackage;

import org.eclipse.emf.ecore.EClass;
import org.eclipse.emf.ecore.EGenericType;
import org.eclipse.emf.ecore.EOperation;
import org.eclipse.emf.ecore.EPackage;
import org.eclipse.emf.ecore.EReference;
import org.eclipse.emf.ecore.EValidator;

import org.eclipse.emf.ecore.impl.EPackageImpl;

import org.eclipse.uml2.uml.UMLPackage;

/**
 * <!-- begin-user-doc -->
 * An implementation of the model <b>Package</b>.
 * <!-- end-user-doc -->
 * @generated
 */
public class xtUMLProfilePackageImpl extends EPackageImpl implements xtUMLProfilePackage {
	/**
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 */
	private EClass xtConnectorEndEClass = null;

	/**
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 */
	private EClass xtPropertyEClass = null;

	/**
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 */
	private EClass xtComponentEClass = null;

	/**
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 */
	private EClass xtOperationEClass = null;

	/**
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 */
	private EClass xtParameterEClass = null;

	/**
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 */
	private EClass xtReceptionEClass = null;

	/**
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 */
	private EClass xtPartEClass = null;

	/**
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 */
	private EClass xtPortEClass = null;

	/**
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 */
	private EClass xtConnectorEClass = null;

	/**
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 */
	private EClass xtProtocolContainerEClass = null;

	/**
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 */
	private EClass xtProtocolEClass = null;

	/**
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 */
	private EClass xtMessageSetEClass = null;

	/**
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 */
	private EClass xtSignalEClass = null;

	/**
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 */
	private EClass xtDataTypeEClass = null;

	/**
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 */
	private EClass xtEnumerationEClass = null;

	/**
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 */
	private EClass xtAssociationEClass = null;

	/**
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 */
	private EClass xtAssociationClassEClass = null;

	/**
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 */
	private EClass xtTriggerEClass = null;

	/**
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 */
	private EClass xtStateMachineEClass = null;

	/**
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 */
	private EClass xtRegionEClass = null;

	/**
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 */
	private EClass xtPseudoStateEClass = null;

	/**
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 */
	private EClass xtTransitionEClass = null;

	/**
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 */
	private EClass xtStateEClass = null;

	/**
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 */
	private EClass xtActivityEClass = null;

	/**
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 */
	private EClass xtConstraintEClass = null;

	/**
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 */
	private EClass xtClassEClass = null;

	/**
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 */
	private EClass xtConstrainedTypeEClass = null;

	/**
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 */
	private EClass xtOpaqueBehaviorEClass = null;

	/**
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 */
	private EClass xtGeneralizationEClass = null;

	/**
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 */
	private EClass xtGeneralizationSetEClass = null;

	/**
	 * Creates an instance of the model <b>Package</b>, registered with
	 * {@link org.eclipse.emf.ecore.EPackage.Registry EPackage.Registry} by the package
	 * package URI value.
	 * <p>Note: the correct way to create the package is via the static
	 * factory method {@link #init init()}, which also performs
	 * initialization of the package, or returns the registered package,
	 * if one already exists.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @see org.eclipse.emf.ecore.EPackage.Registry
	 * @see com.ericsson.executablemodeling.xtuml.profile.xtumlprofile.xtUMLProfilePackage#eNS_URI
	 * @see #init()
	 * @generated
	 */
	private xtUMLProfilePackageImpl() {
		super(eNS_URI, xtUMLProfileFactory.eINSTANCE);
	}

	/**
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 */
	private static boolean isInited = false;

	/**
	 * Creates, registers, and initializes the <b>Package</b> for this model, and for any others upon which it depends.
	 * 
	 * <p>This method is used to initialize {@link xtUMLProfilePackage#eINSTANCE} when that field is accessed.
	 * Clients should not invoke it directly. Instead, they should simply access that field to obtain the package.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @see #eNS_URI
	 * @see #createPackageContents()
	 * @see #initializePackageContents()
	 * @generated
	 */
	public static xtUMLProfilePackage init() {
		if (isInited) return (xtUMLProfilePackage)EPackage.Registry.INSTANCE.getEPackage(xtUMLProfilePackage.eNS_URI);

		// Obtain or create and register package
		xtUMLProfilePackageImpl thextUMLProfilePackage = (xtUMLProfilePackageImpl)(EPackage.Registry.INSTANCE.get(eNS_URI) instanceof xtUMLProfilePackageImpl ? EPackage.Registry.INSTANCE.get(eNS_URI) : new xtUMLProfilePackageImpl());

		isInited = true;

		// Initialize simple dependencies
		UMLPackage.eINSTANCE.eClass();

		// Obtain or create and register interdependencies
		ExecutableModelingProfilePackageImpl theExecutableModelingProfilePackage = (ExecutableModelingProfilePackageImpl)(EPackage.Registry.INSTANCE.getEPackage(ExecutableModelingProfilePackage.eNS_URI) instanceof ExecutableModelingProfilePackageImpl ? EPackage.Registry.INSTANCE.getEPackage(ExecutableModelingProfilePackage.eNS_URI) : ExecutableModelingProfilePackage.eINSTANCE);

		// Create package meta-data objects
		thextUMLProfilePackage.createPackageContents();
		theExecutableModelingProfilePackage.createPackageContents();

		// Initialize created meta-data
		thextUMLProfilePackage.initializePackageContents();
		theExecutableModelingProfilePackage.initializePackageContents();

		// Register package validator
		EValidator.Registry.INSTANCE.put
			(thextUMLProfilePackage, 
			 new EValidator.Descriptor() {
				 public EValidator getEValidator() {
					 return xtUMLProfileValidator.INSTANCE;
				 }
			 });

		// Mark meta-data to indicate it can't be changed
		thextUMLProfilePackage.freeze();

  
		// Update the registry and return the package
		EPackage.Registry.INSTANCE.put(xtUMLProfilePackage.eNS_URI, thextUMLProfilePackage);
		return thextUMLProfilePackage;
	}

	/**
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 */
	public EClass getXtConnectorEnd() {
		return xtConnectorEndEClass;
	}

	/**
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 */
	public EOperation getXtConnectorEnd__XtConnectorEndRole__DiagnosticChain_Map() {
		return xtConnectorEndEClass.getEOperations().get(0);
	}

	/**
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 */
	public EClass getXtProperty() {
		return xtPropertyEClass;
	}

	/**
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 */
	public EReference getXtProperty_Derivation() {
		return (EReference)xtPropertyEClass.getEStructuralFeatures().get(0);
	}

	/**
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 */
	public EOperation getXtProperty__XtPropertyAggregation__DiagnosticChain_Map() {
		return xtPropertyEClass.getEOperations().get(0);
	}

	/**
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 */
	public EOperation getXtProperty__XtPropertyRedefinition__DiagnosticChain_Map() {
		return xtPropertyEClass.getEOperations().get(1);
	}

	/**
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 */
	public EOperation getXtProperty__XtPropertyDerivation__DiagnosticChain_Map() {
		return xtPropertyEClass.getEOperations().get(2);
	}

	/**
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 */
	public EClass getXtComponent() {
		return xtComponentEClass;
	}

	/**
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 */
	public EReference getXtComponent_Base_Component() {
		return (EReference)xtComponentEClass.getEStructuralFeatures().get(0);
	}

	/**
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 */
	public EOperation getXtComponent__XtComponentAttributes__DiagnosticChain_Map() {
		return xtComponentEClass.getEOperations().get(0);
	}

	/**
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 */
	public EOperation getXtComponent__XtComponentBehavioralFeatures__DiagnosticChain_Map() {
		return xtComponentEClass.getEOperations().get(1);
	}

	/**
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 */
	public EOperation getXtComponent__XtComponentOwnedBehaviors__DiagnosticChain_Map() {
		return xtComponentEClass.getEOperations().get(2);
	}

	/**
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 */
	public EOperation getXtComponent__XtComponentNestedClassifiers__DiagnosticChain_Map() {
		return xtComponentEClass.getEOperations().get(3);
	}

	/**
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 */
	public EOperation getXtComponent__XtComponentParts__DiagnosticChain_Map() {
		return xtComponentEClass.getEOperations().get(4);
	}

	/**
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 */
	public EOperation getXtComponent__XtComponentGeneralization__DiagnosticChain_Map() {
		return xtComponentEClass.getEOperations().get(5);
	}

	/**
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 */
	public EClass getXtOperation() {
		return xtOperationEClass;
	}

	/**
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 */
	public EClass getXtParameter() {
		return xtParameterEClass;
	}

	/**
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 */
	public EClass getXtReception() {
		return xtReceptionEClass;
	}

	/**
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 */
	public EClass getXtPart() {
		return xtPartEClass;
	}

	/**
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 */
	public EOperation getXtPart__XtPartType__DiagnosticChain_Map() {
		return xtPartEClass.getEOperations().get(0);
	}

	/**
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 */
	public EOperation getXtPart__XtPartComposition__DiagnosticChain_Map() {
		return xtPartEClass.getEOperations().get(1);
	}

	/**
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 */
	public EOperation getXtPart__XtPartVisibility__DiagnosticChain_Map() {
		return xtPartEClass.getEOperations().get(2);
	}

	/**
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 */
	public EClass getXtPort() {
		return xtPortEClass;
	}

	/**
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 */
	public EOperation getXtPort__XtPortVisibility__DiagnosticChain_Map() {
		return xtPortEClass.getEOperations().get(0);
	}

	/**
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 */
	public EOperation getXtPort__XtConnectorVisibility__DiagnosticChain_Map() {
		return xtPortEClass.getEOperations().get(1);
	}

	/**
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 */
	public EOperation getXtPort__XtPortBehaviorPort__DiagnosticChain_Map() {
		return xtPortEClass.getEOperations().get(2);
	}

	/**
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 */
	public EClass getXtConnector() {
		return xtConnectorEClass;
	}

	/**
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 */
	public EOperation getXtConnector__XtConnectorConnectorEnds__DiagnosticChain_Map() {
		return xtConnectorEClass.getEOperations().get(0);
	}

	/**
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 */
	public EClass getXtProtocolContainer() {
		return xtProtocolContainerEClass;
	}

	/**
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 */
	public EClass getXtProtocol() {
		return xtProtocolEClass;
	}

	/**
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 */
	public EReference getXtProtocol_Base_Class() {
		return (EReference)xtProtocolEClass.getEStructuralFeatures().get(0);
	}

	/**
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 */
	public EOperation getXtProtocol__XtProtocolNestedClassifiers__DiagnosticChain_Map() {
		return xtProtocolEClass.getEOperations().get(0);
	}

	/**
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 */
	public EOperation getXtProtocol__XtProtocolBehaviors__DiagnosticChain_Map() {
		return xtProtocolEClass.getEOperations().get(1);
	}

	/**
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 */
	public EClass getXtMessageSet() {
		return xtMessageSetEClass;
	}

	/**
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 */
	public EOperation getXtMessageSet__XtMessageSetNestedClassifiers__DiagnosticChain_Map() {
		return xtMessageSetEClass.getEOperations().get(0);
	}

	/**
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 */
	public EOperation getXtMessageSet__XtMessageSetAttributes__DiagnosticChain_Map() {
		return xtMessageSetEClass.getEOperations().get(1);
	}

	/**
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 */
	public EClass getXtSignal() {
		return xtSignalEClass;
	}

	/**
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 */
	public EClass getXtDataType() {
		return xtDataTypeEClass;
	}

	/**
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 */
	public EClass getXtEnumeration() {
		return xtEnumerationEClass;
	}

	/**
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 */
	public EClass getXtAssociation() {
		return xtAssociationEClass;
	}

	/**
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 */
	public EOperation getXtAssociation__XtAssociationEndOwnership__DiagnosticChain_Map() {
		return xtAssociationEClass.getEOperations().get(0);
	}

	/**
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 */
	public EOperation getXtAssociation__XtAssociationEnds__DiagnosticChain_Map() {
		return xtAssociationEClass.getEOperations().get(1);
	}

	/**
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 */
	public EOperation getXtAssociation__XtAssociationEndType__DiagnosticChain_Map() {
		return xtAssociationEClass.getEOperations().get(2);
	}

	/**
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 */
	public EOperation getXtAssociation__XtAssociationGeneralization__DiagnosticChain_Map() {
		return xtAssociationEClass.getEOperations().get(3);
	}

	/**
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 */
	public EClass getXtAssociationClass() {
		return xtAssociationClassEClass;
	}

	/**
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 */
	public EClass getXtTrigger() {
		return xtTriggerEClass;
	}

	/**
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 */
	public EOperation getXtTrigger__XtTriggerEvent__DiagnosticChain_Map() {
		return xtTriggerEClass.getEOperations().get(0);
	}

	/**
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 */
	public EClass getXtStateMachine() {
		return xtStateMachineEClass;
	}

	/**
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 */
	public EClass getXtRegion() {
		return xtRegionEClass;
	}

	/**
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 */
	public EClass getXtPseudoState() {
		return xtPseudoStateEClass;
	}

	/**
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 */
	public EOperation getXtPseudoState__XtPseudostateKind__DiagnosticChain_Map() {
		return xtPseudoStateEClass.getEOperations().get(0);
	}

	/**
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 */
	public EClass getXtTransition() {
		return xtTransitionEClass;
	}

	/**
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 */
	public EOperation getXtTransition__XtTransitionNoGuard__DiagnosticChain_Map() {
		return xtTransitionEClass.getEOperations().get(0);
	}

	/**
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 */
	public EClass getXtState() {
		return xtStateEClass;
	}

	/**
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 */
	public EOperation getXtState__XStateNotComposite__DiagnosticChain_Map() {
		return xtStateEClass.getEOperations().get(0);
	}

	/**
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 */
	public EClass getXtActivity() {
		return xtActivityEClass;
	}

	/**
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 */
	public EOperation getXtActivity__XtActivityTextualRepresentation__DiagnosticChain_Map() {
		return xtActivityEClass.getEOperations().get(0);
	}

	/**
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 */
	public EClass getXtConstraint() {
		return xtConstraintEClass;
	}

	/**
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 */
	public EClass getXtClass() {
		return xtClassEClass;
	}

	/**
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 */
	public EOperation getXtClass__XtClassConstructors__DiagnosticChain_Map() {
		return xtClassEClass.getEOperations().get(0);
	}

	/**
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 */
	public EOperation getXtClass__XtClassClassifierBehavior__DiagnosticChain_Map() {
		return xtClassEClass.getEOperations().get(1);
	}

	/**
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 */
	public EOperation getXtClass__XtClassVisibility__DiagnosticChain_Map() {
		return xtClassEClass.getEOperations().get(2);
	}

	/**
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 */
	public EOperation getXtClass__XtClassGeneralizationSets__DiagnosticChain_Map() {
		return xtClassEClass.getEOperations().get(3);
	}

	/**
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 */
	public EClass getXtConstrainedType() {
		return xtConstrainedTypeEClass;
	}

	/**
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 */
	public EClass getXtOpaqueBehavior() {
		return xtOpaqueBehaviorEClass;
	}

	/**
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 */
	public EOperation getXtOpaqueBehavior__XtOpaqueBehaviorLanguage__DiagnosticChain_Map() {
		return xtOpaqueBehaviorEClass.getEOperations().get(0);
	}

	/**
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 */
	public EClass getXtGeneralization() {
		return xtGeneralizationEClass;
	}

	/**
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 */
	public EOperation getXtGeneralization__XtGeneralizationGeneralizationSet__DiagnosticChain_Map() {
		return xtGeneralizationEClass.getEOperations().get(0);
	}

	/**
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 */
	public EClass getXtGeneralizationSet() {
		return xtGeneralizationSetEClass;
	}

	/**
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 */
	public EOperation getXtGeneralizationSet__XtGeneralizationSet__DiagnosticChain_Map() {
		return xtGeneralizationSetEClass.getEOperations().get(0);
	}

	/**
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 */
	public xtUMLProfileFactory getxtUMLProfileFactory() {
		return (xtUMLProfileFactory)getEFactoryInstance();
	}

	/**
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 */
	private boolean isCreated = false;

	/**
	 * Creates the meta-model objects for the package.  This method is
	 * guarded to have no affect on any invocation but its first.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 */
	public void createPackageContents() {
		if (isCreated) return;
		isCreated = true;

		// Create classes and their features
		xtConnectorEndEClass = createEClass(XT_CONNECTOR_END);
		createEOperation(xtConnectorEndEClass, XT_CONNECTOR_END___XT_CONNECTOR_END_ROLE__DIAGNOSTICCHAIN_MAP);

		xtPropertyEClass = createEClass(XT_PROPERTY);
		createEReference(xtPropertyEClass, XT_PROPERTY__DERIVATION);
		createEOperation(xtPropertyEClass, XT_PROPERTY___XT_PROPERTY_AGGREGATION__DIAGNOSTICCHAIN_MAP);
		createEOperation(xtPropertyEClass, XT_PROPERTY___XT_PROPERTY_REDEFINITION__DIAGNOSTICCHAIN_MAP);
		createEOperation(xtPropertyEClass, XT_PROPERTY___XT_PROPERTY_DERIVATION__DIAGNOSTICCHAIN_MAP);

		xtComponentEClass = createEClass(XT_COMPONENT);
		createEReference(xtComponentEClass, XT_COMPONENT__BASE_COMPONENT);
		createEOperation(xtComponentEClass, XT_COMPONENT___XT_COMPONENT_ATTRIBUTES__DIAGNOSTICCHAIN_MAP);
		createEOperation(xtComponentEClass, XT_COMPONENT___XT_COMPONENT_BEHAVIORAL_FEATURES__DIAGNOSTICCHAIN_MAP);
		createEOperation(xtComponentEClass, XT_COMPONENT___XT_COMPONENT_OWNED_BEHAVIORS__DIAGNOSTICCHAIN_MAP);
		createEOperation(xtComponentEClass, XT_COMPONENT___XT_COMPONENT_NESTED_CLASSIFIERS__DIAGNOSTICCHAIN_MAP);
		createEOperation(xtComponentEClass, XT_COMPONENT___XT_COMPONENT_PARTS__DIAGNOSTICCHAIN_MAP);
		createEOperation(xtComponentEClass, XT_COMPONENT___XT_COMPONENT_GENERALIZATION__DIAGNOSTICCHAIN_MAP);

		xtOperationEClass = createEClass(XT_OPERATION);

		xtParameterEClass = createEClass(XT_PARAMETER);

		xtReceptionEClass = createEClass(XT_RECEPTION);

		xtPartEClass = createEClass(XT_PART);
		createEOperation(xtPartEClass, XT_PART___XT_PART_TYPE__DIAGNOSTICCHAIN_MAP);
		createEOperation(xtPartEClass, XT_PART___XT_PART_COMPOSITION__DIAGNOSTICCHAIN_MAP);
		createEOperation(xtPartEClass, XT_PART___XT_PART_VISIBILITY__DIAGNOSTICCHAIN_MAP);

		xtPortEClass = createEClass(XT_PORT);
		createEOperation(xtPortEClass, XT_PORT___XT_PORT_VISIBILITY__DIAGNOSTICCHAIN_MAP);
		createEOperation(xtPortEClass, XT_PORT___XT_CONNECTOR_VISIBILITY__DIAGNOSTICCHAIN_MAP);
		createEOperation(xtPortEClass, XT_PORT___XT_PORT_BEHAVIOR_PORT__DIAGNOSTICCHAIN_MAP);

		xtConnectorEClass = createEClass(XT_CONNECTOR);
		createEOperation(xtConnectorEClass, XT_CONNECTOR___XT_CONNECTOR_CONNECTOR_ENDS__DIAGNOSTICCHAIN_MAP);

		xtProtocolContainerEClass = createEClass(XT_PROTOCOL_CONTAINER);

		xtProtocolEClass = createEClass(XT_PROTOCOL);
		createEReference(xtProtocolEClass, XT_PROTOCOL__BASE_CLASS);
		createEOperation(xtProtocolEClass, XT_PROTOCOL___XT_PROTOCOL_NESTED_CLASSIFIERS__DIAGNOSTICCHAIN_MAP);
		createEOperation(xtProtocolEClass, XT_PROTOCOL___XT_PROTOCOL_BEHAVIORS__DIAGNOSTICCHAIN_MAP);

		xtMessageSetEClass = createEClass(XT_MESSAGE_SET);
		createEOperation(xtMessageSetEClass, XT_MESSAGE_SET___XT_MESSAGE_SET_NESTED_CLASSIFIERS__DIAGNOSTICCHAIN_MAP);
		createEOperation(xtMessageSetEClass, XT_MESSAGE_SET___XT_MESSAGE_SET_ATTRIBUTES__DIAGNOSTICCHAIN_MAP);

		xtSignalEClass = createEClass(XT_SIGNAL);

		xtDataTypeEClass = createEClass(XT_DATA_TYPE);

		xtEnumerationEClass = createEClass(XT_ENUMERATION);

		xtAssociationEClass = createEClass(XT_ASSOCIATION);
		createEOperation(xtAssociationEClass, XT_ASSOCIATION___XT_ASSOCIATION_END_OWNERSHIP__DIAGNOSTICCHAIN_MAP);
		createEOperation(xtAssociationEClass, XT_ASSOCIATION___XT_ASSOCIATION_ENDS__DIAGNOSTICCHAIN_MAP);
		createEOperation(xtAssociationEClass, XT_ASSOCIATION___XT_ASSOCIATION_END_TYPE__DIAGNOSTICCHAIN_MAP);
		createEOperation(xtAssociationEClass, XT_ASSOCIATION___XT_ASSOCIATION_GENERALIZATION__DIAGNOSTICCHAIN_MAP);

		xtAssociationClassEClass = createEClass(XT_ASSOCIATION_CLASS);

		xtTriggerEClass = createEClass(XT_TRIGGER);
		createEOperation(xtTriggerEClass, XT_TRIGGER___XT_TRIGGER_EVENT__DIAGNOSTICCHAIN_MAP);

		xtStateMachineEClass = createEClass(XT_STATE_MACHINE);

		xtRegionEClass = createEClass(XT_REGION);

		xtPseudoStateEClass = createEClass(XT_PSEUDO_STATE);
		createEOperation(xtPseudoStateEClass, XT_PSEUDO_STATE___XT_PSEUDOSTATE_KIND__DIAGNOSTICCHAIN_MAP);

		xtTransitionEClass = createEClass(XT_TRANSITION);
		createEOperation(xtTransitionEClass, XT_TRANSITION___XT_TRANSITION_NO_GUARD__DIAGNOSTICCHAIN_MAP);

		xtStateEClass = createEClass(XT_STATE);
		createEOperation(xtStateEClass, XT_STATE___XSTATE_NOT_COMPOSITE__DIAGNOSTICCHAIN_MAP);

		xtActivityEClass = createEClass(XT_ACTIVITY);
		createEOperation(xtActivityEClass, XT_ACTIVITY___XT_ACTIVITY_TEXTUAL_REPRESENTATION__DIAGNOSTICCHAIN_MAP);

		xtConstraintEClass = createEClass(XT_CONSTRAINT);

		xtClassEClass = createEClass(XT_CLASS);
		createEOperation(xtClassEClass, XT_CLASS___XT_CLASS_CONSTRUCTORS__DIAGNOSTICCHAIN_MAP);
		createEOperation(xtClassEClass, XT_CLASS___XT_CLASS_CLASSIFIER_BEHAVIOR__DIAGNOSTICCHAIN_MAP);
		createEOperation(xtClassEClass, XT_CLASS___XT_CLASS_VISIBILITY__DIAGNOSTICCHAIN_MAP);
		createEOperation(xtClassEClass, XT_CLASS___XT_CLASS_GENERALIZATION_SETS__DIAGNOSTICCHAIN_MAP);

		xtConstrainedTypeEClass = createEClass(XT_CONSTRAINED_TYPE);

		xtOpaqueBehaviorEClass = createEClass(XT_OPAQUE_BEHAVIOR);
		createEOperation(xtOpaqueBehaviorEClass, XT_OPAQUE_BEHAVIOR___XT_OPAQUE_BEHAVIOR_LANGUAGE__DIAGNOSTICCHAIN_MAP);

		xtGeneralizationEClass = createEClass(XT_GENERALIZATION);
		createEOperation(xtGeneralizationEClass, XT_GENERALIZATION___XT_GENERALIZATION_GENERALIZATION_SET__DIAGNOSTICCHAIN_MAP);

		xtGeneralizationSetEClass = createEClass(XT_GENERALIZATION_SET);
		createEOperation(xtGeneralizationSetEClass, XT_GENERALIZATION_SET___XT_GENERALIZATION_SET__DIAGNOSTICCHAIN_MAP);
	}

	/**
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 */
	private boolean isInitialized = false;

	/**
	 * Complete the initialization of the package and its meta-model.  This
	 * method is guarded to have no affect on any invocation but its first.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 */
	public void initializePackageContents() {
		if (isInitialized) return;
		isInitialized = true;

		// Initialize package
		setName(eNAME);
		setNsPrefix(eNS_PREFIX);
		setNsURI(eNS_URI);

		// Obtain other dependent packages
		ExecutableModelingProfilePackage theExecutableModelingProfilePackage = (ExecutableModelingProfilePackage)EPackage.Registry.INSTANCE.getEPackage(ExecutableModelingProfilePackage.eNS_URI);
		UMLPackage theUMLPackage = (UMLPackage)EPackage.Registry.INSTANCE.getEPackage(UMLPackage.eNS_URI);

		// Create type parameters

		// Set bounds for type parameters

		// Add supertypes to classes
		xtConnectorEndEClass.getESuperTypes().add(theExecutableModelingProfilePackage.getXConnectorEnd());
		xtPropertyEClass.getESuperTypes().add(theExecutableModelingProfilePackage.getXProperty());
		xtComponentEClass.getESuperTypes().add(theExecutableModelingProfilePackage.getXEncapsulatedClassifier());
		xtOperationEClass.getESuperTypes().add(theExecutableModelingProfilePackage.getXOperation());
		xtParameterEClass.getESuperTypes().add(theExecutableModelingProfilePackage.getXParameter());
		xtReceptionEClass.getESuperTypes().add(theExecutableModelingProfilePackage.getXReception());
		xtPartEClass.getESuperTypes().add(theExecutableModelingProfilePackage.getXPart());
		xtPortEClass.getESuperTypes().add(theExecutableModelingProfilePackage.getXPort());
		xtConnectorEClass.getESuperTypes().add(theExecutableModelingProfilePackage.getXConnector());
		xtProtocolContainerEClass.getESuperTypes().add(theExecutableModelingProfilePackage.getXProtocolContainer());
		xtProtocolEClass.getESuperTypes().add(theExecutableModelingProfilePackage.getXProtocol());
		xtMessageSetEClass.getESuperTypes().add(theExecutableModelingProfilePackage.getXMessageSet());
		xtSignalEClass.getESuperTypes().add(theExecutableModelingProfilePackage.getXSignal());
		xtDataTypeEClass.getESuperTypes().add(theExecutableModelingProfilePackage.getXDataType());
		xtEnumerationEClass.getESuperTypes().add(theExecutableModelingProfilePackage.getXEnumeration());
		xtAssociationEClass.getESuperTypes().add(theExecutableModelingProfilePackage.getXClassifier());
		xtAssociationEClass.getESuperTypes().add(theExecutableModelingProfilePackage.getXAssociation());
		xtAssociationClassEClass.getESuperTypes().add(theExecutableModelingProfilePackage.getXAssociationClass());
		xtAssociationClassEClass.getESuperTypes().add(this.getXtAssociation());
		xtTriggerEClass.getESuperTypes().add(theExecutableModelingProfilePackage.getXTrigger());
		xtStateMachineEClass.getESuperTypes().add(theExecutableModelingProfilePackage.getXStateMachine());
		xtRegionEClass.getESuperTypes().add(theExecutableModelingProfilePackage.getXRegion());
		xtPseudoStateEClass.getESuperTypes().add(theExecutableModelingProfilePackage.getXPseudostate());
		xtTransitionEClass.getESuperTypes().add(theExecutableModelingProfilePackage.getXTransition());
		xtStateEClass.getESuperTypes().add(theExecutableModelingProfilePackage.getXState());
		xtActivityEClass.getESuperTypes().add(theExecutableModelingProfilePackage.getXActivity());
		xtConstraintEClass.getESuperTypes().add(theExecutableModelingProfilePackage.getXConstraint());
		xtClassEClass.getESuperTypes().add(theExecutableModelingProfilePackage.getXClass());
		xtConstrainedTypeEClass.getESuperTypes().add(theExecutableModelingProfilePackage.getXConstrainedType());
		xtOpaqueBehaviorEClass.getESuperTypes().add(theExecutableModelingProfilePackage.getXOpaqueBehavior());
		xtGeneralizationEClass.getESuperTypes().add(theExecutableModelingProfilePackage.getXGeneralization());
		xtGeneralizationSetEClass.getESuperTypes().add(theExecutableModelingProfilePackage.getXGeneralizationSet());

		// Initialize classes, features, and operations; add parameters
		initEClass(xtConnectorEndEClass, XtConnectorEnd.class, "XtConnectorEnd", !IS_ABSTRACT, !IS_INTERFACE, IS_GENERATED_INSTANCE_CLASS);

		EOperation op = initEOperation(getXtConnectorEnd__XtConnectorEndRole__DiagnosticChain_Map(), ecorePackage.getEBoolean(), "xtConnectorEndRole", 0, 1, IS_UNIQUE, IS_ORDERED);
		addEParameter(op, ecorePackage.getEDiagnosticChain(), "diagnostics", 0, 1, IS_UNIQUE, IS_ORDERED);
		EGenericType g1 = createEGenericType(ecorePackage.getEMap());
		EGenericType g2 = createEGenericType(ecorePackage.getEJavaObject());
		g1.getETypeArguments().add(g2);
		g2 = createEGenericType(ecorePackage.getEJavaObject());
		g1.getETypeArguments().add(g2);
		addEParameter(op, g1, "context", 0, 1, IS_UNIQUE, IS_ORDERED);

		initEClass(xtPropertyEClass, XtProperty.class, "XtProperty", !IS_ABSTRACT, !IS_INTERFACE, IS_GENERATED_INSTANCE_CLASS);
		initEReference(getXtProperty_Derivation(), theUMLPackage.getOpaqueExpression(), null, "derivation", null, 0, 1, XtProperty.class, !IS_TRANSIENT, !IS_VOLATILE, IS_CHANGEABLE, !IS_COMPOSITE, IS_RESOLVE_PROXIES, !IS_UNSETTABLE, IS_UNIQUE, !IS_DERIVED, !IS_ORDERED);

		op = initEOperation(getXtProperty__XtPropertyAggregation__DiagnosticChain_Map(), ecorePackage.getEBoolean(), "xtPropertyAggregation", 0, 1, IS_UNIQUE, IS_ORDERED);
		addEParameter(op, ecorePackage.getEDiagnosticChain(), "diagnostics", 0, 1, IS_UNIQUE, IS_ORDERED);
		g1 = createEGenericType(ecorePackage.getEMap());
		g2 = createEGenericType(ecorePackage.getEJavaObject());
		g1.getETypeArguments().add(g2);
		g2 = createEGenericType(ecorePackage.getEJavaObject());
		g1.getETypeArguments().add(g2);
		addEParameter(op, g1, "context", 0, 1, IS_UNIQUE, IS_ORDERED);

		op = initEOperation(getXtProperty__XtPropertyRedefinition__DiagnosticChain_Map(), ecorePackage.getEBoolean(), "xtPropertyRedefinition", 0, 1, IS_UNIQUE, IS_ORDERED);
		addEParameter(op, ecorePackage.getEDiagnosticChain(), "diagnostics", 0, 1, IS_UNIQUE, IS_ORDERED);
		g1 = createEGenericType(ecorePackage.getEMap());
		g2 = createEGenericType(ecorePackage.getEJavaObject());
		g1.getETypeArguments().add(g2);
		g2 = createEGenericType(ecorePackage.getEJavaObject());
		g1.getETypeArguments().add(g2);
		addEParameter(op, g1, "context", 0, 1, IS_UNIQUE, IS_ORDERED);

		op = initEOperation(getXtProperty__XtPropertyDerivation__DiagnosticChain_Map(), ecorePackage.getEBoolean(), "xtPropertyDerivation", 0, 1, IS_UNIQUE, IS_ORDERED);
		addEParameter(op, ecorePackage.getEDiagnosticChain(), "diagnostics", 0, 1, IS_UNIQUE, IS_ORDERED);
		g1 = createEGenericType(ecorePackage.getEMap());
		g2 = createEGenericType(ecorePackage.getEJavaObject());
		g1.getETypeArguments().add(g2);
		g2 = createEGenericType(ecorePackage.getEJavaObject());
		g1.getETypeArguments().add(g2);
		addEParameter(op, g1, "context", 0, 1, IS_UNIQUE, IS_ORDERED);

		initEClass(xtComponentEClass, XtComponent.class, "XtComponent", !IS_ABSTRACT, !IS_INTERFACE, IS_GENERATED_INSTANCE_CLASS);
		initEReference(getXtComponent_Base_Component(), theUMLPackage.getComponent(), null, "base_Component", null, 1, 1, XtComponent.class, !IS_TRANSIENT, !IS_VOLATILE, IS_CHANGEABLE, !IS_COMPOSITE, IS_RESOLVE_PROXIES, !IS_UNSETTABLE, IS_UNIQUE, !IS_DERIVED, !IS_ORDERED);

		op = initEOperation(getXtComponent__XtComponentAttributes__DiagnosticChain_Map(), ecorePackage.getEBoolean(), "xtComponentAttributes", 0, 1, IS_UNIQUE, IS_ORDERED);
		addEParameter(op, ecorePackage.getEDiagnosticChain(), "diagnostics", 0, 1, IS_UNIQUE, IS_ORDERED);
		g1 = createEGenericType(ecorePackage.getEMap());
		g2 = createEGenericType(ecorePackage.getEJavaObject());
		g1.getETypeArguments().add(g2);
		g2 = createEGenericType(ecorePackage.getEJavaObject());
		g1.getETypeArguments().add(g2);
		addEParameter(op, g1, "context", 0, 1, IS_UNIQUE, IS_ORDERED);

		op = initEOperation(getXtComponent__XtComponentBehavioralFeatures__DiagnosticChain_Map(), ecorePackage.getEBoolean(), "xtComponentBehavioralFeatures", 0, 1, IS_UNIQUE, IS_ORDERED);
		addEParameter(op, ecorePackage.getEDiagnosticChain(), "diagnostics", 0, 1, IS_UNIQUE, IS_ORDERED);
		g1 = createEGenericType(ecorePackage.getEMap());
		g2 = createEGenericType(ecorePackage.getEJavaObject());
		g1.getETypeArguments().add(g2);
		g2 = createEGenericType(ecorePackage.getEJavaObject());
		g1.getETypeArguments().add(g2);
		addEParameter(op, g1, "context", 0, 1, IS_UNIQUE, IS_ORDERED);

		op = initEOperation(getXtComponent__XtComponentOwnedBehaviors__DiagnosticChain_Map(), ecorePackage.getEBoolean(), "xtComponentOwnedBehaviors", 0, 1, IS_UNIQUE, IS_ORDERED);
		addEParameter(op, ecorePackage.getEDiagnosticChain(), "diagnostics", 0, 1, IS_UNIQUE, IS_ORDERED);
		g1 = createEGenericType(ecorePackage.getEMap());
		g2 = createEGenericType(ecorePackage.getEJavaObject());
		g1.getETypeArguments().add(g2);
		g2 = createEGenericType(ecorePackage.getEJavaObject());
		g1.getETypeArguments().add(g2);
		addEParameter(op, g1, "context", 0, 1, IS_UNIQUE, IS_ORDERED);

		op = initEOperation(getXtComponent__XtComponentNestedClassifiers__DiagnosticChain_Map(), ecorePackage.getEBoolean(), "xtComponentNestedClassifiers", 0, 1, IS_UNIQUE, IS_ORDERED);
		addEParameter(op, ecorePackage.getEDiagnosticChain(), "diagnostics", 0, 1, IS_UNIQUE, IS_ORDERED);
		g1 = createEGenericType(ecorePackage.getEMap());
		g2 = createEGenericType(ecorePackage.getEJavaObject());
		g1.getETypeArguments().add(g2);
		g2 = createEGenericType(ecorePackage.getEJavaObject());
		g1.getETypeArguments().add(g2);
		addEParameter(op, g1, "context", 0, 1, IS_UNIQUE, IS_ORDERED);

		op = initEOperation(getXtComponent__XtComponentParts__DiagnosticChain_Map(), ecorePackage.getEBoolean(), "xtComponentParts", 0, 1, IS_UNIQUE, IS_ORDERED);
		addEParameter(op, ecorePackage.getEDiagnosticChain(), "diagnostics", 0, 1, IS_UNIQUE, IS_ORDERED);
		g1 = createEGenericType(ecorePackage.getEMap());
		g2 = createEGenericType(ecorePackage.getEJavaObject());
		g1.getETypeArguments().add(g2);
		g2 = createEGenericType(ecorePackage.getEJavaObject());
		g1.getETypeArguments().add(g2);
		addEParameter(op, g1, "context", 0, 1, IS_UNIQUE, IS_ORDERED);

		op = initEOperation(getXtComponent__XtComponentGeneralization__DiagnosticChain_Map(), ecorePackage.getEBoolean(), "xtComponentGeneralization", 0, 1, IS_UNIQUE, IS_ORDERED);
		addEParameter(op, ecorePackage.getEDiagnosticChain(), "diagnostics", 0, 1, IS_UNIQUE, IS_ORDERED);
		g1 = createEGenericType(ecorePackage.getEMap());
		g2 = createEGenericType(ecorePackage.getEJavaObject());
		g1.getETypeArguments().add(g2);
		g2 = createEGenericType(ecorePackage.getEJavaObject());
		g1.getETypeArguments().add(g2);
		addEParameter(op, g1, "context", 0, 1, IS_UNIQUE, IS_ORDERED);

		initEClass(xtOperationEClass, XtOperation.class, "XtOperation", !IS_ABSTRACT, !IS_INTERFACE, IS_GENERATED_INSTANCE_CLASS);

		initEClass(xtParameterEClass, XtParameter.class, "XtParameter", !IS_ABSTRACT, !IS_INTERFACE, IS_GENERATED_INSTANCE_CLASS);

		initEClass(xtReceptionEClass, XtReception.class, "XtReception", !IS_ABSTRACT, !IS_INTERFACE, IS_GENERATED_INSTANCE_CLASS);

		initEClass(xtPartEClass, XtPart.class, "XtPart", !IS_ABSTRACT, !IS_INTERFACE, IS_GENERATED_INSTANCE_CLASS);

		op = initEOperation(getXtPart__XtPartType__DiagnosticChain_Map(), ecorePackage.getEBoolean(), "xtPartType", 0, 1, IS_UNIQUE, IS_ORDERED);
		addEParameter(op, ecorePackage.getEDiagnosticChain(), "diagnostics", 0, 1, IS_UNIQUE, IS_ORDERED);
		g1 = createEGenericType(ecorePackage.getEMap());
		g2 = createEGenericType(ecorePackage.getEJavaObject());
		g1.getETypeArguments().add(g2);
		g2 = createEGenericType(ecorePackage.getEJavaObject());
		g1.getETypeArguments().add(g2);
		addEParameter(op, g1, "context", 0, 1, IS_UNIQUE, IS_ORDERED);

		op = initEOperation(getXtPart__XtPartComposition__DiagnosticChain_Map(), ecorePackage.getEBoolean(), "xtPartComposition", 0, 1, IS_UNIQUE, IS_ORDERED);
		addEParameter(op, ecorePackage.getEDiagnosticChain(), "diagnostics", 0, 1, IS_UNIQUE, IS_ORDERED);
		g1 = createEGenericType(ecorePackage.getEMap());
		g2 = createEGenericType(ecorePackage.getEJavaObject());
		g1.getETypeArguments().add(g2);
		g2 = createEGenericType(ecorePackage.getEJavaObject());
		g1.getETypeArguments().add(g2);
		addEParameter(op, g1, "context", 0, 1, IS_UNIQUE, IS_ORDERED);

		op = initEOperation(getXtPart__XtPartVisibility__DiagnosticChain_Map(), ecorePackage.getEBoolean(), "xtPartVisibility", 0, 1, IS_UNIQUE, IS_ORDERED);
		addEParameter(op, ecorePackage.getEDiagnosticChain(), "diagnostics", 0, 1, IS_UNIQUE, IS_ORDERED);
		g1 = createEGenericType(ecorePackage.getEMap());
		g2 = createEGenericType(ecorePackage.getEJavaObject());
		g1.getETypeArguments().add(g2);
		g2 = createEGenericType(ecorePackage.getEJavaObject());
		g1.getETypeArguments().add(g2);
		addEParameter(op, g1, "context", 0, 1, IS_UNIQUE, IS_ORDERED);

		initEClass(xtPortEClass, XtPort.class, "XtPort", !IS_ABSTRACT, !IS_INTERFACE, IS_GENERATED_INSTANCE_CLASS);

		op = initEOperation(getXtPort__XtPortVisibility__DiagnosticChain_Map(), ecorePackage.getEBoolean(), "xtPortVisibility", 0, 1, IS_UNIQUE, IS_ORDERED);
		addEParameter(op, ecorePackage.getEDiagnosticChain(), "diagnostics", 0, 1, IS_UNIQUE, IS_ORDERED);
		g1 = createEGenericType(ecorePackage.getEMap());
		g2 = createEGenericType(ecorePackage.getEJavaObject());
		g1.getETypeArguments().add(g2);
		g2 = createEGenericType(ecorePackage.getEJavaObject());
		g1.getETypeArguments().add(g2);
		addEParameter(op, g1, "context", 0, 1, IS_UNIQUE, IS_ORDERED);

		op = initEOperation(getXtPort__XtConnectorVisibility__DiagnosticChain_Map(), ecorePackage.getEBoolean(), "xtConnectorVisibility", 0, 1, IS_UNIQUE, IS_ORDERED);
		addEParameter(op, ecorePackage.getEDiagnosticChain(), "diagnostics", 0, 1, IS_UNIQUE, IS_ORDERED);
		g1 = createEGenericType(ecorePackage.getEMap());
		g2 = createEGenericType(ecorePackage.getEJavaObject());
		g1.getETypeArguments().add(g2);
		g2 = createEGenericType(ecorePackage.getEJavaObject());
		g1.getETypeArguments().add(g2);
		addEParameter(op, g1, "context", 0, 1, IS_UNIQUE, IS_ORDERED);

		op = initEOperation(getXtPort__XtPortBehaviorPort__DiagnosticChain_Map(), ecorePackage.getEBoolean(), "xtPortBehaviorPort", 0, 1, IS_UNIQUE, IS_ORDERED);
		addEParameter(op, ecorePackage.getEDiagnosticChain(), "diagnostics", 0, 1, IS_UNIQUE, IS_ORDERED);
		g1 = createEGenericType(ecorePackage.getEMap());
		g2 = createEGenericType(ecorePackage.getEJavaObject());
		g1.getETypeArguments().add(g2);
		g2 = createEGenericType(ecorePackage.getEJavaObject());
		g1.getETypeArguments().add(g2);
		addEParameter(op, g1, "context", 0, 1, IS_UNIQUE, IS_ORDERED);

		initEClass(xtConnectorEClass, XtConnector.class, "XtConnector", !IS_ABSTRACT, !IS_INTERFACE, IS_GENERATED_INSTANCE_CLASS);

		op = initEOperation(getXtConnector__XtConnectorConnectorEnds__DiagnosticChain_Map(), ecorePackage.getEBoolean(), "xtConnectorConnectorEnds", 0, 1, IS_UNIQUE, IS_ORDERED);
		addEParameter(op, ecorePackage.getEDiagnosticChain(), "diagnostics", 0, 1, IS_UNIQUE, IS_ORDERED);
		g1 = createEGenericType(ecorePackage.getEMap());
		g2 = createEGenericType(ecorePackage.getEJavaObject());
		g1.getETypeArguments().add(g2);
		g2 = createEGenericType(ecorePackage.getEJavaObject());
		g1.getETypeArguments().add(g2);
		addEParameter(op, g1, "context", 0, 1, IS_UNIQUE, IS_ORDERED);

		initEClass(xtProtocolContainerEClass, XtProtocolContainer.class, "XtProtocolContainer", !IS_ABSTRACT, !IS_INTERFACE, IS_GENERATED_INSTANCE_CLASS);

		initEClass(xtProtocolEClass, XtProtocol.class, "XtProtocol", !IS_ABSTRACT, !IS_INTERFACE, IS_GENERATED_INSTANCE_CLASS);
		initEReference(getXtProtocol_Base_Class(), theUMLPackage.getClass_(), null, "base_Class", null, 1, 1, XtProtocol.class, !IS_TRANSIENT, !IS_VOLATILE, IS_CHANGEABLE, !IS_COMPOSITE, IS_RESOLVE_PROXIES, !IS_UNSETTABLE, IS_UNIQUE, !IS_DERIVED, !IS_ORDERED);

		op = initEOperation(getXtProtocol__XtProtocolNestedClassifiers__DiagnosticChain_Map(), ecorePackage.getEBoolean(), "xtProtocolNestedClassifiers", 0, 1, IS_UNIQUE, IS_ORDERED);
		addEParameter(op, ecorePackage.getEDiagnosticChain(), "diagnostics", 0, 1, IS_UNIQUE, IS_ORDERED);
		g1 = createEGenericType(ecorePackage.getEMap());
		g2 = createEGenericType(ecorePackage.getEJavaObject());
		g1.getETypeArguments().add(g2);
		g2 = createEGenericType(ecorePackage.getEJavaObject());
		g1.getETypeArguments().add(g2);
		addEParameter(op, g1, "context", 0, 1, IS_UNIQUE, IS_ORDERED);

		op = initEOperation(getXtProtocol__XtProtocolBehaviors__DiagnosticChain_Map(), ecorePackage.getEBoolean(), "xtProtocolBehaviors", 0, 1, IS_UNIQUE, IS_ORDERED);
		addEParameter(op, ecorePackage.getEDiagnosticChain(), "diagnostics", 0, 1, IS_UNIQUE, IS_ORDERED);
		g1 = createEGenericType(ecorePackage.getEMap());
		g2 = createEGenericType(ecorePackage.getEJavaObject());
		g1.getETypeArguments().add(g2);
		g2 = createEGenericType(ecorePackage.getEJavaObject());
		g1.getETypeArguments().add(g2);
		addEParameter(op, g1, "context", 0, 1, IS_UNIQUE, IS_ORDERED);

		initEClass(xtMessageSetEClass, XtMessageSet.class, "XtMessageSet", !IS_ABSTRACT, !IS_INTERFACE, IS_GENERATED_INSTANCE_CLASS);

		op = initEOperation(getXtMessageSet__XtMessageSetNestedClassifiers__DiagnosticChain_Map(), ecorePackage.getEBoolean(), "xtMessageSetNestedClassifiers", 0, 1, IS_UNIQUE, IS_ORDERED);
		addEParameter(op, ecorePackage.getEDiagnosticChain(), "diagnostics", 0, 1, IS_UNIQUE, IS_ORDERED);
		g1 = createEGenericType(ecorePackage.getEMap());
		g2 = createEGenericType(ecorePackage.getEJavaObject());
		g1.getETypeArguments().add(g2);
		g2 = createEGenericType(ecorePackage.getEJavaObject());
		g1.getETypeArguments().add(g2);
		addEParameter(op, g1, "context", 0, 1, IS_UNIQUE, IS_ORDERED);

		op = initEOperation(getXtMessageSet__XtMessageSetAttributes__DiagnosticChain_Map(), ecorePackage.getEBoolean(), "xtMessageSetAttributes", 0, 1, IS_UNIQUE, IS_ORDERED);
		addEParameter(op, ecorePackage.getEDiagnosticChain(), "diagnostics", 0, 1, IS_UNIQUE, IS_ORDERED);
		g1 = createEGenericType(ecorePackage.getEMap());
		g2 = createEGenericType(ecorePackage.getEJavaObject());
		g1.getETypeArguments().add(g2);
		g2 = createEGenericType(ecorePackage.getEJavaObject());
		g1.getETypeArguments().add(g2);
		addEParameter(op, g1, "context", 0, 1, IS_UNIQUE, IS_ORDERED);

		initEClass(xtSignalEClass, XtSignal.class, "XtSignal", !IS_ABSTRACT, !IS_INTERFACE, IS_GENERATED_INSTANCE_CLASS);

		initEClass(xtDataTypeEClass, XtDataType.class, "XtDataType", !IS_ABSTRACT, !IS_INTERFACE, IS_GENERATED_INSTANCE_CLASS);

		initEClass(xtEnumerationEClass, XtEnumeration.class, "XtEnumeration", !IS_ABSTRACT, !IS_INTERFACE, IS_GENERATED_INSTANCE_CLASS);

		initEClass(xtAssociationEClass, XtAssociation.class, "XtAssociation", !IS_ABSTRACT, !IS_INTERFACE, IS_GENERATED_INSTANCE_CLASS);

		op = initEOperation(getXtAssociation__XtAssociationEndOwnership__DiagnosticChain_Map(), ecorePackage.getEBoolean(), "xtAssociationEndOwnership", 0, 1, IS_UNIQUE, IS_ORDERED);
		addEParameter(op, ecorePackage.getEDiagnosticChain(), "diagnostics", 0, 1, IS_UNIQUE, IS_ORDERED);
		g1 = createEGenericType(ecorePackage.getEMap());
		g2 = createEGenericType(ecorePackage.getEJavaObject());
		g1.getETypeArguments().add(g2);
		g2 = createEGenericType(ecorePackage.getEJavaObject());
		g1.getETypeArguments().add(g2);
		addEParameter(op, g1, "context", 0, 1, IS_UNIQUE, IS_ORDERED);

		op = initEOperation(getXtAssociation__XtAssociationEnds__DiagnosticChain_Map(), ecorePackage.getEBoolean(), "xtAssociationEnds", 0, 1, IS_UNIQUE, IS_ORDERED);
		addEParameter(op, ecorePackage.getEDiagnosticChain(), "diagnostics", 0, 1, IS_UNIQUE, IS_ORDERED);
		g1 = createEGenericType(ecorePackage.getEMap());
		g2 = createEGenericType(ecorePackage.getEJavaObject());
		g1.getETypeArguments().add(g2);
		g2 = createEGenericType(ecorePackage.getEJavaObject());
		g1.getETypeArguments().add(g2);
		addEParameter(op, g1, "context", 0, 1, IS_UNIQUE, IS_ORDERED);

		op = initEOperation(getXtAssociation__XtAssociationEndType__DiagnosticChain_Map(), ecorePackage.getEBoolean(), "xtAssociationEndType", 0, 1, IS_UNIQUE, IS_ORDERED);
		addEParameter(op, ecorePackage.getEDiagnosticChain(), "diagnostics", 0, 1, IS_UNIQUE, IS_ORDERED);
		g1 = createEGenericType(ecorePackage.getEMap());
		g2 = createEGenericType(ecorePackage.getEJavaObject());
		g1.getETypeArguments().add(g2);
		g2 = createEGenericType(ecorePackage.getEJavaObject());
		g1.getETypeArguments().add(g2);
		addEParameter(op, g1, "context", 0, 1, IS_UNIQUE, IS_ORDERED);

		op = initEOperation(getXtAssociation__XtAssociationGeneralization__DiagnosticChain_Map(), ecorePackage.getEBoolean(), "xtAssociationGeneralization", 0, 1, IS_UNIQUE, IS_ORDERED);
		addEParameter(op, ecorePackage.getEDiagnosticChain(), "diagnostics", 0, 1, IS_UNIQUE, IS_ORDERED);
		g1 = createEGenericType(ecorePackage.getEMap());
		g2 = createEGenericType(ecorePackage.getEJavaObject());
		g1.getETypeArguments().add(g2);
		g2 = createEGenericType(ecorePackage.getEJavaObject());
		g1.getETypeArguments().add(g2);
		addEParameter(op, g1, "context", 0, 1, IS_UNIQUE, IS_ORDERED);

		initEClass(xtAssociationClassEClass, XtAssociationClass.class, "XtAssociationClass", !IS_ABSTRACT, !IS_INTERFACE, IS_GENERATED_INSTANCE_CLASS);

		initEClass(xtTriggerEClass, XtTrigger.class, "XtTrigger", !IS_ABSTRACT, !IS_INTERFACE, IS_GENERATED_INSTANCE_CLASS);

		op = initEOperation(getXtTrigger__XtTriggerEvent__DiagnosticChain_Map(), ecorePackage.getEBoolean(), "xtTriggerEvent", 0, 1, IS_UNIQUE, IS_ORDERED);
		addEParameter(op, ecorePackage.getEDiagnosticChain(), "diagnostics", 0, 1, IS_UNIQUE, IS_ORDERED);
		g1 = createEGenericType(ecorePackage.getEMap());
		g2 = createEGenericType(ecorePackage.getEJavaObject());
		g1.getETypeArguments().add(g2);
		g2 = createEGenericType(ecorePackage.getEJavaObject());
		g1.getETypeArguments().add(g2);
		addEParameter(op, g1, "context", 0, 1, IS_UNIQUE, IS_ORDERED);

		initEClass(xtStateMachineEClass, XtStateMachine.class, "XtStateMachine", !IS_ABSTRACT, !IS_INTERFACE, IS_GENERATED_INSTANCE_CLASS);

		initEClass(xtRegionEClass, XtRegion.class, "XtRegion", !IS_ABSTRACT, !IS_INTERFACE, IS_GENERATED_INSTANCE_CLASS);

		initEClass(xtPseudoStateEClass, XtPseudoState.class, "XtPseudoState", !IS_ABSTRACT, !IS_INTERFACE, IS_GENERATED_INSTANCE_CLASS);

		op = initEOperation(getXtPseudoState__XtPseudostateKind__DiagnosticChain_Map(), ecorePackage.getEBoolean(), "xtPseudostateKind", 0, 1, IS_UNIQUE, IS_ORDERED);
		addEParameter(op, ecorePackage.getEDiagnosticChain(), "diagnostics", 0, 1, IS_UNIQUE, IS_ORDERED);
		g1 = createEGenericType(ecorePackage.getEMap());
		g2 = createEGenericType(ecorePackage.getEJavaObject());
		g1.getETypeArguments().add(g2);
		g2 = createEGenericType(ecorePackage.getEJavaObject());
		g1.getETypeArguments().add(g2);
		addEParameter(op, g1, "context", 0, 1, IS_UNIQUE, IS_ORDERED);

		initEClass(xtTransitionEClass, XtTransition.class, "XtTransition", !IS_ABSTRACT, !IS_INTERFACE, IS_GENERATED_INSTANCE_CLASS);

		op = initEOperation(getXtTransition__XtTransitionNoGuard__DiagnosticChain_Map(), ecorePackage.getEBoolean(), "xtTransitionNoGuard", 0, 1, IS_UNIQUE, IS_ORDERED);
		addEParameter(op, ecorePackage.getEDiagnosticChain(), "diagnostics", 0, 1, IS_UNIQUE, IS_ORDERED);
		g1 = createEGenericType(ecorePackage.getEMap());
		g2 = createEGenericType(ecorePackage.getEJavaObject());
		g1.getETypeArguments().add(g2);
		g2 = createEGenericType(ecorePackage.getEJavaObject());
		g1.getETypeArguments().add(g2);
		addEParameter(op, g1, "context", 0, 1, IS_UNIQUE, IS_ORDERED);

		initEClass(xtStateEClass, XtState.class, "XtState", !IS_ABSTRACT, !IS_INTERFACE, IS_GENERATED_INSTANCE_CLASS);

		op = initEOperation(getXtState__XStateNotComposite__DiagnosticChain_Map(), ecorePackage.getEBoolean(), "xStateNotComposite", 0, 1, IS_UNIQUE, IS_ORDERED);
		addEParameter(op, ecorePackage.getEDiagnosticChain(), "diagnostics", 0, 1, IS_UNIQUE, IS_ORDERED);
		g1 = createEGenericType(ecorePackage.getEMap());
		g2 = createEGenericType(ecorePackage.getEJavaObject());
		g1.getETypeArguments().add(g2);
		g2 = createEGenericType(ecorePackage.getEJavaObject());
		g1.getETypeArguments().add(g2);
		addEParameter(op, g1, "context", 0, 1, IS_UNIQUE, IS_ORDERED);

		initEClass(xtActivityEClass, XtActivity.class, "XtActivity", !IS_ABSTRACT, !IS_INTERFACE, IS_GENERATED_INSTANCE_CLASS);

		op = initEOperation(getXtActivity__XtActivityTextualRepresentation__DiagnosticChain_Map(), ecorePackage.getEBoolean(), "xtActivityTextualRepresentation", 0, 1, IS_UNIQUE, IS_ORDERED);
		addEParameter(op, ecorePackage.getEDiagnosticChain(), "diagnostics", 0, 1, IS_UNIQUE, IS_ORDERED);
		g1 = createEGenericType(ecorePackage.getEMap());
		g2 = createEGenericType(ecorePackage.getEJavaObject());
		g1.getETypeArguments().add(g2);
		g2 = createEGenericType(ecorePackage.getEJavaObject());
		g1.getETypeArguments().add(g2);
		addEParameter(op, g1, "context", 0, 1, IS_UNIQUE, IS_ORDERED);

		initEClass(xtConstraintEClass, XtConstraint.class, "XtConstraint", !IS_ABSTRACT, !IS_INTERFACE, IS_GENERATED_INSTANCE_CLASS);

		initEClass(xtClassEClass, XtClass.class, "XtClass", !IS_ABSTRACT, !IS_INTERFACE, IS_GENERATED_INSTANCE_CLASS);

		op = initEOperation(getXtClass__XtClassConstructors__DiagnosticChain_Map(), ecorePackage.getEBoolean(), "xtClassConstructors", 0, 1, IS_UNIQUE, IS_ORDERED);
		addEParameter(op, ecorePackage.getEDiagnosticChain(), "diagnostics", 0, 1, IS_UNIQUE, IS_ORDERED);
		g1 = createEGenericType(ecorePackage.getEMap());
		g2 = createEGenericType(ecorePackage.getEJavaObject());
		g1.getETypeArguments().add(g2);
		g2 = createEGenericType(ecorePackage.getEJavaObject());
		g1.getETypeArguments().add(g2);
		addEParameter(op, g1, "context", 0, 1, IS_UNIQUE, IS_ORDERED);

		op = initEOperation(getXtClass__XtClassClassifierBehavior__DiagnosticChain_Map(), ecorePackage.getEBoolean(), "xtClassClassifierBehavior", 0, 1, IS_UNIQUE, IS_ORDERED);
		addEParameter(op, ecorePackage.getEDiagnosticChain(), "diagnostics", 0, 1, IS_UNIQUE, IS_ORDERED);
		g1 = createEGenericType(ecorePackage.getEMap());
		g2 = createEGenericType(ecorePackage.getEJavaObject());
		g1.getETypeArguments().add(g2);
		g2 = createEGenericType(ecorePackage.getEJavaObject());
		g1.getETypeArguments().add(g2);
		addEParameter(op, g1, "context", 0, 1, IS_UNIQUE, IS_ORDERED);

		op = initEOperation(getXtClass__XtClassVisibility__DiagnosticChain_Map(), ecorePackage.getEBoolean(), "xtClassVisibility", 0, 1, IS_UNIQUE, IS_ORDERED);
		addEParameter(op, ecorePackage.getEDiagnosticChain(), "diagnostics", 0, 1, IS_UNIQUE, IS_ORDERED);
		g1 = createEGenericType(ecorePackage.getEMap());
		g2 = createEGenericType(ecorePackage.getEJavaObject());
		g1.getETypeArguments().add(g2);
		g2 = createEGenericType(ecorePackage.getEJavaObject());
		g1.getETypeArguments().add(g2);
		addEParameter(op, g1, "context", 0, 1, IS_UNIQUE, IS_ORDERED);

		op = initEOperation(getXtClass__XtClassGeneralizationSets__DiagnosticChain_Map(), ecorePackage.getEBoolean(), "xtClassGeneralizationSets", 0, 1, IS_UNIQUE, IS_ORDERED);
		addEParameter(op, ecorePackage.getEDiagnosticChain(), "diagnostics", 0, 1, IS_UNIQUE, IS_ORDERED);
		g1 = createEGenericType(ecorePackage.getEMap());
		g2 = createEGenericType(ecorePackage.getEJavaObject());
		g1.getETypeArguments().add(g2);
		g2 = createEGenericType(ecorePackage.getEJavaObject());
		g1.getETypeArguments().add(g2);
		addEParameter(op, g1, "context", 0, 1, IS_UNIQUE, IS_ORDERED);

		initEClass(xtConstrainedTypeEClass, XtConstrainedType.class, "XtConstrainedType", !IS_ABSTRACT, !IS_INTERFACE, IS_GENERATED_INSTANCE_CLASS);

		initEClass(xtOpaqueBehaviorEClass, XtOpaqueBehavior.class, "XtOpaqueBehavior", !IS_ABSTRACT, !IS_INTERFACE, IS_GENERATED_INSTANCE_CLASS);

		op = initEOperation(getXtOpaqueBehavior__XtOpaqueBehaviorLanguage__DiagnosticChain_Map(), ecorePackage.getEBoolean(), "xtOpaqueBehaviorLanguage", 0, 1, IS_UNIQUE, IS_ORDERED);
		addEParameter(op, ecorePackage.getEDiagnosticChain(), "diagnostics", 0, 1, IS_UNIQUE, IS_ORDERED);
		g1 = createEGenericType(ecorePackage.getEMap());
		g2 = createEGenericType(ecorePackage.getEJavaObject());
		g1.getETypeArguments().add(g2);
		g2 = createEGenericType(ecorePackage.getEJavaObject());
		g1.getETypeArguments().add(g2);
		addEParameter(op, g1, "context", 0, 1, IS_UNIQUE, IS_ORDERED);

		initEClass(xtGeneralizationEClass, XtGeneralization.class, "XtGeneralization", !IS_ABSTRACT, !IS_INTERFACE, IS_GENERATED_INSTANCE_CLASS);

		op = initEOperation(getXtGeneralization__XtGeneralizationGeneralizationSet__DiagnosticChain_Map(), ecorePackage.getEBoolean(), "xtGeneralizationGeneralizationSet", 0, 1, IS_UNIQUE, IS_ORDERED);
		addEParameter(op, ecorePackage.getEDiagnosticChain(), "diagnostics", 0, 1, IS_UNIQUE, IS_ORDERED);
		g1 = createEGenericType(ecorePackage.getEMap());
		g2 = createEGenericType(ecorePackage.getEJavaObject());
		g1.getETypeArguments().add(g2);
		g2 = createEGenericType(ecorePackage.getEJavaObject());
		g1.getETypeArguments().add(g2);
		addEParameter(op, g1, "context", 0, 1, IS_UNIQUE, IS_ORDERED);

		initEClass(xtGeneralizationSetEClass, XtGeneralizationSet.class, "XtGeneralizationSet", !IS_ABSTRACT, !IS_INTERFACE, IS_GENERATED_INSTANCE_CLASS);

		op = initEOperation(getXtGeneralizationSet__XtGeneralizationSet__DiagnosticChain_Map(), ecorePackage.getEBoolean(), "xtGeneralizationSet", 0, 1, IS_UNIQUE, IS_ORDERED);
		addEParameter(op, ecorePackage.getEDiagnosticChain(), "diagnostics", 0, 1, IS_UNIQUE, IS_ORDERED);
		g1 = createEGenericType(ecorePackage.getEMap());
		g2 = createEGenericType(ecorePackage.getEJavaObject());
		g1.getETypeArguments().add(g2);
		g2 = createEGenericType(ecorePackage.getEJavaObject());
		g1.getETypeArguments().add(g2);
		addEParameter(op, g1, "context", 0, 1, IS_UNIQUE, IS_ORDERED);

		// Create resource
		createResource(eNS_URI);

		// Create annotations
		// http://www.eclipse.org/uml2/2.0.0/UML
		createUMLAnnotations();
	}

	/**
	 * Initializes the annotations for <b>http://www.eclipse.org/uml2/2.0.0/UML</b>.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 */
	protected void createUMLAnnotations() {
		String source = "http://www.eclipse.org/uml2/2.0.0/UML";	
		addAnnotation
		  (this, 
		   source, 
		   new String[] {
			 "originalName", "xtUML"
		   });
	}

} //xtUMLProfilePackageImpl
