package com.incquerylabs.emdw.umlintegration.test.mappings

import com.incquerylabs.emdw.umlintegration.test.TransformationTest
import com.incquerylabs.emdw.umlintegration.test.wrappers.TransformationWrapper
import com.incquerylabs.emdw.umlintegration.trace.RootMapping
import com.zeligsoft.xtumlrt.xtuml.XTComponent
import com.zeligsoft.xtumlrt.xtuml.XTPackage
import org.eclipse.uml2.uml.Model
import org.eclipse.uml2.uml.Package
import org.junit.runner.RunWith
import org.junit.runners.Parameterized

import static com.incquerylabs.emdw.umlintegration.test.TransformationTestUtil.*

@RunWith(Parameterized)
class XTPackageInModelMappingTest extends TransformationTest<Package, XTPackage> {
	
	new(TransformationWrapper wrapper, String wrapperType) {
		super(wrapper, wrapperType)
	}

	override protected createUmlObject(Model umlRoot) {
		createPackageInModel(umlRoot)
	}
	
	override protected getXtumlrtObjects(com.zeligsoft.xtumlrt.common.Model xtumlrtRoot) {
		xtumlrtRoot.rootPackages.filter(XTPackage)
	}
	
	override protected checkXtumlrtObject(RootMapping mapping, Package umlObject, XTPackage xtumlrtObject) {
	}
	
}

@RunWith(Parameterized)
class XTPackageInComponentMappingTest extends TransformationTest<Package, XTPackage> {

	new(TransformationWrapper wrapper, String wrapperType) {
		super(wrapper, wrapperType)
	}

	override protected createUmlObject(Model umlRoot) {
		val package = createPackage("package")
		umlRoot.packagedElements += createComponent("component") => [
			packagedElements += package
		]
		package
	}
	
	override protected getXtumlrtObjects(com.zeligsoft.xtumlrt.common.Model xtumlrtRoot) {
		(xtumlrtRoot.topEntities.head as XTComponent).packages.filter(XTPackage)
	}

	override protected checkXtumlrtObject(RootMapping mapping, Package umlObject, XTPackage xtumlrtObject) {
	}
	
}

@RunWith(Parameterized)
class XTPackageInPackageMappingTest extends TransformationTest<Package, XTPackage> {

	new(TransformationWrapper wrapper, String wrapperType) {
		super(wrapper, wrapperType)
	}

	override protected createUmlObject(Model umlRoot) {
		val package = createPackage("package")
		umlRoot.packagedElements += createPackage("parentPackage") => [
			packagedElements += package
		]
		package
	}
	
	override protected getXtumlrtObjects(com.zeligsoft.xtumlrt.common.Model xtumlrtRoot) {
		xtumlrtRoot.rootPackages.head.packages.filter(XTPackage)
	}

	override protected checkXtumlrtObject(RootMapping mapping, Package umlObject, XTPackage xtumlrtObject) {
	}
	
}