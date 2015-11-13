package com.incquerylabs.emdw.cpp.bodyconverter.transformation.impl

import com.incquerylabs.emdw.cpp.bodyconverter.scoping.BasicUMLContextProvider
import com.incquerylabs.emdw.cpp.bodyconverter.transformation.IBodyConverter
import com.incquerylabs.emdw.cpp.bodyconverter.transformation.impl.queries.UmlXumlrtMappingQueries
import com.incquerylabs.emdw.cpp.common.descriptor.factory.impl.UmlValueDescriptorFactory
import com.incquerylabs.emdw.snippettemplate.Snippet
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
	extension UmlXumlrtMappingQueries mappingQueries = UmlXumlrtMappingQueries.instance
	
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
	 * @param commonOperation The {@link org.eclipse.papyrusrt.xtumlrt.common.Operation Operation} to be transformed
	 * @return The {@link Snippet} containing the C++ equivalent of the rALF code in the transformed element
	 * @throws IllegalArgumentException if the operation is not abstract and has no body with rALF language
	 */
	override Snippet convertOperation(org.eclipse.papyrusrt.xtumlrt.common.Operation commonOperation)
	throws IllegalArgumentException {
		val umlOperation = engine.umlOperation2CommonOperation.getAllValuesOfumlOperation(commonOperation).head as Operation
		if(commonOperation.isAbstract) {
			return null
		}
		
		val contextObject = umlOperation.methods.filter(OpaqueBehavior).head
		if(contextObject == null) {
			throw new IllegalArgumentException('''There is no OpaqueBehavior for «umlOperation.name» operation.''')
		}
		
		val xtAction = commonOperation.body as XTAction
		val ralfActionBody = xtAction.body.findFirst[language == rALF]
		context.contextObject = contextObject
		if(ralfActionBody == null) {
			return factory.createStringSnippet => [
				it.value = xtAction.cppCode
			]
		} else {
			return ralfActionBody.createSnippet
		}
	}
	
	/**
	 * @param commonState The {@link org.eclipse.papyrusrt.xtumlrt.common.State State} to be transformed
	 * @return The {@link Snippet} containing the C++ equivalent of the rALF code in the transformed element
	 * @throws IllegalArgumentException if the state has no body with rALF language
	 */
	override Snippet convertStateEntry(org.eclipse.papyrusrt.xtumlrt.common.State commonState) throws IllegalArgumentException {
		val umlState = engine.umlState2CommonState.getAllValuesOfumlState(commonState).head as State
		val contextObject = umlState.entry as OpaqueBehavior
		
		if(contextObject==null) {
			throw new IllegalArgumentException('''There is no OpaqueBehavior for «umlState.name» state's entry.''')
		}
		
		val xtAction = commonState.entryAction as XTAction
		val ralfActionBody = xtAction.body.findFirst[language == rALF]
		context.contextObject = contextObject
		if(ralfActionBody == null) {
			return factory.createStringSnippet => [
				it.value = xtAction.cppCode
			]
		} else {
			return ralfActionBody.createSnippet
		}
	}
	
	/**
	 * @param commonState The {@link org.eclipse.papyrusrt.xtumlrt.common.State State} to be transformed
	 * @return The {@link Snippet} containing the C++ equivalent of the rALF code in the transformed element
	 * @throws IllegalArgumentException if the state has no body with rALF language
	 */
	override Snippet convertStateExit(org.eclipse.papyrusrt.xtumlrt.common.State commonState) throws IllegalArgumentException {
		val umlState = engine.umlState2CommonState.getAllValuesOfumlState(commonState).head as State
		val contextObject = umlState.exit as OpaqueBehavior
		
		if(contextObject==null) {
			throw new IllegalArgumentException('''There is no OpaqueBehavior for «umlState.name» state's exit.''')
		}
		
		val xtAction = commonState.exitAction as XTAction
		val ralfActionBody = xtAction.body.findFirst[language == rALF]
		context.contextObject = contextObject
		if(ralfActionBody == null) {
			return factory.createStringSnippet => [
				it.value = xtAction.cppCode
			]
		} else {
			return ralfActionBody.createSnippet
		}
	}
	
	/**
	 * @param commonTransition The {@link org.eclipse.papyrusrt.xtumlrt.common.Transition Transition} to be transformed
	 * @return The {@link Snippet} containing the C++ equivalent of the rALF code in the transformed element
	 * @throws IllegalArgumentException if the transition has no body with rALF language
	 */
	override Snippet convertTransition(org.eclipse.papyrusrt.xtumlrt.common.Transition commonTransition) throws IllegalArgumentException {
		val umlTransition = engine.umlTransition2CommonTransition.getAllValuesOfumlTransition(commonTransition).head as Transition
		val contextObject = umlTransition.effect as OpaqueBehavior
		
		if(contextObject==null) {
			throw new IllegalArgumentException('''There is no OpaqueBehavior for «umlTransition.name» transition.''')
		}
		
		val xtAction = commonTransition.actionChain.actions.head as XTAction
		val ralfActionBody = xtAction.body.findFirst[language == rALF]
		context.contextObject = contextObject
		if(ralfActionBody == null) {
			return factory.createStringSnippet => [
				it.value = xtAction.cppCode
			]
		} else {
			return ralfActionBody.createSnippet
		}
	}
	
	/**
	 * @param commonTransition The {@link org.eclipse.papyrusrt.xtumlrt.common.Transition Transition} to be transformed
	 * @return The {@link Snippet} containing the C++ equivalent of the rALF code in the transformed element
	 * @throws IllegalArgumentException if the transition has no body with rALF language
	 */
	override Snippet convertTransitionGuard(org.eclipse.papyrusrt.xtumlrt.common.Transition commonTransition) throws IllegalArgumentException {
		val umlTransition = engine.umlTransition2CommonTransition.getAllValuesOfumlTransition(commonTransition).head as Transition
		val contextObject = umlTransition.guard.specification as OpaqueExpression
		
		if(contextObject==null) {
			throw new IllegalArgumentException('''There is no OpaqueExpression for «umlTransition.guard.name» constraint.''')
		}
		
		val xtAction = commonTransition.guard.body as XTAction
		val ralfActionBody = xtAction.body.findFirst[language == rALF]
		context.contextObject = contextObject
		if(ralfActionBody == null) {
			return factory.createStringSnippet => [
				it.value = xtAction.cppCode
			]
		} else {
			return ralfActionBody.createSnippet
		}
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
