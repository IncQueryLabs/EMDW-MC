package com.incquerylabs.emdw.cpp.transformation.test.mappings

import com.ericsson.xtumlrt.oopl.cppmodel.CPPDirectory
import com.ericsson.xtumlrt.oopl.cppmodel.CPPModel
import com.ericsson.xtumlrt.oopl.cppmodel.CPPPort
import com.ericsson.xtumlrt.oopl.cppmodel.CPPProtocolOperationImplementation
import com.incquerylabs.emdw.cpp.transformation.test.wrappers.TransformationWrapper
import org.eclipse.papyrusrt.xtumlrt.common.Model
import org.eclipse.papyrusrt.xtumlrt.common.ProtocolBehaviourFeatureKind
import org.eclipse.papyrusrt.xtumlrt.common.VisibilityKind
import org.eclipse.papyrusrt.xtumlrt.xtuml.XTComponent
import org.eclipse.papyrusrt.xtumlrt.xtuml.XTPackage
import org.eclipse.papyrusrt.xtumlrt.xtuml.XTPort
import org.eclipse.papyrusrt.xtumlrt.xtuml.XTProtocol
import org.eclipse.papyrusrt.xtumlrt.xtuml.XTProtocolOperationDefinition
import org.junit.runner.RunWith
import org.junit.runners.Parameterized
import org.junit.runners.Suite
import org.junit.runners.Suite.SuiteClasses

import static org.junit.Assert.*

import static extension com.incquerylabs.emdw.cpp.transformation.test.TransformationTestUtil.*

@SuiteClasses(#[
	CPPProtocolOperationImplMappingTest
])
@RunWith(Suite)
class CPPProtocolOperationImplMappingTestSuite {}

@RunWith(Parameterized)
class CPPProtocolOperationImplMappingTest extends MappingBaseTest<XTPort, CPPPort> {
	CPPDirectory rootDir;
	XTProtocolOperationDefinition xtdef;
	
	new(TransformationWrapper wrapper, String wrapperType) {
		super(wrapper, wrapperType)
	}
	
	override protected prepareXtUmlModel(Model model) {
		val pack = model.createXtPackage("RootPackage")
		val component = pack.createXtComponent("Component")
		val protocol = pack.createXtProtocol("Protocol")
		val port = component.createPort(protocol, "Port", VisibilityKind.PUBLIC)
		xtdef = protocol.createXtProtocolOperationDefinition("Def",
			VisibilityKind.PUBLIC, false, null, ProtocolBehaviourFeatureKind.IN
		)
		 port.createXtProtocolOperationImplementation(xtdef,"TEST")
		port
	}
		
	override protected prepareCppModel(CPPModel cppModel) {
		val res = cppModel.eResource
		rootDir = res.createCPPDirectory
		val xtmodel = cppModel.commonModel
		val xtPackage = xtmodel.rootPackages.head as XTPackage
		val cppPackage = createCPPPackage(cppModel, xtPackage)
		val xtComponent = xtPackage.entities.head as XTComponent
		val cppComponent = createCPPComponent(cppPackage, xtComponent, null, null, null, null)
		val xtProt = xtPackage.protocols.head as XTProtocol
		val cppProtocol = createCPPProtocol(cppPackage,xtProt, null)
		val xtPort = xtComponent.ports.head as XTPort
		val cppPort = cppComponent.createCPPPort(xtPort, null, null)
		cppProtocol.createCPPProtocolOperationDefinition(xtdef)
		
		cppPort
	}
	
	override protected assertResult(Model input, CPPModel result, XTPort xtObject, CPPPort cppObject) {
		val xtImpls = xtObject.realizedOperations
		val cppImpls = cppObject.subElements.filter(CPPProtocolOperationImplementation)
		assertEquals(xtImpls.size,cppImpls.size)
		cppImpls.forEach[
			assertNotNull(ooplNameProvider)
			assertNotNull(xtProtocolOperationImplementation)
		]
	}
	
	override protected clearXtUmlElement(XTPort xtObject) {
		xtObject.realizedOperations.clear
	}
	
	override protected assertClear(Model input, CPPModel result, XTPort xtObject, CPPPort cppObject) {
		throw new UnsupportedOperationException("TODO: auto-generated method stub")
	}
	
}
