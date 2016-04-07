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
package com.incquerylabs.emdw.cpp.codegeneration.test.mains

import com.ericsson.xtumlrt.oopl.cppmodel.CPPComponent
import com.ericsson.xtumlrt.oopl.cppmodel.CPPModel
import com.ericsson.xtumlrt.oopl.cppmodel.CPPQualifiedNamedElement
import com.incquerylabs.emdw.cpp.codegeneration.MainGeneration
import com.incquerylabs.emdw.cpp.codegeneration.test.TransformationTest
import org.eclipse.emf.ecore.EObject
import org.junit.Before

abstract class MainBaseTest<XtumlObject extends EObject, CPPObject extends EObject> extends TransformationTest<XtumlObject, CPPObject> {
	protected CharSequence mainContent
	protected MainGeneration generator
	
	@Before
	override init() {
		super.init
		generator = new MainGeneration
		generator.initialize
	}
	
	override protected transformCppModel(CPPModel cppModel) {
		super.transformCppModel(cppModel)
		val components = cppModel.components
		mainContent = generator.execute(components)
	}
	
	protected final def CPPComponent[] getComponents(CPPQualifiedNamedElement qne) {
		val components = <CPPComponent>newArrayList
		for(elem : qne.subElements) {
			if(elem instanceof CPPComponent) {
				components += elem
			}
			components.addAll(elem.components)
		}
		return components
	}
	
}