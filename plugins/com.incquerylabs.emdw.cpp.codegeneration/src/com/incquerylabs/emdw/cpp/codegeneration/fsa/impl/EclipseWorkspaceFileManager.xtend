package com.incquerylabs.emdw.cpp.codegeneration.fsa.impl

import com.google.common.io.Files
import com.incquerylabs.emdw.cpp.codegeneration.fsa.FileManager
import java.io.ByteArrayInputStream
import org.eclipse.core.resources.IFile
import org.eclipse.core.resources.IFolder
import org.eclipse.core.resources.IProject
import org.eclipse.core.resources.IResource
import org.eclipse.core.resources.ResourcesPlugin
import java.util.zip.Adler32
import com.incquerylabs.emdw.cpp.codegeneration.fsa.FileManagerException

class EclipseWorkspaceFileManager extends FileManager {

	private IProject rootProject;

	new(String projectName, String rootDirectory) {
		super(rootDirectory)

		rootProject = ResourcesPlugin.workspace.root.getProject(projectName)
		if(!rootProject.exists) rootProject.create(null)
		rootProject.open(null)
	}
	
	new(IFolder targetFolder) {
		super(targetFolder.projectRelativePath.toString)
		rootProject = targetFolder.project
	}
	
	// Implementation specific methods
	private def IFolder getFolder(String path) {
		rootProject.getFolder(path.addRootDirectory)
	}

	private def void createFolder(IResource resource) {
		if (!resource.parent.exists)
			createFolder(resource.parent)
		
		try{
			switch (resource.type) {
				case IResource.PROJECT: {
					val iproject = resource as IProject
					iproject.create(null)
					iproject.open(null)
				}
				case IResource.FOLDER: 
					(resource as IFolder).create(IResource.NONE, true, null)
			}
		} catch(Exception ex) {
			throw new FileManagerException('''Something went wrong with directory creation in Eclipse workspace! Directory: «resource.fullPath»''', ex)
		}
	}

	/*
	 * Directory management methods
	 */ 
	override void performDirectoryCreation(String path) {
		try{
			path.folder.createFolder
		} catch(FileManagerException fsaex) {
			throw fsaex
		} catch(Exception ex) {
			throw new FileManagerException('''Something went wrong with directory creation in Eclipse workspace! Directory: «path»''', ex)
		}
	}

	override void performDirectoryDeletion(String path) {
		try{
			path.folder.delete(true, null)
		} catch(Exception ex) {
			throw new FileManagerException('''Something went wrong with directory deletion in Eclipse workspace! Directory: «path»''', ex)
		}
	}
	
	override readSubDirectoryNames(String path) {
		try {
			return path.folder.members.filter[ f |
				f instanceof IFolder
			].map[f|f.name].toList
		} catch(Exception ex) {
			throw new FileManagerException('''Something went wrong while exploring sub directories in Eclipse workspace! Directory: «path.addRootDirectory»''', ex)
		}
	}
	
	override readContainedFileNames(String path) {
		try {
			return path.folder.members.filter[ f |
				f instanceof IFile
			].map[f|f.name].toList
		} catch(Exception ex) {
			throw new FileManagerException('''Something went wrong while exploring contained files in Eclipse workspace! Directory: «path.addRootDirectory»''', ex)
		}
	}
	
	override directoryExists(String path) {
		try {
			return path.folder.exists
		} catch(Exception ex) {
			throw new FileManagerException('''Something went wrong while checking directory existence in Eclipse workspace! Directory: «path.addRootDirectory»''', ex)
		}
	}

	/*
	 * File management methods
	 */
	override void performFileCreation(String directoryPath, String filename, CharSequence content) {
		try {
			directoryPath.folder.getFile(filename).create(new ByteArrayInputStream(content.toString.bytes), true, null)
		} catch(FileManagerException fsaex) {
			throw fsaex
		} catch(Exception ex) {
			throw new FileManagerException('''Something went wrong with file creation in Eclipse workspace! File: «directoryPath»«filename»''', ex)
		}
	}

	override void performFileDeletion(String directoryPath, String filename) {
		try {
			directoryPath.folder.getFile(filename).delete(true, null)
		} catch(FileManagerException fsaex) {
			throw fsaex
		} catch(Exception ex) {
			throw new FileManagerException('''Something went wrong while deleting file from Eclipse workspace! File: «directoryPath»«filename»''', ex)
		}
	}
	
	override boolean fileExists(String directoryPath, String filename) {
		try {
			return directoryPath.folder.getFile(filename).exists
		} catch(FileManagerException fsaex) {
			throw fsaex
		} catch(Exception ex) {
			throw new FileManagerException('''Something went wrong while checking file existence in Eclipse workspace! File: «directoryPath»«filename»''', ex)
		}
	}
	
	override byte[] readFileContent(String directoryPath, String filename) {
		try {
			val file = directoryPath.folder.getFile(filename)
			return Files.toByteArray(file.rawLocation.makeAbsolute.toFile)
		} catch(FileManagerException fsaex) {
			throw fsaex
		} catch(Exception ex) {
			throw new FileManagerException('''Something went wrong while reading file in Eclipse workspace! File: «directoryPath»«filename»''', ex)
		}
	}
	
	override String readFileContentAsString(String directoryPath, String filename) {
		try {
			val file = directoryPath.folder.getFile(filename)
			Files.toString(file.rawLocation.makeAbsolute.toFile, DEFAULT_CHARSET)
		} catch(FileManagerException fsaex) {
			throw fsaex
		} catch(Exception ex) {
			throw new FileManagerException('''Something went wrong while reading file in Eclipse workspace! File: «directoryPath»«filename»''', ex)
		}
	}
	
	// Use Adler32 to calculate file checksum
	override def String calculateHash(byte[] content) {
		val adler32 = new Adler32()
		adler32.update(content)
		adler32.value.toString
	}
}