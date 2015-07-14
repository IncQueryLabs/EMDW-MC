package com.incquerylabs.emdw.cpp.transformation.rules

import com.ericsson.xtumlrt.oopl.OoplFactory
import com.ericsson.xtumlrt.oopl.SequenceOrderednessKind
import com.ericsson.xtumlrt.oopl.SequenceUniquenessKind
import com.ericsson.xtumlrt.oopl.cppmodel.CPPQualifiedNamedElement
import com.ericsson.xtumlrt.oopl.cppmodel.CppmodelFactory
import com.incquerylabs.emdw.cpp.transformation.queries.CppQueries
import com.incquerylabs.emdw.cpp.transformation.queries.XtumlQueries
import org.apache.log4j.Logger
import org.eclipse.papyrusrt.xtumlrt.common.MultiplicityElement
import org.eclipse.viatra.emf.runtime.rules.BatchTransformationRuleGroup
import org.eclipse.viatra.emf.runtime.rules.batch.BatchTransformationRuleFactory
import org.eclipse.viatra.emf.runtime.rules.batch.BatchTransformationStatements
import org.eclipse.viatra.emf.runtime.transformation.batch.BatchTransformation
import org.eclipse.xtend.lib.annotations.Accessors

class EntityRules {
	static extension val XtumlQueries xtUmlQueries = XtumlQueries.instance
	static extension val CppQueries cppQueries = CppQueries.instance
	
	extension val Logger logger = Logger.getLogger(class)
	extension val BatchTransformationRuleFactory factory = new BatchTransformationRuleFactory
	extension val CppmodelFactory cppFactory = CppmodelFactory.eINSTANCE
	extension val OoplFactory ooplFactory = OoplFactory.eINSTANCE
	extension val BatchTransformationStatements statements
	extension val IncludeRules includeRules
	
	new(BatchTransformationStatements statements, IncludeRules includeRules) {
		this.statements = statements
		this.includeRules = includeRules
	}
	
	def addRules(BatchTransformation transformation){
		val rules = new BatchTransformationRuleGroup(
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
		val cppAttribute = createCPPAttribute
		cppElement.subElements += cppAttribute
		cppAttribute => [
			commonAttribute = attribute
			ooplNameProvider = createOOPLExistingNameProvider => [ commonNamedElement = attribute ]
			if(attribute.multiValue){
				unnamedSequenceType = generateCPPSequence(attribute)
			}
		]
		trace('''Mapped Attribute «attribute.name» in entity «match.xtEntity.name» to CPPAttribute''')
		fireAllCurrent(cppSequenceTypeRule, [it.cppElement == cppAttribute])
		if(cppAttribute.unnamedSequenceType != null){
			fireAllCurrent(cppSequenceImplementationRule, [it.cppSequence == cppAttribute.unnamedSequenceType])
		}
		addIncludes(cppAttribute)
	].build
	
	@Accessors(PUBLIC_GETTER)
	val cppSequenceTypeRule = createRule.precondition(cppSequenceType).action[
		cppSequence.elementType = ooplType
		trace('''Set CPPSequence type of «typedElement.name» to «ooplType.commonType.name»''')
	].build
	
	@Accessors(PUBLIC_GETTER)
	val cppSequenceImplementationRule = createRule.precondition(cppSequenceContainerImplementation).action[
		cppSequence.implementation = containerImplementation
		trace('''Set CPPSequence implementation to «containerImplementation.containerQualifiedName»''')
	].build
	
	@Accessors(PUBLIC_GETTER)
	val entityOperationRule = createRule.precondition(cppEntityOperations).action[ match |
		val cppElement = match.cppElement
		val operation = match.operation
		val cppOperation = createCPPOperation => [
			commonOperation = operation
			ooplNameProvider = createOOPLExistingNameProvider => [ commonNamedElement = operation ]
		]
		cppElement.subElements += cppOperation
		operation.parameters.forEach[ param |
			val cppFormalParameter = createCPPFormalParameter => [
				commonParameter = param
				ooplNameProvider = createOOPLExistingNameProvider => [ commonNamedElement = param ]
				if(param.multiValue){
					unnamedSequenceType = generateCPPSequence(param)
				}
			]
			cppOperation.subElements += cppFormalParameter
			fireAllCurrent(cppSequenceTypeRule, [it.cppElement == cppFormalParameter])
			addIncludes(cppFormalParameter)
		]
		trace('''Mapped Operation «operation.name» in entity «match.xtEntity.name» to CPPOperation''')
	].build
	
	def addIncludes(CPPQualifiedNamedElement cppElement) {
		fireAllCurrent(sequenceIncludeRule, [it.cppElement == cppElement])
	}
	
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