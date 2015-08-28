package com.incquerylabs.emdw.cpp.transformation.test.mappings

import com.ericsson.xtumlrt.oopl.cppmodel.CPPComponent
import com.ericsson.xtumlrt.oopl.cppmodel.CPPDirectory
import com.ericsson.xtumlrt.oopl.cppmodel.CPPModel
import com.ericsson.xtumlrt.oopl.cppmodel.CPPPort
import org.eclipse.papyrusrt.xtumlrt.common.Model
import org.eclipse.papyrusrt.xtumlrt.common.Package
import org.eclipse.papyrusrt.xtumlrt.common.VisibilityKind
import org.eclipse.papyrusrt.xtumlrt.xtuml.XTComponent
import org.eclipse.papyrusrt.xtumlrt.xtuml.XTProtocol
import org.junit.Ignore
import org.junit.runner.RunWith
import org.junit.runners.Suite
import org.junit.runners.Suite.SuiteClasses

import static org.junit.Assert.*

@SuiteClasses(#[
	CPPPortMappingTest
])
@RunWith(Suite)
class CPPPortMappingTestSuite {}

@Ignore("ports not yet in scope")
class CPPPortMappingTest extends MappingBaseTest<XTComponent, CPPComponent> {
	CPPDirectory rootDir;
	
	override protected prepareXtUmlModel(Model model) {
		val pack = model.createPackage("RootPackage")
		val component = pack.createXtComponent("Component")
		val protocol = pack.createXtProtocol("Protocol")
		component.createPort(protocol, "Port", VisibilityKind.PUBLIC)
		
		component
	}
		
	override protected prepareCppModel(CPPModel cppModel) {
		rootDir = cppModel.headerDir
		val xtmodel = cppModel.commonModel
		val xtPackage = xtmodel.packages.head as Package
		val cppPackage = createCPPPackage(cppModel, xtPackage)
		val xtComponent = xtPackage.entities.head as XTComponent
		val cppComponent = createCPPComponent(cppPackage, xtComponent, null, null, null, null)
		val xtProt = xtPackage.protocols.head as XTProtocol
		createCPPProtocol(cppPackage,xtProt, null)
		
		cppComponent
	}
	
	override protected assertResult(Model input, CPPModel result, XTComponent xtObject, CPPComponent cppObject) {
		val xtPorts = xtObject.ports
		val cppPorts = cppObject.subElements.filter(CPPPort)
		assertEquals(xtPorts.size,cppPorts.size)
		assertEquals(xtPorts.size,rootDir.countCppHeaderFiles)
		assertEquals(xtPorts.size,rootDir.countCppBodyFiles)
		cppPorts.forEach[
			assertNotNull(ooplNameProvider)
			assertNotNull(xtPort)
			assertNotNull(headerFile)
			assertNotNull(bodyFile)
		]
	}
	
	override protected clearXtUmlElement(XTComponent xtObject) {
		xtObject.ports.clear
	}
	
	override protected assertClear(Model input, CPPModel result, XTComponent xtObject, CPPComponent cppObject) {
		val cppPorts = cppObject.subElements.filter(CPPPort)
		assertEquals(0,cppPorts.size)
		assertEquals(0,rootDir.countCppHeaderFiles)
		assertEquals(0,rootDir.countCppBodyFiles)
	}
	
}
