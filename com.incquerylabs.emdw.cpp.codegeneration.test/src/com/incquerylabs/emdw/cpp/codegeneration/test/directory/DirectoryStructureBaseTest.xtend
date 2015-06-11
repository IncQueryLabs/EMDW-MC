package com.incquerylabs.emdw.cpp.codegeneration.test.directory

import com.ericsson.xtumlrt.oopl.cppmodel.CPPDirectory
import com.ericsson.xtumlrt.oopl.cppmodel.CPPModel
import com.google.common.collect.ImmutableList
import com.incquerylabs.emdw.cpp.codegeneration.directory.IDirectoryCreator
import com.incquerylabs.emdw.cpp.codegeneration.directory.impl.EclipseWorkspaceDirectoryCreator
import com.incquerylabs.emdw.cpp.codegeneration.test.TransformationTest
import com.incquerylabs.emdw.cpp.codegeneration.test.wrappers.DirectoryStructureWrapper
import com.incquerylabs.emdw.cpp.codegeneration.test.wrappers.TransformationWrapper
import org.eclipse.emf.common.util.URI
import org.eclipse.emf.ecore.EObject
import org.junit.Before
import org.junit.Ignore
import org.junit.Test
import org.junit.runners.Parameterized.Parameters

import static org.junit.Assert.*

abstract class DirectoryStructureBaseTest<XtumlObject extends EObject, CPPObject extends EObject> extends TransformationTest<XtumlObject, CPPObject> {

	protected extension DirectoryStructureWrapper directoryStructureWrapper
	new(TransformationWrapper wrapper, String wrapperType) {
		super(wrapper, wrapperType)
		directoryStructureWrapper = wrapper as DirectoryStructureWrapper
	}
	
	@Parameters(name="{index}: {1}")
	public static def transformations() {
		val alternatives = ImmutableList.builder.add(new DirectoryStructureWrapper()).build
		alternatives.map [
			val simpleName = it.class.simpleName
			#[it, simpleName].toArray
		]
	}

	@Before
	def void initialize() {

	}

	@Test
	def dir_creation_test_1() {
		val testId = "dir_creation_test_1"
		startTest(testId)
		val cppModel = prepareCPPModelWithURI(URI.createURI("model/test1.cppmodel"))
		// transform to CPP
		val directoryCreator = new EclipseWorkspaceDirectoryCreator(cppModel.cppName, "/")
		initializeTransformation(cppModel)
		initializeDirectoryStructureGenerator(directoryCreator)
		executeTransformation
		// Check result
		assertDirectorySynch(cppModel.bodyDir, directoryCreator)
		endTest(testId)
	}

	@Test
	def dir_creation_test_2() {
		val testId = "dir_creation_test_2"
		startTest(testId)
		val cppModel = prepareCPPModelWithURI(URI.createURI("model/test2.cppmodel"))
		// transform to CPP
		val directoryCreator = new EclipseWorkspaceDirectoryCreator(cppModel.cppName, "/")
		initializeTransformation(cppModel)
		initializeDirectoryStructureGenerator(directoryCreator)
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

	protected def assertDirectorySynch(CPPDirectory rootDir, IDirectoryCreator directoryCreator) {
		// Get root directory 
		assertNotNull(rootDir)
		assertNotNull(directoryCreator)
		
		assertTrue(directoryCreator.isDirectoryExists(rootDir.path))
		
		checkSubDirectories(rootDir, directoryCreator)
		
		assertTrue(true)
	}

	protected def void checkSubDirectories(CPPDirectory cppDirectory, IDirectoryCreator directoryCreator) {
		val cppSubDirNames = cppDirectory.subDirectories.map[dir|dir.name]
		val cppSubDirMap = <String, CPPDirectory>newHashMap()
		for (CPPDirectory cppDir : cppDirectory.subDirectories) {
			cppSubDirMap.put(cppDir.name, cppDir)
		}

		for (String subDirectoryName : directoryCreator.getSubDirectoryNames(cppDirectory.path)) {
			if (!cppSubDirNames.contains(subDirectoryName))
				fail('''
					Directory structure is not synchronized!
					CPPPath: «cppDirectory.path»
					CPP Sub directories: «cppSubDirNames» \n
					Sub directories: «directoryCreator.getSubDirectoryNames(cppDirectory.path)»
					''')
			else
				checkSubDirectories(cppSubDirMap.get(subDirectoryName), directoryCreator)
		}

		val subFolders = directoryCreator.getSubDirectoryNames(cppDirectory.path)
		
		for (CPPDirectory cppDir : cppDirectory.subDirectories) {
			if (!subFolders.contains(cppDir.name))
				fail('''
					Directory structure is not synchronized!
					CPPPath: «cppDirectory.path»
					CPP Sub directories: «cppSubDirNames» \n
					Sub directories: «directoryCreator.getSubDirectoryNames(cppDirectory.path)»
					''')
			else
				checkSubDirectories(cppDir, directoryCreator)
		}
		
	}

	override protected prepareCppModel(CPPModel cppModel) {
		throw new UnsupportedOperationException("Not used in directory structure tests!")
	}

	override protected assertResult(CPPModel result, CPPObject cppObject) {
		assertTrue(true)
	}

}