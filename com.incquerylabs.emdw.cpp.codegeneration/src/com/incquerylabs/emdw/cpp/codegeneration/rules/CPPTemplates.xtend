package com.incquerylabs.emdw.cpp.codegeneration.rules

import com.ericsson.xtumlrt.oopl.cppmodel.CPPClass
import com.ericsson.xtumlrt.oopl.cppmodel.CPPEvent
import com.ericsson.xtumlrt.oopl.cppmodel.CPPState
import com.incquerylabs.emdw.cpp.codegeneration.queries.CppCodeGenerationQueries
import com.incquerylabs.emdw.cpp.codegeneration.queries.CppTransitionInfoMatch
import org.eclipse.incquery.runtime.api.IncQueryEngine
import org.eclipse.papyrusrt.xtumlrt.common.ActionChain
import org.eclipse.papyrusrt.xtumlrt.common.ActionCode
import org.eclipse.papyrusrt.xtumlrt.common.Transition
import org.eclipse.papyrusrt.xtumlrt.common.Trigger
import org.eclipse.papyrusrt.xtumlrt.xtuml.XTEventTrigger
import java.util.List

class CPPTemplates {
	
	static val codeGenQueries = CppCodeGenerationQueries.instance
	
	IncQueryEngine engine
	val generateTracingCode = true
	
	new(IncQueryEngine engine) {
		this.engine = engine	
	}
	
	def classHeaderTemplate(CPPClass cppClass) {
		val cppClassName = cppClass.xtClass.name
		val finalStateMatcher = codeGenQueries.getCppClassFinalStates(engine)
		'''
		class «cppClassName» {
		public:
		
			enum «cppClassName»_state {
				«FOR state : cppClass.subElements.filter(CPPState).sortBy[commonState.name] SEPARATOR ","»
					«cppClassName»_STATE_«state.commonState.name»
				«ENDFOR»
			};
			enum «cppClassName»_event {
				«FOR event : cppClass.subElements.filter(CPPEvent).sortBy[xtEvent.name] SEPARATOR ","»
					«cppClassName»_EVENT_«event.xtEvent.name»
				«ENDFOR»
			};
		
			// Constructor
			«cppClassName»();
		
			// Destructor
			~«cppClassName»();
		
			// Attributes
			«cppClassName»_state current_state;
			std::string name;
		
			// int instead of «cppClassName»_event since we probably have no idea it is an event we can process
			void process_event(int event_id, std::string event_content);

			void perform_initialization();

		private:
		
			«FOR state : cppClass.subElements.filter(CPPState).sortBy[commonState.name]»
				«val stateCppName = state.commonState.name»
				// «stateCppName» state
				«IF state.commonState.entryAction != null»
					void perform_entry_action_for_«stateCppName»_state(int event_id, std::string event_content);
				«ENDIF»
				
				«IF !finalStateMatcher.hasMatch(cppClass, state)»
					void process_event_in_«stateCppName»_state(int event_id, std::string event_content);
				«ENDIF»
				
				«FOR transitionInfo : state.orderTransitions»
					«val target = transitionInfo.cppTarget.commonState.name»
					«val transition = transitionInfo.transition»
					«IF transition.guard != null»
						bool evaluate_guard_on_«transition.name»_transition_from_«stateCppName»_to_«target»(int event_id, std::string event_content);
					«ENDIF»
					«IF transition.actionChain != null»
						void perform_actions_on_«transition.name»_transition_from_«stateCppName»_to_«target»(int event_id, std::string event_content);
					«ENDIF»
				«ENDFOR»
				
				«IF state.commonState.exitAction != null»
					void perform_exit_action_for_«stateCppName»_state(int event_id, std::string event_content);
				«ENDIF»
			«ENDFOR»
		
			// State machine
			void generate_event(int event_id, std::string event_content);

		};
		
		'''
		
	}
	
	def classBodyTemplate(CPPClass cppClass) {
		val cppClassName = cppClass.xtClass.name
		val cppFQN = '''::Test_FSM::Main_Package::Test_Component::Test_Package::«cppClassName»''' //cppClass.cppQualifiedName
		
		val initStateMatcher = codeGenQueries.getCppClassInitState(engine)
		val finalStateMatcher = codeGenQueries.getCppClassFinalStates(engine)
		val cppInitStateMatch = initStateMatcher.getOneArbitraryMatch(cppClass, null, null)

		'''
		«cppFQN»::«cppClassName»(): current_state(«cppClassName»_STATE_«cppInitStateMatch.cppInitState.commonState.name») {
		}
		
		// Destructor
		«cppFQN»::~«cppClassName»() {
		}
		
		void «cppFQN»::perform_initialization() {
			«IF generateTracingCode»
				cout << "[«cppClassName»] Initialization" << endl;
			«ENDIF»
			// execute actions
			«cppInitStateMatch.initTrans.actionChain.generateActionCode»
			«cppInitStateMatch.cppInitState.commonState.entryAction.generateActionCode»
		}
		
		void «cppFQN»::process_event(int event_id, std::string event_content) {
			«IF generateTracingCode»
				cout << "[«cppClassName»] Event " << event_id << " received with content: " << event_content << endl;
			«ENDIF»
		
			switch(current_state){
			«FOR state : cppClass.subElements.filter(CPPState).sortBy[commonState.name].filter[!finalStateMatcher.hasMatch(cppClass, it)]»
			case «cppClassName»_STATE_«state.commonState.name»:
				process_event_in_«state.commonState.name»_state(event_id, event_content);
				break;
			«ENDFOR»	
			}
			
			«IF finalStateMatcher.hasMatch(cppClass, null)»
				switch(current_state){
				«FOR finalState : finalStateMatcher.getAllValuesOfcppFinalState(cppClass).sortBy[commonState.name]»
					case «cppClassName»_STATE_«finalState.commonState.name»:
				«ENDFOR»
					delete this;
					break;
				}
			«ENDIF»
		}
		
		«FOR state : cppClass.subElements.filter(CPPState).sortBy[commonState.name]»
			«val stateCppName = state.commonState.name»
			// «stateCppName» state
			«IF state.commonState.entryAction != null»
				void «cppFQN»::perform_entry_action_for_«stateCppName»_state(int event_id, std::string event_content){
					«IF generateTracingCode»
						cout << "    [Entry: INIT]" << endl;
					«ENDIF»
					«state.commonState.entryAction.generateActionCode»
				}
			«ENDIF»
			
			«IF !finalStateMatcher.hasMatch(cppClass, state)»
				void «cppFQN»::process_event_in_«stateCppName»_state(int event_id, std::string event_content){
					«IF generateTracingCode»
						cout << "  [State: «stateCppName»] Processing event" << endl;
					«ENDIF»
					«FOR transitionInfo : state.orderTransitions SEPARATOR '''else''' AFTER '''else'''»
						«val cppTarget = transitionInfo.cppTarget»
						«val target = cppTarget.commonState.name»
						«val transition = transitionInfo.transition»
						// «stateCppName» -«transition.name»-> «target» transition
						if(«transition.generatedTransitionCondition(cppClassName, stateCppName, target)») {
							«IF state.commonState.exitAction != null»	
								// exit action
								perform_exit_action_for_«stateCppName»_state(event_id, event_content);
							«ELSE»
								// no exit action
							«ENDIF»
							«IF transition.actionChain != null»
								// transition action
								perform_actions_on_«transition.name»_transition_from_«stateCppName»_to_«target»(event_id, event_content);
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
									cout << "    No state change on «transition.name»" << endl;
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
				«val target = transitionInfo.cppTarget.commonState.name»
				«val transition = transitionInfo.transition»
				«IF transition.guard != null»
					bool «cppFQN»::evaluate_guard_on_«transition.name»_transition_from_«stateCppName»_to_«target»(int event_id, std::string event_content){
						«IF generateTracingCode»
							cout << "    [Guard: -> «target»]" << endl;
						«ENDIF»
						«transition.guard.body.generateActionCode»
						
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
				
				void «cppFQN»::perform_actions_on_«transition.name»_transition_from_«stateCppName»_to_«target»(int event_id, std::string event_content){
					«IF generateTracingCode»
						cout << "    [Action: -> «target»]" << endl;
					«ENDIF»
					«transition.actionChain.generateActionCode»
				}
				«ENDIF»
			«ENDFOR»
			«IF state.commonState.exitAction != null»	
				void «cppFQN»::perform_exit_action_for_«stateCppName»_state(int event_id, std::string event_content){
					«IF generateTracingCode»
						cout << "    [Exit]" << endl;
					«ENDIF»
					«state.commonState.exitAction.generateActionCode»
				}
			«ENDIF»
		«ENDFOR»
		
		'''
	}
	
	def generateActionCode(ActionChain actionChain) {
		if(actionChain != null){
			actionChain.actions.generateActionCode
		}
	}
	
	def generateActionCode(Iterable<ActionCode> actions) {
		'''
		«FOR action : actions»
			«action.generateActionCode»
		«ENDFOR»
		'''	
	}
	
	def generateActionCode(ActionCode action) {
		if(action?.source != null){
			'''
			/* Original «action.name» action code source: 
				«action.source»
			*/
			'''	
		}
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
			if(transition.triggers.empty){
				transitionsWithNoTrigger += match
			} else {
				transitionsWithTrigger += match
			}
		]
		
		transitionsWithTrigger
	}
	
	def generatedTransitionCondition(Transition transition, String cppClassName, String stateCppName, String target) {
		var condition = transition.generateEventMatchingCondition(cppClassName)
		val guardCall = '''evaluate_guard_on_«transition.name»_transition_from_«stateCppName»_to_«target»(event_id, event_content)'''
		if(condition.length > 0 && transition.guard != null){
			condition = condition + " && "
		}
		if(transition.guard != null){
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
		val xttrigger = trigger as XTEventTrigger
		xttrigger.signal.name
	}
}