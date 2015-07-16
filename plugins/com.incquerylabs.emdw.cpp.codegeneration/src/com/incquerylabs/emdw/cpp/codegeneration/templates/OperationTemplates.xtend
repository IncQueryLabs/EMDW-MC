package com.incquerylabs.emdw.cpp.codegeneration.templates

import com.ericsson.xtumlrt.oopl.cppmodel.CPPClass
import com.ericsson.xtumlrt.oopl.cppmodel.CPPClassRefSimpleCollection
import com.ericsson.xtumlrt.oopl.cppmodel.CPPClassReferenceStorage
import com.ericsson.xtumlrt.oopl.cppmodel.CPPFormalParameter
import com.ericsson.xtumlrt.oopl.cppmodel.CPPOperation
import com.incquerylabs.emdw.cpp.codegeneration.queries.CppCodeGenerationQueries
import com.incquerylabs.emdw.cpp.codegeneration.util.TypeConverter
import org.eclipse.incquery.runtime.api.IncQueryEngine

class OperationTemplates {
	
	val codeGenQueries = CppCodeGenerationQueries.instance
	val TypeConverter typeConverter
	
	// TODO @Inject
	val generateTracingCode = CPPTemplates.GENERATE_TRACING_CODE
	val ActionCodeTemplates actionCodeTemplates
	val IncQueryEngine engine
	
	new(IncQueryEngine engine) {
		this.engine = engine
		actionCodeTemplates = new ActionCodeTemplates(engine)
		typeConverter = new TypeConverter
	}
	
	def operationSignature(CPPOperation operation, boolean useQualifiedName, boolean hasReturnType, boolean isVirtual, boolean isStatic) {
		
		val commonOp = operation.commonOperation
		val returnType = commonOp.returnType
		val parameters = operation.subElements.filter(CPPFormalParameter)
		
		val staticKeyword = '''«IF isStatic»static «ENDIF»'''
		val virtualKeyword = '''«IF isVirtual»virtual «ENDIF»'''
		val returnTypeString = '''«IF hasReturnType»«typeConverter.convertType(returnType.type)» «ENDIF»'''
		val operationName = '''«IF useQualifiedName»«operation.cppQualifiedName»«ELSE»«operation.cppName»«ENDIF»'''
		val operationParameters = '''«FOR param : parameters SEPARATOR ", "»«generateCPPFormalParameterType(param)» «param.cppName»«ENDFOR»'''
						
		'''«virtualKeyword»«staticKeyword»«returnTypeString»«operationName»(«operationParameters»)'''
	}
	
	def operationDeclarationInClassHeader(CPPOperation operation, boolean withReturnType, boolean isVirtual) {
		val commonOp = operation.commonOperation
		val isStatic = commonOp.static
		'''«operationSignature(operation, true, withReturnType, isVirtual, isStatic)»;'''
	}
	
	def operationDefinitionInClassBody(CPPOperation operation, boolean withReturnType) {
		
		'''
			«operationSignature(operation, true, withReturnType, false, false)» {
				«actionCodeTemplates.generateActionCode(operation.commonOperation.body)»
			}
		'''
	}
	
	def constructorDefinitionInClassBody(CPPClass cppClass, CPPOperation constructor, String fieldInitialization) {		
		'''
			«operationSignature(constructor, true, false, false, false)»«fieldInitialization» {
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
		'''
			«operationSignature(destructor, true, false, false, false)» {
				«actionCodeTemplates.generateActionCode(destructor.commonOperation.body)»
				«instancesRemoveTemplates(cppClass)»
			}
		'''
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
		val type = param.type
		typeConverter.convertType(type)
	}
}