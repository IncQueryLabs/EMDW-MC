package com.incquerylabs.emdw.cpp.codegeneration.templates

import com.ericsson.xtumlrt.oopl.cppmodel.CPPAttribute
import com.ericsson.xtumlrt.oopl.cppmodel.CPPClass
import com.ericsson.xtumlrt.oopl.cppmodel.CPPClassReferenceStorage
import com.ericsson.xtumlrt.oopl.cppmodel.CPPOperation
import com.ericsson.xtumlrt.oopl.cppmodel.CPPRelation
import com.ericsson.xtumlrt.oopl.cppmodel.CPPState
import com.incquerylabs.emdw.cpp.codegeneration.queries.CppCodeGenerationQueries
import com.incquerylabs.emdw.cpp.codegeneration.util.TypeConverter
import java.util.List
import org.eclipse.incquery.runtime.api.IncQueryEngine
import org.eclipse.papyrusrt.xtumlrt.common.VisibilityKind

class ClassTemplates {
	
	val codeGenQueries = CppCodeGenerationQueries.instance
	
	// TODO @Inject
	val generateTracingCode = CPPTemplates.GENERATE_TRACING_CODE
	val TypeConverter typeConverter
	public static val StatefulClassFQN = "::StatefulClass"
	public static val EventFQN = "::Event"

	extension val NamespaceTemplates namespaceTemplates
	extension val HeaderGuardTemplates headerGuardTemplates
	extension val IncludeTemplates includeTemplates
	OperationTemplates operationTemplates 
	AttributeTemplates attributeTemplates
	AssociationTemplates associationTemplates
	StateTemplates stateTemplates 
	EventTemplates eventTemplates
	ActionCodeTemplates actionCodeTemplates
	IncQueryEngine engine
	
	new(IncQueryEngine engine) {
		this.engine = engine
		
		namespaceTemplates = new NamespaceTemplates
		headerGuardTemplates = new HeaderGuardTemplates
		includeTemplates = new IncludeTemplates
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
		val hasStateMachine = codeGenQueries.getCppClassStateMachine(engine).hasMatch(null, cppClass, null)
		val headerGuardPostfix = "HEADER"
		
		'''
		«startHeaderGuard(cppClass, headerGuardPostfix)»
		
		«cppClass.headerFile.inclusions»
		
		«cppClass.namespaceOpenerTemplate»
		
		class «cppClassName»«IF hasStateMachine» : public «StatefulClassFQN»«ENDIF» {
		
		public:
		
			«publicContentInClassHeader(cppClass, hasStateMachine)»
		
		protected:
		
			«protectedContentInClassHeader(cppClass)»
		
		private:
		
			«privateContentInClassHeader(cppClass, hasStateMachine)»
		}; /* class «cppClassName» */
		«cppClass.namespaceCloserTemplate»
		
		«closeHeaderGuard(cppClass, headerGuardPostfix)»
		'''
		
	}
	
	def publicContentInClassHeader(CPPClass cppClass, boolean hasStateMachine) {
		'''
		
		«constructorDeclarationsInClassHeader(cppClass, VisibilityKind.PUBLIC)»
		
		«destructorDeclarationsInClassHeader(cppClass, VisibilityKind.PUBLIC)»
		
		«typeIdTemplate(cppClass)»
		
		// Initialization
		void perform_initialization();
		
		«attributesInClassHeader(cppClass, VisibilityKind.PUBLIC)»
		
		«associationsInClassHeader(cppClass)»
		
		«val cppComponent = codeGenQueries.getCppClassInComponentSubPackages(engine).getAllValuesOfcppComponent(cppClass).head»
		// Component reference
		«cppComponent.cppQualifiedName»::«cppComponent.cppName»* _comp;
		
		«operationDeclarationsInClassHeader(cppClass, VisibilityKind.PUBLIC)»

		«IF hasStateMachine»
			«publicStateMachineCodeInClassHeader(cppClass)»
		«ENDIF»
		'''
	}
	
	def protectedContentInClassHeader(CPPClass cppClass) {
		'''
		«constructorDeclarationsInClassHeader(cppClass, VisibilityKind.PROTECTED)»
		
		«destructorDeclarationsInClassHeader(cppClass, VisibilityKind.PROTECTED)»
		
		«attributesInClassHeader(cppClass, VisibilityKind.PROTECTED)»

		«operationDeclarationsInClassHeader(cppClass, VisibilityKind.PROTECTED)»
		'''
	}
	
	def privateContentInClassHeader(CPPClass cppClass, boolean hasStateMachine) {
		val cppClassName = cppClass.cppName
		'''
		// Deny copy of the class using copy constructor
		«cppClassName»(const «cppClassName»&);
		
		// Deny copy of the class using assignment
		«cppClassName»& operator=(const «cppClassName»&);
		
		«cppClass.instanceStorageInClassHeader»
		
		«constructorDeclarationsInClassHeader(cppClass, VisibilityKind.PRIVATE)»
		
		«destructorDeclarationsInClassHeader(cppClass, VisibilityKind.PRIVATE)»
		
		«attributesInClassHeader(cppClass, VisibilityKind.PRIVATE)»
		
		«operationDeclarationsInClassHeader(cppClass, VisibilityKind.PRIVATE)»
		
		«IF hasStateMachine»
			«privateStateMachineCodeInClassHeader(cppClass)»
		«ENDIF»
		'''
	}
	
	def typeIdTemplate(CPPClass cppClass) {
		'''
		// Type id getters
		static ::unique_number __get_static_type_number() { return ::type_number<«cppClass.cppName»*>::number; }
		virtual ::unique_number __get_dynamic_type_number() { return __get_static_type_number(); }
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
	
	def associationsInClassHeader(CPPClass cppClass) {
		val cppAssocMatcher = codeGenQueries.getCppClassClassReferenceStorages(engine)
		
		'''
		// Associations
		«FOR association : cppClass.subElements.filter(CPPRelation).sortBy[cppName]»
			«FOR refStorage : association.referenceStorage.filter(CPPClassReferenceStorage).sortBy[cppName]»
				«IF cppAssocMatcher.hasMatch(cppClass, refStorage)»
					«associationTemplates.associationDeclarationInClassHeader(refStorage)»
				«ENDIF»
			«ENDFOR»
		«ENDFOR»
		'''
	}
	
	def instanceStorageInClassHeader(CPPClass cppClass) 
	'''
	«FOR refStorage : cppClass.referenceStorage.filter(CPPClassReferenceStorage).sortBy[cppName]»
	static «associationTemplates.associationDeclarationInClassHeader(refStorage)»
	«ENDFOR»
	'''
	
	def constructorDeclarationsInClassHeader(CPPClass cppClass, VisibilityKind visibility) {
		val cppClassName = cppClass.cppName
		val constructors = cppClass.subElements.filter(CPPOperation).filter[it.cppName == cppClass.cppName].sortBy[cppName]
		
		'''
		// Constructors
		«IF constructors.size == 0 && visibility == VisibilityKind.PUBLIC»
		«cppClassName»();
		«ENDIF»
		«operationDeclarations(cppClass, visibility, constructors, false)»
		'''
	}
	
	def destructorDeclarationsInClassHeader(CPPClass cppClass, VisibilityKind visibility) {
		val cppClassName = cppClass.cppName
		val destructors = cppClass.subElements.filter(CPPOperation).filter[it.cppName == "~"+cppClass.cppName].sortBy[cppName]
		'''
		// Destructor
		«IF destructors.size == 0 && visibility == VisibilityKind.PUBLIC»
		virtual ~«cppClassName»();
		«ENDIF»
		«destructorDeclarations(cppClass, visibility, destructors, false)»
		'''
	}
	
	def operationDeclarationsInClassHeader(CPPClass cppClass, VisibilityKind visibility) {
		val operations = cppClass.subElements.filter(CPPOperation).filter[
			it.cppName != cppClass.cppName && 
			it.cppName != "~"+cppClass.cppName
		].sortBy[cppName]
		
		'''
		// Operation declarations
		«operationDeclarations(cppClass, visibility, operations, true)»
		'''
	}
	
	def operationDeclarations(CPPClass cppClass, VisibilityKind visibility, List<CPPOperation> operations, boolean hasReturnType){
		val cppOpMatcher = codeGenQueries.getCppClassOperations(engine)
		'''
		«FOR operation : operations»
			«IF cppOpMatcher.hasMatch(cppClass, operation, visibility)»
				«operationTemplates.operationDeclarationInClassHeader(operation, hasReturnType, false)»
			«ENDIF»
		«ENDFOR»
		'''
	}
	
	def destructorDeclarations(CPPClass cppClass, VisibilityKind visibility, List<CPPOperation> operations, boolean hasReturnType){
		val cppOpMatcher = codeGenQueries.getCppClassOperations(engine)
		'''
		«FOR operation : operations»
			«IF cppOpMatcher.hasMatch(cppClass, operation, visibility)»
				«operationTemplates.operationDeclarationInClassHeader(operation, hasReturnType, true)»
			«ENDIF»
		«ENDFOR»
		'''
	}
	
	def publicStateMachineCodeInClassHeader(CPPClass cppClass) {
		val cppClassName = cppClass.cppName
		'''
		«stateTemplates.enumInClassHeader(cppClass)»
		
		«eventTemplates.enumInClassHeader(cppClass)»
		
		«eventTemplates.innerClassesInClassHeader(cppClass)»
		

		«cppClassName»_state current_state;

		virtual void generate_event(const «EventFQN»* e);
		virtual void process();
		
		void process_event(const «EventFQN»* event);
		'''
	}
	
	def privateStateMachineCodeInClassHeader(CPPClass cppClass) {
		'''
		«FOR state : cppClass.subElements.filter(CPPState).sortBy[cppName]»
			«stateTemplates.methodDeclarationsInClassHeader(state)»
		«ENDFOR»
		// State queues
		::std::queue<const «EventFQN»*> _internalEvents, _externalEvents;
		'''
	}
	
	def classBodyTemplate(CPPClass cppClass) {
		val cppFQN = cppClass.cppQualifiedName
		val hasStateMachine = codeGenQueries.getCppClassStateMachine(engine).hasMatch(null, cppClass, null)
		
		'''
		«cppClass.bodyFile.inclusions»
		
		«cppClass.instanceStorageInClassBody»
		
		«cppClass.constructorDefinitionsInClassBody»
		
		«cppClass.destructorDefinitionsInClassBody»
		
		«cppClass.performInitializationDefinition»
		
		«operationDefinitions(cppClass)»
		
		«IF hasStateMachine»
			«cppClass.stateMachineCodeInClassBody»
		«ENDIF»
		
		'''
	}
	
	
	
	def instanceStorageInClassBody(CPPClass cppClass) 
	'''
	«FOR refStorage : cppClass.referenceStorage.filter(CPPClassReferenceStorage).sortBy[cppName]»
		«associationTemplates.associationDefinitionInClassBody(refStorage)»
	«ENDFOR»
	'''
	
	def constructorDefinitionsInClassBody(CPPClass cppClass) {
		val cppClassName = cppClass.cppName
		val cppFQN = cppClass.cppQualifiedName
		val constructors = cppClass.subElements.filter(CPPOperation).filter[it.cppName == cppClass.cppName].sortBy[cppName]
		
		val initStateMatcher = codeGenQueries.getCppClassInitState(engine)
		val cppInitStateMatch = initStateMatcher.getOneArbitraryMatch(cppClass, null, null)
		
		var initStateName = ""
		var fieldInitialization = ""
		if(cppInitStateMatch != null){
			 initStateName = '''«cppClassName»_STATE_«cppInitStateMatch.cppInitState.cppName»'''
			 fieldInitialization = ''': current_state(«initStateName»)'''
		}
		
		'''
		// Constructors
		«IF constructors.size == 0»
			«cppFQN»::«cppClassName»()«fieldInitialization» {
				«operationTemplates.instancesAddTemplates(cppClass)»
			}
		«ENDIF»
		«FOR constructor : constructors»
			«operationTemplates.constructorDefinitionInClassBody(cppClass, constructor, fieldInitialization)»
		«ENDFOR»
		'''
	}
	
	def destructorDefinitionsInClassBody(CPPClass cppClass) {
		val cppClassName = cppClass.cppName
		val cppFQN = cppClass.cppQualifiedName
		val destructors = cppClass.subElements.filter(CPPOperation).filter[it.cppName == "~" + cppClass.cppName].sortBy[cppName]
		
		'''
		// Destructor
		«IF destructors.size == 0»
			«cppFQN»::~«cppClassName»() {
				«operationTemplates.instancesRemoveTemplates(cppClass)»
			}
		«ENDIF»
		«FOR destructor : destructors»
			«operationTemplates.destructorDefinitionInClassBody(cppClass, destructor)»
		«ENDFOR»
		'''
	}
	
	def operationDefinitions(CPPClass cppClass) {
		
		val operations = cppClass.subElements.filter(CPPOperation).filter[
			it.cppName != cppClass.cppName && 
			it.cppName != "~"+cppClass.cppName
		].sortBy[cppName]
		'''
		«IF !operations.empty»
			// Operation definitions
		«ENDIF»
		«FOR operation : operations»
			«operationTemplates.operationDefinitionInClassBody(operation,true)»
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
				::std::cout << "[«cppClassName»] Initialization" << ::std::endl;
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
		«statefulClassMethodDefinitions(cppClass)»
		
		void «cppFQN»::process_event(const «EventFQN»* event) {
			«IF generateTracingCode»
				::std::cout << "[«cppClassName»] Event " << event->_id << " received." << ::std::endl;
			«ENDIF»
		
			switch(current_state){
			«FOR state : cppClass.subElements.filter(CPPState).sortBy[cppName]»
				case «cppClassName»_STATE_«state.cppName»:
					process_event_in_«state.cppName»_state(event);
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
		
		«eventTemplates.innerClassesInClassBody(cppClass)»
		'''
	}
	
	def statefulClassMethodDefinitions(CPPClass cppClass) {
		val cppClassFQN = cppClass.cppQualifiedName
		'''
		void «cppClassFQN»::generate_event(const «EventFQN»* e) {
			if(e->_isInternal) {
				_internalEvents.push(e);
			} else {
				_externalEvents.push(e);
			}
			if(_internalEvents.size() + _externalEvents.size() == 1) {
				_comp->schedule(this);
			}
		}
		
		void «cppClassFQN»::process() {
			const «EventFQN»* evt;
			if(!_internalEvents.empty()) {
				evt = _internalEvents.front();
				_internalEvents.pop();
			} else {
				evt = _externalEvents.front();
				_externalEvents.pop();
			}
			if(!_internalEvents.empty() or !_externalEvents.empty()) {
				_comp->schedule(this);
			}
			process_event(evt);
		}
		'''
	}
}
