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

import com.ericsson.xtumlrt.oopl.cppmodel.CPPDirectory
import com.ericsson.xtumlrt.oopl.cppmodel.CPPSourceFile
import com.incquerylabs.emdw.cpp.codegeneration.fsa.IFileManager
import java.nio.file.Path
import java.nio.file.Paths

class Model2FileMapper {
	IFileManager fileManager
	CPPDirectory root
	Path directoryPath
	
	public val mappedSourceFiles = <CPPSourceFile, CharSequence>newHashMap()
	
	new(IFileManager fileManager, CPPDirectory root, Path directoryPath) {
		this.fileManager = fileManager
		this.root = root
		this.directoryPath = directoryPath
	}
		
	def execute() {
		root.mapFiles(directoryPath)
		mappedSourceFiles
	}
	
	private def void mapFiles(CPPDirectory qne, Path directoryPath) {
		for(file : qne.files) {
			val content = fileManager.getFileContentAsString(directoryPath.toString, file.generationName)
			mappedSourceFiles.put(file, content)
		}
		for(dirOwner : qne.subDirectories) {
			dirOwner.mapFiles(Paths::get(directoryPath.toString, dirOwner.name))
		}
	}
}