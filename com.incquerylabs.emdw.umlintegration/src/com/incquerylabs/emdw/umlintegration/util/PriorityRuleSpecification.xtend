package com.incquerylabs.emdw.umlintegration.util

import org.eclipse.incquery.runtime.api.IPatternMatch
import org.eclipse.incquery.runtime.evm.api.RuleSpecification
import org.eclipse.xtend.lib.annotations.Accessors

class PriorityRuleSpecification<Match extends IPatternMatch> {	
	@Accessors RuleSpecification<Match> ruleSpecification	
	@Accessors int priority	
}
