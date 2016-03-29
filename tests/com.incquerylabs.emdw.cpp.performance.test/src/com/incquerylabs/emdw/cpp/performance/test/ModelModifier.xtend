/*******************************************************************************
 * Copyright (c) 2015-2016, IncQuery Labs Ltd. and Ericsson AB
 * All rights reserved. This program and the accompanying materials
 * are made available under the terms of the Eclipse Public License v1.0
 * which accompanies this distribution, and is available at
 * http://www.eclipse.org/legal/epl-v10.html
 *
 * Contributors:
 *   Akos Horvath, Abel Hegedus, Zoltan Ujhelyi, Daniel Segesdi, Tamas Borbas, Robert Doczi, Peter Lunk - initial API and implementation
 *******************************************************************************/
package com.incquerylabs.emdw.cpp.performance.test

import com.incquerylabs.emdw.cpp.performance.test.config.ModificationType
import java.util.Collections
import java.util.List
import java.util.Map
import java.util.Random
import org.eclipse.uml2.uml.Class
import org.eclipse.uml2.uml.Component
import org.eclipse.uml2.uml.Model
import org.eclipse.uml2.uml.Package
import org.eclipse.uml2.uml.State
import org.eclipse.uml2.uml.StateMachine
import org.eclipse.uml2.uml.Transition
import org.eclipse.uml2.uml.Type
import org.eclipse.uml2.uml.UMLFactory

import static org.eclipse.emf.ecore.util.EcoreUtil.*

class ModelModifier {
	extension val UMLFactory factory = UMLFactory.eINSTANCE
	
	val Random random
	val Map<Type, org.eclipse.papyrusrt.xtumlrt.common.Type> primitiveTypeMapping
	
	new(Random random, Map<Type, org.eclipse.papyrusrt.xtumlrt.common.Type> primitiveTypeMapping) {
		this.random = random
		this.primitiveTypeMapping = primitiveTypeMapping
	}
	
	def performSmallModification(Component component, ModificationType modificationType) {
		switch modificationType {
			case SMALL_STRUCTURE__ATTRIBUTE__ADD : component.addRandomAttribute
			case SMALL_STRUCTURE__ATTRIBUTE__REMOVE : component.removeRandomAttribute
			case SMALL_STRUCTURE__TRANSITION__ADD : component.addRandomTransition
			case SMALL_STRUCTURE__TRANSITION__REMOVE: component.removeRandomTransition
			case SMALL_BEHAVIOR__ACTION_CODE: throw new UnsupportedOperationException("Action code modification is not yet supported")
			default : return
		}
	}
	
	def performHighLevelModification(Model model, ModificationType modificationType) {
		switch modificationType {
			case HIGH_LEVEL__COMPONENT__ADD: model.copyRandomComponent
			case HIGH_LEVEL__COMPONENT__REMOVE: model.removeRandomComponent
			case HIGH_LEVEL__PACKAGE__ADD: model.copyRandomComponent
			case HIGH_LEVEL__PACKAGE__MOVE: throw new UnsupportedOperationException("Moving packages is not yet supported")
			case HIGH_LEVEL__PACKAGE__REMOVE: model.removeRandomPackage
			case HIGH_LEVEL__PACKAGE__RENAME: model.renameRandomPackage
			default : return
		}
	}
	
	def addRandomAttribute(Component containingComponent) {
		val umlClasses = containingComponent.allOwnedElements.filter(Class).toList.shuffle
		val umlClass = umlClasses.head
		addRandomAttribute(umlClass)
	}
	
	def addRandomAttribute(Class umlClass) {
		// TODO: use any uml DataType instead of primitive types
		val umlTypes = primitiveTypeMapping.keySet.filter[it != null].sortBy[qualifiedName].shuffle
		val upperBound = random.nextBoolean.boundValue
		
		umlClass.ownedAttributes += createProperty => [
			name = "addedProperty"
			type = umlTypes.head
			upper = upperBound
		]
	}
	
	def removeRandomAttribute(Component containingComponent) {
		val umlClasses = containingComponent.allOwnedElements.filter(Class)
		val attributes = umlClasses.map[it.ownedAttributes].flatten.sortBy[qualifiedName].shuffle
		val attribute = attributes.head
		if(attribute != null) {
			attribute.destroy
		}
	}
	
	def addRandomTransition(Component containingComponent) {
		val stateMachines = containingComponent.allOwnedElements.filter(StateMachine).sortBy[qualifiedName].shuffle
		val stateMachine = stateMachines.head
		val states = stateMachine.allOwnedElements.filter(State).sortBy[qualifiedName].shuffle
		val source = states.head
		val target = states.last
		
		stateMachine.regions.head.transitions += createTransition => [
			it.source = source
			it.target = target
		]
	}
	
	def removeRandomTransition(Component containingComponent) {
		val transitions = containingComponent.allOwnedElements.filter(Transition).sortBy[qualifiedName].shuffle
		val transition = transitions.head
		if(transition != null) {
			transition.destroy
		}
	}
	
	def removeRandomComponent(Model model) {
		val components = model.allOwnedElements.filter(Component).sortBy[qualifiedName].shuffle
		val component = components.head
		if(component != null) {
			component.destroy
		}
	}
	
	def removeRandomPackage(Model model) {
		val packages = model.allOwnedElements.filter(Package).sortBy[qualifiedName].shuffle
		val package = packages.head
		if(package != null) {
			package.destroy
		}
	}
	
	def renameRandomPackage(Model model) {
		val packages = model.allOwnedElements.filter(Package).sortBy[qualifiedName].shuffle
		val package = packages.head
		if(package != null) {
			package.name = '''«package.name»_renamed'''
		}
	}
	
	def copyRandomComponent(Model model) {
		val components = model.allOwnedElements.filter(Component).sortBy[qualifiedName].shuffle
		val component = components.head
		if(component == null){
			return
		}
		val container = component.eContainer
		val copiedComponent = copy(component) => [name = '''«name»_copy''']
		if(container instanceof Component){
			container.packagedElements += copiedComponent
		}
		else if(container instanceof Package){
			container.packagedElements += copiedComponent
		}
	}
	
	def copyRandomPackage(Model model) {
		val packages = model.allOwnedElements.filter(Package).sortBy[qualifiedName].shuffle
		val package = packages.head
		if(package == null){
			return
		}
		val container = package.eContainer
		val copiedPackage = copy(package) => [name = '''«name»_copy''']
		if(container instanceof Component){
			container.packagedElements += copiedPackage
		}
		else if(container instanceof Package){
			container.packagedElements += copiedPackage
		}
	}
	
	private def getBoundValue(boolean isBounded) {
		if(isBounded) {
			return 1
		}
		return -1
	}
	
	private def <T> List<T> shuffle(List<T> list) {
		Collections.shuffle(list, random)
		list
	}
	
}