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
package com.incquerylabs.emdw.cpp.codegeneration.fsa.impl

import com.google.common.io.Files
import com.incquerylabs.emdw.cpp.codegeneration.fsa.FileManager
import java.io.File
import java.net.URI
import org.eclipse.core.runtime.FileLocator
import org.eclipse.core.runtime.Platform
import com.incquerylabs.emdw.cpp.codegeneration.fsa.FileManagerException

class BundleFileManager extends FileManager {
	
	new(String rootDirectory) {
		super(rootDirectory)
		formatRootDirectory
		type = "bundle"
	}
	
	private def formatRootDirectory() {
		if(this.rootDirectory.endsWith("/")) {
			this.rootDirectory = this.rootDirectory.substring(0, this.rootDirectory.length-1)
		}
		if(this.rootDirectory.startsWith("/")) {
			this.rootDirectory = this.rootDirectory.substring(1)
		}
	}
	
	private def File getFile(String directoryPath, String filename) {
		val fullPath = directoryPath.append(filename)
		resolveFile(fullPath)
	}
	
	private def File getFolder(String directoryPath) {
		resolveFile(directoryPath)
	}
	
	private def resolveFile(String fullPath) {
		val bundle = Platform.getBundle(rootDirectory)
		val url = bundle.getEntry(fullPath.correctSeparators)
		if(url==null) {
			throw new FileManagerException('''Cannot resolve file in bundle! File: «fullPath»''')
		}
		val resolvedFileURL = FileLocator.toFileURL(url);
		val resolvedURI = new URI(resolvedFileURL.getProtocol(), resolvedFileURL.getPath(), null)
		return new File(resolvedURI)
	}
	
	override readFileContent(String directoryPath, String filename) {
		val file = directoryPath.getFile(filename)
		Files.toByteArray(file)
	}
	
	override readFileContentAsString(String directoryPath, String filename) {
		val file = directoryPath.getFile(filename)
		Files.toString(file, DEFAULT_CHARSET)
	}
	
	override fileExists(String directoryPath, String filename) {
		return directoryPath.getFile(filename).isFile
	}
	
	override directoryExists(String path) {
		return path.folder.isDirectory
	}
	
	override readSubDirectoryNames(String path) {
		return path.folder.list.filter[ filename |
			path.getFile(filename).directory
		].toList
	}
	
	override readContainedFileNames(String path) {
		return path.folder.list.filter[ filename |
			path.getFile(filename).file
		].toList
	}
	
	
	override performFileCreation(String directoryPath, String filename, CharSequence content) {
		throw new UnsupportedOperationException('''Unsupported operation: cannot create file in a bundle! File: «directoryPath»«filename»''')
	}
	
	override performFileDeletion(String directoryPath, String filename) {
		throw new UnsupportedOperationException('''Unsupported operation: cannot delete file from a bundle! File: «directoryPath»«filename»''')
	}
	
	override performDirectoryCreation(String path) {
		throw new UnsupportedOperationException('''Unsupported operation: cannot create directory in a bundle! Directory: «path»''')
	}
	
	override performDirectoryDeletion(String path) {
		throw new UnsupportedOperationException('''Unsupported operation: cannot delete directory from a bundle! Directory: «path»''')
	}
	
}
