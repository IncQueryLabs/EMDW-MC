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
		try{
			val bundle = Platform.getBundle(rootDirectory)
			val url = bundle.getEntry(fullPath.replace(File::separator, '/'))
			if(url==null) {
				throw new FileManagerException('''Cannot resolve file in bundle! File: «fullPath»''')
			}
			val resolvedFileURL = FileLocator.toFileURL(url);
			val resolvedURI = new URI(resolvedFileURL.getProtocol(), resolvedFileURL.getPath(), null)
			return new File(resolvedURI)
		} catch(FileManagerException fsaex) {
			throw fsaex
		} catch(Exception ex) {
			throw new FileManagerException('''Something went wrong with file resolution in bundle! File: «fullPath»''', ex)
		}
	}
	
	override readFileContent(String directoryPath, String filename) {
		val file = directoryPath.getFile(filename)
		try {
			Files.toByteArray(file)
		} catch(Exception ex) {
			throw new FileManagerException('''File cannot be converted to byte array! File: «directoryPath»«filename»''', ex)
		}
	}
	
	override readFileContentAsString(String directoryPath, String filename) {
		val file = directoryPath.getFile(filename)
		try {
			Files.toString(file, DEFAULT_CHARSET)
		} catch(Exception ex) {
			throw new FileManagerException('''File cannot be converted to string! File: «directoryPath»«filename»''', ex)
		}
	}
	
	override fileExists(String directoryPath, String filename) {
		try {
			return directoryPath.getFile(filename).isFile
		} catch(FileManagerException fsaex) {
			throw fsaex
		} catch(Exception ex) {
			throw new FileManagerException('''Something went wrong while checking file existence in Eclipse workspace! File: «directoryPath»«filename»''', ex)
		}
	}
	
	override directoryExists(String path) {
		try {
			return path.folder.isDirectory
		} catch(FileManagerException fsaex) {
			throw fsaex
		} catch(Exception ex) {
			throw new FileManagerException('''Something went wrong while checking directory existence in Eclipse workspace! Directory: «path.addRootDirectory»''', ex)
		}
	}
	
	override readSubDirectoryNames(String path) {
		try {
			return path.folder.list.filter[ filename |
				path.getFile(filename).directory
			].toList
		} catch(FileManagerException fsaex) {
			throw fsaex
		} catch(Exception ex) {
			throw new FileManagerException('''Something went wrong while exploring sub directories in bundle! Directory: «path»''', ex)
		}
	}
	
	override readContainedFileNames(String path) {
		try {
			return path.folder.list.filter[ filename |
				path.getFile(filename).file
			].toList
		} catch(FileManagerException fsaex) {
			throw fsaex
		} catch(Exception ex) {
			throw new FileManagerException('''Something went wrong while exploring contained files in bundle! Directory: «path.addRootDirectory»''', ex)
		}
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
