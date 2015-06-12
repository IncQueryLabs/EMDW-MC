package com.incquerylabs.emdw.cpp.codegeneration.directory

import java.util.List

interface IDirectoryCreator {
	
	def boolean createDirectory(String path)
	
	def boolean deleteDirectory(String path)
	
	def boolean isDirectoryExists(String path)
	
	def List<String> getSubDirectoryNames(String path)
	
}