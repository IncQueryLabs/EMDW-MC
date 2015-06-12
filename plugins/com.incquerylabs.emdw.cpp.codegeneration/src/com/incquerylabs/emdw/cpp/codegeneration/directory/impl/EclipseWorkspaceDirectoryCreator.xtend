package com.incquerylabs.emdw.cpp.codegeneration.directory.impl

import com.incquerylabs.emdw.cpp.codegeneration.directory.DirectoryCreator
import com.incquerylabs.emdw.cpp.codegeneration.directory.IDirectoryCreator
import java.util.ArrayList
import org.apache.log4j.Logger
import org.eclipse.core.resources.IFolder
import org.eclipse.core.resources.IProject
import org.eclipse.core.resources.IResource
import org.eclipse.core.resources.ResourcesPlugin

import static com.google.common.base.Preconditions.*

class EclipseWorkspaceDirectoryCreator extends DirectoryCreator implements IDirectoryCreator {

	private IProject rootProject;

	new(String projectName, String rootDirectory) {
		super(rootDirectory)
		
		rootProject = ResourcesPlugin.workspace.root.getProject(projectName)
		if(!rootProject.exists) rootProject.create(null)
		rootProject.open(null)
	}

	extension val Logger logger = Logger.getLogger(class)

	private def String addRootDirectory(String path) {
		rootDirectory + path
	}

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

	override createDirectory(String path) {
		checkArgument(path != null && !path.equals(""), "Directory path cannot be null!")
		try {
			if (!path.folder.exists) {
				path.folder.createFolder
			} else
				info("Directory already exists: " + path.addRootDirectory)
			return true
		} catch (Exception e) {
			error("Error occurred during folder creation: " + path, e)
			return false
		}
	}

	override deleteDirectory(String path) {
		checkArgument(path != null && !path.equals(""), "Directory path cannot be null!")
		try {
			if (path.folder.exists)
				path.folder.delete(true, null)
			else
				info("Directory does not exists: " + path.addRootDirectory)
			return true
		} catch (Exception e) {
			error("Error occurred during folder deletion: " + path, e)
			return false
		}
	}

	override getSubDirectoryNames(String path) {
		checkArgument(path != null && !path.equals(""), "Directory path cannot be null!")
		if (path.folder.exists)
			path.folder.members.filter[f|f instanceof IFolder].map[f|f.name].toList
		else
			return new ArrayList<String>
	}
	
	override isDirectoryExists(String path) {
		return path.folder.exists
	}

}