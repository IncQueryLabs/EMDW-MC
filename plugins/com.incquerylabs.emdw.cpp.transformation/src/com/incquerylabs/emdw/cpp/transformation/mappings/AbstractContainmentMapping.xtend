package com.incquerylabs.emdw.cpp.transformation.mappings

import org.eclipse.incquery.runtime.api.IPatternMatch
import org.eclipse.papyrusrt.xtumlrt.common.NamedElement
import org.eclipse.incquery.runtime.api.IncQueryEngine

abstract class AbstractContainmentMapping<Match extends IPatternMatch, Parent extends NamedElement, Child extends NamedElement> extends AbstractMapping<Match> {
	
	new(IncQueryEngine engine) {
		super(engine)
	}
	
	override protected appeared(Match match) {
		
	}
	
	override protected updated(Match match) {}
	
	override protected disappeared(Match match) {}
	
}