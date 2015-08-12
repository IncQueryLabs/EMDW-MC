package com.incquerylabs.emdw.cpp.transformation.rules

import com.ericsson.xtumlrt.oopl.OoplFactory
import com.ericsson.xtumlrt.oopl.cppmodel.CPPFormalParameter
import com.ericsson.xtumlrt.oopl.cppmodel.CPPQualifiedNamedElement
import com.ericsson.xtumlrt.oopl.cppmodel.CppmodelFactory
import com.incquerylabs.emdw.cpp.transformation.queries.XtumlQueries
import org.apache.log4j.Logger
import org.eclipse.incquery.runtime.api.IncQueryEngine
import org.eclipse.papyrusrt.xtumlrt.common.Parameter
import org.eclipse.papyrusrt.xtumlrt.xtuml.XTClass
import org.eclipse.viatra.emf.runtime.rules.BatchTransformationRuleGroup
import org.eclipse.viatra.emf.runtime.rules.batch.BatchTransformationRuleFactory
import org.eclipse.viatra.emf.runtime.rules.batch.BatchTransformationStatements
import org.eclipse.viatra.emf.runtime.transformation.batch.BatchTransformation
import org.eclipse.xtend.lib.annotations.Accessors

class FormalParameterRules {
	static extension val XtumlQueries xtUmlQueries = XtumlQueries.instance
	
	extension val Logger logger = Logger.getLogger(class)
	extension val IncQueryEngine engine
	extension val BatchTransformationRuleFactory factory = new BatchTransformationRuleFactory
	extension val CppmodelFactory cppFactory = CppmodelFactory.eINSTANCE
	extension val OoplFactory ooplFactory = OoplFactory.eINSTANCE
	extension val BatchTransformationStatements statements
	extension val ClassReferenceRules classReferenceRules
	extension val SequenceRules sequenceRules
	extension val IncludeRules includeRules
	
	new(IncQueryEngine engine, BatchTransformationStatements statements, ClassReferenceRules classReferenceRules, SequenceRules sequenceRules, IncludeRules includeRules) {
		this.engine = engine
		this.statements = statements
		this.classReferenceRules = classReferenceRules
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
		
		if(parameter.type instanceof XTClass) {
			val classReference = createClassReference(parameter)
			cppFormalParameter.subElements.add(classReference)
		} else if(parameter.multiValue){
			setSequence(cppFormalParameter, parameter)
		}
		
		addIncludes(cppFormalParameter)
		trace('''Mapped Parameter «parameter.name» in Operation «match.operation.name» to CPPFormalParameter''')
	].build
	
	def CPPQualifiedNamedElement createClassReference(Parameter parameter){
		val xtReferenceClass = parameter.type as XTClass
		val classReference = createClassReference(xtReferenceClass, parameter) as CPPQualifiedNamedElement
		return classReference
	}
	
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