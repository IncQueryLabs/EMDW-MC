/*******************************************************************************
 * Copyright (c) 2015-2016, IncQuery Labs Ltd. and Ericsson AB
 * All rights reserved. This program and the accompanying materials
 * are made available under the terms of the Eclipse Public License v1.0
 * which accompanies this distribution, and is available at
 * http://www.eclipse.org/legal/epl-v10.html
 *
 * Contributors:
 *   Akos Horvath, Abel Hegedus, Zoltan Ujhelyi, Daniel Segesdi, Tamas Borbas, Robert Doczi, Peter Lunk, Istvan Papp - initial API and implementation
 *******************************************************************************/
package com.incquerylabs.emdw.cpp.transformation.test.mappings

import com.ericsson.xtumlrt.oopl.cppmodel.CPPClass
import com.ericsson.xtumlrt.oopl.cppmodel.CPPClassRefAssocCollection
import com.ericsson.xtumlrt.oopl.cppmodel.CPPClassRefSimpleCollection
import com.ericsson.xtumlrt.oopl.cppmodel.CPPClassReference
import com.ericsson.xtumlrt.oopl.cppmodel.CPPClassReferenceStorage
import com.ericsson.xtumlrt.oopl.cppmodel.CPPComponent
import com.ericsson.xtumlrt.oopl.cppmodel.CPPDirectory
import com.ericsson.xtumlrt.oopl.cppmodel.CPPModel
import com.ericsson.xtumlrt.oopl.cppmodel.CPPRelation
import org.eclipse.papyrusrt.xtumlrt.common.Model
import org.eclipse.papyrusrt.xtumlrt.common.Package
import org.eclipse.papyrusrt.xtumlrt.common.VisibilityKind
import org.eclipse.papyrusrt.xtumlrt.xtuml.XTAssociation
import org.eclipse.papyrusrt.xtumlrt.xtuml.XTAssociationClass
import org.eclipse.papyrusrt.xtumlrt.xtuml.XTClass
import org.eclipse.papyrusrt.xtumlrt.xtuml.XTComponent
import org.junit.Ignore
import org.junit.runner.RunWith
import org.junit.runners.Suite
import org.junit.runners.Suite.SuiteClasses

import static org.junit.Assert.*

@SuiteClasses(#[
	CPPClassReferenceMappingTest,
	CPPClassReferenceReflectiveMappingTest,
	CPPClassRefSimpleCollectionMappingTest,
	CPPClassRefAssocCollectionMappingTest
])
@RunWith(Suite)
class CPPClassReferenceMappingTestSuite {}

class CPPClassReferenceMappingTest extends MappingBaseTest<XTClass, CPPComponent> {
	CPPDirectory rootDir;
	XTClass sourceClass;
	XTClass targetClass

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
		val xtPackage = xtmodel.packages.head as Package
		val xtComponent = xtPackage.entities.filter(XTComponent).head
		val cppPackage = cppModel.createCPPPackage(xtPackage)
		val cppComponent = cppPackage.createCPPComponentWithDirectoriesAndFiles(xtComponent, rootDir)
		
		return cppComponent
	}
	
	override protected assertResult(Model input, CPPModel result, XTClass xtObject, CPPComponent cppObject) {
		val xtAssociations = xtObject.relations.filter(XTAssociation)
		val cppClass = cppObject.subElements.filter(CPPClass).filter[it.xtClass == sourceClass].head
		val cppRelations = cppClass.subElements.filter(CPPRelation)
		val cppReferenceStorages = cppRelations.map[referenceStorage].flatten.filter(CPPClassReferenceStorage)
		
		assertEquals(xtAssociations.size,cppRelations.size)
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
		val cppRelations = cppClass.subElements.filter(CPPRelation)
		val cppReferenceStorages = cppRelations.map[referenceStorage].flatten.filter(CPPClassReferenceStorage)
		assertEquals(0, cppRelations.size)
		assertEquals(0, cppReferenceStorages.size)
	}
	
}

class CPPClassReferenceReflectiveMappingTest extends MappingBaseTest<XTClass, CPPComponent> {
	CPPDirectory rootDir;
	XTClass sourceClass;
	
	override protected prepareXtUmlModel(Model model) {
		val pack = model.createPackage("RootPackage")
		val component = pack.createXtComponent("Component")
		sourceClass = component.createXtClass("sourceClass")
		sourceClass.createXtAssociation(sourceClass, "singleAssoc",false,false,1,1)
		
		sourceClass
	}
		
	override  protected prepareCppModel(CPPModel cppModel) {
		val res = cppModel.eResource
		rootDir = res.createCPPDirectory
		val xtmodel = cppModel.commonModel
		val xtPackage = xtmodel.packages.head as Package
		val xtComponent = xtPackage.entities.filter(XTComponent).head
		val cppPackage = cppModel.createCPPPackage(xtPackage)
		val cppComponent = cppPackage.createCPPComponentWithDirectoriesAndFiles(xtComponent, rootDir)
		
		return cppComponent
	}
	
	override protected assertResult(Model input, CPPModel result, XTClass xtObject, CPPComponent cppObject) {
		val xtAssociations = xtObject.relations.filter(XTAssociation)
		val cppClass = cppObject.subElements.filter(CPPClass).filter[it.xtClass == sourceClass].head
		val cppRelations = cppClass.subElements.filter(CPPRelation)
		val cppReferenceStorages = cppRelations.map[referenceStorage].flatten.filter(CPPClassReferenceStorage)
		
		assertEquals(xtAssociations.size,cppRelations.size)
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
		val cppRelations = cppClass.subElements.filter(CPPRelation)
		val cppReferenceStorages = cppRelations.map[referenceStorage].flatten.filter(CPPClassReferenceStorage)
		assertEquals(0, cppRelations.size)
		assertEquals(0, cppReferenceStorages.size)
	}
	
}

class CPPClassRefSimpleCollectionMappingTest extends MappingBaseTest<XTClass, CPPComponent> {
	CPPDirectory rootDir;
	XTClass sourceClass;
	XTClass targetClass

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
		val xtPackage = xtmodel.packages.head as Package
		val xtComponent = xtPackage.entities.filter(XTComponent).head
		val cppPackage = cppModel.createCPPPackage(xtPackage)
		val cppComponent = cppPackage.createCPPComponentWithDirectoriesAndFiles(xtComponent, rootDir)
		
		cppComponent.createCPPClass(sourceClass, null, null)
		cppComponent.createCPPClass(targetClass, null, null)
		
		cppComponent
	}
	
	override protected assertResult(Model input, CPPModel result, XTClass xtObject, CPPComponent cppObject) {
		val xtAssociations = xtObject.relations.filter(XTAssociation)
		val cppClass = cppObject.subElements.filter(CPPClass).filter[it.xtClass == sourceClass].head
		val cppRelations = cppClass.subElements.filter(CPPRelation)
		val cppReferenceStorages = cppRelations.map[referenceStorage].flatten.filter(CPPClassReferenceStorage)
		
		assertEquals(xtAssociations.size,cppRelations.size)
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
		val cppRelations = cppClass.subElements.filter(CPPRelation)
		val cppReferenceStorages = cppRelations.map[referenceStorage].flatten.filter(CPPClassReferenceStorage)
		assertEquals(0, cppRelations.size)
		assertEquals(0, cppReferenceStorages.size)
	}
	
}

@Ignore("class reference associative collection is not in scope yet")
class CPPClassRefAssocCollectionMappingTest extends MappingBaseTest<XTClass, CPPComponent> {
	CPPDirectory rootDir
	XTClass sourceClass
	XTClass targetClass
	XTClass assocClass
	
	override protected prepareXtUmlModel(Model model) {
		val pack = model.createPackage("RootPackage")
		val component = pack.createXtComponent("Component")
		sourceClass = component.createXtClass("sourceClass")
		targetClass = component.createXtClass("targetClass")
		assocClass = component.createXtClass("targetClass")
		assocClass.createSingleAttribute(createPrimitiveType(pack.createTypeDefinition("Integer"),"Integer"),VisibilityKind.PUBLIC, false, "i")
		sourceClass.createXtAssociationClass(targetClass, assocClass,"singleAssoc",false,false,1,1)
		
		sourceClass
	}
		
	override protected prepareCppModel(CPPModel cppModel) {
		val res = cppModel.eResource
		rootDir = res.createCPPDirectory
		val xtmodel = cppModel.commonModel
		val xtPackage = xtmodel.packages.head as Package
		val xtComponent = xtPackage.entities.filter(XTComponent).head
		
		
		val cppPackage = cppModel.createCPPPackage(xtPackage)
		val cppComponent = cppPackage.createCPPComponentWithDirectoriesAndFiles(xtComponent, rootDir)
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
