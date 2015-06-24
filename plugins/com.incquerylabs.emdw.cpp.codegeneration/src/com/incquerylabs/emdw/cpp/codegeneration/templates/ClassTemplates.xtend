package com.incquerylabs.emdw.cpp.codegeneration.templates

import com.ericsson.xtumlrt.oopl.cppmodel.CPPAttribute
import com.ericsson.xtumlrt.oopl.cppmodel.CPPClass
import com.ericsson.xtumlrt.oopl.cppmodel.CPPClassReferenceStorage
import com.ericsson.xtumlrt.oopl.cppmodel.CPPOperation
import com.ericsson.xtumlrt.oopl.cppmodel.CPPState
import com.incquerylabs.emdw.cpp.codegeneration.queries.CppCodeGenerationQueries
import com.incquerylabs.emdw.cpp.codegeneration.util.TypeConverter
import com.incquerylabs.emdw.cpp.codegeneration.util.TypeIdentifierGenerator
import org.eclipse.incquery.runtime.api.IncQueryEngine
import org.eclipse.papyrusrt.xtumlrt.common.VisibilityKind

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
		val cppClassName = cppClass.cppName
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
		«FOR attribute : cppClass.subElements.filter(CPPAttribute).sortBy[cppName]»
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
		«FOR association : cppClass.referenceStorage.filter(CPPClassReferenceStorage).sortBy[cppName]»
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
		«FOR operation : cppClass.subElements.filter(CPPOperation).sortBy[cppName]»
			«IF cppOpMatcher.hasMatch(cppClass, operation, visibility)»
				«operationTemplates.operationDeclarationInClassHeader(operation)»
			«ENDIF»
		«ENDFOR»
		'''
	}
	
	def publicStateMachineCodeInClassHeader(CPPClass cppClass) {
		val cppClassName = cppClass.cppName
		'''
		«stateTemplates.enumInClassHeader(cppClass)»
		«eventTemplates.enumInClassHeader(cppClass)»

		«cppClassName»_state current_state;

		// int instead of «cppClassName»_event since we probably have no idea it is an event we can process
		void process_event(int event_id, std::string event_content);
		'''
	}
	
	def privateStateMachineCodeInClassHeader(CPPClass cppClass) {
		'''
		«FOR state : cppClass.subElements.filter(CPPState).sortBy[cppName]»
			«stateTemplates.methodDeclarationsInClassHeader(state)»
		«ENDFOR»

		// State machine
		void generate_event(int event_id, std::string event_content);
		'''
	}
	
	def classBodyTemplate(CPPClass cppClass) {
		val cppClassName = cppClass.cppName
		val cppFQN = cppClass.cppQualifiedName
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
		val cppClassName = cppClass.cppName
		val cppFQN = cppClass.cppQualifiedName
		
		val initStateMatcher = codeGenQueries.getCppClassInitState(engine)
		val cppInitStateMatch = initStateMatcher.getOneArbitraryMatch(cppClass, null, null)
		
		var CharSequence fieldInitialization = ""
		if(cppInitStateMatch != null){
			 fieldInitialization = ''': current_state(«cppClassName»_STATE_«cppInitStateMatch.cppInitState.cppName»)'''
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
		«FOR operation : cppClass.subElements.filter(CPPOperation).sortBy[cppName]»
			«operationTemplates.operationDefinitionInClassBody(operation)»
		«ENDFOR»
		'''
	}
	
	def performInitializationDefinition(CPPClass cppClass) {
		val cppClassName = cppClass.cppName
		val cppFQN = cppClass.cppQualifiedName
		
		val initStateMatcher = codeGenQueries.getCppClassInitState(engine)
		val cppInitStateMatch = initStateMatcher.getOneArbitraryMatch(cppClass, null, null)
		
		var CharSequence fieldInitialization = ""
		if(cppInitStateMatch != null){
			 fieldInitialization = ''': current_state(«cppClassName»_STATE_«cppInitStateMatch.cppInitState.cppName»)'''
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
		val cppClassName = cppClass.cppName
		val cppFQN = cppClass.cppQualifiedName
		
		val terminatePointMatcher = codeGenQueries.getCppClassTerminatePoints(engine)
		val terminatePointCount = terminatePointMatcher.countMatches(null, cppClass, null)
		
		'''
		void «cppFQN»::process_event(int event_id, std::string event_content) {
			«IF generateTracingCode»
				cout << "[«cppClassName»] Event " << event_id << " received with content: " << event_content << endl;
			«ENDIF»
		
			switch(current_state){
			«FOR state : cppClass.subElements.filter(CPPState).sortBy[cppName]»
				case «cppClassName»_STATE_«state.cppName»:
					process_event_in_«state.cppName»_state(event_id, event_content);
					break;
			«ENDFOR»
			}
			«IF terminatePointCount > 0»
				if(current_state == «cppClassName»_STATE_«StateTemplates.TERMINATE_POSTFIX»){
					delete this;
				}
			«ENDIF»
		}
		
		«FOR state : cppClass.subElements.filter(CPPState).sortBy[cppName]»
			«stateTemplates.methodDefinitionsInClassBody(state, cppClass)»
		«ENDFOR»
		'''
	}
}