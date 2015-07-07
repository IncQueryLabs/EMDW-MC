package com.incquerylabs.emdw.cpp.transformation.rules

import com.ericsson.xtumlrt.oopl.OOPLType
import com.ericsson.xtumlrt.oopl.OoplFactory
import com.ericsson.xtumlrt.oopl.cppmodel.CPPQualifiedNamedElement
import com.ericsson.xtumlrt.oopl.cppmodel.CppmodelFactory
import com.incquerylabs.emdw.cpp.transformation.queries.XtumlQueries
import org.apache.log4j.Logger
import org.eclipse.viatra.emf.runtime.rules.BatchTransformationRuleGroup
import org.eclipse.viatra.emf.runtime.rules.batch.BatchTransformationRuleFactory
import org.eclipse.viatra.emf.runtime.transformation.batch.BatchTransformation
import org.eclipse.xtend.lib.annotations.Accessors

class AssociationRules {
	static extension val XtumlQueries xtUmlQueries = XtumlQueries.instance
	
	extension val Logger logger = Logger.getLogger(class)
	extension val BatchTransformationRuleFactory factory = new BatchTransformationRuleFactory
	extension val CppmodelFactory cppFactory = CppmodelFactory.eINSTANCE
	extension val OoplFactory ooplFactory = OoplFactory.eINSTANCE
	
	def addRules(BatchTransformation transformation){
		val rules = new BatchTransformationRuleGroup(
			associationRule
		)
		transformation.addRules(rules)
	}
	
	@Accessors(PUBLIC_GETTER)
	val associationRule = createRule.precondition(cppClassAssociations).action[ match |
		val xtClass = match.xtClass
		val xtAssoc = match.association
		
		val xtTargetClass = xtAssoc.target
		val cppTargetClass = match.cppTargetClass
		
		var OOPLType referenceType
		if (xtAssoc.upperBound != 1){
			referenceType = createCPPClassRefSimpleCollection => [
				it.commonType = xtTargetClass
				it.ooplClass = cppTargetClass
				it.ooplNameProvider = createOOPLExistingNameProvider =>[
					commonNamedElement = xtTargetClass
				]
			]
		} else {
			referenceType = createCPPClassReference => [
				it.commonType = xtTargetClass
				it.ooplClass = cppTargetClass
				it.ooplNameProvider = createOOPLExistingNameProvider =>[
					commonNamedElement = xtTargetClass
				]
			]	
		}
		
		val cppClassReference = referenceType
		
		val cppReferenceStorage = createCPPClassReferenceStorage => [
			it.type = cppClassReference
			it.ooplNameProvider = createOOPLExistingNameProvider => [
				commonNamedElement = xtAssoc
			]
			it.subElements += cppClassReference as CPPQualifiedNamedElement
		]
		
		val cppRelation = createCPPRelation => [
			it.xtRelation = xtAssoc
			it.referenceStorage += cppReferenceStorage
			it.subElements += cppReferenceStorage
			it.ooplNameProvider = createOOPLExistingNameProvider =>[
				commonNamedElement = xtAssoc
			]
		]
		
		match.cppClass.referenceStorage += cppReferenceStorage
		match.cppClass.subElements += cppRelation
		trace('''Mapped Association «xtAssoc.name» in Class «xtClass.name» to CPPRelation''')
	].build
}