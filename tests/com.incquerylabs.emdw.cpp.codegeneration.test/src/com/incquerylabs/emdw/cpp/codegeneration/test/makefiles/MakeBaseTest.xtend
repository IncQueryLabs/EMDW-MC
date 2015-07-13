package com.incquerylabs.emdw.cpp.codegeneration.test.makefiles

import com.ericsson.xtumlrt.oopl.cppmodel.CPPDirectory
import com.ericsson.xtumlrt.oopl.cppmodel.CPPModel
import com.incquerylabs.emdw.cpp.codegeneration.MakefileGeneration
import com.incquerylabs.emdw.cpp.codegeneration.test.TransformationTest
import com.incquerylabs.emdw.cpp.codegeneration.test.wrappers.TransformationWrapper
import java.util.Map
import org.eclipse.emf.ecore.EObject

abstract class MakeBaseTest<XtumlObject extends EObject, CPPObject extends EObject> extends TransformationTest<XtumlObject, CPPObject> {
	protected CharSequence makefileContent = null
	protected Map<CPPDirectory, CharSequence> rules = null
	protected MakefileGeneration generator
	
	new(TransformationWrapper wrapper, String wrapperType) {
		super(wrapper, wrapperType)
		generator = new MakefileGeneration()
		generator.initialize
		rules = newHashMap
	}
	
	override protected transformCppModel(CPPModel cppModel) {
		super.transformCppModel(cppModel)
		makefileContent = generator.executeMakefile(cppModel, "Runtime")
		rules.put(cppModel.headerDir, generator.executeRulesMk(cppModel.headerDir))
		makeRulesForSubDirs(cppModel.headerDir)
		if(cppModel.bodyDir != cppModel.headerDir) {
			rules.put(cppModel.bodyDir, generator.executeRulesMk(cppModel.bodyDir))
			makeRulesForSubDirs(cppModel.bodyDir)
		}
	}
	
	def void makeRulesForSubDirs(CPPDirectory dir) {
		for(subDir : dir.subDirectories) {
			rules.put(subDir, generator.executeRulesMk(subDir))
			makeRulesForSubDirs(subDir)
		}
	}
	
}