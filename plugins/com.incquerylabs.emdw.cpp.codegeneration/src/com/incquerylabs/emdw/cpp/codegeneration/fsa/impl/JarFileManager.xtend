package com.incquerylabs.emdw.cpp.codegeneration.fsa.impl

import com.google.common.io.ByteStreams
import com.incquerylabs.emdw.cpp.codegeneration.fsa.FileManager
import java.io.BufferedReader
import java.io.InputStreamReader
import java.nio.charset.StandardCharsets
import java.nio.file.Paths
import java.util.stream.Collectors
import org.eclipse.xtend2.lib.StringConcatenation
import java.nio.file.Path
import com.incquerylabs.emdw.cpp.codegeneration.fsa.FileManagerException

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
		val fileResource = JarFileManager.classLoader.getResourceAsStream(directoryPath.append(filename).toUnixString)
		if(fileResource==null) {
			throw new FileManagerException('''Cannot resolve file in jar! File: «directoryPath.append(filename).toUnixString»''')
		}
		return ByteStreams::toByteArray(fileResource)
	}
	
	override readFileContentAsString(String directoryPath, String filename) {
		val fileResource = JarFileManager.classLoader.getResourceAsStream(Paths::get(directoryPath, filename).toUnixString)
		if(fileResource==null) {
			throw new FileManagerException('''Cannot resolve file in jar! File: «directoryPath.append(filename).toUnixString»''')
		}
		val contentList= new BufferedReader(new InputStreamReader(fileResource, StandardCharsets.UTF_8)).lines.collect(Collectors::toList)
		contentList.join(StringConcatenation.DEFAULT_LINE_DELIMITER)
	}
	
	// Need to use this because exported jar's ClassLoader does not work with Windows specific path separator ('\')
	def dispatch String toUnixString(Path path) {
		path.toString.replace('\\', '/')
	}
	def dispatch String toUnixString(String path) {
		path.replace('\\', '/')
	}
	def dispatch String toUnixString(CharSequence path) {
		path.toString.replace('\\', '/')
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
		JarFileManager.classLoader.getResource(path.toUnixString) != null
	}
	
	override fileExists(String directoryPath, String filename) {
		JarFileManager.classLoader.getResource(directoryPath.append(filename).toUnixString) != null
	}
	
	
}
