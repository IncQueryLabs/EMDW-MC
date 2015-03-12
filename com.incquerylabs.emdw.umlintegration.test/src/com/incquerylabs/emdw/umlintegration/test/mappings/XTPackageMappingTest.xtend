package com.incquerylabs.emdw.umlintegration.test.mappings

import com.incquerylabs.emdw.umlintegration.test.TransformationTest
import com.incquerylabs.emdw.umlintegration.test.wrappers.TransformationWrapper
import com.incquerylabs.emdw.umlintegration.trace.RootMapping
import com.zeligsoft.xtumlrt.xtuml.XTPackage
import org.junit.runner.RunWith
import org.junit.runners.Parameterized
import org.eclipse.uml2.uml.Package

import static extension com.incquerylabs.emdw.umlintegration.test.TransformationTestUtil.*
import com.zeligsoft.xtumlrt.xtuml.XTComponent

@RunWith(Parameterized)
class XTPackageInModelMappingTest extends TransformationTest<Package, XTPackage> {
	
	new(TransformationWrapper wrapper, String wrapperType) {
		super(wrapper, wrapperType)
	}

	override protected createUmlObject(RootMapping mapping) {
		val package = createPackage("package")
		mapping.umlRoot.packagedElements += package
		package
	}
	
	override protected getXtumlrtObjects(RootMapping mapping) {
		mapping.xtumlrtRoot.rootPackages.filter(XTPackage)
	}
	
	override protected checkState(RootMapping mapping, Package umlObject, XTPackage xtumlrtObject) {
	}
	
}

@RunWith(Parameterized)
class XTPackageInComponentMappingTest extends TransformationTest<Package, XTPackage> {

	new(TransformationWrapper wrapper, String wrapperType) {
		super(wrapper, wrapperType)
	}

	override protected createUmlObject(RootMapping mapping) {
		val package = createPackage("package")
		createComponent(mapping.umlRoot, "component") => [
			packagedElements += package
		]
		package
	}
	
	override protected getXtumlrtObjects(RootMapping mapping) {
		(mapping.xtumlrtRoot.topEntities.head as XTComponent).packages.filter(XTPackage)
	}

	override protected checkState(RootMapping mapping, Package umlObject, XTPackage xtumlrtObject) {
	}
	
}
