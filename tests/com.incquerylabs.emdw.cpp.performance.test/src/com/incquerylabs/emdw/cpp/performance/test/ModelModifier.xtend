package com.incquerylabs.emdw.cpp.performance.test

import com.incquerylabs.emdw.cpp.performance.test.config.ModificationType
import java.util.Collections
import java.util.Random
import org.eclipse.uml2.uml.Class
import org.eclipse.uml2.uml.Component
import org.eclipse.uml2.uml.Type
import org.eclipse.uml2.uml.UMLFactory
import org.eclipse.uml2.uml.Package
import org.eclipse.uml2.uml.StateMachine
import org.eclipse.uml2.uml.State
import org.eclipse.uml2.uml.Transition
import java.util.List
import org.eclipse.uml2.uml.Model

import static extension org.eclipse.emf.ecore.util.EcoreUtil.*

class ModelModifier {
	extension val UMLFactory factory = UMLFactory.eINSTANCE
	
	val Random random
	
	new(Random random) {
		this.random = random
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
		val usedTypes = umlClass.eResource.allContents.filter(Type).toList.sortBy[qualifiedName].shuffle
		
		umlClass.ownedAttributes += createProperty => [
			name = "addedProperty"
			type = usedTypes.head
		]
	}
	
	def removeRandomAttribute(Component containingComponent) {
		val umlClasses = containingComponent.allOwnedElements.filter(Class)
		val attributes = umlClasses.map[it.ownedAttributes].flatten.sortBy[qualifiedName].shuffle
		val attribute = attributes.head
		attribute.destroy
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
		transition.destroy
	}
	
	def removeRandomComponent(Model model) {
		val components = model.allOwnedElements.filter(Component).sortBy[qualifiedName].shuffle
		val component = components.head
		component.destroy
	}
	
	def removeRandomPackage(Model model) {
		val packages = model.allOwnedElements.filter(Package).sortBy[qualifiedName].shuffle
		val package = packages.head
		package.destroy
	}
	
	def renameRandomPackage(Model model) {
		val packages = model.allOwnedElements.filter(Package).sortBy[qualifiedName].shuffle
		val package = packages.head
		package.name = '''«package.name»_renamed'''
	}
	
	def copyRandomComponent(Model model) {
		val components = model.allOwnedElements.filter(Component).sortBy[qualifiedName].shuffle
		val component = components.head
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
		val container = package.eContainer
		val copiedPackage = copy(package) => [name = '''«name»_copy''']
		if(container instanceof Component){
			container.packagedElements += copiedPackage
		}
		else if(container instanceof Package){
			container.packagedElements += copiedPackage
		}
	}
	
	private def <T> List<T> shuffle(List<T> list) {
		Collections.shuffle(list, random)
		list
	}
	
}