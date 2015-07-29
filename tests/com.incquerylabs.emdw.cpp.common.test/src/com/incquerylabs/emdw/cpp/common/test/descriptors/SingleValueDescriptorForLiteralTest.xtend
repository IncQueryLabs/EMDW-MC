package com.incquerylabs.emdw.cpp.common.test.descriptors

import com.incquerylabs.emdw.cpp.common.UmlValueDescriptorFactory
import com.incquerylabs.emdw.cpp.common.test.ValueDescriptorBaseTest
import com.incquerylabs.emdw.cpp.common.test.wrappers.TransformationWrapper
import com.incquerylabs.emdw.valuedescriptor.SingleValueDescriptor
import org.eclipse.uml2.uml.Element
import org.eclipse.uml2.uml.Model
import org.eclipse.uml2.uml.PrimitiveType
import org.junit.runner.RunWith
import org.junit.runners.Parameterized

import static org.junit.Assert.*

@RunWith(Parameterized)
class SingleValueDescriptorForLiteralTest extends ValueDescriptorBaseTest<Element, SingleValueDescriptor> {
	
	new(TransformationWrapper wrapper, String wrapperType) {
		super(wrapper, wrapperType)
	}
	
	override protected selectUmlObject(Model umlModel) {
		val umlPrimitiveTypesResource = umlModel.eResource.resourceSet.resources.findFirst[it.URI.toString.contains("UMLPrimitiveTypes")]
		val primitiveTypes = umlPrimitiveTypesResource.allContents.filter(PrimitiveType).toList
		val pT = primitiveTypes.findFirst[it.name == "Boolean"]
		return pT
	}
	
	override protected prepareSingleValueDescriptor(UmlValueDescriptorFactory factory, Element element) {
		return factory.prepareSingleValueDescriptorForLiteral(element, "true")
	}
	
	override protected assertResult(Element object, SingleValueDescriptor descriptor) {
		assertTrue("Descriptor's value type should be bool.", descriptor.valueType=="bool")
		assertTrue("Descriptor's string representation should be true.", descriptor.stringRepresentation=="true")
	}
	
}