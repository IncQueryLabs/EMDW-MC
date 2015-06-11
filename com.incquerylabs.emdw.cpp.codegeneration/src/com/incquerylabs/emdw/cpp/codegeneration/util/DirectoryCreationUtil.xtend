package com.incquerylabs.emdw.cpp.codegeneration.util

import com.ericsson.xtumlrt.oopl.cppmodel.CPPDirectory
import com.incquerylabs.emdw.cpp.codegeneration.directory.IDirectoryCreator
import org.apache.log4j.Logger

class DirectoryCreationUtil {

	extension static val Logger logger = Logger.getLogger(DirectoryCreationUtil)
	
	static def synchronizeSubDirectories(CPPDirectory cppDir, IDirectoryCreator directoryCreator) {
		val cppSubDirNames = cppDir.subDirectories.map[dir | dir.name]
		
		for(String directoryName : directoryCreator.getSubDirectoryNames(cppDir.path)) {
			debug(directoryName + " is sub directory of " + cppDir.path)
			if(!cppSubDirNames.contains(directoryName))
				directoryCreator.deleteDirectory(cppDir.path + "/" + directoryName)
		}
	}
	
}