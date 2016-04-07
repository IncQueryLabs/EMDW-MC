/*******************************************************************************
 * Copyright (c) 2015-2016, IncQuery Labs Ltd. and Ericsson AB
 * All rights reserved. This program and the accompanying materials
 * are made available under the terms of the Eclipse Public License v1.0
 * which accompanies this distribution, and is available at
 * http://www.eclipse.org/legal/epl-v10.html
 *
 * Contributors:
 *   Akos Horvath, Abel Hegedus, Zoltan Ujhelyi, Daniel Segesdi, Tamas Borbas, Robert Doczi, Peter Lunk, Istvan Papp - initial API and implementation
 *******************************************************************************/
package com.incquerylabs.emdw.cpp.codegeneration

import com.incquerylabs.emdw.cpp.codegeneration.templates.MainTemplates
import com.ericsson.xtumlrt.oopl.cppmodel.CPPComponent

class MainGeneration {
	MainTemplates templates
	private boolean initialized
	
	def initialize() {
		if(!initialized) {
			templates = new MainTemplates
			initialized = true
		}
	}
	
	def execute(CPPComponent... components) {
		val mainContent = templates.mainWithoutBodyTemplate(components)
		return mainContent
	}
}