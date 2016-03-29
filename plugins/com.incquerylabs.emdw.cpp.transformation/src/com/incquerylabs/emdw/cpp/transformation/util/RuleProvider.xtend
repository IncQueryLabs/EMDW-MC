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
package com.incquerylabs.emdw.cpp.transformation.util

import com.incquerylabs.emdw.cpp.transformation.mappings.AbstractObjectMapping
import com.incquerylabs.emdw.cpp.transformation.rules.ModelComponentRules
import com.incquerylabs.emdw.cpp.transformation.rules.ModelPackageRules
import com.incquerylabs.emdw.cpp.transformation.rules.ModelRules
import java.util.List
import java.util.Set
import org.eclipse.incquery.runtime.api.IPatternMatch
import org.eclipse.incquery.runtime.api.IQuerySpecification
import org.eclipse.incquery.runtime.api.IncQueryEngine
import org.eclipse.incquery.runtime.api.IncQueryMatcher
import org.eclipse.incquery.runtime.evm.specific.Lifecycles
import org.eclipse.incquery.runtime.evm.specific.event.IncQueryActivationStateEnum
import org.eclipse.viatra.emf.runtime.rules.eventdriven.EventDrivenTransformationRule
import org.eclipse.viatra.emf.runtime.rules.eventdriven.EventDrivenTransformationRuleFactory
import org.eclipse.viatra.emf.runtime.transformation.eventdriven.EventDrivenTransformation.EventDrivenTransformationBuilder

class RuleProvider {
	
	// Create an EventDrivenTransformationRuleFactory instance
	extension EventDrivenTransformationRuleFactory factory = new EventDrivenTransformationRuleFactory
	
	List<EventDrivenTransformationRule<?, ?>> rules;
	IncQueryEngine engine
	
	new(IncQueryEngine engine) {
		this.engine = engine
		rules = newArrayList()
	}
	
	public def addRules(EventDrivenTransformationBuilder trans) {
		rules.forEach [ rule |
			trans.addRule(rule)
		]
	}
	
	def initRules() {
		ModelRules.getRules(engine).initRules
		ModelPackageRules.getRules(engine).initRules
		ModelComponentRules.getRules(engine).initRules
	}
	
	private def initRules(Set<AbstractObjectMapping<?, ?, ?>> rules) {
		rules.forEach[ rule | 
			rule.initRule
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
		].addLifeCycle(Lifecycles.getDefault(true, true)).build
		rules.add(eventDrivenRule)
	}
		
}