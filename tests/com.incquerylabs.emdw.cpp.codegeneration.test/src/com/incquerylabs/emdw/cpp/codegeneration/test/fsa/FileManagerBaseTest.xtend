/*******************************************************************************
 * Copyright (c) 2015-2016, IncQuery Labs Ltd. and Ericsson AB
 * All rights reserved. This program and the accompanying materials
 * are made available under the terms of the Eclipse Public License v1.0
 * which accompanies this distribution, and is available at
 * http://www.eclipse.org/legal/epl-v10.html
 *
 * Contributors:
 *   Akos Horvath, Abel Hegedus, Zoltan Ujhelyi, Daniel Segesdi, Tamas Borbas, Robert Doczi, Peter Lunk, Istvan Papp - initial API and implementation
 *******************************************************************************/
package com.incquerylabs.emdw.cpp.codegeneration.test.fsa

import com.incquerylabs.emdw.cpp.codegeneration.FileAndDirectoryGeneration
import com.incquerylabs.emdw.cpp.codegeneration.fsa.FileManager
import com.incquerylabs.emdw.cpp.codegeneration.fsa.IFileManager
import java.text.MessageFormat
import java.util.List
import org.apache.log4j.AppenderSkeleton
import org.apache.log4j.Level
import org.apache.log4j.Logger
import org.apache.log4j.spi.LoggingEvent
import org.junit.After
import org.junit.Before
import org.junit.BeforeClass
import org.junit.Test

import static org.junit.Assert.*
import org.junit.Ignore

abstract class FileManagerBaseTest<T extends FileManager> {

	protected extension Logger logger = Logger.getLogger(class)

	private IFileManager fileManager

	private final String directoryPath = "test_directory"

	private final String fileName = "testfile.txt"
	private final CharSequence fileContent1 = "File manager test content 1"
	private final CharSequence fileContent2 = "File manager test content 2"
	
	private TestAppender testAppender
	
	new(T fileManager) {
		this.fileManager = fileManager
	}
	
	@BeforeClass
	def static setupLogger() {
		Logger.getLogger(FileAndDirectoryGeneration.package.name).level = Level.DEBUG
	}
	
	@Before
	public def void initialize() {
		testAppender = new TestAppender
		Logger.getRootLogger().addAppender(testAppender);
	}
	
	public def void initializeTestDirectory() {
		fileManager.deleteDirectory(directoryPath)
		fileManager.createDirectory(directoryPath)		
	}
	
	@Test
	public def void directoryCreation_test() {
		assertTrue(fileManager.createDirectory(directoryPath))
		assertLastLog(MessageFormat.format(FileManager.messages.DIRECTORY_CREATED, directoryPath, directoryPath))
		assertTrue(fileManager.createDirectory(directoryPath))
		assertLastLog(MessageFormat.format(FileManager.messages.DIRECTORY_ALREADY_EXIST, directoryPath, directoryPath))
		cleanupTestDirectory
	}
	
	@Test
	public def void directoryDelete_test() {
		assertTrue(fileManager.createDirectory(directoryPath))
		assertLastLog(MessageFormat.format(FileManager.messages.DIRECTORY_CREATED, directoryPath))
		assertTrue(fileManager.deleteDirectory(directoryPath))
		assertLastLog(MessageFormat.format(FileManager.messages.DIRECTORY_DELETED, directoryPath))
	}
	
	@Test
	@Ignore("File cannot be deleted without directory")
	public def void fileCreationWithoutCache_test() {
		assertTrue(fileManager.createFile(fileName, fileContent1, false, false))
		assertLastLog(MessageFormat.format(FileManager.messages.FILE_CREATED, "", fileName))
		assertTrue(fileManager.createFile(fileName, fileContent1, false, false))
		assertLastLog(MessageFormat.format(FileManager.messages.FILE_NOT_CHANGED, "", fileName))
		fileManager.deleteFile("", fileName)
	}
	
	@Test
	@Ignore("File cannot be deleted without directory")
	public def void fileCreationWithCache_test() {
		assertTrue(fileManager.createFile(fileName, fileContent1, false, true))
		assertLastLog(MessageFormat.format(FileManager.messages.FILE_CREATED, "", fileName))
		assertTrue(fileManager.createFile(fileName, fileContent1, false, true))
		assertLastLog(MessageFormat.format(FileManager.messages.FILE_NOT_CHANGED, "", fileName))
		fileManager.deleteFile("", fileName)
	}
	
	@Test
	public def void fileCreationWithoutCacheIntoDirectory_test() {
		initializeTestDirectory
		assertTrue(fileManager.createFile(directoryPath, fileName, fileContent1, false, false))
		assertLastLog(MessageFormat.format(FileManager.messages.FILE_CREATED, directoryPath, fileName))
		assertTrue(fileManager.createFile(directoryPath, fileName, fileContent1, false, false))
		assertLastLog(MessageFormat.format(FileManager.messages.FILE_NOT_CHANGED, directoryPath, fileName))
		cleanupTestDirectory
	}
	
	@Test
	public def void fileCreationWithCacheIntoDirectory_test() {
		initializeTestDirectory
		assertTrue(fileManager.createFile(directoryPath, fileName, fileContent1, false, true))
		assertLastLog(MessageFormat.format(FileManager.messages.FILE_CREATED, directoryPath, fileName))
		assertTrue(fileManager.createFile(directoryPath, fileName, fileContent1, false, true))
		assertLastLog(MessageFormat.format(FileManager.messages.FILE_NOT_CHANGED, directoryPath, fileName))
		cleanupTestDirectory
	}
	
	@Test
	public def void getFileContentAsString_test() {
		initializeTestDirectory
		assertTrue(fileManager.createFile(directoryPath, fileName, fileContent1, false, true))
		assertLastLog(MessageFormat.format(FileManager.messages.FILE_CREATED, directoryPath, fileName))
		assertEquals(fileContent1, fileManager.getFileContentAsString(directoryPath, fileName))
		cleanupTestDirectory
	}
	
	@Test
	public def void fileUpdate_test() {
		initializeTestDirectory
		assertTrue(fileManager.createFile(directoryPath, fileName, fileContent1, false, false))
		assertLastLog(MessageFormat.format(FileManager.messages.FILE_CREATED, directoryPath, fileName))
		assertTrue(fileManager.createFile(directoryPath, fileName, fileContent2, false, false))
		assertLastLog(MessageFormat.format(FileManager.messages.FILE_UPDATED, directoryPath, fileName))
		cleanupTestDirectory
	}
	
	@Test
	public def void fileDelete_test() {
		initializeTestDirectory
		assertTrue(fileManager.createFile(directoryPath, fileName, fileContent1, false, true))
		assertLastLog(MessageFormat.format(FileManager.messages.FILE_CREATED, directoryPath, fileName))
		assertTrue(fileManager.deleteFile(directoryPath, fileName))
		assertLastLog(MessageFormat.format(FileManager.messages.FILE_DELETED, directoryPath, fileName))
		cleanupTestDirectory
	}
	
	public def void cleanupTestDirectory() {
		fileManager.deleteDirectory(directoryPath)
	}
	
	@After
	public def void cleanup() {
		fileManager.clearFileCache
	}
	
	private def void assertLastLog(String msg) {
		assertEquals(msg, testAppender.events.last.message)
	}
	
	static class TestAppender extends AppenderSkeleton {
		List<LoggingEvent> events = <LoggingEvent>newArrayList()
		
		override protected append(LoggingEvent event) {
			events.add(event)
		}

		override close() {}

		override requiresLayout() { return false }

	}
}
