package com.incquerylabs.emdw.cpp.transformation.rules

import com.ericsson.xtumlrt.oopl.OOPLDataType
import com.ericsson.xtumlrt.oopl.OoplFactory
import com.ericsson.xtumlrt.oopl.cppmodel.CPPClassReferenceStorage
import com.ericsson.xtumlrt.oopl.cppmodel.CPPQualifiedNamedElement
import com.ericsson.xtumlrt.oopl.cppmodel.CppmodelFactory
import com.incquerylabs.emdw.cpp.transformation.queries.CppQueries
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
	static extension val CppQueries cppQueries = CppQueries.instance
	
	extension val Logger logger = Logger.getLogger(class)
	extension val BatchTransformationRuleFactory factory = new BatchTransformationRuleFactory
	extension val CppmodelFactory cppFactory = CppmodelFactory.eINSTANCE
	extension val OoplFactory ooplFactory = OoplFactory.eINSTANCE
	extension val BatchTransformationStatements statements
	extension val ClassReferenceRules classReferenceRules
	
	new(BatchTransformationStatements statements, ClassReferenceRules classReferenceRules) {
		this.statements = statements
		this.classReferenceRules = classReferenceRules
	}
	
	def addRules(BatchTransformation transformation){
		val rules = new BatchTransformationRuleGroup(
			associationRule,
			classReferenceSimpleCollectionTypeRule,
			addReferencesRule
		)
		transformation.addRules(rules)
	}
	
	@Accessors(PUBLIC_GETTER)
	val associationRule = createRule.precondition(cppClassAssociations).action[ match |
		val xtClass = match.xtClass
		val cppClass = match.cppClass
		val xtAssociation = match.association
		val xtTargetClass = xtAssociation.target
		
		val cppClassReference = createClassReference(xtTargetClass, xtAssociation)
		val cppReferenceStorage = createReferenceStorage(cppClassReference, xtAssociation)
		val cppRelation = createRelation(cppReferenceStorage, xtAssociation)
		
		cppClass.subElements += cppRelation
		trace('''Mapped Association «xtAssociation.name» in Class «xtClass.name» to CPPRelation''')
		fireAllCurrent(classReferenceSimpleCollectionTypeRule, [it.classReferenceSimpleCollection == cppClassReference])
	].build
	
	@Accessors(PUBLIC_GETTER)
	val classReferenceSimpleCollectionTypeRule = createRule.precondition(classReferenceSimpleCollectionContainerImplementation).action[ match |
		val collection = match.classReferenceSimpleCollection
		val implementation = match.containerImplementation
		collection.implementation = implementation
		trace('''Set CPPClassReferenceSimpleCollection implementation to «implementation.containerQualifiedName»''')
	].build
	
	@Accessors(PUBLIC_GETTER)
	val classReferenceSimpleCollectionTypeRule4Instances = createRule.precondition(classReferenceSimpleCollectionContainerImplementation4Instances).action[ match |
		val collection = match.classReferenceSimpleCollection
		val implementation = match.containerImplementation
		collection.implementation = implementation
		trace('''Set CPPClassReferenceSimpleCollection implementation to «implementation.containerQualifiedName»''')
	].build
	
	@Accessors(PUBLIC_GETTER)
	val addReferencesRule = createRule.precondition(cppRelationClassReference).action[ match |
		val classReference = match.classReference
		fireAllCurrent(classReferenceRules.addReferencesRule, [it.cppClassReference == classReference])
	].build
	
	def createReferenceStorage(OOPLDataType cppClassReference, XTAssociation xtAssociation){
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
