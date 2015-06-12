package com.incquerylabs.emdw.cpp.codegeneration.templates

import com.ericsson.xtumlrt.oopl.cppmodel.CPPClass
import com.ericsson.xtumlrt.oopl.cppmodel.CPPState
import com.incquerylabs.emdw.cpp.codegeneration.queries.CppCodeGenerationQueries
import com.incquerylabs.emdw.cpp.codegeneration.queries.CppTransitionInfoMatch
import java.util.List
import org.eclipse.incquery.runtime.api.IncQueryEngine
import org.eclipse.papyrusrt.xtumlrt.common.Transition
import org.eclipse.papyrusrt.xtumlrt.common.Trigger
import org.eclipse.papyrusrt.xtumlrt.xtuml.XTEventTrigger
import com.ericsson.xtumlrt.oopl.cppmodel.CPPTransition

class StateTemplates {
	
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
		val cppClassName = cppClass.cppName
		'''
		enum «cppClassName»_state {
			«FOR state : cppClass.subElements.filter(CPPState).sortBy[cppName] SEPARATOR ","»
				«cppClassName»_STATE_«state.cppName»
			«ENDFOR»
		};
		'''
	}
	
	def methodDeclarationsInClassHeader(CPPState state, boolean isFinalState) {
		val stateCppName = state.cppName
		'''
		// «stateCppName» state
		«IF state.commonState.entryAction != null»
			void perform_entry_action_for_«stateCppName»_state(int event_id, std::string event_content);
		«ENDIF»
		
		«IF !isFinalState»
			void process_event_in_«stateCppName»_state(int event_id, std::string event_content);
		«ENDIF»
		
		«FOR transitionInfo : state.orderTransitions»
			«val target = transitionInfo.cppTarget.cppName»
			«val transition = transitionInfo.transition»
			«val cppTransition = transitionInfo.cppTransition»
			«IF transition.guard != null»
				bool evaluate_guard_on_«cppTransition.cppName»_transition_from_«stateCppName»_to_«target»(int event_id, std::string event_content);
			«ENDIF»
			«IF transition.actionChain != null»
				void perform_actions_on_«cppTransition.cppName»_transition_from_«stateCppName»_to_«target»(int event_id, std::string event_content);
			«ENDIF»
		«ENDFOR»
		
		«IF state.commonState.exitAction != null»
			void perform_exit_action_for_«stateCppName»_state(int event_id, std::string event_content);
		«ENDIF»
		'''
	}
	
	def methodDefinitionsInClassBody(CPPState state, CPPClass cppClass, boolean isFinalState) {
		val cppClassName = cppClass.cppName
		val cppFQN = cppClass.cppQualifiedName
		
		'''
		«val stateCppName = state.cppName»
		// «stateCppName» state
		«IF state.commonState.entryAction != null»
			void «cppFQN»::perform_entry_action_for_«stateCppName»_state(int event_id, std::string event_content){
				«IF generateTracingCode»
					cout << "    [Entry: INIT]" << endl;
				«ENDIF»
				«actionCodeTemplates.generateActionCode(state.commonState.entryAction)»
			}
		«ENDIF»
		
		«IF !isFinalState»
			void «cppFQN»::process_event_in_«stateCppName»_state(int event_id, std::string event_content){
				«IF generateTracingCode»
					cout << "  [State: «stateCppName»] Processing event" << endl;
				«ENDIF»
				«FOR transitionInfo : state.orderTransitions SEPARATOR '''else''' AFTER '''else'''»
					«val cppTarget = transitionInfo.cppTarget»
					«val target = cppTarget.cppName»
					«val transition = transitionInfo.transition»
					«val cppTransition = transitionInfo.cppTransition»
					// «stateCppName» -«cppTransition.cppName»-> «target» transition
					if(«cppTransition.generatedTransitionCondition(cppClassName, stateCppName, target)») {
						«IF state.commonState.exitAction != null»	
							// exit action
							perform_exit_action_for_«stateCppName»_state(event_id, event_content);
						«ELSE»
							// no exit action
						«ENDIF»
						
						«IF transition.actionChain != null»
							// transition action
							perform_actions_on_«cppTransition.cppName»_transition_from_«stateCppName»_to_«target»(event_id, event_content);
						«ELSE»
							// no transition action
						«ENDIF»
						
						«IF cppTarget.commonState.entryAction != null»
							// entry action
							perform_entry_action_for_«target»_state(event_id, event_content);
						«ELSE»
							// no entry action
						«ENDIF»
						
						«IF state != cppTarget»
							// state change
							current_state = «cppClassName»_STATE_«target»;
							«IF generateTracingCode»
								cout << "    State changed to «target»" << endl;
							«ENDIF»
						«ELSE»
							// no state change
							«IF generateTracingCode»
								cout << "    No state change on «cppTransition.cppName»" << endl;
							«ENDIF»
						«ENDIF»
					} «ENDFOR» 
				{
					// event not processed in state
					«IF generateTracingCode»
						cout << "    [UNPROCESSED] Event cannot be processed in this state" << endl;
					«ENDIF»
				}
				return;
			}
		«ENDIF»
		
		«FOR transitionInfo : state.orderTransitions»
			«val target = transitionInfo.cppTarget.cppName»
			«val transition = transitionInfo.transition»
			«val cppTransition = transitionInfo.cppTransition»
			
			«IF transition.guard != null»
				bool «cppFQN»::evaluate_guard_on_«cppTransition.cppName»_transition_from_«stateCppName»_to_«target»(int event_id, std::string event_content){
					«IF generateTracingCode»
						cout << "    [Guard: -> «target»]" << endl;
					«ENDIF»
					«actionCodeTemplates.generateActionCode(transition.guard.body)»
					
					// DUMMY GUARD
					if(event_content == "valid") {
						return true;
					} else {
						«IF generateTracingCode»
						cout << "    Invalid content, guard false" << endl;
						«ENDIF»
						return false;
					}
				}
			«ENDIF»
			
			«IF transition.actionChain != null»
				void «cppFQN»::perform_actions_on_«cppTransition.cppName»_transition_from_«stateCppName»_to_«target»(int event_id, std::string event_content){
					«IF generateTracingCode»
						cout << "    [Action: -> «target»]" << endl;
					«ENDIF»
					«actionCodeTemplates.generateActionCode(transition.actionChain)»
				}
			«ENDIF»
		«ENDFOR»
		
		«IF state.commonState.exitAction != null»	
			void «cppFQN»::perform_exit_action_for_«stateCppName»_state(int event_id, std::string event_content){
				«IF generateTracingCode»
					cout << "    [Exit]" << endl;
				«ENDIF»
				«actionCodeTemplates.generateActionCode(state.commonState.exitAction)»
			}
		«ENDIF»
		'''
	}
	
	
	def orderTransitions(CPPState cppState) {
		val compositeStateMatcher = codeGenQueries.getCompositeStateSubStates(engine)
		val cppTransitionInfoMatcher = codeGenQueries.getCppTransitionInfo(engine)
		
		val commonState = cppState.commonState
		val compositeState = compositeStateMatcher.getOneArbitraryMatch(null, commonState).compositeState
		
		val List<CppTransitionInfoMatch> transitionsWithTrigger = newArrayList
		val List<CppTransitionInfoMatch> transitionsWithNoTrigger = newArrayList
		
		// separate transitions with trigger and without trigger		
		compositeState.transitions.filter[sourceVertex == commonState].forEach[transition |
			val match = cppTransitionInfoMatcher.getOneArbitraryMatch(null, transition, cppState, null)
			if(match != null){
				if(transition.triggers.empty){
					transitionsWithNoTrigger += match
				} else {
					transitionsWithTrigger += match
				}
			}
		]
		
		transitionsWithTrigger
	}
	
	def generatedTransitionCondition(CPPTransition cppTransition, String cppClassName, String stateCppName, String target) {
		val transition = cppTransition.commonTransition
		var condition = transition.generateEventMatchingCondition(cppClassName)
		val guardCall = '''evaluate_guard_on_«cppTransition.cppName»_transition_from_«stateCppName»_to_«target»(event_id, event_content)'''

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
			'''event_id == «cppClassName»_EVENT_«triggers.head.getEventId»'''
		} else {
			'''
			(«FOR trigger : triggers SEPARATOR " || "»event_id == «trigger.getEventId»«ENDFOR»)'''
		}
	}
	
	def getEventId(Trigger trigger) {
		val cppEventMatcher = codeGenQueries.getCppEvents(engine)
		val xttrigger = trigger as XTEventTrigger
		val cppEvent = cppEventMatcher.getAllValuesOfcppEvent(xttrigger.signal).head
		cppEvent.cppName
	}
}