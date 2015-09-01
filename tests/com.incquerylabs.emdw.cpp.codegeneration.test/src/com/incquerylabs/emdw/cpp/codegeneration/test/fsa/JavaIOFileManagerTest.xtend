package com.incquerylabs.emdw.cpp.codegeneration.test.fsa

import com.incquerylabs.emdw.cpp.codegeneration.fsa.impl.JavaIOBasedFileManager
import org.junit.runner.RunWith
import org.junit.runners.Suite
import org.junit.runners.Suite.SuiteClasses

@SuiteClasses(#[
	JavaIOFileManagerTest
])
@RunWith(Suite)
class JavaIOFileManagerTestSuite {}

class JavaIOFileManagerTest extends FileManagerBaseTest<JavaIOBasedFileManager> {
	
	new () {super(new JavaIOBasedFileManager(System.getProperty("java.io.tmpdir")))}
}