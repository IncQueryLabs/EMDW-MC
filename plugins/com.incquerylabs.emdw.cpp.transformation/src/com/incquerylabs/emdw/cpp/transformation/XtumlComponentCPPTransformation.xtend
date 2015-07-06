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
import org.eclipse.papyrusrt.xtumlrt.common.Model
import org.eclipse.viatra.emf.runtime.rules.batch.BatchTransformationStatements
import org.eclipse.viatra.emf.runtime.transformation.batch.BatchTransformation

import static com.google.common.base.Preconditions.*

class XtumlComponentCPPTransformation {

	extension val Logger logger = Logger.getLogger(class)
	static val xtUmlQueries = XtumlQueries.instance
	private var initialized = false;

	Model xtUmlModel
	IncQueryEngine engine
	BatchTransformation transform
	extension BatchTransformationStatements statements
	
	ComponentRules componentRules
	val packageRules = new PackageRules
	ClassRules classRules
	EntityRules entityRules
	val associationRules = new AssociationRules
	

	def initialize(Model xtUmlModel, IncQueryEngine engine) {
		checkArgument(xtUmlModel != null, "XTUML Model cannot be null!")
		checkArgument(engine != null, "Engine cannot be null!")
		if (!initialized) {
			this.xtUmlModel = xtUmlModel
			this.engine = engine

			debug("Preparing queries on engine.")
			var watch = Stopwatch.createStarted
			val queries = GenericPatternGroup.of(xtUmlQueries)
			queries.prepare(engine)
			info('''Prepared queries on engine («watch.elapsed(TimeUnit.MILLISECONDS)» ms)''')
			
			debug("Preparing transformation rules.")
			transform = BatchTransformation.forEngine(engine)
			statements = new BatchTransformationStatements(transform)
			entityRules  = new EntityRules(statements)
			classRules = new ClassRules(engine, statements, associationRules, entityRules)
			componentRules = new ComponentRules(statements, entityRules)
			
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
			info('''Executing transformation on «xtUmlModel.name»''')
			val watch = Stopwatch.createStarted
			statements.fireAllCurrent(componentRules.cleanComponentsRule)
			statements.fireAllCurrent(componentRules.componentRule)
			statements.fireAllCurrent(packageRules.packageInComponentRule)
			statements.fireWhilePossible(packageRules.packageInPackageRule)
			statements.fireAllCurrent(classRules.classRule)
			statements.fireAllCurrent(classRules.classInPackageRule)
			statements.fireAllCurrent(classRules.stateRule)
			statements.fireAllCurrent(classRules.transitionRule)
			statements.fireAllCurrent(classRules.eventRule)
			info('''Initial execution of transformation rules finished («watch.elapsed(TimeUnit.MILLISECONDS)» ms)''')
	}

	def dispose() {
		transform?.dispose
	}
	
}