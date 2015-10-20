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
import com.incquerylabs.uml.ralf.api.impl.ParsingResults
import com.incquerylabs.uml.ralf.api.impl.ReducedAlfGenerator
import com.incquerylabs.uml.ralf.api.impl.ReducedAlfParser
import com.incquerylabs.uml.ralf.snippetcompiler.ReducedAlfSnippetTemplateCompiler
import org.eclipse.incquery.runtime.api.AdvancedIncQueryEngine
import org.eclipse.uml2.uml.BodyOwner
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
	 * @throws IllegalArgumentException if the target has no body with rALF language
	 */
	override String convertOperation(CPPOperation target) throws IllegalArgumentException {
		val umlOperation = engine.umlOperation2CppOperation.getAllValuesOfumlOperation(target).head as Operation
		val behavior = umlOperation.methods.filter(OpaqueBehavior).head
		if(behavior==null) {
			throw new IllegalArgumentException('''There is no OpaqueBehavior with rALF language for «umlOperation.name» operation.''')
		}
		try {
			context.contextObject = behavior
			if(!behavior.hasRalfBody) {
				target.compiledBody = factory.createStringSnippet => [
					it.value = behavior.cppCode
				]
			} else {
		       	target.compiledBody = behavior.createSnippet
	       	}
	       	//Create the snippet code based on the snippet template
	       	return serializer.serialize(target.compiledBody)
		} catch(IndexOutOfBoundsException cause) {
			throw new IllegalArgumentException('''There is no body for rALF language in «umlOperation.name» operation.''', cause)
		}
	}
	
	override String convertStateEntry(CPPState target) throws IllegalArgumentException {
		val umlState = engine.umlState2CppState.getAllValuesOfumlState(target).head as State 
		val OpaqueBehavior behavior = umlState.entry as OpaqueBehavior
		
		if(behavior==null) {
			throw new IllegalArgumentException('''There is no OpaqueBehavior for «umlState.name» state's entry.''')
		}
		try {
			context.contextObject = behavior
			if(!behavior.hasRalfBody) {
				target.compiledEntryBody = factory.createStringSnippet => [
					it.value = behavior.cppCode
				]
			} else {
		       	target.compiledEntryBody = behavior.createSnippet
	       	}
	       	//Create the snippet code based on the snippet template
	       	return serializer.serialize(target.compiledEntryBody)
		} catch(IndexOutOfBoundsException cause) {
			throw new IllegalArgumentException('''There is no body for rALF language in «umlState.name» state's entry.''', cause)
		}
	}
	
	override String convertStateExit(CPPState target) throws IllegalArgumentException {
		val umlState = engine.umlState2CppState.getAllValuesOfumlState(target).head as State 
		val OpaqueBehavior behavior = umlState.exit as OpaqueBehavior
		
		if(behavior==null) {
			throw new IllegalArgumentException('''There is no OpaqueBehavior for «umlState.name» state's exit.''')
		}
		try {
			context.contextObject = behavior
			if(!behavior.hasRalfBody) {
				target.compiledExitBody = factory.createStringSnippet => [
					it.value = behavior.cppCode
				]
			} else {
		       	target.compiledExitBody = behavior.createSnippet
	       	}
	       	//Create the snippet code based on the snippet template
	       	return serializer.serialize(target.compiledExitBody)
		} catch(IndexOutOfBoundsException cause) {
			throw new IllegalArgumentException('''There is no body for rALF language in «umlState.name» state's exit.''', cause)
		}
	}
	
	override String convertTransition(CPPTransition target) throws IllegalArgumentException {
		val umlTransition = engine.umlTransition2CppTransition.getAllValuesOfumlTransition(target).head as Transition
		val opaqueBehavior = umlTransition.effect as OpaqueBehavior
		
		if(opaqueBehavior==null) {
			throw new IllegalArgumentException('''There is no OpaqueBehavior for «umlTransition.name» transition.''')
		}
		try {
			context.contextObject = opaqueBehavior
			if(!opaqueBehavior.hasRalfBody) {
				target.compiledEffectBody = factory.createStringSnippet => [
					it.value = opaqueBehavior.cppCode
				]
			} else {
		       	target.compiledEffectBody = opaqueBehavior.createSnippet
	       	}
	       	//Create the snippet code based on the snippet template
	       	return serializer.serialize(target.compiledEffectBody)
		} catch(IndexOutOfBoundsException cause) {
			throw new IllegalArgumentException('''There is no body for rALF language in «umlTransition.name» transition's effect.''', cause)
		}
	}
	
	override String convertTransitionGuard(CPPTransition target) throws IllegalArgumentException {
		val umlTransition = engine.umlTransition2CppTransition.getAllValuesOfumlTransition(target).head as Transition
		val opaqueExpression = umlTransition.guard.specification as OpaqueExpression
		
		if(opaqueExpression==null) {
			throw new IllegalArgumentException('''There is no OpaqueExpression for «umlTransition.guard.name» constraint.''')
		}
		try {
			context.contextObject = opaqueExpression
			if(!opaqueExpression.hasRalfBody) {
				target.compiledGuardBody = factory.createStringSnippet => [
					it.value = opaqueExpression.cppCode
				]
			} else {
		       	target.compiledGuardBody = opaqueExpression.createSnippet
	       	}
	       	//Create the snippet code based on the snippet template
	       	return serializer.serialize(target.compiledGuardBody)
		} catch(IndexOutOfBoundsException cause) {
			throw new IllegalArgumentException('''There is no body for rALF language in «umlTransition.guard.name» constraint's specification.''', cause)
		}
	}
	
	private def boolean hasRalfBody(BodyOwner bodyOwner) {
		return bodyOwner.languages.contains(rALF)
	}
	
	private def String getCppCode(BodyOwner bodyOwner) {
		for (var int i = 0; i < bodyOwner.getLanguages().size(); i++) {
			val lang = bodyOwner.getLanguages().get(i);
			if ("C++".equals(lang) || "C/C++".equals(lang) || "C".equals(lang) || "CPP".equals(lang)) {
				return bodyOwner.getBodies().get(i);
			}
		}
		return ""
	}
	
	private def createSnippet(BodyOwner bodyOwner) throws IndexOutOfBoundsException {
		var ParsingResults result
		if(bodyOwner instanceof OpaqueBehavior) {
			result = parser.parse(bodyOwner.ralfBody,context)
		} else if(bodyOwner instanceof OpaqueExpression) {
			result = parser.parse(bodyOwner.ralfBody, context)
		}
       	//Create the snippet template based on the parsed abstract syntax tree
       	val compiler = new ReducedAlfSnippetTemplateCompiler(new UmlValueDescriptorFactory(engine))
       	return generator.createSnippet(result, context, compiler)
	}
	
	private def String getRalfBody(BodyOwner behavior) {
		var indexOfRALFBody = -1;
		for (var i = 0; i < behavior.getLanguages().size() && indexOfRALFBody == -1; i++) {
			if (behavior.getLanguages().get(i).equals(ReducedAlfParser.LANGUAGE_NAME)) {
				indexOfRALFBody = i;
			}
		}
		val bodies = behavior.getBodies();
		if (indexOfRALFBody >= 0) {
			return bodies.get(indexOfRALFBody);
		}
		return null
	}
}