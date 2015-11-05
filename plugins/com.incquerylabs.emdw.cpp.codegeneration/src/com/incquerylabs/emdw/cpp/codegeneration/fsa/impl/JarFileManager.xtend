package com.incquerylabs.emdw.cpp.codegeneration.fsa.impl

import com.google.common.io.ByteStreams
import com.incquerylabs.emdw.cpp.codegeneration.fsa.FileManager
import java.io.BufferedReader
import java.io.InputStreamReader
import java.nio.charset.StandardCharsets
import java.nio.file.Paths
import java.util.stream.Collectors
import org.eclipse.xtend2.lib.StringConcatenation

class JarFileManager extends FileManager {
	
	
	new() {
		super(".")
	}
	
	override performFileCreation(String directoryPath, String filename, CharSequence content) {
		throw new UnsupportedOperationException("TODO: auto-generated method stub")
	}
	
	override performFileDeletion(String directoryPath, String filename) {
		throw new UnsupportedOperationException("TODO: auto-generated method stub")
	}
	
	override readFileContent(String directoryPath, String filename) {
		val fileResource = JarFileManager.classLoader.getResourceAsStream('''«directoryPath»/«filename»''')
		return ByteStreams::toByteArray(fileResource)
	}
	
	override readFileContentAsString(String directoryPath, String filename) {
		val fileResource = JarFileManager.classLoader.getResourceAsStream(Paths::get(directoryPath, filename).toString)
		val contentList= new BufferedReader(new InputStreamReader(fileResource, StandardCharsets.UTF_8)).lines.collect(Collectors::toList)
		contentList.join(StringConcatenation.DEFAULT_LINE_DELIMITER)
	}
	
	override performDirectoryCreation(String path) {
		throw new UnsupportedOperationException("TODO: auto-generated method stub")
	}
	
	override performDirectoryDeletion(String path) {
		throw new UnsupportedOperationException("TODO: auto-generated method stub")
	}
	
	override readSubDirectoryNames(String path) {
		throw new UnsupportedOperationException("TODO: auto-generated method stub")
	}
	
	override readContainedFileNames(String path) {
		throw new UnsupportedOperationException("TODO: auto-generated method stub")
	}
	
	override directoryExists(String path) {
		JarFileManager.classLoader.getResource(path) != null
	}
	
	override fileExists(String directoryPath, String filename) {
		JarFileManager.classLoader.getResource('''«directoryPath»/«filename»''') != null
	}
	
	
}
