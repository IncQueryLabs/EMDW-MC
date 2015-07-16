package com.incquerylabs.emdw.cpp.transformation.rules

import com.ericsson.xtumlrt.oopl.OoplFactory
import com.ericsson.xtumlrt.oopl.cppmodel.CPPQualifiedNamedElement
import com.ericsson.xtumlrt.oopl.cppmodel.CppmodelFactory
import com.incquerylabs.emdw.cpp.transformation.queries.XtumlQueries
import org.apache.log4j.Logger
import org.eclipse.viatra.emf.runtime.rules.BatchTransformationRuleGroup
import org.eclipse.viatra.emf.runtime.rules.batch.BatchTransformationRuleFactory
import org.eclipse.viatra.emf.runtime.rules.batch.BatchTransformationStatements
import org.eclipse.viatra.emf.runtime.transformation.batch.BatchTransformation
import org.eclipse.xtend.lib.annotations.Accessors

class OperationRules {
	static extension val XtumlQueries xtUmlQueries = XtumlQueries.instance
	
	extension val Logger logger = Logger.getLogger(class)
	extension val BatchTransformationRuleFactory factory = new BatchTransformationRuleFactory
	extension val CppmodelFactory cppFactory = CppmodelFactory.eINSTANCE
	extension val OoplFactory ooplFactory = OoplFactory.eINSTANCE
	extension val BatchTransformationStatements statements
	extension val SequenceRules sequenceRules
	extension val IncludeRules includeRules
	
	new(BatchTransformationStatements statements, SequenceRules sequenceRules, IncludeRules includeRules) {
		this.statements = statements
		this.sequenceRules = sequenceRules
		this.includeRules = includeRules
	}
	
	def addRules(BatchTransformation transformation){
		val rules = new BatchTransformationRuleGroup(
			entityOperationRule
		)
		transformation.addRules(rules)
	}
	
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
			if(cppFormalParameter.unnamedSequenceType != null){
				fireAllCurrent(cppSequenceImplementationRule, [it.cppSequence == cppFormalParameter.unnamedSequenceType])
			}
			addIncludes(cppFormalParameter)
		]
		trace('''Mapped Operation «operation.name» in entity «match.xtEntity.name» to CPPOperation''')
	].build
	
	def addIncludes(CPPQualifiedNamedElement cppElement) {
		fireAllCurrent(sequenceIncludeRule, [it.cppElement == cppElement])
	}
}