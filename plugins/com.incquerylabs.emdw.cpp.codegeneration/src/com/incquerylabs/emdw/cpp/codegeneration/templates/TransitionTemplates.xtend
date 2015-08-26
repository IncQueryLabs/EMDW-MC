package com.incquerylabs.emdw.cpp.codegeneration.templates

import com.ericsson.xtumlrt.oopl.cppmodel.CPPClass
import com.ericsson.xtumlrt.oopl.cppmodel.CPPState
import com.incquerylabs.emdw.cpp.codegeneration.queries.CppTransitionInfoMatch
import com.incquerylabs.emdw.cpp.codegeneration.queries.CppTransitionToTerminateMatch
import com.incquerylabs.emdw.cpp.codegeneration.util.TransitionInfo
import java.util.List
import org.eclipse.incquery.runtime.api.IncQueryEngine
import org.eclipse.papyrusrt.xtumlrt.common.Trigger
import org.eclipse.papyrusrt.xtumlrt.xtuml.XTEventTrigger
import com.incquerylabs.uml.ralf.transformation.impl.BodyConverter
import org.eclipse.incquery.runtime.api.AdvancedIncQueryEngine
import com.incquerylabs.uml.ralf.scoping.BasicUMLContextProvider

class TransitionTemplates extends CPPTemplate {
	val BodyConverter bodyConverter
	
	extension val EventTemplates eventTemplates
	extension val ActionCodeTemplates actionCodeTemplates
	
	new(IncQueryEngine engine) {
		super(engine)
		eventTemplates = new EventTemplates(engine)
		actionCodeTemplates = new ActionCodeTemplates(engine)
		bodyConverter = new BodyConverter()
		bodyConverter.initialize(engine as AdvancedIncQueryEngine, new BasicUMLContextProvider(engine as AdvancedIncQueryEngine))
	}
	
	def evaluateGuardOnTransitionMethodName(TransitionInfo transitionInfo){
		val targetState = transitionInfo.cppTarget
		val sourceStateCppName = transitionInfo.cppSource.cppName
		val targetStateCppName = targetState?.cppName ?: StateTemplates.TERMINATE_POSTFIX
		val transitionCppName = transitionInfo.cppTransition.cppName
		'''evaluate_guard_on_«transitionCppName»_transition_from_«sourceStateCppName»_to_«targetStateCppName»'''
	}
	
	def evaluateGuardOnTransitionSignature(TransitionInfo transitionInfo){
		'''«evaluateGuardOnTransitionMethodName(transitionInfo)»(const «ClassTemplates.EventFQN»* event)'''
	}
	
	def evaluateGuardOnTransitionDeclaration(TransitionInfo transitionInfo){
		val transition = transitionInfo.transition
		'''
		«IF transition.guard != null»
			bool «evaluateGuardOnTransitionSignature(transitionInfo)»;
		«ENDIF»
		'''
	}
	
	def evaluateGuardOnTransitionDefinition(CPPClass cppClass, TransitionInfo transitionInfo){
		val cppClassFQN = cppClass.cppQualifiedName
		val targetState = transitionInfo.cppTarget
		val targetStateCppName = targetState?.cppName ?: StateTemplates.TERMINATE_POSTFIX
		val transition = transitionInfo.transition
		if(transition.guard != null) {
			if(transition.guard.body?.source == null) {
				transition.guard.body.source = bodyConverter.convertTransitionGuard(transitionInfo.cppTransition)
			}
		}
		'''
		«IF transition.guard != null»
			bool «cppClassFQN»::«evaluateGuardOnTransitionSignature(transitionInfo)»{
				«tracingMessage('''    [Guard: -> «targetStateCppName»]''')»
				
				if(«actionCodeTemplates.generateActionCode(transition.guard.body)») {
					return true;
				} else {
					«tracingMessage('''    Guard false''')»
					return false;
				}
			}
		«ENDIF»
		'''
	}
	
	def performActionsOnTransitionMethodName(TransitionInfo transitionInfo){
		val sourceState = transitionInfo.cppSource
		val targetState = transitionInfo.cppTarget
		val sourceStateCppName = sourceState.cppName
		val targetStateCppName = targetState?.cppName ?: StateTemplates.TERMINATE_POSTFIX
		val cppTransition = transitionInfo.cppTransition
		'''perform_actions_on_«cppTransition.cppName»_transition_from_«sourceStateCppName»_to_«targetStateCppName»'''
	}
	
	def performActionsOnTransitionSignature(TransitionInfo transitionInfo){
		'''«performActionsOnTransitionMethodName(transitionInfo)»(const «ClassTemplates.EventFQN»* event)'''
	}
	
	def performActionsOnTransitionDeclaration(TransitionInfo transitionInfo){
		val transition = transitionInfo.transition		
		'''
		«IF transition.actionChain != null»
			void «performActionsOnTransitionSignature(transitionInfo)»;
		«ENDIF»
		'''
	}
	
	def performActionsOnTransitionDefinition(CPPClass cppClass, TransitionInfo transitionInfo){
		val cppClassFQN = cppClass.cppQualifiedName
		val targetState = transitionInfo.cppTarget
		val targetStateCppName = targetState?.cppName ?: StateTemplates.TERMINATE_POSTFIX
		val transition = transitionInfo.transition
		val eventType = eventType(transitionInfo.cppTransition)
		val castedEventName = "casted_const_event"
		val transitionChain = transition.actionChain
		if(transitionChain!=null && transitionChain.actions.size>0) {
			if(transitionChain.actions.get(0).source==null) {
				transitionChain.actions.get(0).source = bodyConverter.convertTransition(transitionInfo.cppTransition)
			}
		}
		
		'''
		«IF transition.actionChain != null»
			void «cppClassFQN»::«performActionsOnTransitionSignature(transitionInfo)»{
				const «eventType»* «castedEventName» = static_cast<const «eventType»*>(event);
				«tracingMessage('''    [Action: -> «targetStateCppName»]''')»
				«actionCodeTemplates.generateActionCode(transition.actionChain)»
			}
		«ENDIF»
		'''
	}
	
	def performActionsOnTransitionCall(TransitionInfo transitionInfo, String eventName){
		val transition = transitionInfo.transition
		'''
		«IF transition.actionChain != null»
			// transition action
			«performActionsOnTransitionMethodName(transitionInfo)»(«eventName»);
		«ELSE»
			// no transition action
		«ENDIF»
		'''
	}
	
	def orderTransitions(CPPState cppState) {
		val compositeStateMatcher = codeGenQueries.getCompositeStateSubStates(engine)
		val cppTransitionInfoMatcher = codeGenQueries.getCppTransitionInfo(engine)
		val cppTransitionToTerminateMatcher = codeGenQueries.getCppTransitionToTerminate(engine)
		
		val commonState = cppState.commonState
		val compositeState = compositeStateMatcher.getOneArbitraryMatch(null, commonState).compositeState
		
		val List<TransitionInfo> transitionsWithTrigger = newArrayList
		val List<TransitionInfo> transitionsWithNoTrigger = newArrayList
		
		// separate transitions with trigger and without trigger		
		compositeState.transitions.filter[sourceVertex == commonState].forEach[transition |
			val transitionToStateMatch = cppTransitionInfoMatcher.getOneArbitraryMatch(null, transition, cppState, null)
			val transitionToTerminateMatch = cppTransitionToTerminateMatcher.getOneArbitraryMatch(null, transition, cppState)
			if(transitionToStateMatch != null){
				if(transition.triggers.empty){
					transitionsWithNoTrigger += transitionToStateMatch.createTransitionInfo
				} else {
					transitionsWithTrigger += transitionToStateMatch.createTransitionInfo
				}
			} else if(transitionToTerminateMatch != null) {
				if(transition.triggers.empty){
					transitionsWithNoTrigger += transitionToTerminateMatch.createTransitionInfo
				} else {
					transitionsWithTrigger += transitionToTerminateMatch.createTransitionInfo
				}
			}
		]
		
		transitionsWithTrigger
	}
	
	def createTransitionInfo(CppTransitionInfoMatch match){
		new TransitionInfo(match.cppTransition, match.transition, match.cppSource, match.cppTarget)
	}
	
	def createTransitionInfo(CppTransitionToTerminateMatch match){
		new TransitionInfo(match.cppTransition, match.transition, match.cppSource, null)
	}
	
	def generatedTransitionCondition(TransitionInfo transitionInfo) {
		val transition = transitionInfo.transition
		var condition = transitionInfo.generateEventMatchingCondition()
		val guardCall = '''«evaluateGuardOnTransitionMethodName(transitionInfo)»(event)'''

		if(transition.guard != null){
			if(condition.length > 0){
				condition = condition + " && "
			}
			condition = '''«condition»«guardCall»'''
		}
		condition
	}
	
	def generateEventMatchingCondition(TransitionInfo transitionInfo) {
		val transition = transitionInfo.transition
		val triggers = transition.triggers
		if(triggers.empty) {
			''''''
		} else if(triggers.size == 1){
			val trigger = triggers.head
			val cppEvent = trigger.getEvent
			val cppClass = cppEvent.eContainer as CPPClass 
			'''event->_id == «eventTemplates.eventEnumeratorQualifiedName(cppClass, cppEvent)»'''
		} else {
			'''
			(
			«FOR trigger : triggers SEPARATOR " || "»
				«val cppClass = trigger.getEvent.eContainer as CPPClass »
				event->_id == «eventTemplates.eventEnumeratorQualifiedName(cppClass, trigger.getEvent)»
			«ENDFOR»
			)
			'''
		}
	}
	
	def getEvent(Trigger trigger) {
		val cppEventMatcher = codeGenQueries.getCppEvents(engine)
		val xttrigger = trigger as XTEventTrigger
		val cppEvent = cppEventMatcher.getAllValuesOfcppEvent(xttrigger.signal).head
		return cppEvent
	}
}
