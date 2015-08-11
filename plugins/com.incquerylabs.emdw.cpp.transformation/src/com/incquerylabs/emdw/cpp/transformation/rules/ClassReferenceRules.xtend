package com.incquerylabs.emdw.cpp.transformation.rules

import com.ericsson.xtumlrt.oopl.OOPLDataType
import com.ericsson.xtumlrt.oopl.OoplFactory
import com.ericsson.xtumlrt.oopl.cppmodel.CPPClass
import com.ericsson.xtumlrt.oopl.cppmodel.CppmodelFactory
import org.eclipse.papyrusrt.xtumlrt.common.MultiplicityElement
import org.eclipse.viatra.emf.runtime.rules.BatchTransformationRuleGroup
import org.eclipse.viatra.emf.runtime.rules.batch.BatchTransformationStatements
import org.eclipse.viatra.emf.runtime.transformation.batch.BatchTransformation

class ClassReferenceRules {
	extension val CppmodelFactory cppFactory = CppmodelFactory.eINSTANCE
	extension val OoplFactory ooplFactory = OoplFactory.eINSTANCE
	extension val BatchTransformationStatements statements
	
	new(BatchTransformationStatements statements) {
		this.statements = statements
	}
	
	def addRules(BatchTransformation transformation){
		val rules = new BatchTransformationRuleGroup(
		)
		transformation.addRules(rules)
	}
	
	def OOPLDataType createClassReference(CPPClass cppReferenceClass, MultiplicityElement multiplicityElement) {
		if(multiplicityElement.upperBound != 1) {
			val classReference = createSimpleClassReference(cppReferenceClass)
			return classReference
		} else {
			val classReferenceSimpleCollection = createClassReferenceSimpleCollection(cppReferenceClass)
			return classReferenceSimpleCollection
		}
	}
	
	def createSimpleClassReference(CPPClass cppReferenceClass){
		val xtReferenceClass = cppReferenceClass.xtClass
		val referenceType = createCPPClassReference => [
				it.commonType = xtReferenceClass
				it.ooplClass = cppReferenceClass
				it.ooplNameProvider = createOOPLExistingNameProvider =>[
					commonNamedElement = xtReferenceClass
				]
			]
		return referenceType
	}
	
	def createClassReferenceSimpleCollection(CPPClass cppReferenceClass){
		val xtReferenceClass = cppReferenceClass.xtClass
		val referenceType = createCPPClassRefSimpleCollection => [
			it.commonType = xtReferenceClass
			it.ooplClass = cppReferenceClass
			it.ooplNameProvider = createOOPLExistingNameProvider =>[
				commonNamedElement = xtReferenceClass
			]
		]
		return referenceType
	}
}
