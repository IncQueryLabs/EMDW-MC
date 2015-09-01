package com.incquerylabs.emdw.cpp.codegeneration.test.fsa

import com.incquerylabs.emdw.cpp.codegeneration.fsa.impl.EclipseWorkspaceFileManager
import org.junit.runner.RunWith
import org.junit.runners.Suite
import org.junit.runners.Suite.SuiteClasses

@SuiteClasses(#[
	EclipseWorkspaceFileManagerTest
])
@RunWith(Suite)
class EclipseWorkspaceFileManagerTestSuite {}

class EclipseWorkspaceFileManagerTest extends FileManagerBaseTest<EclipseWorkspaceFileManager> {
	new() { super(new EclipseWorkspaceFileManager("TestProject", "/"))}
}