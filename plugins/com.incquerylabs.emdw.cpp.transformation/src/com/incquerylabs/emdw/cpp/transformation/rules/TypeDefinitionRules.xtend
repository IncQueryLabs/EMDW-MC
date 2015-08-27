package com.incquerylabs.emdw.cpp.transformation.rules

import com.ericsson.xtumlrt.oopl.OoplFactory
import com.ericsson.xtumlrt.oopl.cppmodel.CPPStructMember
import com.ericsson.xtumlrt.oopl.cppmodel.CppmodelFactory
import com.incquerylabs.emdw.cpp.transformation.queries.CppQueries
import com.incquerylabs.emdw.cpp.transformation.queries.XtumlQueries
import com.incquerylabs.emdw.cpp.transformation.util.CPPTransformationUtil
import org.apache.log4j.Logger
import org.eclipse.papyrusrt.xtumlrt.common.Attribute
import org.eclipse.viatra.emf.runtime.rules.BatchTransformationRuleGroup
import org.eclipse.viatra.emf.runtime.rules.batch.BatchTransformationRuleFactory
import org.eclipse.viatra.emf.runtime.rules.batch.BatchTransformationStatements
import org.eclipse.viatra.emf.runtime.transformation.batch.BatchTransformation
import org.eclipse.xtend.lib.annotations.Accessors

class TypeDefinitionRules {
	
	static extension val XtumlQueries xtUmlQueries = XtumlQueries.instance
	static extension val CppQueries cppQueries = CppQueries.instance
	
	extension val Logger logger = Logger.getLogger(class)
	extension val BatchTransformationRuleFactory factory = new BatchTransformationRuleFactory
	extension val CPPTransformationUtil transformationUtil = new CPPTransformationUtil
	extension val CppmodelFactory cppFactory = CppmodelFactory.eINSTANCE
	extension val OoplFactory ooplFactory = OoplFactory.eINSTANCE
	extension val BatchTransformationStatements statements
	
	extension val IncludeRules includeRules
	extension val SequenceRules sequenceRules
	
	new(BatchTransformationStatements statements, IncludeRules includeRules, SequenceRules sequenceRules) {
		this.statements = statements
		this.includeRules = includeRules
		this.sequenceRules = sequenceRules
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
		fireAllCurrent(cppEnumeratorRule, [it.cppEnumType == cppEnumType])
	].build
	
	@Accessors(PUBLIC_GETTER)
	val cppEnumeratorRule = createRule.precondition(enumerator).action[ match |
		val cppEnumType = match.cppEnumType
		val xtEnumerationLiteral = match.enumerationLiteral
		val cppEnumerator = createCPPEnumerator => [
			it.commonEnumerationLiteral = xtEnumerationLiteral
			it.ooplNameProvider = createOOPLExistingNameProvider => [
				commonNamedElement = xtEnumerationLiteral
			]
		]
		cppEnumType.subElements += cppEnumerator
		trace('''Mapped EnumerationLiteral «xtEnumerationLiteral.name» to CPPEnumerator «cppEnumerator»''')
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
		
		if(xtAttribute.multiValue){
			addUnnamedSequence(cppStructMember, xtAttribute)
		}
		
		trace('''Mapped Attribute «xtAttribute.name» to CPPStructMember «cppStructMember»''')
	].build
	
	@Accessors(PUBLIC_GETTER)
	val addReferencesRule = createRule.precondition(cppStructMemberInQualifiedNamedElement).action[ match |
		val cppStructMember = match.cppStructMember
		cppStructMember.addSequenceReferences
		addIncludes(cppStructMember)
	].build
	
	def addUnnamedSequence(CPPStructMember cppStructMember, Attribute xtStructMember) {
		cppStructMember.unnamedSequenceType = generateCPPSequence(xtStructMember)
	}
	
	def addSequenceReferences(CPPStructMember cppStructMember) {
		if(cppStructMember.unnamedSequenceType != null) {
			fireAllCurrent(cppSequenceTypeRule, [it.cppElement == cppStructMember])
			fireAllCurrent(cppSequenceImplementationRule, [it.cppSequence == cppStructMember.unnamedSequenceType])
		}
	}
	
	def addIncludes(CPPStructMember cppStructMember) {
		fireAllCurrent(includeForStructMembersRule, [it.cppStructMember == cppStructMember])
	}
	
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