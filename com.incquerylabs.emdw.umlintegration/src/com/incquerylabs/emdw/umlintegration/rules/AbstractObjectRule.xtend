package com.incquerylabs.emdw.umlintegration.rules

import com.incquerylabs.emdw.umlintegration.trace.TraceFactory
import com.zeligsoft.xtumlrt.common.CommonFactory
import org.eclipse.emf.ecore.util.EcoreUtil
import org.eclipse.incquery.runtime.api.IPatternMatch
import org.eclipse.incquery.runtime.api.IncQueryEngine
import org.eclipse.uml2.uml.NamedElement
import com.zeligsoft.xtumlrt.xtuml.XtumlFactory

abstract class AbstractObjectRule<M extends IPatternMatch, S extends NamedElement, T extends com.zeligsoft.xtumlrt.common.NamedElement> extends AbstractRule<M> {

	protected CommonFactory commonFactory = CommonFactory.eINSTANCE
	protected XtumlFactory xtumlFactory = XtumlFactory.eINSTANCE
	protected TraceFactory traceFactory = TraceFactory.eINSTANCE

	new(IncQueryEngine engine) {
		super(engine)
	}

	override appeared(M match) {
		val umlObject = match.umlObject
		val name = umlObject.name
		debug('''Creating xtumlrt object with name: «name»''')
		val xtumlrtObject = createXtumlrtObject(umlObject, match)
		xtumlrtObject.insertXtumlrtObject(match)
		xtumlrtObject.name = name
		xtumlrtObject.updateXtumlrtObject(match)
		updateTrace(umlObject, xtumlrtObject)
		debug('''Created xtumlrt object with name: «name»''')
	}
	
	override def updated(M match) {
		val umlObject = match.umlObject
		val name = umlObject.name
		debug('''Updating xtumlrt object with name: «name»''')
		val traceMatch = findTrace(umlObject)
		val xtumlrtObject = xtumlrtClass.cast(traceMatch.xtumlrtElement)
		xtumlrtObject.name = name
		xtumlrtObject.updateXtumlrtObject(match)
		debug('''Updated xtumlrt object with name: «name»''')
	}

	override def disappeared(M match) {
		val umlObject = match.umlObject
		val name = umlObject.name
		debug('''Removing xtumlrt object with name: «name»''')
		val traceMatch = findTrace(umlObject)
		val xtumlrtObject = xtumlrtClass.cast(traceMatch.xtumlrtElement)
		EcoreUtil.remove(xtumlrtObject)
		rootMapping.traces -= traceMatch.trace
		debug('''Removed xtumlrt object with name: «name»''')
	}
	
	private def updateTrace(NamedElement umlObject, com.zeligsoft.xtumlrt.common.NamedElement xtumlrtObject) {
		val traces = engine.trace.getAllValuesOftrace(null, umlObject, null)
		if (traces.empty) {
			trace('''Creating new trace for new object''')
			rootMapping.traces += traceFactory.createTrace => [
				umlElements += umlObject
				xtumlrtElements += xtumlrtObject
			]
		} else {
			trace('''Adding new object to existing trace''')
			traces.head.xtumlrtElements += xtumlrtObject
		}
	}

	private def findTrace(NamedElement umlObject) {
		engine.trace.getOneArbitraryMatch(rootMapping, null, umlObject, null)
	}

	protected def S getUmlObject(M match)

	protected def Class<? extends T> getXtumlrtClass()

	protected def T createXtumlrtObject(S umlObject, M match)

	protected def void insertXtumlrtObject(T xtumlrtObject, M match)

	protected def void updateXtumlrtObject(T xtumlrtObject, M match)
	
}
