package com.incquerylabs.emdw.cpp.codegeneration.util

import org.apache.log4j.Logger
import org.eclipse.core.resources.IFolder
import org.eclipse.core.resources.IProject
import org.eclipse.core.resources.IResource

import static com.google.common.base.Preconditions.*

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
}