package com.incquerylabs.emdw.cpp.bodyconverter.test.multiple

import com.ericsson.xtumlrt.oopl.cppmodel.CPPOperation
import com.ericsson.xtumlrt.oopl.cppmodel.CPPState
import com.ericsson.xtumlrt.oopl.cppmodel.CPPTransition
import com.incquerylabs.uml.ralf.transformation.impl.BodyConverter
import java.util.List
import org.eclipse.uml2.uml.BodyOwner
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
import com.incquerylabs.emdw.cpp.bodyconverter.test.AbstractConversionTest
import org.junit.AfterClass

@RunWith(Parameterized)
class AbstractMultipleConversionTest extends AbstractConversionTest {
	
    @Parameter(0)
    public String name
    
    @Parameter(1)
    public String modelPath
	
    @Parameter(2)
    public List<ConversionType> conversionTypes
    
	@Test
	def void test_multipleConversion() {
		initTrafos(modelPath)
	    
	    // *******************************************************************************
    	// Initialize body converter
    	// *******************************************************************************
    	bodyConverter = new BodyConverter
    	bodyConverter.initialize(engine, context)
    	
    	// Start test
    	
    	executeTrafos()
    	
    	val exceptions = <Exception>newArrayList
    	if(conversionTypes.contains(ConversionType.Operation)) {
    	// *******************************************************************************
    	// Call body converter
    	// *******************************************************************************
       			val operations = cppModel.eResource.allContents.filter(CPPOperation).toList
       			operations.forEach[ operation |
       				operationSum++
       				try {
       					val body = bodyConverter.convertOperation(operation)
       					codes += 
       					'''
       					Operation: «operation.qualifiedName»
       					rALF:
       						«operation.ralfCode»
       					C++ code:
       						«body»
       					
       					'''
       					operationOk++
       					wikiTable = 
       					'''
       					«wikiTable»
       					«operation.qualifiedName» | :white_check_mark: | «body.markdownBody»
       					'''
       				} catch (Exception ex) {
       					exceptions += ex
       					codes += 
       					'''
       					Operation: «operation.qualifiedName»)
       					rALF:
       						«operation.ralfCode»
       					Exception:
       						«ex.message»
       					
       					'''
       					wikiTable = 
       					'''
       					«wikiTable»
       					«operation.qualifiedName» | :x: | «ex.reducedMessage» 
       					'''
       				}
       			]
       		}
       		if(conversionTypes.contains(ConversionType.StateEntry)) {
       			val states = cppModel.eResource.allContents.filter(CPPState).filter[it.commonState.entryAction!=null].toList
       			states.forEach[ state |
       				stateEntrySum++
       				try {
       					val body = bodyConverter.convertStateEntry(state)
       					codes += 
       					'''
       					State Entry: «state.qualifiedName»
       					rALF:
       						«state.ralfCode(true)»
       					C++ code:
       					«body»
       					
       					'''
       					stateEntryOk++
       					wikiTable = 
       					'''
       					«wikiTable»
       					Entry of «state.qualifiedName» | :white_check_mark: | «body.markdownBody»
       					'''
       				} catch (Exception ex) {
       					exceptions += ex
       					codes += 
       					'''
       					State Entry: «state.qualifiedName»
       					rALF:
       						«state.ralfCode(true)»
       					Exception:
       						«ex.message»
       					
       					'''
       					wikiTable = 
       					'''
       					«wikiTable»
       					Entry of «state.qualifiedName» | :x: | «ex.reducedMessage» 
       					'''
       				}
       			]
       		}
       		if(conversionTypes.contains(ConversionType.StateExit)) {
       			val states = cppModel.eResource.allContents.filter(CPPState).filter[it.commonState.exitAction!=null].toList
       			states.forEach[ state |
       				stateExitSum++
       				try {
       					val body = bodyConverter.convertStateExit(state)
       					codes += 
       					'''
       					State Exit: «state.qualifiedName»
       					rALF:
       						«state.ralfCode(false)»
       					C++ code:
       					«body»
       					
       					'''
       					stateExitOk++
       					wikiTable = 
       					'''
       					«wikiTable»
       					Exit of «state.qualifiedName» | :white_check_mark: | «body.markdownBody»
       					'''
       				} catch (Exception ex) {
       					exceptions += ex
       					codes += 
       					'''
       					State Exit: «state.qualifiedName»
       					rALF:
       						«state.ralfCode(false)»
       					Exception:
       						«ex.message»
       					
       					'''
       					wikiTable = 
       					'''
       					«wikiTable»
       					Exit of «state.qualifiedName» | :x: | «ex.reducedMessage» 
       					'''
       				}
       			]
       		}
       		if(conversionTypes.contains(ConversionType.Transition)) {
       			val transitions = cppModel.eResource.allContents.filter(CPPTransition).filter[it.commonTransition.actionChain!=null && !it.commonTransition.actionChain.actions.empty].toList
       			transitions.forEach[ transition |
       				transitionSum++
       				try {
       					val body = bodyConverter.convertTransition(transition)
       					codes += 
       					'''
       					Transition: «transition.qualifiedName»
       					rALF:
       						«transition.ralfCode(false)»
       					C++ code:
       					«body»
       					
       					'''
       					transitionOk++
       					wikiTable = 
       					'''
       					«wikiTable»
       					Effect of «transition.qualifiedName» | :white_check_mark: | «body.markdownBody»
       					'''
       				} catch (Exception ex) {
       					exceptions += ex
       					codes += 
       					'''
       					Transition: «transition.qualifiedName»
       					rALF:
       						«transition.ralfCode(false)»
       					Exception:
       						«ex.message»
       					
       					'''
       					wikiTable = 
       					'''
       					«wikiTable»
       					Effect of «transition.qualifiedName» | :x: | «ex.reducedMessage» 
       					'''
       				}
       			]
       		}
       		if(conversionTypes.contains(ConversionType.TransitionGuard)) {
       			val transitions = cppModel.eResource.allContents.filter(CPPTransition).filter[it.commonTransition.guard!=null].toList
       			transitions.forEach[ transition |
       				transitionGuardSum++
       				try {
       					val body = bodyConverter.convertTransitionGuard(transition)
       					codes += 
       					'''
       					Transition Guard: «transition.qualifiedName»
       					rALF:
       						«transition.ralfCode(true)»
       					C++ code:
       					«body»
       					
       					'''
       					transitionGuardOk++
       					wikiTable = 
       					'''
       					«wikiTable»
       					Guard of «transition.qualifiedName» | :white_check_mark: | «body.markdownBody»
       					'''
       				} catch (Exception ex) {
       					exceptions += ex
       					codes += 
       					'''
       					Transition Guard: «transition.qualifiedName»
       					rALF:
       						«transition.ralfCode(true)»
       					Exception:
       						«ex.message»
       					
       					'''
       					wikiTable = 
       					'''
       					«wikiTable»
       					Guard of «transition.qualifiedName» | :x: | «ex.reducedMessage» 
       					'''
       				}
       			]
       		}
       	
       	assertEquals("Should not be any exception", 0, exceptions.size)
	}
	
    @AfterClass
    static def void printCodes() {
		println(
			'''
			«codes»
			
			'''
		)
		println(
			'''
			Action code type | Ok/Sum
			---------------- | ------
			Operation | «operationOk»/«operationSum»
			State entry | «stateEntryOk»/«stateEntrySum»
			State exit | «stateExitOk»/«stateExitSum»
			Transition | «transitionOk»/«transitionSum»
			Transition guard | «transitionGuardOk»/«transitionGuardSum»
			__SUM__ | __«okSum»__/__«sumSum»__
			
			«wikiTable»
			
			'''
		)
    }
	
	public static var codes = <String>newArrayList
	public static String wikiTable = '''
									UML fully qualified name | isOK | Exception / C++ code
									------------------------ | ---- | --------------------
									'''
	public static int operationSum
	public static int operationOk
	public static int stateEntrySum
	public static int stateEntryOk
	public static int stateExitSum
	public static int stateExitOk
	public static int transitionSum
	public static int transitionOk
	public static int transitionGuardSum
	public static int transitionGuardOk
	
    
    static def int getSumSum() {
    	return operationSum+stateEntrySum+stateExitSum+transitionSum+transitionGuardSum
    }
    
    static def int getOkSum() {
    	return operationOk+stateEntryOk+stateExitOk+transitionOk+transitionGuardOk
    }
	
	def String getQualifiedName(CPPOperation qne) '''Operation: «(engine.umlOperation2CppOperation.getAllValuesOfumlOperation(qne).head as Operation).qualifiedName.form»'''
	def String getQualifiedName(CPPState qne) '''State: «(engine.umlState2CppState.getAllValuesOfumlState(qne).head as State).qualifiedName.form»'''
	def String getQualifiedName(CPPTransition qne) '''Transition: «(engine.umlTransition2CppTransition.getAllValuesOfumlTransition(qne).head as Transition).qualifiedName.form»'''
	
	def form(String string) '''«string.replace("PhoneX::PhoneX::Implementation::", "")»'''
	def getReducedMessage(Exception ex) '''«ex.message.replace('\n', "<br />")»'''
	def markdownBody(String body) '''«body.replace("\r\n", "<br />")»'''
	
	def String ralfCode(CPPOperation operation) {
		val op = engine.umlOperation2CppOperation.getAllValuesOfumlOperation(operation).head as Operation
		return op.methods.filter(OpaqueBehavior).head.ralfCode
	}
	
	def String ralfCode(CPPState state, boolean isEntry) {
		val st = engine.umlState2CppState.getAllValuesOfumlState(state).head as State
		if(isEntry) {
			return (st.entry as OpaqueBehavior).ralfCode
		}
		return (st.exit as OpaqueBehavior).ralfCode
	}
	
	def String ralfCode(CPPTransition transition, boolean isGuard) {
		val tr = engine.umlTransition2CppTransition.getAllValuesOfumlTransition(transition).head as Transition
		if(isGuard) {
			return (tr.guard.specification as OpaqueExpression).ralfCode
		}
		return (tr.effect as OpaqueBehavior).ralfCode
	}
	
	def String getRalfCode(BodyOwner owner) {
		if(owner==null) {
			return "null"
		}
		val index = owner.languages.indexOf("rALF")
		if(index<0) {
			return "NO rALF CODE"
		}
		return owner.bodies.get(index)
		
	}
}