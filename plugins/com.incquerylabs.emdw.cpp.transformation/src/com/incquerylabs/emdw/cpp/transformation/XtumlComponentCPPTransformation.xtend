package com.incquerylabs.emdw.cpp.transformation

import com.google.common.base.Stopwatch
import com.incquerylabs.emdw.cpp.transformation.queries.CppQueries
import com.incquerylabs.emdw.cpp.transformation.queries.XtumlQueries
import com.incquerylabs.emdw.cpp.transformation.rules.AssociationRules
import com.incquerylabs.emdw.cpp.transformation.rules.AttributeRules
import com.incquerylabs.emdw.cpp.transformation.rules.ClassReferenceRules
import com.incquerylabs.emdw.cpp.transformation.rules.ClassRules
import com.incquerylabs.emdw.cpp.transformation.rules.ComponentRules
import com.incquerylabs.emdw.cpp.transformation.rules.FormalParameterRules
import com.incquerylabs.emdw.cpp.transformation.rules.IncludeRules
import com.incquerylabs.emdw.cpp.transformation.rules.OperationRules
import com.incquerylabs.emdw.cpp.transformation.rules.PackageRules
import com.incquerylabs.emdw.cpp.transformation.rules.SequenceRules
import java.util.concurrent.TimeUnit
import org.apache.log4j.Logger
import org.eclipse.incquery.runtime.api.GenericPatternGroup
import org.eclipse.incquery.runtime.api.IncQueryEngine
import org.eclipse.papyrusrt.xtumlrt.xtuml.XTComponent
import org.eclipse.viatra.emf.runtime.rules.batch.BatchTransformationStatements
import org.eclipse.viatra.emf.runtime.transformation.batch.BatchTransformation

import static com.google.common.base.Preconditions.*
import com.incquerylabs.emdw.cpp.transformation.rules.ReturnValueRules
import com.incquerylabs.emdw.cpp.transformation.rules.TypeDefinitionRules
import com.incquerylabs.emdw.cpp.transformation.rules.ClassEventRules
import com.incquerylabs.emdw.cpp.transformation.rules.ActionCodeRules
import org.eclipse.incquery.runtime.api.AdvancedIncQueryEngine

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
			packageRules = new PackageRules(statements, typeDefinitionRules, classRules, includeRules)
			componentRules = new ComponentRules(statements, packageRules, typeDefinitionRules, classRules, attributeRules, operationRules, includeRules)
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

	def execute() {
			info('''Executing transformation on all xtComponents''')
			val watch = Stopwatch.createStarted
			transformComponents
			compileActionCodes
			info('''Initial execution of transformation rules finished («watch.elapsed(TimeUnit.MILLISECONDS)» ms)''')
	}
	
	def transformComponents() {
			statements.fireAllCurrent(componentRules.cleanComponentsRule)
			statements.fireAllCurrent(componentRules.componentRule)
	}
	
	def compileActionCodes() {
			statements.fireAllCurrent(actionCodeRules.operationActionCodeRule)
			statements.fireAllCurrent(actionCodeRules.stateEntryActionCodeRule)
			statements.fireAllCurrent(actionCodeRules.stateExitActionCodeRule)
			statements.fireAllCurrent(actionCodeRules.transitionActionCodeRule)
			statements.fireAllCurrent(actionCodeRules.guardActionCodeRule)
	}

	def execute(XTComponent xtComponent) {
			checkArgument(xtComponent != null, "XTUML Component cannot be null!")
			info('''Executing transformation on «xtComponent.name»''')
			val watch = Stopwatch.createStarted
			xtComponent.transformComponent
			xtComponent.compileActionCodes
			info('''Initial execution of transformation rules finished («watch.elapsed(TimeUnit.MILLISECONDS)» ms)''')
	}
	
	def transformComponent(XTComponent xtComponent) {
			statements.fireAllCurrent(componentRules.cleanComponentsRule, [it.xtComponent == xtComponent])
			statements.fireAllCurrent(componentRules.componentRule, [it.xtComponent == xtComponent])
	}
	
	def compileActionCodes(XTComponent xtComponent) {
			statements.fireAllCurrent(actionCodeRules.operationActionCodeRule, [it.xtComponent == xtComponent])
			statements.fireAllCurrent(actionCodeRules.stateEntryActionCodeRule, [it.xtComponent == xtComponent])
			statements.fireAllCurrent(actionCodeRules.stateExitActionCodeRule, [it.xtComponent == xtComponent])
			statements.fireAllCurrent(actionCodeRules.transitionActionCodeRule, [it.xtComponent == xtComponent])
			statements.fireAllCurrent(actionCodeRules.guardActionCodeRule, [it.xtComponent == xtComponent])
	}
	
	def dispose() {
		transform?.dispose
	}
	
}