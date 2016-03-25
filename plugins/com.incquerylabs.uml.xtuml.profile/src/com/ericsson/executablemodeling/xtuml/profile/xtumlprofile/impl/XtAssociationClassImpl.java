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

import com.ericsson.executablemodeling.xtuml.profile.executablemodelingprofile.impl.XAssociationClassImpl;

import com.ericsson.executablemodeling.xtuml.profile.xtumlprofile.XtAssociation;
import com.ericsson.executablemodeling.xtuml.profile.xtumlprofile.XtAssociationClass;

import com.ericsson.executablemodeling.xtuml.profile.xtumlprofile.util.xtUMLProfileValidator;

import com.ericsson.executablemodeling.xtuml.profile.xtumlprofile.xtUMLProfilePackage;

import java.lang.reflect.InvocationTargetException;

import java.util.Map;

import org.eclipse.emf.common.util.BasicDiagnostic;
import org.eclipse.emf.common.util.Diagnostic;
import org.eclipse.emf.common.util.DiagnosticChain;
import org.eclipse.emf.common.util.EList;

import org.eclipse.emf.ecore.EClass;

import org.eclipse.emf.ecore.plugin.EcorePlugin;

import org.eclipse.emf.ecore.util.EObjectValidator;

/**
 * <!-- begin-user-doc -->
 * An implementation of the model object '<em><b>Xt Association Class</b></em>'.
 * <!-- end-user-doc -->
 *
 * @generated
 */
public class XtAssociationClassImpl extends XAssociationClassImpl implements XtAssociationClass {
	/**
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 */
	protected XtAssociationClassImpl() {
		super();
	}

	/**
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 */
	@Override
	protected EClass eStaticClass() {
		return xtUMLProfilePackage.Literals.XT_ASSOCIATION_CLASS;
	}

	/**
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 */
	public boolean xtAssociationEndOwnership(DiagnosticChain diagnostics, Map<Object, Object> context) {
		// TODO: implement this method
		// -> specify the condition that violates the invariant
		// -> verify the details of the diagnostic, including severity and message
		// Ensure that you remove @generated or mark it @generated NOT
		if (false) {
			if (diagnostics != null) {
				diagnostics.add
					(new BasicDiagnostic
						(Diagnostic.ERROR,
						 xtUMLProfileValidator.DIAGNOSTIC_SOURCE,
						 xtUMLProfileValidator.XT_ASSOCIATION__XT_ASSOCIATION_END_OWNERSHIP,
						 EcorePlugin.INSTANCE.getString("_UI_GenericInvariant_diagnostic", new Object[] { "xtAssociationEndOwnership", EObjectValidator.getObjectLabel(this, context) }),
						 new Object [] { this }));
			}
			return false;
		}
		return true;
	}

	/**
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 */
	public boolean xtAssociationEnds(DiagnosticChain diagnostics, Map<Object, Object> context) {
		// TODO: implement this method
		// -> specify the condition that violates the invariant
		// -> verify the details of the diagnostic, including severity and message
		// Ensure that you remove @generated or mark it @generated NOT
		if (false) {
			if (diagnostics != null) {
				diagnostics.add
					(new BasicDiagnostic
						(Diagnostic.ERROR,
						 xtUMLProfileValidator.DIAGNOSTIC_SOURCE,
						 xtUMLProfileValidator.XT_ASSOCIATION__XT_ASSOCIATION_ENDS,
						 EcorePlugin.INSTANCE.getString("_UI_GenericInvariant_diagnostic", new Object[] { "xtAssociationEnds", EObjectValidator.getObjectLabel(this, context) }),
						 new Object [] { this }));
			}
			return false;
		}
		return true;
	}

	/**
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 */
	public boolean xtAssociationEndType(DiagnosticChain diagnostics, Map<Object, Object> context) {
		// TODO: implement this method
		// -> specify the condition that violates the invariant
		// -> verify the details of the diagnostic, including severity and message
		// Ensure that you remove @generated or mark it @generated NOT
		if (false) {
			if (diagnostics != null) {
				diagnostics.add
					(new BasicDiagnostic
						(Diagnostic.ERROR,
						 xtUMLProfileValidator.DIAGNOSTIC_SOURCE,
						 xtUMLProfileValidator.XT_ASSOCIATION__XT_ASSOCIATION_END_TYPE,
						 EcorePlugin.INSTANCE.getString("_UI_GenericInvariant_diagnostic", new Object[] { "xtAssociationEndType", EObjectValidator.getObjectLabel(this, context) }),
						 new Object [] { this }));
			}
			return false;
		}
		return true;
	}

	/**
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 */
	public boolean xtAssociationGeneralization(DiagnosticChain diagnostics, Map<Object, Object> context) {
		// TODO: implement this method
		// -> specify the condition that violates the invariant
		// -> verify the details of the diagnostic, including severity and message
		// Ensure that you remove @generated or mark it @generated NOT
		if (false) {
			if (diagnostics != null) {
				diagnostics.add
					(new BasicDiagnostic
						(Diagnostic.ERROR,
						 xtUMLProfileValidator.DIAGNOSTIC_SOURCE,
						 xtUMLProfileValidator.XT_ASSOCIATION__XT_ASSOCIATION_GENERALIZATION,
						 EcorePlugin.INSTANCE.getString("_UI_GenericInvariant_diagnostic", new Object[] { "xtAssociationGeneralization", EObjectValidator.getObjectLabel(this, context) }),
						 new Object [] { this }));
			}
			return false;
		}
		return true;
	}

	/**
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 */
	@Override
	public int eDerivedOperationID(int baseOperationID, Class<?> baseClass) {
		if (baseClass == XtAssociation.class) {
			switch (baseOperationID) {
				case xtUMLProfilePackage.XT_ASSOCIATION___XT_ASSOCIATION_END_OWNERSHIP__DIAGNOSTICCHAIN_MAP: return xtUMLProfilePackage.XT_ASSOCIATION_CLASS___XT_ASSOCIATION_END_OWNERSHIP__DIAGNOSTICCHAIN_MAP;
				case xtUMLProfilePackage.XT_ASSOCIATION___XT_ASSOCIATION_ENDS__DIAGNOSTICCHAIN_MAP: return xtUMLProfilePackage.XT_ASSOCIATION_CLASS___XT_ASSOCIATION_ENDS__DIAGNOSTICCHAIN_MAP;
				case xtUMLProfilePackage.XT_ASSOCIATION___XT_ASSOCIATION_END_TYPE__DIAGNOSTICCHAIN_MAP: return xtUMLProfilePackage.XT_ASSOCIATION_CLASS___XT_ASSOCIATION_END_TYPE__DIAGNOSTICCHAIN_MAP;
				case xtUMLProfilePackage.XT_ASSOCIATION___XT_ASSOCIATION_GENERALIZATION__DIAGNOSTICCHAIN_MAP: return xtUMLProfilePackage.XT_ASSOCIATION_CLASS___XT_ASSOCIATION_GENERALIZATION__DIAGNOSTICCHAIN_MAP;
				default: return -1;
			}
		}
		return super.eDerivedOperationID(baseOperationID, baseClass);
	}

	/**
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 */
	@Override
	@SuppressWarnings("unchecked")
	public Object eInvoke(int operationID, EList<?> arguments) throws InvocationTargetException {
		switch (operationID) {
			case xtUMLProfilePackage.XT_ASSOCIATION_CLASS___XT_ASSOCIATION_END_OWNERSHIP__DIAGNOSTICCHAIN_MAP:
				return xtAssociationEndOwnership((DiagnosticChain)arguments.get(0), (Map<Object, Object>)arguments.get(1));
			case xtUMLProfilePackage.XT_ASSOCIATION_CLASS___XT_ASSOCIATION_ENDS__DIAGNOSTICCHAIN_MAP:
				return xtAssociationEnds((DiagnosticChain)arguments.get(0), (Map<Object, Object>)arguments.get(1));
			case xtUMLProfilePackage.XT_ASSOCIATION_CLASS___XT_ASSOCIATION_END_TYPE__DIAGNOSTICCHAIN_MAP:
				return xtAssociationEndType((DiagnosticChain)arguments.get(0), (Map<Object, Object>)arguments.get(1));
			case xtUMLProfilePackage.XT_ASSOCIATION_CLASS___XT_ASSOCIATION_GENERALIZATION__DIAGNOSTICCHAIN_MAP:
				return xtAssociationGeneralization((DiagnosticChain)arguments.get(0), (Map<Object, Object>)arguments.get(1));
		}
		return super.eInvoke(operationID, arguments);
	}

} //XtAssociationClassImpl
