package com.incquerylabs.emdw.cpp.codegeneration.templates

import com.ericsson.xtumlrt.oopl.cppmodel.CPPClass
import com.ericsson.xtumlrt.oopl.cppmodel.CPPState
import com.incquerylabs.emdw.cpp.codegeneration.queries.CppCodeGenerationQueries
import org.eclipse.incquery.runtime.api.IncQueryEngine
import com.incquerylabs.emdw.cpp.codegeneration.util.TypeIdentifierGenerator
import com.ericsson.xtumlrt.oopl.cppmodel.CPPAttribute
import com.incquerylabs.emdw.cpp.codegeneration.util.TypeConverter
import org.eclipse.papyrusrt.xtumlrt.common.VisibilityKind
import com.ericsson.xtumlrt.oopl.cppmodel.CPPOperation
import com.ericsson.xtumlrt.oopl.cppmodel.CPPClassReferenceStorage

class ClassTemplates {
	
	val codeGenQueries = CppCodeGenerationQueries.instance
	
	// TODO @Inject
	val generateTracingCode = CPPTemplates.GENERATE_TRACING_CODE
	val TypeConverter typeConverter
	val TypeIdentifierGenerator typeIdGenerator

	OperationTemplates operationTemplates 
	AttributeTemplates attributeTemplates
	AssociationTemplates associationTemplates
	StateTemplates stateTemplates 
	EventTemplates eventTemplates
	ActionCodeTemplates actionCodeTemplates
	IncQueryEngine engine
	
	new(IncQueryEngine engine, TypeIdentifierGenerator typeIdGenerator) {
		this.engine = engine
		this.typeIdGenerator = typeIdGenerator
		
		operationTemplates = new OperationTemplates(engine)
		attributeTemplates = new AttributeTemplates(engine)
		associationTemplates = new AssociationTemplates(engine)
		stateTemplates = new StateTemplates(engine)
		eventTemplates = new EventTemplates(engine)
		actionCodeTemplates = new ActionCodeTemplates(engine)
		typeConverter = new TypeConverter
	}
	
	def classHeaderTemplate(CPPClass cppClass) {
		val cppClassName = cppClass.xtClass.name
		val hasStateMachine = codeGenQueries.getClassStateMachine(engine).hasMatch(null, cppClass, null)
		
		'''
		class «cppClassName» {
			
		public:
		
			«publicContentInClassHeader(cppClass, cppClassName, hasStateMachine)»
		
		protected:
		
			«protectedContentInClassHeader(cppClass, cppClassName)»
		
		private:
		
			«privateContentInClassHeader(cppClass, cppClassName, hasStateMachine)»
		};
		
		'''
		
	}
	
	def publicContentInClassHeader(CPPClass cppClass, String cppClassName, boolean hasStateMachine) {
		'''

		// Constructor
		«cppClassName»();
		
		// Destructor
		virtual ~«cppClassName»();
		
		void perform_initialization();
		
		«attributesInClassHeader(cppClass, VisibilityKind.PUBLIC)»
		
		«operationDeclarationsInClassHeader(cppClass, VisibilityKind.PUBLIC)»

		«IF hasStateMachine»
			«publicStateMachineCodeInClassHeader(cppClass)»
		«ENDIF»
		'''
	}
	
	def protectedContentInClassHeader(CPPClass cppClass, String cppClassName) {
		'''
		«attributesInClassHeader(cppClass, VisibilityKind.PROTECTED)»

		«operationDeclarationsInClassHeader(cppClass, VisibilityKind.PROTECTED)»
		'''
	}
	
	def privateContentInClassHeader(CPPClass cppClass, String cppClassName, boolean hasStateMachine) {
		'''
		// Deny copy of the class using copy constructor
		«cppClassName»(const «cppClassName»&);
		
		// Deny copy of the class using assignment
		«cppClassName»& operator=(const «cppClassName»&);
		
		static std::vector< «cppClassName»* > _instances;
		
		static const unsigned short type_id = «typeIdGenerator.generateTypeId»;
		
		virtual unsigned short get_type_id() const {
			return type_id;
		}
		
		«attributesInClassHeader(cppClass, VisibilityKind.PRIVATE)»
		«associationsInClassHeader(cppClass, VisibilityKind.PRIVATE)»
		
		«operationDeclarationsInClassHeader(cppClass, VisibilityKind.PRIVATE)»
		
		«IF hasStateMachine»
			«privateStateMachineCodeInClassHeader(cppClass)»
		«ENDIF»
		'''
	}
	
	
	
	def attributesInClassHeader(CPPClass cppClass, VisibilityKind visibility) {
		val cppAttrMatcher = codeGenQueries.getCppClassAttributes(engine)
		
		'''
		// Attributes
		«FOR attribute : cppClass.subElements.filter(CPPAttribute).sortBy[commonAttribute.name]»
			«IF cppAttrMatcher.hasMatch(cppClass, attribute, visibility)»
				«attributeTemplates.attributeDeclarationInClassHeader(attribute)»
			«ENDIF»
		«ENDFOR»
		'''
	}
	
	def associationsInClassHeader(CPPClass cppClass, VisibilityKind visibility) {
		val cppAssocMatcher = codeGenQueries.getCppClassClassReferenceStorages(engine)
		
		'''
		// Associations
		«FOR association : cppClass.referenceStorage.filter(CPPClassReferenceStorage).sortBy[type.commonType.name]»
			«IF cppAssocMatcher.hasMatch(cppClass, association)»
				«associationTemplates.associationDeclarationInClassHeader(association)»
			«ENDIF»
		«ENDFOR»
		'''
	}
	
	def operationDeclarationsInClassHeader(CPPClass cppClass, VisibilityKind visibility) {
		val cppOpMatcher = codeGenQueries.getCppClassOperations(engine)
		
		'''
		// Operation declarations
		«FOR operation : cppClass.subElements.filter(CPPOperation).sortBy[commonOperation.name]»
			«IF cppOpMatcher.hasMatch(cppClass, operation, visibility)»
				«operationTemplates.operationDeclarationInClassHeader(operation)»
			«ENDIF»
		«ENDFOR»
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
		val cppFQN = cppClass.classFullyQualifiedName
		val hasStateMachine = codeGenQueries.getClassStateMachine(engine).hasMatch(null, cppClass, null)
		
		'''
		std::vector< «cppFQN»*> («cppFQN»::_instances);
		
		«cppClass.classConstructorDefinition»
		
		// Destructor
		«cppFQN»::~«cppClassName»() {
			_instances.erase(std::find(_instances.begin(), _instances.end(), this));
		}
		
		«cppClass.performInitializationDefinition»
		
		«operationDefinitions(cppClass)»
		
		«IF hasStateMachine»
			«cppClass.stateMachineCodeInClassBody»
		«ENDIF»
		
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
		// Constructor
		«cppFQN»::«cppClassName»()«fieldInitialization» {
			_instances.push_back(this);
		}
		'''
		
	}
	
	def operationDefinitions(CPPClass cppClass) {
		
		val operations = cppClass.subElements.filter(CPPOperation)
		'''
		«IF !operations.empty»
			// Operation definitions
		«ENDIF»
		«FOR operation : cppClass.subElements.filter(CPPOperation).sortBy[commonOperation.name]»
			«operationTemplates.operationDefinitionInClassBody(operation)»
		«ENDFOR»
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
			«IF cppInitStateMatch != null»
				// execute actions
				«actionCodeTemplates.generateActionCode(cppInitStateMatch.initTrans.actionChain)»
				«actionCodeTemplates.generateActionCode(cppInitStateMatch.cppInitState.commonState.entryAction)»
			«ELSE»
				// no action
			«ENDIF»
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
		'''::«cppClass.classQualifiedName»'''
	}
	
	def classQualifiedName(CPPClass cppClass) {
		val cppClassName = cppClass.xtClass.name // cppClass.cppName
		val cppFQN = '''Test_FSM::Main_Package::Test_Component::Test_Package::«cppClassName»''' //cppClass.cppQualifiedName
		cppFQN
	}
	
}