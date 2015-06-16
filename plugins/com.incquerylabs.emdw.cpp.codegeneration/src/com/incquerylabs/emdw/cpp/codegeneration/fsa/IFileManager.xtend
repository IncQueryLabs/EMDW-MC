package com.incquerylabs.emdw.cpp.codegeneration.fsa

import java.util.List

interface IFileManager {
	
	/*
	 * Methods to handle directory structure
	 */
	def boolean createDirectory(String path)
	
	def boolean deleteDirectory(String path)
	
	def boolean isDirectoryExists(String path)
	
	def List<String> getSubDirectoryNames(String path)
	
	/*
	 * Methods to handle file printing
	 */
	 
	 
	
}