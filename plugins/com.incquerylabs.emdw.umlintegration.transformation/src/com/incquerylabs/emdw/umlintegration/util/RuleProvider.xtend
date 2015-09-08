package com.incquerylabs.emdw.umlintegration.util

import com.incquerylabs.emdw.umlintegration.queries.ModelMatch
import com.incquerylabs.emdw.umlintegration.queries.MultiplicityElementMatch
import com.incquerylabs.emdw.umlintegration.rules.AbstractContainmentMapping
import com.incquerylabs.emdw.umlintegration.rules.AbstractMapping
import com.incquerylabs.emdw.umlintegration.rules.AbstractObjectMapping
import com.incquerylabs.emdw.umlintegration.rules.AbstractRecursiveReferenceMapping
import com.incquerylabs.emdw.umlintegration.rules.ActionChainRules
import com.incquerylabs.emdw.umlintegration.rules.AttributeRules
import com.incquerylabs.emdw.umlintegration.rules.CapsulePartRules
import com.incquerylabs.emdw.umlintegration.rules.ChoicePointRules
import com.incquerylabs.emdw.umlintegration.rules.CompositeStateRules
import com.incquerylabs.emdw.umlintegration.rules.ConnectorEndRules
import com.incquerylabs.emdw.umlintegration.rules.ConnectorRules
import com.incquerylabs.emdw.umlintegration.rules.DeepHistoryRules
import com.incquerylabs.emdw.umlintegration.rules.EntryPointRules
import com.incquerylabs.emdw.umlintegration.rules.EnumerationLiteralRules
import com.incquerylabs.emdw.umlintegration.rules.EnumerationRules
import com.incquerylabs.emdw.umlintegration.rules.ExitPointRules
import com.incquerylabs.emdw.umlintegration.rules.GuardRules
import com.incquerylabs.emdw.umlintegration.rules.InitialPointRules
import com.incquerylabs.emdw.umlintegration.rules.JunctionPointRules
import com.incquerylabs.emdw.umlintegration.rules.ModelMapping
import com.incquerylabs.emdw.umlintegration.rules.ModelRules
import com.incquerylabs.emdw.umlintegration.rules.MultiplicityElementMapping
import com.incquerylabs.emdw.umlintegration.rules.MultiplicityElementRules
import com.incquerylabs.emdw.umlintegration.rules.OperationRules
import com.incquerylabs.emdw.umlintegration.rules.ParameterRules
import com.incquerylabs.emdw.umlintegration.rules.PrimitiveTypeRules
import com.incquerylabs.emdw.umlintegration.rules.ReturnTypeRules
import com.incquerylabs.emdw.umlintegration.rules.SimpleStateRules
import com.incquerylabs.emdw.umlintegration.rules.StateEntryRules
import com.incquerylabs.emdw.umlintegration.rules.StateExitRules
import com.incquerylabs.emdw.umlintegration.rules.StateMachineRules
import com.incquerylabs.emdw.umlintegration.rules.StructMemberRules
import com.incquerylabs.emdw.umlintegration.rules.StructTypeRules
import com.incquerylabs.emdw.umlintegration.rules.TerminatePointRules
import com.incquerylabs.emdw.umlintegration.rules.TransitionRules
import com.incquerylabs.emdw.umlintegration.rules.TypeDefinitionRules
import com.incquerylabs.emdw.umlintegration.rules.XTAssociationRules
import com.incquerylabs.emdw.umlintegration.rules.XTClassEventRules
import com.incquerylabs.emdw.umlintegration.rules.XTClassRules
import com.incquerylabs.emdw.umlintegration.rules.XTComponentRules
import com.incquerylabs.emdw.umlintegration.rules.XTEventTriggerRules
import com.incquerylabs.emdw.umlintegration.rules.XTGeneralizationRules
import com.incquerylabs.emdw.umlintegration.rules.XTPackageRules
import com.incquerylabs.emdw.umlintegration.rules.XTPortRules
import java.util.Collections
import java.util.Comparator
import java.util.Map
import java.util.Set
import org.apache.log4j.Level
import org.apache.log4j.Logger
import org.eclipse.incquery.runtime.api.IPatternMatch
import org.eclipse.incquery.runtime.api.IQuerySpecification
import org.eclipse.incquery.runtime.api.IncQueryEngine
import org.eclipse.incquery.runtime.api.IncQueryMatcher
import org.eclipse.incquery.runtime.evm.specific.Lifecycles
import org.eclipse.incquery.runtime.evm.specific.event.IncQueryActivationStateEnum
import org.eclipse.incquery.runtime.evm.specific.resolver.FixedPriorityConflictResolver
import org.eclipse.viatra.emf.runtime.rules.eventdriven.EventDrivenTransformationRule
import org.eclipse.viatra.emf.runtime.rules.eventdriven.EventDrivenTransformationRuleFactory
import org.eclipse.viatra.emf.runtime.transformation.eventdriven.EventDrivenTransformation.EventDrivenTransformationBuilder
import com.incquerylabs.emdw.umlintegration.UmlIntegrationExtension

/**
 * Class responsible for the initiation of VIATRA Event driven transformation rules. 
 * It can also be used to register the rules in a priority based conflict resolver.
 */
class RuleProvider {

	extension EventDrivenTransformationRuleFactory factory = new EventDrivenTransformationRuleFactory
	IncQueryEngine engine
	Map<EventDrivenTransformationRule<?, ?>, AbstractMapping<?>> rulemap;
	Set<UmlIntegrationExtension> extensionServices = newHashSet

	new(IncQueryEngine engine) {
		this.engine = engine
		rulemap = newHashMap();
	}

	/**
	 * Public method that initiates each rule
	 * 
	 */
	public def void initRules() {
		ActionChainRules.getRules(engine).initRules
		AttributeRules.getRules(engine).initRules
		CapsulePartRules.getRules(engine).initRules
		ChoicePointRules.getRules(engine).initRules
		CompositeStateRules.getRules(engine).initRules
		ConnectorEndRules.getRules(engine).initRules
		ConnectorRules.getRules(engine).initRules
		DeepHistoryRules.getRules(engine).initRules
		EntryPointRules.getRules(engine).initRules
		EnumerationRules.getRules(engine).initRules
		EnumerationLiteralRules.getRules(engine).initRules
		ExitPointRules.getRules(engine).initRules
		GuardRules.getRules(engine).initRules
		InitialPointRules.getRules(engine).initRules
		TerminatePointRules.getRules(engine).initRules
		JunctionPointRules.getRules(engine).initRules
		ModelRules.getRules(engine).initRules
		MultiplicityElementRules.getRules(engine).initRules
		OperationRules.getRules(engine).initRules
		ParameterRules.getRules(engine).initRules
		PrimitiveTypeRules.getRules(engine).initRules
		ReturnTypeRules.getRules(engine).initRules
		SimpleStateRules.getRules(engine).initRules
		StateEntryRules.getRules(engine).initRules
		StateExitRules.getRules(engine).initRules
		StateMachineRules.getRules(engine).initRules
		StructMemberRules.getRules(engine).initRules
		StructTypeRules.getRules(engine).initRules
		TransitionRules.getRules(engine).initRules
		TypeDefinitionRules.getRules(engine).initRules
		XTAssociationRules.getRules(engine).initRules
		XTClassEventRules.getRules(engine).initRules
		XTClassRules.getRules(engine).initRules
		XTComponentRules.getRules(engine).initRules
		XTEventTriggerRules.getRules(engine).initRules
		XTGeneralizationRules.getRules(engine).initRules
		XTPackageRules.getRules(engine).initRules
		XTPortRules.getRules(engine).initRules
// FIXME signal event not correct 
//		XTSignalEventRules.getRules(engine).initRules
		extensionServices.forEach[getRules(engine).initRules]
	}
	
	/**
	 * Queries the priority value of a given rule
	 * 
	 */
	public def getPriority(EventDrivenTransformationRule<?, ?> rule) {
		val mapping = rulemap.get(rule)
		mapping.getRulePriority
	}

	/**
	 * Adds each rule to the provided conflict resolver with its appropriate priority.
	 * 
	 */
	public def setPriorities(FixedPriorityConflictResolver resolver) {
		val logger = Logger.getLogger(RuleProvider)
		logger.level = Level.DEBUG
		rulemap.keySet.forEach [ rule |
			logger.debug('''«rulemap.get(rule).class.simpleName» - «getPriority(rule)»''')
			resolver.setPriority(rule.ruleSpecification, getPriority(rule))
		]
	}
	
	public def addExtensions(Set<UmlIntegrationExtension> extensionServices) {
		this.extensionServices += extensionServices
	}
	
	public def removeExtension(Set<UmlIntegrationExtension> extensionServices) {
		extensionServices.forEach[ extensionService |
			if (extensionServices.contains(extensionService)) {
				extensionServices.remove(extensionService)
			}
		]
	}
	
	/**
	 * Adds the initiated rules to a provided EventDrivenTransformation object
	 * 
	 */
	public def addRules(EventDrivenTransformationBuilder trans) {
		val comp = new RuleComparator(rulemap);
		val sorted_list = newArrayList();
		sorted_list.addAll(rulemap.keySet)
		Collections.sort(sorted_list, comp)
		sorted_list.forEach [ rule |
			trans.addRule(rule)
		]
	}

	/*
	 * Abstract Rule initiators
	 */
	 
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
		].addLifeCycle(Lifecycles.getDefault(true, true)).build
		rulemap.put(eventDrivenRule, rule);
	}

	private def dispatch initRule(AbstractContainmentMapping rule) {
		val eventDrivenRule = createRule.precondition(rule.querySpecification as IQuerySpecification<IncQueryMatcher<IPatternMatch>>).action(
			IncQueryActivationStateEnum.APPEARED) [ match |
			rule.appeared(match)
		].action(IncQueryActivationStateEnum.DISAPPEARED) [ match |
			rule.disappeared(match)
		].addLifeCycle(Lifecycles.getDefault(true, true)).build
		rulemap.put(eventDrivenRule, rule);
	}

	private def dispatch initRule(AbstractRecursiveReferenceMapping rule) {
		val eventDrivenRule = createRule.precondition(rule.querySpecification as IQuerySpecification<IncQueryMatcher<IPatternMatch>>).action(
			IncQueryActivationStateEnum.APPEARED) [ match |
			rule.appeared(match)
		].action(IncQueryActivationStateEnum.DISAPPEARED) [ match |
			rule.disappeared(match)
		].addLifeCycle(Lifecycles.getDefault(true, true)).build
		rulemap.put(eventDrivenRule, rule);
	}
	
	private def dispatch initRule(MultiplicityElementMapping rule) {
		val eventDrivenRule = createRule.precondition(rule.querySpecification as IQuerySpecification<IncQueryMatcher<IPatternMatch>>).action(
			IncQueryActivationStateEnum.APPEARED) [ match |
			rule.appeared(match as MultiplicityElementMatch)
		].action(IncQueryActivationStateEnum.UPDATED) [ match |
			rule.updated(match as MultiplicityElementMatch)
		].addLifeCycle(Lifecycles.getDefault(true, true)).build
		rulemap.put(eventDrivenRule, rule);
	}
	
	private def dispatch initRule(ModelMapping rule) {
		val eventDrivenRule = createRule.precondition(rule.querySpecification as IQuerySpecification<IncQueryMatcher<IPatternMatch>>).action(
			IncQueryActivationStateEnum.APPEARED) [ match |
			rule.appeared(match as ModelMatch)
		].action(
			IncQueryActivationStateEnum.UPDATED) [ match |
			rule.updated(match as ModelMatch)
		].addLifeCycle(Lifecycles.getDefault(true, true)).build
		rulemap.put(eventDrivenRule, rule);
	}
	
	private def dispatch initRule(AbstractMapping rule) {
		val eventDrivenRule = createRule.precondition(rule.querySpecification as IQuerySpecification<IncQueryMatcher<IPatternMatch>>).action(
			IncQueryActivationStateEnum.APPEARED) [ match |
			rule.appeared(match)
		].action(IncQueryActivationStateEnum.UPDATED) [ match |
			rule.updated(match)
		].action(IncQueryActivationStateEnum.DISAPPEARED) [ match |
			rule.disappeared(match)
		].addLifeCycle(Lifecycles.getDefault(true, true)).build
		rulemap.put(eventDrivenRule, rule);
	}
}

/**
 * Rule Comparator class that is used to sort the rules based on their priorities
 */
class RuleComparator implements Comparator<EventDrivenTransformationRule<?, ?>> {
	Map<EventDrivenTransformationRule<?, ?>, AbstractMapping<?>> base
	new(Map<EventDrivenTransformationRule<?, ?>, AbstractMapping<?>> base) {
		this.base = base;
	}
	override def int compare(EventDrivenTransformationRule<?, ?> a, EventDrivenTransformationRule<?, ?> b) {
		if (base.get(a).rulePriority > base.get(b).rulePriority) {
			return 1
		} else {
			if (base.get(a).rulePriority < base.get(b).rulePriority) {
				return -1
			} else {
				return 0
			}
		}
	}
}
