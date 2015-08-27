package com.incquerylabs.emdw.cpp.codegeneration.test.makefiles

import com.ericsson.xtumlrt.oopl.cppmodel.CPPModel
import com.ericsson.xtumlrt.oopl.cppmodel.CPPSourceFile
import com.incquerylabs.emdw.cpp.codegeneration.MakefileGeneration
import com.incquerylabs.emdw.cpp.codegeneration.test.TransformationTest
import java.util.Map
import org.eclipse.emf.ecore.EObject
import org.junit.Before

import static com.incquerylabs.emdw.testing.common.utils.CppUtil.*

abstract class MakeBaseTest<XtumlObject extends EObject, CPPObject extends EObject> extends TransformationTest<XtumlObject, CPPObject> {
	protected CharSequence makefileContent = null
	protected Map<CPPSourceFile, CharSequence> rules = null
	protected MakefileGeneration generator
	
	@Before
	override init() {
		super.init
		generator = new MakefileGeneration()
		generator.initialize
		rules = newHashMap
	}
	
	override protected transformCppModel(CPPModel cppModel) {
		super.transformCppModel(cppModel)
		val makefile = createCPPMakefile
		cppModel.headerDir.files += makefile
		makefileContent = generator.executeMakefile(cppModel.cppName, newArrayList("Runtime", cppModel.headerDir.name))
		generator.executeRulesMk(cppModel.headerDir)
		if(cppModel.bodyDir != cppModel.headerDir) {
			generator.executeRulesMk(cppModel.bodyDir)
		}
		rules.putAll(generator.generatedCPPMakeFiles)
	}
	
}