package com.incquerylabs.emdw.cpp.transformation.mappings

import com.ericsson.xtumlrt.oopl.cppmodel.CppmodelFactory
import java.util.Map
import org.eclipse.emf.ecore.EObject
import org.eclipse.emf.ecore.util.EcoreUtil
import org.eclipse.incquery.runtime.api.IPatternMatch
import org.eclipse.incquery.runtime.api.IncQueryEngine
import org.eclipse.papyrusrt.xtumlrt.common.NamedElement

abstract class AbstractObjectMapping<Match extends IPatternMatch, XtumlObject extends EObject, CppObject extends EObject> extends AbstractMapping<Match> {
	
	protected static val CppmodelFactory cppModelFactory = CppmodelFactory.eINSTANCE
	
	// TODO: fix handling mapping cache (trace)
	Map<XtumlObject, CppObject> traceMap = newHashMap()
	
	new(IncQueryEngine engine) {
		super(engine)
	}
	
	override void appeared(Match match) {
		val xtumlObject = match.xtumlObject
		val cppObject = match.createCppObject
		cppObject?.insertCppObject(match)
		cppObject?.updateName(xtumlObject)
		cppObject?.updateCppObject(match)
		traceMap.put(xtumlObject, cppObject)
		debug(''' xtUMLrt model element appeared: «xtumlObject»''')
	}
	
	override void updated(Match match) {
		val xtumlObject = match.xtumlObject
		val cppObject = traceMap.get(xtumlObject)
		cppObject?.updateName(xtumlObject)
		cppObject?.updateCppObject(match)
		debug(''' xtUMLrt model element updated: «xtumlObject»''')
	}
	
	override void disappeared(Match match) {
		val xtumlObject = match.xtumlObject
		val cppObject = traceMap.remove(xtumlObject)
		cppObject?.removeCppObject
		debug(''' xtUMLrt model element disappeared: «xtumlObject»''')
	}
	
	// Return the XtumlObject from the match
	protected def XtumlObject getXtumlObject(Match match)
	
	// Create new CppObject
	protected def CppObject createCppObject(Match match)
	
	// Insert CppObject
	protected def void insertCppObject(CppObject cppObject, Match match)
	
	// Update CppObject
	protected def void updateCppObject(CppObject cppObject, Match match)
	
	private def updateName(CppObject cppObject, XtumlObject xtumlObject) {
		switch xtumlObject {
			NamedElement: {
				switch cppObject {
					NamedElement: cppObject.name = xtumlObject.name
				}
			} 
		}
	}
	
	private def removeCppObject(CppObject cppObject) {
		EcoreUtil.remove(cppObject)
	}
	
}