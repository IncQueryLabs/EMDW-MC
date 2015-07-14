package com.incquerylabs.emdw.cpp.codegeneration

import com.incquerylabs.emdw.cpp.codegeneration.templates.MakefileTemplates
import com.ericsson.xtumlrt.oopl.cppmodel.CPPDirectory
import java.util.List
import com.ericsson.xtumlrt.oopl.cppmodel.CPPSourceFile

class MakefileGeneration {
	MakefileTemplates templates
	
	public val generatedCPPMakeFiles = <CPPSourceFile, CharSequence>newHashMap()
	
	
	def initialize() {
		templates = new MakefileTemplates
	}
	
	def executeMakefile(String modelname, CPPDirectory... otherDirs) {
		val otherDirsAsString = <String>newArrayList
		otherDirs.forEach[
			otherDirsAsString.add(name)
		]
		executeMakefile(modelname, otherDirsAsString)
	}
	
	def executeMakefile(String modelname, List<String> otherDirs) {
		val content = templates.makefileTemplate(modelname, otherDirs)
		return content
	}
	
	def CharSequence executeRulesMk(CPPDirectory dir) {
		val rulesContent = templates.rulesMkTemplate(dir)
		generatedCPPMakeFiles.put(dir.makeRulesFile, rulesContent)
		dir.subDirectories.forEach[subdir | subdir.executeRulesMk]
		return rulesContent
	}
}