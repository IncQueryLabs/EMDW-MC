package com.incquerylabs.emdw.cpp.codegeneration.fsa

import java.io.ByteArrayInputStream
import java.security.DigestInputStream
import java.security.MessageDigest
import java.util.HashMap
import javax.xml.bind.DatatypeConverter
import org.apache.log4j.Logger

abstract class FileManager implements IFileManager {
	
	protected String rootDirectory;
	
	protected HashMap<String, String> fileHashCache;
	private final static String HASH_METHOD = "MD5"
	
	new(String rootDirectory) {
		this.rootDirectory = rootDirectory
		formatRootDirectory
		
		fileHashCache = <String, String>newHashMap()
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
		if(!this.rootDirectory.startsWith("/"))
			this.rootDirectory = "/" + this.rootDirectory
	}
	
	def String getRootDirectory() {
		return this.rootDirectory
	}
	
	/*
	 * Methods to check file changes
	 */
	private def boolean fileNotChanged(String directoryPath, String filename, CharSequence content) {
		val newContentHash = calculateHash(content)
		existsInFileCache('''«directoryPath»/«filename»''', newContentHash) || existsInFileSystem(directoryPath, filename, newContentHash)	
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
	
	protected def String calculateHash(CharSequence content) {
		calculateHash(content.toString.bytes)
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
	 * File creation method
	 */
	 override boolean createFile(String directoryPath, String filename, CharSequence content, boolean force, boolean useCache) {
	 	if (!force && fileNotChanged(directoryPath, filename, content)) {
			info('''File not written («directoryPath»/«filename») because it is not changed!''')
			return true
		}
		
		val fileCreated = createFile(directoryPath, filename, content)
		
		if(useCache && fileCreated)
			cacheFile(directoryPath, filename, content)
		fileCreated
	 }
	 
	 abstract def boolean createFile(String directoryPath, String fileame, CharSequence content)
	
}