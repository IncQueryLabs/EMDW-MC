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
			val fileInModel = containedFilenames.contains(filename)
			// this is required to ensure that .cc files are not deleted if .cc.skel file is written
			val fileNeeded = fileInModel || containedFilenames.exists[startsWith(filename)]
			
			if(!fileNeeded){
				fileManager.deleteFile(cppDir.path, filename)
			}
		}
	}
}