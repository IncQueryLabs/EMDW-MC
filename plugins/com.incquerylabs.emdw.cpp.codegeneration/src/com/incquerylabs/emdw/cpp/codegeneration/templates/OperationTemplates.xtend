/*******************************************************************************
 * Copyright (c) 2015-2016, IncQuery Labs Ltd. and Ericsson AB
 * All rights reserved. This program and the accompanying materials
 * are made available under the terms of the Eclipse Public License v1.0
 * which accompanies this distribution, and is available at
 * http://www.eclipse.org/legal/epl-v10.html
 *
 * Contributors:
 *   Akos Horvath, Abel Hegedus, Zoltan Ujhelyi, Daniel Segesdi, Tamas Borbas, Robert Doczi, Peter Lunk, Istvan Papp - initial API and implementation
 *******************************************************************************/
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
import com.ericsson.xtumlrt.oopl.cppmodel.CPPComponent

class OperationTemplates extends CPPTemplate{
	
	val extension TypeConverter typeConverter
	
	val ActionCodeTemplates actionCodeTemplates
	
	new(IncQueryEngine engine) {
		super(engine)
		actionCodeTemplates = new ActionCodeTemplates(engine)
		typeConverter = new TypeConverter
	}
	
	def operationSignature(CPPOperation operation, boolean useQualifiedName, boolean hasReturnType, boolean isVirtual, boolean isStatic) {
		
		val returnType = operation.subElements.filter(CPPReturnValue).head
		val parameters = operation.subElements.filter(CPPFormalParameter)
		
		val staticKeyword = '''«IF isStatic»static «ENDIF»'''
		val virtualKeyword = '''«IF isVirtual»virtual «ENDIF»'''
		val returnTypeString = '''«IF hasReturnType»«typeConverter.convertToType(returnType)» «ENDIF»'''
		val operationName = '''«IF useQualifiedName»«operation.cppQualifiedName»«ELSE»«operation.cppName»«ENDIF»'''
		val parenthesizedName = '''«IF hasReturnType && useQualifiedName»(«operationName»)«ELSE»«operationName»«ENDIF»'''
		val operationParameters = '''«FOR param : parameters SEPARATOR ", "»«generateCPPFormalParameterType(param)» «param.cppName»«ENDFOR»'''
		
		'''«virtualKeyword»«staticKeyword»«returnTypeString»«parenthesizedName»(«operationParameters»)'''
	}
	
	def operationDeclarationInClassHeader(CPPOperation operation, boolean withReturnType, boolean isVirtual) {
		val commonOp = operation.commonOperation
		val isStatic = commonOp.static
		val isPureVirtual = commonOp.isAbstract
		'''«operationSignature(operation, false, withReturnType, isVirtual, isStatic)»«IF isPureVirtual» = 0«ENDIF»;'''
	}
	
	def operationDefinitionInClassBody(CPPOperation operation, boolean withReturnType) {
		if(operation.commonOperation.isAbstract) {
			return ""
		}
		
		val containerElement = operation.eContainer as CPPNamedElement
		val operationSignature = operationSignature(operation, true, withReturnType, false, false)
		'''
			«operationSignature» {
				«tracingMessage('''[«containerElement.cppName»] operation call: «operationSignature»''')»
				«actionCodeTemplates.generateActionCode(operation.compiledBody)»
			}
		'''
	}
	
	def constructorDefinitionInClassBody(CPPClass cppClass, CPPOperation constructor, CharSequence fieldInitialization) {		
		val containerElement = constructor.eContainer as CPPNamedElement
		val constructorSignature = operationSignature(constructor, true, false, false, false)
		'''
			«constructorSignature»«fieldInitialization» {
				«tracingMessage('''[«containerElement.cppName»] constructor call: «constructorSignature»''')»
				«actionCodeTemplates.generateActionCode(constructor.compiledBody)»
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
			'''«(type.implementation.implementationClass as CPPClass).cppQualifiedName»::add(«storage.cppName», «value»);''' 
		}
	}
		
	def destructorDefinitionInClassBody(CPPClass cppClass, CPPOperation destructor, CPPComponent component, boolean clearEventQueue) {
		val containerElement = destructor.eContainer as CPPNamedElement
		val destructorSignature = operationSignature(destructor, true, false, false, false)
		'''
			«destructorSignature» {
				«tracingMessage('''[«containerElement.cppName»] destructor call: «destructorSignature»''')»
				«actionCodeTemplates.generateActionCode(destructor.compiledBody)»
				«instancesRemoveTemplates(cppClass, component, clearEventQueue)»
			}
		'''
	}
	
	def instancesRemoveTemplates(CPPClass cppClass, CPPComponent component, boolean clearEventQueue) {
		'''
		«FOR cppClassRefStorage : cppClass.referenceStorage.filter(CPPClassReferenceStorage).sortBy[cppName]»
			«cppClassRefStorage.generateRemoveTemplate("this")»
		«ENDFOR»
		
		«IF (clearEventQueue)»
			if(!_internalEvents.empty() || !_externalEvents.empty())
				«component.cppQualifiedName»::«component.cppName»::get_instance()->unschedule(_scheduler_queue_position);
		«ENDIF»
		'''
	}
	
	def String generateRemoveTemplate(CPPClassReferenceStorage storage, String value) {
		var type = storage.type
		if(type instanceof CPPClassRefSimpleCollection) {
			'''«(type.implementation.implementationClass as CPPClass).cppQualifiedName»::remove(«storage.cppName», «value»);'''
		}
	}
	
	def generateCPPFormalParameterType(CPPFormalParameter param){
		typeConverter.convertToType(param)
	}
}
