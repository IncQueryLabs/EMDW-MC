package com.incquerylabs.emdw.cpp.codegeneration.test.directory

import com.ericsson.xtumlrt.oopl.cppmodel.CPPDirectory
import com.ericsson.xtumlrt.oopl.cppmodel.CPPModel
import com.google.common.collect.ImmutableList
import com.incquerylabs.emdw.cpp.codegeneration.test.TransformationTest
import com.incquerylabs.emdw.cpp.codegeneration.test.wrappers.DirectoryStructureWrapper
import com.incquerylabs.emdw.cpp.codegeneration.test.wrappers.TransformationWrapper
import java.util.HashMap
import org.eclipse.core.resources.IFolder
import org.eclipse.core.resources.IProject
import org.eclipse.core.resources.IResource
import org.eclipse.core.resources.ResourcesPlugin
import org.eclipse.emf.ecore.EObject
import org.junit.Before
import org.junit.Ignore
import org.junit.Test
import org.junit.runners.Parameterized.Parameters

import static com.incquerylabs.emdw.cpp.codegeneration.test.TransformationTestUtil.*
import static org.junit.Assert.*

abstract class DirectoryStructureBaseTest<XtumlObject extends EObject, CPPObject extends EObject> extends TransformationTest<XtumlObject, CPPObject> {

	new(TransformationWrapper wrapper, String wrapperType) {
		super(wrapper, wrapperType)
	}

	@Parameters(name="{index}: {1}")
	public static def transformations() {
		val alternatives = ImmutableList.builder.add(new DirectoryStructureWrapper(rootProject)).build
		alternatives.map [
			val simpleName = it.class.simpleName
			#[it, simpleName].toArray
		]
	}

	val static IProject rootProject = ResourcesPlugin.workspace.root.getProject("DirectorySyncTest")
	val rootDirName = "rootdirectory"
	
	@Before
	def void initialize() {
		if (!rootProject.exists) {
			rootProject.create(null)
		}
		rootProject.open(null)
	}

	@Test
	def dir_creation_test_1() {
		val testId = "dir_creation_test_1"
		startTest(testId)
		// Create xtuml model
		val xtModel = createEmptyXtumlModel(this.class.simpleName + "_" + testId)
		// init cpp model
		val cppResource = createCPPResource(xtModel)
		val cppModelEmpty = createCPPModel(cppResource, xtModel)
		val cppObjectMap = prepareFirstCPPModel(cppModelEmpty, rootDirName)
		val cppModel = cppObjectMap.keySet.get(0)
		// transform to CPP
		initializeTransformation(cppModel)
		executeTransformation
		// Check result
		assertDirectoryResult(cppObjectMap.get(cppModel))
		endTest(testId)
	}

	@Test
	def dir_creation_test_2() {
		val testId = "dir_creation_test_2"
		startTest(testId)
		// Create xtuml model
		val xtModel = createEmptyXtumlModel(this.class.simpleName + "_" + testId)
		val cppResource = createCPPResource(xtModel)
		val cppModelEmpty = createCPPModel(cppResource, xtModel)
		val cppObjectMap = prepareSecondCPPModel(cppModelEmpty, rootDirName)
		val cppModel = cppObjectMap.keySet.get(0)
		// transform to CPP
		initializeTransformation(cppModel)
		executeTransformation
		// Check result
		assertDirectoryResult(cppObjectMap.get(cppModel))
		endTest(testId)
	}

	@Ignore
	@Test
	override single() {
		assertTrue(true)
	}

	protected def HashMap<CPPModel, CPPDirectory> prepareFirstCPPModel(CPPModel cppModel, String rootDirName)

	protected def HashMap<CPPModel, CPPDirectory> prepareSecondCPPModel(CPPModel cppModel, String rootDirName)

	protected def assertDirectoryResult(CPPDirectory rootDir) {
		// Get root directory 
		assertNotNull(rootDir)

		val rootFolder = rootProject.getFolder(rootDirName)
		if (!rootFolder.exists)
			fail("Root folder does not exits!")

		checkSubFolder(rootDir, rootFolder)
	}

	protected def checkSubFolder(CPPDirectory cppDir, IFolder folder) {
		val cppSubDirNames = cppDir.subDirectories.map[dir|dir.name]
		val cppSubDirMap = <String, CPPDirectory>newHashMap()
		for (CPPDirectory cD : cppDir.subDirectories) {
			cppSubDirMap.put(cD.name, cD)
		}

		val matches = <CPPDirectory, IFolder>newHashMap()

		for (IResource childFolder : folder.members) {
			if (childFolder instanceof IFolder) {
				if (!cppSubDirNames.contains(childFolder.name))
					fail("Directory structure is not synchronized!")
				else
					matches.put(cppSubDirMap.get(childFolder.name), childFolder)
			}
		}

		val subFolders = folder.members.filter[f | f instanceof IFolder].map[f|f.name].toList
		val subFoldMap = <String, IFolder>newHashMap()
		for(IResource f : folder.members) {
			if(f instanceof IFolder)
				subFoldMap.put(f.name, f)
		}
		
		for (CPPDirectory cD : cppDir.subDirectories) {
			if (!subFolders.contains(cD.name))
				fail("Directory structure is not synchronized!")
			else
				matches.put(cD, subFoldMap.get(cD.name))
		}
		
		debug('''Folder Matches: «matches.toString»''')
		
		for(CPPDirectory cD : matches.keySet) {
			checkSubFolder(cD, matches.get(cD))
		}
	}

	override protected prepareCppModel(CPPModel cppModel) {
		throw new UnsupportedOperationException("Not used in directory structure tests!")
	}

	override protected assertResult(CPPModel result, CPPObject cppObject) {
		assertTrue(true)
	}

}