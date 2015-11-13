package com.incquerylabs.emdw.cpp.transformation

import com.google.common.base.Stopwatch
import com.incquerylabs.emdw.cpp.common.util.IEMDWProgressMonitor
import com.incquerylabs.emdw.cpp.transformation.queries.CppQueries
import com.incquerylabs.emdw.cpp.transformation.queries.XtumlQueries
import com.incquerylabs.emdw.cpp.transformation.rules.ActionCodeRules
import com.incquerylabs.emdw.cpp.transformation.rules.AssociationRules
import com.incquerylabs.emdw.cpp.transformation.rules.AttributeRules
import com.incquerylabs.emdw.cpp.transformation.rules.ClassEventRules
import com.incquerylabs.emdw.cpp.transformation.rules.ClassReferenceRules
import com.incquerylabs.emdw.cpp.transformation.rules.ClassRules
import com.incquerylabs.emdw.cpp.transformation.rules.ComponentRules
import com.incquerylabs.emdw.cpp.transformation.rules.ExternalBridgeRules
import com.incquerylabs.emdw.cpp.transformation.rules.FormalParameterRules
import com.incquerylabs.emdw.cpp.transformation.rules.IncludeRules
import com.incquerylabs.emdw.cpp.transformation.rules.OperationRules
import com.incquerylabs.emdw.cpp.transformation.rules.PackageRules
import com.incquerylabs.emdw.cpp.transformation.rules.ReturnValueRules
import com.incquerylabs.emdw.cpp.transformation.rules.SequenceRules
import com.incquerylabs.emdw.cpp.transformation.rules.TypeDefinitionRules
import java.util.Collection
import java.util.concurrent.TimeUnit
import org.apache.log4j.Logger
import org.eclipse.incquery.runtime.api.AdvancedIncQueryEngine
import org.eclipse.incquery.runtime.api.GenericPatternGroup
import org.eclipse.incquery.runtime.api.IPatternMatch
import org.eclipse.incquery.runtime.api.IncQueryEngine
import org.eclipse.papyrusrt.xtumlrt.xtuml.XTComponent
import org.eclipse.viatra.emf.runtime.rules.batch.BatchTransformationRule
import org.eclipse.viatra.emf.runtime.rules.batch.BatchTransformationStatements
import org.eclipse.viatra.emf.runtime.transformation.batch.BatchTransformation

import static com.google.common.base.Preconditions.*

class XtumlComponentCPPTransformation {

	extension val Logger logger = Logger.getLogger(class)
	static val xtUmlQueries = XtumlQueries.instance
	static val cppQueries = CppQueries.instance
	private var initialized = false;

	IncQueryEngine engine
	BatchTransformation transform
	extension BatchTransformationStatements statements
	
	ComponentRules componentRules
	PackageRules packageRules
	ClassRules classRules
	ExternalBridgeRules externalBridgeRules
	AttributeRules attributeRules
	OperationRules operationRules
	ReturnValueRules returnValueRules
	FormalParameterRules formalParameterRules
	AssociationRules associationRules
	ClassReferenceRules classReferenceRules
	ClassEventRules classEventRules
	SequenceRules sequenceRules
	IncludeRules includeRules
	TypeDefinitionRules typeDefinitionRules
	ActionCodeRules actionCodeRules
	

	def initialize(IncQueryEngine engine) {
		checkArgument(engine != null, "Engine cannot be null!")
		if (!initialized) {
			this.engine = engine

			debug("Preparing queries on engine.")
			var watch = Stopwatch.createStarted
			val queries = GenericPatternGroup.of(xtUmlQueries, cppQueries)
			queries.prepare(engine)
			info('''Prepared queries on engine («watch.elapsed(TimeUnit.MILLISECONDS)» ms)''')
			
			debug("Preparing transformation rules.")
			transform = BatchTransformation.forEngine(engine)
			statements = new BatchTransformationStatements(transform)
			
			includeRules = new IncludeRules(engine, statements)
			sequenceRules = new SequenceRules(statements)
			typeDefinitionRules = new TypeDefinitionRules(statements, includeRules, sequenceRules)
			classReferenceRules = new ClassReferenceRules(statements)
			returnValueRules = new ReturnValueRules(statements, classReferenceRules, sequenceRules, includeRules)
			formalParameterRules = new FormalParameterRules(engine, statements, classReferenceRules, sequenceRules, includeRules)
			attributeRules = new AttributeRules(statements, sequenceRules, includeRules)
			operationRules = new OperationRules(statements, formalParameterRules, returnValueRules)
			associationRules = new AssociationRules(statements, classReferenceRules)
			classEventRules = new ClassEventRules(statements, attributeRules)
			classRules = new ClassRules(statements, classReferenceRules, associationRules, attributeRules, operationRules, classEventRules, includeRules)
			externalBridgeRules = new ExternalBridgeRules(engine, statements, operationRules, includeRules)
			packageRules = new PackageRules(statements, typeDefinitionRules, classRules, externalBridgeRules, includeRules)
			componentRules = new ComponentRules(statements, packageRules, typeDefinitionRules, classRules, externalBridgeRules, attributeRules, operationRules, includeRules)
			actionCodeRules = new ActionCodeRules(statements, engine as AdvancedIncQueryEngine)
			
			includeRules.addRules(transform)
			sequenceRules.addRules(transform)
			formalParameterRules.addRules(transform)
			attributeRules.addRules(transform)
			operationRules.addRules(transform)
			associationRules.addRules(transform)
			classRules.addRules(transform)
			packageRules.addRules(transform)
			componentRules.addRules(transform)
			actionCodeRules.addRules(transform)
			
			info('''Prepared transformation rules («watch.elapsed(TimeUnit.MILLISECONDS)» ms)''')

			initialized = true
		}
	}

	def execute(IEMDWProgressMonitor progressMonitor) {
			transformComponents
			compileActionCodes(progressMonitor)
	}
	
	def transformComponents() {
		info('''Executing cpp structure transformation on all xtComponents''')
		val watch = Stopwatch.createStarted
		statements.fireAllCurrent(componentRules.cleanComponentsRule)
		statements.fireAllCurrent(componentRules.componentRule)
		info('''Execution of cpp structure transformation finished («watch.elapsed(TimeUnit.MILLISECONDS)» ms)''')
	}
	
	def compileActionCodes(IEMDWProgressMonitor progressMonitor) {
		info('''Executing rALF code compilation on all xtComponents''')
		val watch = Stopwatch.createStarted
		
		val operationActionCodeMatches = actionCodeRules.operationActionCodeRule.precondition.getMatcher(engine).getAllMatches
		val stateEntryActionCodeMatches = actionCodeRules.stateEntryActionCodeRule.precondition.getMatcher(engine).getAllMatches
		val stateExitActionCodeMatches = actionCodeRules.stateExitActionCodeRule.precondition.getMatcher(engine).getAllMatches
		val transitionActionCodeMatches = actionCodeRules.transitionActionCodeRule.precondition.getMatcher(engine).getAllMatches
		val guardActionCodeMatches = actionCodeRules.guardActionCodeRule.precondition.getMatcher(engine).getAllMatches
		
		val totalNumberOfActions = #[
			operationActionCodeMatches,
			stateEntryActionCodeMatches,
			stateExitActionCodeMatches,
			transitionActionCodeMatches, 
			guardActionCodeMatches
		].map[size].reduce[p1, p2| p1 + p2]
		progressMonitor.workRemaining = totalNumberOfActions
		
		statements.fireWhileNotCancelled(actionCodeRules.operationActionCodeRule, operationActionCodeMatches, progressMonitor.newChild(operationActionCodeMatches.size))
		statements.fireWhileNotCancelled(actionCodeRules.stateEntryActionCodeRule, stateEntryActionCodeMatches, progressMonitor.newChild(stateEntryActionCodeMatches.size))
		statements.fireWhileNotCancelled(actionCodeRules.stateExitActionCodeRule, stateExitActionCodeMatches, progressMonitor.newChild(stateExitActionCodeMatches.size))
		statements.fireWhileNotCancelled(actionCodeRules.transitionActionCodeRule, transitionActionCodeMatches, progressMonitor.newChild(transitionActionCodeMatches.size))
		statements.fireWhileNotCancelled(actionCodeRules.guardActionCodeRule, guardActionCodeMatches, progressMonitor.newChild(guardActionCodeMatches.size))
		
		info('''Execution of rALF code compilation finished («watch.elapsed(TimeUnit.MILLISECONDS)» ms)''')
	}

	def execute(XTComponent xtComponent, IEMDWProgressMonitor progressMonitor) {
		checkArgument(xtComponent != null, "XTUML Component cannot be null!")
		xtComponent.transformComponent
		xtComponent.compileActionCodes(progressMonitor)
	}
	
	def transformComponent(XTComponent xtComponent) {
		checkArgument(xtComponent != null, "XTUML Component cannot be null!")
		info('''Executing cpp structure transformation on «xtComponent.name»''')
		val watch = Stopwatch.createStarted
		statements.fireAllCurrent(componentRules.cleanComponentsRule, [it.xtComponent == xtComponent])
		statements.fireAllCurrent(componentRules.componentRule, [it.xtComponent == xtComponent])
		info('''Execution of cpp structure transformation finished («watch.elapsed(TimeUnit.MILLISECONDS)» ms)''')
	}
	
	def compileActionCodes(XTComponent xtComponent, IEMDWProgressMonitor progressMonitor) {
		checkArgument(xtComponent != null, "XTUML Component cannot be null!")
		info('''Executing rALF code compilation on «xtComponent.name»''')
		val watch = Stopwatch.createStarted
		
		val operationActionCodeMatches = actionCodeRules.operationActionCodeRule.precondition.getMatcher(engine).getAllMatches(null, xtComponent)
		val stateEntryActionCodeMatches = actionCodeRules.stateEntryActionCodeRule.precondition.getMatcher(engine).getAllMatches(null, xtComponent)
		val stateExitActionCodeMatches = actionCodeRules.stateExitActionCodeRule.precondition.getMatcher(engine).getAllMatches(null, xtComponent)
		val transitionActionCodeMatches = actionCodeRules.transitionActionCodeRule.precondition.getMatcher(engine).getAllMatches(null, xtComponent)
		val guardActionCodeMatches = actionCodeRules.guardActionCodeRule.precondition.getMatcher(engine).getAllMatches(null, xtComponent)
		
		val totalNumberOfActions = #[
			operationActionCodeMatches,
			stateEntryActionCodeMatches,
			stateExitActionCodeMatches,
			transitionActionCodeMatches, 
			guardActionCodeMatches
		].map[size].reduce[p1, p2| p1 + p2]
		progressMonitor.workRemaining = totalNumberOfActions
		
		statements.fireWhileNotCancelled(actionCodeRules.operationActionCodeRule, operationActionCodeMatches, progressMonitor.newChild(operationActionCodeMatches.size))
		statements.fireWhileNotCancelled(actionCodeRules.stateEntryActionCodeRule, stateEntryActionCodeMatches, progressMonitor.newChild(stateEntryActionCodeMatches.size))
		statements.fireWhileNotCancelled(actionCodeRules.stateExitActionCodeRule, stateExitActionCodeMatches, progressMonitor.newChild(stateExitActionCodeMatches.size))
		statements.fireWhileNotCancelled(actionCodeRules.transitionActionCodeRule, transitionActionCodeMatches, progressMonitor.newChild(transitionActionCodeMatches.size))
		statements.fireWhileNotCancelled(actionCodeRules.guardActionCodeRule, guardActionCodeMatches, progressMonitor.newChild(guardActionCodeMatches.size))
		
		info('''Execution of rALF code compilation finished («watch.elapsed(TimeUnit.MILLISECONDS)» ms)''')
	}
	
	def dispose() {
		transform?.dispose
	}
	
	private def <Match extends IPatternMatch> fireWhileNotCancelled(
		BatchTransformationStatements statements,
		BatchTransformationRule<Match, ?> rule,
		Collection<Match> matches,
		IEMDWProgressMonitor progressMonitor
	) {
		for(match : matches) {
			if(progressMonitor.isCanceled) {
				return
			}
			statements.fireAllCurrent(rule)[it == match]
			progressMonitor.worked(1);
		}
	}
}
