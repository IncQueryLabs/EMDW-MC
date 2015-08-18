package com.incquerylabs.emdw.cpp.transformation.rules

import com.ericsson.xtumlrt.oopl.OoplFactory
import com.ericsson.xtumlrt.oopl.cppmodel.CPPFormalParameter
import com.ericsson.xtumlrt.oopl.cppmodel.CPPQualifiedNamedElement
import com.ericsson.xtumlrt.oopl.cppmodel.CppmodelFactory
import com.incquerylabs.emdw.cpp.transformation.queries.CppQueries
import com.incquerylabs.emdw.cpp.transformation.queries.XtumlQueries
import com.incquerylabs.emdw.cpp.transformation.util.CPPTransformationUtil
import org.apache.log4j.Logger
import org.eclipse.incquery.runtime.api.IncQueryEngine
import org.eclipse.papyrusrt.xtumlrt.common.Parameter
import org.eclipse.papyrusrt.xtumlrt.xtuml.XTClass
import org.eclipse.viatra.emf.runtime.rules.BatchTransformationRuleGroup
import org.eclipse.viatra.emf.runtime.rules.batch.BatchTransformationRuleFactory
import org.eclipse.viatra.emf.runtime.rules.batch.BatchTransformationStatements
import org.eclipse.viatra.emf.runtime.transformation.batch.BatchTransformation
import org.eclipse.xtend.lib.annotations.Accessors
import com.ericsson.xtumlrt.oopl.cppmodel.CPPParameterPassingKind
import org.eclipse.papyrusrt.xtumlrt.common.DirectionKind

class FormalParameterRules {
	static extension val XtumlQueries xtUmlQueries = XtumlQueries.instance
	static extension val CppQueries cppQueries = CppQueries.instance
	
	extension val Logger logger = Logger.getLogger(class)
	extension val IncQueryEngine engine
	extension val BatchTransformationRuleFactory factory = new BatchTransformationRuleFactory
	extension val CPPTransformationUtil transformationUtil = new CPPTransformationUtil
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
			fireAllCurrent(classReferenceSimpleCollectionTypeRule, [it.classReferenceSimpleCollection == classReference])
		} else if(parameter.multiValue){
			setSequence(cppFormalParameter, parameter)
		}
		
		cppFormalParameter.setPassingKind(parameter)
		
		trace('''Mapped Parameter «parameter.name» in Operation «match.operation.name» to CPPFormalParameter''')
	].build
	
	@Accessors(PUBLIC_GETTER)
	val addReferencesRule = createRule.precondition(cppFormalParameterClassReference).action[ match |
		val classReference = match.classReference
		addIncludes(match.cppFormalParameter)
		fireAllCurrent(classReferenceRules.addReferencesRule, [it.cppClassReference == classReference])
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
	
	def setPassingKind(CPPFormalParameter cppFormalParameter, Parameter parameter) {
		if (parameter.type instanceof XTClass && !parameter.multiValue) {
			cppFormalParameter.passingMode = CPPParameterPassingKind.BY_REFERENCE
		} else {
			switch parameter.direction {
				case DirectionKind.IN : cppFormalParameter.passingMode = CPPParameterPassingKind.BY_VALUE
				case DirectionKind.OUT : cppFormalParameter.passingMode = CPPParameterPassingKind.BY_REFERENCE
				case DirectionKind.IN_OUT : cppFormalParameter.passingMode = CPPParameterPassingKind.BY_REFERENCE
			}
		}
		return;
	}
	
}