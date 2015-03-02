package com.incquerylabs.emdw.umlintegration.rules

import com.incquerylabs.emdw.umlintegration.queries.TraceMatch
import com.incquerylabs.emdw.umlintegration.trace.TraceFactory
import com.zeligsoft.xtumlrt.common.CommonFactory
import org.eclipse.emf.ecore.util.EcoreUtil
import org.eclipse.incquery.runtime.api.IPatternMatch
import org.eclipse.incquery.runtime.api.IncQueryEngine
import org.eclipse.uml2.uml.NamedElement

abstract class AbstractObjectRule<M extends IPatternMatch, S extends NamedElement, T extends com.zeligsoft.xtumlrt.common.NamedElement> extends AbstractRule<M> {

	protected CommonFactory targetFactory = CommonFactory.eINSTANCE
	protected TraceFactory traceFactory = TraceFactory.eINSTANCE

	new(IncQueryEngine engine) {
		super(engine)
	}

	override appeared(M match) {
		val sourceObject = match.sourceObject
		val name = sourceObject.name
		debug('''Mapping source object with name: «name»''')
		val targetObject = createTargetObject(sourceObject, match)
		targetObject.insertTargetObject(match)
		targetObject.name = name
		targetObject.updateTargetObject(match)
		updateTrace(sourceObject, targetObject)
		debug('''Mapped source object with name: «name»''')
	}
	
	override def updated(M match) {
		val sourceObject = match.sourceObject
		val name = sourceObject.name
		debug('''Updating mapped object with name: «name»''')
		val traceMatch = findTrace(sourceObject)
		val targetObject = targetClass.cast(traceMatch.xtumlrtElement)
		targetObject.name = name
		targetObject.updateTargetObject(match)
		debug('''Updated mapped object with name: «name»''')
	}

	override def disappeared(M match) {
		val sourceObject = match.sourceObject
		val name = sourceObject.name
		debug('''Removing target object with name: «name»''')
		val traceMatch = findTrace(sourceObject)
		val targetObject = targetClass.cast(traceMatch.xtumlrtElement)
		removeTargetObjectAndTrace(targetObject, match, traceMatch)
		debug('''Removed target object with name: «name»''')
	}
	
	private def removeTargetObjectAndTrace(T targetObject, M match, TraceMatch traceMatch) {
		EcoreUtil.remove(targetObject)
		rootMapping.traces -= traceMatch.trace
	}

	private def updateTrace(NamedElement sourceObject, com.zeligsoft.xtumlrt.common.NamedElement targetObject) {
		val traces = engine.trace.getAllValuesOftrace(null, sourceObject, null)
		if (traces.empty) {
			trace('''Creating new trace for new object''')
			rootMapping.traces += traceFactory.createTrace => [
				umlElements += sourceObject
				xtumlrtElements += targetObject
			]
		} else {
			trace('''Adding new object to existing trace''')
			traces.head.xtumlrtElements += targetObject
		}
	}

	private def findTrace(NamedElement sourceObject) {
		engine.trace.getOneArbitraryMatch(rootMapping, null, sourceObject, null)
	}

	protected def Class<? extends T> getTargetClass()

	protected def S getSourceObject(M match)

	protected def T createTargetObject(S sourceObject, M match)

	protected def void updateTargetObject(T targetObject, M match)

	protected def void insertTargetObject(T targetObject, M match)
	
}
