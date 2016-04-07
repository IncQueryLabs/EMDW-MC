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

import com.ericsson.executablemodeling.xtuml.profile.executablemodelingprofile.impl.XClassImpl;

import com.ericsson.executablemodeling.xtuml.profile.xtumlprofile.XtClass;

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
 * An implementation of the model object '<em><b>Xt Class</b></em>'.
 * <!-- end-user-doc -->
 *
 * @generated
 */
public class XtClassImpl extends XClassImpl implements XtClass {
	/**
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 */
	protected XtClassImpl() {
		super();
	}

	/**
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 */
	@Override
	protected EClass eStaticClass() {
		return xtUMLProfilePackage.Literals.XT_CLASS;
	}

	/**
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 */
	public boolean xtClassConstructors(DiagnosticChain diagnostics, Map<Object, Object> context) {
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
						 xtUMLProfileValidator.XT_CLASS__XT_CLASS_CONSTRUCTORS,
						 EcorePlugin.INSTANCE.getString("_UI_GenericInvariant_diagnostic", new Object[] { "xtClassConstructors", EObjectValidator.getObjectLabel(this, context) }),
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
	public boolean xtClassClassifierBehavior(DiagnosticChain diagnostics, Map<Object, Object> context) {
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
						 xtUMLProfileValidator.XT_CLASS__XT_CLASS_CLASSIFIER_BEHAVIOR,
						 EcorePlugin.INSTANCE.getString("_UI_GenericInvariant_diagnostic", new Object[] { "xtClassClassifierBehavior", EObjectValidator.getObjectLabel(this, context) }),
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
	public boolean xtClassVisibility(DiagnosticChain diagnostics, Map<Object, Object> context) {
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
						 xtUMLProfileValidator.XT_CLASS__XT_CLASS_VISIBILITY,
						 EcorePlugin.INSTANCE.getString("_UI_GenericInvariant_diagnostic", new Object[] { "xtClassVisibility", EObjectValidator.getObjectLabel(this, context) }),
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
	public boolean xtClassGeneralizationSets(DiagnosticChain diagnostics, Map<Object, Object> context) {
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
						 xtUMLProfileValidator.XT_CLASS__XT_CLASS_GENERALIZATION_SETS,
						 EcorePlugin.INSTANCE.getString("_UI_GenericInvariant_diagnostic", new Object[] { "xtClassGeneralizationSets", EObjectValidator.getObjectLabel(this, context) }),
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
	@SuppressWarnings("unchecked")
	public Object eInvoke(int operationID, EList<?> arguments) throws InvocationTargetException {
		switch (operationID) {
			case xtUMLProfilePackage.XT_CLASS___XT_CLASS_CONSTRUCTORS__DIAGNOSTICCHAIN_MAP:
				return xtClassConstructors((DiagnosticChain)arguments.get(0), (Map<Object, Object>)arguments.get(1));
			case xtUMLProfilePackage.XT_CLASS___XT_CLASS_CLASSIFIER_BEHAVIOR__DIAGNOSTICCHAIN_MAP:
				return xtClassClassifierBehavior((DiagnosticChain)arguments.get(0), (Map<Object, Object>)arguments.get(1));
			case xtUMLProfilePackage.XT_CLASS___XT_CLASS_VISIBILITY__DIAGNOSTICCHAIN_MAP:
				return xtClassVisibility((DiagnosticChain)arguments.get(0), (Map<Object, Object>)arguments.get(1));
			case xtUMLProfilePackage.XT_CLASS___XT_CLASS_GENERALIZATION_SETS__DIAGNOSTICCHAIN_MAP:
				return xtClassGeneralizationSets((DiagnosticChain)arguments.get(0), (Map<Object, Object>)arguments.get(1));
		}
		return super.eInvoke(operationID, arguments);
	}

} //XtClassImpl
