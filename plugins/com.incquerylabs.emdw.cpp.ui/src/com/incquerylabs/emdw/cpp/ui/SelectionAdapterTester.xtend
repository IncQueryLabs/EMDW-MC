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
package com.incquerylabs.emdw.cpp.ui

import org.eclipse.core.expressions.PropertyTester
import org.eclipse.core.runtime.IAdaptable
import org.eclipse.uml2.uml.Model
import org.eclipse.core.resources.ResourcesPlugin

class SelectionAdapterTester extends PropertyTester {
	
	override test(Object receiver, String property, Object[] args, Object expectedValue) {
		if (receiver instanceof IAdaptable){
			if(property == "isumlmodel"){
				val model = receiver.getAdapter(Model) as Model
				if(model != null){
					val modelPlatformPath = model.eResource.URI.toPlatformString(true)
					if(modelPlatformPath == null) {
						return false
					}
					val modelResource = ResourcesPlugin.workspace.root.findMember(modelPlatformPath)
					val project = modelResource.project
					if(project.hasNature("com.incquerylabs.emdw.common.nature")) {
						return true
					}
				}
			}
		}
		return false
	}
}