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
		«IF state.commonState.entryAction != null»
			void perform_entry_action_for_«stateCppName»_state(const Event* event);
		«ENDIF»

		void process_event_in_«stateCppName»_state(const Event* event);

		«FOR transitionInfo : state.orderTransitions»
			«val targetState = transitionInfo.cppTarget»
			«val targetStateCppName = targetState?.cppName ?: TERMINATE_POSTFIX»
			«val transition = transitionInfo.transition»
			«val cppTransition = transitionInfo.cppTransition»
			«IF transition.guard != null»
				bool evaluate_guard_on_«cppTransition.cppName»_transition_from_«stateCppName»_to_«targetStateCppName»(const Event* event);
			«ENDIF»
			«IF transition.actionChain != null»
				void perform_actions_on_«cppTransition.cppName»_transition_from_«stateCppName»_to_«targetStateCppName»(const Event* event);
			«ENDIF»
		«ENDFOR»
		«IF state.commonState.exitAction != null»
			void perform_exit_action_for_«stateCppName»_state(const Event* event);
		«ENDIF»
		'''
	}
	
	def methodDefinitionsInClassBody(CPPState state, CPPClass cppClass) {
		val cppClassName = cppClass.cppName
		val cppFQN = cppClass.cppQualifiedName
		
		'''
		«val stateCppName = state.cppName»
		// «stateCppName» state
		«IF state.commonState.entryAction != null»
			void «cppFQN»::perform_entry_action_for_«stateCppName»_state(const Event* event){
				«IF generateTracingCode»
					std::cout << "    [Entry: INIT]" << endl;
				«ENDIF»
				«actionCodeTemplates.generateActionCode(state.commonState.entryAction)»
			}
		«ENDIF»
		
		void «cppFQN»::process_event_in_«stateCppName»_state(const Event* event){
			«IF generateTracingCode»
				std::cout << "  [State: «stateCppName»] Processing event" << endl;
			«ENDIF»
			«FOR transitionInfo : state.orderTransitions SEPARATOR '''else''' AFTER '''else'''»
				«val targetState = transitionInfo.cppTarget»
				«val targetStateCppName = targetState?.cppName ?: TERMINATE_POSTFIX»
				«val transition = transitionInfo.transition»
				«val cppTransition = transitionInfo.cppTransition»
				// «stateCppName» -«cppTransition.cppName»-> «targetStateCppName» transition
				if(«cppTransition.generatedTransitionCondition(cppClassName, stateCppName, targetStateCppName)») {
					«IF state.commonState.exitAction != null»	
						// exit action
						perform_exit_action_for_«stateCppName»_state(event);
					«ELSE»
						// no exit action
					«ENDIF»
					
					«IF transition.actionChain != null»
						// transition action
						perform_actions_on_«cppTransition.cppName»_transition_from_«stateCppName»_to_«targetStateCppName»(event);
					«ELSE»
						// no transition action
					«ENDIF»
					
					«IF targetState == null»
«««						no entry action for Terminate state
					«ELSEIF targetState.commonState.entryAction != null»
						// entry action
						perform_entry_action_for_«targetStateCppName»_state(event);
					«ELSE»
						// no entry action
					«ENDIF»
					
					«IF state != targetState»
						// state change
						current_state = «cppClassName»_STATE_«targetStateCppName»;
						«IF generateTracingCode»
							std::cout << "    State changed to «targetStateCppName»" << endl;
						«ENDIF»
					«ELSE»
						// no state change
						«IF generateTracingCode»
							std::cout << "    No state change on «cppTransition.cppName»" << endl;
						«ENDIF»
					«ENDIF»
				} «ENDFOR» 
			{
				// event not processed in state
				«IF generateTracingCode»
					std::cout << "    [UNPROCESSED] Event cannot be processed in this state" << endl;
				«ENDIF»
			}
			return;
		}
		
		«FOR transitionInfo : state.orderTransitions»
			«val targetState = transitionInfo.cppTarget»
			«val targetStateCppName = targetState?.cppName ?: TERMINATE_POSTFIX»
			«val transition = transitionInfo.transition»
			«val cppTransition = transitionInfo.cppTransition»
			«IF transition.guard != null»
				bool «cppFQN»::evaluate_guard_on_«cppTransition.cppName»_transition_from_«stateCppName»_to_«targetStateCppName»(const Event* event){
					«IF generateTracingCode»
						std::cout << "    [Guard: -> «targetStateCppName»]" << endl;
					«ENDIF»
					
					// DUMMY GUARD
					if(«actionCodeTemplates.generateActionCode(transition.guard.body)») {
						return true;
					} else {
						«IF generateTracingCode»
						std::cout << "    Guard false" << endl;
						«ENDIF»
						return false;
					}
				}
			«ENDIF»
			«IF transition.actionChain != null»
				void «cppFQN»::perform_actions_on_«cppTransition.cppName»_transition_from_«stateCppName»_to_«targetStateCppName»(const Event* event){
					«IF generateTracingCode»
						std::cout << "    [Action: -> «targetStateCppName»]" << endl;
					«ENDIF»
					«actionCodeTemplates.generateActionCode(transition.actionChain)»
				}
			«ENDIF»
		«ENDFOR»
		«IF state.commonState.exitAction != null»	
			void «cppFQN»::perform_exit_action_for_«stateCppName»_state(const Event* event){
				«IF generateTracingCode»
					std::cout << "    [Exit]" << endl;
				«ENDIF»
				«actionCodeTemplates.generateActionCode(state.commonState.exitAction)»
			}
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
		val guardCall = '''evaluate_guard_on_«cppTransition.cppName»_transition_from_«stateCppName»_to_«target»(event)'''

		if(transition.guard != null){
			if(condition.length > 0){
				condition = condition + " && "
			}
			condition = condition + guardCall
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
}