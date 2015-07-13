package com.incquerylabs.emdw.cpp.codegeneration

import com.ericsson.xtumlrt.oopl.cppmodel.CPPModel
import com.incquerylabs.emdw.cpp.codegeneration.templates.MakefileTemplates
import com.ericsson.xtumlrt.oopl.cppmodel.CPPDirectory
import java.util.List

class MakefileGeneration {
	MakefileTemplates templates
	
	def initialize() {
		templates = new MakefileTemplates
	}
	
	def executeMakefile(CPPModel cppModel, List<CPPDirectory> otherDirs) {
		val otherDirsAsString = <String>newArrayList
		otherDirs.forEach[
			otherDirsAsString.add(name)
		]
		executeMakefile(cppModel, otherDirsAsString)
	}
	
	def executeMakefile(CPPModel cppModel, String... otherDirs) {
		templates.makefileTemplate(cppModel, otherDirs)
	}
	
	def executeRulesMk(CPPDirectory dir) {
		templates.rulesMkTemplate(dir)
	}
}