
package com.incquerylabs.emdw.cpp.transformation.test.mappings

import com.ericsson.xtumlrt.oopl.cppmodel.CPPBodyFile
import com.ericsson.xtumlrt.oopl.cppmodel.CPPComponent
import com.ericsson.xtumlrt.oopl.cppmodel.CPPDirectory
import com.ericsson.xtumlrt.oopl.cppmodel.CPPHeaderFile
import com.ericsson.xtumlrt.oopl.cppmodel.CPPModel
import com.ericsson.xtumlrt.oopl.cppmodel.CPPPackage
import org.eclipse.papyrusrt.xtumlrt.common.Model
import org.eclipse.papyrusrt.xtumlrt.common.Package
import org.eclipse.papyrusrt.xtumlrt.xtuml.XTComponent
import org.junit.Ignore
import org.junit.runner.RunWith
import org.junit.runners.Suite
import org.junit.runners.Suite.SuiteClasses

import static org.junit.Assert.*

@SuiteClasses(#[
	CPPPackageInComponentTest,
	CPPPackageInPackageTest,
	CPPPackageHierarchyTest,
	CPPPackageInPackageOldTest,
	CPPPackageInModelTest
])
@RunWith(Suite) 
class CPPPackageMappingTestSuite {}

class CPPPackageInComponentTest extends MappingBaseTest<XTComponent, CPPComponent> {
	CPPDirectory rootDir;
	
	override protected prepareXtUmlModel(Model model) {
		val component = model.createXtComponent("Component")
		component.createPackage("Package")
		
		component
	}
		
	override protected prepareCppModel(CPPModel cppModel) {
		rootDir = cppModel.headerDir
		val xtmodel = cppModel.commonModel
		val xtComponent = xtmodel.entities.filter(XTComponent).head
		
		// Component and its directories
		val cppComponent = cppModel.createCPPComponentWithDirectoriesAndFiles(xtComponent, rootDir)
		
		cppComponent
	}
	
	override protected assertResult(Model input, CPPModel result, XTComponent xtComponent, CPPComponent cppComponent) {
		val xtPackages = xtComponent.packages
		val cppPackages = cppComponent.subElements.filter(CPPPackage)
		
		// Assert the package is converted
		assertEquals("xtPackage in xtComponent is not converted.", xtPackages.size, cppPackages.size)
		// Assert the name provider and the xtUML element is set
		cppPackages.forEach[
			assertNotNull("Missing name ooplNameProvider.", ooplNameProvider)
			assertNotNull("CommonPackage is not set.", commonPackage)
		]
		// Assert directories are created
		assertEquals("Package header directory is not created", cppPackages.size, cppComponent.headerDirectory.subDirectories.size)
		assertEquals("Package body directory is not created", cppPackages.size, cppComponent.bodyDirectory.subDirectories.size)
		cppPackages.forEach[ package |
			// Assert package directories are set
			assertNotNull("Package header directory is not set.", package.headerDir)
			assertNotNull("Package body directory is not set.", package.bodyDir)
			// Assert files are created and set
			val packageHeaderFiles = package.headerDir.files.filter(CPPHeaderFile)
			val packageBodyFiles = package.headerDir.files.filter(CPPBodyFile)
			assertEquals("Package files are not created correctly", 1, packageHeaderFiles.size)
			assertEquals("Package files are not created correctly", 1, packageBodyFiles.size)
			assertNotNull("Package header file is not set.", package.headerFile)
			assertNotNull("Package body file is not set.", package.bodyFile)
		]
	}
	
	override protected clearXtUmlElement(XTComponent xtObject) {
		xtObject.packages.clear
	}
	
	override protected assertClear(Model input, CPPModel result, XTComponent xtComponent, CPPComponent cppComponent) {
		val cppPackages = cppComponent.subElements.filter(CPPPackage)
		assertEquals("CPP package is not removed.",0,cppPackages.size)
		assertEquals("Package header directory is not removed.",0, cppComponent.headerDirectory.subDirectories.size)
		assertEquals("Package body directory is not removed.",0, cppComponent.bodyDirectory.subDirectories.size)
	}
	
}


class CPPPackageInPackageTest extends MappingBaseTest<XTComponent, CPPComponent> {
	CPPDirectory rootDir;
	
	override protected prepareXtUmlModel(Model model) {
		val component = model.createXtComponent("Component")
		val rootPackage = component.createPackage("Root package")
		rootPackage.createPackage("Package")
		
		component
	}
		
	override protected prepareCppModel(CPPModel cppModel) {
		rootDir = cppModel.headerDir
		val xtmodel = cppModel.commonModel
		val xtComponent = xtmodel.entities.filter(XTComponent).head
		val xtParentPackage = xtComponent.packages.head
		
		// Component and its directories
		val cppComponent = cppModel.createCPPComponentWithDirectoriesAndFiles(xtComponent, rootDir)

		// Parent package and its directories
		cppComponent.createCPPPackageWithDirectoriesAndFiles(xtParentPackage, cppComponent.headerDirectory)
		
		cppComponent
	}
	
	override protected assertResult(Model input, CPPModel result, XTComponent xtComponent, CPPComponent cppComponent) {
		val xtParentPackage = xtComponent.packages.head 
		val cppParentPackage = cppComponent.subElements.filter(CPPPackage).head
		
		val xtPackages = xtParentPackage.packages
		val cppPackages = cppParentPackage.subElements.filter(CPPPackage)
		
		// Assert the package is converted
		assertEquals("xtPackage in other xtPackage is not converted.", xtPackages.size, cppPackages.size)
		// Assert the name provider and the xtUML element is set
		cppPackages.forEach[
			assertNotNull("Missing name ooplNameProvider.", ooplNameProvider)
			assertNotNull("CommonPackage is not set.", commonPackage)
		]
		// Assert directories are created
		assertEquals("Package header directory is not created", cppPackages.size, cppParentPackage.headerDir.subDirectories.size)
		assertEquals("Package body directory is not created", cppPackages.size, cppParentPackage.bodyDir.subDirectories.size)
		cppPackages.forEach[ package |
			// Assert package directories are set
			assertNotNull("Package header directory is not set.", package.headerDir)
			assertNotNull("Package body directory is not set.", package.bodyDir)
			// Assert files are created and set
			val packageHeaderFiles = package.headerDir.files.filter(CPPHeaderFile)
			val packageBodyFiles = package.headerDir.files.filter(CPPBodyFile)
			assertEquals("Package files are not created correctly", 1, packageHeaderFiles.size)
			assertEquals("Package files are not created correctly", 1, packageBodyFiles.size)
			assertNotNull("Package header file is not set.", package.headerFile)
			assertNotNull("Package body file is not set.", package.bodyFile)
		]
	}
	
	override protected clearXtUmlElement(XTComponent xtObject) {
		xtObject.packages.clear
	}
	
	override protected assertClear(Model input, CPPModel result, XTComponent xtComponent, CPPComponent cppComponent) {
		val cppPackages = cppComponent.subElements.filter(CPPPackage)
		assertEquals("CPP package is not removed.",0,cppPackages.size)
		assertEquals("Package header directory is not removed.",0, cppComponent.headerDirectory.subDirectories.size)
		assertEquals("Package body directory is not removed.",0, cppComponent.bodyDirectory.subDirectories.size)
	}
	
}

class CPPPackageHierarchyTest extends MappingBaseTest<XTComponent, CPPComponent> {
	CPPDirectory rootDir;
	
	override protected prepareXtUmlModel(Model model) {
		val component = model.createXtComponent("Component")
		val rootPackage = component.createPackage("Root package")
		val lvl1Package = rootPackage.createPackage("lvl1Package") 
		val lvl2Package = lvl1Package.createPackage("lvl2Package1") 
		lvl1Package.createPackage("lvl2Package2")
		val lvl3Package = lvl2Package.createPackage("lvl3Package") 
		lvl3Package.createPackage("lvl4Package") 
		
		
		component
	}
		
	override protected prepareCppModel(CPPModel cppModel) {
		rootDir = cppModel.headerDir
		val xtmodel = cppModel.commonModel
		val xtComponent = xtmodel.entities.filter(XTComponent).head
		val xtRootPackage = xtComponent.packages.head
		
		// Component and its directories
		val cppComponent = cppModel.createCPPComponentWithDirectoriesAndFiles(xtComponent, rootDir)

		// Root package and its directories
		cppComponent.createCPPPackageWithDirectoriesAndFiles(xtRootPackage, cppComponent.headerDirectory)
		
		cppComponent
	}
	
	override protected assertResult(Model input, CPPModel result, XTComponent xtComponent, CPPComponent cppComponent) {
		val xtRootPackage = xtComponent.packages.head 
		val cppRootPackage = cppComponent.subElements.filter(CPPPackage).head
		
		assertPackagesRecursively(xtRootPackage, cppRootPackage)
	}
	
	
	protected def void assertPackagesRecursively(Package xtParentPackage, CPPPackage cppParentPackage) {
		assertPackages(xtParentPackage, cppParentPackage)
		
		val cppPackages = cppParentPackage.subElements.filter(CPPPackage)
		cppPackages.forEach[ cppParentPack |
			val xtParentPack = cppParentPack.commonPackage
			assertPackagesRecursively(xtParentPack, cppParentPack)
		]
	}
	
	protected def assertPackages(Package xtParentPackage, CPPPackage cppParentPackage) {
		val xtPackages = xtParentPackage.packages
		val cppPackages = cppParentPackage.subElements.filter(CPPPackage)
		
		// Assert the package is converted
		assertEquals("xtPackage in other xtPackage is not converted.", xtPackages.size, cppPackages.size)
		// Assert the name provider and the xtUML element is set
		cppPackages.forEach[
			assertNotNull("Missing name ooplNameProvider.", ooplNameProvider)
			assertNotNull("CommonPackage is not set.", commonPackage)
		]
		// Assert directories are created
		assertEquals("Package header directory is not created", cppPackages.size, cppParentPackage.headerDir.subDirectories.size)
		assertEquals("Package body directory is not created", cppPackages.size, cppParentPackage.bodyDir.subDirectories.size)
		cppPackages.forEach[ package |
			// Assert package directories are set
			assertNotNull("Package header directory is not set.", package.headerDir)
			assertNotNull("Package body directory is not set.", package.bodyDir)
			// Assert files are created and set
			val packageHeaderFiles = package.headerDir.files.filter(CPPHeaderFile)
			val packageBodyFiles = package.headerDir.files.filter(CPPBodyFile)
			assertEquals("Package files are not created correctly", 1, packageHeaderFiles.size)
			assertEquals("Package files are not created correctly", 1, packageBodyFiles.size)
			assertNotNull("Package header file is not set.", package.headerFile)
			assertNotNull("Package body file is not set.", package.bodyFile)
		]
	}
	
	override protected clearXtUmlElement(XTComponent xtObject) {
		xtObject.packages.clear
	}
	
	override protected assertClear(Model input, CPPModel result, XTComponent xtComponent, CPPComponent cppComponent) {
		val cppPackages = cppComponent.subElements.filter(CPPPackage)
		assertEquals("CPP package is not removed.",0,cppPackages.size)
		assertEquals("Package header directory is not removed.",0, cppComponent.headerDirectory.subDirectories.size)
		assertEquals("Package body directory is not removed.",0, cppComponent.bodyDirectory.subDirectories.size)
	}
	
}

@Ignore("packages not yet in scope")
class CPPPackageInPackageOldTest extends MappingBaseTest<Package, CPPPackage> {
	CPPDirectory rootDir;
	
	override protected prepareXtUmlModel(Model model) {
		val pack = model.createPackage("RootPackage")
		pack.createPackage("component")
		
		pack
	}
		
	override protected prepareCppModel(CPPModel cppModel) {
		rootDir = cppModel.headerDir
		val xtmodel = cppModel.commonModel
		val xtPackage = xtmodel.packages.head as Package
		val cppPackage = createCPPPackage(cppModel, xtPackage)
		
		cppPackage
	}
	
	override protected assertResult(Model input, CPPModel result, Package xtObject, CPPPackage cppObject) {
		val xtPackages = xtObject.packages
		val cppPackages = cppObject.subElements.filter(CPPPackage)
		assertEquals(xtPackages.size,cppPackages.size)
		cppPackages.forEach[
			assertNotNull(ooplNameProvider)
			assertNotNull(commonPackage)
		]
	}
	
	override protected clearXtUmlElement(Package xtObject) {
		xtObject.packages.clear
	}
	
	override protected assertClear(Model input, CPPModel result, Package xtObject, CPPPackage cppObject) {
		val cppPackages = cppObject.subElements.filter(CPPPackage)
		assertEquals(0,cppPackages.size)
	}
	
}

@Ignore("packages not yet in scope")
class CPPPackageInModelTest extends MappingBaseTest<Model, CPPModel> {
	CPPDirectory rootDir;
	
	override protected prepareXtUmlModel(Model model) {
		model.createPackage("component")
		
		model
	}
		
	override protected prepareCppModel(CPPModel cppModel) {
		rootDir = cppModel.headerDir
		cppModel
	}
	
	override protected assertResult(Model input, CPPModel result, Model xtObject, CPPModel cppObject) {
		val xtPackages = xtObject.packages
		val cppPackages = cppObject.subElements.filter(CPPPackage)
		assertEquals(xtPackages.size,cppPackages.size)
		cppPackages.forEach[
			assertNotNull(ooplNameProvider)
			assertNotNull(commonPackage)
		]
	}
	
	override protected clearXtUmlElement(Model xtObject) {
		xtObject.packages.clear
	}
	
	override protected assertClear(Model input, CPPModel result, Model xtObject, CPPModel cppObject) {
		val cppPackages = cppObject.subElements.filter(CPPPackage)
		assertEquals(0,cppPackages.size)
	}
	
}
