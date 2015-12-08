package com.incquerylabs.emdw.cpp.codegeneration.fsa.impl

import com.google.common.io.Files
import com.incquerylabs.emdw.cpp.codegeneration.fsa.FileManager
import java.io.File
import java.io.FileWriter
import java.util.zip.Adler32

class JavaIOBasedFileManager extends FileManager {

	new(String rootDirectory) {
		super(rootDirectory)
		type = "file system"
	}

	override performFileCreation(String directoryPath, String filename, CharSequence content) {
		val file = new File(directoryPath.addRootDirectory, filename)
		file.createNewFile
		val os = new FileWriter(file)
		os.append(content)
		os.flush
		os.close
	}

	override performFileDeletion(String directoryPath, String filename) {
		new File(directoryPath.addRootDirectory, filename).delete
	}

	override readFileContent(String directoryPath, String filename) {
		return readFileContentAsString(directoryPath, filename).bytes
	}

	override readFileContentAsString(String directoryPath, String filename) {
		return Files.toString(new File(directoryPath.addRootDirectory, filename), DEFAULT_CHARSET)
	}

	override fileExists(String directoryPath, String filename) {
		return new File(directoryPath.addRootDirectory, filename).exists
	}

	override performDirectoryCreation(String path) {
		new File(path.addRootDirectory).mkdirs
	}

	override performDirectoryDeletion(String path) {
		new File(path.addRootDirectory).deleteDirectory
	}

	override readSubDirectoryNames(String path) {
		return new File(path.addRootDirectory).list.filter [ filename |
			new File(path.addRootDirectory.append(filename)).directory
		].toList
	}

	override readContainedFileNames(String path) {
		return new File(path.addRootDirectory).list.filter [ filename |
			new File(path.addRootDirectory.append(filename)).file
		].toList
	}

	override directoryExists(String path) {
		return new File(path.addRootDirectory).exists
	}

	private def boolean deleteDirectory(File _file) {
		val file = _file as File
		if (file.directory) {
			for (File child : file.listFiles)
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