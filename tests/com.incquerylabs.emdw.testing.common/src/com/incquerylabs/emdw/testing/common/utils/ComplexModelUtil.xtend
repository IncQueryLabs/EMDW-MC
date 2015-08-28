package com.incquerylabs.emdw.testing.common.utils

import com.incquerylabs.emdw.umlintegration.trace.TraceFactory
import org.eclipse.emf.common.util.URI
import org.eclipse.emf.ecore.resource.ResourceSet
import org.eclipse.emf.ecore.resource.impl.ResourceSetImpl
import org.eclipse.papyrusrt.xtumlrt.common.CommonFactory
import org.eclipse.uml2.uml.UMLFactory

class ComplexModelUtil extends ModelUtil {
	static extension UMLFactory umlFactory = UMLFactory.eINSTANCE
	static extension CommonFactory commonFactory = CommonFactory.eINSTANCE
	static extension TraceFactory traceFactory = TraceFactory.eINSTANCE

	static extension CppUtil cppUtil = new CppUtil
	
	def createRootMapping(String umlModelName, ResourceSet rs) {
		var resourceSet = rs
		if (resourceSet == null) {
			resourceSet = new ResourceSetImpl
		}
		val umlResource = resourceSet.createResource(URI.createURI('''model/«umlModelName»/«URI_DUMMY_UML»'''))
		val xtumlrtResource = resourceSet.createResource(URI.createURI('''model/«umlModelName»/«URI_DUMMY_XTUML»'''))
		val traceResource = resourceSet.createResource(URI.createURI('''model/«umlModelName»/«URI_DUMMY_TRACE»'''))
		val cppResource = resourceSet.createResource(URI.createURI('''model/«umlModelName»/«URI_DUMMY_CPP»'''))

		val umlModel = umlFactory.createModel => [
			name = umlModelName
		]
		umlResource.contents += umlModel

		val xtumlrtModel = commonFactory.createModel
		xtumlrtResource.contents += xtumlrtModel

		val mapping = createRootMapping => [
			umlRoot = umlModel
			xtumlrtRoot = xtumlrtModel
		]
		traceResource.contents += mapping
		prepareCPPModel(cppResource, xtumlrtModel)

		mapping
	}
}