package com.incquerylabs.emdw.cpp.transformation.rules

import com.ericsson.xtumlrt.oopl.SequenceOrderednessKind
import com.ericsson.xtumlrt.oopl.SequenceUniquenessKind
import com.ericsson.xtumlrt.oopl.cppmodel.CppmodelFactory
import com.incquerylabs.emdw.cpp.transformation.queries.CppQueries
import com.incquerylabs.emdw.cpp.transformation.queries.XtumlQueries
import org.apache.log4j.Logger
import org.eclipse.papyrusrt.xtumlrt.common.MultiplicityElement
import org.eclipse.viatra.emf.runtime.rules.batch.BatchTransformationRuleFactory
import org.eclipse.viatra.emf.runtime.rules.batch.BatchTransformationStatements
import org.eclipse.xtend.lib.annotations.Accessors
import org.eclipse.viatra.emf.runtime.transformation.batch.BatchTransformation
import org.eclipse.viatra.emf.runtime.rules.BatchTransformationRuleGroup

class SequenceRules {
	static extension val XtumlQueries xtUmlQueries = XtumlQueries.instance
	static extension val CppQueries cppQueries = CppQueries.instance
	
	extension val Logger logger = Logger.getLogger(class)
	extension val BatchTransformationRuleFactory factory = new BatchTransformationRuleFactory
	extension val CppmodelFactory cppFactory = CppmodelFactory.eINSTANCE
	extension val BatchTransformationStatements statements
	
	new(BatchTransformationStatements statements) {
		this.statements = statements
	}
	
	def addRules(BatchTransformation transformation){
		val rules = new BatchTransformationRuleGroup(
			cppSequenceTypeRule,
			cppSequenceImplementationRule
		)
		transformation.addRules(rules)
	}
	
	@Accessors(PUBLIC_GETTER)
	val cppSequenceTypeRule = createRule.precondition(cppSequenceType).action[
		cppSequence.elementType = ooplType
		trace('''Set CPPSequence type of «typedElement» to «ooplType.commonType.name»''')
	].build
	
	@Accessors(PUBLIC_GETTER)
	val cppSequenceImplementationRule = createRule.precondition(cppSequenceContainerImplementation).action[
		cppSequence.implementation = containerImplementation
		trace('''Set CPPSequence implementation to «containerImplementation.containerQualifiedName»''')
	].build
	
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