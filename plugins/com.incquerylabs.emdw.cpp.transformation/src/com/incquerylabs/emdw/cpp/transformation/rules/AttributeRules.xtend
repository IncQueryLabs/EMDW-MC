package com.incquerylabs.emdw.cpp.transformation.rules

import com.ericsson.xtumlrt.oopl.OoplFactory
import com.ericsson.xtumlrt.oopl.cppmodel.CPPQualifiedNamedElement
import com.ericsson.xtumlrt.oopl.cppmodel.CppmodelFactory
import com.incquerylabs.emdw.cpp.transformation.queries.XtumlQueries
import org.apache.log4j.Logger
import org.eclipse.papyrusrt.xtumlrt.common.Attribute
import org.eclipse.viatra.emf.runtime.rules.BatchTransformationRuleGroup
import org.eclipse.viatra.emf.runtime.rules.batch.BatchTransformationRuleFactory
import org.eclipse.viatra.emf.runtime.rules.batch.BatchTransformationStatements
import org.eclipse.viatra.emf.runtime.transformation.batch.BatchTransformation
import org.eclipse.xtend.lib.annotations.Accessors

class AttributeRules {
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
			entityAttributeRule,
			classEventAttributeRule
		)
		transformation.addRules(rules)
	}
	
	@Accessors(PUBLIC_GETTER)
	val entityAttributeRule = createRule.precondition(cppEntityAttributes).action[ match |
		val cppElement = match.cppElement
		val attribute = match.attribute
		val cppAttribute = cppElement.createCppAttribute(attribute)
		trace('''Mapped Attribute «attribute.name» in entity «match.xtEntity.name» to CPPAttribute''')
		addIncludes(cppAttribute)
	].build
	
	@Accessors(PUBLIC_GETTER)
	val classEventAttributeRule = createRule.precondition(cppEventAttributes).action[ match |
		val cppEvent = match.cppEvent
		val attribute = match.attribute
		val cppAttribute = cppEvent.createCppAttribute(attribute)
		trace('''Mapped Attribute «attribute.name» in class event «match.xtClassEvent.name» to CPPAttribute''')
		addIncludes(cppAttribute)
	].build
	
	def createCppAttribute(CPPQualifiedNamedElement cppElement, Attribute xtAttribute){
		val cppAttribute = createCPPAttribute
		cppElement.subElements += cppAttribute
		cppAttribute => [
			commonAttribute = xtAttribute
			ooplNameProvider = createOOPLExistingNameProvider => [ commonNamedElement = xtAttribute ]
			if(xtAttribute.multiValue){
				unnamedSequenceType = generateCPPSequence(xtAttribute)
			}
		]
		fireAllCurrent(cppSequenceTypeRule, [it.cppElement == cppAttribute])
		if(cppAttribute.unnamedSequenceType != null){
			fireAllCurrent(cppSequenceImplementationRule, [it.cppSequence == cppAttribute.unnamedSequenceType])
		}
		cppAttribute
	}
	
	def addIncludes(CPPQualifiedNamedElement cppElement) {
		fireAllCurrent(sequenceIncludeRule, [it.cppElement == cppElement])
	}
}