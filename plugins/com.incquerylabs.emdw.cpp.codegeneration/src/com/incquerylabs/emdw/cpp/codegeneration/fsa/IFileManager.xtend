package com.incquerylabs.emdw.cpp.codegeneration.fsa

import java.util.List

interface IFileManager {
	
	/*
	 * Directory management methods
	 */
	def boolean createDirectory(String path) throws FileManagerException
	
	def boolean deleteDirectory(String path) throws FileManagerException
	
	def boolean isDirectoryExists(String path) throws FileManagerException
	
	def List<String> getSubDirectoryNames(String path) throws FileManagerException
	
	def List<String> getContainedFileNames(String path) throws FileManagerException
	
	/*
	 * File management methods
	 */
	def boolean isFileExists(String directoryPath, String filename) throws FileManagerException
	 
	def boolean createFile(String directoryPath, String filename, CharSequence content, boolean force, boolean useCache) throws FileManagerException
	
	def boolean createFile(String filename, CharSequence content, boolean force, boolean useCache) throws FileManagerException
	
	def boolean deleteFile(String directoryPath, String filename) throws FileManagerException
	
	def boolean checkFileContent(String directoryPath, String filename, CharSequence content) throws FileManagerException
	
	def String getFileContentAsString(String directoryPath, String filename) throws FileManagerException

	/*
	 * Cache management methods
	 */
	def void clearFileCache()
}