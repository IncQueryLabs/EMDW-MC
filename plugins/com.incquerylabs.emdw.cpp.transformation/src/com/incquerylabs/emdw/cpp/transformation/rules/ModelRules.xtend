/*******************************************************************************
 * Copyright (c) 2015-2016, IncQuery Labs Ltd. and Ericsson AB
 * All rights reserved. This program and the accompanying materials
 * are made available under the terms of the Eclipse Public License v1.0
 * which accompanies this distribution, and is available at
 * http://www.eclipse.org/legal/epl-v10.html
 *
 * Contributors:
 *   Akos Horvath, Abel Hegedus, Zoltan Ujhelyi, Daniel Segesdi, Tamas Borbas, Robert Doczi, Peter Lunk, Istvan Papp - initial API and implementation
 *******************************************************************************/
package com.incquerylabs.emdw.cpp.transformation.rules

import com.ericsson.xtumlrt.oopl.cppmodel.CPPModel
import com.incquerylabs.emdw.cpp.transformation.mappings.AbstractObjectMapping
import com.incquerylabs.emdw.cpp.transformation.queries.XtModelMatch
import java.util.Set
import org.eclipse.emf.ecore.util.EcoreUtil
import org.eclipse.incquery.runtime.api.IncQueryEngine
import org.eclipse.papyrusrt.xtumlrt.common.Model

class ModelRules {
	
	static def Set<AbstractObjectMapping<?, ?, ?>> getRules(IncQueryEngine engine) {
		#{
			//new ModelMapping(engine)
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
	
	override protected getCppObject(XtModelMatch match) {
		val xtModel = match.xtModel
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
	
	override protected removeCppObject(CPPModel cppModel, XtModelMatch match) {
		if(cppModel.headerDir.equals(cppModel.bodyDir))
			EcoreUtil.remove(cppModel.headerDir)
		else {
			EcoreUtil.remove(cppModel.headerDir)
			EcoreUtil.remove(cppModel.bodyDir)
		}
		EcoreUtil.remove(cppModel)
	}
}