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
package com.ericsson.executablemodeling.xtuml.profile.xtumlprofile;

import com.ericsson.executablemodeling.xtuml.profile.executablemodelingprofile.XConnectorEnd;

import java.util.Map;

import org.eclipse.emf.common.util.DiagnosticChain;

/**
 * <!-- begin-user-doc -->
 * A representation of the model object '<em><b>Xt Connector End</b></em>'.
 * <!-- end-user-doc -->
 *
 * <!-- begin-model-doc -->
 * Question: Should ComponentEnds have multiplicity? Should they allow ordering by value.
 * <!-- end-model-doc -->
 *
 *
 * @see com.ericsson.executablemodeling.xtuml.profile.xtumlprofile.xtUMLProfilePackage#getXtConnectorEnd()
 * @model
 * @generated
 */
public interface XtConnectorEnd extends XConnectorEnd {
	/**
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * <!-- begin-model-doc -->
	 * If the role of the ConnectorEnd is not a Port, then the Connector of the ConnectorEnd shall be a delegation Connector.
	 * @param diagnostics The chain of diagnostics to which problems are to be appended.
	 * @param context The cache of context-specific information.
	 * <!-- end-model-doc -->
	 * @model
	 * @generated
	 */
	boolean xtConnectorEndRole(DiagnosticChain diagnostics, Map<Object, Object> context);

} // XtConnectorEnd
