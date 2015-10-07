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
	
	def List<String> getContainedFileNames(String path)
	
	/*
	 * File management methods
	 */
	def boolean fileExists(String directoryPath, String filename)
	 
	def boolean createFile(String directoryPath, String filename, CharSequence content, boolean force, boolean useCache)
	
	def boolean createFile(String filename, CharSequence content, boolean force, boolean useCache)
	
	def boolean deleteFile(String directoryPath, String filename)
	
	def boolean checkFileContent(String directoryPath, String filename, CharSequence content)
	
	def String getFileContentAsString(String directoryPath, String filename)

	/*
	 * Cache management methods
	 */
	def void clearFileCache()
}