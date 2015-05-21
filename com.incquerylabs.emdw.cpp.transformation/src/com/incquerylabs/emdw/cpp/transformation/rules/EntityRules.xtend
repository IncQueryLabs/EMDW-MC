package com.incquerylabs.emdw.cpp.transformation.rules

import com.ericsson.xtumlrt.oopl.OoplFactory
import com.ericsson.xtumlrt.oopl.cppmodel.CppmodelFactory
import com.incquerylabs.emdw.cpp.transformation.queries.XtumlQueries
import org.apache.log4j.Logger
import org.eclipse.viatra.emf.runtime.rules.TransformationRuleGroup
import org.eclipse.viatra.emf.runtime.rules.batch.BatchTransformationRuleFactory
import org.eclipse.viatra.emf.runtime.transformation.batch.BatchTransformation
import org.eclipse.xtend.lib.annotations.Accessors
import org.eclipse.papyrusrt.xtumlrt.common.MultiplicityElement
import com.ericsson.xtumlrt.oopl.SequenceUniquenessKind
import com.ericsson.xtumlrt.oopl.SequenceOrderednessKind

class EntityRules {
	static extension val XtumlQueries xtUmlQueries = XtumlQueries.instance
	
	extension val Logger logger = Logger.getLogger(class)
	extension val BatchTransformationRuleFactory factory = new BatchTransformationRuleFactory
	extension val CppmodelFactory cppFactory = CppmodelFactory.eINSTANCE
	extension val OoplFactory ooplFactory = OoplFactory.eINSTANCE
	
	def addRules(BatchTransformation transformation){
		val rules = new TransformationRuleGroup(
			entityAttributeRule,
			entityOperationRule,
			cppSequenceTypeRule
		)
		transformation.addRules(rules)
	}
	
	@Accessors(PUBLIC_GETTER)
	val entityAttributeRule = createRule.precondition(cppEntityAttributes).action[ match |
		val cppElement = match.cppElement
		val attribute = match.attribute
		val cppAttribute = createCPPAttribute => [
			commonAttribute = attribute
			ooplNameProvider = createOOPLExistingNameProvider => [ commonNamedElement = attribute ]
			if(attribute.multiValue){
				unnamedSequenceType = generateCPPSequence(attribute)
			}
		]
		cppElement.subElements += cppAttribute
		trace('''Mapped Attribute «attribute.name» in entity «match.xtEntity.name» to CPPAttribute''')
	].build
	
	@Accessors(PUBLIC_GETTER)
	val cppSequenceTypeRule = createRule.precondition(cppSequenceType).action[
		cppSequence.elementType = ooplType
		trace('''Set CPPSequence type of «typedElement.name» to «ooplType.commonType.name»''')
	].build
		
	@Accessors(PUBLIC_GETTER)
	val entityOperationRule = createRule.precondition(cppEntityOperations).action[ match |
		val cppElement = match.cppElement
		val operation = match.operation
		val cppOperation = createCPPOperation => [
			commonOperation = operation
			ooplNameProvider = createOOPLExistingNameProvider => [ commonNamedElement = operation ]
		]
		operation.parameters.forEach[ param |
			val cppFormalParameter = createCPPFormalParameter => [
				commonParameter = param
				ooplNameProvider = createOOPLExistingNameProvider => [ commonNamedElement = param ]
				if(param.multiValue){
					unnamedSequenceType = generateCPPSequence(param)
				}
			]
			cppOperation.subElements += cppFormalParameter
		]
		cppElement.subElements += cppOperation
		trace('''Mapped Operation «operation.name» in entity «match.xtEntity.name» to CPPOperation''')
	].build
	
	def isMultiValue(MultiplicityElement multiplicityElement) {
		val upperBound = multiplicityElement.upperBound
		return upperBound > 1 || upperBound == -1
	}
	
	def generateCPPSequence(MultiplicityElement multiplicityElement) {
		createCPPSequence => [
			if(multiplicityElement.unique) {
				uniqueness = SequenceUniquenessKind.UNIQUE
			} else {
				uniqueness = SequenceUniquenessKind.NON_UNIQUE
			}
			if(multiplicityElement.ordered) {
				orderedness = SequenceOrderednessKind.ORDERED
			} else {
				orderedness = SequenceOrderednessKind.UNORDERED
			}
		]
	}
}