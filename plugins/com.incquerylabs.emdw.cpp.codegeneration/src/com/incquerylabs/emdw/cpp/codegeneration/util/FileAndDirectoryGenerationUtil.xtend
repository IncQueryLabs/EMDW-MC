package com.incquerylabs.emdw.cpp.codegeneration.util

import com.ericsson.xtumlrt.oopl.cppmodel.CPPDirectory
import com.incquerylabs.emdw.cpp.codegeneration.fsa.IFileManager

class FileAndDirectoryGenerationUtil {
	
	static def synchronizeSubDirectories(CPPDirectory cppDir, IFileManager fileManager) {
		val cppSubDirNames = cppDir.subDirectories.map[dir | dir.name]
		
		for(String directoryName : fileManager.getSubDirectoryNames(cppDir.path)) {
			if(!cppSubDirNames.contains(directoryName))
				fileManager.deleteDirectory('''«cppDir.path»/«directoryName»''')
		}
	}
	
	static def synchronizeDirectoryFiles(CPPDirectory cppDir, IFileManager fileManager) {
		val containedFilenames = cppDir.files.map[file | file.generationName]
		
		for(String filename : fileManager.getContainedFileNames(cppDir.path)) {
			if(!containedFilenames.contains(filename))
				fileManager.deleteFile(cppDir.path, filename)
		}
	}
}