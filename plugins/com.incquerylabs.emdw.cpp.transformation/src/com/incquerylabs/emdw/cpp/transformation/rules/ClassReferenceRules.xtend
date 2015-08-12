package com.incquerylabs.emdw.cpp.transformation.rules

import com.ericsson.xtumlrt.oopl.OOPLClassReference
import com.ericsson.xtumlrt.oopl.OOPLClassReferenceCollection
import com.ericsson.xtumlrt.oopl.OOPLDataType
import com.ericsson.xtumlrt.oopl.OoplFactory
import com.ericsson.xtumlrt.oopl.cppmodel.CppmodelFactory
import com.incquerylabs.emdw.cpp.transformation.queries.CppQueries
import org.apache.log4j.Logger
import org.eclipse.papyrusrt.xtumlrt.common.MultiplicityElement
import org.eclipse.papyrusrt.xtumlrt.xtuml.XTClass
import org.eclipse.viatra.emf.runtime.rules.BatchTransformationRuleGroup
import org.eclipse.viatra.emf.runtime.rules.batch.BatchTransformationRuleFactory
import org.eclipse.viatra.emf.runtime.rules.batch.BatchTransformationStatements
import org.eclipse.viatra.emf.runtime.transformation.batch.BatchTransformation
import org.eclipse.xtend.lib.annotations.Accessors

class ClassReferenceRules {
	static extension val CppQueries cppQueries = CppQueries.instance
	
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
		)
		transformation.addRules(rules)
	}
	
	def OOPLDataType createClassReference(XTClass xtReferenceClass, MultiplicityElement multiplicityElement) {
		if(multiplicityElement.upperBound != 1) {
			val classReferenceSimpleCollection = createClassReferenceSimpleCollection(xtReferenceClass)
			return classReferenceSimpleCollection
		} else {
			val classReference = createSimpleClassReference(xtReferenceClass)
			return classReference
		}
	}
	
	def createSimpleClassReference(XTClass xtReferenceClass){
		val referenceType = createCPPClassReference => [
				it.commonType = xtReferenceClass
				it.ooplNameProvider = createOOPLExistingNameProvider =>[
					commonNamedElement = xtReferenceClass
				]
			]
		return referenceType
	}
	
	def createClassReferenceSimpleCollection(XTClass xtReferenceClass){
		val referenceType = createCPPClassRefSimpleCollection => [
			it.commonType = xtReferenceClass
			it.ooplNameProvider = createOOPLExistingNameProvider =>[
				commonNamedElement = xtReferenceClass
			]
		]
		return referenceType
	}
	
	@Accessors(PUBLIC_GETTER)
	val addReferencesRule = createRule.precondition(cppClassReference).action[ match |
		val cppClassReference = match.cppClassReference
		val cppClass = match.cppClass
		if(cppClassReference instanceof OOPLClassReference){
			cppClassReference.ooplClass = cppClass
			trace('''Set ooplClass of class reference «cppClassReference» to «cppClass»''')
		} else if (cppClassReference instanceof OOPLClassReferenceCollection) {
			cppClassReference.ooplClass = cppClass
			trace('''Set ooplClass of class reference collection «cppClassReference» to «cppClass»''')
		}
	].build
}
