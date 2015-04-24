package com.incquerylabs.emdw.cpp.codegeneration.rules

import com.ericsson.xtumlrt.oopl.cppmodel.CPPClass
import com.ericsson.xtumlrt.oopl.cppmodel.CPPState
import com.ericsson.xtumlrt.oopl.cppmodel.CPPEvent
import org.eclipse.incquery.runtime.api.IncQueryEngine
import com.incquerylabs.emdw.cpp.codegeneration.queries.CppCodeGenerationQueries

class CPPTemplates {
	
	static val codeGenQueries = CppCodeGenerationQueries.instance
	
	def classHeaderTemplate(CPPClass cppClass, IncQueryEngine engine) {
		val cppTransitionInfoMatcher = codeGenQueries.getCppTransitionInfo(engine)
		val cppClassName = cppClass.cppName
		'''
		class «cppClassName» {
		public:
		
		  enum «cppClassName»_state {
			«FOR state : cppClass.subElements.filter(CPPState) SEPARATOR ","»
			    «cppClassName»_STATE_«state.cppName»
			«ENDFOR»
		  };
		  enum «cppClassName»_event {
			«FOR event : cppClass.subElements.filter(CPPEvent) SEPARATOR ","»
			    «cppClassName»_EVENT_«event.cppName»
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
		  void processEvent(int eventId, std::string eventContent);

		private:
		
		«FOR state : cppClass.subElements.filter(CPPState) SEPARATOR ","»
			«val stateCppName = state.cppName»
			// «state.cppName» state
			
			«IF state.commonState.entryAction != null»
				void performEntryActionFor«stateCppName»State(int eventId, std::string eventContent);
			«ENDIF»
			
			void processEventIn«stateCppName»State(int eventId, std::string eventContent);
			
			«FOR transitionInfo : cppTransitionInfoMatcher.getAllMatches(null, null, state, null)»
				«val target = transitionInfo.cppTarget.cppName»
				«val transition = transitionInfo.transition»
				«IF transition.guard != null»
					bool evaluateGuardOn«stateCppName»To«target»Transition(int eventId, std::string eventContent);
				«ENDIF»
				«IF transition.actionChain != null»
					void performActionsOn«stateCppName»To«target»Transition(int eventId, std::string eventContent);
				«ENDIF»
			«ENDFOR»
			
			«IF state.commonState.exitAction != null»
				void performExitActionFor«stateCppName»State(int eventId, std::string eventContent);
			«ENDIF»
		«ENDFOR»
		
			// State machine
			void generateEvent(int eventId, std::string eventContent);

		};
		
		'''
		
	}
	
	def classBodyTemplate(CPPClass cppClass, IncQueryEngine engine) {
		val cppClassName = cppClass.cppName
		val cppFQN = cppClass.cppQualifiedName
		'''
		«cppFQN»::«cppClassName»(): current_state(TEST_STATE_INIT) {
		}
		
		// Destructor
		«cppFQN»::~«cppClassName»() {
		}
		
		void «cppFQN»::processEvent(int eventId, std::string eventContent) {
			cout << "[TEST] Event " << eventId << " received with content: " << eventContent << endl;
		
			switch(current_state){
			case TEST_STATE_INIT:
				processEventInInitState(eventId, eventContent);
				break;
			case TEST_STATE_WORKING:
				processEventInWorkingState(eventId, eventContent);
				break;
			}
		}
		
		void «cppFQN»::performEntryActionForInitState(int eventId, std::string eventContent) {
			cout << "    [Entry: INIT]" << endl;
		}
		
		void «cppFQN»::processEventInInitState(int eventId, std::string eventContent) {
			cout << "  [State: INIT] Processing event" << endl;
		
			// Init -WORK-> Work transition
			if(eventId == TEST_EVENT_WORK && evaluateGuardOnInitToWorkingTransition(eventId, eventContent)){
				// exit
				performExitActionForWorkingState(eventId, eventContent);
				// no action
				// entry
				performEntryActionForInitState(eventId, eventContent);
				// state change
				current_state = TEST_STATE_WORKING;
				cout << "    State changed to WORKING" << endl;
			} else
			// Init -NOP-> Init transition
			if(eventId == TEST_EVENT_NOP) {
				// exit
				performExitActionForInitState(eventId, eventContent);
				// action
				performActionsOnInitToInitTransition(eventId, eventContent);
				// entry
				performEntryActionForInitState(eventId, eventContent);
				cout << "    No state change on NOP" << endl;
			} else {
				cout << "    Cannot process event in this state" << endl;
			}
		
			return;
		}
		
		bool «cppFQN»::evaluateGuardOnInitToWorkingTransition(int eventId, std::string eventContent) {
			if(eventContent == "valid") {
				return true;
			} else {
				cout << "    [-> WORKING] Invalid content, guard false" << endl;
				return false;
			}
		}
		
		void «cppFQN»::performActionsOnInitToInitTransition(int eventId, std::string eventContent) {
			cout << "    [Action]" << endl;
		}
		
		void «cppFQN»::performExitActionForInitState(int eventId, std::string eventContent) {
			cout << "    [Exit]" << endl;
		}
		
		void «cppFQN»::performEntryActionForWorkingState(int eventId, std::string eventContent) {
			cout << "    [Entry: WORKING]" << endl;
		}
		
		void «cppFQN»::processEventInWorkingState(int eventId, std::string eventContent) {
			cout << "  [State: WORKING] Processing event" << endl;
		
			// Working -DONE-> Init transition
			if(eventId == TEST_EVENT_DONE) {
				// exit
				performExitActionForWorkingState(eventId, eventContent);
				// no action
				// entry
				performEntryActionForInitState(eventId, eventContent);
				// state change
				current_state = TEST_STATE_INIT;
				cout << "    State changed to INIT" << endl;
			} else
			// Working -NOP-> Working self-trasition
			if(eventId == TEST_EVENT_NOP) {
				// no exit
				// action
				performActionsOnWorkingToWorkingTransition(eventId, eventContent);
				// no entry
			} else {
				cout << "    Cannot process event in this state" << endl;
			}
		
			return;
		}
		
		void «cppFQN»::performActionsOnWorkingToWorkingTransition(int eventId, std::string eventContent) {
			cout << "    [Action]" << endl;
		}
		
		void «cppFQN»::performExitActionForWorkingState(int eventId, std::string eventContent) {
			cout << "    [Exit]" << endl;
		}
		
		void «cppFQN»::generateEvent(int eventId, std::string eventContent) {
			cout << "    [Generate] Event " << eventId << " generated with content: " << eventContent << endl;
		}
		'''
	}
}