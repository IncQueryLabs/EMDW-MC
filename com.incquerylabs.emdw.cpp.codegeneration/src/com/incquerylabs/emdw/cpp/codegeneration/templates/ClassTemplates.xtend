package com.incquerylabs.emdw.cpp.codegeneration.templates

import com.ericsson.xtumlrt.oopl.cppmodel.CPPClass
import com.ericsson.xtumlrt.oopl.cppmodel.CPPState
import com.incquerylabs.emdw.cpp.codegeneration.queries.CppCodeGenerationQueries
import org.eclipse.incquery.runtime.api.IncQueryEngine

class ClassTemplates {
	
	val codeGenQueries = CppCodeGenerationQueries.instance
	
	// TODO @Inject
	val generateTracingCode = CPPTemplates.GENERATE_TRACING_CODE
	extension StateTemplates stateTemplates 
	extension EventTemplates eventTemplates
	extension ActionCodeTemplates actionCodeTemplates
	extension IncQueryEngine engine
	
	new(IncQueryEngine engine) {
		this.engine = engine
		stateTemplates = new StateTemplates(engine)
		eventTemplates = new EventTemplates(engine)
		actionCodeTemplates = new ActionCodeTemplates(engine)
	}
	
	def classHeaderTemplate(CPPClass cppClass) {
		val cppClassName = cppClass.xtClass.name
		
		'''
		class «cppClassName» {
		public:
		
			// Constructor
			«cppClassName»();
		
			// Destructor
			~«cppClassName»();
		
			// Attributes
			std::string name;
		
			void perform_initialization();

«««			TODO only call if there is a state machine 
			«publicStateMachineCodeInClassHeader(cppClass)»

		private:
		
«««			TODO only call if there is a state machine		
			«privateStateMachineCodeInClassHeader(cppClass)»

		};
		
		'''
		
	}
	
	def publicStateMachineCodeInClassHeader(CPPClass cppClass) {
		val cppClassName = cppClass.xtClass.name
		'''
		«stateTemplates.enumInClassHeader(cppClass)»
		«eventTemplates.enumInClassHeader(cppClass)»

		«cppClassName»_state current_state;

		// int instead of «cppClassName»_event since we probably have no idea it is an event we can process
		void process_event(int event_id, std::string event_content);
		'''
	}
	
	def privateStateMachineCodeInClassHeader(CPPClass cppClass) {
		val finalStateMatcher = codeGenQueries.getCppClassFinalStates(engine)
		'''
		«FOR state : cppClass.subElements.filter(CPPState).sortBy[commonState.name]»
			«stateTemplates.methodDeclarationsInClassHeader(state, finalStateMatcher.hasMatch(cppClass, state))»
		«ENDFOR»

		// State machine
		void generate_event(int event_id, std::string event_content);
		'''
	}
	
	def classBodyTemplate(CPPClass cppClass) {
		val cppClassName = cppClass.xtClass.name // cppClass.cppName
		val cppFQN = '''::Test_FSM::Main_Package::Test_Component::Test_Package::«cppClassName»''' //cppClass.cppQualifiedName
		
		'''
		«cppClass.classConstructorDefinition»
		
		// Destructor
		«cppFQN»::~«cppClassName»() {
		}
		
		«cppClass.performInitializationDefinition»
		
		«cppClass.stateMachineCodeInClassBody»
		
		'''
	}
	
	def classConstructorDefinition(CPPClass cppClass) {
		val cppClassName = cppClass.xtClass.name // cppClass.cppName
		val cppFQN = cppClass.classFullyQualifiedName
		
		val initStateMatcher = codeGenQueries.getCppClassInitState(engine)
		val cppInitStateMatch = initStateMatcher.getOneArbitraryMatch(cppClass, null, null)
		
		var CharSequence fieldInitialization = ""
		if(cppInitStateMatch != null){
			 fieldInitialization = ''': current_state(«cppClassName»_STATE_«cppInitStateMatch.cppInitState.commonState.name»)'''
		}
		'''
		«cppFQN»::«cppClassName»()«fieldInitialization» {
		}
		'''
		
	}
	
	def performInitializationDefinition(CPPClass cppClass) {
		val cppClassName = cppClass.xtClass.name // cppClass.cppName
		val cppFQN = cppClass.classFullyQualifiedName
		
		val initStateMatcher = codeGenQueries.getCppClassInitState(engine)
		val cppInitStateMatch = initStateMatcher.getOneArbitraryMatch(cppClass, null, null)
		
		var CharSequence fieldInitialization = ""
		if(cppInitStateMatch != null){
			 fieldInitialization = ''': current_state(«cppClassName»_STATE_«cppInitStateMatch.cppInitState.commonState.name»)'''
		}
		'''
		void «cppFQN»::perform_initialization() {
			«IF generateTracingCode»
				cout << "[«cppClassName»] Initialization" << endl;
			«ENDIF»
			// execute actions
			«cppInitStateMatch.initTrans.actionChain.generateActionCode»
			«cppInitStateMatch.cppInitState.commonState.entryAction.generateActionCode»
		}
		'''
		
	}
	
	def stateMachineCodeInClassBody(CPPClass cppClass) {
		val cppClassName = cppClass.xtClass.name // cppClass.cppName
		val cppFQN = cppClass.classFullyQualifiedName
		
		val finalStateMatcher = codeGenQueries.getCppClassFinalStates(engine)
		'''
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
			«stateTemplates.methodDefinitionsInClassBody(state, cppClass, finalStateMatcher.hasMatch(cppClass, state))»
		«ENDFOR»
		'''
	}
	
	def classFullyQualifiedName(CPPClass cppClass) {
		val cppClassName = cppClass.xtClass.name // cppClass.cppName
		val cppFQN = '''::Test_FSM::Main_Package::Test_Component::Test_Package::«cppClassName»''' //cppClass.cppQualifiedName
		cppFQN
	}
	
}