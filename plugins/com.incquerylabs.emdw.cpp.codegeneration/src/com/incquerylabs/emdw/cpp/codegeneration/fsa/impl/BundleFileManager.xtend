package com.incquerylabs.emdw.cpp.codegeneration.fsa.impl

import com.incquerylabs.emdw.cpp.codegeneration.fsa.FileManager
import org.eclipse.core.runtime.Platform
import org.eclipse.core.runtime.FileLocator
import java.io.File
import com.google.common.io.Files

class BundleFileManager extends FileManager {
	
	new(String rootDirectory) {
		super(rootDirectory)
		formatRootDirectory
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
		val bundle = Platform.getBundle(rootDirectory)
		val url = bundle.getEntry(directoryPath+filename)
		new File(FileLocator.toFileURL(url).toURI())
	}
	
	private def File getFolder(String directoryPath) {
		val bundle = Platform.getBundle(rootDirectory)
		val url = bundle.getEntry(directoryPath)
		new File(FileLocator.toFileURL(url).toURI())
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
		directoryPath.getFile(filename).isFile
	}
	
	override directoryExists(String path) {
		path.folder.isDirectory
	}
	
	override readSubDirectoryNames(String path) {
		path.folder.list.filter[ filename |
			path.getFile(filename).directory
		].toList
	}
	
	override readContainedFileNames(String path) {
		path.folder.list.filter[ filename |
			path.getFile(filename).file
		].toList
	}
	
	
	override performFileCreation(String directoryPath, String filename, CharSequence content) {
		throw new UnsupportedOperationException("Unsupported operation: cannot create file in a bundle")
	}
	
	override performFileDeletion(String directoryPath, String filename) {
		throw new UnsupportedOperationException("Unsupported operation: cannot delete file in a bundle")
	}
	
	override performDirectoryCreation(String path) {
		throw new UnsupportedOperationException("Unsupported operation: cannot create directory in a bundle")
	}
	
	override performDirectoryDeletion(String path) {
		throw new UnsupportedOperationException("Unsupported operation: cannot delete directory in a bundle")
	}
	
}
