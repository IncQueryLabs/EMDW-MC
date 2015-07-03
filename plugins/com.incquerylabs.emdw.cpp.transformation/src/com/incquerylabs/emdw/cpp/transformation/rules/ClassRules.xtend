package com.incquerylabs.emdw.cpp.transformation.rules

import com.ericsson.xtumlrt.oopl.OoplFactory
import com.ericsson.xtumlrt.oopl.cppmodel.CppmodelFactory
import com.incquerylabs.emdw.cpp.transformation.queries.XtumlQueries
import org.apache.log4j.Logger
import org.eclipse.incquery.runtime.api.IncQueryEngine
import org.eclipse.viatra.emf.runtime.rules.BatchTransformationRuleGroup
import org.eclipse.viatra.emf.runtime.rules.batch.BatchTransformationRuleFactory
import org.eclipse.viatra.emf.runtime.rules.batch.BatchTransformationStatements
import org.eclipse.viatra.emf.runtime.transformation.batch.BatchTransformation
import org.eclipse.xtend.lib.annotations.Accessors

class ClassRules {
	static extension val XtumlQueries xtUmlQueries = XtumlQueries.instance
	
	extension val Logger logger = Logger.getLogger(class)
	extension val BatchTransformationRuleFactory factory = new BatchTransformationRuleFactory
	extension val CppmodelFactory cppFactory = CppmodelFactory.eINSTANCE
	extension val OoplFactory ooplFactory = OoplFactory.eINSTANCE
	extension val BatchTransformationStatements statements
	
	val AssociationRules associationRules
	
	val IncQueryEngine engine
	
	new(IncQueryEngine engine, BatchTransformationStatements statements, AssociationRules associationRules) {
		this.engine = engine
		this.statements = statements
		this.associationRules = associationRules
	}
	
	def addRules(BatchTransformation transformation){
		val rules = new BatchTransformationRuleGroup(
			classRule,
			classInPackageRule,
			stateRule,
			transitionRule,
			eventRule
		)
		transformation.addRules(rules)
	}
	
	@Accessors(PUBLIC_GETTER)
	val classRule = createRule.precondition(cppComponentClasses).action[ match |
		val xtCls = match.xtClass
		val bodyDir = match.cppComponent.bodyDirectory
		val headerDir = match.cppComponent.headerDirectory
		val cppClass = createCPPClass => [
			xtClass = xtCls
			bodyFile = createCPPBodyFile
			bodyDir.files += bodyFile
			
			headerFile = createCPPHeaderFile
			headerDir.files += headerFile
			
			ooplNameProvider = createOOPLExistingNameProvider => [ commonNamedElement = xtCls ]
		]
		match.cppComponent.subElements += cppClass
		trace('''Mapped Class «xtCls.name» in component «match.xtComponent.name» to CPPClass''')
		fireAllCurrent(associationRules.associationRule, [it.cppClass == cppClass])
		fireAllCurrent(associationRules.associationRule, [it.cppTargetClass == cppClass])
	].build	
	
	@Accessors(PUBLIC_GETTER)
	val classInPackageRule = createRule.precondition(cppPackageClasses).action[ match |
		val xtCls = match.xtClass
		val bodyDir = match.cppPackage.bodyDir
		val headerDir = match.cppPackage.headerDir
		val cppClass = createCPPClass => [
			xtClass = xtCls
			bodyFile = createCPPBodyFile
			bodyDir.files += bodyFile
			
			headerFile = createCPPHeaderFile
			headerDir.files += headerFile
			
			ooplNameProvider = createOOPLExistingNameProvider => [ commonNamedElement = xtCls ]
		]
		match.cppPackage.subElements += cppClass
		trace('''Mapped Class «xtCls.name» in package «match.xtPackage.name» to CPPClass''')
		fireAllCurrent(associationRules.associationRule, [it.cppClass == cppClass])
		fireAllCurrent(associationRules.associationRule, [it.cppTargetClass == cppClass])
	].build	
	
	@Accessors(PUBLIC_GETTER)
	val stateRule = createRule.precondition(cppClassStateMachineStates).action[ match |
		val state = match.state
		val cppState = createCPPState => [
			commonState = state
			ooplNameProvider = createOOPLExistingNameProvider => [ commonNamedElement = state ]
		]
		match.cppClass.subElements += cppState
		trace('''Mapped State «state.name» in state machine of «match.xtClass.name» to CPPState''')
	].build
	
	@Accessors(PUBLIC_GETTER)
	val transitionRule = createRule.precondition(cppClassStateMachineTransitions).action[ match |
		val transition = match.transition
		val cppTransition = createCPPTransition => [
			commonTransition = transition
			ooplNameProvider = createOOPLExistingNameProvider => [ commonNamedElement = transition ]
		]
		match.cppClass.subElements += cppTransition
		trace('''Mapped Transition «transition.name» in state machine of «match.xtClass.name» to CPPTransition''')
	].build
	
	@Accessors(PUBLIC_GETTER)
	val eventRule = createRule.precondition(cppClassStateMachineEvents).action[ match |
		val event = match.event
		val cppEvent = createCPPEvent => [
			xtEvent = event
			ooplNameProvider = createOOPLExistingNameProvider => [ commonNamedElement = event ]
		]
		match.cppClass.subElements += cppEvent
		trace('''Mapped XTEvent «event.name» in state machine of «match.xtClass.name» to CPPEvent''')
	].build

}