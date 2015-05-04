package com.incquerylabs.emdw.cpp.transformation.test.mappings

import com.ericsson.xtumlrt.oopl.cppmodel.CPPModel
import com.ericsson.xtumlrt.oopl.cppmodel.CPPProtocol
import com.ericsson.xtumlrt.oopl.cppmodel.CPPProtocolOperationDefinition
import com.incquerylabs.emdw.cpp.transformation.test.wrappers.TransformationWrapper
import org.eclipse.papyrusrt.xtumlrt.common.Model
import org.eclipse.papyrusrt.xtumlrt.common.ProtocolBehaviourFeatureKind
import org.eclipse.papyrusrt.xtumlrt.common.VisibilityKind
import org.eclipse.papyrusrt.xtumlrt.xtuml.XTPackage
import org.eclipse.papyrusrt.xtumlrt.xtuml.XTProtocol
import org.eclipse.papyrusrt.xtumlrt.xtuml.XTProtocolOperationDefinition
import org.junit.runner.RunWith
import org.junit.runners.Parameterized

import static org.junit.Assert.*

import static extension com.incquerylabs.emdw.cpp.transformation.test.TransformationTestUtil.*

@RunWith(Parameterized)
class CPPProtocolOperationDefinitionMappingTest extends MappingBaseTest<XTProtocol, CPPProtocol> {
	
	new(TransformationWrapper wrapper, String wrapperType) {
		super(wrapper, wrapperType)
	}
	
	override protected prepareXtUmlModel(Model model) {
		val pack = model.createXtPackage("RootPackage")
		val protocol = pack.createXtProtocol("Protocol")
		protocol.createXtProtocolOperationDefinition("Def",
			VisibilityKind.PUBLIC, false, null, ProtocolBehaviourFeatureKind.IN
		)
		
		protocol
	}
		
	override protected prepareCppModel(CPPModel cppModel) {
		val xtmodel = cppModel.commonModel
		val xtPackage = xtmodel.rootPackages.head as XTPackage
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
	
	
}