/*******************************************************************************
 * Copyright (c) 2015-2016, IncQuery Labs Ltd. and Ericsson AB
 * All rights reserved. This program and the accompanying materials
 * are made available under the terms of the Eclipse Public License v1.0
 * which accompanies this distribution, and is available at
 * http://www.eclipse.org/legal/epl-v10.html
 *
 * Contributors:
 *   Akos Horvath, Abel Hegedus, Zoltan Ujhelyi, Daniel Segesdi, Tamas Borbas, Robert Doczi, Peter Lunk - initial API and implementation
 *******************************************************************************/
package com.incquerylabs.emdw.cpp.bodyconverter.test.single

import com.incquerylabs.emdw.cpp.bodyconverter.test.AbstractConversionTest
import com.incquerylabs.emdw.cpp.bodyconverter.transformation.impl.BodyConverter
import com.incquerylabs.emdw.snippettemplate.Snippet
import org.eclipse.uml2.uml.BodyOwner
import org.eclipse.uml2.uml.Class
import org.eclipse.uml2.uml.NamedElement
import org.eclipse.uml2.uml.OpaqueBehavior
import org.eclipse.uml2.uml.OpaqueExpression
import org.eclipse.uml2.uml.Operation
import org.eclipse.uml2.uml.State
import org.eclipse.uml2.uml.Transition
import org.junit.Test
import org.junit.runner.RunWith
import org.junit.runners.Parameterized
import org.junit.runners.Parameterized.Parameter

import static org.junit.Assert.*

@RunWith(Parameterized)
abstract class AbstractSingleConversionTest extends AbstractConversionTest {
	
    @Parameter(0)
    public String name
    
    @Parameter(1)
    public String modelPath
    
    @Parameter(2)
    public String scopedUmlObjectFQN=""
	private NamedElement scopedUmlObject
	private org.eclipse.papyrusrt.xtumlrt.common.NamedElement scopedXumlrtObject
    
    @Parameter(3)
    public ConversionType conversionType
    
    @Parameter(4)
    public String ralfCode
    
    @Parameter(5)
    public String expectedOutput

    @Test 
    def void test_singleConversion() {
	    initTrafos(modelPath)
	    // *******************************************************************************
    	// Initialize body converter
    	// *******************************************************************************
    	bodyConverter = new BodyConverter
    	bodyConverter.initialize(engine, context)
    	
    	// Start test
		scopedUmlObject = resolveUmlTarget(scopedUmlObjectFQN, conversionType)
    	scopedUmlObject.replaceRalfCode
    	executeTrafos()
	    scopedXumlrtObject = scopedUmlObject.resolveXumlrtTarget(conversionType)
    	
    	var Snippet snippet
    	switch(conversionType) {
    	// *******************************************************************************
    	// Call body converter
    	// *******************************************************************************
    		case Operation: {
       			snippet = bodyConverter.convertOperation(scopedXumlrtObject as org.eclipse.papyrusrt.xtumlrt.common.Operation)
       		}
       		case StateEntry: {
       			snippet = bodyConverter.convertStateEntry(scopedXumlrtObject as org.eclipse.papyrusrt.xtumlrt.common.State)
       		}
       		case StateExit: {
       			snippet = bodyConverter.convertStateExit(scopedXumlrtObject as org.eclipse.papyrusrt.xtumlrt.common.State)
       		}
       		case Transition: {
       			snippet = bodyConverter.convertTransition(scopedXumlrtObject as org.eclipse.papyrusrt.xtumlrt.common.Transition)
       		}
       		case TransitionGuard: {
       			snippet = bodyConverter.convertTransitionGuard(scopedXumlrtObject as org.eclipse.papyrusrt.xtumlrt.common.Transition)
       		}
       	}
    	var serializedSnippet = snippet.serialize
       	serializedSnippet = serializedSnippet.purgeRalfComments
    	assertEquals("The created snippet does not match the expected result",expectedOutput,serializedSnippet)
	
    }
    
	
	def dispatch void replaceRalfCode(Operation operation) {
		val behavior = operation.getOrCreateBehavior
		behavior.replaceRalfCode
	}
    
	def dispatch void replaceRalfCode(State state) {
		val OpaqueBehavior behavior = state.getOrCreateBehavior
		behavior.replaceRalfCode
	}
    
	def dispatch void replaceRalfCode(Transition transition) {
		if(conversionType==ConversionType.Transition) {
			val behavior = transition.getOrCreateBehavior
			behavior.replaceRalfCode
		} else {
			val expression = transition.guard.specification as OpaqueExpression
			expression.replaceRalfCode
		}
	}
	
	def dispatch void replaceRalfCode(BodyOwner owner) {
		val index = owner.languages.indexOf("rALF")
		if(index<0) {
			owner.addRalfBody
		} else {
			owner.bodies.set(index, ralfCode)
		}
	}
	
	def dispatch OpaqueBehavior getOrCreateBehavior(Operation operation) {
		var behavior = operation.methods.filter(OpaqueBehavior).head
		if(behavior==null) {
			behavior = umlFactory.createOpaqueBehavior => [
				(operation.owner as Class).nestedClassifiers += it
				operation.methods += it
			]
		} 
		return behavior
	}
	
	def dispatch OpaqueBehavior getOrCreateBehavior(Transition transition) {
		var behavior = transition.effect as OpaqueBehavior
		if(behavior==null) {
			behavior = umlFactory.createOpaqueBehavior => [
				transition.effect = it
			]
		} 
		return behavior
	}
	
	def dispatch OpaqueBehavior getOrCreateBehavior(State state) {
		if(conversionType==ConversionType.StateEntry) {
			if(state.entry!=null && state.entry instanceof OpaqueBehavior) {
				return state.entry as OpaqueBehavior
			} else {
				return umlFactory.createOpaqueBehavior => [
					state.entry = it
				]
			}
		} else {
			if(state.exit!=null && state.exit instanceof OpaqueBehavior) {
				return state.exit as OpaqueBehavior
			} else {
				return umlFactory.createOpaqueBehavior => [
					state.exit = it
				]
			}
		}
	}
	
	def BodyOwner addRalfBody(BodyOwner owner) {
		return owner => [
			it.languages += "rALF"
			it.bodies += ralfCode
		]
	}
}
