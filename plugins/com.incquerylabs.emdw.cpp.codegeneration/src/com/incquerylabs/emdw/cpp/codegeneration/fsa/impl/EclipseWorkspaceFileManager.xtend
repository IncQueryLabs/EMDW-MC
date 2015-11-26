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
import org.eclipse.core.resources.IContainer

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
	private def IContainer getContainer(String path) {
		if(path.isNullOrEmpty) {
			return rootProject
		}
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
		path.container.createFolder
	}

	override void performDirectoryDeletion(String path) {
		path.container.delete(true, null)
	}
	
	override readSubDirectoryNames(String path) {
		return path.container.members.filter[ f |
			f instanceof IFolder
		].map[f|f.name].toList
	}
	
	override readContainedFileNames(String path) {
		return path.container.members.filter[ f |
			f instanceof IFile
		].map[f|f.name].toList
	}
	
	override directoryExists(String path) {
		return path.container.exists
	}

	/*
	 * File management methods
	 */
	override void performFileCreation(String directoryPath, String filename, CharSequence content) {
		directoryPath.container.getFile(filename).create(new ByteArrayInputStream(content.toString.bytes), true, null)
	}

	override void performFileDeletion(String directoryPath, String filename) {
		directoryPath.container.getFile(filename).delete(true, null)
	}
	
	override boolean fileExists(String directoryPath, String filename) {
		return directoryPath.container.getFile(filename).exists
	}
	
	override byte[] readFileContent(String directoryPath, String filename) {
		val file = directoryPath.container.getFile(filename)
		return Files.toByteArray(file.rawLocation.makeAbsolute.toFile)
	}
	
	override String readFileContentAsString(String directoryPath, String filename) {
		val file = directoryPath.container.getFile(filename)
		Files.toString(file.rawLocation.makeAbsolute.toFile, DEFAULT_CHARSET)
	}
	
	private dispatch def IFile getFile(IFolder folder, String filename) {
		folder.getFile(filename)
	}
	
	private dispatch def IFile getFile(IProject project, String filename) {
		project.getFile(filename)
	}
	
	// Use Adler32 to calculate file checksum
	override def String calculateHash(byte[] content) {
		val adler32 = new Adler32()
		adler32.update(content)
		adler32.value.toString
	}
}