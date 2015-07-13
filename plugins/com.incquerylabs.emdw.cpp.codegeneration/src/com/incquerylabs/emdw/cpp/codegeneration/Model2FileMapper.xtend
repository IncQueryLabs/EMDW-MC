package com.incquerylabs.emdw.cpp.codegeneration

import com.incquerylabs.emdw.cpp.codegeneration.fsa.IFileManager
import com.ericsson.xtumlrt.oopl.cppmodel.CPPSourceFile
import com.ericsson.xtumlrt.oopl.cppmodel.CPPDirectory

class Model2FileMapper {
	IFileManager fileManager
	CPPDirectory root
	String directoryPath
	
	public val mappedSourceFiles = <CPPSourceFile, CharSequence>newHashMap()
	
	new(IFileManager fileManager, CPPDirectory root, String directoryPath) {
		this.fileManager = fileManager
		this.root = root
		this.directoryPath = directoryPath
	}
	
	def execute() {
		root.mapFiles(directoryPath)
		mappedSourceFiles
	}
	
	private def void mapFiles(CPPDirectory qne, String directoryPath) {
		for(file : qne.files) {
			val content = fileManager.getFileContentAsString(directoryPath, file.generationName)
			mappedSourceFiles.put(file, content)
		}
		for(dirOwner : qne.subDirectories) {
			dirOwner.mapFiles(directoryPath+"/"+dirOwner.name)
		}
	}
}