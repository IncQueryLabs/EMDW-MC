package com.incquerylabs.emdw.cpp.codegeneration

import com.incquerylabs.emdw.cpp.codegeneration.templates.MainTemplates
import com.ericsson.xtumlrt.oopl.cppmodel.CPPComponent

class MainGeneration {
	MainTemplates templates
	private boolean initialized
	
	def initialize() {
		if(!initialized) {
			templates = new MainTemplates
			initialized = true
		}
	}
	
	def execute(CPPComponent... components) {
		val mainContent = templates.mainWithoutBodyTemplate(components)
		return mainContent
	}
}