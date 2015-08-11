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
import com.ericsson.xtumlrt.oopl.cppmodel.CPPFormalParameter
import org.eclipse.papyrusrt.xtumlrt.common.Parameter

class FormalParameterRules {
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
			operationParameterRule
		)
		transformation.addRules(rules)
	}
	
	@Accessors(PUBLIC_GETTER)
	val operationParameterRule = createRule.precondition(cppOperationParameter).action[ match |
		val cppOperation = match.cppOperation
		val parameter = match.parameter
		
		val cppFormalParameter = createCPPFormalParameter => [
			commonParameter = parameter
			ooplNameProvider = createOOPLExistingNameProvider => [ commonNamedElement = parameter ]
		]
		cppOperation.subElements += cppFormalParameter
		
		if(parameter.multiValue){
			setSequence(cppFormalParameter, parameter)
		}
		addIncludes(cppFormalParameter)
		trace('''Mapped Parameter «parameter.name» in Operation «match.operation.name» to CPPFormalParameter''')
	].build
	
	def setSequence(CPPFormalParameter cppFormalParameter, Parameter parameter) {
		cppFormalParameter.unnamedSequenceType = generateCPPSequence(parameter)
		fireAllCurrent(cppSequenceTypeRule, [it.cppElement == cppFormalParameter])
		if(cppFormalParameter.unnamedSequenceType != null) {
			fireAllCurrent(cppSequenceImplementationRule, [it.cppSequence == cppFormalParameter.unnamedSequenceType])
		}
	}
	
	def addIncludes(CPPQualifiedNamedElement cppElement) {
		fireAllCurrent(sequenceIncludeRule, [it.cppElement == cppElement])
	}
}