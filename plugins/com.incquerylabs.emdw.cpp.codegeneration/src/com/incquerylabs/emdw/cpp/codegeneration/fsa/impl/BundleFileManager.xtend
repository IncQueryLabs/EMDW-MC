package com.incquerylabs.emdw.cpp.codegeneration.fsa.impl

import com.google.common.io.Files
import com.incquerylabs.emdw.cpp.codegeneration.fsa.FileManager
import java.io.File
import java.net.URI
import org.eclipse.core.runtime.FileLocator
import org.eclipse.core.runtime.Platform

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
		val fullPath = directoryPath+filename
		resolveFile(fullPath)
	}
	
	private def File getFolder(String directoryPath) {
		resolveFile(directoryPath)
	}
	
	private def resolveFile(String fullPath) {
		val bundle = Platform.getBundle(rootDirectory)
		val url = bundle.getEntry(fullPath.replace(File::separator, '/'))
		val resolvedFileURL = FileLocator.toFileURL(url);
		val resolvedURI = new URI(resolvedFileURL.getProtocol(), resolvedFileURL.getPath(), null)
		new File(resolvedURI)
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
