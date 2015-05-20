package com.incquerylabs.emdw.cpp.codegeneration.templates

import com.ericsson.xtumlrt.oopl.cppmodel.CPPOperation
import com.incquerylabs.emdw.cpp.codegeneration.queries.CppCodeGenerationQueries
import com.incquerylabs.emdw.cpp.codegeneration.util.TypeConverter
import org.eclipse.incquery.runtime.api.IncQueryEngine
import com.ericsson.xtumlrt.oopl.cppmodel.CPPFormalParameter
import com.ericsson.xtumlrt.oopl.cppmodel.CPPSequence

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
	
	def operationSignature(CPPOperation operation, boolean useQualifiedName) {
		
		val commonOp = operation.commonOperation
		val returnType = commonOp.returnType
		val parameters = operation.subElements.filter(CPPFormalParameter)
						
		'''«IF commonOp.static»static «ENDIF»«typeConverter.convertType(returnType)» «IF useQualifiedName»«operation.operationFullyQualifiedName»«ELSE»«commonOp.name»«ENDIF»(«FOR param : parameters SEPARATOR ", "»«generateCPPFormalParameterType(param)» «param.commonParameter.name»«ENDFOR»)'''
	}
	
	def operationDeclarationInClassHeader(CPPOperation operation) {
		
		'''«operationSignature(operation, false)»;'''
	}
	
	def operationDefinitionInClassBody(CPPOperation operation) {
		
		'''
			«operationSignature(operation, true)» {
				«actionCodeTemplates.generateActionCode(operation.commonOperation.body)»
			}
		'''
	}
	
	def operationFullyQualifiedName(CPPOperation cppOperation) {
		val cppName = cppOperation.commonOperation.name // cppOperation.cppName
		val cppFQN = '''::Test_FSM::Main_Package::Test_Component::Test_Package::TEST::«cppName»''' //cppOperation.cppQualifiedName
		cppFQN
	}
	
	def generateCPPFormalParameterType(CPPFormalParameter param){
		val cppSequence = param.subElements.filter(CPPSequence).head
		if(cppSequence != null){
			typeConverter.convertSequence(cppSequence)
		} else {
			typeConverter.convertType(param.commonParameter.type)
		}
	}
}