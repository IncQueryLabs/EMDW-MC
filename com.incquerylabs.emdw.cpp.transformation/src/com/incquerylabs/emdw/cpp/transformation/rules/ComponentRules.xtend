package com.incquerylabs.emdw.cpp.transformation.rules

import com.ericsson.xtumlrt.oopl.OoplFactory
import com.ericsson.xtumlrt.oopl.cppmodel.CppmodelFactory
import com.incquerylabs.emdw.cpp.transformation.queries.XtumlQueries
import org.apache.log4j.Logger
import org.eclipse.viatra.emf.runtime.rules.TransformationRuleGroup
import org.eclipse.viatra.emf.runtime.rules.batch.BatchTransformationRuleFactory
import org.eclipse.viatra.emf.runtime.transformation.batch.BatchTransformation
import org.eclipse.xtend.lib.annotations.Accessors
import org.eclipse.papyrusrt.xtumlrt.common.MultiplicityElement

class ComponentRules {
	static extension val XtumlQueries xtUmlQueries = XtumlQueries.instance
	
	extension val Logger logger = Logger.getLogger(class)
	extension BatchTransformationRuleFactory factory = new BatchTransformationRuleFactory
	extension CppmodelFactory cppFactory = CppmodelFactory.eINSTANCE
	extension OoplFactory ooplFactory = OoplFactory.eINSTANCE
	
	def addRules(BatchTransformation transformation){
		val rules = new TransformationRuleGroup(
			cleanComponentsRule,
			componentAttributeRule,
			componentOperationRule
		)
		transformation.addRules(rules)
	}
	
	@Accessors(PUBLIC_GETTER)
	val cleanComponentsRule = createRule.precondition(cppComponents).action[ match |
		val cppComponent = match.cppComponent
		cppComponent.subElements.clear
		val bodyDirectory = cppComponent.bodyDirectory
		if(bodyDirectory != null){
			bodyDirectory.files.clear
			bodyDirectory.subDirectories.clear
		}
		val headerDirectory = cppComponent.headerDirectory
		if(headerDirectory != null){
			headerDirectory.files.clear
			headerDirectory.subDirectories.clear
		}
		
		trace('''Cleaned Component «cppComponent.xtComponent.name»''')
	].build
	
	@Accessors(PUBLIC_GETTER)
	val componentAttributeRule = createRule.precondition(cppComponentAttributes).action[ match |
		val cppComponent = match.cppComponent
		val attribute = match.attribute
		val cppAttribute = createCPPAttribute => [
			commonAttribute = attribute
			ooplNameProvider = createOOPLExistingNameProvider=>[ commonNamedElement = attribute ]
			if(attribute.multiValue){
				unnamedSequenceType = createCPPSequence => [
					commonType = attribute.type
				]
			}
		]
		cppComponent.subElements += cppAttribute
		trace('''Mapped Attribute «attribute.name» in component «match.xtComponent.name» to CPPAttribute''')
	].build
	
	@Accessors(PUBLIC_GETTER)
	val componentOperationRule = createRule.precondition(cppComponentOperations).action[ match |
		val cppComponent = match.cppComponent
		val operation = match.operation
		val cppOperation = createCPPOperation => [
			commonOperation = operation
			ooplNameProvider = createOOPLExistingNameProvider=>[ commonNamedElement = operation ]
		]
		operation.parameters.forEach[ param |
			val cppFormalParameter = createCPPFormalParameter => [
				commonParameter = param
				ooplNameProvider = createOOPLExistingNameProvider => [ commonNamedElement = param ]
				if(param.multiValue){
					unnamedSequenceType = createCPPSequence => [
						commonType = param.type
					]
				}
			]
			cppOperation.subElements += cppFormalParameter
		]
		cppComponent.subElements += cppOperation
		trace('''Mapped Operation «operation.name» in component «match.xtComponent.name» to CPPOperation''')
	].build
	
	def isMultiValue(MultiplicityElement multiplicityElement) {
		val upperBound = multiplicityElement.upperBound
		return upperBound > 1 || upperBound == -1
	}
	
}