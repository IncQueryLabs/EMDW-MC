package com.incquerylabs.emdw.cpp.codegeneration.test.fsa

import com.ericsson.xtumlrt.oopl.cppmodel.CPPDirectory
import com.ericsson.xtumlrt.oopl.cppmodel.CPPModel
import com.ericsson.xtumlrt.oopl.cppmodel.CPPSourceFile
import com.incquerylabs.emdw.cpp.codegeneration.fsa.IFileManager
import com.incquerylabs.emdw.cpp.codegeneration.fsa.impl.EclipseWorkspaceFileManager
import com.incquerylabs.emdw.cpp.codegeneration.test.TransformationTest
import org.eclipse.emf.common.util.URI
import org.eclipse.emf.ecore.EObject
import org.junit.Test

import static com.incquerylabs.emdw.testing.common.utils.XtumlUtil.*
import static org.junit.Assert.*

import static extension com.incquerylabs.emdw.testing.common.utils.CppUtil.*

abstract class FileAndDirectoryBaseTest<XtumlObject extends EObject, CPPObject extends EObject> extends TransformationTest<XtumlObject, CPPObject> {

	@Test
	override test_1() {
		val testId = "fsa_test"
		startTest(testId)
		val xtModel = createEmptyXtumlModel(this.class.simpleName+"_"+testId)
		//init cpp model
		val cppResource = createCPPResource(xtModel)
		val cppModel = cppResource.createCPPModel(xtModel)
		val preparedCPPModel = prepareCPPModel1(cppModel)
		// transform to CPP
		val fileManager = new EclipseWorkspaceFileManager(cppModel.cppName, "/")
		initializeGeneration(preparedCPPModel, fileManager)
		executeAllGeneration
		// Check result
		assertFileSystemSynch(cppModel.headerDir, fileManager)
		assertFileSystemSynch(cppModel.bodyDir, fileManager)
		endTest(testId)
	}

	@Test
	def test_2() {
		val testId = "fsa_test"
		startTest(testId)
		val xtModel = createEmptyXtumlModel(this.class.simpleName+"_"+testId)
		//init cpp model
		val cppResource = createCPPResource(xtModel)
		val cppModel = cppResource.createCPPModel(xtModel)
		val preparedCPPModel = prepareCPPModel2(cppModel)
		// transform to CPP
		val fileManager = new EclipseWorkspaceFileManager(cppModel.cppName, "/")
		initializeGeneration(preparedCPPModel, fileManager)
		executeAllGeneration
		// Check result
		assertFileSystemSynch(cppModel.bodyDir, fileManager)
		assertFileSystemSynch(cppModel.headerDir, fileManager)
		endTest(testId)
	}

	protected def CPPModel prepareCPPModelWithURI(URI modelURI)
	
	protected def CPPModel prepareCPPModel1(CPPModel cppModel)
	
	protected def CPPModel prepareCPPModel2(CPPModel cppModel)

	protected def assertFileSystemSynch(CPPDirectory cppDir, IFileManager fileManager) {
		
		assertNotNull(cppDir)
		
		assertNotNull(fileManager)
		
		assertTrue(fileManager.isDirectoryExists(cppDir.path))
		
		checkSubDirectories(cppDir, fileManager)
		
	}
		
	protected def void checkSubDirectories(CPPDirectory cppDirectory, IFileManager fileManager) {
		val cppSubDirsMap = <String, CPPDirectory>newHashMap()
		for (CPPDirectory cppDir : cppDirectory.subDirectories) {
			cppSubDirsMap.put(cppDir.name, cppDir)
		}

		for (String subDirectoryName : fileManager.getSubDirectoryNames(cppDirectory.path)) {
			if (!cppSubDirsMap.keySet.contains(subDirectoryName))
				fail('''
					Directory structure is not synchronized!
					CPPPath: «cppDirectory.path»
					CPP Sub directories: «cppSubDirsMap.keySet» \n
					Sub directories: «fileManager.getSubDirectoryNames(cppDirectory.path)»
					''')
			else
				checkSubDirectories(cppSubDirsMap.get(subDirectoryName), fileManager)
		}
		
		val subFolders = fileManager.getSubDirectoryNames(cppDirectory.path)
		
		for (CPPDirectory cppDir : cppDirectory.subDirectories) {
			if (!subFolders.contains(cppDir.name))
				fail('''
					Directory structure is not synchronized!
					CPPPath: «cppDirectory.path»
					CPP Sub directories: «cppSubDirsMap.keySet» \n
					Sub directories: «fileManager.getSubDirectoryNames(cppDirectory.path)»
					''')
			else
				checkSubDirectories(cppDir, fileManager)
		}
		
		checkContainedFiles(cppDirectory, fileManager)
		
	}
	
	protected def void checkContainedFiles(CPPDirectory cppDirectory, IFileManager fileManager) {
		val sourceFilesMap = <String, CPPSourceFile>newHashMap()
		for(CPPSourceFile file : cppDirectory.files)
			sourceFilesMap.put(file.generationName, file)
		
		for(String filename : fileManager.getContainedFileNames(cppDirectory.path)) {
			if(!sourceFilesMap.keySet.contains(filename))
				fail('''
					File in filesystem is invalid!
					CPPSourceFile: «cppDirectory.path»/«filename»
					''')
		}
		
		val containedFileNames = fileManager.getContainedFileNames(cppDirectory.path)
		
		for(CPPSourceFile file : cppDirectory.files) {
			if(!containedFileNames.contains(file.generationName))
				fail('''
					File is missing from filesystem!
					CPPSourceFile: «cppDirectory.path»/«file.generationName»
					''')
		}
		
		for(String filename : sourceFilesMap.keySet)
			if(!fileManager.checkFileContent(cppDirectory.path, filename,  
				generatedCPPSourceFileContents.get(sourceFilesMap.get(filename))))
				fail('''
					File content is not synchronized!
					CPPSourceFile: «cppDirectory.path»/«filename»
					''')
	}

	override protected prepareCppModel(CPPModel cppModel) {
		throw new UnsupportedOperationException("Not used in directory structure tests!")
	}

	override protected assertResult(CPPModel result, CPPObject cppObject) {
		assertTrue(true)
	}

}