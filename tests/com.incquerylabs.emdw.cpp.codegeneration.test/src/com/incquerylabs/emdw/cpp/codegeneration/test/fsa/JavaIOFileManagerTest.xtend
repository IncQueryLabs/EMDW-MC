package com.incquerylabs.emdw.cpp.codegeneration.test.fsa

import com.incquerylabs.emdw.cpp.codegeneration.test.fsa.FileManagerBaseTest
import com.incquerylabs.emdw.cpp.codegeneration.fsa.impl.JavaIOBasedFileManager

class JavaIOFileManagerTest extends FileManagerBaseTest<JavaIOBasedFileManager> {
	
	new () {super(new JavaIOBasedFileManager(System.getProperty("java.io.tmpdir")))}
}