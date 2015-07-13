package com.incquerylabs.emdw.cpp.transformation.rules

import com.ericsson.xtumlrt.oopl.OOPLType
import com.ericsson.xtumlrt.oopl.OoplFactory
import com.ericsson.xtumlrt.oopl.cppmodel.CPPClass
import com.ericsson.xtumlrt.oopl.cppmodel.CPPClassReferenceStorage
import com.ericsson.xtumlrt.oopl.cppmodel.CPPQualifiedNamedElement
import com.ericsson.xtumlrt.oopl.cppmodel.CppmodelFactory
import com.incquerylabs.emdw.cpp.transformation.queries.XtumlQueries
import org.apache.log4j.Logger
import org.eclipse.papyrusrt.xtumlrt.xtuml.XTAssociation
import org.eclipse.viatra.emf.runtime.rules.BatchTransformationRuleGroup
import org.eclipse.viatra.emf.runtime.rules.batch.BatchTransformationRuleFactory
import org.eclipse.viatra.emf.runtime.rules.batch.BatchTransformationStatements
import org.eclipse.viatra.emf.runtime.transformation.batch.BatchTransformation
import org.eclipse.xtend.lib.annotations.Accessors

class AssociationRules {
	static extension val XtumlQueries xtUmlQueries = XtumlQueries.instance
	
	extension val Logger logger = Logger.getLogger(class)
	extension val BatchTransformationRuleFactory factory = new BatchTransformationRuleFactory
	extension val CppmodelFactory cppFactory = CppmodelFactory.eINSTANCE
	extension val OoplFactory ooplFactory = OoplFactory.eINSTANCE
	extension val BatchTransformationStatements statements
	extension val IncludeRules includeRules
	
	new(BatchTransformationStatements statements, IncludeRules includeRules) {
		this.statements = statements
		this.includeRules = includeRules
	}
	
	def addRules(BatchTransformation transformation){
		val rules = new BatchTransformationRuleGroup(
			associationRule
		)
		transformation.addRules(rules)
	}
	
	@Accessors(PUBLIC_GETTER)
	val associationRule = createRule.precondition(cppClassAssociations).action[ match |
		val xtClass = match.xtClass
		val cppClass = match.cppClass
		val xtAssociation = match.association
		val cppTargetClass = match.cppTargetClass
		
		val cppClassReference = createClassReference(cppTargetClass, xtAssociation)
		val cppReferenceStorage = createReferenceStorage(cppClassReference, xtAssociation)
		val cppRelation = createRelation(cppReferenceStorage, xtAssociation)
		
		cppClass.referenceStorage += cppReferenceStorage
		cppClass.subElements += cppRelation
		trace('''Mapped Association «xtAssociation.name» in Class «xtClass.name» to CPPRelation''')
		addIncludesForClassReference(cppClass, cppTargetClass, cppClassReference)
	].build
	
	def createClassReference(CPPClass cppTargetClass, XTAssociation xtAssociation){
		val xtTargetClass = xtAssociation.target
		var OOPLType referenceType
		if (xtAssociation.upperBound != 1){
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
		return referenceType
	}
	
	def createReferenceStorage(OOPLType cppClassReference, XTAssociation xtAssociation){
		createCPPClassReferenceStorage => [
			it.type = cppClassReference
			it.ooplNameProvider = createOOPLExistingNameProvider => [
				commonNamedElement = xtAssociation
			]
			it.subElements += cppClassReference as CPPQualifiedNamedElement
		]
	}
	
	def createRelation(CPPClassReferenceStorage cppReferenceStorage, XTAssociation xtAssociation){
		createCPPRelation => [
			it.xtRelation = xtAssociation
			it.referenceStorage += cppReferenceStorage
			it.subElements += cppReferenceStorage
			it.ooplNameProvider = createOOPLExistingNameProvider =>[
				commonNamedElement = xtAssociation
			]
		]
	}
}