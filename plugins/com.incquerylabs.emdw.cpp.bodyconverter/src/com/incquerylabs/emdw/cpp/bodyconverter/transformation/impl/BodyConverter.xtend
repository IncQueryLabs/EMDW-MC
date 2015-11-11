package com.incquerylabs.emdw.cpp.bodyconverter.transformation.impl

import com.ericsson.xtumlrt.oopl.cppmodel.CPPOperation
import com.ericsson.xtumlrt.oopl.cppmodel.CPPState
import com.ericsson.xtumlrt.oopl.cppmodel.CPPTransition
import com.incquerylabs.emdw.cpp.bodyconverter.scoping.BasicUMLContextProvider
import com.incquerylabs.emdw.cpp.bodyconverter.transformation.IBodyConverter
import com.incquerylabs.emdw.cpp.bodyconverter.transformation.impl.queries.UmlCppMappingQueries
import com.incquerylabs.emdw.cpp.common.descriptor.factory.impl.UmlValueDescriptorFactory
import com.incquerylabs.emdw.snippettemplate.SnippetTemplateFactory
import com.incquerylabs.emdw.snippettemplate.serializer.ReducedAlfSnippetTemplateSerializer
import com.incquerylabs.uml.ralf.api.impl.ReducedAlfGenerator
import com.incquerylabs.uml.ralf.api.impl.ReducedAlfParser
import com.incquerylabs.uml.ralf.snippetcompiler.ReducedAlfSnippetTemplateCompiler
import org.eclipse.incquery.runtime.api.AdvancedIncQueryEngine
import org.eclipse.papyrusrt.xtumlrt.xtuml.XTAction
import org.eclipse.papyrusrt.xtumlrt.xtuml.XTActionBody
import org.eclipse.uml2.uml.OpaqueBehavior
import org.eclipse.uml2.uml.OpaqueExpression
import org.eclipse.uml2.uml.Operation
import org.eclipse.uml2.uml.State
import org.eclipse.uml2.uml.Transition

class BodyConverter implements IBodyConverter {
	extension UmlCppMappingQueries mappingQueries = UmlCppMappingQueries.instance
	
	private static final val rALF = "rALF"
	
	private SnippetTemplateFactory factory = SnippetTemplateFactory.eINSTANCE
	private AdvancedIncQueryEngine engine
	private ReducedAlfParser parser
	private BasicUMLContextProvider context
	private ReducedAlfSnippetTemplateSerializer serializer
	private ReducedAlfGenerator generator
	
	override void initialize(AdvancedIncQueryEngine engine, BasicUMLContextProvider context) {
		this.engine = engine
		parser = new ReducedAlfParser
		this.context = context
		serializer = new ReducedAlfSnippetTemplateSerializer
		generator = new ReducedAlfGenerator
	}
	
	/**
	 * @param target The target of the transformation
	 * @return The string which is the C++ equivalent of the rALF code in the target
	 * @throws IllegalArgumentException if the target is not abstract and has no body with rALF language
	 */
	override String convertOperation(CPPOperation target) throws IllegalArgumentException {
		val umlOperation = engine.umlOperation2CppOperation.getAllValuesOfumlOperation(target).head as Operation
		val commonOperation = target.commonOperation
		if(commonOperation.isAbstract) {
			target.compiledBody = null
			return ""
		}
		
		val contextObject = umlOperation.methods.filter(OpaqueBehavior).head
		if(contextObject == null) {
			throw new IllegalArgumentException('''There is no OpaqueBehavior for «umlOperation.name» operation.''')
		}
		
		val xtAction = commonOperation.body as XTAction
		val ralfActionBody = xtAction.body.findFirst[language == rALF]
		context.contextObject = contextObject
		if(ralfActionBody == null) {
			target.compiledBody = factory.createStringSnippet => [
				it.value = xtAction.cppCode
			]
		} else {
			target.compiledBody = ralfActionBody.createSnippet
		}
		// Create the snippet code based on the snippet template
		return serializer.serialize(target.compiledBody)
	}
	
	override String convertStateEntry(CPPState target) throws IllegalArgumentException {
		val umlState = engine.umlState2CppState.getAllValuesOfumlState(target).head as State
		val contextObject = umlState.entry as OpaqueBehavior
		
		if(contextObject==null) {
			throw new IllegalArgumentException('''There is no OpaqueBehavior for «umlState.name» state's entry.''')
		}
		
		val commonState = target.commonState
		val xtAction = commonState.entryAction as XTAction
		val ralfActionBody = xtAction.body.findFirst[language == rALF]
		context.contextObject = contextObject
		if(ralfActionBody == null) {
			target.compiledEntryBody = factory.createStringSnippet => [
				it.value = xtAction.cppCode
			]
		} else {
			target.compiledEntryBody = ralfActionBody.createSnippet
		}
		//Create the snippet code based on the snippet template
		return serializer.serialize(target.compiledEntryBody)
	}
	
	override String convertStateExit(CPPState target) throws IllegalArgumentException {
		val umlState = engine.umlState2CppState.getAllValuesOfumlState(target).head as State
		val contextObject = umlState.exit as OpaqueBehavior
		
		if(contextObject==null) {
			throw new IllegalArgumentException('''There is no OpaqueBehavior for «umlState.name» state's exit.''')
		}
		
		val commonState = target.commonState
		val xtAction = commonState.exitAction as XTAction
		val ralfActionBody = xtAction.body.findFirst[language == rALF]
		context.contextObject = contextObject
		if(ralfActionBody == null) {
			target.compiledExitBody = factory.createStringSnippet => [
				it.value = xtAction.cppCode
			]
		} else {
			target.compiledExitBody = ralfActionBody.createSnippet
		}
		//Create the snippet code based on the snippet template
		return serializer.serialize(target.compiledExitBody)
	}
	
	override String convertTransition(CPPTransition target) throws IllegalArgumentException {
		val umlTransition = engine.umlTransition2CppTransition.getAllValuesOfumlTransition(target).head as Transition
		val contextObject = umlTransition.effect as OpaqueBehavior
		
		if(contextObject==null) {
			throw new IllegalArgumentException('''There is no OpaqueBehavior for «umlTransition.name» transition.''')
		}
		
		val commonTransition = target.commonTransition
		val xtAction = commonTransition.actionChain.actions.head as XTAction
		val ralfActionBody = xtAction.body.findFirst[language == rALF]
		context.contextObject = contextObject
		if(ralfActionBody == null) {
			target.compiledEffectBody = factory.createStringSnippet => [
				it.value = xtAction.cppCode
			]
		} else {
			target.compiledEffectBody = ralfActionBody.createSnippet
		}
		//Create the snippet code based on the snippet template
		return serializer.serialize(target.compiledEffectBody)
	}
	
	override String convertTransitionGuard(CPPTransition target) throws IllegalArgumentException {
		val umlTransition = engine.umlTransition2CppTransition.getAllValuesOfumlTransition(target).head as Transition
		val contextObject = umlTransition.guard.specification as OpaqueExpression
		
		if(contextObject==null) {
			throw new IllegalArgumentException('''There is no OpaqueExpression for «umlTransition.guard.name» constraint.''')
		}
		
		val commonTransition = target.commonTransition
		val xtAction = commonTransition.guard.body as XTAction
		val ralfActionBody = xtAction.body.findFirst[language == rALF]
		context.contextObject = contextObject
		if(ralfActionBody == null) {
			target.compiledGuardBody = factory.createStringSnippet => [
				it.value = xtAction.cppCode
			]
		} else {
			target.compiledGuardBody = ralfActionBody.createSnippet
		}
		//Create the snippet code based on the snippet template
		return serializer.serialize(target.compiledGuardBody)
	}
	
	private def String getCppCode(XTAction xtAction) {
		val xtActionBodies = xtAction.body
		val cppLanguageStrings = #["C++", "C/C++", "C", "CPP"]
		val firstCppActionBody = xtActionBodies.findFirst[
			cppLanguageStrings.contains(language)
		]
		if(firstCppActionBody != null) {
			return firstCppActionBody.source
		}
		
		return ""
	}
	
	private def createSnippet(XTActionBody ralfActionBody) throws IndexOutOfBoundsException {
		val result = parser.parse(ralfActionBody.source, context)
		//Create the snippet template based on the parsed abstract syntax tree
		val compiler = new ReducedAlfSnippetTemplateCompiler(new UmlValueDescriptorFactory(engine))
		val snippet = generator.createSnippet(result, context, compiler)
		// FIXME this should be resoult.dispose instead
		result.model.eResource.unload
		return snippet
	}
}