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

	override getTargetClass() {
		Capsule
	}
	
	override getRulePriority() {
		1
	}

	override getQuerySpecification() {
		behavioredClassifier
	}

	override getSourceObject(BehavioredClassifierMatch match) {
		match.behavioredClassifier
	}

	override createTargetObject(BehavioredClassifier sourceObject, BehavioredClassifierMatch match) {
		targetFactory.createCapsule
	}

	override updateTargetObject(Capsule targetObject, BehavioredClassifierMatch match) {
		// TODO
	}

	def getTargetContainer() {
		rootMapping.common.entities
	}

	override protected insertTargetObject(Capsule targetObject, BehavioredClassifierMatch match) {
		targetContainer += targetObject
	}
	
}
