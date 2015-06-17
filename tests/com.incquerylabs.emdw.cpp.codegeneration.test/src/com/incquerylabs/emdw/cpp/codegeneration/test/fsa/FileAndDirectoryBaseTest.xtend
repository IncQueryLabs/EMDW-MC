package com.incquerylabs.emdw.cpp.codegeneration.test.fsa

import com.ericsson.xtumlrt.oopl.cppmodel.CPPDirectory
import com.ericsson.xtumlrt.oopl.cppmodel.CPPModel
import com.google.common.collect.ImmutableList
import com.incquerylabs.emdw.cpp.codegeneration.fsa.IFileManager
import com.incquerylabs.emdw.cpp.codegeneration.fsa.impl.EclipseWorkspaceFileManager
import com.incquerylabs.emdw.cpp.codegeneration.test.TransformationTest
import com.incquerylabs.emdw.cpp.codegeneration.test.wrappers.FileAndDirectoryGenerationWrapper
import com.incquerylabs.emdw.cpp.codegeneration.test.wrappers.TransformationWrapper
import org.eclipse.emf.common.util.URI
import org.eclipse.emf.ecore.EObject
import org.junit.Ignore
import org.junit.Test
import org.junit.runners.Parameterized.Parameters

import static org.junit.Assert.*

abstract class FileAndDirectoryBaseTest<XtumlObject extends EObject, CPPObject extends EObject> extends TransformationTest<XtumlObject, CPPObject> {

	protected extension FileAndDirectoryGenerationWrapper fileAndDirGenWrapper
	new(TransformationWrapper wrapper, String wrapperType) {
		super(wrapper, wrapperType)
		fileAndDirGenWrapper = wrapper as FileAndDirectoryGenerationWrapper
	}
	
	@Parameters(name="{index}: {1}")
	public static def transformations() {
		val alternatives = ImmutableList.builder.add(new FileAndDirectoryGenerationWrapper()).build
		alternatives.map [
			val simpleName = it.class.simpleName
			#[it, simpleName].toArray
		]
	}

	@Test
	def test_1() {
		val testId = "dir_creation_test_1"
		startTest(testId)
		val cppModel = prepareCPPModelWithURI(URI.createURI("model/test1.cppmodel"))
		// transform to CPP
		val fileManager = new EclipseWorkspaceFileManager(cppModel.cppName, "/")
		initializeTransformation(cppModel)
		initializeFileAndDirectoryGenerator(fileManager)
		executeTransformation
		// Check result
		assertDirectorySynch(cppModel.bodyDir, fileManager)
		endTest(testId)
	}

	@Test
	def test_2() {
		val testId = "dir_creation_test_2"
		startTest(testId)
		val cppModel = prepareCPPModelWithURI(URI.createURI("model/test2.cppmodel"))
		// transform to CPP
		val directoryCreator = new EclipseWorkspaceFileManager(cppModel.cppName, "/")
		initializeTransformation(cppModel)
		initializeFileAndDirectoryGenerator(directoryCreator)
		executeTransformation
		// Check result
		assertDirectorySynch(cppModel.bodyDir, directoryCreator)
		endTest(testId)
	}

	@Ignore
	@Test
	override single() {
		assertTrue(true)
	}

	protected def CPPModel prepareCPPModelWithURI(URI modelURI)
	
	protected def CPPModel prepareCPPModel1()
	
	protected def CPPModel prepareCPPModel2()

	protected def assertDirectorySynch(CPPDirectory rootDir, IFileManager fileManager) {
		// Get root directory 
		assertNotNull(rootDir)
		assertNotNull(fileManager)
		
		assertTrue(fileManager.isDirectoryExists(rootDir.path))
		
		checkSubDirectories(rootDir, fileManager)
		
		assertTrue(true)
	}

	protected def void checkSubDirectories(CPPDirectory cppDirectory, IFileManager fileManager) {
		val cppSubDirNames = cppDirectory.subDirectories.map[dir|dir.name]
		val cppSubDirMap = <String, CPPDirectory>newHashMap()
		for (CPPDirectory cppDir : cppDirectory.subDirectories) {
			cppSubDirMap.put(cppDir.name, cppDir)
		}

		for (String subDirectoryName : fileManager.getSubDirectoryNames(cppDirectory.path)) {
			if (!cppSubDirNames.contains(subDirectoryName))
				fail('''
					Directory structure is not synchronized!
					CPPPath: «cppDirectory.path»
					CPP Sub directories: «cppSubDirNames» \n
					Sub directories: «fileManager.getSubDirectoryNames(cppDirectory.path)»
					''')
			else
				checkSubDirectories(cppSubDirMap.get(subDirectoryName), fileManager)
		}

		val subFolders = fileManager.getSubDirectoryNames(cppDirectory.path)
		
		for (CPPDirectory cppDir : cppDirectory.subDirectories) {
			if (!subFolders.contains(cppDir.name))
				fail('''
					Directory structure is not synchronized!
					CPPPath: «cppDirectory.path»
					CPP Sub directories: «cppSubDirNames» \n
					Sub directories: «fileManager.getSubDirectoryNames(cppDirectory.path)»
					''')
			else
				checkSubDirectories(cppDir, fileManager)
		}
		
	}

	override protected prepareCppModel(CPPModel cppModel) {
		throw new UnsupportedOperationException("Not used in directory structure tests!")
	}

	override protected assertResult(CPPModel result, CPPObject cppObject) {
		assertTrue(true)
	}

}