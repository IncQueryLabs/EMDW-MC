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
package com.incquerylabs.emdw.cpp.transformation.test.mappings

import com.ericsson.xtumlrt.oopl.cppmodel.CPPModel
import com.ericsson.xtumlrt.oopl.cppmodel.CPPProtocol
import com.ericsson.xtumlrt.oopl.cppmodel.CPPProtocolOperationDefinition
import org.eclipse.papyrusrt.xtumlrt.common.Model
import org.eclipse.papyrusrt.xtumlrt.common.Package
import org.eclipse.papyrusrt.xtumlrt.common.ProtocolBehaviourFeatureKind
import org.eclipse.papyrusrt.xtumlrt.common.VisibilityKind
import org.eclipse.papyrusrt.xtumlrt.xtuml.XTProtocol
import org.eclipse.papyrusrt.xtumlrt.xtuml.XTProtocolOperationDefinition
import org.junit.Ignore
import org.junit.runner.RunWith
import org.junit.runners.Suite
import org.junit.runners.Suite.SuiteClasses

import static org.junit.Assert.*

@SuiteClasses(#[
	CPPProtocolOperationDefinitionMappingTest
])
@RunWith(Suite)
class CPPProtocolOperationDefinitionMappingTestSuite {}

@Ignore("protocols not yet in scope")
class CPPProtocolOperationDefinitionMappingTest extends MappingBaseTest<XTProtocol, CPPProtocol> {
	
	override protected prepareXtUmlModel(Model model) {
		val pack = model.createPackage("RootPackage")
		val protocol = pack.createXtProtocol("Protocol")
		protocol.createXtProtocolOperationDefinition("Def",
			VisibilityKind.PUBLIC, false, null, ProtocolBehaviourFeatureKind.IN
		)
		
		protocol
	}
		
	override protected prepareCppModel(CPPModel cppModel) {
		val xtmodel = cppModel.commonModel
		val xtPackage = xtmodel.packages.head as Package
		val cppPackage = createCPPPackage(cppModel, xtPackage)
		val xtProt = xtPackage.protocols.head as XTProtocol
		val cppProtocol = createCPPProtocol(cppPackage,xtProt, null)
		
		cppProtocol
	}
	
	override protected assertResult(Model input, CPPModel result, XTProtocol xtObject, CPPProtocol cppObject) {
		val xtDefs = xtObject.protocolBehaviourFeatures.filter(XTProtocolOperationDefinition)
		val cppDefs = cppObject.subElements.filter(CPPProtocolOperationDefinition)
		assertEquals(xtDefs.size,cppDefs.size)
		cppDefs.forEach[
			assertNotNull(ooplNameProvider)
			assertNotNull(xtProtocolOperationDefinition)
		]
	}
	
	override protected clearXtUmlElement(XTProtocol xtObject) {
		val defs = xtObject.protocolBehaviourFeatures.filter(XTProtocolOperationDefinition)
		xtObject.protocolBehaviourFeatures.removeAll(defs)
	}
	
	override protected assertClear(Model input, CPPModel result, XTProtocol xtObject, CPPProtocol cppObject) {
		val cppDefs = cppObject.subElements.filter(CPPProtocolOperationDefinition)
		assertEquals(0,cppDefs.size)
	}
	
	
}