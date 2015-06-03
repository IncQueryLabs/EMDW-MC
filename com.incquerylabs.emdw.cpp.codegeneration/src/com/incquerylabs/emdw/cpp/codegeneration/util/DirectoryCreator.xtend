package com.incquerylabs.emdw.cpp.codegeneration.util

import org.apache.log4j.Logger
import org.eclipse.core.resources.IFolder
import org.eclipse.core.resources.IProject
import org.eclipse.core.resources.IResource

import static com.google.common.base.Preconditions.*
import com.ericsson.xtumlrt.oopl.cppmodel.CPPDirectory

class DirectoryCreator {

	extension val Logger logger = Logger.getLogger(class)

	def void createDir(IResource resource) {
		checkArgument(resource != null, "Resource cannot be null!")
		if (resource.exists) {
			info("Resource already exists!")
			return
		}

		if (!resource.getParent.exists)
			createDir(resource.parent)

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
	
	def void deleteDir(IResource resource) {
		checkArgument(resource != null, "Resource cannot be null!")
		if(!resource.exists) {
			info("Resource doesn't exits!")
			return
		}
		
		switch (resource.type) {
			case IResource.PROJECT: {
				val iproject = resource as IProject
				iproject.close(null)
				iproject.delete(true, true, null)	
			}
			case IResource.FOLDER: {
				(resource as IFolder).delete(true, null)
			}
			
		}
	}
	
	def synchronizeSubDirectories(CPPDirectory cppDir, IFolder folder) {
		val cppSubDirNames = cppDir.subDirectories.map[dir | dir.name]
		
		for(IResource childFolder : folder.levelOneMembers) {
			debug('''Folder member:  «childFolder.name»''')
			if(!cppSubDirNames.contains(childFolder.name))
				deleteDir(childFolder)
		}
	}
	
	def static getLevelOneMembers(IFolder folder) {
		val folderMembers = folder.members(IFolder.INCLUDE_HIDDEN)
		val returnMembers = <IResource>newArrayList()
		for(IResource res : folderMembers)
			if(res.parent.equals(folder))
				returnMembers.add(res)
		returnMembers
	}
	
}