package com.incquerylabs.emdw.cpp.transformation.rules

import com.ericsson.xtumlrt.oopl.cppmodel.CPPModel
import com.incquerylabs.emdw.cpp.transformation.mappings.AbstractMapping
import com.incquerylabs.emdw.cpp.transformation.mappings.AbstractObjectMapping
import com.incquerylabs.emdw.cpp.transformation.queries.XtModelMatch
import java.util.Set
import org.eclipse.incquery.runtime.api.IncQueryEngine
import org.eclipse.papyrusrt.xtumlrt.common.Model

class ModelRules {
	
	static def Set<AbstractMapping<?>> getRules(IncQueryEngine engine) {
		#{
			new ModelMapping(engine)
		}
	}
	
}

class ModelMapping extends AbstractObjectMapping<XtModelMatch, Model, CPPModel> {
	
	new(IncQueryEngine engine) {
		super(engine)
	}
	
	override getQuerySpecification() {
		xtModel
	}
	
	override protected getXtumlObject(XtModelMatch match) {
		return match.xtModel
	}
	
	override protected createCppObject(XtModelMatch match) {
		cppModelFactory.createCPPModel
	}
	
	override protected insertCppObject(CPPModel cppModel, XtModelMatch match) {
		val xtModel = match.xtModel
		cppModel.commonModel = xtModel
		// FIXME: create distinct resource for cppmodel?
		xtModel.eResource.contents += cppModel		
	}
	
	override protected updateCppObject(CPPModel cppModel, XtModelMatch match) {
		// TODO: implement 
	}
	
}