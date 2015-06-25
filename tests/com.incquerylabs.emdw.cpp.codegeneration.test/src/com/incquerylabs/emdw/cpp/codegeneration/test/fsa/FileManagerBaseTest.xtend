package com.incquerylabs.emdw.cpp.codegeneration.test.fsa

import com.incquerylabs.emdw.cpp.codegeneration.FileAndDirectoryGeneration
import com.incquerylabs.emdw.cpp.codegeneration.fsa.FileManager
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

abstract class FileManagerBaseTest<T extends FileManager> {

	protected extension Logger logger = Logger.getLogger(class)

	private T fileManager

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
		fileManager.deleteDirectory(directoryPath)
		fileManager.createDirectory(directoryPath)
		testAppender = new TestAppender
		Logger.getRootLogger().addAppender(testAppender);
	}
	
	@Test
	public def void fileCreationWithoutCache_test() {
		assertTrue(fileManager.createFile(directoryPath, fileName, fileContent1, false, false))
		assertLastLog(MessageFormat.format(FileManager.messages.FILE_CREATED, directoryPath, fileName))
		assertTrue(fileManager.createFile(directoryPath, fileName, fileContent1, false, false))
		assertLastLog(MessageFormat.format(FileManager.messages.FILE_NOT_CHANGED, directoryPath, fileName))
	}
	
	@Test
	public def void fileCreationWithCache_test() {
		assertTrue(fileManager.createFile(directoryPath, fileName, fileContent1, false, true))
		assertLastLog(MessageFormat.format(FileManager.messages.FILE_CREATED, directoryPath, fileName))
		assertTrue(fileManager.createFile(directoryPath, fileName, fileContent1, false, true))
		assertLastLog(MessageFormat.format(FileManager.messages.FILE_NOT_CHANGED, directoryPath, fileName))
	}
	
	@Test
	public def void fileUpdate_test() {
		assertTrue(fileManager.createFile(directoryPath, fileName, fileContent1, false, false))
		assertLastLog(MessageFormat.format(FileManager.messages.FILE_CREATED, directoryPath, fileName))
		assertTrue(fileManager.createFile(directoryPath, fileName, fileContent2, false, false))
		assertLastLog(MessageFormat.format(FileManager.messages.FILE_UPDATED, directoryPath, fileName))
	}
	
	@Test
	public def void fileDelete_test() {
		assertTrue(fileManager.createFile(directoryPath, fileName, fileContent1, false, true))
		assertLastLog(MessageFormat.format(FileManager.messages.FILE_CREATED, directoryPath, fileName))
		assertTrue(fileManager.deleteFile(directoryPath, fileName))
		assertLastLog(MessageFormat.format(FileManager.messages.FILE_DELETED, directoryPath, fileName))
	}

	@After
	public def void cleanup() {
		fileManager.deleteDirectory(directoryPath)
		fileManager.clearFileCache
	}
	
	private def void assertLastLog(String msg) {
		assertTrue(testAppender.events.last.message.equals(msg))
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
