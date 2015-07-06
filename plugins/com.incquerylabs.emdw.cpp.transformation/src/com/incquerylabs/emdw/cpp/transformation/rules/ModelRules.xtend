package com.incquerylabs.emdw.cpp.transformation.rules

import com.ericsson.xtumlrt.oopl.cppmodel.CPPModel
import com.incquerylabs.emdw.cpp.transformation.mappings.AbstractObjectMapping
import com.incquerylabs.emdw.cpp.transformation.queries.XtModelMatch
import java.util.Set
import org.eclipse.incquery.runtime.api.IncQueryEngine
import org.eclipse.papyrusrt.xtumlrt.common.Model

class ModelRules {
	
	static def Set<AbstractObjectMapping<?, ?, ?>> getRules(IncQueryEngine engine) {
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
	
	override protected getCppObject(Model xtModel) {
		val cppModel = engine.xtModelToCppModel.getAllValuesOfcppModel(xtModel).head
		cppModel
	}
	
	override protected createCppObject(XtModelMatch match) {
		val cppModel = cppModelFactory.createCPPModel
		cppModel.bodyDir = createCPPDirectory
		cppModel.headerDir = createCPPDirectory
		cppModel
	}
	
	override protected insertCppObject(CPPModel cppModel, XtModelMatch match) {
		val xtModel = match.xtModel
		cppModel.commonModel = xtModel
		// FIXME: create distinct resource for cppmodel?
		xtModel.eResource.contents += cppModel		
	}
	
	override protected updateCppObject(CPPModel cppModel, XtModelMatch match) {}
	
}