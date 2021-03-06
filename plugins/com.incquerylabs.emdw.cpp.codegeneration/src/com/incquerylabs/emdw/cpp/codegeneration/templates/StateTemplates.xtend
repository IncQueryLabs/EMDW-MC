/*******************************************************************************
 * Copyright (c) 2015-2016, IncQuery Labs Ltd. and Ericsson AB
 * All rights reserved. This program and the accompanying materials
 * are made available under the terms of the Eclipse Public License v1.0
 * which accompanies this distribution, and is available at
 * http://www.eclipse.org/legal/epl-v10.html
 *
 * Contributors:
 *   Akos Horvath, Abel Hegedus, Zoltan Ujhelyi, Daniel Segesdi, Tamas Borbas, Robert Doczi, Peter Lunk, Istvan Papp - initial API and implementation
 *******************************************************************************/
package com.incquerylabs.emdw.cpp.codegeneration.templates

import com.ericsson.xtumlrt.oopl.cppmodel.CPPClass
import com.ericsson.xtumlrt.oopl.cppmodel.CPPState
import com.incquerylabs.emdw.cpp.codegeneration.util.TransitionInfo
import org.eclipse.incquery.runtime.api.IncQueryEngine

class StateTemplates extends CPPTemplate {
	public static val TERMINATE_POSTFIX = "TERMINATE"
	
	extension val ActionCodeTemplates actionCodeTemplates
	extension val EventTemplates eventTemplates
	extension val TransitionTemplates transitionTemplates
	extension val EnumTemplates enumTemplates
	
	new(IncQueryEngine engine) {
		super(engine)
		actionCodeTemplates = new ActionCodeTemplates(engine)
		eventTemplates = new EventTemplates(engine)
		transitionTemplates = new TransitionTemplates(engine)
		enumTemplates = new EnumTemplates
	}
	
	def enumInClassHeader(CPPClass cppClass) {
		val terminatePointMatcher = codeGenQueries.getCppClassTerminatePoints(engine)
		val terminatePointCount = terminatePointMatcher.countMatches(null, cppClass, null)
		val cppStates = cppClass.subElements.filter(CPPState).sortBy[cppName]
		val enumName = '''«cppClass.stateEnumClassName»'''
		val enumeratorNames = <String>newArrayList(cppStates.map[ state | stateEnumeratorName(cppClass, state) ])
		if(terminatePointCount > 0){
			enumeratorNames += stateEnumeratorName(cppClass, TERMINATE_POSTFIX)
		}
		
		return enumClassTemplate(enumName, enumeratorNames)
	}
	
	def String stateEnumClassName(CPPClass cppClass) {
		'''«cppClass.cppName»_state'''
	}
	
	def String stateEnumClassQualifiedName(CPPClass cppClass) {
		'''«cppClass.cppQualifiedName»::«cppClass.stateEnumClassName»'''
	}
	
	def String stateEnumeratorName(CPPClass cppClass, CharSequence cppStateName) {
		'''«cppStateName»'''
	}
	
	def String stateEnumeratorName(CPPClass cppClass, CPPState cppState) {
		stateEnumeratorName(cppClass, cppState.cppName)
	}
	
	def String stateEnumeratorQualifiedName(CPPClass cppClass, CPPState cppState) {
		'''«cppClass.stateEnumClassQualifiedName»::«stateEnumeratorName(cppClass, cppState)»'''
	}
	
	def String stateEnumeratorQualifiedName(CPPClass cppClass, CharSequence cppStateName) {
		'''«cppClass.stateEnumClassQualifiedName»::«stateEnumeratorName(cppClass, cppStateName)»'''
	}
	
	def methodDeclarationsInClassHeader(CPPState state) {
		val stateCppName = state.cppName
		'''
		// «stateCppName» state
		«performEntryActionDeclaration(state)»

		«processEventInStateDeclaration(state)»

		«FOR transitionInfo : state.orderTransitions()»
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
		«processEventInStateDefinition(cppClass, state)»
		
		«performEntryActionDefinition(cppClass, state)»
		
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
		'''«processEventInStateMethodName(state)»(const «ClassTemplates.EVENT_FQN»* event)'''
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
		val sourceState = transitionInfo.cppSource
		val sourceStateCppName = sourceState.cppName
		val targetState = transitionInfo.cppTarget
		val targetStateCppName = targetState?.cppName ?: TERMINATE_POSTFIX
		val cppTransition = transitionInfo.cppTransition
		val eventName = "event"
		
		'''
		// «sourceStateCppName» -«cppTransition.cppName»-> «targetStateCppName» transition
		if(«generatedTransitionCondition(transitionInfo)») {
			«performExitActionCall(sourceState, eventName)»
			
			«performActionsOnTransitionCall(transitionInfo, eventName)»
			
			«performEntryActionCall(targetState, eventName)»
			
			«changeStateTemplate(cppClass, transitionInfo)»
		}
		'''
	}
	
	def performEntryActionMethodName(CPPState state){
		'''perform_entry_action_for_«state.cppName»_state'''
	}
	
	def performEntryActionSignature(CPPState state){
		'''«performEntryActionMethodName(state)»(const «ClassTemplates.EVENT_FQN»* event)'''
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
		val eventType = incomingEventType(state)
		val castedEventName = "casted_const_event"
		'''
		«IF state.commonState.entryAction != null»
			void «cppClassFQN»::«performEntryActionSignature(state)»{
				const «eventType»* «castedEventName» = static_cast<const «eventType»*>(event);
				«tracingMessage('''    [Entry: «state.cppName»]''')»
				«generateActionCode(state.compiledEntryBody)»
			}
		«ENDIF»
		'''
	}
	
	def performEntryActionCall(CPPState targetState, String eventName){
		'''
		«IF targetState == null»
			// no entry action for Terminate state
		«ELSEIF targetState.commonState.entryAction != null»
			// entry action
			«performEntryActionMethodName(targetState)»(«eventName»);
		«ELSE»
			// no entry action
		«ENDIF»
		'''
	}
	
	def performExitActionMethodName(CPPState state){
		'''perform_exit_action_for_«state.cppName»_state'''
	}
	
	def performExitActionSignature(CPPState state){
		'''«performExitActionMethodName(state)»(const «ClassTemplates.EVENT_FQN»* event)'''
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
		val eventType = outgoingEventType(state)
		val castedEventName = "casted_const_event"
		'''
		«IF state.commonState.exitAction != null»	
			void «cppClassFQN»::«performExitActionSignature(state)»{
				const «eventType»* «castedEventName» = static_cast<const «eventType»*>(event);
				«tracingMessage('''    [Exit]''')»
				«generateActionCode(state.compiledExitBody)»
			}
		«ENDIF»
		'''
	}
	
	def performExitActionCall(CPPState sourceState, String eventName){
		'''
		«IF sourceState.commonState.exitAction != null»	
			// exit action
			«performExitActionMethodName(sourceState)»(«eventName»);
		«ELSE»
			// no exit action
		«ENDIF»
		'''
	}
	
	def changeStateTemplate(CPPClass cppClass, TransitionInfo transitionInfo){
		val sourceState = transitionInfo.cppSource
		val targetState = transitionInfo.cppTarget
		val targetStateCppName = targetState?.cppName ?: TERMINATE_POSTFIX
		val cppTransition = transitionInfo.cppTransition
		'''
		«IF sourceState != targetState»
			// state change
			current_state = «stateEnumeratorQualifiedName(cppClass, targetStateCppName)»;
			«tracingMessage('''    State changed to «targetStateCppName»''')»
		«ELSE»
			// no state change
			«tracingMessage('''    No state change on «cppTransition.cppName»''')»
		«ENDIF»
		'''
	}
}
