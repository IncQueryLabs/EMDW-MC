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

import com.ericsson.xtumlrt.oopl.cppmodel.CPPComponent
import com.ericsson.xtumlrt.oopl.cppmodel.CPPDirectory
import com.ericsson.xtumlrt.oopl.cppmodel.CPPModel
import com.ericsson.xtumlrt.oopl.cppmodel.CPPPort
import com.ericsson.xtumlrt.oopl.cppmodel.CPPProtocolOperationImplementation
import org.eclipse.papyrusrt.xtumlrt.common.Model
import org.eclipse.papyrusrt.xtumlrt.common.Package
import org.eclipse.papyrusrt.xtumlrt.common.ProtocolBehaviourFeatureKind
import org.eclipse.papyrusrt.xtumlrt.common.VisibilityKind
import org.eclipse.papyrusrt.xtumlrt.xtuml.XTComponent
import org.eclipse.papyrusrt.xtumlrt.xtuml.XTPort
import org.eclipse.papyrusrt.xtumlrt.xtuml.XTProtocol
import org.eclipse.papyrusrt.xtumlrt.xtuml.XTProtocolOperationDefinition
import org.junit.Ignore
import org.junit.runner.RunWith
import org.junit.runners.Suite
import org.junit.runners.Suite.SuiteClasses

import static org.junit.Assert.*

@SuiteClasses(#[
	CPPProtocolOperationImplMappingTest
])
@RunWith(Suite)
class CPPProtocolOperationImplMappingTestSuite {}

@Ignore("protocols not yet in scope")
class CPPProtocolOperationImplMappingTest extends MappingBaseTest<XTPort, CPPComponent> {
	CPPDirectory rootDir;
	XTProtocolOperationDefinition xtdef;
	
	override protected prepareXtUmlModel(Model model) {
		val pack = model.createPackage("RootPackage")
		val component = pack.createXtComponent("Component")
		val protocol = pack.createXtProtocol("Protocol")
		val port = component.createPort(protocol, "Port", VisibilityKind.PUBLIC)
		xtdef = protocol.createXtProtocolOperationDefinition("Def",
			VisibilityKind.PUBLIC, false, null, ProtocolBehaviourFeatureKind.IN
		)
		 port.createXtProtocolOperationImplementation(xtdef, "C++","TEST")
		port
	}
		
	override protected prepareCppModel(CPPModel cppModel) {
		val res = cppModel.eResource
		rootDir = res.createCPPDirectory
		val xtmodel = cppModel.commonModel
		val xtPackage = xtmodel.packages.head as Package
		val cppPackage = cppModel.createCPPPackage(xtPackage)
		val xtComponent = xtPackage.entities.head as XTComponent
		val cppComponent = cppPackage.createCPPComponent(xtComponent, null, null, null, null)
		val xtProt = xtPackage.protocols.head as XTProtocol
		val cppProtocol = cppPackage.createCPPProtocol(xtProt, null)
		val xtPort = xtComponent.ports.head as XTPort
		cppComponent.createCPPPort(xtPort, null, null)
		cppProtocol.createCPPProtocolOperationDefinition(xtdef)
		
		cppComponent
	}
	
	override protected assertResult(Model input, CPPModel result, XTPort xtObject, CPPComponent cppObject) {
		val cppPort = cppObject.subElements.filter(CPPPort).head
		val xtImpls = xtObject.realizedOperations
		val cppImpls = cppPort.subElements.filter(CPPProtocolOperationImplementation)
		assertEquals(xtImpls.size,cppImpls.size)
		cppImpls.forEach[
			assertNotNull(ooplNameProvider)
			assertNotNull(xtProtocolOperationImplementation)
		]
	}
	
	override protected clearXtUmlElement(XTPort xtObject) {
		xtObject.realizedOperations.clear
	}
	
	override protected assertClear(Model input, CPPModel result, XTPort xtObject, CPPComponent cppObject) {
		val cppPort = cppObject.subElements.filter(CPPPort).head
		val cppImpls = cppPort.subElements.filter(CPPProtocolOperationImplementation)
		assertEquals(0,cppImpls.size)
	}
	
}
