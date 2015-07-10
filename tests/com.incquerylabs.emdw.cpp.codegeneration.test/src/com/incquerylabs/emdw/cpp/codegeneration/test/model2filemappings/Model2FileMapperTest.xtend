package com.incquerylabs.emdw.cpp.codegeneration.test.model2filemappings

import com.ericsson.xtumlrt.oopl.cppmodel.CPPDirectory
import com.ericsson.xtumlrt.oopl.cppmodel.CPPPackage
import com.ericsson.xtumlrt.oopl.cppmodel.CPPSourceFile
import com.google.common.collect.ImmutableList
import com.incquerylabs.emdw.cpp.codegeneration.Model2FileMapper
import com.incquerylabs.emdw.cpp.codegeneration.fsa.IFileManager
import com.incquerylabs.emdw.cpp.codegeneration.fsa.impl.EclipseWorkspaceFileManager
import com.incquerylabs.emdw.cpp.codegeneration.test.TestWithoutParameters
import com.incquerylabs.emdw.cpp.codegeneration.test.wrappers.CPPCodeGenerationWrapper
import com.incquerylabs.emdw.cpp.codegeneration.test.wrappers.TransformationWrapper
import java.io.ByteArrayInputStream
import java.util.Map
import org.eclipse.core.resources.IFolder
import org.eclipse.core.resources.IResource
import org.eclipse.core.resources.ResourcesPlugin
import org.eclipse.core.runtime.IProgressMonitor
import org.eclipse.core.runtime.NullProgressMonitor
import org.junit.AfterClass
import org.junit.BeforeClass
import org.junit.Test
import org.junit.runner.RunWith
import org.junit.runners.Parameterized
import org.junit.runners.Parameterized.Parameters

import static com.incquerylabs.emdw.cpp.codegeneration.test.TransformationTestUtil.*
import static org.junit.Assert.*

@RunWith(Parameterized)
class Model2FileMapperTest extends TestWithoutParameters{
	private static final String PROJECT_NAME = "project.test"
	private static final String FOLDER_NAME = "testfolder"
	
	private static final String FULLCLASS_NAME = "FullClass"
	private static final String JUSTHEADERCLASS_NAME = "JustHeaderClass"
	private static final String JUSTBODYCLASS_NAME = "JustBodyClass"
	
	private static final String FILE_EXTENSION_CC = ".cc"
	private static final String FILE_EXTENSION_HH = ".hh"
	
	private static IFolder targetFolder = null
	
	
	
	new(TransformationWrapper wrapper, String wrapperType) {
		super(wrapper, wrapperType)
	}
	
	@BeforeClass
	public static def void initWorkspace() {
		// Referring a project in the workspace by it's name
        val workspace = ResourcesPlugin.getWorkspace()
        var project = workspace.getRoot().getProject(PROJECT_NAME)

        // If the project is not exist it will be created.
        val monitor = new NullProgressMonitor()
        if (!project.exists) {
            project.create(monitor)
        }

        // The project should be opened.
        project.open(IResource.BACKGROUND_REFRESH, monitor)
		
		val folder = project.getFolder(FOLDER_NAME)
		// If the folder doesn't exists create it.
		if (!folder.exists()) {
			folder.create(true, true, monitor)
		}
		
		createFile(folder, FULLCLASS_NAME+FILE_EXTENSION_HH, monitor)
		createFile(folder, FULLCLASS_NAME+FILE_EXTENSION_CC, monitor)
		createFile(folder, JUSTBODYCLASS_NAME+FILE_EXTENSION_HH, monitor)
		createFile(folder, JUSTBODYCLASS_NAME+FILE_EXTENSION_CC, monitor)
		createFile(folder, JUSTHEADERCLASS_NAME+FILE_EXTENSION_HH, monitor)
		createFile(folder, JUSTHEADERCLASS_NAME+FILE_EXTENSION_CC, monitor)
		
		targetFolder = folder
	}
	
	@Parameters(name = "{index}: {1}")
	public static def transformations() {
		val alternatives = ImmutableList.builder
				.add(new CPPCodeGenerationWrapper())
				.build
				
		alternatives.map[
			val simpleName = it.class.simpleName
			#[it, simpleName].toArray
		]
	}
	
	@Test
	def void single() {
		val testId = "single"
		startTest(testId)
		
		// Create base model
		val cppRuntime = createEmptyCppModel(this.class.simpleName+"_"+testId)
		// Init cpp model
		val cppDir = prepareCppModel(cppRuntime)
		
		val IFileManager fileManager = new EclipseWorkspaceFileManager(targetFolder.project.name, "/")
		val mapper = new Model2FileMapper(fileManager, cppDir, targetFolder.name)
		mapper.execute
		
		assertResult(cppDir, mapper.mappedSourceFiles)
	}
	
	@AfterClass
	public static def void clearWorkspace() {
		val workspace = ResourcesPlugin.getWorkspace()
        var project = workspace.getRoot().getProject(PROJECT_NAME)
		
		// If the project is not exist it will be created.
        val monitor = new NullProgressMonitor()
        if (project.exists) {
            project.delete(true, true, monitor)
        }
	}
	
	
	
	
	private static def createFile(IFolder folder, String filename, IProgressMonitor monitor) {
		val file = folder.getFile(filename)
		if(!file.exists) {
			file.create(new ByteArrayInputStream(filename.bytes), true, monitor)
		}
		return file
	}
	
	def prepareCppModel(CPPPackage cppPackage) {
		val headerFull = createCPPHeaderFile(cppPackage.headerDir)
		val bodyFull = createCPPBodyFile(cppPackage.bodyDir)
		createCPPClass(cppPackage, FULLCLASS_NAME, headerFull, bodyFull)
		
		val headerJust = createCPPHeaderFile(cppPackage.headerDir)
		createCPPClass(cppPackage, JUSTHEADERCLASS_NAME, headerJust, null)
		
		val bodyJust = createCPPBodyFile(cppPackage.bodyDir)
		createCPPClass(cppPackage, JUSTBODYCLASS_NAME, null, bodyJust)
		
		cppPackage.bodyDir
	}
	
	def assertResult(CPPDirectory cppDir, Map<CPPSourceFile, CharSequence> mappedSourceFiles) {
		for(file : cppDir.files) {
			val content = mappedSourceFiles.get(file)
			assertNotNull(content)
			assertTrue(content==file.generationName)
		}
	}
}