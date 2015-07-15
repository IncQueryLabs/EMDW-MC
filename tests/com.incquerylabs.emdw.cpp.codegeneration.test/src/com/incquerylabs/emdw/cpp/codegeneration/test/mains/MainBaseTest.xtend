package com.incquerylabs.emdw.cpp.codegeneration.test.mains

import com.incquerylabs.emdw.cpp.codegeneration.test.TransformationTest
import org.eclipse.emf.ecore.EObject
import com.incquerylabs.emdw.cpp.codegeneration.test.wrappers.TransformationWrapper
import com.incquerylabs.emdw.cpp.codegeneration.MainGeneration
import com.ericsson.xtumlrt.oopl.cppmodel.CPPModel
import com.ericsson.xtumlrt.oopl.cppmodel.CPPComponent
import com.ericsson.xtumlrt.oopl.cppmodel.CPPQualifiedNamedElement

abstract class MainBaseTest<XtumlObject extends EObject, CPPObject extends EObject> extends TransformationTest<XtumlObject, CPPObject> {
	protected CharSequence mainContent
	protected MainGeneration generator
	
	new(TransformationWrapper wrapper, String wrapperType) {
		super(wrapper, wrapperType)
		generator = new MainGeneration
		generator.initialize
	}
	
	override protected transformCppModel(CPPModel cppModel) {
		super.transformCppModel(cppModel)
		val components = cppModel.components
		mainContent = generator.execute(components)
	}
	
	protected final def CPPComponent[] getComponents(CPPQualifiedNamedElement qne) {
		val components = <CPPComponent>newArrayList
		for(elem : qne.subElements) {
			if(elem instanceof CPPComponent) {
				components += elem
			}
			components.addAll(elem.components)
		}
		return components
	}
	
}