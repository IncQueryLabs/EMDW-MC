/*******************************************************************************
 * Copyright (c) 2015-2016, IncQuery Labs Ltd. and Ericsson AB
 * All rights reserved. This program and the accompanying materials
 * are made available under the terms of the Eclipse Public License v1.0
 * which accompanies this distribution, and is available at
 * http://www.eclipse.org/legal/epl-v10.html
 *
 * Contributors:
 *   Akos Horvath, Abel Hegedus, Zoltan Ujhelyi, Daniel Segesdi, Tamas Borbas, Robert Doczi, Peter Lunk - initial API and implementation
 *******************************************************************************/
package com.incquerylabs.emdw.cpp.bodyconverter.scoping

import org.eclipse.emf.ecore.EObject
import org.eclipse.incquery.runtime.api.AdvancedIncQueryEngine
import org.eclipse.uml2.uml.OpaqueBehavior
import org.eclipse.uml2.uml.OpaqueExpression

class BasicUMLContextProvider extends com.incquerylabs.uml.ralf.scoping.UMLContextProvider {
	
	private AdvancedIncQueryEngine engine
	private EObject contextObject
	
	new(AdvancedIncQueryEngine engine) {
		this.engine = engine
	}
	
	override protected doGetEngine() {
		engine
	}
	
	override protected getContextObject() {
		if(contextObject!=null) {
			return contextObject
		}
		throw new IllegalArgumentException('''Context has not been set''')
	}
	
	def dispatch public void setContextObject(OpaqueBehavior behavior) {
		contextObject = behavior
	}
	
	def dispatch public void setContextObject(OpaqueExpression expression) {
		contextObject = expression
	}
	
}