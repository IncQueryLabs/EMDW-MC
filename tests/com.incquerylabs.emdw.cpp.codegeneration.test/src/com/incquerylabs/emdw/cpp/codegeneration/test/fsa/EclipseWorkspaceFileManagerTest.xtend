package com.incquerylabs.emdw.cpp.codegeneration.test.fsa

import com.incquerylabs.emdw.cpp.codegeneration.fsa.impl.EclipseWorkspaceFileManager

class EclipseWorkspaceFileManagerTest extends FileManagerBaseTest<EclipseWorkspaceFileManager> {
	new() { super(new EclipseWorkspaceFileManager("TestProject", "/"))}
}