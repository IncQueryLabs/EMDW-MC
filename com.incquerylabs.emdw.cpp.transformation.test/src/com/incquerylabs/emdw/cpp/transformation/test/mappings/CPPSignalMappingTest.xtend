package com.incquerylabs.emdw.cpp.transformation.test.mappings

import com.ericsson.xtumlrt.oopl.cppmodel.CPPModel
import com.ericsson.xtumlrt.oopl.cppmodel.CPPProtocol
import com.ericsson.xtumlrt.oopl.cppmodel.CPPSignal
import com.incquerylabs.emdw.cpp.transformation.test.wrappers.TransformationWrapper
import org.eclipse.papyrusrt.xtumlrt.common.Model
import org.eclipse.papyrusrt.xtumlrt.common.Package
import org.eclipse.papyrusrt.xtumlrt.common.Signal
import org.eclipse.papyrusrt.xtumlrt.xtuml.XTProtocol
import org.junit.Ignore
import org.junit.runner.RunWith
import org.junit.runners.Parameterized
import org.junit.runners.Suite
import org.junit.runners.Suite.SuiteClasses

import static org.junit.Assert.*

import static extension com.incquerylabs.emdw.cpp.transformation.test.TransformationTestUtil.*

@SuiteClasses(#[
	CPPSignalMappingTest
])
@RunWith(Suite)
class CPPSignalMappingTestSuite {}

@Ignore("protocols not yet in scope")
@RunWith(Parameterized)
class CPPSignalMappingTest extends MappingBaseTest<XTProtocol, CPPProtocol> {
	
	new(TransformationWrapper wrapper, String wrapperType) {
		super(wrapper, wrapperType)
	}
	
	override protected prepareXtUmlModel(Model model) {
		val pack = model.createPackage("RootPackage")
		val protocol = pack.createXtProtocol("Protocol")
		protocol.createSignal("Signal")
		
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
		val xtSignals = xtObject.protocolBehaviourFeatures.filter(Signal)
		val cppSignals = cppObject.subElements.filter(CPPSignal)
		assertEquals(xtSignals.size,cppSignals.size)
		cppSignals.forEach[
			assertNotNull(ooplNameProvider)
			assertNotNull(commonSignal)
		]
	}
	
	override protected clearXtUmlElement(XTProtocol xtObject) {
		xtObject.protocolBehaviourFeatures.clear
	}
	
	override protected assertClear(Model input, CPPModel result, XTProtocol xtObject, CPPProtocol cppObject) {
		val cppSignals = cppObject.subElements.filter(CPPSignal)
		assertEquals(0,cppSignals.size)
	}
	
	
}