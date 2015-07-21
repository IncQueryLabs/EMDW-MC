package com.incquerylabs.emdw.cpp.codegeneration.templates

import com.ericsson.xtumlrt.oopl.cppmodel.CPPClass
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
import org.eclipse.papyrusrt.xtumlrt.xtuml.XTEventTrigger

class StateTemplates {
	public static val TERMINATE_POSTFIX = "TERMINATE"
	
	val codeGenQueries = CppCodeGenerationQueries.instance
	
	// TODO @Inject
	val generateTracingCode = CPPTemplates.GENERATE_TRACING_CODE
	val ActionCodeTemplates actionCodeTemplates
	val IncQueryEngine engine
	
	new(IncQueryEngine engine) {
		this.engine = engine
		actionCodeTemplates = new ActionCodeTemplates(engine)
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
		«performEntryActionDefinition(cppClass, state)»
		
		«processEventInStateDefinition(cppClass, state)»
		
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
		val cppClassName = cppClass.cppName
		val sourceState = transitionInfo.cppSource
		val sourceStateCppName = sourceState.cppName
		val targetState = transitionInfo.cppTarget
		val targetStateCppName = targetState?.cppName ?: TERMINATE_POSTFIX
		val cppTransition = transitionInfo.cppTransition
		'''
		// «sourceStateCppName» -«cppTransition.cppName»-> «targetStateCppName» transition
		if(«cppTransition.generatedTransitionCondition(cppClassName, sourceStateCppName, targetStateCppName)») {
			«performExitActionCall(sourceState)»
			
			«performActionsOnTransitionCall(transitionInfo)»
			
			«performEntryActionCall(targetState)»
			
			«changeStateTemplate(cppClass, transitionInfo)»
		}
		'''
	}
	
	def evaluateGuardOnTransitionMethodName(TransitionInfo transitionInfo){
		val sourceState = transitionInfo.cppSource
		val targetState = transitionInfo.cppTarget
		val sourceStateCppName = sourceState.cppName
		val targetStateCppName = targetState?.cppName ?: TERMINATE_POSTFIX
		val cppTransition = transitionInfo.cppTransition
		'''evaluate_guard_on_«cppTransition.cppName»_transition_from_«sourceStateCppName»_to_«targetStateCppName»'''
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
		'''
		«IF transition.actionChain != null»
			void «cppClassFQN»::«performActionsOnTransitionSignature(transitionInfo)»{
				«tracingMessage('''    [Action: -> «targetStateCppName»]''')»
				«actionCodeTemplates.generateActionCode(transition.actionChain)»
			}
		«ENDIF»
		'''
	}
	
	def performActionsOnTransitionCall(TransitionInfo transitionInfo){
		val transition = transitionInfo.transition
		'''
		«IF transition.actionChain != null»
			// transition action
			«performActionsOnTransitionMethodName(transitionInfo)»(event);
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
		'''
		«IF state.commonState.entryAction != null»
			void «cppClassFQN»::«performEntryActionSignature(state)»{
				«tracingMessage('''    [Entry: INIT]''')»
				«actionCodeTemplates.generateActionCode(state.commonState.entryAction)»
			}
		«ENDIF»
		'''
	}
	
	def performEntryActionCall(CPPState targetState){
		'''
		«IF targetState == null»
«««			no entry action for Terminate state
		«ELSEIF targetState.commonState.entryAction != null»
			// entry action
			«performEntryActionMethodName(targetState)»(event);
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
		'''
		«IF state.commonState.exitAction != null»	
			void «cppClassFQN»::«performExitActionSignature(state)»{
				«tracingMessage('''    [Exit]''')»
				«actionCodeTemplates.generateActionCode(state.commonState.exitAction)»
			}
		«ENDIF»
		'''
	}
	
	def performExitActionCall(CPPState sourceState){
		'''
		«IF sourceState.commonState.exitAction != null»	
			// exit action
			«performExitActionMethodName(sourceState)»(event);
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
	
	def generatedTransitionCondition(CPPTransition cppTransition, String cppClassName, String stateCppName, String target) {
		val transition = cppTransition.commonTransition
		var condition = transition.generateEventMatchingCondition(cppClassName)
		val cppTransitionInfoMatcher = codeGenQueries.getCppTransitionInfo(engine)
		val transitionInfo = cppTransitionInfoMatcher.getOneArbitraryMatch(cppTransition, transition, null, null).createTransitionInfo
		val guardCall = '''«evaluateGuardOnTransitionMethodName(transitionInfo)»(event)'''

		if(transition.guard != null){
			if(condition.length > 0){
				condition = condition + " && "
			}
			condition = '''«condition»«guardCall»'''
		}
		condition
	}
	
	def generateEventMatchingCondition(Transition transition, String cppClassName) {
		val triggers = transition.triggers
		if(triggers.empty) {
			''''''
		} else if(triggers.size == 1){
			'''event->_id == «cppClassName»_EVENT_«triggers.head.getEventId»'''
		} else {
			'''
			(«FOR trigger : triggers SEPARATOR " || "»event->_id == «trigger.getEventId»«ENDFOR»)'''
		}
	}
	
	def getEventId(Trigger trigger) {
		val cppEventMatcher = codeGenQueries.getCppEvents(engine)
		val xttrigger = trigger as XTEventTrigger
		val cppEvent = cppEventMatcher.getAllValuesOfcppEvent(xttrigger.signal).head
		cppEvent.cppName
	}
	
	def tracingMessage(String message) {
		'''
		«IF generateTracingCode»
			::std::cout << "«message»" << ::std::endl;
		«ENDIF»
		'''
	}
}