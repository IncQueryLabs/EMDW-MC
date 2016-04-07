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
package com.incquerylabs.emdw.cpp.transformation.monitor

import com.google.common.collect.Multimap
import com.incquerylabs.emdw.cpp.transformation.queries.MonitorQueries
import com.incquerylabs.emdw.cpp.transformation.queries.XtumlQueries
import java.util.Collection
import java.util.HashMap
import java.util.Set
import org.eclipse.emf.ecore.EObject
import org.eclipse.incquery.runtime.api.AdvancedIncQueryEngine
import org.eclipse.incquery.runtime.api.IPatternMatch
import org.eclipse.incquery.runtime.api.IQuerySpecification
import org.eclipse.incquery.runtime.api.IncQueryMatcher
import org.eclipse.papyrusrt.xtumlrt.common.Package
import org.eclipse.papyrusrt.xtumlrt.xtuml.XTComponent
import org.eclipse.viatra.emf.runtime.changemonitor.ChangeMonitor
import org.eclipse.incquery.runtime.api.GenericPatternGroup

class XtumlModelChangeMonitor {
	
	private ChangeMonitor monitor;
	private extension MonitorQueries queries = MonitorQueries.instance
	private extension XtumlQueries xtqueries = XtumlQueries.instance
	
	private Set<XTComponent> dirtyXTComponents
	private HashMap<IQuerySpecification<? extends IncQueryMatcher<? extends IPatternMatch>>, String> scopedParameters;
	
	private Boolean started = false;
	private AdvancedIncQueryEngine engine
	
	new (AdvancedIncQueryEngine engine) {
		this.engine = engine
		GenericPatternGroup.of(queries, xtqueries).prepare(engine)
		this.monitor = new ChangeMonitor(engine)
		this.dirtyXTComponents = <XTComponent>newHashSet()
		this.scopedParameters = <IQuerySpecification<? extends IncQueryMatcher<? extends IPatternMatch>>, String>newHashMap()
		
		engine.addLifecycleListener(new XtumlMonitorEngineLifecycleListener(this))
		
		changedActionChain.registerQuerySpecification(0)
		changedActionCodes.registerQuerySpecification(0)
		changedAssociationTarget.registerQuerySpecification(0)
		changedAttributes.registerQuerySpecification(0)
		changedAttributeTypes.registerQuerySpecification(0)
		changedClasses.registerQuerySpecification(0)
		changedClassEventDefiningEvents.registerQuerySpecification(0)
		changedComponents.registerQuerySpecification(0)
		changedEvents.registerQuerySpecification(0)
		changedGeneralizationClasses.registerQuerySpecification(0)
		changedGuards.registerQuerySpecification(0)
		changedOperationSignatures.registerQuerySpecification(0)
		changedPackages.registerQuerySpecification(0)
		changedParameters.registerQuerySpecification(0)
		changedParameterTypes.registerQuerySpecification(0)
		changedRedefinesInClasses.registerQuerySpecification(0)
		changedRelations.registerQuerySpecification(0)
		changedStateMachines.registerQuerySpecification(0)
		changedTransitions.registerQuerySpecification(0)
		changedTriggerSignals.registerQuerySpecification(0)
		changedTriggers.registerQuerySpecification(0)
		changedTypedMultiplicityElements.registerQuerySpecification(0)
		changedTypedMultiplicityElementTypes.registerQuerySpecification(0)
		changedVertices.registerQuerySpecification(0)
		changedXtAction.registerQuerySpecification(0)
		changedXtActionBody.registerQuerySpecification(0)
		
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
			val scopedElement = match.scopedElement
			val dirtyComponent = searchParentComponent(scopedElement)
			if(dirtyComponent != null) {
				dirtyXTComponents.add(dirtyComponent)
			} else if(scopedElement instanceof Package) {
				dirtyXTComponents.addAll(scopedElement.allContainedComponents)
			}
		]
	}
	
	def Collection<? extends XTComponent> getAllContainedComponents(Package pack) {
		return engine.getXtPackageAllXtComponents.getAllValuesOfxtComponent(pack)
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