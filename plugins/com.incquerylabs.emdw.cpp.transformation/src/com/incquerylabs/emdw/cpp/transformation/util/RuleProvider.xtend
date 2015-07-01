package com.incquerylabs.emdw.cpp.transformation.util

import com.google.common.collect.LinkedListMultimap
import com.google.common.collect.Multimap
import com.incquerylabs.emdw.cpp.transformation.mappings.AbstractObjectMapping
import com.incquerylabs.emdw.cpp.transformation.rules.ModelPackageRules
import com.incquerylabs.emdw.cpp.transformation.rules.ModelRules
import java.util.List
import java.util.Map
import org.eclipse.incquery.runtime.api.IPatternMatch
import org.eclipse.incquery.runtime.api.IQuerySpecification
import org.eclipse.incquery.runtime.api.IncQueryEngine
import org.eclipse.incquery.runtime.api.IncQueryMatcher
import org.eclipse.incquery.runtime.evm.specific.event.IncQueryActivationStateEnum
import org.eclipse.incquery.runtime.evm.specific.lifecycle.DefaultActivationLifeCycle
import org.eclipse.viatra.emf.runtime.rules.eventdriven.EventDrivenTransformationRule
import org.eclipse.viatra.emf.runtime.rules.eventdriven.EventDrivenTransformationRuleFactory
import org.eclipse.viatra.emf.runtime.transformation.eventdriven.EventDrivenTransformation.EventDrivenTransformationBuilder

import static com.google.common.base.Preconditions.*

class RuleProvider {
	
	// Create an EventDrivenTransformationRuleFactory instance
	extension EventDrivenTransformationRuleFactory factory = new EventDrivenTransformationRuleFactory
	
	List<EventDrivenTransformationRule<?, ?>> rules;
	IncQueryEngine engine
	Multimap<Class<?>, AbstractObjectMapping<?,?,?>> mappings;
	
	new(IncQueryEngine engine) {
		this.engine = engine
		rules = newArrayList()
		mappings = LinkedListMultimap.create()
	}
	
	public def addRules(EventDrivenTransformationBuilder trans) {
		rules.forEach [ rule |
			trans.addRule(rule)
		]
	}
	
	def initRules() {
		ModelRules.getRules(engine).initRules
		ModelPackageRules.getRules(engine, this).initRules
	}
	
	def <T> Map<Object, T> findTraces(Class<T> type) {
		val traceMap = newHashMap()
		mappings.get(type).forEach[mapping |
			val traces = mapping.traceMap
			traces.forEach[
				key, value|
				traceMap.put(key, value as T)
			]
		]
		traceMap
	}
	
	private def initRules(Map<Class<?>, AbstractObjectMapping<?,?,?>> rules) {
		rules.forEach[class, rule | 
			rule.initRule
			mappings.put(class, rule)
		]
	}
	
	private def initRule(AbstractObjectMapping rule) {
		val eventDrivenRule = createRule.precondition(rule.querySpecification as IQuerySpecification<IncQueryMatcher<IPatternMatch>>).action(
			IncQueryActivationStateEnum.APPEARED) [ match |
			rule.appeared(match)
		].action(IncQueryActivationStateEnum.UPDATED) [ match |
			rule.updated(match)
		].action(IncQueryActivationStateEnum.DISAPPEARED) [ match |
			rule.disappeared(match)
		].addLifeCycle(DefaultActivationLifeCycle.DEFAULT).build
		rules.add(eventDrivenRule)
	}
		
}