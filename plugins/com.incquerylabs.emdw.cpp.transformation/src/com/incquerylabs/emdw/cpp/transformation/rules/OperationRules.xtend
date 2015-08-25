package com.incquerylabs.emdw.cpp.transformation.rules

import com.ericsson.xtumlrt.oopl.OoplFactory
import com.ericsson.xtumlrt.oopl.cppmodel.CPPOperation
import com.ericsson.xtumlrt.oopl.cppmodel.CppmodelFactory
import com.incquerylabs.emdw.cpp.transformation.queries.CppQueries
import com.incquerylabs.emdw.cpp.transformation.queries.XtumlQueries
import org.apache.log4j.Logger
import org.eclipse.viatra.emf.runtime.rules.BatchTransformationRuleGroup
import org.eclipse.viatra.emf.runtime.rules.batch.BatchTransformationRuleFactory
import org.eclipse.viatra.emf.runtime.rules.batch.BatchTransformationStatements
import org.eclipse.viatra.emf.runtime.transformation.batch.BatchTransformation
import org.eclipse.xtend.lib.annotations.Accessors

class OperationRules {
	static extension val XtumlQueries xtUmlQueries = XtumlQueries.instance
	static extension val CppQueries cppQueries = CppQueries.instance
	
	extension val Logger logger = Logger.getLogger(class)
	extension val BatchTransformationRuleFactory factory = new BatchTransformationRuleFactory
	extension val CppmodelFactory cppFactory = CppmodelFactory.eINSTANCE
	extension val OoplFactory ooplFactory = OoplFactory.eINSTANCE
	extension val BatchTransformationStatements statements
	extension val FormalParameterRules formalParameterRules
	extension val ReturnValueRules returnValueRules
	
	new(BatchTransformationStatements statements, FormalParameterRules formalParameterRules, ReturnValueRules returnValueRules) {
		this.statements = statements
		this.formalParameterRules = formalParameterRules
		this.returnValueRules = returnValueRules
	}
	
	def addRules(BatchTransformation transformation){
		val rules = new BatchTransformationRuleGroup(
			entityOperationRule,
			entityDestructorRule,
			addReferencesRule
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
		
		trace('''Mapped Operation «operation.name» in entity «match.xtEntity.name» to CPPOperation''')
		transformSubElements(cppOperation)
	].build
	
	@Accessors(PUBLIC_GETTER)
	val entityDestructorRule = createRule.precondition(cppEntityDestructor).action[ match |
		val cppElement = match.cppElement
		val operation = match.operation
		val cppOperation = createCPPOperation => [
			commonOperation = operation
			ooplNameProvider = createOOPLDerivedNameProvider => [ name = '''~«cppElement.cppName»''' ]
		]
		cppElement.subElements += cppOperation
		
		trace('''Mapped Destructor «operation.name» in entity «match.xtEntity.name» to CPPOperation''')
		transformSubElements(cppOperation)
	].build
	
	def transformSubElements(CPPOperation cppOperation){
		// fire operation parameter activations in order
		cppOperation.commonOperation.parameters.forEach[parameter | 
			fireAllCurrent(operationParameterRule, [it.cppOperation == cppOperation && it.parameter == parameter])
		]
		fireAllCurrent(operationReturnValueRule, [it.cppOperation == cppOperation])
	}
	
	@Accessors(PUBLIC_GETTER)
	val addReferencesRule = createRule.precondition(cppOperationInQualifiedNamedElement).action[ match |
		val cppOperation = match.cppOperation
		fireAllCurrent(formalParameterRules.addReferencesRule, [it.cppOperation == cppOperation])
		fireAllCurrent(returnValueRules.addReferencesRule, [it.cppOperation == cppOperation])
	].build
}