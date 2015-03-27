package com.incquerylabs.emdw.umlintegration.rules

import com.incquerylabs.emdw.umlintegration.trace.Trace
import com.incquerylabs.emdw.umlintegration.trace.TraceFactory
import com.zeligsoft.xtumlrt.common.CommonFactory
import com.zeligsoft.xtumlrt.xtuml.XtumlFactory
import org.eclipse.emf.ecore.EObject
import org.eclipse.emf.ecore.util.EcoreUtil
import org.eclipse.incquery.runtime.api.IPatternMatch
import org.eclipse.incquery.runtime.api.IncQueryEngine
import org.eclipse.uml2.uml.Element
import org.eclipse.uml2.uml.NamedElement

/**
 * Transforms an UML object to an xtumlrt object.
 * There can be more rules which transform the same UML object altogether to a fixed number of xtumlrt objects of different types.
 */
abstract class AbstractObjectRule<Match extends IPatternMatch, UmlObject extends Element, XtumlrtObject extends EObject> extends AbstractRule<Match> {

	protected static val CommonFactory commonFactory = CommonFactory.eINSTANCE
	protected static val XtumlFactory xtumlFactory = XtumlFactory.eINSTANCE
	protected static val TraceFactory traceFactory = TraceFactory.eINSTANCE

	new(IncQueryEngine engine) {
		super(engine)
	}

	override appeared(Match match) {
		val umlObject = match.umlObject
		val xtumlrtObject = createXtumlrtObject(umlObject, match)
		xtumlrtObject.insertXtumlrtObject(match)
		updateName(umlObject, xtumlrtObject)
		xtumlrtObject.updateXtumlrtObject(match)
		addTrace(umlObject, xtumlrtObject)
		logger.debug('''Created xtumlrt object «xtumlrtObject»''')
	}
	
	override def updated(Match match) {
		val umlObject = match.umlObject
		val traceMatch = findTrace(umlObject)
		val xtumlrtObject = xtumlrtClass.cast(traceMatch.xtumlrtElement)
		updateName(umlObject, xtumlrtObject)
		xtumlrtObject.updateXtumlrtObject(match)
		logger.debug('''Updated xtumlrt object «xtumlrtObject»''')
	}

	override def disappeared(Match match) {
		val umlObject = match.umlObject
		val traceMatch = findTrace(umlObject)
		val xtumlrtObject = xtumlrtClass.cast(traceMatch.xtumlrtElement)
		EcoreUtil.remove(xtumlrtObject)
		removeTrace(traceMatch.trace, xtumlrtObject)
		logger.debug('''Removed xtumlrt object «xtumlrtObject»''')
	}
	
	private def updateName(UmlObject umlObject, XtumlrtObject xtumlrtObject) {
		switch umlObject {
			NamedElement: {
				switch xtumlrtObject {
					com.zeligsoft.xtumlrt.common.NamedElement: xtumlrtObject.name = umlObject.name
				}
			} 
		}
	}

	private def addTrace(UmlObject umlObject, XtumlrtObject xtumlrtObject) {
		val traces = engine.trace.getAllValuesOftrace(null, umlObject, null)
		if (traces.empty) {
			rootMapping.traces += traceFactory.createTrace => [
				umlElements += umlObject
				xtumlrtElements += xtumlrtObject
			]
			logger.trace('''Created new trace for «xtumlrtObject»''')
		} else {
			traces.head.xtumlrtElements += xtumlrtObject
			logger.trace('''Added «xtumlrtObject» to existing trace''')
		}
	}

	private def removeTrace(Trace trace, XtumlrtObject xtumlrtObject) {
		trace.xtumlrtElements.remove(xtumlrtObject)
		if (trace.xtumlrtElements.empty) {
		  	rootMapping.traces -= trace
			logger.trace('''Removed trace for «xtumlrtObject»''')
		} else {
		  	logger.trace('''Removed «xtumlrtObject» from trace''')
		}
	}

	private def findTrace(Element umlObject) {
		engine.trace.getAllMatches(rootMapping, null, umlObject, null).filter[xtumlrtClass.isAssignableFrom(xtumlrtElement.class)].head
	}

	protected def UmlObject getUmlObject(Match match)

	protected def Class<? extends XtumlrtObject> getXtumlrtClass()

	protected def XtumlrtObject createXtumlrtObject(UmlObject umlObject, Match match)

	protected def void insertXtumlrtObject(XtumlrtObject xtumlrtObject, Match match)

	protected def void updateXtumlrtObject(XtumlrtObject xtumlrtObject, Match match)
	
}
