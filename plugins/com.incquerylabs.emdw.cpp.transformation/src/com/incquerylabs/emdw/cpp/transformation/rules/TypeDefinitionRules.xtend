package com.incquerylabs.emdw.cpp.transformation.rules

import com.ericsson.xtumlrt.oopl.OoplFactory
import com.ericsson.xtumlrt.oopl.cppmodel.CppmodelFactory
import com.incquerylabs.emdw.cpp.transformation.queries.XtumlQueries
import org.apache.log4j.Logger
import org.eclipse.viatra.emf.runtime.rules.BatchTransformationRuleGroup
import org.eclipse.viatra.emf.runtime.rules.batch.BatchTransformationRuleFactory
import org.eclipse.viatra.emf.runtime.rules.batch.BatchTransformationStatements
import org.eclipse.viatra.emf.runtime.transformation.batch.BatchTransformation
import org.eclipse.xtend.lib.annotations.Accessors

class TypeDefinitionRules {
	
	static extension val XtumlQueries xtUmlQueries = XtumlQueries.instance
	
	extension val Logger logger = Logger.getLogger(class)
	extension val BatchTransformationRuleFactory factory = new BatchTransformationRuleFactory
	extension val CppmodelFactory cppFactory = CppmodelFactory.eINSTANCE
	extension val OoplFactory ooplFactory = OoplFactory.eINSTANCE
	extension val BatchTransformationStatements statements
	
	new(BatchTransformationStatements statements) {
		this.statements = statements
	}
	
	def addRules(BatchTransformation transformation){
		val rules = new BatchTransformationRuleGroup(
			cppEnumTypeRule,
			cppStructTypeRule,
			cppStructMemberRule,
			cppBasicTypeRule
		)
		transformation.addRules(rules)
	}
	
	@Accessors(PUBLIC_GETTER)
	val cppEnumTypeRule = createRule.precondition(enumeration).action[ match |
		val cppContainer = match.cppContainer
		val xtEnumeration = match.enumeration
		val cppEnumType = createCPPEnumType => [
			it.commonType = xtEnumeration
			it.ooplNameProvider = createOOPLExistingNameProvider => [
				commonNamedElement = xtEnumeration
			]
		]
		cppContainer.subElements += cppEnumType
		trace('''Mapped Enumeration «xtEnumeration.name» to CPPEnumType «cppEnumType»''')
	].build
	
	@Accessors(PUBLIC_GETTER)
	val cppStructTypeRule = createRule.precondition(structuredType).action[ match |
		val cppContainer = match.cppContainer
		val xtStructuredType = match.structuredType
		val cppStructType = createCPPStructType => [
			it.commonType = xtStructuredType
			it.ooplNameProvider = createOOPLExistingNameProvider => [
				commonNamedElement = xtStructuredType
			]
		]
		cppContainer.subElements += cppStructType
		trace('''Mapped StructuredType «xtStructuredType.name» to CPPStructType «cppStructType»''')
		fireAllCurrent(cppStructMemberRule, [it.cppStructType == cppStructType])
	].build
	
	@Accessors(PUBLIC_GETTER)
	val cppStructMemberRule = createRule.precondition(structMember).action[ match |
		val cppStructType = match.cppStructType
		val xtAttribute = match.attribute
		val cppStructMember = createCPPStructMember => [
			it.commonMember = xtAttribute
			it.ooplNameProvider = createOOPLExistingNameProvider => [
				commonNamedElement = xtAttribute
			]
		]
		cppStructType.subElements += cppStructMember
		cppStructType.members += cppStructMember
		trace('''Mapped Attribute «xtAttribute.name» to CPPStructMember «cppStructMember»''')
	].build
	
	@Accessors(PUBLIC_GETTER)
	val cppBasicTypeRule = createRule.precondition(primitiveType).action[ match |
		val cppContainer = match.cppContainer
		val xtPrimitiveType = match.primitiveType
		val cppBasicType = createCPPBasicType => [
			it.commonType = xtPrimitiveType
			it.ooplNameProvider = createOOPLExistingNameProvider => [
				commonNamedElement = xtPrimitiveType
			]
		]
		cppContainer.subElements += cppBasicType
		trace('''Mapped PrimitiveType «xtPrimitiveType.name» to CPPBasicType «cppBasicType»''')
	].build
}