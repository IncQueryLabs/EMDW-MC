/*******************************************************************************
 * Copyright (c) 2015-2016, IncQuery Labs Ltd. and Ericsson AB
 * All rights reserved. This program and the accompanying materials
 * are made available under the terms of the Eclipse Public License v1.0
 * which accompanies this distribution, and is available at
 * http://www.eclipse.org/legal/epl-v10.html
 *
 * Contributors:
 *   Akos Horvath, Abel Hegedus, Zoltan Ujhelyi, Daniel Segesdi, Tamas Borbas, Robert Doczi, Peter Lunk, Istvan Papp - initial API and implementation
 *******************************************************************************/
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