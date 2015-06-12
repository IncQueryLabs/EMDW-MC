package com.incquerylabs.emdw.umlintegration.test.mappings

import com.incquerylabs.emdw.umlintegration.test.TransformationTest
import com.incquerylabs.emdw.umlintegration.test.wrappers.TransformationWrapper
import com.incquerylabs.emdw.umlintegration.trace.RootMapping
import org.eclipse.papyrusrt.xtumlrt.xtuml.XTComponent
import org.eclipse.uml2.uml.Model
import org.eclipse.uml2.uml.Package
import org.junit.runner.RunWith
import org.junit.runners.Parameterized

import static com.incquerylabs.emdw.umlintegration.test.TransformationTestUtil.*

@RunWith(Parameterized)
class XTPackageInModelMappingTest extends TransformationTest<Package, org.eclipse.papyrusrt.xtumlrt.common.Package> {
	
	new(TransformationWrapper wrapper, String wrapperType) {
		super(wrapper, wrapperType)
	}

	override protected createUmlObject(Model umlRoot) {
		createPackageInModel(umlRoot)
	}
	
	override protected getXtumlrtObjects(org.eclipse.papyrusrt.xtumlrt.common.Model xtumlrtRoot) {
		xtumlrtRoot.packages.filter(org.eclipse.papyrusrt.xtumlrt.common.Package)
	}
	
	override protected checkXtumlrtObject(RootMapping mapping, Package umlObject, org.eclipse.papyrusrt.xtumlrt.common.Package xtumlrtObject) {
	}
	
}

@RunWith(Parameterized)
class XTPackageInComponentMappingTest extends TransformationTest<Package, org.eclipse.papyrusrt.xtumlrt.common.Package> {

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
	
	override protected getXtumlrtObjects(org.eclipse.papyrusrt.xtumlrt.common.Model xtumlrtRoot) {
		(xtumlrtRoot.entities.head as XTComponent).packages.filter(org.eclipse.papyrusrt.xtumlrt.common.Package)
	}

	override protected checkXtumlrtObject(RootMapping mapping, Package umlObject, org.eclipse.papyrusrt.xtumlrt.common.Package xtumlrtObject) {
	}
	
}

@RunWith(Parameterized)
class XTPackageInPackageMappingTest extends TransformationTest<Package, org.eclipse.papyrusrt.xtumlrt.common.Package> {

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
	
	override protected getXtumlrtObjects(org.eclipse.papyrusrt.xtumlrt.common.Model xtumlrtRoot) {
		xtumlrtRoot.packages.head.packages.filter(org.eclipse.papyrusrt.xtumlrt.common.Package)
	}

	override protected checkXtumlrtObject(RootMapping mapping, Package umlObject, org.eclipse.papyrusrt.xtumlrt.common.Package xtumlrtObject) {
	}
	
}