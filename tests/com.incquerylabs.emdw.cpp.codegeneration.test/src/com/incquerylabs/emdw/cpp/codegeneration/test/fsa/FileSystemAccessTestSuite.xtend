package com.incquerylabs.emdw.cpp.codegeneration.test.fsa

import org.junit.runner.RunWith
import org.junit.runners.Suite
import org.junit.runners.Suite.SuiteClasses

@SuiteClasses(#[
	DirectoryStructureTestSuite,
	EclipseWorkspaceFileManagerTestSuite,
	JavaIOFileManagerTestSuite
])
@RunWith(Suite)
class FileSystemAccessTestSuite {}