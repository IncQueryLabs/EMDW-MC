package com.incquerylabs.emdw.cpp.codegeneration

import com.ericsson.xtumlrt.oopl.cppmodel.CPPModel
import com.incquerylabs.emdw.cpp.codegeneration.templates.MakefileTemplates
import com.ericsson.xtumlrt.oopl.cppmodel.CPPDirectory

class MakefileGeneration {
	MakefileTemplates templates
	
	def initialize() {
		templates = new MakefileTemplates
	}
	
	def execute(CPPModel cppModel) {
		templates.makefileTemplate(cppModel, newArrayList("Runtime"))
	}
	
	def execute(CPPDirectory dir) {
		templates.rulesMkTemplate(dir)
	}
}