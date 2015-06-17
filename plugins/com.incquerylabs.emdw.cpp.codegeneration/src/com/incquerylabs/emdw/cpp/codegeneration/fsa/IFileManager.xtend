package com.incquerylabs.emdw.cpp.codegeneration.fsa

import java.util.List

interface IFileManager {
	
	/*
	 * Directory management methods
	 */
	def boolean createDirectory(String path)
	
	def boolean deleteDirectory(String path)
	
	def boolean isDirectoryExists(String path)
	
	def List<String> getSubDirectoryNames(String path)
	
	/*
	 * File management methods
	 */
	def boolean createFile(String directoryPath, String filename, CharSequence content, boolean force, boolean useCache)
	
	def boolean deleteFile(String directoryPath, String filename)
	
	/*
	 * Cache management methods
	 */
	def void clearFileCache()
}