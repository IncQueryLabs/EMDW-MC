package com.incquerylabs.emdw.cpp.transformation.test.mappings

import com.ericsson.xtumlrt.oopl.cppmodel.CPPClass
import com.ericsson.xtumlrt.oopl.cppmodel.CPPClassRefAssocCollection
import com.ericsson.xtumlrt.oopl.cppmodel.CPPClassRefSimpleCollection
import com.ericsson.xtumlrt.oopl.cppmodel.CPPClassReference
import com.ericsson.xtumlrt.oopl.cppmodel.CPPClassReferenceStorage
import com.ericsson.xtumlrt.oopl.cppmodel.CPPDirectory
import com.ericsson.xtumlrt.oopl.cppmodel.CPPModel
import com.incquerylabs.emdw.cpp.transformation.test.wrappers.TransformationWrapper
import org.eclipse.papyrusrt.xtumlrt.common.Model
import org.eclipse.papyrusrt.xtumlrt.common.VisibilityKind
import org.eclipse.papyrusrt.xtumlrt.xtuml.XTAssociation
import org.eclipse.papyrusrt.xtumlrt.xtuml.XTAssociationClass
import org.eclipse.papyrusrt.xtumlrt.xtuml.XTClass
import org.junit.runner.RunWith
import org.junit.runners.Parameterized
import org.junit.runners.Suite
import org.junit.runners.Suite.SuiteClasses

import static org.junit.Assert.*

import static extension com.incquerylabs.emdw.cpp.transformation.test.TransformationTestUtil.*
import org.junit.Ignore
import org.eclipse.papyrusrt.xtumlrt.xtuml.XTComponent
import com.ericsson.xtumlrt.oopl.cppmodel.CPPComponent

@SuiteClasses(#[
	CPPClassReferenceMappingTest,
	CPPClassRefSimpleCollectionMappingTest,
	CPPClassRefAssocCollectionMappingTest
])
@RunWith(Suite)
class CPPClassReferenceMappingTestSuite {}

@Ignore("class reference is not in scope yet")
@RunWith(Parameterized)
class CPPClassReferenceMappingTest extends MappingBaseTest<XTClass, CPPComponent> {
	CPPDirectory rootDir;
	XTClass sourceClass;
	XTClass targetClass

	
	new(TransformationWrapper wrapper, String wrapperType) {
		super(wrapper, wrapperType)
	}
	
	override protected prepareXtUmlModel(Model model) {
		val pack = model.createPackage("RootPackage")
		val component = pack.createXtComponent("Component")
		sourceClass = component.createXtClass("sourceClass")
		targetClass = component.createXtClass("targetClass")
		sourceClass.createXtAssociation(targetClass, "singleAssoc",false,false,1,1)
		
		sourceClass
	}
		
	override  protected prepareCppModel(CPPModel cppModel) {
		val res = cppModel.eResource
		rootDir = res.createCPPDirectory
		val xtmodel = cppModel.commonModel
		val xtPackage = xtmodel.packages.head as org.eclipse.papyrusrt.xtumlrt.common.Package
		val xtComponent = xtPackage.entities.filter(XTComponent).head
		val cppPackage = cppModel.createCPPPackage(xtPackage)
		val cppComponent = cppPackage.createCPPComponent(xtComponent, null, null, null, null)
		cppPackage.createCPPClass(sourceClass, null, null)
		cppPackage.createCPPClass(targetClass, null, null)
		
		return cppComponent
	}
	
	override protected assertResult(Model input, CPPModel result, XTClass xtObject, CPPComponent cppObject) {
		val xtAssociations = xtObject.relations.filter(XTAssociation)
		val cppClass = cppObject.subElements.filter(CPPClass).filter[it.xtClass == sourceClass].head
		val cppReferenceStorages = cppClass.subElements.filter(CPPClassReferenceStorage)
		
		assertEquals(xtAssociations.size,cppReferenceStorages.size)
		assertEquals(xtAssociations.size,cppClass.referenceStorage.size)
		cppReferenceStorages.forEach[ 
			assertNotNull(type)
			val references = subElements.filter(CPPClassReference)
			assertTrue(!references.isEmpty)
			references.forEach[
				assertNotNull(class)
				assertNotNull(commonType)
			]
			
		]
	}
	
	override protected clearXtUmlElement(XTClass xtObject) {
		val associations = xtObject.relations.filter(XTAssociation)
		xtObject.relations.removeAll(associations)
	}
	
	override protected assertClear(Model input, CPPModel result, XTClass xtObject, CPPComponent cppObject) {
		val cppClass = cppObject.subElements.filter(CPPClass).filter[it.xtClass == sourceClass].head
		val cppReferenceStorages = cppClass.subElements.filter(CPPClassReferenceStorage)
		assertEquals(0, cppReferenceStorages.size)
		assertEquals(0, cppClass.referenceStorage.size)
	}
	
}

@Ignore("class reference is not in scope yet")
@RunWith(Parameterized)
class CPPClassRefSimpleCollectionMappingTest extends MappingBaseTest<XTClass, CPPComponent> {
CPPDirectory rootDir;
	XTClass sourceClass;
	XTClass targetClass

	
	new(TransformationWrapper wrapper, String wrapperType) {
		super(wrapper, wrapperType)
	}
	
	override protected prepareXtUmlModel(Model model) {
		val pack = model.createPackage("RootPackage")
		val component = pack.createXtComponent("Component")
		sourceClass = component.createXtClass("sourceClass")
		targetClass = component.createXtClass("targetClass")
		sourceClass.createXtAssociation(targetClass, "singleAssoc",false,false,1,25)
		
		sourceClass
	}
		
	override protected prepareCppModel(CPPModel cppModel) {
		val res = cppModel.eResource
		rootDir = res.createCPPDirectory
		val xtmodel = cppModel.commonModel
		val xtPackage = xtmodel.packages.head as org.eclipse.papyrusrt.xtumlrt.common.Package
		val xtComponent = xtPackage.entities.filter(XTComponent).head
		val cppPackage = cppModel.createCPPPackage(xtPackage)
		val cppComponent = cppPackage.createCPPComponent(xtComponent, null, null, null, null)
		
		cppComponent.createCPPClass(sourceClass, null, null)
		cppComponent.createCPPClass(targetClass, null, null)
		
		cppComponent
	}
	
	override protected assertResult(Model input, CPPModel result, XTClass xtObject, CPPComponent cppObject) {
		val xtAssociations = xtObject.relations.filter(XTAssociation)
		val cppClass = cppObject.subElements.filter(CPPClass).filter[it.xtClass == sourceClass].head
		val cppReferenceStorages = cppClass.subElements.filter(CPPClassReferenceStorage)
		
		assertEquals(xtAssociations.size,cppReferenceStorages.size)
		assertEquals(xtAssociations.size,cppClass.referenceStorage.size)
		cppReferenceStorages.forEach[ 
			assertNotNull(type)
			val collections = subElements.filter(CPPClassRefSimpleCollection)
			assertTrue(!collections.isEmpty)
			collections.forEach[
				assertNotNull(class)
				assertNotNull(commonType)
			]
			
		]
	}
	
	override protected clearXtUmlElement(XTClass xtObject) {
		val associations = xtObject.relations.filter(XTAssociation)
		xtObject.relations.removeAll(associations)
	}
	
	override protected assertClear(Model input, CPPModel result, XTClass xtObject, CPPComponent cppObject) {
		val cppClass = cppObject.subElements.filter(CPPClass).filter[it.xtClass == sourceClass].head
		val cppReferenceStorages = cppClass.subElements.filter(CPPClassReferenceStorage)
		assertEquals(0,cppReferenceStorages.size)
		assertEquals(0,cppClass.referenceStorage.size)
	}
	
}

@Ignore("class reference is not in scope yet")
@RunWith(Parameterized)
class CPPClassRefAssocCollectionMappingTest extends MappingBaseTest<XTClass, CPPComponent> {
	CPPDirectory rootDir
	XTClass sourceClass
	XTClass targetClass
	XTClass assocClass
	
	new(TransformationWrapper wrapper, String wrapperType) {
		super(wrapper, wrapperType)
	}
	
	override protected prepareXtUmlModel(Model model) {
		val pack = model.createPackage("RootPackage")
		val component = pack.createXtComponent("Component")
		sourceClass = component.createXtClass("sourceClass")
		targetClass = component.createXtClass("targetClass")
		assocClass = component.createXtClass("targetClass")
		assocClass.createSingleAttribute(pack.createPrimitiveType(pack.createTypeDefinition("Integer"),"Integer"),VisibilityKind.PUBLIC, false, "i")
		sourceClass.createXtAssociationClass(targetClass, assocClass,"singleAssoc",false,false,1,1)
		
		sourceClass
	}
		
	override protected prepareCppModel(CPPModel cppModel) {
		val res = cppModel.eResource
		rootDir = res.createCPPDirectory
		val xtmodel = cppModel.commonModel
		val xtPackage = xtmodel.packages.head as org.eclipse.papyrusrt.xtumlrt.common.Package
		val xtComponent = xtPackage.entities.filter(XTComponent).head
		
		
		val cppPackage = cppModel.createCPPPackage(xtPackage)
		val cppComponent = cppPackage.createCPPComponent(xtComponent, null, null, null, null)
		cppComponent.createCPPClass(sourceClass, null, null)
		cppComponent.createCPPClass(targetClass, null, null)
		cppComponent.createCPPClass(assocClass, null, null)
		
		cppComponent
	}
	
	override protected assertResult(Model input, CPPModel result, XTClass xtObject, CPPComponent cppObject) {
		val xtAssociations = xtObject.relations.filter(XTAssociationClass)
		val cppClass = cppObject.subElements.filter(CPPClass).filter[it.xtClass == sourceClass].head
		val cppReferenceStorages = cppClass.subElements.filter(CPPClassReferenceStorage)
		
		assertEquals(xtAssociations.size,cppReferenceStorages.size)
		assertEquals(xtAssociations.size,cppClass.referenceStorage.size)
		cppReferenceStorages.forEach[ 
			assertNotNull(type)
			val collections = subElements.filter(CPPClassRefAssocCollection)
			assertTrue(!collections.isEmpty)
			collections.forEach[
				assertNotNull(class)
				assertNotNull(key)
				assertNotNull(cppAttribute)
				assertNotNull(commonType)
			]
			
		]
	}
	
	override protected clearXtUmlElement(XTClass xtObject) {
		val associations = xtObject.relations.filter(XTAssociationClass)
		xtObject.relations.removeAll(associations)
	}
	
	override protected assertClear(Model input, CPPModel result, XTClass xtObject, CPPComponent cppObject) {
		val cppClass = cppObject.subElements.filter(CPPClass).filter[it.xtClass == sourceClass].head
		val cppReferenceStorages = cppClass.subElements.filter(CPPClassReferenceStorage)
		
		assertEquals(0,cppReferenceStorages.size)
		assertEquals(0,cppClass.referenceStorage.size)
	}
	
}
