package com.incquerylabs.emdw.cpp.codegeneration.fsa.impl

import com.google.common.io.ByteStreams
import com.incquerylabs.emdw.cpp.codegeneration.fsa.FileManager
import java.io.BufferedReader
import java.io.InputStreamReader
import java.nio.charset.StandardCharsets
import java.nio.file.Paths
import java.util.stream.Collectors
import org.eclipse.xtend2.lib.StringConcatenation
import com.incquerylabs.emdw.cpp.codegeneration.fsa.FSAException

class JarFileManager extends FileManager {
	
	
	new() {
		super(".")
	}
	
	override readFileContent(String directoryPath, String filename) {
		val fullPath = '''«directoryPath»/«filename»'''
		try {
			val fileResource = JarFileManager.classLoader.getResourceAsStream(fullPath)
			if(fileResource==null) {
				throw new FSAException('''Cannot resolve file in jar! File: «fullPath»''')
			}
			return ByteStreams::toByteArray(fileResource)
		} catch(FSAException fsaex) {
			throw fsaex
		} catch(Exception ex) {
			throw new FSAException('''Something went wrong while read file in jar! File: «fullPath»''', ex)
		}
	}
	
	override readFileContentAsString(String directoryPath, String filename) {
		val fullPath = Paths::get(directoryPath, filename).toString
		try {
			val fileResource = JarFileManager.classLoader.getResourceAsStream(fullPath)
			if(fileResource==null) {
				throw new FSAException('''Cannot resolve file in jar! File: «fullPath»''')
			}
			val contentList= new BufferedReader(new InputStreamReader(fileResource, StandardCharsets.UTF_8)).lines.collect(Collectors::toList)
			return contentList.join(StringConcatenation.DEFAULT_LINE_DELIMITER)
		} catch(FSAException fsaex) {
			throw fsaex
		} catch(Exception ex) {
			throw new FSAException('''Something went wrong while read file in jar! File: «fullPath»''', ex)
		}
	}
	
	override directoryExists(String path) {
		JarFileManager.classLoader.getResource(path) != null
	}
	
	override fileExists(String directoryPath, String filename) {
		JarFileManager.classLoader.getResource('''«directoryPath»/«filename»''') != null
	}
	
	override performFileCreation(String directoryPath, String filename, CharSequence content) {
		throw new UnsupportedOperationException('''Unsupported operation: cannot create file in a jar! File: «directoryPath»«filename»''')
	}
	
	override performFileDeletion(String directoryPath, String filename) {
		throw new UnsupportedOperationException('''Unsupported operation: cannot delete file from a jar! File: «directoryPath»«filename»''')
	}
	
	override performDirectoryCreation(String path) {
		throw new UnsupportedOperationException('''Unsupported operation: cannot create directory in a jar! Directory: «path»''')
	}
	
	override performDirectoryDeletion(String path) {
		throw new UnsupportedOperationException('''Unsupported operation: cannot delete directory from a jar! Directory: «path»''')
	}
	
	override readSubDirectoryNames(String path) {
		throw new UnsupportedOperationException('''Unsupported operation: cannot explore sub directories in a jar! Directory: «path»''')
	}
	
	override readContainedFileNames(String path) {
		throw new UnsupportedOperationException('''Unsupported operation: cannot explore contained files in a jar! Directory: «path»''')
	}
}
