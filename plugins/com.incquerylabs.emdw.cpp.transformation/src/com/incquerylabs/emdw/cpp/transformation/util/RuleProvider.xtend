package com.incquerylabs.emdw.cpp.transformation.util

import com.incquerylabs.emdw.cpp.transformation.mappings.AbstractContainmentMapping
import com.incquerylabs.emdw.cpp.transformation.mappings.AbstractMapping
import com.incquerylabs.emdw.cpp.transformation.mappings.AbstractObjectMapping
import com.incquerylabs.emdw.cpp.transformation.rules.ModelRules
import java.util.Map
import java.util.Set
import org.eclipse.incquery.runtime.api.IPatternMatch
import org.eclipse.incquery.runtime.api.IQuerySpecification
import org.eclipse.incquery.runtime.api.IncQueryEngine
import org.eclipse.incquery.runtime.api.IncQueryMatcher
import org.eclipse.incquery.runtime.evm.specific.event.IncQueryActivationStateEnum
import org.eclipse.incquery.runtime.evm.specific.lifecycle.DefaultActivationLifeCycle
import org.eclipse.viatra.emf.runtime.rules.eventdriven.EventDrivenTransformationRule
import org.eclipse.viatra.emf.runtime.rules.eventdriven.EventDrivenTransformationRuleFactory
import org.eclipse.viatra.emf.runtime.transformation.eventdriven.EventDrivenTransformation.EventDrivenTransformationBuilder

class RuleProvider {
	
	// Create an EventDrivenTransformationRuleFactory instance
	extension EventDrivenTransformationRuleFactory factory = new EventDrivenTransformationRuleFactory
	
	Map<EventDrivenTransformationRule<?, ?>, AbstractMapping<?>> rulemap;
	IncQueryEngine engine
	
	new(IncQueryEngine engine) {
		this.engine = engine
		rulemap = newHashMap()
	}
	
	public def addRules(EventDrivenTransformationBuilder trans) {
		rulemap.keySet.forEach [ rule |
			trans.addRule(rule)
		]
	}
	
	def initRules() {
		ModelRules.getRules(engine).initRules
	}
	
	private def initRules(Set<AbstractMapping<?>> rules){
		rules.forEach[initRule]
	}
	
	private def dispatch initRule(AbstractObjectMapping rule) {
		val eventDrivenRule = createRule.precondition(rule.querySpecification as IQuerySpecification<IncQueryMatcher<IPatternMatch>>).action(
			IncQueryActivationStateEnum.APPEARED) [ match |
			rule.appeared(match)
		].action(IncQueryActivationStateEnum.UPDATED) [ match |
			rule.updated(match)
		].action(IncQueryActivationStateEnum.DISAPPEARED) [ match |
			rule.disappeared(match)
		].addLifeCycle(DefaultActivationLifeCycle.DEFAULT).build
		rulemap.put(eventDrivenRule, rule);
	}
	
	private def dispatch initRule(AbstractContainmentMapping rule) {
		val eventDrivenRule = createRule.precondition(rule.querySpecification as IQuerySpecification<IncQueryMatcher<IPatternMatch>>).action(
			IncQueryActivationStateEnum.APPEARED) [ match |
			//rule.appeared(match)
		].action(IncQueryActivationStateEnum.DISAPPEARED) [ match |
			//rule.disappeared(match)
		].addLifeCycle(DefaultActivationLifeCycle.DEFAULT).build
		rulemap.put(eventDrivenRule, rule);
	}
	
}