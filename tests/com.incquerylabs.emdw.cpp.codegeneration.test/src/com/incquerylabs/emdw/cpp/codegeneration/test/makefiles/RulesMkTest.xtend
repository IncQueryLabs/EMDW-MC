package com.incquerylabs.emdw.cpp.codegeneration.test.makefiles

import com.ericsson.xtumlrt.oopl.cppmodel.CPPComponent
import com.ericsson.xtumlrt.oopl.cppmodel.CPPModel
import com.ericsson.xtumlrt.oopl.cppmodel.CPPPackage
import com.incquerylabs.emdw.cpp.codegeneration.test.wrappers.TransformationWrapper
import org.eclipse.papyrusrt.xtumlrt.common.State
import org.junit.runner.RunWith
import org.junit.runners.Parameterized

import static org.junit.Assert.*

import static extension com.incquerylabs.emdw.cpp.codegeneration.test.TransformationTestUtil.*

@RunWith(Parameterized)
class ComponentRulesMkTest extends MakeBaseTest<State, CPPModel> {
	
	new(TransformationWrapper wrapper, String wrapperType) {
		super(wrapper, wrapperType)
	}
	
	override protected prepareCppModel(CPPModel cppModel) {
		val xtmodel = cppModel.commonModel
		val xtPackage = xtmodel.createPackage("RootPackage")
		val xtComponent = xtPackage.createXtComponent("Component")
		val xtClass = xtComponent.createXtClass("TEST_CLASS")
		
		val cppPackage = createCPPPackage(cppModel, xtPackage)
		val cppComponent = createCPPComponentWithDefaultDirectories(cppPackage, xtComponent)
		val cppClassHeader = createCPPHeaderFile(cppComponent.headerDirectory)
		val cppClassBody = createCPPBodyFile(cppComponent.bodyDirectory)
		createCPPClass(cppComponent, xtClass, cppClassHeader, cppClassBody)
		
		cppModel
	}
	
	override protected assertResult(CPPModel result, CPPModel cppObject) {
		val cppPackage = cppObject.subElements.get(0) as CPPPackage
		assertNotNull(cppPackage)
		val cppComponent = cppPackage.subElements.get(0) as CPPComponent
		assertNotNull(cppComponent)
		val headerDir = cppComponent.headerDirectory
		val rules = rules.get(headerDir)
		assertNotNull(rules)
		assertTrue(rules.toString.contains("sp	:= $(basename $(sp))"))
		assertFalse(rules.toString.contains("dir := 	$(d)/"))
	}
	
}

@RunWith(Parameterized)
class PackageRulesMkTest extends MakeBaseTest<State, CPPModel> {
	
	new(TransformationWrapper wrapper, String wrapperType) {
		super(wrapper, wrapperType)
	}
	
	override protected prepareCppModel(CPPModel cppModel) {
		val xtmodel = cppModel.commonModel
		val xtPackage = xtmodel.createPackage("RootPackage")
		val xtComponent = xtPackage.createXtComponent("Component")
		val xtInnerPackage = xtComponent.createPackage("InnerPack")
		val xtClass = xtInnerPackage.createXtClass("TEST_CLASS")
		
		val cppPackage = createCPPPackage(cppModel, xtPackage)
		val cppComponent = createCPPComponentWithDefaultDirectories(cppPackage, xtComponent)
		val cppInnerPackage = createCPPPackage(cppComponent, xtInnerPackage)
		val cppClassHeader = createCPPHeaderFile(cppInnerPackage.headerDir)
		val cppClassBody = createCPPBodyFile(cppComponent.bodyDirectory)
		createCPPClass(cppComponent, xtClass, cppClassHeader, cppClassBody)
		
		cppModel
	}
	
	override protected assertResult(CPPModel result, CPPModel cppObject) {
		val cppPackage = cppObject.subElements.get(0) as CPPPackage
		assertNotNull(cppPackage)
		
		val cppComponent = cppPackage.subElements.get(0) as CPPComponent
		assertNotNull(cppComponent)
		
		val headerDir = cppComponent.headerDirectory
		val cppComponentRules = rules.get(headerDir)
		assertNotNull(cppComponentRules)
		assertTrue(cppComponentRules.toString.contains("sp	:= $(basename $(sp))"))
		assertTrue(cppComponentRules.toString.contains("dir := 	$(d)/InnerPack"))
		
		val cppInnerPackage = cppComponent.subElements.get(0) as CPPPackage
		val cppInnerPackageheaderDir = cppInnerPackage.headerDir
		val cppInnerPackageRules = rules.get(cppInnerPackageheaderDir)
		assertNotNull(cppInnerPackageRules)
		assertTrue(cppInnerPackageRules.toString.contains("sp	:= $(basename $(sp))"))
		assertFalse(cppInnerPackageRules.toString.contains("dir := 	$(d)/"))
	}
	
}