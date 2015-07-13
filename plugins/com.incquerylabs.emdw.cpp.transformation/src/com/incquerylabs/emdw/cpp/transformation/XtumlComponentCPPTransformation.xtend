package com.incquerylabs.emdw.cpp.transformation

import com.google.common.base.Stopwatch
import com.incquerylabs.emdw.cpp.transformation.queries.XtumlQueries
import com.incquerylabs.emdw.cpp.transformation.rules.AssociationRules
import com.incquerylabs.emdw.cpp.transformation.rules.ClassRules
import com.incquerylabs.emdw.cpp.transformation.rules.ComponentRules
import com.incquerylabs.emdw.cpp.transformation.rules.EntityRules
import com.incquerylabs.emdw.cpp.transformation.rules.PackageRules
import java.util.concurrent.TimeUnit
import org.apache.log4j.Logger
import org.eclipse.incquery.runtime.api.GenericPatternGroup
import org.eclipse.incquery.runtime.api.IncQueryEngine
import org.eclipse.papyrusrt.xtumlrt.xtuml.XTComponent
import org.eclipse.viatra.emf.runtime.rules.batch.BatchTransformationStatements
import org.eclipse.viatra.emf.runtime.transformation.batch.BatchTransformation

import static com.google.common.base.Preconditions.*
import com.incquerylabs.emdw.cpp.transformation.queries.CppQueries
import com.incquerylabs.emdw.cpp.transformation.rules.IncludeRules

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
	EntityRules entityRules
	AssociationRules associationRules
	IncludeRules includeRules
	

	def initialize(IncQueryEngine engine) {
		checkArgument(engine != null, "Engine cannot be null!")
		if (!initialized) {
			this.engine = engine

			debug("Preparing queries on engine.")
			var watch = Stopwatch.createStarted
			val queries = GenericPatternGroup.of(xtUmlQueries)
			val cppQueries = GenericPatternGroup.of(cppQueries)
			queries.prepare(engine)
			cppQueries.prepare(engine)
			info('''Prepared queries on engine («watch.elapsed(TimeUnit.MILLISECONDS)» ms)''')
			
			debug("Preparing transformation rules.")
			transform = BatchTransformation.forEngine(engine)
			statements = new BatchTransformationStatements(transform)
			includeRules = new IncludeRules(engine, statements)
			entityRules  = new EntityRules(statements, includeRules)
			associationRules = new AssociationRules(statements, includeRules)
			classRules = new ClassRules(statements, associationRules, entityRules, includeRules)
			packageRules = new PackageRules(statements, classRules, includeRules)
			componentRules = new ComponentRules(statements, packageRules, classRules, entityRules, includeRules)
			
			componentRules.addRules(transform)
			packageRules.addRules(transform)
			classRules.addRules(transform)
			entityRules.addRules(transform)
			associationRules.addRules(transform)
			info('''Prepared transformation rules («watch.elapsed(TimeUnit.MILLISECONDS)» ms)''')

			initialized = true
		}
	}

	def execute() {
			info('''Executing transformation on all xtComponents''')
			val watch = Stopwatch.createStarted
			statements.fireAllCurrent(componentRules.cleanComponentsRule)
			statements.fireAllCurrent(componentRules.componentRule)
			info('''Initial execution of transformation rules finished («watch.elapsed(TimeUnit.MILLISECONDS)» ms)''')
	}

	def execute(XTComponent xtComponent) {
			checkArgument(xtComponent != null, "XTUML Component cannot be null!")
			info('''Executing transformation on «xtComponent.name»''')
			val watch = Stopwatch.createStarted
			statements.fireAllCurrent(componentRules.cleanComponentsRule, [it.xtComponent == xtComponent])
			statements.fireAllCurrent(componentRules.componentRule, [it.xtComponent == xtComponent])
			info('''Initial execution of transformation rules finished («watch.elapsed(TimeUnit.MILLISECONDS)» ms)''')
	}

	def dispose() {
		transform?.dispose
	}
	
}