package com.incquerylabs.emdw.cpp.codegeneration.fsa

import com.google.common.base.Charsets
import java.io.ByteArrayInputStream
import java.nio.charset.Charset
import java.security.DigestInputStream
import java.security.MessageDigest
import java.text.MessageFormat
import java.util.HashMap
import java.util.List
import javax.xml.bind.DatatypeConverter
import org.apache.log4j.Logger

import static com.google.common.base.Preconditions.*

abstract class FileManager implements IFileManager {
	
	protected String rootDirectory;
	protected String type
	protected HashMap<String, String> fileHashCache;
	private final static String HASH_METHOD = "MD5"
	protected final static Charset DEFAULT_CHARSET = Charsets.UTF_8
	
	new(String rootDirectory) {
		this.rootDirectory = rootDirectory
		formatRootDirectory
		
		fileHashCache = <String, String>newHashMap()
	}
	
	public static class messages {
		
		public final static String FILE_NOT_CHANGED = "File was not written ({0}/{1}) because it has not changed!"
		public final static String FILE_CREATED = "File successfully created ({0}/{1})"
		public final static String FILE_UPDATED = "File successfully updated ({0}/{1})"
		public final static String FILE_DELETED = "File successfully deleted ({0}/{1})"
		public final static String FILE_NOT_EXIST = "File does not exists ({0}/{1})"
		
		public final static String DIRECTORY_NOT_EXIST = "Directory does not exists ({0})"
		public final static String DIRECTORY_CREATED = "Directory successfully created ({0})"
		public final static String DIRECTORY_DELETED = "Directory successfully deleted ({0})"
		public final static String DIRECTORY_ALREADY_EXIST = "Directory already exists ({0})"
		
		public final static String ARG_NOT_NULL = "{0} argument cannot be null or empty"
		
	}
	
	extension val Logger logger = Logger.getLogger(class)
	
	/*
	 * Methods to handle root directory
	 */
	private def formatRootDirectory() {
		if(rootDirectory == null || rootDirectory.equals(""))
			this.rootDirectory = "/"
		if(!this.rootDirectory.endsWith("/"))
			this.rootDirectory = this.rootDirectory + "/"
	}
	
	def String getRootDirectory() {
		return this.rootDirectory
	}
	
	protected def String addRootDirectory(String path) {
		rootDirectory + path
	}
	
	/*
	 * Methods to check file changes
	 */
	private def boolean fileNotChanged(String directoryPath, String filename, CharSequence content) {
		val newContentHash = calculateHash(content)
		existsInFileCache('''«directoryPath»/«filename»''', newContentHash) || existsInFileSystem(directoryPath, filename, newContentHash)	
	}
	
	private def boolean isExistingFileWithContent(String filename, CharSequence content) {
		val newContentHash = calculateHash(content)
		existsInFileCache('''./«filename»''', newContentHash) || existsInFileSystem(filename, newContentHash)	
	}
	
	private def cacheFile(String directoryPath, String filename, CharSequence content) {
		fileHashCache.put('''«directoryPath»/«filename»''', calculateHash(content))
	}
	
	// Check in memory cache
	private def boolean existsInFileCache(String pathAndName, String contentHash) {
		fileHashCache.get(pathAndName) != null && fileHashCache.get(pathAndName).equals(contentHash)
	}
	
	// Check file system
	private def boolean existsInFileSystem(String directoryPath, String filename, String contentHash) {
		val fileSystemContent = getFileContent(directoryPath, filename)
		if(fileSystemContent == null)
			return false
		else
			calculateHash(fileSystemContent).equals(contentHash)
	}
	private def boolean existsInFileSystem(String filename, String contentHash) {
		val fileSystemContent = getFileContent(filename)
		if(fileSystemContent == null)
			return false
		else
			calculateHash(fileSystemContent).equals(contentHash)
	}
	
	private def String calculateHash(CharSequence content) {
		calculateHash(content.toString.bytes)
	}
	
	override def void clearFileCache() {
		fileHashCache.clear
	}
	
	/*
	 * Override this method to use other calculation
	 */
	protected def String calculateHash(byte[] content) {
		val byte[] buffer = newByteArrayOfSize(8192)
		val md = MessageDigest.getInstance(HASH_METHOD)
		val dis = new DigestInputStream(new ByteArrayInputStream(content), md)
		while (dis.read(buffer) != -1)
		dis.close
		DatatypeConverter.printHexBinary(md.digest)
	}
	
	/*
	 * File management methods
	 */	 
	 private def checkDirectoryPathAndFileName(String directoryPath, String filename) {
	 	checkStringArgument(directoryPath, "Directory path")
		checkStringArgument(filename, "Filename")
	}
	
	 private def checkFileName(String filename) {
		checkStringArgument(filename, "Filename")
	}
	 
	override boolean createFile(String directoryPath, String filename, CharSequence content, boolean force, boolean useCache) throws FileManagerException {
	 	checkDirectoryPathAndFileName(directoryPath, filename)
	 	if (!isDirectoryExists(directoryPath)) {
			debug(MessageFormat.format(FileManager.messages.DIRECTORY_NOT_EXIST, directoryPath))
			return false
		}
		
		if (!force && fileNotChanged(directoryPath, filename, content)) {
			debug(MessageFormat.format(FileManager.messages.FILE_NOT_CHANGED, directoryPath, filename))
			return true
		}
		
	 	return ceateFileInExistingDirectory(directoryPath, filename, content, force, useCache)
	}
	 
	override boolean createFile(String filename, CharSequence content, boolean force, boolean useCache) throws FileManagerException {
	 	checkFileName(filename)
		
	 	if (!force && isExistingFileWithContent(filename, content)) {
			debug(MessageFormat.format(FileManager.messages.FILE_NOT_CHANGED, "", filename))
			return true
		}
		
		return ceateFileInExistingDirectory("", filename, content, force, useCache)
	}
	
	private def ceateFileInExistingDirectory(String directoryPath, String filename, CharSequence content, boolean force, boolean useCache) throws FileManagerException {
		try {
			if(fileExists(directoryPath, filename)) {
				performFileDeletion(directoryPath, filename)
				performFileCreation(directoryPath, filename, content)
				debug(MessageFormat.format(FileManager.messages.FILE_UPDATED, directoryPath, filename))
			} else {
				performFileCreation(directoryPath, filename, content)
				debug(MessageFormat.format(FileManager.messages.FILE_CREATED, directoryPath, filename))
			}
			
			if(useCache) {
				cacheFile(directoryPath, filename, content)
			}
			return true
		} catch(Exception ex) {
			throw new FileManagerException('''Something went wrong while creating file in «type»! Directory: «directoryPath», File name: «filename»''', ex)
		}
	}
	
	override boolean deleteFile(String directoryPath, String filename) throws FileManagerException {
		try {
			checkDirectoryPathAndFileName(directoryPath, filename)
			if (!isDirectoryExists(directoryPath)) {
				debug(MessageFormat.format(FileManager.messages.DIRECTORY_NOT_EXIST, directoryPath))
				return false
			}
			
			if(fileExists(directoryPath, filename)) {
				performFileDeletion(directoryPath, filename)
				debug(MessageFormat.format(FileManager.messages.FILE_DELETED, directoryPath, filename))
			} else {
				debug(MessageFormat.format(FileManager.messages.FILE_NOT_EXIST, directoryPath, filename))
			}
			
			return true
		} catch(Exception ex) {
			throw new FileManagerException('''Something went wrong while deleting file in «type»! Directory: «directoryPath», File name: «filename»''', ex)
		}
	}
	
	override boolean checkFileContent(String directoryPath, String filename, CharSequence content) throws FileManagerException {
		try {
			val expectedCheckSum = calculateHash(content)
			return existsInFileSystem(directoryPath, filename, expectedCheckSum)
		} catch(Exception ex) {
			throw new FileManagerException('''Something went wrong while checking file content in «type»! Directory: «directoryPath», File name: «filename»''', ex)
		}
	}
	
	override String getFileContentAsString(String directoryPath, String filename) throws FileManagerException {
		try {
			checkDirectoryPathAndFileName(directoryPath, filename)
			if(isDirectoryExists(directoryPath) && fileExists(directoryPath, filename)) {
				return readFileContentAsString(directoryPath, filename)
			} else {
				debug(MessageFormat.format(FileManager.messages.FILE_NOT_EXIST, directoryPath, filename))
			}
			return null
		} catch(Exception ex) {
			throw new FileManagerException('''Something went wrong while getting file content as string in «type»! Directory: «directoryPath», File name: «filename»''', ex)
		}
	}
	
	
	private def byte[] getFileContent(String directoryPath, String filename) {
		checkDirectoryPathAndFileName(directoryPath, filename)
		if(isDirectoryExists(directoryPath) && fileExists(directoryPath, filename))
			return readFileContent(directoryPath, filename)
		else
			debug(MessageFormat.format(FileManager.messages.FILE_NOT_EXIST, directoryPath, filename))
		return null
	}
	private def byte[] getFileContent(String filename) {
		checkFileName(filename)
		if(fileExists("", filename))
			return readFileContent("", filename)
		else
			debug(MessageFormat.format(FileManager.messages.FILE_NOT_EXIST, ".", filename))
		return null
	}
	
	abstract def void performFileCreation(String directoryPath, String filename, CharSequence content)
	
	abstract def void performFileDeletion(String directoryPath, String filename)
	
	abstract def byte[] readFileContent(String directoryPath, String filename)
	
	abstract def String readFileContentAsString(String directoryPath, String filename)
	
	/*
	 * Directory management methods
	 */
	override boolean createDirectory(String path) throws FileManagerException {
		if(isDirectoryExists(path)) {
			debug(MessageFormat.format(FileManager.messages.DIRECTORY_ALREADY_EXIST, path))
		} else {
			try {
				performDirectoryCreation(path)
				debug(MessageFormat.format(FileManager.messages.DIRECTORY_CREATED, path))
			} catch(Exception ex) {
				throw new FileManagerException('''Something went wrong while creating directory in «type»! Directory: «path»''', ex)
			}
		}
		return true
	}
	
	override boolean deleteDirectory(String path) throws FileManagerException {
		checkStringArgument(path, "Directory path")
		if(!isDirectoryExists(path)) {
			debug(MessageFormat.format(FileManager.messages.DIRECTORY_NOT_EXIST, path))
		} else {
			try {
				performDirectoryDeletion(path)
				debug(MessageFormat.format(FileManager.messages.DIRECTORY_DELETED, path))
			} catch(Exception ex) {
				throw new FileManagerException('''Something went wrong while deleting directory in «type»! Directory: «path»''', ex)
			}
		}
		return true
	}
	
	override List<String> getSubDirectoryNames(String path) throws FileManagerException {
		checkStringArgument(path, "Directory path")
		if(isDirectoryExists(path)) {
			try {
				return readSubDirectoryNames(path)
			} catch (Exception ex) {
				throw new FileManagerException('''Something went wrong while exploring sub directories in «type»! Directory: «path»''', ex)
			}
		} else {
			return <String>newArrayList()
		}
	}
	
	override List<String> getContainedFileNames(String path) {
		checkStringArgument(path, "Directory path")
		if(isDirectoryExists(path))
			try {
				readContainedFileNames(path)
			} catch (Exception ex) {
				throw new FileManagerException('''Something went wrong while exploring contained files in «type»! Directory: «path»''', ex)
			}
		else
			<String>newArrayList()
	}
	
	override boolean isFileExists(String directoryPath, String filename) throws FileManagerException {
		checkStringArgument(directoryPath, "Directory path")
		checkStringArgument(filename, "File name")
		try {
			fileExists(directoryPath, filename)
		} catch(Exception ex) {
			throw new FileManagerException('''Something went wrong while checking file existence in «type»! Directory: «directoryPath», File name: «filename»''', ex)
		}
	}
	
	override boolean isDirectoryExists(String path) throws FileManagerException {
		checkStringArgument(path, "Directory path")
		try {
			directoryExists(path)
		} catch(Exception ex) {
			throw new FileManagerException('''Something went wrong while checking directory existence in «type»! Directory: «path»''', ex)
		}
	}
	
	abstract def void performDirectoryCreation(String path)
	
	abstract def void performDirectoryDeletion(String path)
	
	abstract def List<String> readSubDirectoryNames(String path)
	
	abstract def List<String> readContainedFileNames(String path)
	
	abstract def boolean directoryExists(String path)
	
	abstract def boolean fileExists(String directoryPath, String filename)
	
	/*
	 * Helper methods
	 */
	private def checkStringArgument(String argument, String name) {
		checkArgument(!argument.isNullOrEmpty, MessageFormat.format(FileManager.messages.ARG_NOT_NULL, name))
	}
	
}