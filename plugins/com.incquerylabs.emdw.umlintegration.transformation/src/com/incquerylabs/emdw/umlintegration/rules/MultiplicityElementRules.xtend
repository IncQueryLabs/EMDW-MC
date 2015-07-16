package com.incquerylabs.emdw.umlintegration.rules

import com.incquerylabs.emdw.umlintegration.queries.MultiplicityElementMatch
import java.util.Set
import org.eclipse.incquery.runtime.api.IncQueryEngine
import org.eclipse.papyrusrt.xtumlrt.common.MultiplicityElement
import org.eclipse.uml2.uml.Element

class MultiplicityElementRules {
	static def Set<AbstractMapping<?>> getRules(IncQueryEngine engine) {
		#{
			new MultiplicityElementMapping(engine)
		}
	}
}

class MultiplicityElementMapping extends AbstractMapping<MultiplicityElementMatch> {

	new(IncQueryEngine engine) {
		super(engine)
	}
	
	public static val PRIORITY = Math.max(Math.max(Math.max(
		XTAssociationMapping.PRIORITY, 
		ClassAttributeMapping.PRIORITY),
		SignalAttributeMapping.PRIORITY),
		OperationMapping.PRIORITY
	) + 1

	override getRulePriority() {
		PRIORITY
	}
	
	protected def getUmlObject(MultiplicityElementMatch match) {
		return match.multiplicityElement
	}
	
	protected def getXtumlrtClass() {
		MultiplicityElement
	}
	
	protected def updateXtumlrtObject(MultiplicityElementMatch match) {
		val multiplicityElement = match.multiplicityElement
		val xtMultiplicityElement = findXtumlrtObject(match.multiplicityElement, MultiplicityElement)
		if(xtMultiplicityElement == null){
			return
		}
		xtMultiplicityElement.lowerBound = multiplicityElement.lower
		xtMultiplicityElement.upperBound = multiplicityElement.upper
	}
	
	override getQuerySpecification() {
		multiplicityElement
	}
	
	override def appeared(MultiplicityElementMatch match) {
		val umlObject = match.umlObject
		updateXtumlrtObject(match)
		logger.debug('''Transformed «umlObject»''')
	}
	
	override def updated(MultiplicityElementMatch match) {
		val umlObject = match.umlObject
		val traceMatch = findTrace(umlObject)
		val xtumlrtObject = xtumlrtClass.cast(traceMatch.xtumlrtElement)
		updateXtumlrtObject(match)
		logger.debug('''Updated xtumlrt object «xtumlrtObject»''')
	}
	
	override def disappeared(MultiplicityElementMatch match) {
	}
	
	private def findTrace(Element umlObject) {
		engine.trace.getAllMatches(rootMapping, null, umlObject, null).filter[xtumlrtClass.isAssignableFrom(xtumlrtElement.class)].head
	}
	
}