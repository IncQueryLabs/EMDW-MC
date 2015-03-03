package com.incquerylabs.emdw.umlintegration.rules

import com.zeligsoft.xtumlrt.common.Capsule
import com.incquerylabs.emdw.umlintegration.queries.BehavioredClassifierMatch
import org.eclipse.incquery.runtime.api.IncQueryEngine
import org.eclipse.uml2.uml.BehavioredClassifier

class BehavioredClassifierRules {
	static def getRules(IncQueryEngine engine) {
		#{
			new BehavioredClassifierMapping(engine).specification
		}
	}
}

class BehavioredClassifierMapping extends AbstractObjectRule<BehavioredClassifierMatch, BehavioredClassifier, Capsule> {

	new(IncQueryEngine engine) {
		super(engine)
	}

	override getXtumlrtClass() {
		Capsule
	}
	
	override getRulePriority() {
		1
	}

	override getQuerySpecification() {
		behavioredClassifier
	}

	override getUmlObject(BehavioredClassifierMatch match) {
		match.behavioredClassifier
	}

	override createXtumlrtObject(BehavioredClassifier umlObject, BehavioredClassifierMatch match) {
		commonFactory.createCapsule
	}

	override updateXtumlrtObject(Capsule xtumlrtObject, BehavioredClassifierMatch match) {
		// TODO
	}

	def getXtumlrtContainer() {
		rootMapping.xtumlrtRoot.entities
	}

	override protected insertXtumlrtObject(Capsule xtumlrtObject, BehavioredClassifierMatch match) {
		xtumlrtContainer += xtumlrtObject
	}
	
}
