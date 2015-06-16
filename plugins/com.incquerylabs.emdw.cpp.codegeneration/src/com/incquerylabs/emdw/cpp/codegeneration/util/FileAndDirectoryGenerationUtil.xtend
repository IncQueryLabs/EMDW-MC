package com.incquerylabs.emdw.cpp.codegeneration.util

import com.ericsson.xtumlrt.oopl.cppmodel.CPPDirectory
import com.incquerylabs.emdw.cpp.codegeneration.fsa.IFileManager
import org.apache.log4j.Logger

class FileAndDirectoryGenerationUtil {

	extension static val Logger logger = Logger.getLogger(FileAndDirectoryGenerationUtil)
	
	static def synchronizeSubDirectories(CPPDirectory cppDir, IFileManager fileManager) {
		val cppSubDirNames = cppDir.subDirectories.map[dir | dir.name]
		
		for(String directoryName : fileManager.getSubDirectoryNames(cppDir.path)) {
			debug(directoryName + " is sub directory of " + cppDir.path)
			if(!cppSubDirNames.contains(directoryName))
				fileManager.deleteDirectory(cppDir.path + "/" + directoryName)
		}
	}
	
}