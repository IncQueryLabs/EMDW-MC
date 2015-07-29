package com.incquerylabs.emdw.cpp.codegeneration.templates

import com.ericsson.xtumlrt.oopl.cppmodel.CPPClass
import com.ericsson.xtumlrt.oopl.cppmodel.CPPEvent
import com.ericsson.xtumlrt.oopl.cppmodel.CPPState
import com.ericsson.xtumlrt.oopl.cppmodel.CPPTransition
import com.incquerylabs.emdw.cpp.codegeneration.queries.CppCodeGenerationQueries
import com.incquerylabs.emdw.cpp.codegeneration.queries.CppTransitionInfoMatch
import com.incquerylabs.emdw.cpp.codegeneration.queries.CppTransitionToTerminateMatch
import com.incquerylabs.emdw.cpp.codegeneration.util.TransitionInfo
import java.util.List
import org.eclipse.incquery.runtime.api.IncQueryEngine
import org.eclipse.papyrusrt.xtumlrt.common.Transition
import org.eclipse.papyrusrt.xtumlrt.common.Trigger
import org.eclipse.papyrusrt.xtumlrt.xtuml.XTClassEvent
import org.eclipse.papyrusrt.xtumlrt.xtuml.XTEventTrigger

class StateTemplates {
	public static val TERMINATE_POSTFIX = "TERMINATE"
	
	val codeGenQueries = CppCodeGenerationQueries.instance
	
	// TODO @Inject
	val generateTracingCode = CPPTemplates.GENERATE_TRACING_CODE
	val ActionCodeTemplates actionCodeTemplates
	val EventTemplates eventTemplates
	val IncQueryEngine engine
	
	new(IncQueryEngine engine) {
		this.engine = engine
		actionCodeTemplates = new ActionCodeTemplates(engine)
		eventTemplates = new EventTemplates(engine)
	}
	
	def enumInClassHeader(CPPClass cppClass) {
		val terminatePointMatcher = codeGenQueries.getCppClassTerminatePoints(engine)
		val terminatePointCount = terminatePointMatcher.countMatches(null, cppClass, null)
		val cppClassName = cppClass.cppName
		val cppStates = cppClass.subElements.filter(CPPState).sortBy[cppName]
		'''
		enum «cppClassName»_state {
«««			Create exctly one terminate point state if there is at least one TerminatePoint in the xtUML model
			«IF terminatePointCount > 0 »
				«cppClassName»_STATE_«TERMINATE_POSTFIX»«IF cppStates.length > 0»,«ENDIF»
			«ENDIF»
			«FOR state : cppStates SEPARATOR ","»
				«cppClassName»_STATE_«state.cppName»
			«ENDFOR»
		};
		'''
	}
	
	def methodDeclarationsInClassHeader(CPPState state) {
		val stateCppName = state.cppName
		'''
		// «stateCppName» state
		«performEntryActionDeclaration(state)»

		«processEventInStateDeclaration(state)»

		«FOR transitionInfo : state.orderTransitions»
			«evaluateGuardOnTransitionDeclaration(transitionInfo)»
			«performActionsOnTransitionDeclaration(transitionInfo)»
		«ENDFOR»
		«performExitActionDeclaration(state)»
		'''
	}
	
	def methodDefinitionsInClassBody(CPPState state, CPPClass cppClass) {
		val stateCppName = state.cppName
		'''
		// «stateCppName» state
		«processEventInStateDefinition(cppClass, state)»
		
		«performEntryActionDefinition(cppClass, state)»
		
		«FOR transitionInfo : state.orderTransitions»
			«evaluateGuardOnTransitionDefinition(cppClass, transitionInfo)»
			«performActionsOnTransitionDefinition(cppClass, transitionInfo)»
		«ENDFOR»
		«performExitActionDefinition(cppClass, state)»
		'''
	}
	
	def processEventInStateMethodName(CPPState state){
		'''process_event_in_«state.cppName»_state'''
	}
	
	def processEventInStateSignature(CPPState state){
		'''«processEventInStateMethodName(state)»(const «ClassTemplates.EventFQN»* event)'''
	}
	
	def processEventInStateDeclaration(CPPState state){
		'''void «processEventInStateSignature(state)»;'''
	}
	
	def processEventInStateDefinition(CPPClass cppClass, CPPState cppState){
		val cppClassFQN = cppClass.cppQualifiedName
		val stateCppName = cppState.cppName
		'''
		void «cppClassFQN»::«processEventInStateSignature(cppState)»{
			«tracingMessage('''  [State: «stateCppName»] Processing event''')»
			
			«FOR transitionInfo : cppState.orderTransitions SEPARATOR '''else''' AFTER '''else'''»
				«processEventForTransitionTemplate(cppClass, transitionInfo)»
			«ENDFOR» 
			{
				// event not processed in state
				«tracingMessage('''    [UNPROCESSED] Event cannot be processed in this state''')»
			}
			return;
		}
		'''
	}
	
	def processEventForTransitionTemplate(CPPClass cppClass,TransitionInfo transitionInfo){
		val sourceState = transitionInfo.cppSource
		val sourceStateCppName = sourceState.cppName
		val targetState = transitionInfo.cppTarget
		val targetStateCppName = targetState?.cppName ?: TERMINATE_POSTFIX
		val cppTransition = transitionInfo.cppTransition
		val eventName = "event"
		
		'''
		// «sourceStateCppName» -«cppTransition.cppName»-> «targetStateCppName» transition
		if(«generatedTransitionCondition(transitionInfo)») {
			«performExitActionCall(sourceState, eventName)»
			
			«performActionsOnTransitionCall(transitionInfo, eventName)»
			
			«performEntryActionCall(targetState, eventName)»
			
			«changeStateTemplate(cppClass, transitionInfo)»
		}
		'''
	}
	
	def evaluateGuardOnTransitionMethodName(TransitionInfo transitionInfo){
		val targetState = transitionInfo.cppTarget
		val sourceStateCppName = transitionInfo.cppSource.cppName
		val targetStateCppName = targetState?.cppName ?: TERMINATE_POSTFIX
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
		val targetStateCppName = targetState?.cppName ?: TERMINATE_POSTFIX
		val transition = transitionInfo.transition
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
		val targetStateCppName = targetState?.cppName ?: TERMINATE_POSTFIX
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
		val targetStateCppName = targetState?.cppName ?: TERMINATE_POSTFIX
		val transition = transitionInfo.transition
		val eventType = eventType(transitionInfo.cppTransition)
		val castedEventName = "casted_const_event"
		
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
	
	def performEntryActionMethodName(CPPState state){
		'''perform_entry_action_for_«state.cppName»_state'''
	}
	
	def performEntryActionSignature(CPPState state){
		'''«performEntryActionMethodName(state)»(const «ClassTemplates.EventFQN»* event)'''
	}
	
	def performEntryActionDeclaration(CPPState state){
		'''
		«IF state.commonState.entryAction != null»
			void «performEntryActionSignature(state)»;
		«ENDIF»
		'''
	}
	
	def performEntryActionDefinition(CPPClass cppClass, CPPState state){
		val cppClassFQN = cppClass.cppQualifiedName
		val eventType = incomingEventType(state)
		val castedEventName = "casted_const_event"
		
		'''
		«IF state.commonState.entryAction != null»
			void «cppClassFQN»::«performEntryActionSignature(state)»{
				const «eventType»* «castedEventName» = static_cast<const «eventType»*>(event);
				«tracingMessage('''    [Entry: INIT]''')»
				«actionCodeTemplates.generateActionCode(state.commonState.entryAction)»
			}
		«ENDIF»
		'''
	}
	
	def performEntryActionCall(CPPState targetState, String eventName){
		'''
		«IF targetState == null»
«««			no entry action for Terminate state
		«ELSEIF targetState.commonState.entryAction != null»
			// entry action
			«performEntryActionMethodName(targetState)»(«eventName»);
		«ELSE»
			// no entry action
		«ENDIF»
		'''
	}
	
	def performExitActionMethodName(CPPState state){
		'''perform_exit_action_for_«state.cppName»_state'''
	}
	
	def performExitActionSignature(CPPState state){
		'''«performExitActionMethodName(state)»(const «ClassTemplates.EventFQN»* event)'''
	}
	
	def performExitActionDeclaration(CPPState state){
		'''
		«IF state.commonState.exitAction != null»
			void «performExitActionSignature(state)»;
		«ENDIF»
		'''
	}
	
	def performExitActionDefinition(CPPClass cppClass, CPPState state){
		val cppClassFQN = cppClass.cppQualifiedName
		val eventType = outgoingEventType(state)
		val castedEventName = "casted_const_event"
		
		'''
		«IF state.commonState.exitAction != null»	
			void «cppClassFQN»::«performExitActionSignature(state)»{
				const «eventType»* «castedEventName» = static_cast<const «eventType»*>(event);
				«tracingMessage('''    [Exit]''')»
				«actionCodeTemplates.generateActionCode(state.commonState.exitAction)»
			}
		«ENDIF»
		'''
	}
	
	def performExitActionCall(CPPState sourceState, String eventName){
		'''
		«IF sourceState.commonState.exitAction != null»	
			// exit action
			«performExitActionMethodName(sourceState)»(«eventName»);
		«ELSE»
			// no exit action
		«ENDIF»
		'''
	}
	
	def changeStateTemplate(CPPClass cppClass, TransitionInfo transitionInfo){
		val cppClassName = cppClass.cppName
		val sourceState = transitionInfo.cppSource
		val targetState = transitionInfo.cppTarget
		val targetStateCppName = targetState?.cppName ?: TERMINATE_POSTFIX
		val cppTransition = transitionInfo.cppTransition
		'''
		«IF sourceState != targetState»
			// state change
			current_state = «cppClassName»_STATE_«targetStateCppName»;
			«tracingMessage('''    State changed to «targetStateCppName»''')»
		«ELSE»
			// no state change
			«tracingMessage('''    No state change on «cppTransition.cppName»''')»
		«ENDIF»
		'''
	}
	
	def incomingEventType(CPPState cppState){
		val eventMatcher = codeGenQueries.getCppStateIncomingCppEvents(engine)
		val cppEvents = eventMatcher.getAllValuesOfcppEvent(cppState)
		return eventType(cppEvents)
	}
	
	def outgoingEventType(CPPState cppState){
		val eventMatcher = codeGenQueries.getCppStateOutgoingCppEvents(engine)
		val cppEvents = eventMatcher.getAllValuesOfcppEvent(cppState)
		return eventType(cppEvents)
	}
	
	def eventType(CPPTransition cppTransition){
		val eventMatcher = codeGenQueries.getCppTransitionCppEvents(engine)
		val cppEvents = eventMatcher.getAllValuesOfcppEvent(cppTransition)
		return eventType(cppEvents)
	}
	
	def eventType(Iterable<CPPEvent> events){
		var CharSequence ancestorQualifiedName = ClassTemplates.EventFQN
		if(events.length > 0) {
			val lowestCommonAncestorEvent = events.fold(events.head,[result, event | getLowestCommonAncestor(result, event)])
			if (lowestCommonAncestorEvent != null){
				ancestorQualifiedName = eventTemplates.generatedEventClassQualifiedName(lowestCommonAncestorEvent)
			}
		}
		
		return ancestorQualifiedName
	}
	
	def getLowestCommonAncestor(CPPEvent event1, CPPEvent event2) {
		val eventAncestorMatcher = codeGenQueries.getCppEventCommonAncestor(engine)
		val cppEventMatcher = codeGenQueries.getCppEvents(engine)
		val commonXtAncestors = eventAncestorMatcher.getAllValuesOfcommonXtAncestor(event1, event2, null)
		if(commonXtAncestors.isNullOrEmpty){
			return null
		}
		var currentXtEvent = event1.xtEvent as XTClassEvent
		while(!commonXtAncestors.contains(currentXtEvent)){
			currentXtEvent = currentXtEvent.definingEvents.head
		}
		val lowestCommonAncestor = cppEventMatcher.getAllValuesOfcppEvent(currentXtEvent).head
		return lowestCommonAncestor
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
			'''event->_id == «cppClass.cppQualifiedName»::«cppClass.cppName»_EVENT_«cppEvent.cppName»'''
		} else {
			'''
			(
			«FOR trigger : triggers SEPARATOR " || "»
				«val cppClass = trigger.getEvent.eContainer as CPPClass »
				event->_id == «cppClass.cppQualifiedName»::«cppClass.cppName»_EVENT_«trigger.getEvent.cppName»
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
	
	def tracingMessage(String message) {
		'''
		«IF generateTracingCode»
			::std::cout << "«message»" << ::std::endl;
		«ENDIF»
		'''
	}
}