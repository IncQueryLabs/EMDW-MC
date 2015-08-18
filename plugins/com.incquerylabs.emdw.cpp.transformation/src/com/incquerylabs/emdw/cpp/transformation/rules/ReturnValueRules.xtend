package com.incquerylabs.emdw.cpp.transformation.rules

import com.ericsson.xtumlrt.oopl.OoplFactory
import com.ericsson.xtumlrt.oopl.cppmodel.CPPQualifiedNamedElement
import com.ericsson.xtumlrt.oopl.cppmodel.CPPReturnValue
import com.ericsson.xtumlrt.oopl.cppmodel.CppmodelFactory
import com.incquerylabs.emdw.cpp.transformation.queries.CppQueries
import com.incquerylabs.emdw.cpp.transformation.queries.XtumlQueries
import com.incquerylabs.emdw.cpp.transformation.util.CPPTransformationUtil
import org.apache.log4j.Logger
import org.eclipse.papyrusrt.xtumlrt.common.TypedMultiplicityElement
import org.eclipse.papyrusrt.xtumlrt.xtuml.XTClass
import org.eclipse.viatra.emf.runtime.rules.BatchTransformationRuleGroup
import org.eclipse.viatra.emf.runtime.rules.batch.BatchTransformationRuleFactory
import org.eclipse.viatra.emf.runtime.rules.batch.BatchTransformationStatements
import org.eclipse.viatra.emf.runtime.transformation.batch.BatchTransformation
import org.eclipse.xtend.lib.annotations.Accessors

class ReturnValueRules {
	static extension val XtumlQueries xtUmlQueries = XtumlQueries.instance
	static extension val CppQueries cppQueries = CppQueries.instance
	
	extension val Logger logger = Logger.getLogger(class)
	extension val BatchTransformationRuleFactory factory = new BatchTransformationRuleFactory
	extension val CPPTransformationUtil transformationUtil = new CPPTransformationUtil
	extension val CppmodelFactory cppFactory = CppmodelFactory.eINSTANCE
	extension val OoplFactory ooplFactory = OoplFactory.eINSTANCE
	extension val BatchTransformationStatements statements
	extension val ClassReferenceRules classReferenceRules
	extension val SequenceRules sequenceRules
	extension val IncludeRules includeRules
	
	new(BatchTransformationStatements statements, ClassReferenceRules classReferenceRules, SequenceRules sequenceRules, IncludeRules includeRules) {
		this.statements = statements
		this.classReferenceRules = classReferenceRules
		this.sequenceRules = sequenceRules
		this.includeRules = includeRules
	}
	
	def addRules(BatchTransformation transformation){
		val rules = new BatchTransformationRuleGroup(
			operationReturnValueRule
		)
		transformation.addRules(rules)
	}
	
	@Accessors(PUBLIC_GETTER)
	val operationReturnValueRule = createRule.precondition(cppOperationReturnValue).action[ match |
		val xtOperation = match.operation
		val xtReturnType = match.returnType
		val cppOperation = match.cppOperation
		
		val cppReturnValue = createCPPReturnValue => [
			it.commonTypedMultiplicityElement = xtReturnType
			it.ooplNameProvider = createOOPLExistingNameProvider => [ commonNamedElement = xtOperation ]
		]
		cppOperation.subElements += cppReturnValue
		
		if(xtReturnType.type instanceof XTClass) {
			val classReference = createClassReference(xtReturnType)
			cppReturnValue.subElements.add(classReference)
			fireAllCurrent(classReferenceSimpleCollectionTypeRule, [it.classReferenceSimpleCollection == classReference])
		} else if(xtReturnType.multiValue){
			setSequence(cppReturnValue, xtReturnType)
		}
		
		trace('''Mapped return type «xtReturnType» in Operation «xtOperation.name» to CPPReturnValue «cppReturnValue»''')
	].build
	
	def setSequence(CPPReturnValue cppReturnValue, TypedMultiplicityElement returnType) {
		cppReturnValue.unnamedSequenceType = generateCPPSequence(returnType)
		fireAllCurrent(cppSequenceTypeRule, [it.cppElement == cppReturnValue])
		if(cppReturnValue.unnamedSequenceType != null) {
			fireAllCurrent(cppSequenceImplementationRule, [it.cppSequence == cppReturnValue.unnamedSequenceType])
		}
	}
	
	def CPPQualifiedNamedElement createClassReference(TypedMultiplicityElement returnType){
		val xtReferenceClass = returnType.type as XTClass
		val classReference = createClassReference(xtReferenceClass, returnType) as CPPQualifiedNamedElement
		return classReference
	}
	
		
	@Accessors(PUBLIC_GETTER)
	val addReferencesRule = createRule.precondition(cppReturnValueClassReference).action[ match |
		val classReference = match.classReference
		addIncludes(match.cppReturnValue)
		fireAllCurrent(classReferenceRules.addReferencesRule, [it.cppClassReference == classReference])
	].build
	
	def addIncludes(CPPQualifiedNamedElement cppElement) {
		fireAllCurrent(sequenceIncludeRule, [it.cppElement == cppElement])
	}
}