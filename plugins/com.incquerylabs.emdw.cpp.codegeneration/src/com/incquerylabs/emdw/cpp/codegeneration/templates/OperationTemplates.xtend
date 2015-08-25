package com.incquerylabs.emdw.cpp.codegeneration.templates

import com.ericsson.xtumlrt.oopl.cppmodel.CPPClass
import com.ericsson.xtumlrt.oopl.cppmodel.CPPClassRefSimpleCollection
import com.ericsson.xtumlrt.oopl.cppmodel.CPPClassReferenceStorage
import com.ericsson.xtumlrt.oopl.cppmodel.CPPFormalParameter
import com.ericsson.xtumlrt.oopl.cppmodel.CPPNamedElement
import com.ericsson.xtumlrt.oopl.cppmodel.CPPOperation
import com.ericsson.xtumlrt.oopl.cppmodel.CPPReturnValue
import com.incquerylabs.emdw.cpp.common.TypeConverter
import org.eclipse.incquery.runtime.api.IncQueryEngine
import com.incquerylabs.uml.ralf.transformation.impl.BodyConverter
import org.eclipse.incquery.runtime.api.AdvancedIncQueryEngine
import com.incquerylabs.uml.ralf.scoping.BasicUMLContextProvider

class OperationTemplates extends CPPTemplate{
	
	val TypeConverter typeConverter
	val BodyConverter bodyConverter
	
	val ActionCodeTemplates actionCodeTemplates
	
	new(IncQueryEngine engine) {
		super(engine)
		actionCodeTemplates = new ActionCodeTemplates(engine)
		typeConverter = new TypeConverter
		bodyConverter = new BodyConverter()
		bodyConverter.initialize(engine as AdvancedIncQueryEngine, new BasicUMLContextProvider(engine as AdvancedIncQueryEngine))
	}
	
	def operationSignature(CPPOperation operation, boolean useQualifiedName, boolean hasReturnType, boolean isVirtual, boolean isStatic) {
		
		val returnType = operation.subElements.filter(CPPReturnValue).head
		val parameters = operation.subElements.filter(CPPFormalParameter)
		
		val staticKeyword = '''«IF isStatic»static «ENDIF»'''
		val virtualKeyword = '''«IF isVirtual»virtual «ENDIF»'''
		val returnTypeString = '''«IF hasReturnType»«typeConverter.convertType(returnType)» «ENDIF»'''
		val operationName = '''«IF useQualifiedName»«operation.cppQualifiedName»«ELSE»«operation.cppName»«ENDIF»'''
		val parenthesizedName = '''«IF hasReturnType && useQualifiedName»(«operationName»)«ELSE»«operationName»«ENDIF»'''
		val operationParameters = '''«FOR param : parameters SEPARATOR ", "»«generateCPPFormalParameterType(param)» «param.cppName»«ENDFOR»'''
		
		'''«virtualKeyword»«staticKeyword»«returnTypeString»«parenthesizedName»(«operationParameters»)'''
	}
	
	def operationDeclarationInClassHeader(CPPOperation operation, boolean withReturnType, boolean isVirtual) {
		val commonOp = operation.commonOperation
		val isStatic = commonOp.static
		'''«operationSignature(operation, false, withReturnType, isVirtual, isStatic)»;'''
	}
	
	def operationDefinitionInClassBody(CPPOperation operation, boolean withReturnType) {
		val containerElement = operation.eContainer as CPPNamedElement
		val operationSignature = operationSignature(operation, true, withReturnType, false, false)
		operation.prepareBody
		'''
			«operationSignature» {
				«tracingMessage('''[«containerElement.cppName»] operation call: «operationSignature»''')»
				«actionCodeTemplates.generateActionCode(operation.commonOperation.body)»
			}
		'''
	}
	
	def constructorDefinitionInClassBody(CPPClass cppClass, CPPOperation constructor, CharSequence fieldInitialization) {		
		val containerElement = constructor.eContainer as CPPNamedElement
		val constructorSignature = operationSignature(constructor, true, false, false, false)
		constructor.prepareBody
		'''
			«constructorSignature»«fieldInitialization» {
				«tracingMessage('''[«containerElement.cppName»] constructor call: «constructorSignature»''')»
				«actionCodeTemplates.generateActionCode(constructor.commonOperation.body)»
				«instancesAddTemplates(cppClass)»
			}
		'''
	}
	
	def instancesAddTemplates(CPPClass cppClass) {
		'''
		«FOR cppClassRefStorage : cppClass.referenceStorage.filter(CPPClassReferenceStorage).sortBy[cppName]»
			«cppClassRefStorage.generateAddTemplate("this")»
		«ENDFOR»
		'''
	}
	
	def String generateAddTemplate(CPPClassReferenceStorage storage, String value) {
		var type = storage.type
		if(type instanceof CPPClassRefSimpleCollection) {
			return type.implementation.generateAdd(storage.cppName, value, "result")
		}
	}
	
	def destructorDefinitionInClassBody(CPPClass cppClass, CPPOperation destructor) {
		val containerElement = destructor.eContainer as CPPNamedElement
		val destructorSignature = operationSignature(destructor, true, false, false, false)
		destructor.prepareBody
		'''
			«destructorSignature» {
				«tracingMessage('''[«containerElement.cppName»] destructor call: «destructorSignature»''')»
				«actionCodeTemplates.generateActionCode(destructor.commonOperation.body)»
				«instancesRemoveTemplates(cppClass)»
			}
		'''
	}
	
	private def void prepareBody(CPPOperation operation) {
		if(operation.commonOperation.body?.source == null) {
			operation.commonOperation.body.source = bodyConverter.convertOperation(operation)
		}
	}
	
	def instancesRemoveTemplates(CPPClass cppClass) {
		'''
		«FOR cppClassRefStorage : cppClass.referenceStorage.filter(CPPClassReferenceStorage).sortBy[cppName]»
			«cppClassRefStorage.generateRemoveTemplate("this")»
		«ENDFOR»
		'''
	}
	
	def String generateRemoveTemplate(CPPClassReferenceStorage storage, String value) {
		var type = storage.type
		if(type instanceof CPPClassRefSimpleCollection) {
			return type.implementation.generateRemove(storage.cppName, value)
		}
	}
	
	def generateCPPFormalParameterType(CPPFormalParameter param){
		typeConverter.convertType(param)
	}
}
