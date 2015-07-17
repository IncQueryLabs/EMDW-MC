package com.incquerylabs.emdw.cpp.transformation.rules

import com.ericsson.xtumlrt.oopl.OoplFactory
import com.ericsson.xtumlrt.oopl.cppmodel.CPPClass
import com.ericsson.xtumlrt.oopl.cppmodel.CPPDirectory
import com.ericsson.xtumlrt.oopl.cppmodel.CppmodelFactory
import com.incquerylabs.emdw.cpp.transformation.queries.XtumlQueries
import org.apache.log4j.Logger
import org.eclipse.papyrusrt.xtumlrt.xtuml.XTClass
import org.eclipse.viatra.emf.runtime.rules.BatchTransformationRuleGroup
import org.eclipse.viatra.emf.runtime.rules.batch.BatchTransformationRuleFactory
import org.eclipse.viatra.emf.runtime.rules.batch.BatchTransformationStatements
import org.eclipse.viatra.emf.runtime.transformation.batch.BatchTransformation
import org.eclipse.xtend.lib.annotations.Accessors
import com.ericsson.xtumlrt.oopl.SimpleCollectionKind
import com.ericsson.xtumlrt.oopl.cppmodel.CPPQualifiedNamedElement

class ClassRules {
	static extension val XtumlQueries xtUmlQueries = XtumlQueries.instance
	
	extension val Logger logger = Logger.getLogger(class)
	extension val BatchTransformationRuleFactory factory = new BatchTransformationRuleFactory
	extension val CppmodelFactory cppFactory = CppmodelFactory.eINSTANCE
	extension val OoplFactory ooplFactory = OoplFactory.eINSTANCE
	extension val BatchTransformationStatements statements
	
	val AssociationRules associationRules
	val AttributeRules attributeRules
	val OperationRules operationRules
	extension val IncludeRules includeRules
	
	new(BatchTransformationStatements statements,
		AssociationRules associationRules,
		AttributeRules attributeRules,
		OperationRules operationRules,
		IncludeRules includeRules
	) {
		this.statements = statements
		this.associationRules = associationRules
		this.attributeRules = attributeRules
		this.operationRules = operationRules
		this.includeRules = includeRules
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
		val cppComponent = match.cppComponent
		val bodyDir = cppComponent.bodyDirectory
		val headerDir = cppComponent.headerDirectory
		val cppClass = createCppClass(xtCls, headerDir, bodyDir)
		cppComponent.subElements += cppClass
		trace('''Mapped Class «xtCls.name» in component «match.xtComponent.name» to CPPClass''')
		addIncludes(cppClass)
		transformSubElements(cppClass)
	].build	
	
	@Accessors(PUBLIC_GETTER)
	val classInPackageRule = createRule.precondition(cppPackageClasses).action[ match |
		val xtCls = match.xtClass
		val cppPackage = match.cppPackage
		val bodyDir = cppPackage.bodyDir
		val headerDir = cppPackage.headerDir
		val cppClass = createCppClass(xtCls, headerDir, bodyDir)
		cppPackage.subElements += cppClass
		trace('''Mapped Class «xtCls.name» in package «match.xtPackage.name» to CPPClass''')
		addIncludes(cppClass)
		transformSubElements(cppClass)
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
	val eventRule = createRule.precondition(cppClassEvents).action[ match |
		val event = match.event
		val cppEvent = createCPPEvent => [
			xtEvent = event
			ooplNameProvider = createOOPLExistingNameProvider => [ commonNamedElement = event ]
		]
		match.cppClass.subElements += cppEvent
		trace('''Mapped XTEvent «event.name» in state machine of «match.xtClass.name» to CPPEvent''')
		fireAllCurrent(attributeRules.classEventAttributeRule, [it.cppEvent == cppEvent])
	].build
	
	def createCppClass(XTClass xtClass, CPPDirectory headerDir, CPPDirectory bodyDir){
		val cppClass = createCPPClass => [
			it.xtClass = xtClass
			bodyFile = createCPPBodyFile
			bodyDir.files += bodyFile
			
			headerFile = createCPPHeaderFile
			headerDir.files += headerFile
			
			ooplNameProvider = createOOPLExistingNameProvider => [ commonNamedElement = xtClass ]
			
		]
		val cppClassRef =  createCPPClassRefSimpleCollection => [
			it.commonType = xtClass
			it.ooplClass = cppClass
			it.kind = SimpleCollectionKind.SIMPLY_LINKED_LIST
			
			it.ooplNameProvider = createOOPLExistingNameProvider => [ it.commonNamedElement = xtClass ]
		]
		val instanceReferences = createCPPClassReferenceStorage => [
			it.type = cppClassRef
			it.subElements += it.type as CPPQualifiedNamedElement
			
			it.ooplNameProvider = createOOPLDerivedNameProvider => [ it.name = "_instances" ]
		]
		cppClass.referenceStorage += instanceReferences
		cppClass.subElements += instanceReferences
		return cppClass
	}
	
	def addIncludes(CPPClass cppClass){
		cppClass.addIncludesBetweenOwnFiles
		fireAllCurrent(includeRules.classComponentIncludeRule, [it.cppClass == cppClass])
		
		// TODO: some of these should be generated based on action code
		// External includes for model independent generated code
		fireAllCurrent(includeRules.statemachineRuntimeIncludeRule, [it.cppClass == cppClass])
		
		val listExternalHeader = includeRules.getExternalHeader("<list>")
		cppClass.headerFile.addInclude(listExternalHeader, "_instances")
		val queueExternalHeader = includeRules.getExternalHeader("<queue>")
		cppClass.headerFile.addInclude(queueExternalHeader, "event queues")
		val iostreamExternalHeader = includeRules.getExternalHeader("<iostream>")
		cppClass.headerFile.addInclude(iostreamExternalHeader, "standard io")
		
	}

	def transformSubElements(CPPClass cppClass){
		// Association rules only have matches if both source and target CPPClasses are already created
		// After the creation of the second CPPClass both directions of the association have to be added
		fireAllCurrent(associationRules.associationRule, [it.cppClass == cppClass])
		fireAllCurrent(associationRules.associationRule, [it.cppTargetClass == cppClass])
		fireAllCurrent(associationRules.classReferenceSimpleCollectionTypeRule4Instances, [it.cppClass == cppClass])
		fireAllCurrent(attributeRules.entityAttributeRule, [it.cppElement == cppClass])
		fireAllCurrent(operationRules.entityOperationRule, [it.cppElement == cppClass])
		fireAllCurrent(stateRule, [it.cppClass == cppClass])
		fireAllCurrent(transitionRule, [it.cppClass == cppClass])
		fireAllCurrent(eventRule, [it.cppClass == cppClass])
	}
}