package com.incquerylabs.emdw.cpp.codegeneration.templates

import com.ericsson.xtumlrt.oopl.cppmodel.CPPAttribute
import com.ericsson.xtumlrt.oopl.cppmodel.CPPClass
import com.ericsson.xtumlrt.oopl.cppmodel.CPPClassReferenceStorage
import com.ericsson.xtumlrt.oopl.cppmodel.CPPFormalParameter
import com.ericsson.xtumlrt.oopl.cppmodel.CPPOperation
import com.ericsson.xtumlrt.oopl.cppmodel.CPPRelation
import com.ericsson.xtumlrt.oopl.cppmodel.CPPState
import com.incquerylabs.emdw.cpp.common.TypeConverter
import java.util.List
import org.eclipse.incquery.runtime.api.IncQueryEngine
import org.eclipse.papyrusrt.xtumlrt.common.VisibilityKind

class ClassTemplates extends CPPTemplate {
	
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
	
	new(IncQueryEngine engine) {
		super(engine)
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
		val hasEvents = codeGenQueries.getCppClassEvent(engine).hasMatch(null, cppClass, null)
		val hasStateMachine = codeGenQueries.getCppClassStateMachine(engine).hasMatch(null, cppClass, null)
		val headerGuardPostfix = "HEADER"
		
		'''
		«startHeaderGuard(cppClass, headerGuardPostfix)»
		
		«cppClass.headerFile.inclusions»
		
		«cppClass.namespaceOpenerTemplate»
		
		class «cppClassName»«classInheritance(cppClass, hasStateMachine)» {
		
		public:
		
			«publicContentInClassHeader(cppClass, hasEvents, hasStateMachine)»
		
		protected:
		
			«protectedContentInClassHeader(cppClass)»
		
		private:
		
			«privateContentInClassHeader(cppClass, hasStateMachine)»
		}; /* class «cppClassName» */
		«cppClass.namespaceCloserTemplate»
		
		«closeHeaderGuard(cppClass, headerGuardPostfix)»
		'''
		
	}
	
	def publicContentInClassHeader(CPPClass cppClass, boolean hasEvents, boolean hasStateMachine) {
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
		«IF hasEvents»
			
			«eventTemplates.enumInClassHeader(cppClass)»
			
			«eventTemplates.innerClassesInClassHeader(cppClass)»
		«ENDIF»

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
	
	def classInheritance(CPPClass cppClass, boolean hasStateMachine) {
		val List<String> superClassStrings = newArrayList()
		val cppSuperClasses = getSuperClasses(cppClass)
		
		if(hasStateMachine){
			superClassStrings += '''public «StatefulClassFQN»'''
		}
		cppSuperClasses.forEach[ superClass |
			superClassStrings += '''public «superClass.cppQualifiedName»'''
		]
		
		val inheritanceString = '''«FOR superClassString : superClassStrings BEFORE ': ' SEPARATOR ', '»«superClassString»«ENDFOR»'''
		inheritanceString
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
				«operationTemplates.operationDeclarationInClassHeader(operation, hasReturnType, isVirtual(operation, cppClass))»
			«ENDIF»
		«ENDFOR»
		'''
	}
	
	def isVirtual(CPPOperation cppOperation, CPPClass cppClass) {
		val cppVirtualOperationMatcher = codeGenQueries.getCppVirtualOperation(engine)
		val overridingOperations = cppVirtualOperationMatcher.getAllValuesOfcppOverridingOperation(cppClass, cppOperation)
		val parameters = cppOperation.subElements.filter(CPPFormalParameter)
		val result = overridingOperations.exists[
			val overridingParameters = it.subElements.filter(CPPFormalParameter)
			return parameters.map[type].toList.equals(overridingParameters.map[type].toList)
		]
		return result
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
		
		«eventTemplates.innerClassesInClassBody(cppClass)»
		
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
		
		val List<CharSequence> fieldInitializations = newArrayList()
		
		if(cppInitStateMatch != null){
			val initState = cppInitStateMatch.cppInitState
			val initStateName = stateTemplates.stateEnumeratorQualifiedName(cppClass, initState)
			fieldInitializations += '''current_state(«initStateName»)'''
		}
		val defaultConstructorSignature = '''«cppFQN»::«cppClassName»()'''
		val defaultConstructorFieldInitialization = getFieldInitialization(cppClass, null, fieldInitializations.unmodifiableView)
		
		'''
		// Constructors
		«IF constructors.size == 0»
			«defaultConstructorSignature»«defaultConstructorFieldInitialization» {
				«tracingMessage('''[«cppClassName»] constructor call: «defaultConstructorSignature»''')»
				«operationTemplates.instancesAddTemplates(cppClass)»
			}
		«ENDIF»
		«FOR constructor : constructors»
			«val fieldInitialization = getFieldInitialization(cppClass, constructor, fieldInitializations.unmodifiableView)»
			«operationTemplates.constructorDefinitionInClassBody(cppClass, constructor, fieldInitialization)»
		«ENDFOR»
		'''
	}
	
	def getFieldInitialization(CPPClass cppClass, CPPOperation constructor, List<CharSequence> fieldInitializations) {
		val List<CharSequence> currentInitializations = newArrayList(fieldInitializations)
		val superClasses = cppClass.superClasses
		val superConstructors = superClasses.map[ superClass | superClass -> bestSuperConstructor(constructor, superClass)]
		superConstructors.forEach[currentInitializations += superConstructorInitialization(it.key, it.value)]
		'''«FOR singleFieldInitialization : currentInitializations BEFORE ': ' SEPARATOR ', '»«singleFieldInitialization»«ENDFOR»'''
	}
	
	def bestSuperConstructor(CPPOperation currentConstructor, CPPClass baseClass) {
		if(currentConstructor == null){
			return null
		}
		val superConstructors = baseClass.subElements.filter(CPPOperation).filter[it.cppName == baseClass.cppName]
		val applicableSuperConstructors = superConstructors.filter[ superConstructor |
			superConstructor.parameters.forall[ superConstructorParameter |
				currentConstructor.parameters.exists[ currentConstructorParameter |
					val hasSameName = (superConstructorParameter.cppName == currentConstructorParameter.cppName)
					val hasSameType = (superConstructorParameter.type == currentConstructorParameter.type)
					return hasSameName && hasSameType
				]
			]
		]
		if(applicableSuperConstructors.isNullOrEmpty){
			return null
		}
		val bestSuperConstructor = applicableSuperConstructors.maxBy[parameters.length]
		return bestSuperConstructor
	}
	
	def superConstructorInitialization(CPPClass superClass, CPPOperation superConstructor) {
		if(superConstructor == null){
			return '''«superClass.cppQualifiedName»()'''
		}
		'''«superClass.cppQualifiedName»(«FOR parameter : superConstructor.parameters SEPARATOR ', '»«parameter.cppName»«ENDFOR»)'''
	}
	
	def Iterable<CPPClass> getSuperClasses(CPPClass cppClass) {
		val cppSuperClassMatcher = codeGenQueries.getCppSuperClasses(engine)
		val cppSuperClasses = cppSuperClassMatcher.getAllValuesOfcppSuperClass(cppClass)
		return cppSuperClasses
	}
	
	def parameters(CPPOperation cppOperation) {
		return cppOperation.subElements.filter(CPPFormalParameter)
	}
	
	def destructorDefinitionsInClassBody(CPPClass cppClass) {
		val cppClassName = cppClass.cppName
		val cppFQN = cppClass.cppQualifiedName
		val destructors = cppClass.subElements.filter(CPPOperation).filter[it.cppName == "~" + cppClass.cppName].sortBy[cppName]
		val defaultDestructorSignature = '''«cppFQN»::~«cppClassName»()'''
		
		'''
		// Destructor
		«IF destructors.size == 0»
			«defaultDestructorSignature» {
				«tracingMessage('''[«cppClassName»] destructor call: «defaultDestructorSignature»''')»
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
			val initState = cppInitStateMatch.cppInitState
			val initStateName = stateTemplates.stateEnumeratorQualifiedName(cppClass, initState)
			fieldInitialization = ''': current_state(«initStateName»)'''
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
				case «stateTemplates.stateEnumeratorQualifiedName(cppClass, state)»:
					process_event_in_«state.cppName»_state(event);
					break;
			«ENDFOR»
			}
			«IF terminatePointCount > 0»
				if(current_state == «stateTemplates.stateEnumeratorQualifiedName(cppClass, StateTemplates.TERMINATE_POSTFIX)»){
					delete this;
				}
			«ENDIF»
			delete event;
		}
		
		«FOR state : cppClass.subElements.filter(CPPState).sortBy[cppName]»
			«stateTemplates.methodDefinitionsInClassBody(state, cppClass)»
		«ENDFOR»
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
