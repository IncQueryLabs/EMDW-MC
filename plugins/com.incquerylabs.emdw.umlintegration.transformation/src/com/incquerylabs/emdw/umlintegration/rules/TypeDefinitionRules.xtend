/*******************************************************************************
 * Copyright (c) 2015-2016, IncQuery Labs Ltd. and Ericsson AB
 * All rights reserved. This program and the accompanying materials
 * are made available under the terms of the Eclipse Public License v1.0
 * which accompanies this distribution, and is available at
 * http://www.eclipse.org/legal/epl-v10.html
 *
 * Contributors:
 *   Akos Horvath, Abel Hegedus, Zoltan Ujhelyi, Daniel Segesdi, Tamas Borbas, Denes Harmath - initial API and implementation
 *******************************************************************************/
package com.incquerylabs.emdw.umlintegration.rules

import com.incquerylabs.emdw.umlintegration.queries.TypeDefinitionInComponentMatch
import com.incquerylabs.emdw.umlintegration.queries.TypeDefinitionInPackageMatch
import com.incquerylabs.emdw.umlintegration.queries.TypeDefinitionMatch
import java.util.Set
import org.eclipse.incquery.runtime.api.IncQueryEngine
import org.eclipse.papyrusrt.xtumlrt.common.Package
import org.eclipse.papyrusrt.xtumlrt.common.TypeDefinition
import org.eclipse.papyrusrt.xtumlrt.xtuml.XTComponent
import org.eclipse.uml2.uml.Type
import com.incquerylabs.emdw.umlintegration.queries.TypeDefinitionInModelMatch
import org.eclipse.papyrusrt.xtumlrt.common.Model

class TypeDefinitionRules{
	static def Set<AbstractMapping<?>> getRules(IncQueryEngine engine) {
		#{
			new TypeDefinitionMapping(engine),
			new TypeDefinitionInPackageMapping(engine),
			new TypeDefinitionInModelMapping(engine),
			new TypeDefinitionInComponentMapping(engine)
		}
	}
}

/**
 * Transforms Types defining a primitive or struct type to TypeDefinitions. 
 */
class TypeDefinitionMapping extends AbstractObjectMapping<TypeDefinitionMatch, Type, TypeDefinition> {

	new(IncQueryEngine engine) {
		super(engine)
	}

	override getXtumlrtClass() {
		TypeDefinition
	}

	public static val PRIORITY = CommonPriorities.TYPE_MAPPING_PRIORITY

	override getRulePriority() {
		PRIORITY
	}

	override getQuerySpecification() {
		typeDefinition
	}

	override getUmlObject(TypeDefinitionMatch match) {
		match.type
	}

	override createXtumlrtObject() {
		commonFactory.createTypeDefinition
	}

	override updateXtumlrtObject(TypeDefinition xtumlrtObject, TypeDefinitionMatch match) {
		xtumlrtObject.type = match.type.findXtumlrtObject(org.eclipse.papyrusrt.xtumlrt.common.Type) // There might be > 1 traces
	}

	override protected insertXtumlrtObject(TypeDefinition xtumlrtObject, TypeDefinitionMatch match) {
	}

}


/**
 * Inserts TypeDefinitions in their parent Package.
 */
class TypeDefinitionInPackageMapping extends AbstractContainmentMapping<TypeDefinitionInPackageMatch, Package, TypeDefinition> {

	new(IncQueryEngine engine) {
		super(engine)
	}
	
	public static val PRIORITY = Math.max(TypeDefinitionMapping.PRIORITY, XTPackageMapping.PRIORITY) + 1
	
	override getRulePriority() {
		PRIORITY
	}

	override getQuerySpecification() {
		typeDefinitionInPackage
	}

	override findParent(TypeDefinitionInPackageMatch match) {
		match.umlPackage.findXtumlrtObject(Package)
	}
	
	override findChild(TypeDefinitionInPackageMatch match) {
		match.type.findXtumlrtObject(TypeDefinition)
	}
	
	override insertChild(Package parent, TypeDefinition child, TypeDefinitionInPackageMatch match) {
		parent.typeDefinitions += child
	}
}

/**
 * Inserts TypeDefinitions in their parent Model.
 */
class TypeDefinitionInModelMapping extends AbstractContainmentMapping<TypeDefinitionInModelMatch, Model, TypeDefinition> {

	new(IncQueryEngine engine) {
		super(engine)
	}
	
	public static val PRIORITY = Math.max(TypeDefinitionMapping.PRIORITY, CommonPriorities.VERTEX_MAPPING_PRIORITY) + 1
	
	override getRulePriority() {
		PRIORITY
	}

	override getQuerySpecification() {
		typeDefinitionInModel
	}

	override findParent(TypeDefinitionInModelMatch match) {
		match.umlModel.findXtumlrtObject(Model)
	}
	
	override findChild(TypeDefinitionInModelMatch match) {
		match.type.findXtumlrtObject(TypeDefinition)
	}
	
	override insertChild(Model parent, TypeDefinition child, TypeDefinitionInModelMatch match) {
		parent.typeDefinitions += child
	}
}

/**
 * Inserts TypeDefinitions in their parent XTComponent.
 */
class TypeDefinitionInComponentMapping extends AbstractContainmentMapping<TypeDefinitionInComponentMatch, XTComponent, TypeDefinition> {

	new(IncQueryEngine engine) {
		super(engine)
	}
	
	public static val PRIORITY = Math.max(TypeDefinitionMapping.PRIORITY, XTComponentMapping.PRIORITY) + 1
	
	override getRulePriority() {
		PRIORITY
	}

	override getQuerySpecification() {
		typeDefinitionInComponent
	}

	override findParent(TypeDefinitionInComponentMatch match) {
		match.umlComponent.findXtumlrtObject(XTComponent)
	}
	
	override findChild(TypeDefinitionInComponentMatch match) {
		match.type.findXtumlrtObject(TypeDefinition)
	}
	
	override insertChild(XTComponent parent, TypeDefinition child, TypeDefinitionInComponentMatch match) {
		parent.typeDefinitions += child
	}
}
