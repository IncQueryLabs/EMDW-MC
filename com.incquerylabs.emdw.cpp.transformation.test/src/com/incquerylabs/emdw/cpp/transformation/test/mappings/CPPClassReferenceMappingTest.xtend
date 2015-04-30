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
import org.eclipse.papyrusrt.xtumlrt.xtuml.XTPackage
import org.junit.runner.RunWith
import org.junit.runners.Parameterized

import static org.junit.Assert.*

import static extension com.incquerylabs.emdw.cpp.transformation.test.TransformationTestUtil.*

@RunWith(Parameterized)
class CPPClassReferenceMappingTest extends MappingBaseTest<XTClass, CPPClass> {
	CPPDirectory rootDir;
	XTClass sourceClass;
	XTClass targetClass
	CPPClass sourceCPPClass;
	CPPClass targetCPPClass
	
	new(TransformationWrapper wrapper, String wrapperType) {
		super(wrapper, wrapperType)
	}
	
	override protected prepareXtUmlModel(Model model) {
		val pack = model.createXtPackage("RootPackage")
		sourceClass = pack.createXtClass("sourceClass")
		targetClass = pack.createXtClass("targetClass")
		sourceClass.createXtAssociation(targetClass, "singleAssoc",false,false,1,1)
		
		sourceClass
	}
		
	override protected prepareCppModel(CPPModel cppModel) {
		val res = cppModel.eResource
		rootDir = res.createCPPDirectory
		val xtmodel = cppModel.commonModel
		val xtPackage = xtmodel.rootPackages.head as XTPackage
		val cppPackage = createCPPPackage(cppModel, xtPackage)
		sourceCPPClass = createCPPClass(cppPackage, sourceClass, null, null)
		targetCPPClass = createCPPClass(cppPackage, targetClass, null, null)
		
		sourceCPPClass
	}
	
	override protected assertResult(Model input, CPPModel result, XTClass xtObject, CPPClass cppObject) {
		val xtAssociations = xtObject.relations.filter(XTAssociation)
		val cppReferenceStorages = cppObject.subElements.filter(CPPClassReferenceStorage)
		
		assertEquals(xtAssociations.size,cppReferenceStorages.size)
		assertEquals(xtAssociations.size,cppObject.referenceStorage.size)
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
	
}


@RunWith(Parameterized)
class CPPClassRefSimpleCollectionMappingTest extends MappingBaseTest<XTClass, CPPClass> {
CPPDirectory rootDir;
	XTClass sourceClass;
	XTClass targetClass
	CPPClass sourceCPPClass;
	CPPClass targetCPPClass
	
	new(TransformationWrapper wrapper, String wrapperType) {
		super(wrapper, wrapperType)
	}
	
	override protected prepareXtUmlModel(Model model) {
		val pack = model.createXtPackage("RootPackage")
		sourceClass = pack.createXtClass("sourceClass")
		targetClass = pack.createXtClass("targetClass")
		sourceClass.createXtAssociation(targetClass, "singleAssoc",false,false,1,25)
		
		sourceClass
	}
		
	override protected prepareCppModel(CPPModel cppModel) {
		val res = cppModel.eResource
		rootDir = res.createCPPDirectory
		val xtmodel = cppModel.commonModel
		val xtPackage = xtmodel.rootPackages.head as XTPackage
		val cppPackage = createCPPPackage(cppModel, xtPackage)
		sourceCPPClass = createCPPClass(cppPackage, sourceClass, null, null)
		targetCPPClass = createCPPClass(cppPackage, targetClass, null, null)
		
		sourceCPPClass
	}
	
	override protected assertResult(Model input, CPPModel result, XTClass xtObject, CPPClass cppObject) {
		val xtAssociations = xtObject.relations.filter(XTAssociation)
		val cppReferenceStorages = cppObject.subElements.filter(CPPClassReferenceStorage)
		
		assertEquals(xtAssociations.size,cppReferenceStorages.size)
		assertEquals(xtAssociations.size,cppObject.referenceStorage.size)
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
	
}

@RunWith(Parameterized)
class CPPClassRefAssocCollectionMappingTest extends MappingBaseTest<XTClass, CPPClass> {
	CPPDirectory rootDir
	XTClass sourceClass
	XTClass targetClass
	XTClass assocClass
	CPPClass sourceCPPClass
	CPPClass targetCPPClass
	CPPClass assocCPPClass
	
	new(TransformationWrapper wrapper, String wrapperType) {
		super(wrapper, wrapperType)
	}
	
	override protected prepareXtUmlModel(Model model) {
		val pack = model.createXtPackage("RootPackage")
		sourceClass = pack.createXtClass("sourceClass")
		targetClass = pack.createXtClass("targetClass")
		assocClass = pack.createXtClass("targetClass")
		assocClass.createSingleAttribute(pack.createPrimitiveType(pack.createTypeDefinition("Integer"),"Integer"),VisibilityKind.PUBLIC, false, "i")
		sourceClass.createXtAssociationClass(targetClass, assocClass,"singleAssoc",false,false,1,1)
		
		sourceClass
	}
		
	override protected prepareCppModel(CPPModel cppModel) {
		val res = cppModel.eResource
		rootDir = res.createCPPDirectory
		val xtmodel = cppModel.commonModel
		val xtPackage = xtmodel.rootPackages.head as XTPackage
		val cppPackage = createCPPPackage(cppModel, xtPackage)
		sourceCPPClass = createCPPClass(cppPackage, sourceClass, null, null)
		targetCPPClass = createCPPClass(cppPackage, targetClass, null, null)
		assocCPPClass = createCPPClass(cppPackage, assocClass, null, null)
		
		sourceCPPClass
	}
	
	override protected assertResult(Model input, CPPModel result, XTClass xtObject, CPPClass cppObject) {
		val xtAssociations = xtObject.relations.filter(XTAssociationClass)
		val cppReferenceStorages = cppObject.subElements.filter(CPPClassReferenceStorage)
		
		assertEquals(xtAssociations.size,cppReferenceStorages.size)
		assertEquals(xtAssociations.size,cppObject.referenceStorage.size)
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
	
}
