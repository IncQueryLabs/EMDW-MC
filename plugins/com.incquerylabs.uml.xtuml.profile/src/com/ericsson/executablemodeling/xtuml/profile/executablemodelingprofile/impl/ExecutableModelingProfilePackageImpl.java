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
package com.ericsson.executablemodeling.xtuml.profile.executablemodelingprofile.impl;

import com.ericsson.executablemodeling.xtuml.profile.executablemodelingprofile.ExecutableModelingProfileFactory;
import com.ericsson.executablemodeling.xtuml.profile.executablemodelingprofile.ExecutableModelingProfilePackage;
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
import com.ericsson.executablemodeling.xtuml.profile.executablemodelingprofile.XMessageKind;
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

import com.ericsson.executablemodeling.xtuml.profile.executablemodelingprofile.util.ExecutableModelingProfileValidator;

import com.ericsson.executablemodeling.xtuml.profile.xtumlprofile.impl.xtUMLProfilePackageImpl;

import com.ericsson.executablemodeling.xtuml.profile.xtumlprofile.xtUMLProfilePackage;

import org.eclipse.emf.ecore.EAttribute;
import org.eclipse.emf.ecore.EClass;
import org.eclipse.emf.ecore.EEnum;
import org.eclipse.emf.ecore.EGenericType;
import org.eclipse.emf.ecore.EOperation;
import org.eclipse.emf.ecore.EPackage;
import org.eclipse.emf.ecore.EReference;
import org.eclipse.emf.ecore.EValidator;

import org.eclipse.emf.ecore.impl.EPackageImpl;

import org.eclipse.uml2.types.TypesPackage;

import org.eclipse.uml2.uml.UMLPackage;

/**
 * <!-- begin-user-doc -->
 * An implementation of the model <b>Package</b>.
 * <!-- end-user-doc -->
 * @generated
 */
public class ExecutableModelingProfilePackageImpl extends EPackageImpl implements ExecutableModelingProfilePackage {
	/**
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 */
	private EClass xOperationEClass = null;

	/**
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 */
	private EClass xNamespaceEClass = null;

	/**
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 */
	private EClass xNamedElementEClass = null;

	/**
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 */
	private EClass xFeatureEClass = null;

	/**
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 */
	private EClass xAssociationEClass = null;

	/**
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 */
	private EClass xClassifierEClass = null;

	/**
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 */
	private EClass xBehaviorEClass = null;

	/**
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 */
	private EClass xEncapsulatedClassifierEClass = null;

	/**
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 */
	private EClass xProtocolEClass = null;

	/**
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 */
	private EClass xSignalEClass = null;

	/**
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 */
	private EClass xDataTypeEClass = null;

	/**
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 */
	private EClass xParameterEClass = null;

	/**
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 */
	private EClass xTypedElementEClass = null;

	/**
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 */
	private EClass xPropertyEClass = null;

	/**
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 */
	private EClass xMultiplicityElementEClass = null;

	/**
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 */
	private EClass xReceptionEClass = null;

	/**
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 */
	private EClass xPartEClass = null;

	/**
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 */
	private EClass xPortEClass = null;

	/**
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 */
	private EClass xConnectorEClass = null;

	/**
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 */
	private EClass xProtocolContainerEClass = null;

	/**
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 */
	private EClass xMessageSetEClass = null;

	/**
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 */
	private EClass xEnumerationEClass = null;

	/**
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 */
	private EClass xAssociationClassEClass = null;

	/**
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 */
	private EClass xTriggerEClass = null;

	/**
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 */
	private EClass xStateMachineEClass = null;

	/**
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 */
	private EClass xRegionEClass = null;

	/**
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 */
	private EClass xStateEClass = null;

	/**
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 */
	private EClass xVertexEClass = null;

	/**
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 */
	private EClass xPseudostateEClass = null;

	/**
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 */
	private EClass xTransitionEClass = null;

	/**
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 */
	private EClass xActivityEClass = null;

	/**
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 */
	private EClass xActionBehaviorEClass = null;

	/**
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 */
	private EClass xConstraintEClass = null;

	/**
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 */
	private EClass xOpaqueBehaviorEClass = null;

	/**
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 */
	private EClass xConstrainedTypeEClass = null;

	/**
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 */
	private EClass xGeneralizationEClass = null;

	/**
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 */
	private EClass xGeneralizationSetEClass = null;

	/**
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 */
	private EClass xClassEClass = null;

	/**
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 */
	private EClass xConnectorEndEClass = null;

	/**
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 */
	private EEnum xMessageKindEEnum = null;

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
	 * @see com.ericsson.executablemodeling.xtuml.profile.executablemodelingprofile.ExecutableModelingProfilePackage#eNS_URI
	 * @see #init()
	 * @generated
	 */
	private ExecutableModelingProfilePackageImpl() {
		super(eNS_URI, ExecutableModelingProfileFactory.eINSTANCE);
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
	 * <p>This method is used to initialize {@link ExecutableModelingProfilePackage#eINSTANCE} when that field is accessed.
	 * Clients should not invoke it directly. Instead, they should simply access that field to obtain the package.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @see #eNS_URI
	 * @see #createPackageContents()
	 * @see #initializePackageContents()
	 * @generated
	 */
	public static ExecutableModelingProfilePackage init() {
		if (isInited) return (ExecutableModelingProfilePackage)EPackage.Registry.INSTANCE.getEPackage(ExecutableModelingProfilePackage.eNS_URI);

		// Obtain or create and register package
		ExecutableModelingProfilePackageImpl theExecutableModelingProfilePackage = (ExecutableModelingProfilePackageImpl)(EPackage.Registry.INSTANCE.get(eNS_URI) instanceof ExecutableModelingProfilePackageImpl ? EPackage.Registry.INSTANCE.get(eNS_URI) : new ExecutableModelingProfilePackageImpl());

		isInited = true;

		// Initialize simple dependencies
		UMLPackage.eINSTANCE.eClass();

		// Obtain or create and register interdependencies
		xtUMLProfilePackageImpl thextUMLProfilePackage = (xtUMLProfilePackageImpl)(EPackage.Registry.INSTANCE.getEPackage(xtUMLProfilePackage.eNS_URI) instanceof xtUMLProfilePackageImpl ? EPackage.Registry.INSTANCE.getEPackage(xtUMLProfilePackage.eNS_URI) : xtUMLProfilePackage.eINSTANCE);

		// Create package meta-data objects
		theExecutableModelingProfilePackage.createPackageContents();
		thextUMLProfilePackage.createPackageContents();

		// Initialize created meta-data
		theExecutableModelingProfilePackage.initializePackageContents();
		thextUMLProfilePackage.initializePackageContents();

		// Register package validator
		EValidator.Registry.INSTANCE.put
			(theExecutableModelingProfilePackage, 
			 new EValidator.Descriptor() {
				 public EValidator getEValidator() {
					 return ExecutableModelingProfileValidator.INSTANCE;
				 }
			 });

		// Mark meta-data to indicate it can't be changed
		theExecutableModelingProfilePackage.freeze();

  
		// Update the registry and return the package
		EPackage.Registry.INSTANCE.put(ExecutableModelingProfilePackage.eNS_URI, theExecutableModelingProfilePackage);
		return theExecutableModelingProfilePackage;
	}

	/**
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 */
	public EClass getXOperation() {
		return xOperationEClass;
	}

	/**
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 */
	public EReference getXOperation_Base_Operation() {
		return (EReference)xOperationEClass.getEStructuralFeatures().get(0);
	}

	/**
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 */
	public EOperation getXOperation__XOperationParameters__DiagnosticChain_Map() {
		return xOperationEClass.getEOperations().get(0);
	}

	/**
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 */
	public EOperation getXOperation__XOperationOneMethod__DiagnosticChain_Map() {
		return xOperationEClass.getEOperations().get(1);
	}

	/**
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 */
	public EOperation getXOperation__XOperationImports__DiagnosticChain_Map() {
		return xOperationEClass.getEOperations().get(2);
	}

	/**
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 */
	public EOperation getXOperation__XOperationOwnedRules__DiagnosticChain_Map() {
		return xOperationEClass.getEOperations().get(3);
	}

	/**
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 */
	public EOperation getXOperation__XOperationMethods__DiagnosticChain_Map() {
		return xOperationEClass.getEOperations().get(4);
	}

	/**
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 */
	public EOperation getXOperation__XOperationConstraints__DiagnosticChain_Map() {
		return xOperationEClass.getEOperations().get(5);
	}

	/**
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 */
	public EClass getXNamespace() {
		return xNamespaceEClass;
	}

	/**
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 */
	public EReference getXNamespace_Base_Namespace() {
		return (EReference)xNamespaceEClass.getEStructuralFeatures().get(0);
	}

	/**
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 */
	public EClass getXNamedElement() {
		return xNamedElementEClass;
	}

	/**
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 */
	public EReference getXNamedElement_Base_NamedElement() {
		return (EReference)xNamedElementEClass.getEStructuralFeatures().get(0);
	}

	/**
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 */
	public EOperation getXNamedElement__XNamedElementName__DiagnosticChain_Map() {
		return xNamedElementEClass.getEOperations().get(0);
	}

	/**
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 */
	public EClass getXFeature() {
		return xFeatureEClass;
	}

	/**
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 */
	public EReference getXFeature_Base_Feature() {
		return (EReference)xFeatureEClass.getEStructuralFeatures().get(0);
	}

	/**
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 */
	public EOperation getXFeature__XFeatureClassifier__DiagnosticChain_Map() {
		return xFeatureEClass.getEOperations().get(0);
	}

	/**
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 */
	public EClass getXAssociation() {
		return xAssociationEClass;
	}

	/**
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 */
	public EReference getXAssociation_Base_Association() {
		return (EReference)xAssociationEClass.getEStructuralFeatures().get(0);
	}

	/**
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 */
	public EOperation getXAssociation__XAssociationIsBinary__DiagnosticChain_Map() {
		return xAssociationEClass.getEOperations().get(0);
	}

	/**
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 */
	public EClass getXClassifier() {
		return xClassifierEClass;
	}

	/**
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 */
	public EReference getXClassifier_Base_Classifier() {
		return (EReference)xClassifierEClass.getEStructuralFeatures().get(0);
	}

	/**
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 */
	public EOperation getXClassifier__XClassifierFeatures__DiagnosticChain_Map() {
		return xClassifierEClass.getEOperations().get(0);
	}

	/**
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 */
	public EOperation getXClassifier__XClassifierNestedClassifiers__DiagnosticChain_Map() {
		return xClassifierEClass.getEOperations().get(1);
	}

	/**
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 */
	public EOperation getXClassifier__XClassifierGenerals__DiagnosticChain_Map() {
		return xClassifierEClass.getEOperations().get(2);
	}

	/**
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 */
	public EOperation getXClassifier__XClassifierConstraints__DiagnosticChain_Map() {
		return xClassifierEClass.getEOperations().get(3);
	}

	/**
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 */
	public EClass getXBehavior() {
		return xBehaviorEClass;
	}

	/**
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 */
	public EReference getXBehavior_Base_Behavior() {
		return (EReference)xBehaviorEClass.getEStructuralFeatures().get(0);
	}

	/**
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 */
	public EOperation getXBehavior__XBehaviorNoParameterSets__DiagnosticChain_Map() {
		return xBehaviorEClass.getEOperations().get(0);
	}

	/**
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 */
	public EClass getXEncapsulatedClassifier() {
		return xEncapsulatedClassifierEClass;
	}

	/**
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 */
	public EReference getXEncapsulatedClassifier_Base_EncapsulatedClassifier() {
		return (EReference)xEncapsulatedClassifierEClass.getEStructuralFeatures().get(0);
	}

	/**
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 */
	public EAttribute getXEncapsulatedClassifier_IsExternal() {
		return (EAttribute)xEncapsulatedClassifierEClass.getEStructuralFeatures().get(1);
	}

	/**
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 */
	public EOperation getXEncapsulatedClassifier__XEncapsulatedClassifierPorts__DiagnosticChain_Map() {
		return xEncapsulatedClassifierEClass.getEOperations().get(0);
	}

	/**
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 */
	public EOperation getXEncapsulatedClassifier__XEncapsulatedClassifierconnectors__DiagnosticChain_Map() {
		return xEncapsulatedClassifierEClass.getEOperations().get(1);
	}

	/**
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 */
	public EOperation getXEncapsulatedClassifier__XEncapsulatedClassifierExternal__DiagnosticChain_Map() {
		return xEncapsulatedClassifierEClass.getEOperations().get(2);
	}

	/**
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 */
	public EClass getXProtocol() {
		return xProtocolEClass;
	}

	/**
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 */
	public EReference getXProtocol_Base_BehavioredClassifier() {
		return (EReference)xProtocolEClass.getEStructuralFeatures().get(0);
	}

	/**
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 */
	public EOperation getXProtocol__XProtocolIncomingInterface__DiagnosticChain_Map() {
		return xProtocolEClass.getEOperations().get(0);
	}

	/**
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 */
	public EOperation getXProtocol__XProtocolProtocolContainer__DiagnosticChain_Map() {
		return xProtocolEClass.getEOperations().get(1);
	}

	/**
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 */
	public EOperation getXProtocol__XProtocolOutgoingInterface__DiagnosticChain_Map() {
		return xProtocolEClass.getEOperations().get(2);
	}

	/**
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 */
	public EOperation getXProtocol__XProtocolSymmetricInterface__DiagnosticChain_Map() {
		return xProtocolEClass.getEOperations().get(3);
	}

	/**
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 */
	public EClass getXSignal() {
		return xSignalEClass;
	}

	/**
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 */
	public EReference getXSignal_Base_Signal() {
		return (EReference)xSignalEClass.getEStructuralFeatures().get(0);
	}

	/**
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 */
	public EOperation getXSignal__XSignalVisibility__DiagnosticChain_Map() {
		return xSignalEClass.getEOperations().get(0);
	}

	/**
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 */
	public EClass getXDataType() {
		return xDataTypeEClass;
	}

	/**
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 */
	public EReference getXDataType_Base_DataType() {
		return (EReference)xDataTypeEClass.getEStructuralFeatures().get(0);
	}

	/**
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 */
	public EOperation getXDataType__XDataTypeOperations__DiagnosticChain_Map() {
		return xDataTypeEClass.getEOperations().get(0);
	}

	/**
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 */
	public EClass getXParameter() {
		return xParameterEClass;
	}

	/**
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 */
	public EReference getXParameter_Base_Parameter() {
		return (EReference)xParameterEClass.getEStructuralFeatures().get(0);
	}

	/**
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 */
	public EClass getXTypedElement() {
		return xTypedElementEClass;
	}

	/**
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 */
	public EReference getXTypedElement_Base_TypedElement() {
		return (EReference)xTypedElementEClass.getEStructuralFeatures().get(0);
	}

	/**
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 */
	public EOperation getXTypedElement__XTypedElementType__DiagnosticChain_Map() {
		return xTypedElementEClass.getEOperations().get(0);
	}

	/**
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 */
	public EClass getXProperty() {
		return xPropertyEClass;
	}

	/**
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 */
	public EReference getXProperty_Base_Property() {
		return (EReference)xPropertyEClass.getEStructuralFeatures().get(0);
	}

	/**
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 */
	public EClass getXMultiplicityElement() {
		return xMultiplicityElementEClass;
	}

	/**
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 */
	public EReference getXMultiplicityElement_Base_MultiplicityElement() {
		return (EReference)xMultiplicityElementEClass.getEStructuralFeatures().get(0);
	}

	/**
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 */
	public EAttribute getXMultiplicityElement_IsOrderedByValue() {
		return (EAttribute)xMultiplicityElementEClass.getEStructuralFeatures().get(1);
	}

	/**
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 */
	public EReference getXMultiplicityElement_Key() {
		return (EReference)xMultiplicityElementEClass.getEStructuralFeatures().get(2);
	}

	/**
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 */
	public EAttribute getXMultiplicityElement_IsDescending() {
		return (EAttribute)xMultiplicityElementEClass.getEStructuralFeatures().get(3);
	}

	/**
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 */
	public EOperation getXMultiplicityElement__XMultiplicityElementIsOrderedByValue__DiagnosticChain_Map() {
		return xMultiplicityElementEClass.getEOperations().get(0);
	}

	/**
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 */
	public EOperation getXMultiplicityElement__XMultiplicityElementKeys__DiagnosticChain_Map() {
		return xMultiplicityElementEClass.getEOperations().get(1);
	}

	/**
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 */
	public EClass getXReception() {
		return xReceptionEClass;
	}

	/**
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 */
	public EReference getXReception_Base_Reception() {
		return (EReference)xReceptionEClass.getEStructuralFeatures().get(0);
	}

	/**
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 */
	public EOperation getXReception__XReceptionSignal__DiagnosticChain_Map() {
		return xReceptionEClass.getEOperations().get(0);
	}

	/**
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 */
	public EClass getXPart() {
		return xPartEClass;
	}

	/**
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 */
	public EReference getXPart_Base_Property() {
		return (EReference)xPartEClass.getEStructuralFeatures().get(0);
	}

	/**
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 */
	public EOperation getXPart__XPartClassifier__DiagnosticChain_Map() {
		return xPartEClass.getEOperations().get(0);
	}

	/**
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 */
	public EClass getXPort() {
		return xPortEClass;
	}

	/**
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 */
	public EReference getXPort_Base_Port() {
		return (EReference)xPortEClass.getEStructuralFeatures().get(0);
	}

	/**
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 */
	public EOperation getXPort__XPortClassifier__DiagnosticChain_Map() {
		return xPortEClass.getEOperations().get(0);
	}

	/**
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 */
	public EOperation getXPort__XPortOrderingUniqueness__DiagnosticChain_Map() {
		return xPortEClass.getEOperations().get(1);
	}

	/**
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 */
	public EOperation getXPort__XPortType__DiagnosticChain_Map() {
		return xPortEClass.getEOperations().get(2);
	}

	/**
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 */
	public EOperation getXPort__XPortBehaviorPort__DiagnosticChain_Map() {
		return xPortEClass.getEOperations().get(3);
	}

	/**
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 */
	public EOperation getXPort__XPortVisibility__DiagnosticChain_Map() {
		return xPortEClass.getEOperations().get(4);
	}

	/**
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 */
	public EClass getXConnector() {
		return xConnectorEClass;
	}

	/**
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 */
	public EReference getXConnector_Base_Connector() {
		return (EReference)xConnectorEClass.getEStructuralFeatures().get(0);
	}

	/**
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 */
	public EOperation getXConnector__XConnectorClassifier__DiagnosticChain_Map() {
		return xConnectorEClass.getEOperations().get(0);
	}

	/**
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 */
	public EOperation getXConnector__XConnectorEnds__DiagnosticChain_Map() {
		return xConnectorEClass.getEOperations().get(1);
	}

	/**
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 */
	public EOperation getXConnector__XtConnectorType__DiagnosticChain_Map() {
		return xConnectorEClass.getEOperations().get(2);
	}

	/**
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 */
	public EClass getXProtocolContainer() {
		return xProtocolContainerEClass;
	}

	/**
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 */
	public EReference getXProtocolContainer_Base_Package() {
		return (EReference)xProtocolContainerEClass.getEStructuralFeatures().get(0);
	}

	/**
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 */
	public EOperation getXProtocolContainer__XProtocolContainerProtocol__DiagnosticChain_Map() {
		return xProtocolContainerEClass.getEOperations().get(0);
	}

	/**
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 */
	public EClass getXMessageSet() {
		return xMessageSetEClass;
	}

	/**
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 */
	public EReference getXMessageSet_Base_Interface() {
		return (EReference)xMessageSetEClass.getEStructuralFeatures().get(0);
	}

	/**
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 */
	public EAttribute getXMessageSet_MessageKind() {
		return (EAttribute)xMessageSetEClass.getEStructuralFeatures().get(1);
	}

	/**
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 */
	public EOperation getXMessageSet__XMessageSetIncoming__DiagnosticChain_Map() {
		return xMessageSetEClass.getEOperations().get(0);
	}

	/**
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 */
	public EOperation getXMessageSet__XMessageSetOutgoing__DiagnosticChain_Map() {
		return xMessageSetEClass.getEOperations().get(1);
	}

	/**
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 */
	public EOperation getXMessageSet__XMessageSetSymmetric__DiagnosticChain_Map() {
		return xMessageSetEClass.getEOperations().get(2);
	}

	/**
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 */
	public EClass getXEnumeration() {
		return xEnumerationEClass;
	}

	/**
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 */
	public EReference getXEnumeration_Base_Enumeration() {
		return (EReference)xEnumerationEClass.getEStructuralFeatures().get(0);
	}

	/**
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 */
	public EOperation getXEnumeration__XEnumerationAttributes__DiagnosticChain_Map() {
		return xEnumerationEClass.getEOperations().get(0);
	}

	/**
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 */
	public EClass getXAssociationClass() {
		return xAssociationClassEClass;
	}

	/**
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 */
	public EReference getXAssociationClass_Base_AssociationClass() {
		return (EReference)xAssociationClassEClass.getEStructuralFeatures().get(0);
	}

	/**
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 */
	public EClass getXTrigger() {
		return xTriggerEClass;
	}

	/**
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 */
	public EReference getXTrigger_Base_Trigger() {
		return (EReference)xTriggerEClass.getEStructuralFeatures().get(0);
	}

	/**
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 */
	public EOperation getXTrigger__XTriggerSignalReception__DiagnosticChain_Map() {
		return xTriggerEClass.getEOperations().get(0);
	}

	/**
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 */
	public EOperation getXTrigger__XTriggerEvents__DiagnosticChain_Map() {
		return xTriggerEClass.getEOperations().get(1);
	}

	/**
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 */
	public EOperation getXTrigger__XTriggerCalledOperation__DiagnosticChain_Map() {
		return xTriggerEClass.getEOperations().get(2);
	}

	/**
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 */
	public EClass getXStateMachine() {
		return xStateMachineEClass;
	}

	/**
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 */
	public EReference getXStateMachine_Base_StateMachine() {
		return (EReference)xStateMachineEClass.getEStructuralFeatures().get(0);
	}

	/**
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 */
	public EOperation getXStateMachine__XStateMachineOneRegion__DiagnosticChain_Map() {
		return xStateMachineEClass.getEOperations().get(0);
	}

	/**
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 */
	public EOperation getXStateMachine__XStateMachineInitialState__DiagnosticChain_Map() {
		return xStateMachineEClass.getEOperations().get(1);
	}

	/**
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 */
	public EOperation getXStateMachine__XStateMachineContext__DiagnosticChain_Map() {
		return xStateMachineEClass.getEOperations().get(2);
	}

	/**
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 */
	public EOperation getXStateMachine__XStateMachineNoParameters__DiagnosticChain_Map() {
		return xStateMachineEClass.getEOperations().get(3);
	}

	/**
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 */
	public EOperation getXStateMachine__XStateMachineRegions__DiagnosticChain_Map() {
		return xStateMachineEClass.getEOperations().get(4);
	}

	/**
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 */
	public EClass getXRegion() {
		return xRegionEClass;
	}

	/**
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 */
	public EReference getXRegion_Base_Region() {
		return (EReference)xRegionEClass.getEStructuralFeatures().get(0);
	}

	/**
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 */
	public EOperation getXRegion__XRegionSubvertexes__DiagnosticChain_Map() {
		return xRegionEClass.getEOperations().get(0);
	}

	/**
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 */
	public EOperation getXRegion__XRegionTransitions__DiagnosticChain_Map() {
		return xRegionEClass.getEOperations().get(1);
	}

	/**
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 */
	public EClass getXState() {
		return xStateEClass;
	}

	/**
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 */
	public EReference getXState_Base_State() {
		return (EReference)xStateEClass.getEStructuralFeatures().get(0);
	}

	/**
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 */
	public EOperation getXState__XStateBehaviors__DiagnosticChain_Map() {
		return xStateEClass.getEOperations().get(0);
	}

	/**
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 */
	public EOperation getXState__XStateNoDoActivity__DiagnosticChain_Map() {
		return xStateEClass.getEOperations().get(1);
	}

	/**
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 */
	public EOperation getXState__XStateOneRegion__DiagnosticChain_Map() {
		return xStateEClass.getEOperations().get(2);
	}

	/**
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 */
	public EOperation getXState__XStateNoSubmachine__DiagnosticChain_Map() {
		return xStateEClass.getEOperations().get(3);
	}

	/**
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 */
	public EOperation getXState__XStateRegions__DiagnosticChain_Map() {
		return xStateEClass.getEOperations().get(4);
	}

	/**
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 */
	public EClass getXVertex() {
		return xVertexEClass;
	}

	/**
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 */
	public EReference getXVertex_Base_Vertex() {
		return (EReference)xVertexEClass.getEStructuralFeatures().get(0);
	}

	/**
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 */
	public EClass getXPseudostate() {
		return xPseudostateEClass;
	}

	/**
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 */
	public EReference getXPseudostate_Base_Pseudostate() {
		return (EReference)xPseudostateEClass.getEStructuralFeatures().get(0);
	}

	/**
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 */
	public EOperation getXPseudostate__XPsuedostateKind__DiagnosticChain_Map() {
		return xPseudostateEClass.getEOperations().get(0);
	}

	/**
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 */
	public EClass getXTransition() {
		return xTransitionEClass;
	}

	/**
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 */
	public EReference getXTransition_Base_Transition() {
		return (EReference)xTransitionEClass.getEStructuralFeatures().get(0);
	}

	/**
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 */
	public EOperation getXTransition__XTransitionTrigger__DiagnosticChain_Map() {
		return xTransitionEClass.getEOperations().get(0);
	}

	/**
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 */
	public EOperation getXTransition__XTransitionGuard__DiagnosticChain_Map() {
		return xTransitionEClass.getEOperations().get(1);
	}

	/**
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 */
	public EOperation getXTransition__XTransitionEffect__DiagnosticChain_Map() {
		return xTransitionEClass.getEOperations().get(2);
	}

	/**
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 */
	public EClass getXActivity() {
		return xActivityEClass;
	}

	/**
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 */
	public EReference getXActivity_Base_Activity() {
		return (EReference)xActivityEClass.getEStructuralFeatures().get(0);
	}

	/**
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 */
	public EOperation getXActivity__XActivityParameters__DiagnosticChain_Map() {
		return xActivityEClass.getEOperations().get(0);
	}

	/**
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 */
	public EOperation getXActivity__XActivityTextualRepresentation__DiagnosticChain_Map() {
		return xActivityEClass.getEOperations().get(1);
	}

	/**
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 */
	public EClass getXActionBehavior() {
		return xActionBehaviorEClass;
	}

	/**
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 */
	public EClass getXConstraint() {
		return xConstraintEClass;
	}

	/**
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 */
	public EReference getXConstraint_Base_Constraint() {
		return (EReference)xConstraintEClass.getEStructuralFeatures().get(0);
	}

	/**
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 */
	public EOperation getXConstraint__XConstraintSpecification__DiagnosticChain_Map() {
		return xConstraintEClass.getEOperations().get(0);
	}

	/**
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 */
	public EOperation getXConstraint__XConstraintBehavior__DiagnosticChain_Map() {
		return xConstraintEClass.getEOperations().get(1);
	}

	/**
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 */
	public EClass getXOpaqueBehavior() {
		return xOpaqueBehaviorEClass;
	}

	/**
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 */
	public EReference getXOpaqueBehavior_Base_OpaqueBehavior() {
		return (EReference)xOpaqueBehaviorEClass.getEStructuralFeatures().get(0);
	}

	/**
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 */
	public EAttribute getXOpaqueBehavior_IsExternal() {
		return (EAttribute)xOpaqueBehaviorEClass.getEStructuralFeatures().get(1);
	}

	/**
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 */
	public EOperation getXOpaqueBehavior__XOpaqueBehaviorExternal__DiagnosticChain_Map() {
		return xOpaqueBehaviorEClass.getEOperations().get(0);
	}

	/**
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 */
	public EClass getXConstrainedType() {
		return xConstrainedTypeEClass;
	}

	/**
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 */
	public EReference getXConstrainedType_Base_PrimitiveType() {
		return (EReference)xConstrainedTypeEClass.getEStructuralFeatures().get(0);
	}

	/**
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 */
	public EReference getXConstrainedType_LowerBound() {
		return (EReference)xConstrainedTypeEClass.getEStructuralFeatures().get(1);
	}

	/**
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 */
	public EReference getXConstrainedType_UpperBound() {
		return (EReference)xConstrainedTypeEClass.getEStructuralFeatures().get(2);
	}

	/**
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 */
	public EAttribute getXConstrainedType_IsLowerBoundExclusive() {
		return (EAttribute)xConstrainedTypeEClass.getEStructuralFeatures().get(3);
	}

	/**
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 */
	public EAttribute getXConstrainedType_IsUpperBoundExclusive() {
		return (EAttribute)xConstrainedTypeEClass.getEStructuralFeatures().get(4);
	}

	/**
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 */
	public EOperation getXConstrainedType__XConstrainedTypePrimitiveType__DiagnosticChain_Map() {
		return xConstrainedTypeEClass.getEOperations().get(0);
	}

	/**
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 */
	public EOperation getXConstrainedType__XConstrainedTypeBounds__DiagnosticChain_Map() {
		return xConstrainedTypeEClass.getEOperations().get(1);
	}

	/**
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 */
	public EClass getXGeneralization() {
		return xGeneralizationEClass;
	}

	/**
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 */
	public EReference getXGeneralization_Base_Generalization() {
		return (EReference)xGeneralizationEClass.getEStructuralFeatures().get(0);
	}

	/**
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 */
	public EOperation getXGeneralization__XGeneralizationClassifiers__DiagnosticChain_Map() {
		return xGeneralizationEClass.getEOperations().get(0);
	}

	/**
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 */
	public EOperation getXGeneralization__XGeneralizationGeneralizationSet__DiagnosticChain_Map() {
		return xGeneralizationEClass.getEOperations().get(1);
	}

	/**
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 */
	public EClass getXGeneralizationSet() {
		return xGeneralizationSetEClass;
	}

	/**
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 */
	public EReference getXGeneralizationSet_Base_GeneralizationSet() {
		return (EReference)xGeneralizationSetEClass.getEStructuralFeatures().get(0);
	}

	/**
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 */
	public EClass getXClass() {
		return xClassEClass;
	}

	/**
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 */
	public EReference getXClass_Base_Class() {
		return (EReference)xClassEClass.getEStructuralFeatures().get(0);
	}

	/**
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 */
	public EAttribute getXClass_IsExternal() {
		return (EAttribute)xClassEClass.getEStructuralFeatures().get(1);
	}

	/**
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 */
	public EOperation getXClass__XClassMetaclass__DiagnosticChain_Map() {
		return xClassEClass.getEOperations().get(0);
	}

	/**
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 */
	public EOperation getXClass__XClassNestedClassifiers__DiagnosticChain_Map() {
		return xClassEClass.getEOperations().get(1);
	}

	/**
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 */
	public EOperation getXClass__XClassExternal__DiagnosticChain_Map() {
		return xClassEClass.getEOperations().get(2);
	}

	/**
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 */
	public EClass getXConnectorEnd() {
		return xConnectorEndEClass;
	}

	/**
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 */
	public EReference getXConnectorEnd_Base_ConnectorEnd() {
		return (EReference)xConnectorEndEClass.getEStructuralFeatures().get(0);
	}

	/**
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 */
	public EOperation getXConnectorEnd__XConnectorEndConnector__DiagnosticChain_Map() {
		return xConnectorEndEClass.getEOperations().get(0);
	}

	/**
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 */
	public EOperation getXConnectorEnd__XConnectorEndRole__DiagnosticChain_Map() {
		return xConnectorEndEClass.getEOperations().get(1);
	}

	/**
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 */
	public EOperation getXConnectorEnd__XConnectorEndUniqueness__DiagnosticChain_Map() {
		return xConnectorEndEClass.getEOperations().get(2);
	}

	/**
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 */
	public EEnum getXMessageKind() {
		return xMessageKindEEnum;
	}

	/**
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 */
	public ExecutableModelingProfileFactory getExecutableModelingProfileFactory() {
		return (ExecutableModelingProfileFactory)getEFactoryInstance();
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
		xOperationEClass = createEClass(XOPERATION);
		createEReference(xOperationEClass, XOPERATION__BASE_OPERATION);
		createEOperation(xOperationEClass, XOPERATION___XOPERATION_PARAMETERS__DIAGNOSTICCHAIN_MAP);
		createEOperation(xOperationEClass, XOPERATION___XOPERATION_ONE_METHOD__DIAGNOSTICCHAIN_MAP);
		createEOperation(xOperationEClass, XOPERATION___XOPERATION_IMPORTS__DIAGNOSTICCHAIN_MAP);
		createEOperation(xOperationEClass, XOPERATION___XOPERATION_OWNED_RULES__DIAGNOSTICCHAIN_MAP);
		createEOperation(xOperationEClass, XOPERATION___XOPERATION_METHODS__DIAGNOSTICCHAIN_MAP);
		createEOperation(xOperationEClass, XOPERATION___XOPERATION_CONSTRAINTS__DIAGNOSTICCHAIN_MAP);

		xNamespaceEClass = createEClass(XNAMESPACE);
		createEReference(xNamespaceEClass, XNAMESPACE__BASE_NAMESPACE);

		xNamedElementEClass = createEClass(XNAMED_ELEMENT);
		createEReference(xNamedElementEClass, XNAMED_ELEMENT__BASE_NAMED_ELEMENT);
		createEOperation(xNamedElementEClass, XNAMED_ELEMENT___XNAMED_ELEMENT_NAME__DIAGNOSTICCHAIN_MAP);

		xFeatureEClass = createEClass(XFEATURE);
		createEReference(xFeatureEClass, XFEATURE__BASE_FEATURE);
		createEOperation(xFeatureEClass, XFEATURE___XFEATURE_CLASSIFIER__DIAGNOSTICCHAIN_MAP);

		xAssociationEClass = createEClass(XASSOCIATION);
		createEReference(xAssociationEClass, XASSOCIATION__BASE_ASSOCIATION);
		createEOperation(xAssociationEClass, XASSOCIATION___XASSOCIATION_IS_BINARY__DIAGNOSTICCHAIN_MAP);

		xClassifierEClass = createEClass(XCLASSIFIER);
		createEReference(xClassifierEClass, XCLASSIFIER__BASE_CLASSIFIER);
		createEOperation(xClassifierEClass, XCLASSIFIER___XCLASSIFIER_FEATURES__DIAGNOSTICCHAIN_MAP);
		createEOperation(xClassifierEClass, XCLASSIFIER___XCLASSIFIER_NESTED_CLASSIFIERS__DIAGNOSTICCHAIN_MAP);
		createEOperation(xClassifierEClass, XCLASSIFIER___XCLASSIFIER_GENERALS__DIAGNOSTICCHAIN_MAP);
		createEOperation(xClassifierEClass, XCLASSIFIER___XCLASSIFIER_CONSTRAINTS__DIAGNOSTICCHAIN_MAP);

		xBehaviorEClass = createEClass(XBEHAVIOR);
		createEReference(xBehaviorEClass, XBEHAVIOR__BASE_BEHAVIOR);
		createEOperation(xBehaviorEClass, XBEHAVIOR___XBEHAVIOR_NO_PARAMETER_SETS__DIAGNOSTICCHAIN_MAP);

		xEncapsulatedClassifierEClass = createEClass(XENCAPSULATED_CLASSIFIER);
		createEReference(xEncapsulatedClassifierEClass, XENCAPSULATED_CLASSIFIER__BASE_ENCAPSULATED_CLASSIFIER);
		createEAttribute(xEncapsulatedClassifierEClass, XENCAPSULATED_CLASSIFIER__IS_EXTERNAL);
		createEOperation(xEncapsulatedClassifierEClass, XENCAPSULATED_CLASSIFIER___XENCAPSULATED_CLASSIFIER_PORTS__DIAGNOSTICCHAIN_MAP);
		createEOperation(xEncapsulatedClassifierEClass, XENCAPSULATED_CLASSIFIER___XENCAPSULATED_CLASSIFIERCONNECTORS__DIAGNOSTICCHAIN_MAP);
		createEOperation(xEncapsulatedClassifierEClass, XENCAPSULATED_CLASSIFIER___XENCAPSULATED_CLASSIFIER_EXTERNAL__DIAGNOSTICCHAIN_MAP);

		xProtocolEClass = createEClass(XPROTOCOL);
		createEReference(xProtocolEClass, XPROTOCOL__BASE_BEHAVIORED_CLASSIFIER);
		createEOperation(xProtocolEClass, XPROTOCOL___XPROTOCOL_INCOMING_INTERFACE__DIAGNOSTICCHAIN_MAP);
		createEOperation(xProtocolEClass, XPROTOCOL___XPROTOCOL_PROTOCOL_CONTAINER__DIAGNOSTICCHAIN_MAP);
		createEOperation(xProtocolEClass, XPROTOCOL___XPROTOCOL_OUTGOING_INTERFACE__DIAGNOSTICCHAIN_MAP);
		createEOperation(xProtocolEClass, XPROTOCOL___XPROTOCOL_SYMMETRIC_INTERFACE__DIAGNOSTICCHAIN_MAP);

		xSignalEClass = createEClass(XSIGNAL);
		createEReference(xSignalEClass, XSIGNAL__BASE_SIGNAL);
		createEOperation(xSignalEClass, XSIGNAL___XSIGNAL_VISIBILITY__DIAGNOSTICCHAIN_MAP);

		xDataTypeEClass = createEClass(XDATA_TYPE);
		createEReference(xDataTypeEClass, XDATA_TYPE__BASE_DATA_TYPE);
		createEOperation(xDataTypeEClass, XDATA_TYPE___XDATA_TYPE_OPERATIONS__DIAGNOSTICCHAIN_MAP);

		xParameterEClass = createEClass(XPARAMETER);
		createEReference(xParameterEClass, XPARAMETER__BASE_PARAMETER);

		xTypedElementEClass = createEClass(XTYPED_ELEMENT);
		createEReference(xTypedElementEClass, XTYPED_ELEMENT__BASE_TYPED_ELEMENT);
		createEOperation(xTypedElementEClass, XTYPED_ELEMENT___XTYPED_ELEMENT_TYPE__DIAGNOSTICCHAIN_MAP);

		xPropertyEClass = createEClass(XPROPERTY);
		createEReference(xPropertyEClass, XPROPERTY__BASE_PROPERTY);

		xMultiplicityElementEClass = createEClass(XMULTIPLICITY_ELEMENT);
		createEReference(xMultiplicityElementEClass, XMULTIPLICITY_ELEMENT__BASE_MULTIPLICITY_ELEMENT);
		createEAttribute(xMultiplicityElementEClass, XMULTIPLICITY_ELEMENT__IS_ORDERED_BY_VALUE);
		createEReference(xMultiplicityElementEClass, XMULTIPLICITY_ELEMENT__KEY);
		createEAttribute(xMultiplicityElementEClass, XMULTIPLICITY_ELEMENT__IS_DESCENDING);
		createEOperation(xMultiplicityElementEClass, XMULTIPLICITY_ELEMENT___XMULTIPLICITY_ELEMENT_IS_ORDERED_BY_VALUE__DIAGNOSTICCHAIN_MAP);
		createEOperation(xMultiplicityElementEClass, XMULTIPLICITY_ELEMENT___XMULTIPLICITY_ELEMENT_KEYS__DIAGNOSTICCHAIN_MAP);

		xReceptionEClass = createEClass(XRECEPTION);
		createEReference(xReceptionEClass, XRECEPTION__BASE_RECEPTION);
		createEOperation(xReceptionEClass, XRECEPTION___XRECEPTION_SIGNAL__DIAGNOSTICCHAIN_MAP);

		xPartEClass = createEClass(XPART);
		createEReference(xPartEClass, XPART__BASE_PROPERTY);
		createEOperation(xPartEClass, XPART___XPART_CLASSIFIER__DIAGNOSTICCHAIN_MAP);

		xPortEClass = createEClass(XPORT);
		createEReference(xPortEClass, XPORT__BASE_PORT);
		createEOperation(xPortEClass, XPORT___XPORT_CLASSIFIER__DIAGNOSTICCHAIN_MAP);
		createEOperation(xPortEClass, XPORT___XPORT_ORDERING_UNIQUENESS__DIAGNOSTICCHAIN_MAP);
		createEOperation(xPortEClass, XPORT___XPORT_TYPE__DIAGNOSTICCHAIN_MAP);
		createEOperation(xPortEClass, XPORT___XPORT_BEHAVIOR_PORT__DIAGNOSTICCHAIN_MAP);
		createEOperation(xPortEClass, XPORT___XPORT_VISIBILITY__DIAGNOSTICCHAIN_MAP);

		xConnectorEClass = createEClass(XCONNECTOR);
		createEReference(xConnectorEClass, XCONNECTOR__BASE_CONNECTOR);
		createEOperation(xConnectorEClass, XCONNECTOR___XCONNECTOR_CLASSIFIER__DIAGNOSTICCHAIN_MAP);
		createEOperation(xConnectorEClass, XCONNECTOR___XCONNECTOR_ENDS__DIAGNOSTICCHAIN_MAP);
		createEOperation(xConnectorEClass, XCONNECTOR___XT_CONNECTOR_TYPE__DIAGNOSTICCHAIN_MAP);

		xProtocolContainerEClass = createEClass(XPROTOCOL_CONTAINER);
		createEReference(xProtocolContainerEClass, XPROTOCOL_CONTAINER__BASE_PACKAGE);
		createEOperation(xProtocolContainerEClass, XPROTOCOL_CONTAINER___XPROTOCOL_CONTAINER_PROTOCOL__DIAGNOSTICCHAIN_MAP);

		xMessageSetEClass = createEClass(XMESSAGE_SET);
		createEReference(xMessageSetEClass, XMESSAGE_SET__BASE_INTERFACE);
		createEAttribute(xMessageSetEClass, XMESSAGE_SET__MESSAGE_KIND);
		createEOperation(xMessageSetEClass, XMESSAGE_SET___XMESSAGE_SET_INCOMING__DIAGNOSTICCHAIN_MAP);
		createEOperation(xMessageSetEClass, XMESSAGE_SET___XMESSAGE_SET_OUTGOING__DIAGNOSTICCHAIN_MAP);
		createEOperation(xMessageSetEClass, XMESSAGE_SET___XMESSAGE_SET_SYMMETRIC__DIAGNOSTICCHAIN_MAP);

		xEnumerationEClass = createEClass(XENUMERATION);
		createEReference(xEnumerationEClass, XENUMERATION__BASE_ENUMERATION);
		createEOperation(xEnumerationEClass, XENUMERATION___XENUMERATION_ATTRIBUTES__DIAGNOSTICCHAIN_MAP);

		xAssociationClassEClass = createEClass(XASSOCIATION_CLASS);
		createEReference(xAssociationClassEClass, XASSOCIATION_CLASS__BASE_ASSOCIATION_CLASS);

		xTriggerEClass = createEClass(XTRIGGER);
		createEReference(xTriggerEClass, XTRIGGER__BASE_TRIGGER);
		createEOperation(xTriggerEClass, XTRIGGER___XTRIGGER_SIGNAL_RECEPTION__DIAGNOSTICCHAIN_MAP);
		createEOperation(xTriggerEClass, XTRIGGER___XTRIGGER_EVENTS__DIAGNOSTICCHAIN_MAP);
		createEOperation(xTriggerEClass, XTRIGGER___XTRIGGER_CALLED_OPERATION__DIAGNOSTICCHAIN_MAP);

		xStateMachineEClass = createEClass(XSTATE_MACHINE);
		createEReference(xStateMachineEClass, XSTATE_MACHINE__BASE_STATE_MACHINE);
		createEOperation(xStateMachineEClass, XSTATE_MACHINE___XSTATE_MACHINE_ONE_REGION__DIAGNOSTICCHAIN_MAP);
		createEOperation(xStateMachineEClass, XSTATE_MACHINE___XSTATE_MACHINE_INITIAL_STATE__DIAGNOSTICCHAIN_MAP);
		createEOperation(xStateMachineEClass, XSTATE_MACHINE___XSTATE_MACHINE_CONTEXT__DIAGNOSTICCHAIN_MAP);
		createEOperation(xStateMachineEClass, XSTATE_MACHINE___XSTATE_MACHINE_NO_PARAMETERS__DIAGNOSTICCHAIN_MAP);
		createEOperation(xStateMachineEClass, XSTATE_MACHINE___XSTATE_MACHINE_REGIONS__DIAGNOSTICCHAIN_MAP);

		xRegionEClass = createEClass(XREGION);
		createEReference(xRegionEClass, XREGION__BASE_REGION);
		createEOperation(xRegionEClass, XREGION___XREGION_SUBVERTEXES__DIAGNOSTICCHAIN_MAP);
		createEOperation(xRegionEClass, XREGION___XREGION_TRANSITIONS__DIAGNOSTICCHAIN_MAP);

		xStateEClass = createEClass(XSTATE);
		createEReference(xStateEClass, XSTATE__BASE_STATE);
		createEOperation(xStateEClass, XSTATE___XSTATE_BEHAVIORS__DIAGNOSTICCHAIN_MAP);
		createEOperation(xStateEClass, XSTATE___XSTATE_NO_DO_ACTIVITY__DIAGNOSTICCHAIN_MAP);
		createEOperation(xStateEClass, XSTATE___XSTATE_ONE_REGION__DIAGNOSTICCHAIN_MAP);
		createEOperation(xStateEClass, XSTATE___XSTATE_NO_SUBMACHINE__DIAGNOSTICCHAIN_MAP);
		createEOperation(xStateEClass, XSTATE___XSTATE_REGIONS__DIAGNOSTICCHAIN_MAP);

		xVertexEClass = createEClass(XVERTEX);
		createEReference(xVertexEClass, XVERTEX__BASE_VERTEX);

		xPseudostateEClass = createEClass(XPSEUDOSTATE);
		createEReference(xPseudostateEClass, XPSEUDOSTATE__BASE_PSEUDOSTATE);
		createEOperation(xPseudostateEClass, XPSEUDOSTATE___XPSUEDOSTATE_KIND__DIAGNOSTICCHAIN_MAP);

		xTransitionEClass = createEClass(XTRANSITION);
		createEReference(xTransitionEClass, XTRANSITION__BASE_TRANSITION);
		createEOperation(xTransitionEClass, XTRANSITION___XTRANSITION_TRIGGER__DIAGNOSTICCHAIN_MAP);
		createEOperation(xTransitionEClass, XTRANSITION___XTRANSITION_GUARD__DIAGNOSTICCHAIN_MAP);
		createEOperation(xTransitionEClass, XTRANSITION___XTRANSITION_EFFECT__DIAGNOSTICCHAIN_MAP);

		xActivityEClass = createEClass(XACTIVITY);
		createEReference(xActivityEClass, XACTIVITY__BASE_ACTIVITY);
		createEOperation(xActivityEClass, XACTIVITY___XACTIVITY_PARAMETERS__DIAGNOSTICCHAIN_MAP);
		createEOperation(xActivityEClass, XACTIVITY___XACTIVITY_TEXTUAL_REPRESENTATION__DIAGNOSTICCHAIN_MAP);

		xActionBehaviorEClass = createEClass(XACTION_BEHAVIOR);

		xConstraintEClass = createEClass(XCONSTRAINT);
		createEReference(xConstraintEClass, XCONSTRAINT__BASE_CONSTRAINT);
		createEOperation(xConstraintEClass, XCONSTRAINT___XCONSTRAINT_SPECIFICATION__DIAGNOSTICCHAIN_MAP);
		createEOperation(xConstraintEClass, XCONSTRAINT___XCONSTRAINT_BEHAVIOR__DIAGNOSTICCHAIN_MAP);

		xOpaqueBehaviorEClass = createEClass(XOPAQUE_BEHAVIOR);
		createEReference(xOpaqueBehaviorEClass, XOPAQUE_BEHAVIOR__BASE_OPAQUE_BEHAVIOR);
		createEAttribute(xOpaqueBehaviorEClass, XOPAQUE_BEHAVIOR__IS_EXTERNAL);
		createEOperation(xOpaqueBehaviorEClass, XOPAQUE_BEHAVIOR___XOPAQUE_BEHAVIOR_EXTERNAL__DIAGNOSTICCHAIN_MAP);

		xConstrainedTypeEClass = createEClass(XCONSTRAINED_TYPE);
		createEReference(xConstrainedTypeEClass, XCONSTRAINED_TYPE__BASE_PRIMITIVE_TYPE);
		createEReference(xConstrainedTypeEClass, XCONSTRAINED_TYPE__LOWER_BOUND);
		createEReference(xConstrainedTypeEClass, XCONSTRAINED_TYPE__UPPER_BOUND);
		createEAttribute(xConstrainedTypeEClass, XCONSTRAINED_TYPE__IS_LOWER_BOUND_EXCLUSIVE);
		createEAttribute(xConstrainedTypeEClass, XCONSTRAINED_TYPE__IS_UPPER_BOUND_EXCLUSIVE);
		createEOperation(xConstrainedTypeEClass, XCONSTRAINED_TYPE___XCONSTRAINED_TYPE_PRIMITIVE_TYPE__DIAGNOSTICCHAIN_MAP);
		createEOperation(xConstrainedTypeEClass, XCONSTRAINED_TYPE___XCONSTRAINED_TYPE_BOUNDS__DIAGNOSTICCHAIN_MAP);

		xGeneralizationEClass = createEClass(XGENERALIZATION);
		createEReference(xGeneralizationEClass, XGENERALIZATION__BASE_GENERALIZATION);
		createEOperation(xGeneralizationEClass, XGENERALIZATION___XGENERALIZATION_CLASSIFIERS__DIAGNOSTICCHAIN_MAP);
		createEOperation(xGeneralizationEClass, XGENERALIZATION___XGENERALIZATION_GENERALIZATION_SET__DIAGNOSTICCHAIN_MAP);

		xGeneralizationSetEClass = createEClass(XGENERALIZATION_SET);
		createEReference(xGeneralizationSetEClass, XGENERALIZATION_SET__BASE_GENERALIZATION_SET);

		xClassEClass = createEClass(XCLASS);
		createEReference(xClassEClass, XCLASS__BASE_CLASS);
		createEAttribute(xClassEClass, XCLASS__IS_EXTERNAL);
		createEOperation(xClassEClass, XCLASS___XCLASS_METACLASS__DIAGNOSTICCHAIN_MAP);
		createEOperation(xClassEClass, XCLASS___XCLASS_NESTED_CLASSIFIERS__DIAGNOSTICCHAIN_MAP);
		createEOperation(xClassEClass, XCLASS___XCLASS_EXTERNAL__DIAGNOSTICCHAIN_MAP);

		xConnectorEndEClass = createEClass(XCONNECTOR_END);
		createEReference(xConnectorEndEClass, XCONNECTOR_END__BASE_CONNECTOR_END);
		createEOperation(xConnectorEndEClass, XCONNECTOR_END___XCONNECTOR_END_CONNECTOR__DIAGNOSTICCHAIN_MAP);
		createEOperation(xConnectorEndEClass, XCONNECTOR_END___XCONNECTOR_END_ROLE__DIAGNOSTICCHAIN_MAP);
		createEOperation(xConnectorEndEClass, XCONNECTOR_END___XCONNECTOR_END_UNIQUENESS__DIAGNOSTICCHAIN_MAP);

		// Create enums
		xMessageKindEEnum = createEEnum(XMESSAGE_KIND);
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
		UMLPackage theUMLPackage = (UMLPackage)EPackage.Registry.INSTANCE.getEPackage(UMLPackage.eNS_URI);
		TypesPackage theTypesPackage = (TypesPackage)EPackage.Registry.INSTANCE.getEPackage(TypesPackage.eNS_URI);

		// Create type parameters

		// Set bounds for type parameters

		// Add supertypes to classes
		xOperationEClass.getESuperTypes().add(this.getXFeature());
		xOperationEClass.getESuperTypes().add(this.getXNamespace());
		xNamespaceEClass.getESuperTypes().add(this.getXNamedElement());
		xFeatureEClass.getESuperTypes().add(this.getXNamedElement());
		xClassifierEClass.getESuperTypes().add(this.getXNamespace());
		xBehaviorEClass.getESuperTypes().add(this.getXNamespace());
		xEncapsulatedClassifierEClass.getESuperTypes().add(this.getXClassifier());
		xProtocolEClass.getESuperTypes().add(this.getXClassifier());
		xSignalEClass.getESuperTypes().add(this.getXClassifier());
		xDataTypeEClass.getESuperTypes().add(this.getXClassifier());
		xParameterEClass.getESuperTypes().add(this.getXTypedElement());
		xPropertyEClass.getESuperTypes().add(this.getXMultiplicityElement());
		xPropertyEClass.getESuperTypes().add(this.getXFeature());
		xPropertyEClass.getESuperTypes().add(this.getXTypedElement());
		xReceptionEClass.getESuperTypes().add(this.getXFeature());
		xPartEClass.getESuperTypes().add(this.getXFeature());
		xPartEClass.getESuperTypes().add(this.getXTypedElement());
		xPortEClass.getESuperTypes().add(this.getXFeature());
		xConnectorEClass.getESuperTypes().add(this.getXFeature());
		xMessageSetEClass.getESuperTypes().add(this.getXClassifier());
		xEnumerationEClass.getESuperTypes().add(this.getXDataType());
		xAssociationClassEClass.getESuperTypes().add(this.getXClassifier());
		xAssociationClassEClass.getESuperTypes().add(this.getXAssociation());
		xStateMachineEClass.getESuperTypes().add(this.getXBehavior());
		xStateEClass.getESuperTypes().add(this.getXVertex());
		xPseudostateEClass.getESuperTypes().add(this.getXVertex());
		xActivityEClass.getESuperTypes().add(this.getXActionBehavior());
		xActionBehaviorEClass.getESuperTypes().add(this.getXBehavior());
		xConstraintEClass.getESuperTypes().add(this.getXNamedElement());
		xOpaqueBehaviorEClass.getESuperTypes().add(this.getXActionBehavior());
		xConstrainedTypeEClass.getESuperTypes().add(this.getXClassifier());
		xClassEClass.getESuperTypes().add(this.getXClassifier());

		// Initialize classes, features, and operations; add parameters
		initEClass(xOperationEClass, XOperation.class, "XOperation", IS_ABSTRACT, !IS_INTERFACE, IS_GENERATED_INSTANCE_CLASS);
		initEReference(getXOperation_Base_Operation(), theUMLPackage.getOperation(), null, "base_Operation", null, 1, 1, XOperation.class, !IS_TRANSIENT, !IS_VOLATILE, IS_CHANGEABLE, !IS_COMPOSITE, IS_RESOLVE_PROXIES, !IS_UNSETTABLE, IS_UNIQUE, !IS_DERIVED, !IS_ORDERED);

		EOperation op = initEOperation(getXOperation__XOperationParameters__DiagnosticChain_Map(), ecorePackage.getEBoolean(), "xOperationParameters", 0, 1, IS_UNIQUE, IS_ORDERED);
		addEParameter(op, ecorePackage.getEDiagnosticChain(), "diagnostics", 0, 1, IS_UNIQUE, IS_ORDERED);
		EGenericType g1 = createEGenericType(ecorePackage.getEMap());
		EGenericType g2 = createEGenericType(ecorePackage.getEJavaObject());
		g1.getETypeArguments().add(g2);
		g2 = createEGenericType(ecorePackage.getEJavaObject());
		g1.getETypeArguments().add(g2);
		addEParameter(op, g1, "context", 0, 1, IS_UNIQUE, IS_ORDERED);

		op = initEOperation(getXOperation__XOperationOneMethod__DiagnosticChain_Map(), ecorePackage.getEBoolean(), "xOperationOneMethod", 0, 1, IS_UNIQUE, IS_ORDERED);
		addEParameter(op, ecorePackage.getEDiagnosticChain(), "diagnostics", 0, 1, IS_UNIQUE, IS_ORDERED);
		g1 = createEGenericType(ecorePackage.getEMap());
		g2 = createEGenericType(ecorePackage.getEJavaObject());
		g1.getETypeArguments().add(g2);
		g2 = createEGenericType(ecorePackage.getEJavaObject());
		g1.getETypeArguments().add(g2);
		addEParameter(op, g1, "context", 0, 1, IS_UNIQUE, IS_ORDERED);

		op = initEOperation(getXOperation__XOperationImports__DiagnosticChain_Map(), ecorePackage.getEBoolean(), "xOperationImports", 0, 1, IS_UNIQUE, IS_ORDERED);
		addEParameter(op, ecorePackage.getEDiagnosticChain(), "diagnostics", 0, 1, IS_UNIQUE, IS_ORDERED);
		g1 = createEGenericType(ecorePackage.getEMap());
		g2 = createEGenericType(ecorePackage.getEJavaObject());
		g1.getETypeArguments().add(g2);
		g2 = createEGenericType(ecorePackage.getEJavaObject());
		g1.getETypeArguments().add(g2);
		addEParameter(op, g1, "context", 0, 1, IS_UNIQUE, IS_ORDERED);

		op = initEOperation(getXOperation__XOperationOwnedRules__DiagnosticChain_Map(), ecorePackage.getEBoolean(), "xOperationOwnedRules", 0, 1, IS_UNIQUE, IS_ORDERED);
		addEParameter(op, ecorePackage.getEDiagnosticChain(), "diagnostics", 0, 1, IS_UNIQUE, IS_ORDERED);
		g1 = createEGenericType(ecorePackage.getEMap());
		g2 = createEGenericType(ecorePackage.getEJavaObject());
		g1.getETypeArguments().add(g2);
		g2 = createEGenericType(ecorePackage.getEJavaObject());
		g1.getETypeArguments().add(g2);
		addEParameter(op, g1, "context", 0, 1, IS_UNIQUE, IS_ORDERED);

		op = initEOperation(getXOperation__XOperationMethods__DiagnosticChain_Map(), ecorePackage.getEBoolean(), "xOperationMethods", 0, 1, IS_UNIQUE, IS_ORDERED);
		addEParameter(op, ecorePackage.getEDiagnosticChain(), "diagnostics", 0, 1, IS_UNIQUE, IS_ORDERED);
		g1 = createEGenericType(ecorePackage.getEMap());
		g2 = createEGenericType(ecorePackage.getEJavaObject());
		g1.getETypeArguments().add(g2);
		g2 = createEGenericType(ecorePackage.getEJavaObject());
		g1.getETypeArguments().add(g2);
		addEParameter(op, g1, "context", 0, 1, IS_UNIQUE, IS_ORDERED);

		op = initEOperation(getXOperation__XOperationConstraints__DiagnosticChain_Map(), ecorePackage.getEBoolean(), "xOperationConstraints", 0, 1, IS_UNIQUE, IS_ORDERED);
		addEParameter(op, ecorePackage.getEDiagnosticChain(), "diagnostics", 0, 1, IS_UNIQUE, IS_ORDERED);
		g1 = createEGenericType(ecorePackage.getEMap());
		g2 = createEGenericType(ecorePackage.getEJavaObject());
		g1.getETypeArguments().add(g2);
		g2 = createEGenericType(ecorePackage.getEJavaObject());
		g1.getETypeArguments().add(g2);
		addEParameter(op, g1, "context", 0, 1, IS_UNIQUE, IS_ORDERED);

		initEClass(xNamespaceEClass, XNamespace.class, "XNamespace", IS_ABSTRACT, !IS_INTERFACE, IS_GENERATED_INSTANCE_CLASS);
		initEReference(getXNamespace_Base_Namespace(), theUMLPackage.getNamespace(), null, "base_Namespace", null, 1, 1, XNamespace.class, !IS_TRANSIENT, !IS_VOLATILE, IS_CHANGEABLE, !IS_COMPOSITE, IS_RESOLVE_PROXIES, !IS_UNSETTABLE, IS_UNIQUE, !IS_DERIVED, !IS_ORDERED);

		initEClass(xNamedElementEClass, XNamedElement.class, "XNamedElement", IS_ABSTRACT, !IS_INTERFACE, IS_GENERATED_INSTANCE_CLASS);
		initEReference(getXNamedElement_Base_NamedElement(), theUMLPackage.getNamedElement(), null, "base_NamedElement", null, 1, 1, XNamedElement.class, !IS_TRANSIENT, !IS_VOLATILE, IS_CHANGEABLE, !IS_COMPOSITE, IS_RESOLVE_PROXIES, !IS_UNSETTABLE, IS_UNIQUE, !IS_DERIVED, !IS_ORDERED);

		op = initEOperation(getXNamedElement__XNamedElementName__DiagnosticChain_Map(), ecorePackage.getEBoolean(), "xNamedElementName", 0, 1, IS_UNIQUE, IS_ORDERED);
		addEParameter(op, ecorePackage.getEDiagnosticChain(), "diagnostics", 0, 1, IS_UNIQUE, IS_ORDERED);
		g1 = createEGenericType(ecorePackage.getEMap());
		g2 = createEGenericType(ecorePackage.getEJavaObject());
		g1.getETypeArguments().add(g2);
		g2 = createEGenericType(ecorePackage.getEJavaObject());
		g1.getETypeArguments().add(g2);
		addEParameter(op, g1, "context", 0, 1, IS_UNIQUE, IS_ORDERED);

		initEClass(xFeatureEClass, XFeature.class, "XFeature", IS_ABSTRACT, !IS_INTERFACE, IS_GENERATED_INSTANCE_CLASS);
		initEReference(getXFeature_Base_Feature(), theUMLPackage.getFeature(), null, "base_Feature", null, 1, 1, XFeature.class, !IS_TRANSIENT, !IS_VOLATILE, IS_CHANGEABLE, !IS_COMPOSITE, IS_RESOLVE_PROXIES, !IS_UNSETTABLE, IS_UNIQUE, !IS_DERIVED, !IS_ORDERED);

		op = initEOperation(getXFeature__XFeatureClassifier__DiagnosticChain_Map(), ecorePackage.getEBoolean(), "xFeatureClassifier", 0, 1, IS_UNIQUE, IS_ORDERED);
		addEParameter(op, ecorePackage.getEDiagnosticChain(), "diagnostics", 0, 1, IS_UNIQUE, IS_ORDERED);
		g1 = createEGenericType(ecorePackage.getEMap());
		g2 = createEGenericType(ecorePackage.getEJavaObject());
		g1.getETypeArguments().add(g2);
		g2 = createEGenericType(ecorePackage.getEJavaObject());
		g1.getETypeArguments().add(g2);
		addEParameter(op, g1, "context", 0, 1, IS_UNIQUE, IS_ORDERED);

		initEClass(xAssociationEClass, XAssociation.class, "XAssociation", IS_ABSTRACT, !IS_INTERFACE, IS_GENERATED_INSTANCE_CLASS);
		initEReference(getXAssociation_Base_Association(), theUMLPackage.getAssociation(), null, "base_Association", null, 1, 1, XAssociation.class, !IS_TRANSIENT, !IS_VOLATILE, IS_CHANGEABLE, !IS_COMPOSITE, IS_RESOLVE_PROXIES, !IS_UNSETTABLE, IS_UNIQUE, !IS_DERIVED, !IS_ORDERED);

		op = initEOperation(getXAssociation__XAssociationIsBinary__DiagnosticChain_Map(), ecorePackage.getEBoolean(), "xAssociationIsBinary", 0, 1, IS_UNIQUE, IS_ORDERED);
		addEParameter(op, ecorePackage.getEDiagnosticChain(), "diagnostics", 0, 1, IS_UNIQUE, IS_ORDERED);
		g1 = createEGenericType(ecorePackage.getEMap());
		g2 = createEGenericType(ecorePackage.getEJavaObject());
		g1.getETypeArguments().add(g2);
		g2 = createEGenericType(ecorePackage.getEJavaObject());
		g1.getETypeArguments().add(g2);
		addEParameter(op, g1, "context", 0, 1, IS_UNIQUE, IS_ORDERED);

		initEClass(xClassifierEClass, XClassifier.class, "XClassifier", IS_ABSTRACT, !IS_INTERFACE, IS_GENERATED_INSTANCE_CLASS);
		initEReference(getXClassifier_Base_Classifier(), theUMLPackage.getClassifier(), null, "base_Classifier", null, 1, 1, XClassifier.class, !IS_TRANSIENT, !IS_VOLATILE, IS_CHANGEABLE, !IS_COMPOSITE, IS_RESOLVE_PROXIES, !IS_UNSETTABLE, IS_UNIQUE, !IS_DERIVED, !IS_ORDERED);

		op = initEOperation(getXClassifier__XClassifierFeatures__DiagnosticChain_Map(), ecorePackage.getEBoolean(), "xClassifierFeatures", 0, 1, IS_UNIQUE, IS_ORDERED);
		addEParameter(op, ecorePackage.getEDiagnosticChain(), "diagnostics", 0, 1, IS_UNIQUE, IS_ORDERED);
		g1 = createEGenericType(ecorePackage.getEMap());
		g2 = createEGenericType(ecorePackage.getEJavaObject());
		g1.getETypeArguments().add(g2);
		g2 = createEGenericType(ecorePackage.getEJavaObject());
		g1.getETypeArguments().add(g2);
		addEParameter(op, g1, "context", 0, 1, IS_UNIQUE, IS_ORDERED);

		op = initEOperation(getXClassifier__XClassifierNestedClassifiers__DiagnosticChain_Map(), ecorePackage.getEBoolean(), "xClassifierNestedClassifiers", 0, 1, IS_UNIQUE, IS_ORDERED);
		addEParameter(op, ecorePackage.getEDiagnosticChain(), "diagnostics", 0, 1, IS_UNIQUE, IS_ORDERED);
		g1 = createEGenericType(ecorePackage.getEMap());
		g2 = createEGenericType(ecorePackage.getEJavaObject());
		g1.getETypeArguments().add(g2);
		g2 = createEGenericType(ecorePackage.getEJavaObject());
		g1.getETypeArguments().add(g2);
		addEParameter(op, g1, "context", 0, 1, IS_UNIQUE, IS_ORDERED);

		op = initEOperation(getXClassifier__XClassifierGenerals__DiagnosticChain_Map(), ecorePackage.getEBoolean(), "xClassifierGenerals", 0, 1, IS_UNIQUE, IS_ORDERED);
		addEParameter(op, ecorePackage.getEDiagnosticChain(), "diagnostics", 0, 1, IS_UNIQUE, IS_ORDERED);
		g1 = createEGenericType(ecorePackage.getEMap());
		g2 = createEGenericType(ecorePackage.getEJavaObject());
		g1.getETypeArguments().add(g2);
		g2 = createEGenericType(ecorePackage.getEJavaObject());
		g1.getETypeArguments().add(g2);
		addEParameter(op, g1, "context", 0, 1, IS_UNIQUE, IS_ORDERED);

		op = initEOperation(getXClassifier__XClassifierConstraints__DiagnosticChain_Map(), ecorePackage.getEBoolean(), "xClassifierConstraints", 0, 1, IS_UNIQUE, IS_ORDERED);
		addEParameter(op, ecorePackage.getEDiagnosticChain(), "diagnostics", 0, 1, IS_UNIQUE, IS_ORDERED);
		g1 = createEGenericType(ecorePackage.getEMap());
		g2 = createEGenericType(ecorePackage.getEJavaObject());
		g1.getETypeArguments().add(g2);
		g2 = createEGenericType(ecorePackage.getEJavaObject());
		g1.getETypeArguments().add(g2);
		addEParameter(op, g1, "context", 0, 1, IS_UNIQUE, IS_ORDERED);

		initEClass(xBehaviorEClass, XBehavior.class, "XBehavior", IS_ABSTRACT, !IS_INTERFACE, IS_GENERATED_INSTANCE_CLASS);
		initEReference(getXBehavior_Base_Behavior(), theUMLPackage.getBehavior(), null, "base_Behavior", null, 1, 1, XBehavior.class, !IS_TRANSIENT, !IS_VOLATILE, IS_CHANGEABLE, !IS_COMPOSITE, IS_RESOLVE_PROXIES, !IS_UNSETTABLE, IS_UNIQUE, !IS_DERIVED, !IS_ORDERED);

		op = initEOperation(getXBehavior__XBehaviorNoParameterSets__DiagnosticChain_Map(), ecorePackage.getEBoolean(), "xBehaviorNoParameterSets", 0, 1, IS_UNIQUE, IS_ORDERED);
		addEParameter(op, ecorePackage.getEDiagnosticChain(), "diagnostics", 0, 1, IS_UNIQUE, IS_ORDERED);
		g1 = createEGenericType(ecorePackage.getEMap());
		g2 = createEGenericType(ecorePackage.getEJavaObject());
		g1.getETypeArguments().add(g2);
		g2 = createEGenericType(ecorePackage.getEJavaObject());
		g1.getETypeArguments().add(g2);
		addEParameter(op, g1, "context", 0, 1, IS_UNIQUE, IS_ORDERED);

		initEClass(xEncapsulatedClassifierEClass, XEncapsulatedClassifier.class, "XEncapsulatedClassifier", IS_ABSTRACT, !IS_INTERFACE, IS_GENERATED_INSTANCE_CLASS);
		initEReference(getXEncapsulatedClassifier_Base_EncapsulatedClassifier(), theUMLPackage.getEncapsulatedClassifier(), null, "base_EncapsulatedClassifier", null, 1, 1, XEncapsulatedClassifier.class, !IS_TRANSIENT, !IS_VOLATILE, IS_CHANGEABLE, !IS_COMPOSITE, IS_RESOLVE_PROXIES, !IS_UNSETTABLE, IS_UNIQUE, !IS_DERIVED, !IS_ORDERED);
		initEAttribute(getXEncapsulatedClassifier_IsExternal(), theTypesPackage.getBoolean(), "isExternal", "false", 1, 1, XEncapsulatedClassifier.class, !IS_TRANSIENT, !IS_VOLATILE, IS_CHANGEABLE, !IS_UNSETTABLE, !IS_ID, !IS_UNIQUE, !IS_DERIVED, !IS_ORDERED);

		op = initEOperation(getXEncapsulatedClassifier__XEncapsulatedClassifierPorts__DiagnosticChain_Map(), ecorePackage.getEBoolean(), "xEncapsulatedClassifierPorts", 0, 1, IS_UNIQUE, IS_ORDERED);
		addEParameter(op, ecorePackage.getEDiagnosticChain(), "diagnostics", 0, 1, IS_UNIQUE, IS_ORDERED);
		g1 = createEGenericType(ecorePackage.getEMap());
		g2 = createEGenericType(ecorePackage.getEJavaObject());
		g1.getETypeArguments().add(g2);
		g2 = createEGenericType(ecorePackage.getEJavaObject());
		g1.getETypeArguments().add(g2);
		addEParameter(op, g1, "context", 0, 1, IS_UNIQUE, IS_ORDERED);

		op = initEOperation(getXEncapsulatedClassifier__XEncapsulatedClassifierconnectors__DiagnosticChain_Map(), ecorePackage.getEBoolean(), "xEncapsulatedClassifierconnectors", 0, 1, IS_UNIQUE, IS_ORDERED);
		addEParameter(op, ecorePackage.getEDiagnosticChain(), "diagnostics", 0, 1, IS_UNIQUE, IS_ORDERED);
		g1 = createEGenericType(ecorePackage.getEMap());
		g2 = createEGenericType(ecorePackage.getEJavaObject());
		g1.getETypeArguments().add(g2);
		g2 = createEGenericType(ecorePackage.getEJavaObject());
		g1.getETypeArguments().add(g2);
		addEParameter(op, g1, "context", 0, 1, IS_UNIQUE, IS_ORDERED);

		op = initEOperation(getXEncapsulatedClassifier__XEncapsulatedClassifierExternal__DiagnosticChain_Map(), ecorePackage.getEBoolean(), "xEncapsulatedClassifierExternal", 0, 1, IS_UNIQUE, IS_ORDERED);
		addEParameter(op, ecorePackage.getEDiagnosticChain(), "diagnostics", 0, 1, IS_UNIQUE, IS_ORDERED);
		g1 = createEGenericType(ecorePackage.getEMap());
		g2 = createEGenericType(ecorePackage.getEJavaObject());
		g1.getETypeArguments().add(g2);
		g2 = createEGenericType(ecorePackage.getEJavaObject());
		g1.getETypeArguments().add(g2);
		addEParameter(op, g1, "context", 0, 1, IS_UNIQUE, IS_ORDERED);

		initEClass(xProtocolEClass, XProtocol.class, "XProtocol", IS_ABSTRACT, !IS_INTERFACE, IS_GENERATED_INSTANCE_CLASS);
		initEReference(getXProtocol_Base_BehavioredClassifier(), theUMLPackage.getBehavioredClassifier(), null, "base_BehavioredClassifier", null, 1, 1, XProtocol.class, !IS_TRANSIENT, !IS_VOLATILE, IS_CHANGEABLE, !IS_COMPOSITE, IS_RESOLVE_PROXIES, !IS_UNSETTABLE, IS_UNIQUE, !IS_DERIVED, !IS_ORDERED);

		op = initEOperation(getXProtocol__XProtocolIncomingInterface__DiagnosticChain_Map(), ecorePackage.getEBoolean(), "xProtocolIncomingInterface", 0, 1, IS_UNIQUE, IS_ORDERED);
		addEParameter(op, ecorePackage.getEDiagnosticChain(), "diagnostics", 0, 1, IS_UNIQUE, IS_ORDERED);
		g1 = createEGenericType(ecorePackage.getEMap());
		g2 = createEGenericType(ecorePackage.getEJavaObject());
		g1.getETypeArguments().add(g2);
		g2 = createEGenericType(ecorePackage.getEJavaObject());
		g1.getETypeArguments().add(g2);
		addEParameter(op, g1, "context", 0, 1, IS_UNIQUE, IS_ORDERED);

		op = initEOperation(getXProtocol__XProtocolProtocolContainer__DiagnosticChain_Map(), ecorePackage.getEBoolean(), "xProtocolProtocolContainer", 0, 1, IS_UNIQUE, IS_ORDERED);
		addEParameter(op, ecorePackage.getEDiagnosticChain(), "diagnostics", 0, 1, IS_UNIQUE, IS_ORDERED);
		g1 = createEGenericType(ecorePackage.getEMap());
		g2 = createEGenericType(ecorePackage.getEJavaObject());
		g1.getETypeArguments().add(g2);
		g2 = createEGenericType(ecorePackage.getEJavaObject());
		g1.getETypeArguments().add(g2);
		addEParameter(op, g1, "context", 0, 1, IS_UNIQUE, IS_ORDERED);

		op = initEOperation(getXProtocol__XProtocolOutgoingInterface__DiagnosticChain_Map(), ecorePackage.getEBoolean(), "xProtocolOutgoingInterface", 0, 1, IS_UNIQUE, IS_ORDERED);
		addEParameter(op, ecorePackage.getEDiagnosticChain(), "diagnostics", 0, 1, IS_UNIQUE, IS_ORDERED);
		g1 = createEGenericType(ecorePackage.getEMap());
		g2 = createEGenericType(ecorePackage.getEJavaObject());
		g1.getETypeArguments().add(g2);
		g2 = createEGenericType(ecorePackage.getEJavaObject());
		g1.getETypeArguments().add(g2);
		addEParameter(op, g1, "context", 0, 1, IS_UNIQUE, IS_ORDERED);

		op = initEOperation(getXProtocol__XProtocolSymmetricInterface__DiagnosticChain_Map(), ecorePackage.getEBoolean(), "xProtocolSymmetricInterface", 0, 1, IS_UNIQUE, IS_ORDERED);
		addEParameter(op, ecorePackage.getEDiagnosticChain(), "diagnostics", 0, 1, IS_UNIQUE, IS_ORDERED);
		g1 = createEGenericType(ecorePackage.getEMap());
		g2 = createEGenericType(ecorePackage.getEJavaObject());
		g1.getETypeArguments().add(g2);
		g2 = createEGenericType(ecorePackage.getEJavaObject());
		g1.getETypeArguments().add(g2);
		addEParameter(op, g1, "context", 0, 1, IS_UNIQUE, IS_ORDERED);

		initEClass(xSignalEClass, XSignal.class, "XSignal", IS_ABSTRACT, !IS_INTERFACE, IS_GENERATED_INSTANCE_CLASS);
		initEReference(getXSignal_Base_Signal(), theUMLPackage.getSignal(), null, "base_Signal", null, 1, 1, XSignal.class, !IS_TRANSIENT, !IS_VOLATILE, IS_CHANGEABLE, !IS_COMPOSITE, IS_RESOLVE_PROXIES, !IS_UNSETTABLE, IS_UNIQUE, !IS_DERIVED, !IS_ORDERED);

		op = initEOperation(getXSignal__XSignalVisibility__DiagnosticChain_Map(), ecorePackage.getEBoolean(), "xSignalVisibility", 0, 1, IS_UNIQUE, IS_ORDERED);
		addEParameter(op, ecorePackage.getEDiagnosticChain(), "diagnostics", 0, 1, IS_UNIQUE, IS_ORDERED);
		g1 = createEGenericType(ecorePackage.getEMap());
		g2 = createEGenericType(ecorePackage.getEJavaObject());
		g1.getETypeArguments().add(g2);
		g2 = createEGenericType(ecorePackage.getEJavaObject());
		g1.getETypeArguments().add(g2);
		addEParameter(op, g1, "context", 0, 1, IS_UNIQUE, IS_ORDERED);

		initEClass(xDataTypeEClass, XDataType.class, "XDataType", IS_ABSTRACT, !IS_INTERFACE, IS_GENERATED_INSTANCE_CLASS);
		initEReference(getXDataType_Base_DataType(), theUMLPackage.getDataType(), null, "base_DataType", null, 1, 1, XDataType.class, !IS_TRANSIENT, !IS_VOLATILE, IS_CHANGEABLE, !IS_COMPOSITE, IS_RESOLVE_PROXIES, !IS_UNSETTABLE, IS_UNIQUE, !IS_DERIVED, !IS_ORDERED);

		op = initEOperation(getXDataType__XDataTypeOperations__DiagnosticChain_Map(), ecorePackage.getEBoolean(), "xDataTypeOperations", 0, 1, IS_UNIQUE, IS_ORDERED);
		addEParameter(op, ecorePackage.getEDiagnosticChain(), "diagnostics", 0, 1, IS_UNIQUE, IS_ORDERED);
		g1 = createEGenericType(ecorePackage.getEMap());
		g2 = createEGenericType(ecorePackage.getEJavaObject());
		g1.getETypeArguments().add(g2);
		g2 = createEGenericType(ecorePackage.getEJavaObject());
		g1.getETypeArguments().add(g2);
		addEParameter(op, g1, "context", 0, 1, IS_UNIQUE, IS_ORDERED);

		initEClass(xParameterEClass, XParameter.class, "XParameter", IS_ABSTRACT, !IS_INTERFACE, IS_GENERATED_INSTANCE_CLASS);
		initEReference(getXParameter_Base_Parameter(), theUMLPackage.getParameter(), null, "base_Parameter", null, 1, 1, XParameter.class, !IS_TRANSIENT, !IS_VOLATILE, IS_CHANGEABLE, !IS_COMPOSITE, IS_RESOLVE_PROXIES, !IS_UNSETTABLE, IS_UNIQUE, !IS_DERIVED, !IS_ORDERED);

		initEClass(xTypedElementEClass, XTypedElement.class, "XTypedElement", IS_ABSTRACT, !IS_INTERFACE, IS_GENERATED_INSTANCE_CLASS);
		initEReference(getXTypedElement_Base_TypedElement(), theUMLPackage.getTypedElement(), null, "base_TypedElement", null, 1, 1, XTypedElement.class, !IS_TRANSIENT, !IS_VOLATILE, IS_CHANGEABLE, !IS_COMPOSITE, IS_RESOLVE_PROXIES, !IS_UNSETTABLE, IS_UNIQUE, !IS_DERIVED, !IS_ORDERED);

		op = initEOperation(getXTypedElement__XTypedElementType__DiagnosticChain_Map(), ecorePackage.getEBoolean(), "xTypedElementType", 0, 1, IS_UNIQUE, IS_ORDERED);
		addEParameter(op, ecorePackage.getEDiagnosticChain(), "diagnostics", 0, 1, IS_UNIQUE, IS_ORDERED);
		g1 = createEGenericType(ecorePackage.getEMap());
		g2 = createEGenericType(ecorePackage.getEJavaObject());
		g1.getETypeArguments().add(g2);
		g2 = createEGenericType(ecorePackage.getEJavaObject());
		g1.getETypeArguments().add(g2);
		addEParameter(op, g1, "context", 0, 1, IS_UNIQUE, IS_ORDERED);

		initEClass(xPropertyEClass, XProperty.class, "XProperty", IS_ABSTRACT, !IS_INTERFACE, IS_GENERATED_INSTANCE_CLASS);
		initEReference(getXProperty_Base_Property(), theUMLPackage.getProperty(), null, "base_Property", null, 1, 1, XProperty.class, !IS_TRANSIENT, !IS_VOLATILE, IS_CHANGEABLE, !IS_COMPOSITE, IS_RESOLVE_PROXIES, !IS_UNSETTABLE, IS_UNIQUE, !IS_DERIVED, !IS_ORDERED);

		initEClass(xMultiplicityElementEClass, XMultiplicityElement.class, "XMultiplicityElement", IS_ABSTRACT, !IS_INTERFACE, IS_GENERATED_INSTANCE_CLASS);
		initEReference(getXMultiplicityElement_Base_MultiplicityElement(), theUMLPackage.getMultiplicityElement(), null, "base_MultiplicityElement", null, 1, 1, XMultiplicityElement.class, !IS_TRANSIENT, !IS_VOLATILE, IS_CHANGEABLE, !IS_COMPOSITE, IS_RESOLVE_PROXIES, !IS_UNSETTABLE, IS_UNIQUE, !IS_DERIVED, !IS_ORDERED);
		initEAttribute(getXMultiplicityElement_IsOrderedByValue(), theTypesPackage.getBoolean(), "isOrderedByValue", "false", 1, 1, XMultiplicityElement.class, !IS_TRANSIENT, !IS_VOLATILE, IS_CHANGEABLE, !IS_UNSETTABLE, !IS_ID, !IS_UNIQUE, !IS_DERIVED, !IS_ORDERED);
		initEReference(getXMultiplicityElement_Key(), theUMLPackage.getProperty(), null, "key", null, 0, -1, XMultiplicityElement.class, !IS_TRANSIENT, !IS_VOLATILE, IS_CHANGEABLE, !IS_COMPOSITE, IS_RESOLVE_PROXIES, !IS_UNSETTABLE, IS_UNIQUE, !IS_DERIVED, !IS_ORDERED);
		initEAttribute(getXMultiplicityElement_IsDescending(), theTypesPackage.getBoolean(), "isDescending", "false", 1, 1, XMultiplicityElement.class, !IS_TRANSIENT, !IS_VOLATILE, IS_CHANGEABLE, !IS_UNSETTABLE, !IS_ID, !IS_UNIQUE, !IS_DERIVED, !IS_ORDERED);

		op = initEOperation(getXMultiplicityElement__XMultiplicityElementIsOrderedByValue__DiagnosticChain_Map(), ecorePackage.getEBoolean(), "xMultiplicityElementIsOrderedByValue", 0, 1, IS_UNIQUE, IS_ORDERED);
		addEParameter(op, ecorePackage.getEDiagnosticChain(), "diagnostics", 0, 1, IS_UNIQUE, IS_ORDERED);
		g1 = createEGenericType(ecorePackage.getEMap());
		g2 = createEGenericType(ecorePackage.getEJavaObject());
		g1.getETypeArguments().add(g2);
		g2 = createEGenericType(ecorePackage.getEJavaObject());
		g1.getETypeArguments().add(g2);
		addEParameter(op, g1, "context", 0, 1, IS_UNIQUE, IS_ORDERED);

		op = initEOperation(getXMultiplicityElement__XMultiplicityElementKeys__DiagnosticChain_Map(), ecorePackage.getEBoolean(), "xMultiplicityElementKeys", 0, 1, IS_UNIQUE, IS_ORDERED);
		addEParameter(op, ecorePackage.getEDiagnosticChain(), "diagnostics", 0, 1, IS_UNIQUE, IS_ORDERED);
		g1 = createEGenericType(ecorePackage.getEMap());
		g2 = createEGenericType(ecorePackage.getEJavaObject());
		g1.getETypeArguments().add(g2);
		g2 = createEGenericType(ecorePackage.getEJavaObject());
		g1.getETypeArguments().add(g2);
		addEParameter(op, g1, "context", 0, 1, IS_UNIQUE, IS_ORDERED);

		initEClass(xReceptionEClass, XReception.class, "XReception", IS_ABSTRACT, !IS_INTERFACE, IS_GENERATED_INSTANCE_CLASS);
		initEReference(getXReception_Base_Reception(), theUMLPackage.getReception(), null, "base_Reception", null, 1, 1, XReception.class, !IS_TRANSIENT, !IS_VOLATILE, IS_CHANGEABLE, !IS_COMPOSITE, IS_RESOLVE_PROXIES, !IS_UNSETTABLE, IS_UNIQUE, !IS_DERIVED, !IS_ORDERED);

		op = initEOperation(getXReception__XReceptionSignal__DiagnosticChain_Map(), ecorePackage.getEBoolean(), "xReceptionSignal", 0, 1, IS_UNIQUE, IS_ORDERED);
		addEParameter(op, ecorePackage.getEDiagnosticChain(), "diagnostics", 0, 1, IS_UNIQUE, IS_ORDERED);
		g1 = createEGenericType(ecorePackage.getEMap());
		g2 = createEGenericType(ecorePackage.getEJavaObject());
		g1.getETypeArguments().add(g2);
		g2 = createEGenericType(ecorePackage.getEJavaObject());
		g1.getETypeArguments().add(g2);
		addEParameter(op, g1, "context", 0, 1, IS_UNIQUE, IS_ORDERED);

		initEClass(xPartEClass, XPart.class, "XPart", IS_ABSTRACT, !IS_INTERFACE, IS_GENERATED_INSTANCE_CLASS);
		initEReference(getXPart_Base_Property(), theUMLPackage.getProperty(), null, "base_Property", null, 1, 1, XPart.class, !IS_TRANSIENT, !IS_VOLATILE, IS_CHANGEABLE, !IS_COMPOSITE, IS_RESOLVE_PROXIES, !IS_UNSETTABLE, IS_UNIQUE, !IS_DERIVED, !IS_ORDERED);

		op = initEOperation(getXPart__XPartClassifier__DiagnosticChain_Map(), ecorePackage.getEBoolean(), "xPartClassifier", 0, 1, IS_UNIQUE, IS_ORDERED);
		addEParameter(op, ecorePackage.getEDiagnosticChain(), "diagnostics", 0, 1, IS_UNIQUE, IS_ORDERED);
		g1 = createEGenericType(ecorePackage.getEMap());
		g2 = createEGenericType(ecorePackage.getEJavaObject());
		g1.getETypeArguments().add(g2);
		g2 = createEGenericType(ecorePackage.getEJavaObject());
		g1.getETypeArguments().add(g2);
		addEParameter(op, g1, "context", 0, 1, IS_UNIQUE, IS_ORDERED);

		initEClass(xPortEClass, XPort.class, "XPort", IS_ABSTRACT, !IS_INTERFACE, IS_GENERATED_INSTANCE_CLASS);
		initEReference(getXPort_Base_Port(), theUMLPackage.getPort(), null, "base_Port", null, 1, 1, XPort.class, !IS_TRANSIENT, !IS_VOLATILE, IS_CHANGEABLE, !IS_COMPOSITE, IS_RESOLVE_PROXIES, !IS_UNSETTABLE, IS_UNIQUE, !IS_DERIVED, !IS_ORDERED);

		op = initEOperation(getXPort__XPortClassifier__DiagnosticChain_Map(), ecorePackage.getEBoolean(), "xPortClassifier", 0, 1, IS_UNIQUE, IS_ORDERED);
		addEParameter(op, ecorePackage.getEDiagnosticChain(), "diagnostics", 0, 1, IS_UNIQUE, IS_ORDERED);
		g1 = createEGenericType(ecorePackage.getEMap());
		g2 = createEGenericType(ecorePackage.getEJavaObject());
		g1.getETypeArguments().add(g2);
		g2 = createEGenericType(ecorePackage.getEJavaObject());
		g1.getETypeArguments().add(g2);
		addEParameter(op, g1, "context", 0, 1, IS_UNIQUE, IS_ORDERED);

		op = initEOperation(getXPort__XPortOrderingUniqueness__DiagnosticChain_Map(), ecorePackage.getEBoolean(), "xPortOrderingUniqueness", 0, 1, IS_UNIQUE, IS_ORDERED);
		addEParameter(op, ecorePackage.getEDiagnosticChain(), "diagnostics", 0, 1, IS_UNIQUE, IS_ORDERED);
		g1 = createEGenericType(ecorePackage.getEMap());
		g2 = createEGenericType(ecorePackage.getEJavaObject());
		g1.getETypeArguments().add(g2);
		g2 = createEGenericType(ecorePackage.getEJavaObject());
		g1.getETypeArguments().add(g2);
		addEParameter(op, g1, "context", 0, 1, IS_UNIQUE, IS_ORDERED);

		op = initEOperation(getXPort__XPortType__DiagnosticChain_Map(), ecorePackage.getEBoolean(), "xPortType", 0, 1, IS_UNIQUE, IS_ORDERED);
		addEParameter(op, ecorePackage.getEDiagnosticChain(), "diagnostics", 0, 1, IS_UNIQUE, IS_ORDERED);
		g1 = createEGenericType(ecorePackage.getEMap());
		g2 = createEGenericType(ecorePackage.getEJavaObject());
		g1.getETypeArguments().add(g2);
		g2 = createEGenericType(ecorePackage.getEJavaObject());
		g1.getETypeArguments().add(g2);
		addEParameter(op, g1, "context", 0, 1, IS_UNIQUE, IS_ORDERED);

		op = initEOperation(getXPort__XPortBehaviorPort__DiagnosticChain_Map(), ecorePackage.getEBoolean(), "xPortBehaviorPort", 0, 1, IS_UNIQUE, IS_ORDERED);
		addEParameter(op, ecorePackage.getEDiagnosticChain(), "diagnostics", 0, 1, IS_UNIQUE, IS_ORDERED);
		g1 = createEGenericType(ecorePackage.getEMap());
		g2 = createEGenericType(ecorePackage.getEJavaObject());
		g1.getETypeArguments().add(g2);
		g2 = createEGenericType(ecorePackage.getEJavaObject());
		g1.getETypeArguments().add(g2);
		addEParameter(op, g1, "context", 0, 1, IS_UNIQUE, IS_ORDERED);

		op = initEOperation(getXPort__XPortVisibility__DiagnosticChain_Map(), ecorePackage.getEBoolean(), "xPortVisibility", 0, 1, IS_UNIQUE, IS_ORDERED);
		addEParameter(op, ecorePackage.getEDiagnosticChain(), "diagnostics", 0, 1, IS_UNIQUE, IS_ORDERED);
		g1 = createEGenericType(ecorePackage.getEMap());
		g2 = createEGenericType(ecorePackage.getEJavaObject());
		g1.getETypeArguments().add(g2);
		g2 = createEGenericType(ecorePackage.getEJavaObject());
		g1.getETypeArguments().add(g2);
		addEParameter(op, g1, "context", 0, 1, IS_UNIQUE, IS_ORDERED);

		initEClass(xConnectorEClass, XConnector.class, "XConnector", IS_ABSTRACT, !IS_INTERFACE, IS_GENERATED_INSTANCE_CLASS);
		initEReference(getXConnector_Base_Connector(), theUMLPackage.getConnector(), null, "base_Connector", null, 1, 1, XConnector.class, !IS_TRANSIENT, !IS_VOLATILE, IS_CHANGEABLE, !IS_COMPOSITE, IS_RESOLVE_PROXIES, !IS_UNSETTABLE, IS_UNIQUE, !IS_DERIVED, !IS_ORDERED);

		op = initEOperation(getXConnector__XConnectorClassifier__DiagnosticChain_Map(), ecorePackage.getEBoolean(), "xConnectorClassifier", 0, 1, IS_UNIQUE, IS_ORDERED);
		addEParameter(op, ecorePackage.getEDiagnosticChain(), "diagnostics", 0, 1, IS_UNIQUE, IS_ORDERED);
		g1 = createEGenericType(ecorePackage.getEMap());
		g2 = createEGenericType(ecorePackage.getEJavaObject());
		g1.getETypeArguments().add(g2);
		g2 = createEGenericType(ecorePackage.getEJavaObject());
		g1.getETypeArguments().add(g2);
		addEParameter(op, g1, "context", 0, 1, IS_UNIQUE, IS_ORDERED);

		op = initEOperation(getXConnector__XConnectorEnds__DiagnosticChain_Map(), ecorePackage.getEBoolean(), "xConnectorEnds", 0, 1, IS_UNIQUE, IS_ORDERED);
		addEParameter(op, ecorePackage.getEDiagnosticChain(), "diagnostics", 0, 1, IS_UNIQUE, IS_ORDERED);
		g1 = createEGenericType(ecorePackage.getEMap());
		g2 = createEGenericType(ecorePackage.getEJavaObject());
		g1.getETypeArguments().add(g2);
		g2 = createEGenericType(ecorePackage.getEJavaObject());
		g1.getETypeArguments().add(g2);
		addEParameter(op, g1, "context", 0, 1, IS_UNIQUE, IS_ORDERED);

		op = initEOperation(getXConnector__XtConnectorType__DiagnosticChain_Map(), ecorePackage.getEBoolean(), "xtConnectorType", 0, 1, IS_UNIQUE, IS_ORDERED);
		addEParameter(op, ecorePackage.getEDiagnosticChain(), "diagnostics", 0, 1, IS_UNIQUE, IS_ORDERED);
		g1 = createEGenericType(ecorePackage.getEMap());
		g2 = createEGenericType(ecorePackage.getEJavaObject());
		g1.getETypeArguments().add(g2);
		g2 = createEGenericType(ecorePackage.getEJavaObject());
		g1.getETypeArguments().add(g2);
		addEParameter(op, g1, "context", 0, 1, IS_UNIQUE, IS_ORDERED);

		initEClass(xProtocolContainerEClass, XProtocolContainer.class, "XProtocolContainer", IS_ABSTRACT, !IS_INTERFACE, IS_GENERATED_INSTANCE_CLASS);
		initEReference(getXProtocolContainer_Base_Package(), theUMLPackage.getPackage(), null, "base_Package", null, 1, 1, XProtocolContainer.class, !IS_TRANSIENT, !IS_VOLATILE, IS_CHANGEABLE, !IS_COMPOSITE, IS_RESOLVE_PROXIES, !IS_UNSETTABLE, IS_UNIQUE, !IS_DERIVED, !IS_ORDERED);

		op = initEOperation(getXProtocolContainer__XProtocolContainerProtocol__DiagnosticChain_Map(), ecorePackage.getEBoolean(), "xProtocolContainerProtocol", 0, 1, IS_UNIQUE, IS_ORDERED);
		addEParameter(op, ecorePackage.getEDiagnosticChain(), "diagnostics", 0, 1, IS_UNIQUE, IS_ORDERED);
		g1 = createEGenericType(ecorePackage.getEMap());
		g2 = createEGenericType(ecorePackage.getEJavaObject());
		g1.getETypeArguments().add(g2);
		g2 = createEGenericType(ecorePackage.getEJavaObject());
		g1.getETypeArguments().add(g2);
		addEParameter(op, g1, "context", 0, 1, IS_UNIQUE, IS_ORDERED);

		initEClass(xMessageSetEClass, XMessageSet.class, "XMessageSet", IS_ABSTRACT, !IS_INTERFACE, IS_GENERATED_INSTANCE_CLASS);
		initEReference(getXMessageSet_Base_Interface(), theUMLPackage.getInterface(), null, "base_Interface", null, 1, 1, XMessageSet.class, !IS_TRANSIENT, !IS_VOLATILE, IS_CHANGEABLE, !IS_COMPOSITE, IS_RESOLVE_PROXIES, !IS_UNSETTABLE, IS_UNIQUE, !IS_DERIVED, !IS_ORDERED);
		initEAttribute(getXMessageSet_MessageKind(), this.getXMessageKind(), "messageKind", "in", 1, 1, XMessageSet.class, !IS_TRANSIENT, !IS_VOLATILE, IS_CHANGEABLE, !IS_UNSETTABLE, !IS_ID, !IS_UNIQUE, !IS_DERIVED, !IS_ORDERED);

		op = initEOperation(getXMessageSet__XMessageSetIncoming__DiagnosticChain_Map(), ecorePackage.getEBoolean(), "xMessageSetIncoming", 0, 1, IS_UNIQUE, IS_ORDERED);
		addEParameter(op, ecorePackage.getEDiagnosticChain(), "diagnostics", 0, 1, IS_UNIQUE, IS_ORDERED);
		g1 = createEGenericType(ecorePackage.getEMap());
		g2 = createEGenericType(ecorePackage.getEJavaObject());
		g1.getETypeArguments().add(g2);
		g2 = createEGenericType(ecorePackage.getEJavaObject());
		g1.getETypeArguments().add(g2);
		addEParameter(op, g1, "context", 0, 1, IS_UNIQUE, IS_ORDERED);

		op = initEOperation(getXMessageSet__XMessageSetOutgoing__DiagnosticChain_Map(), ecorePackage.getEBoolean(), "xMessageSetOutgoing", 0, 1, IS_UNIQUE, IS_ORDERED);
		addEParameter(op, ecorePackage.getEDiagnosticChain(), "diagnostics", 0, 1, IS_UNIQUE, IS_ORDERED);
		g1 = createEGenericType(ecorePackage.getEMap());
		g2 = createEGenericType(ecorePackage.getEJavaObject());
		g1.getETypeArguments().add(g2);
		g2 = createEGenericType(ecorePackage.getEJavaObject());
		g1.getETypeArguments().add(g2);
		addEParameter(op, g1, "context", 0, 1, IS_UNIQUE, IS_ORDERED);

		op = initEOperation(getXMessageSet__XMessageSetSymmetric__DiagnosticChain_Map(), ecorePackage.getEBoolean(), "xMessageSetSymmetric", 0, 1, IS_UNIQUE, IS_ORDERED);
		addEParameter(op, ecorePackage.getEDiagnosticChain(), "diagnostics", 0, 1, IS_UNIQUE, IS_ORDERED);
		g1 = createEGenericType(ecorePackage.getEMap());
		g2 = createEGenericType(ecorePackage.getEJavaObject());
		g1.getETypeArguments().add(g2);
		g2 = createEGenericType(ecorePackage.getEJavaObject());
		g1.getETypeArguments().add(g2);
		addEParameter(op, g1, "context", 0, 1, IS_UNIQUE, IS_ORDERED);

		initEClass(xEnumerationEClass, XEnumeration.class, "XEnumeration", IS_ABSTRACT, !IS_INTERFACE, IS_GENERATED_INSTANCE_CLASS);
		initEReference(getXEnumeration_Base_Enumeration(), theUMLPackage.getEnumeration(), null, "base_Enumeration", null, 1, 1, XEnumeration.class, !IS_TRANSIENT, !IS_VOLATILE, IS_CHANGEABLE, !IS_COMPOSITE, IS_RESOLVE_PROXIES, !IS_UNSETTABLE, IS_UNIQUE, !IS_DERIVED, !IS_ORDERED);

		op = initEOperation(getXEnumeration__XEnumerationAttributes__DiagnosticChain_Map(), ecorePackage.getEBoolean(), "xEnumerationAttributes", 0, 1, IS_UNIQUE, IS_ORDERED);
		addEParameter(op, ecorePackage.getEDiagnosticChain(), "diagnostics", 0, 1, IS_UNIQUE, IS_ORDERED);
		g1 = createEGenericType(ecorePackage.getEMap());
		g2 = createEGenericType(ecorePackage.getEJavaObject());
		g1.getETypeArguments().add(g2);
		g2 = createEGenericType(ecorePackage.getEJavaObject());
		g1.getETypeArguments().add(g2);
		addEParameter(op, g1, "context", 0, 1, IS_UNIQUE, IS_ORDERED);

		initEClass(xAssociationClassEClass, XAssociationClass.class, "XAssociationClass", IS_ABSTRACT, !IS_INTERFACE, IS_GENERATED_INSTANCE_CLASS);
		initEReference(getXAssociationClass_Base_AssociationClass(), theUMLPackage.getAssociationClass(), null, "base_AssociationClass", null, 1, 1, XAssociationClass.class, !IS_TRANSIENT, !IS_VOLATILE, IS_CHANGEABLE, !IS_COMPOSITE, IS_RESOLVE_PROXIES, !IS_UNSETTABLE, IS_UNIQUE, !IS_DERIVED, !IS_ORDERED);

		initEClass(xTriggerEClass, XTrigger.class, "XTrigger", IS_ABSTRACT, !IS_INTERFACE, IS_GENERATED_INSTANCE_CLASS);
		initEReference(getXTrigger_Base_Trigger(), theUMLPackage.getTrigger(), null, "base_Trigger", null, 1, 1, XTrigger.class, !IS_TRANSIENT, !IS_VOLATILE, IS_CHANGEABLE, !IS_COMPOSITE, IS_RESOLVE_PROXIES, !IS_UNSETTABLE, IS_UNIQUE, !IS_DERIVED, !IS_ORDERED);

		op = initEOperation(getXTrigger__XTriggerSignalReception__DiagnosticChain_Map(), ecorePackage.getEBoolean(), "xTriggerSignalReception", 0, 1, IS_UNIQUE, IS_ORDERED);
		addEParameter(op, ecorePackage.getEDiagnosticChain(), "diagnostics", 0, 1, IS_UNIQUE, IS_ORDERED);
		g1 = createEGenericType(ecorePackage.getEMap());
		g2 = createEGenericType(ecorePackage.getEJavaObject());
		g1.getETypeArguments().add(g2);
		g2 = createEGenericType(ecorePackage.getEJavaObject());
		g1.getETypeArguments().add(g2);
		addEParameter(op, g1, "context", 0, 1, IS_UNIQUE, IS_ORDERED);

		op = initEOperation(getXTrigger__XTriggerEvents__DiagnosticChain_Map(), ecorePackage.getEBoolean(), "xTriggerEvents", 0, 1, IS_UNIQUE, IS_ORDERED);
		addEParameter(op, ecorePackage.getEDiagnosticChain(), "diagnostics", 0, 1, IS_UNIQUE, IS_ORDERED);
		g1 = createEGenericType(ecorePackage.getEMap());
		g2 = createEGenericType(ecorePackage.getEJavaObject());
		g1.getETypeArguments().add(g2);
		g2 = createEGenericType(ecorePackage.getEJavaObject());
		g1.getETypeArguments().add(g2);
		addEParameter(op, g1, "context", 0, 1, IS_UNIQUE, IS_ORDERED);

		op = initEOperation(getXTrigger__XTriggerCalledOperation__DiagnosticChain_Map(), ecorePackage.getEBoolean(), "xTriggerCalledOperation", 0, 1, IS_UNIQUE, IS_ORDERED);
		addEParameter(op, ecorePackage.getEDiagnosticChain(), "diagnostics", 0, 1, IS_UNIQUE, IS_ORDERED);
		g1 = createEGenericType(ecorePackage.getEMap());
		g2 = createEGenericType(ecorePackage.getEJavaObject());
		g1.getETypeArguments().add(g2);
		g2 = createEGenericType(ecorePackage.getEJavaObject());
		g1.getETypeArguments().add(g2);
		addEParameter(op, g1, "context", 0, 1, IS_UNIQUE, IS_ORDERED);

		initEClass(xStateMachineEClass, XStateMachine.class, "XStateMachine", IS_ABSTRACT, !IS_INTERFACE, IS_GENERATED_INSTANCE_CLASS);
		initEReference(getXStateMachine_Base_StateMachine(), theUMLPackage.getStateMachine(), null, "base_StateMachine", null, 1, 1, XStateMachine.class, !IS_TRANSIENT, !IS_VOLATILE, IS_CHANGEABLE, !IS_COMPOSITE, IS_RESOLVE_PROXIES, !IS_UNSETTABLE, IS_UNIQUE, !IS_DERIVED, !IS_ORDERED);

		op = initEOperation(getXStateMachine__XStateMachineOneRegion__DiagnosticChain_Map(), ecorePackage.getEBoolean(), "xStateMachineOneRegion", 0, 1, IS_UNIQUE, IS_ORDERED);
		addEParameter(op, ecorePackage.getEDiagnosticChain(), "diagnostics", 0, 1, IS_UNIQUE, IS_ORDERED);
		g1 = createEGenericType(ecorePackage.getEMap());
		g2 = createEGenericType(ecorePackage.getEJavaObject());
		g1.getETypeArguments().add(g2);
		g2 = createEGenericType(ecorePackage.getEJavaObject());
		g1.getETypeArguments().add(g2);
		addEParameter(op, g1, "context", 0, 1, IS_UNIQUE, IS_ORDERED);

		op = initEOperation(getXStateMachine__XStateMachineInitialState__DiagnosticChain_Map(), ecorePackage.getEBoolean(), "xStateMachineInitialState", 0, 1, IS_UNIQUE, IS_ORDERED);
		addEParameter(op, ecorePackage.getEDiagnosticChain(), "diagnostics", 0, 1, IS_UNIQUE, IS_ORDERED);
		g1 = createEGenericType(ecorePackage.getEMap());
		g2 = createEGenericType(ecorePackage.getEJavaObject());
		g1.getETypeArguments().add(g2);
		g2 = createEGenericType(ecorePackage.getEJavaObject());
		g1.getETypeArguments().add(g2);
		addEParameter(op, g1, "context", 0, 1, IS_UNIQUE, IS_ORDERED);

		op = initEOperation(getXStateMachine__XStateMachineContext__DiagnosticChain_Map(), ecorePackage.getEBoolean(), "xStateMachineContext", 0, 1, IS_UNIQUE, IS_ORDERED);
		addEParameter(op, ecorePackage.getEDiagnosticChain(), "diagnostics", 0, 1, IS_UNIQUE, IS_ORDERED);
		g1 = createEGenericType(ecorePackage.getEMap());
		g2 = createEGenericType(ecorePackage.getEJavaObject());
		g1.getETypeArguments().add(g2);
		g2 = createEGenericType(ecorePackage.getEJavaObject());
		g1.getETypeArguments().add(g2);
		addEParameter(op, g1, "context", 0, 1, IS_UNIQUE, IS_ORDERED);

		op = initEOperation(getXStateMachine__XStateMachineNoParameters__DiagnosticChain_Map(), ecorePackage.getEBoolean(), "xStateMachineNoParameters", 0, 1, IS_UNIQUE, IS_ORDERED);
		addEParameter(op, ecorePackage.getEDiagnosticChain(), "diagnostics", 0, 1, IS_UNIQUE, IS_ORDERED);
		g1 = createEGenericType(ecorePackage.getEMap());
		g2 = createEGenericType(ecorePackage.getEJavaObject());
		g1.getETypeArguments().add(g2);
		g2 = createEGenericType(ecorePackage.getEJavaObject());
		g1.getETypeArguments().add(g2);
		addEParameter(op, g1, "context", 0, 1, IS_UNIQUE, IS_ORDERED);

		op = initEOperation(getXStateMachine__XStateMachineRegions__DiagnosticChain_Map(), ecorePackage.getEBoolean(), "xStateMachineRegions", 0, 1, IS_UNIQUE, IS_ORDERED);
		addEParameter(op, ecorePackage.getEDiagnosticChain(), "diagnostics", 0, 1, IS_UNIQUE, IS_ORDERED);
		g1 = createEGenericType(ecorePackage.getEMap());
		g2 = createEGenericType(ecorePackage.getEJavaObject());
		g1.getETypeArguments().add(g2);
		g2 = createEGenericType(ecorePackage.getEJavaObject());
		g1.getETypeArguments().add(g2);
		addEParameter(op, g1, "context", 0, 1, IS_UNIQUE, IS_ORDERED);

		initEClass(xRegionEClass, XRegion.class, "XRegion", IS_ABSTRACT, !IS_INTERFACE, IS_GENERATED_INSTANCE_CLASS);
		initEReference(getXRegion_Base_Region(), theUMLPackage.getRegion(), null, "base_Region", null, 1, 1, XRegion.class, !IS_TRANSIENT, !IS_VOLATILE, IS_CHANGEABLE, !IS_COMPOSITE, IS_RESOLVE_PROXIES, !IS_UNSETTABLE, IS_UNIQUE, !IS_DERIVED, !IS_ORDERED);

		op = initEOperation(getXRegion__XRegionSubvertexes__DiagnosticChain_Map(), ecorePackage.getEBoolean(), "xRegionSubvertexes", 0, 1, IS_UNIQUE, IS_ORDERED);
		addEParameter(op, ecorePackage.getEDiagnosticChain(), "diagnostics", 0, 1, IS_UNIQUE, IS_ORDERED);
		g1 = createEGenericType(ecorePackage.getEMap());
		g2 = createEGenericType(ecorePackage.getEJavaObject());
		g1.getETypeArguments().add(g2);
		g2 = createEGenericType(ecorePackage.getEJavaObject());
		g1.getETypeArguments().add(g2);
		addEParameter(op, g1, "context", 0, 1, IS_UNIQUE, IS_ORDERED);

		op = initEOperation(getXRegion__XRegionTransitions__DiagnosticChain_Map(), ecorePackage.getEBoolean(), "xRegionTransitions", 0, 1, IS_UNIQUE, IS_ORDERED);
		addEParameter(op, ecorePackage.getEDiagnosticChain(), "diagnostics", 0, 1, IS_UNIQUE, IS_ORDERED);
		g1 = createEGenericType(ecorePackage.getEMap());
		g2 = createEGenericType(ecorePackage.getEJavaObject());
		g1.getETypeArguments().add(g2);
		g2 = createEGenericType(ecorePackage.getEJavaObject());
		g1.getETypeArguments().add(g2);
		addEParameter(op, g1, "context", 0, 1, IS_UNIQUE, IS_ORDERED);

		initEClass(xStateEClass, XState.class, "XState", IS_ABSTRACT, !IS_INTERFACE, IS_GENERATED_INSTANCE_CLASS);
		initEReference(getXState_Base_State(), theUMLPackage.getState(), null, "base_State", null, 1, 1, XState.class, !IS_TRANSIENT, !IS_VOLATILE, IS_CHANGEABLE, !IS_COMPOSITE, IS_RESOLVE_PROXIES, !IS_UNSETTABLE, IS_UNIQUE, !IS_DERIVED, !IS_ORDERED);

		op = initEOperation(getXState__XStateBehaviors__DiagnosticChain_Map(), ecorePackage.getEBoolean(), "xStateBehaviors", 0, 1, IS_UNIQUE, IS_ORDERED);
		addEParameter(op, ecorePackage.getEDiagnosticChain(), "diagnostics", 0, 1, IS_UNIQUE, IS_ORDERED);
		g1 = createEGenericType(ecorePackage.getEMap());
		g2 = createEGenericType(ecorePackage.getEJavaObject());
		g1.getETypeArguments().add(g2);
		g2 = createEGenericType(ecorePackage.getEJavaObject());
		g1.getETypeArguments().add(g2);
		addEParameter(op, g1, "context", 0, 1, IS_UNIQUE, IS_ORDERED);

		op = initEOperation(getXState__XStateNoDoActivity__DiagnosticChain_Map(), ecorePackage.getEBoolean(), "xStateNoDoActivity", 0, 1, IS_UNIQUE, IS_ORDERED);
		addEParameter(op, ecorePackage.getEDiagnosticChain(), "diagnostics", 0, 1, IS_UNIQUE, IS_ORDERED);
		g1 = createEGenericType(ecorePackage.getEMap());
		g2 = createEGenericType(ecorePackage.getEJavaObject());
		g1.getETypeArguments().add(g2);
		g2 = createEGenericType(ecorePackage.getEJavaObject());
		g1.getETypeArguments().add(g2);
		addEParameter(op, g1, "context", 0, 1, IS_UNIQUE, IS_ORDERED);

		op = initEOperation(getXState__XStateOneRegion__DiagnosticChain_Map(), ecorePackage.getEBoolean(), "xStateOneRegion", 0, 1, IS_UNIQUE, IS_ORDERED);
		addEParameter(op, ecorePackage.getEDiagnosticChain(), "diagnostics", 0, 1, IS_UNIQUE, IS_ORDERED);
		g1 = createEGenericType(ecorePackage.getEMap());
		g2 = createEGenericType(ecorePackage.getEJavaObject());
		g1.getETypeArguments().add(g2);
		g2 = createEGenericType(ecorePackage.getEJavaObject());
		g1.getETypeArguments().add(g2);
		addEParameter(op, g1, "context", 0, 1, IS_UNIQUE, IS_ORDERED);

		op = initEOperation(getXState__XStateNoSubmachine__DiagnosticChain_Map(), ecorePackage.getEBoolean(), "xStateNoSubmachine", 0, 1, IS_UNIQUE, IS_ORDERED);
		addEParameter(op, ecorePackage.getEDiagnosticChain(), "diagnostics", 0, 1, IS_UNIQUE, IS_ORDERED);
		g1 = createEGenericType(ecorePackage.getEMap());
		g2 = createEGenericType(ecorePackage.getEJavaObject());
		g1.getETypeArguments().add(g2);
		g2 = createEGenericType(ecorePackage.getEJavaObject());
		g1.getETypeArguments().add(g2);
		addEParameter(op, g1, "context", 0, 1, IS_UNIQUE, IS_ORDERED);

		op = initEOperation(getXState__XStateRegions__DiagnosticChain_Map(), ecorePackage.getEBoolean(), "xStateRegions", 0, 1, IS_UNIQUE, IS_ORDERED);
		addEParameter(op, ecorePackage.getEDiagnosticChain(), "diagnostics", 0, 1, IS_UNIQUE, IS_ORDERED);
		g1 = createEGenericType(ecorePackage.getEMap());
		g2 = createEGenericType(ecorePackage.getEJavaObject());
		g1.getETypeArguments().add(g2);
		g2 = createEGenericType(ecorePackage.getEJavaObject());
		g1.getETypeArguments().add(g2);
		addEParameter(op, g1, "context", 0, 1, IS_UNIQUE, IS_ORDERED);

		initEClass(xVertexEClass, XVertex.class, "XVertex", IS_ABSTRACT, !IS_INTERFACE, IS_GENERATED_INSTANCE_CLASS);
		initEReference(getXVertex_Base_Vertex(), theUMLPackage.getVertex(), null, "base_Vertex", null, 1, 1, XVertex.class, !IS_TRANSIENT, !IS_VOLATILE, IS_CHANGEABLE, !IS_COMPOSITE, IS_RESOLVE_PROXIES, !IS_UNSETTABLE, IS_UNIQUE, !IS_DERIVED, !IS_ORDERED);

		initEClass(xPseudostateEClass, XPseudostate.class, "XPseudostate", IS_ABSTRACT, !IS_INTERFACE, IS_GENERATED_INSTANCE_CLASS);
		initEReference(getXPseudostate_Base_Pseudostate(), theUMLPackage.getPseudostate(), null, "base_Pseudostate", null, 1, 1, XPseudostate.class, !IS_TRANSIENT, !IS_VOLATILE, IS_CHANGEABLE, !IS_COMPOSITE, IS_RESOLVE_PROXIES, !IS_UNSETTABLE, IS_UNIQUE, !IS_DERIVED, !IS_ORDERED);

		op = initEOperation(getXPseudostate__XPsuedostateKind__DiagnosticChain_Map(), ecorePackage.getEBoolean(), "xPsuedostateKind", 0, 1, IS_UNIQUE, IS_ORDERED);
		addEParameter(op, ecorePackage.getEDiagnosticChain(), "diagnostics", 0, 1, IS_UNIQUE, IS_ORDERED);
		g1 = createEGenericType(ecorePackage.getEMap());
		g2 = createEGenericType(ecorePackage.getEJavaObject());
		g1.getETypeArguments().add(g2);
		g2 = createEGenericType(ecorePackage.getEJavaObject());
		g1.getETypeArguments().add(g2);
		addEParameter(op, g1, "context", 0, 1, IS_UNIQUE, IS_ORDERED);

		initEClass(xTransitionEClass, XTransition.class, "XTransition", IS_ABSTRACT, !IS_INTERFACE, IS_GENERATED_INSTANCE_CLASS);
		initEReference(getXTransition_Base_Transition(), theUMLPackage.getTransition(), null, "base_Transition", null, 1, 1, XTransition.class, !IS_TRANSIENT, !IS_VOLATILE, IS_CHANGEABLE, !IS_COMPOSITE, IS_RESOLVE_PROXIES, !IS_UNSETTABLE, IS_UNIQUE, !IS_DERIVED, !IS_ORDERED);

		op = initEOperation(getXTransition__XTransitionTrigger__DiagnosticChain_Map(), ecorePackage.getEBoolean(), "xTransitionTrigger", 0, 1, IS_UNIQUE, IS_ORDERED);
		addEParameter(op, ecorePackage.getEDiagnosticChain(), "diagnostics", 0, 1, IS_UNIQUE, IS_ORDERED);
		g1 = createEGenericType(ecorePackage.getEMap());
		g2 = createEGenericType(ecorePackage.getEJavaObject());
		g1.getETypeArguments().add(g2);
		g2 = createEGenericType(ecorePackage.getEJavaObject());
		g1.getETypeArguments().add(g2);
		addEParameter(op, g1, "context", 0, 1, IS_UNIQUE, IS_ORDERED);

		op = initEOperation(getXTransition__XTransitionGuard__DiagnosticChain_Map(), ecorePackage.getEBoolean(), "xTransitionGuard", 0, 1, IS_UNIQUE, IS_ORDERED);
		addEParameter(op, ecorePackage.getEDiagnosticChain(), "diagnostics", 0, 1, IS_UNIQUE, IS_ORDERED);
		g1 = createEGenericType(ecorePackage.getEMap());
		g2 = createEGenericType(ecorePackage.getEJavaObject());
		g1.getETypeArguments().add(g2);
		g2 = createEGenericType(ecorePackage.getEJavaObject());
		g1.getETypeArguments().add(g2);
		addEParameter(op, g1, "context", 0, 1, IS_UNIQUE, IS_ORDERED);

		op = initEOperation(getXTransition__XTransitionEffect__DiagnosticChain_Map(), ecorePackage.getEBoolean(), "xTransitionEffect", 0, 1, IS_UNIQUE, IS_ORDERED);
		addEParameter(op, ecorePackage.getEDiagnosticChain(), "diagnostics", 0, 1, IS_UNIQUE, IS_ORDERED);
		g1 = createEGenericType(ecorePackage.getEMap());
		g2 = createEGenericType(ecorePackage.getEJavaObject());
		g1.getETypeArguments().add(g2);
		g2 = createEGenericType(ecorePackage.getEJavaObject());
		g1.getETypeArguments().add(g2);
		addEParameter(op, g1, "context", 0, 1, IS_UNIQUE, IS_ORDERED);

		initEClass(xActivityEClass, XActivity.class, "XActivity", IS_ABSTRACT, !IS_INTERFACE, IS_GENERATED_INSTANCE_CLASS);
		initEReference(getXActivity_Base_Activity(), theUMLPackage.getActivity(), null, "base_Activity", null, 1, 1, XActivity.class, !IS_TRANSIENT, !IS_VOLATILE, IS_CHANGEABLE, !IS_COMPOSITE, IS_RESOLVE_PROXIES, !IS_UNSETTABLE, IS_UNIQUE, !IS_DERIVED, !IS_ORDERED);

		op = initEOperation(getXActivity__XActivityParameters__DiagnosticChain_Map(), ecorePackage.getEBoolean(), "xActivityParameters", 0, 1, IS_UNIQUE, IS_ORDERED);
		addEParameter(op, ecorePackage.getEDiagnosticChain(), "diagnostics", 0, 1, IS_UNIQUE, IS_ORDERED);
		g1 = createEGenericType(ecorePackage.getEMap());
		g2 = createEGenericType(ecorePackage.getEJavaObject());
		g1.getETypeArguments().add(g2);
		g2 = createEGenericType(ecorePackage.getEJavaObject());
		g1.getETypeArguments().add(g2);
		addEParameter(op, g1, "context", 0, 1, IS_UNIQUE, IS_ORDERED);

		op = initEOperation(getXActivity__XActivityTextualRepresentation__DiagnosticChain_Map(), ecorePackage.getEBoolean(), "xActivityTextualRepresentation", 0, 1, IS_UNIQUE, IS_ORDERED);
		addEParameter(op, ecorePackage.getEDiagnosticChain(), "diagnostics", 0, 1, IS_UNIQUE, IS_ORDERED);
		g1 = createEGenericType(ecorePackage.getEMap());
		g2 = createEGenericType(ecorePackage.getEJavaObject());
		g1.getETypeArguments().add(g2);
		g2 = createEGenericType(ecorePackage.getEJavaObject());
		g1.getETypeArguments().add(g2);
		addEParameter(op, g1, "context", 0, 1, IS_UNIQUE, IS_ORDERED);

		initEClass(xActionBehaviorEClass, XActionBehavior.class, "XActionBehavior", IS_ABSTRACT, !IS_INTERFACE, IS_GENERATED_INSTANCE_CLASS);

		initEClass(xConstraintEClass, XConstraint.class, "XConstraint", IS_ABSTRACT, !IS_INTERFACE, IS_GENERATED_INSTANCE_CLASS);
		initEReference(getXConstraint_Base_Constraint(), theUMLPackage.getConstraint(), null, "base_Constraint", null, 1, 1, XConstraint.class, !IS_TRANSIENT, !IS_VOLATILE, IS_CHANGEABLE, !IS_COMPOSITE, IS_RESOLVE_PROXIES, !IS_UNSETTABLE, IS_UNIQUE, !IS_DERIVED, !IS_ORDERED);

		op = initEOperation(getXConstraint__XConstraintSpecification__DiagnosticChain_Map(), ecorePackage.getEBoolean(), "xConstraintSpecification", 0, 1, IS_UNIQUE, IS_ORDERED);
		addEParameter(op, ecorePackage.getEDiagnosticChain(), "diagnostics", 0, 1, IS_UNIQUE, IS_ORDERED);
		g1 = createEGenericType(ecorePackage.getEMap());
		g2 = createEGenericType(ecorePackage.getEJavaObject());
		g1.getETypeArguments().add(g2);
		g2 = createEGenericType(ecorePackage.getEJavaObject());
		g1.getETypeArguments().add(g2);
		addEParameter(op, g1, "context", 0, 1, IS_UNIQUE, IS_ORDERED);

		op = initEOperation(getXConstraint__XConstraintBehavior__DiagnosticChain_Map(), ecorePackage.getEBoolean(), "xConstraintBehavior", 0, 1, IS_UNIQUE, IS_ORDERED);
		addEParameter(op, ecorePackage.getEDiagnosticChain(), "diagnostics", 0, 1, IS_UNIQUE, IS_ORDERED);
		g1 = createEGenericType(ecorePackage.getEMap());
		g2 = createEGenericType(ecorePackage.getEJavaObject());
		g1.getETypeArguments().add(g2);
		g2 = createEGenericType(ecorePackage.getEJavaObject());
		g1.getETypeArguments().add(g2);
		addEParameter(op, g1, "context", 0, 1, IS_UNIQUE, IS_ORDERED);

		initEClass(xOpaqueBehaviorEClass, XOpaqueBehavior.class, "XOpaqueBehavior", IS_ABSTRACT, !IS_INTERFACE, IS_GENERATED_INSTANCE_CLASS);
		initEReference(getXOpaqueBehavior_Base_OpaqueBehavior(), theUMLPackage.getOpaqueBehavior(), null, "base_OpaqueBehavior", null, 1, 1, XOpaqueBehavior.class, !IS_TRANSIENT, !IS_VOLATILE, IS_CHANGEABLE, !IS_COMPOSITE, IS_RESOLVE_PROXIES, !IS_UNSETTABLE, IS_UNIQUE, !IS_DERIVED, !IS_ORDERED);
		initEAttribute(getXOpaqueBehavior_IsExternal(), theTypesPackage.getBoolean(), "isExternal", "false", 1, 1, XOpaqueBehavior.class, !IS_TRANSIENT, !IS_VOLATILE, IS_CHANGEABLE, !IS_UNSETTABLE, !IS_ID, !IS_UNIQUE, !IS_DERIVED, !IS_ORDERED);

		op = initEOperation(getXOpaqueBehavior__XOpaqueBehaviorExternal__DiagnosticChain_Map(), ecorePackage.getEBoolean(), "xOpaqueBehaviorExternal", 0, 1, IS_UNIQUE, IS_ORDERED);
		addEParameter(op, ecorePackage.getEDiagnosticChain(), "diagnostics", 0, 1, IS_UNIQUE, IS_ORDERED);
		g1 = createEGenericType(ecorePackage.getEMap());
		g2 = createEGenericType(ecorePackage.getEJavaObject());
		g1.getETypeArguments().add(g2);
		g2 = createEGenericType(ecorePackage.getEJavaObject());
		g1.getETypeArguments().add(g2);
		addEParameter(op, g1, "context", 0, 1, IS_UNIQUE, IS_ORDERED);

		initEClass(xConstrainedTypeEClass, XConstrainedType.class, "XConstrainedType", IS_ABSTRACT, !IS_INTERFACE, IS_GENERATED_INSTANCE_CLASS);
		initEReference(getXConstrainedType_Base_PrimitiveType(), theUMLPackage.getPrimitiveType(), null, "base_PrimitiveType", null, 1, 1, XConstrainedType.class, !IS_TRANSIENT, !IS_VOLATILE, IS_CHANGEABLE, !IS_COMPOSITE, IS_RESOLVE_PROXIES, !IS_UNSETTABLE, IS_UNIQUE, !IS_DERIVED, !IS_ORDERED);
		initEReference(getXConstrainedType_LowerBound(), theUMLPackage.getLiteralSpecification(), null, "lowerBound", null, 0, 1, XConstrainedType.class, !IS_TRANSIENT, !IS_VOLATILE, IS_CHANGEABLE, !IS_COMPOSITE, IS_RESOLVE_PROXIES, !IS_UNSETTABLE, IS_UNIQUE, !IS_DERIVED, !IS_ORDERED);
		initEReference(getXConstrainedType_UpperBound(), theUMLPackage.getLiteralSpecification(), null, "upperBound", null, 0, 1, XConstrainedType.class, !IS_TRANSIENT, !IS_VOLATILE, IS_CHANGEABLE, !IS_COMPOSITE, IS_RESOLVE_PROXIES, !IS_UNSETTABLE, IS_UNIQUE, !IS_DERIVED, !IS_ORDERED);
		initEAttribute(getXConstrainedType_IsLowerBoundExclusive(), theTypesPackage.getBoolean(), "isLowerBoundExclusive", "false", 1, 1, XConstrainedType.class, !IS_TRANSIENT, !IS_VOLATILE, IS_CHANGEABLE, !IS_UNSETTABLE, !IS_ID, IS_UNIQUE, !IS_DERIVED, !IS_ORDERED);
		initEAttribute(getXConstrainedType_IsUpperBoundExclusive(), theTypesPackage.getBoolean(), "isUpperBoundExclusive", "false", 1, 1, XConstrainedType.class, !IS_TRANSIENT, !IS_VOLATILE, IS_CHANGEABLE, !IS_UNSETTABLE, !IS_ID, IS_UNIQUE, !IS_DERIVED, !IS_ORDERED);

		op = initEOperation(getXConstrainedType__XConstrainedTypePrimitiveType__DiagnosticChain_Map(), ecorePackage.getEBoolean(), "xConstrainedTypePrimitiveType", 0, 1, IS_UNIQUE, IS_ORDERED);
		addEParameter(op, ecorePackage.getEDiagnosticChain(), "diagnostics", 0, 1, IS_UNIQUE, IS_ORDERED);
		g1 = createEGenericType(ecorePackage.getEMap());
		g2 = createEGenericType(ecorePackage.getEJavaObject());
		g1.getETypeArguments().add(g2);
		g2 = createEGenericType(ecorePackage.getEJavaObject());
		g1.getETypeArguments().add(g2);
		addEParameter(op, g1, "context", 0, 1, IS_UNIQUE, IS_ORDERED);

		op = initEOperation(getXConstrainedType__XConstrainedTypeBounds__DiagnosticChain_Map(), ecorePackage.getEBoolean(), "xConstrainedTypeBounds", 0, 1, IS_UNIQUE, IS_ORDERED);
		addEParameter(op, ecorePackage.getEDiagnosticChain(), "diagnostics", 0, 1, IS_UNIQUE, IS_ORDERED);
		g1 = createEGenericType(ecorePackage.getEMap());
		g2 = createEGenericType(ecorePackage.getEJavaObject());
		g1.getETypeArguments().add(g2);
		g2 = createEGenericType(ecorePackage.getEJavaObject());
		g1.getETypeArguments().add(g2);
		addEParameter(op, g1, "context", 0, 1, IS_UNIQUE, IS_ORDERED);

		initEClass(xGeneralizationEClass, XGeneralization.class, "XGeneralization", IS_ABSTRACT, !IS_INTERFACE, IS_GENERATED_INSTANCE_CLASS);
		initEReference(getXGeneralization_Base_Generalization(), theUMLPackage.getGeneralization(), null, "base_Generalization", null, 1, 1, XGeneralization.class, !IS_TRANSIENT, !IS_VOLATILE, IS_CHANGEABLE, !IS_COMPOSITE, IS_RESOLVE_PROXIES, !IS_UNSETTABLE, IS_UNIQUE, !IS_DERIVED, !IS_ORDERED);

		op = initEOperation(getXGeneralization__XGeneralizationClassifiers__DiagnosticChain_Map(), ecorePackage.getEBoolean(), "xGeneralizationClassifiers", 0, 1, IS_UNIQUE, IS_ORDERED);
		addEParameter(op, ecorePackage.getEDiagnosticChain(), "diagnostics", 0, 1, IS_UNIQUE, IS_ORDERED);
		g1 = createEGenericType(ecorePackage.getEMap());
		g2 = createEGenericType(ecorePackage.getEJavaObject());
		g1.getETypeArguments().add(g2);
		g2 = createEGenericType(ecorePackage.getEJavaObject());
		g1.getETypeArguments().add(g2);
		addEParameter(op, g1, "context", 0, 1, IS_UNIQUE, IS_ORDERED);

		op = initEOperation(getXGeneralization__XGeneralizationGeneralizationSet__DiagnosticChain_Map(), ecorePackage.getEBoolean(), "xGeneralizationGeneralizationSet", 0, 1, IS_UNIQUE, IS_ORDERED);
		addEParameter(op, ecorePackage.getEDiagnosticChain(), "diagnostics", 0, 1, IS_UNIQUE, IS_ORDERED);
		g1 = createEGenericType(ecorePackage.getEMap());
		g2 = createEGenericType(ecorePackage.getEJavaObject());
		g1.getETypeArguments().add(g2);
		g2 = createEGenericType(ecorePackage.getEJavaObject());
		g1.getETypeArguments().add(g2);
		addEParameter(op, g1, "context", 0, 1, IS_UNIQUE, IS_ORDERED);

		initEClass(xGeneralizationSetEClass, XGeneralizationSet.class, "XGeneralizationSet", IS_ABSTRACT, !IS_INTERFACE, IS_GENERATED_INSTANCE_CLASS);
		initEReference(getXGeneralizationSet_Base_GeneralizationSet(), theUMLPackage.getGeneralizationSet(), null, "base_GeneralizationSet", null, 1, 1, XGeneralizationSet.class, !IS_TRANSIENT, !IS_VOLATILE, IS_CHANGEABLE, !IS_COMPOSITE, IS_RESOLVE_PROXIES, !IS_UNSETTABLE, IS_UNIQUE, !IS_DERIVED, !IS_ORDERED);

		initEClass(xClassEClass, XClass.class, "XClass", IS_ABSTRACT, !IS_INTERFACE, IS_GENERATED_INSTANCE_CLASS);
		initEReference(getXClass_Base_Class(), theUMLPackage.getClass_(), null, "base_Class", null, 1, 1, XClass.class, !IS_TRANSIENT, !IS_VOLATILE, IS_CHANGEABLE, !IS_COMPOSITE, IS_RESOLVE_PROXIES, !IS_UNSETTABLE, IS_UNIQUE, !IS_DERIVED, !IS_ORDERED);
		initEAttribute(getXClass_IsExternal(), theTypesPackage.getBoolean(), "isExternal", "false", 1, 1, XClass.class, !IS_TRANSIENT, !IS_VOLATILE, IS_CHANGEABLE, !IS_UNSETTABLE, !IS_ID, IS_UNIQUE, !IS_DERIVED, !IS_ORDERED);

		op = initEOperation(getXClass__XClassMetaclass__DiagnosticChain_Map(), ecorePackage.getEBoolean(), "xClassMetaclass", 0, 1, IS_UNIQUE, IS_ORDERED);
		addEParameter(op, ecorePackage.getEDiagnosticChain(), "diagnostics", 0, 1, IS_UNIQUE, IS_ORDERED);
		g1 = createEGenericType(ecorePackage.getEMap());
		g2 = createEGenericType(ecorePackage.getEJavaObject());
		g1.getETypeArguments().add(g2);
		g2 = createEGenericType(ecorePackage.getEJavaObject());
		g1.getETypeArguments().add(g2);
		addEParameter(op, g1, "context", 0, 1, IS_UNIQUE, IS_ORDERED);

		op = initEOperation(getXClass__XClassNestedClassifiers__DiagnosticChain_Map(), ecorePackage.getEBoolean(), "xClassNestedClassifiers", 0, 1, IS_UNIQUE, IS_ORDERED);
		addEParameter(op, ecorePackage.getEDiagnosticChain(), "diagnostics", 0, 1, IS_UNIQUE, IS_ORDERED);
		g1 = createEGenericType(ecorePackage.getEMap());
		g2 = createEGenericType(ecorePackage.getEJavaObject());
		g1.getETypeArguments().add(g2);
		g2 = createEGenericType(ecorePackage.getEJavaObject());
		g1.getETypeArguments().add(g2);
		addEParameter(op, g1, "context", 0, 1, IS_UNIQUE, IS_ORDERED);

		op = initEOperation(getXClass__XClassExternal__DiagnosticChain_Map(), ecorePackage.getEBoolean(), "xClassExternal", 0, 1, IS_UNIQUE, IS_ORDERED);
		addEParameter(op, ecorePackage.getEDiagnosticChain(), "diagnostics", 0, 1, IS_UNIQUE, IS_ORDERED);
		g1 = createEGenericType(ecorePackage.getEMap());
		g2 = createEGenericType(ecorePackage.getEJavaObject());
		g1.getETypeArguments().add(g2);
		g2 = createEGenericType(ecorePackage.getEJavaObject());
		g1.getETypeArguments().add(g2);
		addEParameter(op, g1, "context", 0, 1, IS_UNIQUE, IS_ORDERED);

		initEClass(xConnectorEndEClass, XConnectorEnd.class, "XConnectorEnd", IS_ABSTRACT, !IS_INTERFACE, IS_GENERATED_INSTANCE_CLASS);
		initEReference(getXConnectorEnd_Base_ConnectorEnd(), theUMLPackage.getConnectorEnd(), null, "base_ConnectorEnd", null, 1, 1, XConnectorEnd.class, !IS_TRANSIENT, !IS_VOLATILE, IS_CHANGEABLE, !IS_COMPOSITE, IS_RESOLVE_PROXIES, !IS_UNSETTABLE, IS_UNIQUE, !IS_DERIVED, !IS_ORDERED);

		op = initEOperation(getXConnectorEnd__XConnectorEndConnector__DiagnosticChain_Map(), ecorePackage.getEBoolean(), "xConnectorEndConnector", 0, 1, IS_UNIQUE, IS_ORDERED);
		addEParameter(op, ecorePackage.getEDiagnosticChain(), "diagnostics", 0, 1, IS_UNIQUE, IS_ORDERED);
		g1 = createEGenericType(ecorePackage.getEMap());
		g2 = createEGenericType(ecorePackage.getEJavaObject());
		g1.getETypeArguments().add(g2);
		g2 = createEGenericType(ecorePackage.getEJavaObject());
		g1.getETypeArguments().add(g2);
		addEParameter(op, g1, "context", 0, 1, IS_UNIQUE, IS_ORDERED);

		op = initEOperation(getXConnectorEnd__XConnectorEndRole__DiagnosticChain_Map(), ecorePackage.getEBoolean(), "xConnectorEndRole", 0, 1, IS_UNIQUE, IS_ORDERED);
		addEParameter(op, ecorePackage.getEDiagnosticChain(), "diagnostics", 0, 1, IS_UNIQUE, IS_ORDERED);
		g1 = createEGenericType(ecorePackage.getEMap());
		g2 = createEGenericType(ecorePackage.getEJavaObject());
		g1.getETypeArguments().add(g2);
		g2 = createEGenericType(ecorePackage.getEJavaObject());
		g1.getETypeArguments().add(g2);
		addEParameter(op, g1, "context", 0, 1, IS_UNIQUE, IS_ORDERED);

		op = initEOperation(getXConnectorEnd__XConnectorEndUniqueness__DiagnosticChain_Map(), ecorePackage.getEBoolean(), "xConnectorEndUniqueness", 0, 1, IS_UNIQUE, IS_ORDERED);
		addEParameter(op, ecorePackage.getEDiagnosticChain(), "diagnostics", 0, 1, IS_UNIQUE, IS_ORDERED);
		g1 = createEGenericType(ecorePackage.getEMap());
		g2 = createEGenericType(ecorePackage.getEJavaObject());
		g1.getETypeArguments().add(g2);
		g2 = createEGenericType(ecorePackage.getEJavaObject());
		g1.getETypeArguments().add(g2);
		addEParameter(op, g1, "context", 0, 1, IS_UNIQUE, IS_ORDERED);

		// Initialize enums and add enum literals
		initEEnum(xMessageKindEEnum, XMessageKind.class, "XMessageKind");
		addEEnumLiteral(xMessageKindEEnum, XMessageKind.IN);
		addEEnumLiteral(xMessageKindEEnum, XMessageKind.OUT);
		addEEnumLiteral(xMessageKindEEnum, XMessageKind.INOUT);

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
			 "originalName", "ExecutableModeling"
		   });
	}

} //ExecutableModelingProfilePackageImpl
