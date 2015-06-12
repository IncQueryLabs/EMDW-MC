package com.incquerylabs.emdw.cpp.codegeneration.directory

abstract class DirectoryCreator {
	
	protected String rootDirectory;
	
	new(String rootDirectory) {
		this.rootDirectory = rootDirectory
		formatRootDirectory
	}
	
	private def formatRootDirectory() {
		if(rootDirectory == null || rootDirectory.equals(""))
			this.rootDirectory = "/"
		if(!this.rootDirectory.endsWith("/"))
			this.rootDirectory = this.rootDirectory + "/"
		if(!this.rootDirectory.startsWith("/"))
			this.rootDirectory = "/" + this.rootDirectory
	}
	
	def String getRootDirectory() {
		return this.rootDirectory
	}
	
}