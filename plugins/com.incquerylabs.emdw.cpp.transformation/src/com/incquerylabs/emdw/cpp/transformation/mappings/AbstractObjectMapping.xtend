package com.incquerylabs.emdw.cpp.transformation.mappings

import com.ericsson.xtumlrt.oopl.OoplFactory
import com.ericsson.xtumlrt.oopl.cppmodel.CppmodelFactory
import org.eclipse.emf.ecore.EObject
import org.eclipse.incquery.runtime.api.IPatternMatch
import org.eclipse.incquery.runtime.api.IncQueryEngine
import org.eclipse.papyrusrt.xtumlrt.common.NamedElement
import com.incquerylabs.emdw.cpp.transformation.util.CPPTransformationUtil

abstract class AbstractObjectMapping<Match extends IPatternMatch, XtumlObject extends EObject, CppObject extends EObject> extends AbstractMapping<Match> {
	
	protected extension val CppmodelFactory cppModelFactory = CppmodelFactory.eINSTANCE
	protected extension val OoplFactory ooplFactory = OoplFactory.eINSTANCE
	protected extension val CPPTransformationUtil util = new CPPTransformationUtil 
	
	new(IncQueryEngine engine) {
		super(engine)
	}
	
	override void appeared(Match match) {
		val xtumlObject = match.xtumlObject
		val cppObject = match.createCppObject
		cppObject?.insertCppObject(match)
		cppObject?.updateName(xtumlObject)
		cppObject?.updateCppObject(match)
		debug(''' xtUMLrt model element appeared: «xtumlObject»''')
	}
	
	override void updated(Match match) {
		val xtumlObject = match.xtumlObject
		val cppObject = xtumlObject.cppObject
		cppObject?.updateName(xtumlObject)
		cppObject?.updateCppObject(match)
		debug(''' xtUMLrt model element updated: «xtumlObject»''')
	}
	
	override void disappeared(Match match) {
		val xtumlObject = match.xtumlObject
		val cppObject = xtumlObject.cppObject
		cppObject?.removeCppObject(match)
		debug(''' xtUMLrt model element disappeared: «xtumlObject»''')
	}
	
	// Return the XtumlObject from the match
	protected def XtumlObject getXtumlObject(Match match)
	
	// Return the CppObject from the match
	protected def CppObject getCppObject(XtumlObject xtObject)
	
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
	
	protected def void removeCppObject(CppObject cppObject, Match match)
	
}