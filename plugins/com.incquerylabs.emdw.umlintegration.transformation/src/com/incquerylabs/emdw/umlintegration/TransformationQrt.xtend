/*******************************************************************************
 * Copyright (c) 2015-2016, IncQuery Labs Ltd. and Ericsson AB
 * All rights reserved. This program and the accompanying materials
 * are made available under the terms of the Eclipse Public License v1.0
 * which accompanies this distribution, and is available at
 * http://www.eclipse.org/legal/epl-v10.html
 *
 * Contributors:
 *   Akos Horvath, Abel Hegedus, Zoltan Ujhelyi, Daniel Segesdi, Tamas Borbas, Denes Harmath - initial API and implementation
 *******************************************************************************/
package com.incquerylabs.emdw.umlintegration

import com.google.common.base.Stopwatch
import com.incquerylabs.emdw.umlintegration.queries.StateMachine
import com.incquerylabs.emdw.umlintegration.queries.Structure
import com.incquerylabs.emdw.umlintegration.queries.Trace
import com.incquerylabs.emdw.umlintegration.util.PerJobFixedPriorityConflictResolver
import com.incquerylabs.emdw.umlintegration.util.RuleProvider
import com.incquerylabs.emdw.umlintegration.util.TransformationUtil
import java.util.Map
import java.util.Set
import java.util.concurrent.TimeUnit
import org.apache.log4j.Logger
import org.eclipse.incquery.runtime.api.GenericPatternGroup
import org.eclipse.incquery.runtime.api.IncQueryEngine
import org.eclipse.incquery.runtime.evm.api.Scheduler.ISchedulerFactory
import org.eclipse.incquery.runtime.evm.specific.Schedulers
import org.eclipse.uml2.uml.Type
import org.eclipse.uml2.uml.UMLFactory
import org.eclipse.viatra.emf.runtime.transformation.eventdriven.EventDrivenTransformation
import org.eclipse.viatra.emf.runtime.transformation.eventdriven.ExecutionSchemaBuilder

import static com.google.common.base.Preconditions.*
import org.eclipse.xtend.lib.annotations.Accessors
import org.eclipse.incquery.runtime.evm.api.Executor

class TransformationQrt {
	/**
	 * Name of the dummy void type used to substitute UML null types.
	 */
	public static val dummyVoidTypeName = "emdwVoidTypeDummy"

	extension val Logger logger = Logger.getLogger(class)
	extension RuleProvider ruleProvider
	extension UMLFactory umlFactory = UMLFactory.eINSTANCE
	static val tracePatterns = Trace.instance
	static val stateMachinePatterns = StateMachine.instance
	static val structurePatterns = Structure.instance
	private var ISchedulerFactory schedulerFactory
	private var Map<Type, org.eclipse.papyrusrt.xtumlrt.common.Type> externalTypeMap
	@Accessors Executor executor
	
	var Set<UmlIntegrationExtension> extensionServices = #{}
	private var initialized = false;

	EventDrivenTransformation transform
	IncQueryEngine engine

	def initialize(IncQueryEngine engine) {
		checkArgument(engine != null, "Engine cannot be null!")
		if (!initialized) {
			this.engine = engine
			if (schedulerFactory == null) {
				schedulerFactory = Schedulers.getIQEngineSchedulerFactory(engine)
			}
			if (externalTypeMap == null) {
				externalTypeMap = #{}
			}

			debug("Preparing queries on engine.")
			var watch = Stopwatch.createStarted
			val queries = GenericPatternGroup.of(tracePatterns, stateMachinePatterns, structurePatterns)
			queries.prepare(engine)
			info('''Prepared queries on engine («watch.elapsed(TimeUnit.MILLISECONDS)» ms)''')
			
			debug("Preparing external type mapping.")
			val matcher = tracePatterns.getRootMapping(engine)
			if(matcher.countMatches == 1) {
				val rootMapping = matcher.oneArbitraryMatch.rootMapping
				// Adding the dummy void type to the trace model. It can be accessed using its unique name.
				rootMapping.eResource.contents += createDataType => [name = dummyVoidTypeName]
				// TODO extract to method and clean up
				externalTypeMap.forEach[ umlType, xtumlType |
					var Set<com.incquerylabs.emdw.umlintegration.trace.Trace> traces
					val voidDummyTypeMatcher = structurePatterns.getNamedDataType(engine)
					
					// Null types in UML are mapped to void types in xtUML!
					// A dummy void type is used to handle this in the trace model.
					var tracedUmlType = umlType
					if (tracedUmlType == null) {
						tracedUmlType = voidDummyTypeMatcher.getAllValuesOfdataType(dummyVoidTypeName).head
					}

					traces = tracePatterns.getTrace(engine).getAllValuesOftrace(null, tracedUmlType, null)
					if (traces.empty) {
						TransformationUtil.createTrace(rootMapping, tracedUmlType, xtumlType)
						logger.trace('''Created new trace for external type «xtumlType»''')
					} else {
						if (!traces.head.xtumlrtElements.contains(xtumlType)){
							traces.head.xtumlrtElements += xtumlType
							logger.trace('''Added «xtumlType» to existing trace''')
						}
					}
				]
			} else {
				logger.debug("Incorrect number of mappings, cannot map external types! (found " + matcher.countMatches + ")")
			}
			
			
			debug("Preparing transformation rules.")
			val transformationBuilder = EventDrivenTransformation.forEngine(engine)
			ruleProvider = new RuleProvider(engine)
			
			// Add extension services to the rule provider
			ruleProvider.addExtensions(extensionServices)
			
			initRules
			val fixedPriorityResolver = new PerJobFixedPriorityConflictResolver
			fixedPriorityResolver.setPriorities
			
			val executionSchemaBuilder = new ExecutionSchemaBuilder();
			executionSchemaBuilder.engine = engine
			executionSchemaBuilder.scheduler = schedulerFactory
			if(executor !=null){
				executionSchemaBuilder.executor = executor
			}
			executionSchemaBuilder.conflictResolver = fixedPriorityResolver
			val executionSchema = executionSchemaBuilder.build
			
			transformationBuilder.schema = executionSchema
			transformationBuilder.addRules
			transform = transformationBuilder.build
			info('''Prepared transformation rules («watch.elapsed(TimeUnit.MILLISECONDS)» ms)''')

			initialized = true
		}
	}

	def execute() {
			info('''Executing transformation''')
			debug("Initial execution of transformation rules.")
			val watch = Stopwatch.createStarted
			transform.executionSchema.startUnscheduledExecution
			info('''Initial execution of transformation rules finished («watch.elapsed(TimeUnit.MILLISECONDS)» ms)''')
	}
		
	def setSchedulerFactory(ISchedulerFactory schedulerFactory) {
		if (initialized) {
			throw new UnsupportedOperationException("Setting the scheduler factory is only possible before initialization.")
		}
		this.schedulerFactory = schedulerFactory
	}
	
	def setExternalTypeMap(Map<Type, org.eclipse.papyrusrt.xtumlrt.common.Type> externalTypeMap) {
		if (initialized) {
			throw new UnsupportedOperationException("Setting the external type map is only possible before initialization.")
		}
		this.externalTypeMap = externalTypeMap
	}

	def setExtensionServices(Set<UmlIntegrationExtension> extensionServices) {
		this.extensionServices = extensionServices
	}
	
	def dispose() {
		transform?.executionSchema?.dispose
	}

}
