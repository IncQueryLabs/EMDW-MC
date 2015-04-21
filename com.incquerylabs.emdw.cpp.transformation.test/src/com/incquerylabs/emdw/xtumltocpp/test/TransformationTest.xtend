package com.incquerylabs.emdw.xtumltocpp.test

import com.ericsson.xtumlrt.oopl.cppmodel.CPPModel
import com.google.common.collect.ImmutableList
import com.incquerylabs.emdw.umlintegration.trace.RootMapping
import com.incquerylabs.emdw.xtumltocpp.test.wrappers.DummyWrapper
import com.incquerylabs.emdw.xtumltocpp.test.wrappers.TransformationWrapper
import com.zeligsoft.xtumlrt.common.Model
import org.eclipse.emf.ecore.EObject
import org.eclipse.uml2.uml.Element
import org.junit.Test
import org.junit.runners.Parameterized.Parameters

import static com.incquerylabs.emdw.xtumltocpp.test.TransformationTestUtil.*
import com.ericsson.xtumlrt.oopl.cppmodel.CPPDirectory

/**
 * Base class for testing transformation rules.
 */
abstract class TransformationTest<UmlObject extends Element, XtumlrtObject extends EObject> extends TestWithoutParameters {

	
	new(TransformationWrapper wrapper, String wrapperType) {
		super(wrapper, wrapperType)
	}
	
	@Parameters(name = "{index}: {1}")
    public static def transformations() {
        val alternatives = ImmutableList.builder
        	.add(new DummyWrapper())
			.build
		
		alternatives.map[
			val simpleName = it.class.simpleName
			#[it, simpleName].toArray
		]
    }
 	
	@Test
	def single() {
		
		val testId = "single"
		startTest(testId)
		//Create Root mapping
		val mapping = createRootMapping(testId)
		val reference = createRootMapping(testId)
		//Init UML model
		//Transform model to XTUML
		val xtmodel = mapping.createXtUmlModel
		//init cpp model
		val cppmodel = createCppModel(xtmodel)
		val cppdir = createCppDir(xtmodel)
		//transform to CPP
		initializeTransformation(cppmodel)
		executeTransformation
		//create reference model
		val cppmodelRef = createCppModel(xtmodel)
		val cppdirRef = createCppDir(xtmodel)
		createResultCppModel(reference, cppmodelRef, cppdirRef)
		//Check result
		AssertResult(cppmodel,cppdir, cppmodelRef, cppdirRef)
		endTest(testId)
	}
	
	//Additional alternatives can be added heres

	protected def Model createXtUmlModel(RootMapping root)

	protected def void createResultCppModel(RootMapping reference, CPPModel cppmodel, CPPDirectory cppdir)
		
	
	protected def void AssertResult(CPPModel result, CPPDirectory resultdir, CPPModel ref, CPPDirectory refdir)   
}
