package com.incquerylabs.uml.ralf.transformation.impl

import com.ericsson.xtumlrt.oopl.cppmodel.CPPOperation
import com.ericsson.xtumlrt.oopl.cppmodel.CPPState
import com.ericsson.xtumlrt.oopl.cppmodel.CPPTransition
import com.incquerylabs.emdw.cpp.common.descriptor.factory.impl.UmlValueDescriptorFactory
import com.incquerylabs.emdw.snippettemplate.serializer.ReducedAlfSnippetTemplateSerializer
import com.incquerylabs.uml.ralf.api.impl.ReducedAlfGenerator
import com.incquerylabs.uml.ralf.api.impl.ReducedAlfParser
import com.incquerylabs.uml.ralf.scoping.BasicUMLContextProvider
import com.incquerylabs.uml.ralf.snippetcompiler.ReducedAlfSnippetTemplateCompiler
import com.incquerylabs.uml.ralf.transformation.IBodyConverter
import com.incquerylabs.uml.ralf.transformation.impl.queries.UmlCppMappingQueries
import org.eclipse.incquery.runtime.api.AdvancedIncQueryEngine
import org.eclipse.uml2.uml.BodyOwner
import org.eclipse.uml2.uml.OpaqueBehavior
import org.eclipse.uml2.uml.OpaqueExpression
import org.eclipse.uml2.uml.Operation
import org.eclipse.uml2.uml.State
import org.eclipse.uml2.uml.Transition
import com.incquerylabs.uml.ralf.api.impl.ParsingResults

class BodyConverter implements IBodyConverter {
	extension UmlCppMappingQueries mappingQueries = UmlCppMappingQueries.instance
	
	private static final val rALF = "rALF"
	
	private AdvancedIncQueryEngine engine
	private ReducedAlfParser parser
	private BasicUMLContextProvider context
	private ReducedAlfSnippetTemplateCompiler compiler
	private ReducedAlfSnippetTemplateSerializer serializer
	private ReducedAlfGenerator generator
	
	override void initialize(AdvancedIncQueryEngine engine, BasicUMLContextProvider context) {
		this.engine = engine
    	parser = new ReducedAlfParser
	    this.context = context
	    compiler = new ReducedAlfSnippetTemplateCompiler(new UmlValueDescriptorFactory(engine), context)
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
		val opaqueBehavior = umlOperation.methods.filter(OpaqueBehavior).filter[it.languages.contains(rALF)].head
		if(opaqueBehavior==null) {
			throw new IllegalArgumentException('''There is no OpaqueBehavior with rALF language for «umlOperation.name» operation.''')
		}
		try {
			context.contextObject = opaqueBehavior
			return opaqueBehavior.parseAndGenerate
		} catch(IndexOutOfBoundsException cause) {
			throw new IllegalArgumentException('''There is no body for rALF language in «umlOperation.name» operation.''', cause)
		}
	}
	
	override String convertStateEntry(CPPState target) throws IllegalArgumentException {
		val umlState = engine.umlState2CppState.getAllValuesOfumlState(target).head as State 
		var OpaqueBehavior behavior = umlState.entry as OpaqueBehavior
		
		if(behavior==null) {
			throw new IllegalArgumentException('''There is no OpaqueBehavior for «umlState.name» state's entry.''')
		}
		try {
			context.contextObject = behavior
			return behavior.parseAndGenerate
		} catch(IndexOutOfBoundsException cause) {
			throw new IllegalArgumentException('''There is no body for rALF language in «umlState.name» state's entry.''', cause)
		}
	}
	
	override String convertStateExit(CPPState target) throws IllegalArgumentException {
		val umlState = engine.umlState2CppState.getAllValuesOfumlState(target).head as State 
		var OpaqueBehavior behavior = umlState.exit as OpaqueBehavior
		
		if(behavior==null) {
			throw new IllegalArgumentException('''There is no OpaqueBehavior for «umlState.name» state's exit.''')
		}
		try {
			context.contextObject = behavior
			return behavior.parseAndGenerate
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
			return opaqueBehavior.parseAndGenerate
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
			return opaqueExpression.parseAndGenerate
		} catch(IndexOutOfBoundsException cause) {
			throw new IllegalArgumentException('''There is no body for rALF language in «umlTransition.guard.name» constraint's specification.''', cause)
		}
	}
	
	private def String parseAndGenerate(BodyOwner opaqueBehavior) throws IndexOutOfBoundsException {
//		val input = opaqueBehavior.bodies.get(opaqueBehavior.languages.indexOf(rALF))
		var ParsingResults result
		if(opaqueBehavior instanceof OpaqueBehavior) {
			result = parser.parse(opaqueBehavior, engine)
		} else if(opaqueBehavior instanceof OpaqueExpression) {
			result = parser.parse(opaqueBehavior, engine)
		}
       	//Create the snippet template based on the parsed abstract syntax tree
       	val snippet = generator.createSnippet(result, compiler)
       	//Create the snippet code based on the snippet template
       	return serializer.serialize(snippet)
	}
}