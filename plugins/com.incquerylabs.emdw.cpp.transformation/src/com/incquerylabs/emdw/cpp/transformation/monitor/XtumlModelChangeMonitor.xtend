package com.incquerylabs.emdw.cpp.transformation.monitor

import com.google.common.collect.Multimap
import com.incquerylabs.emdw.cpp.transformation.queries.util.ChangedActionCodesQuerySpecification
import com.incquerylabs.emdw.cpp.transformation.queries.util.ChangedAssociationTargetQuerySpecification
import com.incquerylabs.emdw.cpp.transformation.queries.util.ChangedAttributeTypesQuerySpecification
import com.incquerylabs.emdw.cpp.transformation.queries.util.ChangedAttributesQuerySpecification
import com.incquerylabs.emdw.cpp.transformation.queries.util.ChangedClassEventDefiningEventsQuerySpecification
import com.incquerylabs.emdw.cpp.transformation.queries.util.ChangedClassesQuerySpecification
import com.incquerylabs.emdw.cpp.transformation.queries.util.ChangedComponentsQuerySpecification
import com.incquerylabs.emdw.cpp.transformation.queries.util.ChangedEventsQuerySpecification
import com.incquerylabs.emdw.cpp.transformation.queries.util.ChangedGeneralizationClassesQuerySpecification
import com.incquerylabs.emdw.cpp.transformation.queries.util.ChangedGuardsQuerySpecification
import com.incquerylabs.emdw.cpp.transformation.queries.util.ChangedOperationSignaturesQuerySpecification
import com.incquerylabs.emdw.cpp.transformation.queries.util.ChangedPackagesQuerySpecification
import com.incquerylabs.emdw.cpp.transformation.queries.util.ChangedParameterTypesQuerySpecification
import com.incquerylabs.emdw.cpp.transformation.queries.util.ChangedParametersQuerySpecification
import com.incquerylabs.emdw.cpp.transformation.queries.util.ChangedRedefinesInClassesQuerySpecification
import com.incquerylabs.emdw.cpp.transformation.queries.util.ChangedRelationsQuerySpecification
import com.incquerylabs.emdw.cpp.transformation.queries.util.ChangedStateMachinesQuerySpecification
import com.incquerylabs.emdw.cpp.transformation.queries.util.ChangedTransitionsQuerySpecification
import com.incquerylabs.emdw.cpp.transformation.queries.util.ChangedTriggerSignalsQuerySpecification
import com.incquerylabs.emdw.cpp.transformation.queries.util.ChangedTriggersQuerySpecification
import com.incquerylabs.emdw.cpp.transformation.queries.util.ChangedTypedMultiplicityElementTypesQuerySpecification
import com.incquerylabs.emdw.cpp.transformation.queries.util.ChangedTypedMultiplicityElementsQuerySpecification
import com.incquerylabs.emdw.cpp.transformation.queries.util.ChangedVerticesQuerySpecification
import java.util.HashMap
import java.util.Set
import org.eclipse.emf.ecore.EObject
import org.eclipse.incquery.runtime.api.AdvancedIncQueryEngine
import org.eclipse.incquery.runtime.api.IPatternMatch
import org.eclipse.incquery.runtime.api.IQuerySpecification
import org.eclipse.incquery.runtime.api.IncQueryMatcher
import org.eclipse.papyrusrt.xtumlrt.xtuml.XTComponent
import org.eclipse.viatra.emf.runtime.changemonitor.ChangeMonitor

class XtumlModelChangeMonitor {
	
	private ChangeMonitor monitor;
	
	private Set<XTComponent> dirtyXTComponents
	private HashMap<IQuerySpecification<? extends IncQueryMatcher<? extends IPatternMatch>>, String> scopedParameters;
	
	private Boolean started = false;
	
	new (AdvancedIncQueryEngine engine) {
		this.monitor = new ChangeMonitor(engine)
		this.dirtyXTComponents = <XTComponent>newHashSet()
		this.scopedParameters = <IQuerySpecification<? extends IncQueryMatcher<? extends IPatternMatch>>, String>newHashMap()
		
		engine.addLifecycleListener(new XtumlMonitorEngineLifecycleListener(this))
		
		ChangedActionCodesQuerySpecification.instance.registerQuerySpecification(0)
		ChangedAssociationTargetQuerySpecification.instance.registerQuerySpecification(0)
		ChangedAttributesQuerySpecification.instance.registerQuerySpecification(0)
		ChangedAttributeTypesQuerySpecification.instance.registerQuerySpecification(0)
		ChangedClassesQuerySpecification.instance.registerQuerySpecification(0)
		ChangedClassEventDefiningEventsQuerySpecification.instance.registerQuerySpecification(0)
		ChangedComponentsQuerySpecification.instance.registerQuerySpecification(0)
		ChangedEventsQuerySpecification.instance.registerQuerySpecification(0)
		ChangedGeneralizationClassesQuerySpecification.instance.registerQuerySpecification(0)
		ChangedGuardsQuerySpecification.instance.registerQuerySpecification(0)
		ChangedOperationSignaturesQuerySpecification.instance.registerQuerySpecification(0)
		ChangedPackagesQuerySpecification.instance.registerQuerySpecification(0)
		ChangedParametersQuerySpecification.instance.registerQuerySpecification(0)
		ChangedParameterTypesQuerySpecification.instance.registerQuerySpecification(0)
		ChangedRedefinesInClassesQuerySpecification.instance.registerQuerySpecification(0)
		ChangedRelationsQuerySpecification.instance.registerQuerySpecification(0)
		ChangedStateMachinesQuerySpecification.instance.registerQuerySpecification(0)
		ChangedTransitionsQuerySpecification.instance.registerQuerySpecification(0)
		ChangedTriggerSignalsQuerySpecification.instance.registerQuerySpecification(0)
		ChangedTriggersQuerySpecification.instance.registerQuerySpecification(0)
		ChangedTypedMultiplicityElementsQuerySpecification.instance.registerQuerySpecification(0)
		ChangedTypedMultiplicityElementTypesQuerySpecification.instance.registerQuerySpecification(0)
		ChangedVerticesQuerySpecification.instance.registerQuerySpecification(0)
	}
	
	def startMonitoring() {
		monitor.startMonitoring
		started = true
	}
	
	def createCheckpoint() {
		
		if(!started) return
		
		val delta = monitor.createCheckpoint
		
		// check appeared matches
		checkComponentChanges(delta.appeared)
		
		// check updated matches
		checkComponentChanges(delta.updated)
		
		// check disappeared matches
		checkComponentChanges(delta.disappeared)
		
	}
	
	def Set<XTComponent> getDirtyXTComponents() {
		dirtyXTComponents
	}
	
	def clear() {
		dirtyXTComponents?.clear
	}
	
	def dispose() {
		monitor?.dispose
	}
	
	def isStarted() {
		started
	}
	
	private def checkComponentChanges(Multimap<IQuerySpecification<? extends IncQueryMatcher<IPatternMatch>>, IPatternMatch> changes) {
		changes.values.forEach[ match |
			val dirtyComponent = searchParentComponent(match.scopedElement)
			if(dirtyComponent != null)
				dirtyXTComponents.add(dirtyComponent)
		]
	}
	
	private def registerQuerySpecification(IQuerySpecification<? extends IncQueryMatcher<? extends IPatternMatch>> querySpec, int scopedParameter) {
		monitor.addRule(querySpec)
		scopedParameters.put(querySpec, querySpec.parameterNames.get(scopedParameter))
	}
	
	private def getScopedElement(IPatternMatch match) {
		val scopedParameterName = scopedParameters.get(match.specification)
		match.get(scopedParameterName) as EObject
	}	
	
	private	def XTComponent searchParentComponent(EObject object) {
		if(object instanceof XTComponent) {
			return object as XTComponent
		} else {
			if(object.eContainer != null)
				searchParentComponent(object.eContainer)
			else
				return null
		}
	}
}