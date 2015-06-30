package com.incquerylabs.emdw.cpp.codegeneration.test.mappings

import com.ericsson.xtumlrt.oopl.cppmodel.CPPClass
import com.ericsson.xtumlrt.oopl.cppmodel.CPPModel
import com.incquerylabs.emdw.cpp.codegeneration.test.TransformationTest
import com.incquerylabs.emdw.cpp.codegeneration.test.wrappers.CPPCodeGenerationWrapper
import com.incquerylabs.emdw.cpp.codegeneration.test.wrappers.TransformationWrapper
import org.eclipse.papyrusrt.xtumlrt.common.State
import org.junit.runner.RunWith
import org.junit.runners.Parameterized

import static org.junit.Assert.*

import static extension com.incquerylabs.emdw.cpp.codegeneration.test.TransformationTestUtil.*

@RunWith(Parameterized)
class AssociationMappingTest extends TransformationTest<State, CPPClass> {
	
	new(TransformationWrapper wrapper, String wrapperType) {
		super(wrapper, wrapperType)
	}
	
	override protected prepareCppModel(CPPModel cppModel) {
		val xtmodel = cppModel.commonModel
		val xtPackage = xtmodel.createPackage("RootPackage")
		val xtComponent = xtPackage.createXtComponent("Component")
		val xtClass1 = xtComponent.createXtClass("TEST1")
		val xtClass2 = xtComponent.createXtClass("TEST2")
		val xtAssoc1 = xtClass1.createBidirectionalAssociation(xtClass2, "test2", "test1")
		val xtAssoc2 = xtAssoc1.opposite
		
		val cppPackage = createCPPPackage(cppModel, xtPackage)
		val cppComponent = createCPPComponentWithDefaultDirectories(cppPackage, xtComponent, null, null, null, null)
		val cppClass1Header = createCPPHeaderFile(cppComponent.headerDirectory)
		val cppClass1Body = createCPPBodyFile(cppComponent.bodyDirectory)
		val cppClass1 = createCPPClass(cppComponent, xtClass1, cppClass1Header, cppClass1Body)
		val cppClass2Header = createCPPHeaderFile(cppComponent.headerDirectory)
		val cppClass2Body = createCPPBodyFile(cppComponent.bodyDirectory)
		val cppClass2 = createCPPClass(cppComponent, xtClass2, cppClass2Header, cppClass2Body)
		createCPPRelation(cppClass1, xtAssoc1, 
			createCPPClassReferenceStorage(xtAssoc1, 
				createCPPClassReference(xtAssoc1, cppClass2)
			)
		)
		createCPPRelation(cppClass2, xtAssoc2, 
			createCPPClassReferenceStorage(xtAssoc2, 
				createCPPClassReference(xtAssoc2, cppClass1)
			)
		)
		
		cppClass1
	}
	
	override protected assertResult(CPPModel result, CPPClass cppObject) {
		val wrapper = xform as CPPCodeGenerationWrapper
		
		val files = wrapper.codegen.generatedCPPSourceFiles
		val classHeader = files.get(cppObject.headerFile).toString
		assertTrue(classHeader.contains("TEST2* test2"))
	}
	
}