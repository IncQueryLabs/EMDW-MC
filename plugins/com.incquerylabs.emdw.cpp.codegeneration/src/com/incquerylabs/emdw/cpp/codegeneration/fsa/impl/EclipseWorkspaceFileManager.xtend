package com.incquerylabs.emdw.cpp.codegeneration.fsa.impl

import com.google.common.io.Files
import com.incquerylabs.emdw.cpp.codegeneration.fsa.FileManager
import java.io.ByteArrayInputStream
import java.util.zip.Adler32
import org.eclipse.core.resources.IFile
import org.eclipse.core.resources.IFolder
import org.eclipse.core.resources.IProject
import org.eclipse.core.resources.IResource
import org.eclipse.core.resources.ResourcesPlugin

class EclipseWorkspaceFileManager extends FileManager {

	private IProject rootProject;

	new(String projectName, String rootDirectory) {
		super(rootDirectory)

		rootProject = ResourcesPlugin.workspace.root.getProject(projectName)
		if(!rootProject.exists) {
			rootProject.create(null)
		}
		rootProject.open(null)
		type = "Eclpse workspace"
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
		
		switch (resource.type) {
			case IResource.PROJECT: {
				val iproject = resource as IProject
				iproject.create(null)
				iproject.open(null)
			}
			case IResource.FOLDER: 
				(resource as IFolder).create(IResource.NONE, true, null)
		}
	}

	/*
	 * Directory management methods
	 */ 
	override void performDirectoryCreation(String path) {
		path.folder.createFolder
	}

	override void performDirectoryDeletion(String path) {
		path.folder.delete(true, null)
	}
	
	override readSubDirectoryNames(String path) {
		return path.folder.members.filter[ f |
			f instanceof IFolder
		].map[f|f.name].toList
	}
	
	override readContainedFileNames(String path) {
		return path.folder.members.filter[ f |
			f instanceof IFile
		].map[f|f.name].toList
	}
	
	override directoryExists(String path) {
		return path.folder.exists
	}

	/*
	 * File management methods
	 */
	override void performFileCreation(String directoryPath, String filename, CharSequence content) {
		directoryPath.folder.getFile(filename).create(new ByteArrayInputStream(content.toString.bytes), true, null)
	}

	override void performFileDeletion(String directoryPath, String filename) {
		directoryPath.folder.getFile(filename).delete(true, null)
	}
	
	override boolean fileExists(String directoryPath, String filename) {
		return directoryPath.folder.getFile(filename).exists
	}
	
	override byte[] readFileContent(String directoryPath, String filename) {
		val file = directoryPath.folder.getFile(filename)
		return Files.toByteArray(file.rawLocation.makeAbsolute.toFile)
	}
	
	override String readFileContentAsString(String directoryPath, String filename) {
		val file = directoryPath.folder.getFile(filename)
		Files.toString(file.rawLocation.makeAbsolute.toFile, DEFAULT_CHARSET)
	}
	
	// Use Adler32 to calculate file checksum
	override def String calculateHash(byte[] content) {
		val adler32 = new Adler32()
		adler32.update(content)
		adler32.value.toString
	}
}