package com.incquerylabs.emdw.cpp.transformation.rules

import com.ericsson.xtumlrt.oopl.OoplFactory
import com.ericsson.xtumlrt.oopl.cppmodel.CppmodelFactory
import com.incquerylabs.emdw.cpp.transformation.queries.XtumlQueries
import org.apache.log4j.Logger
import org.eclipse.viatra.emf.runtime.rules.BatchTransformationRuleGroup
import org.eclipse.viatra.emf.runtime.rules.batch.BatchTransformationRuleFactory
import org.eclipse.viatra.emf.runtime.transformation.batch.BatchTransformation
import org.eclipse.xtend.lib.annotations.Accessors

class TypeDefinitionRules {
	static extension val XtumlQueries xtUmlQueries = XtumlQueries.instance
	
	extension val Logger logger = Logger.getLogger(class)
	extension val BatchTransformationRuleFactory factory = new BatchTransformationRuleFactory
	extension val CppmodelFactory cppFactory = CppmodelFactory.eINSTANCE
	extension val OoplFactory ooplFactory = OoplFactory.eINSTANCE
	
	def addRules(BatchTransformation transformation){
		val rules = new BatchTransformationRuleGroup(
			cppStructTypeRule,
			cppBasicTypeRule
		)
		transformation.addRules(rules)
	}
	
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