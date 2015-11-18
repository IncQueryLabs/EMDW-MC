package com.incquerylabs.emdw.cpp.codegeneration.fsa.impl

import com.google.common.io.Files
import com.incquerylabs.emdw.cpp.codegeneration.fsa.FileManager
import java.io.File
import java.io.FileWriter
import java.util.zip.Adler32
import com.incquerylabs.emdw.cpp.codegeneration.fsa.FSAException

class JavaIOBasedFileManager extends FileManager {

	new(String rootDirectory) {
		super(rootDirectory)
	}

	override performFileCreation(String directoryPath, String filename, CharSequence content) {
		try {
			val file = new File(directoryPath.addRootDirectory, filename)
			file.createNewFile
			val os = new FileWriter(file)
			os.append(content)
			os.flush
			os.close
		} catch(Exception ex) {
			throw new FSAException('''Something went wrong with file creation in file system! File: «directoryPath.addRootDirectory»/«filename»''', ex)
		}
	}

	override performFileDeletion(String directoryPath, String filename) {
		try {
			new File(directoryPath.addRootDirectory, filename).delete
		} catch(Exception ex) {
			throw new FSAException('''Something went wrong with file deletion in file system! File: «directoryPath.addRootDirectory»/«filename»''', ex)
		}
	}

	override readFileContent(String directoryPath, String filename) {
		try {
			return readFileContentAsString(directoryPath, filename).bytes
		} catch(FSAException fsaex) {
			throw fsaex
		} catch(Exception ex) {
			throw new FSAException('''Something went wrong while read file in file system! File: «directoryPath.addRootDirectory»/«filename»''', ex)
		}
	}

	override readFileContentAsString(String directoryPath, String filename) {
		try {
			return Files.toString(new File(directoryPath.addRootDirectory, filename), DEFAULT_CHARSET)
		} catch(Exception ex) {
			throw new FSAException('''Something went wrong while read file in file system! File: «directoryPath.addRootDirectory»/«filename»''', ex)
		}
	}

	override fileExists(String directoryPath, String filename) {
		try {
			return new File(directoryPath.addRootDirectory, filename).exists
		} catch(Exception ex) {
			throw new FSAException('''Something went wrong while check file existence in file system! File: «directoryPath.addRootDirectory»/«filename»''', ex)
		}
	}

	override performDirectoryCreation(String path) {
		try {
			new File(path.addRootDirectory).mkdirs
		} catch(Exception ex) {
			throw new FSAException('''Something went wrong while create directory in file system! Directory: «path.addRootDirectory»''', ex)
		}
	}

	override performDirectoryDeletion(String path) {
		try {
			new File(path.addRootDirectory).deleteDirectory
		} catch(Exception ex) {
			throw new FSAException('''Something went wrong while delete directory in file system! Directory: «path.addRootDirectory»''', ex)
		}
	}

	override readSubDirectoryNames(String path) {
		try {
			return new File(path.addRootDirectory).list.filter [ filename |
				new File('''«path.addRootDirectory»/«filename»''').directory
			].toList
		} catch(Exception ex) {
			throw new FSAException('''Something went wrong while explore sub directories in file system! Directory: «path.addRootDirectory»''', ex)
		}
	}

	override readContainedFileNames(String path) {
		try {
			return new File(path.addRootDirectory).list.filter[ filename |
				new File('''«path.addRootDirectory»/«filename»''').file
			].toList
		} catch(Exception ex) {
			throw new FSAException('''Something went wrong while explore contained files in file system! Directory: «path.addRootDirectory»''', ex)
		}
	}

	override directoryExists(String path) {
		try {
			return new File(path.addRootDirectory).exists
		} catch(Exception ex) {
			throw new FSAException('''Something went wrong while check directory existence in file system! Directory: «path.addRootDirectory»''', ex)
		}
	}

	private def boolean deleteDirectory(File _file) {
		val file = _file as File
		if (file.directory) {
			for(File child : file.listFiles)
				child.deleteDirectory
			file.delete
		} else {
			file.delete
		}

	}
	
	// Use Adler32 to calculate file checksum
	override def String calculateHash(byte[] content) {
		val adler32 = new Adler32()
		adler32.update(content)
		adler32.value.toString
	}

}