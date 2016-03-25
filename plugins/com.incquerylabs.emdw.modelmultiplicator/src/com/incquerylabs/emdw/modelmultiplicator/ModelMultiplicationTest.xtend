package com.incquerylabs.emdw.modelmultiplicator

import java.util.Set
import org.eclipse.emf.common.util.URI
import org.eclipse.emf.ecore.resource.impl.ResourceSetImpl
import org.eclipse.uml2.uml.Component
import org.eclipse.uml2.uml.Model
import org.eclipse.uml2.uml.Package
import org.junit.Test

public class ModelMultiplicationTest {
	val COMPONENT_MULTIPLICATION_COUNT = 2
	val COMPONENT_INSIDE_MULTIPLICATION_COUNT = 0
	val FILENAME = "pingpongsimple_performancetest.uml"
	
	@Test
	public def test() {
		extension val modelMultiplicator = new ModelMultiplicator
		
		val rs = new ResourceSetImpl
		val uri = URI.createURI('''model/«FILENAME»''')
		val modelResource = rs.getResource(uri, true)
		val model = modelResource.allContents.filter(Model).head
		
		val uriWithoutExtension = uri.trimFileExtension
		val newUriString = uriWithoutExtension.toString.concat('''_«COMPONENT_MULTIPLICATION_COUNT»x«COMPONENT_INSIDE_MULTIPLICATION_COUNT».uml''')
		val newUri = URI.createURI(newUriString)
		
		// Find top-level components
		val components = model.findTopLevelComponents
		// Multiplicate elements inside top level components
		components.forEach[ it.copyAllSubelements(COMPONENT_INSIDE_MULTIPLICATION_COUNT) ]
		// Multiplicate components
		components.ownersSet.forEach[ it.copyPackagedElements(COMPONENT_MULTIPLICATION_COUNT, Component)]
		
		modelResource.URI = newUri
		modelResource.save(null)
	}
	
	def Set<Package> getOwnersSet(Set<Component> components) {
		val ownersSet = <Package>newHashSet()
		components.forEach[
			if(it.namespace instanceof Package) {
				ownersSet += it.namespace as Package
			}
		]
		return ownersSet
	}
	
	def Set<Component> findTopLevelComponents(Package pack) {
		val innerPackages = pack.packagedElements.filter(Package)
		val allComponents = pack.packagedElements.filter(Component).toSet
		innerPackages.forEach[allComponents += it.findTopLevelComponents]
		return allComponents
	}
}
