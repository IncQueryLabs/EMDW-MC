/*******************************************************************************
 * Copyright (c) 2015-2016, IncQuery Labs Ltd. and Ericsson AB
 * All rights reserved. This program and the accompanying materials
 * are made available under the terms of the Eclipse Public License v1.0
 * which accompanies this distribution, and is available at
 * http://www.eclipse.org/legal/epl-v10.html
 *
 * Contributors:
 *   Akos Horvath, Abel Hegedus, Zoltan Ujhelyi, Daniel Segesdi - initial API and implementation
 *******************************************************************************/
package com.incquerylabs.emdw.modelmultiplicator

import java.util.List
import org.eclipse.uml2.uml.Component
import org.eclipse.uml2.uml.Package
import org.eclipse.uml2.uml.PackageableElement

import static extension org.eclipse.emf.ecore.util.EcoreUtil.*
import org.eclipse.uml2.uml.Classifier

public class ModelMultiplicator {

	def copyAllSubelements(Component parentElement, int count) {
		copyNestedElements(parentElement, count, Classifier)
		copyPackagedElements(parentElement, count, PackageableElement)
	}

	def <T extends Classifier & PackageableElement> copyAllSubelements(Component parentElement, int count, Class<T> elementType) {
		copyNestedElements(parentElement, count, elementType)
		copyPackagedElements(parentElement, count, elementType)
	}
	
	def copyAllSubelements(Package parentElement, int count) {
		copyPackagedElements(parentElement, count, PackageableElement)
	}
	
	def copyNestedElements(Component parentElement, int count, Class<? extends Classifier> elementType) {
		val elements = parentElement.nestedClassifiers.filter(elementType).toList
		parentElement.nestedClassifiers += elements.getClassifierCopies(count)
	}
	
	def copyPackagedElements(Package parentElement, int count, Class<? extends PackageableElement> elementType) {
		val elements = parentElement.packagedElements.filter(elementType).toList
		parentElement.packagedElements += elements.getCopies(count)
	}
	
	def copyPackagedElements(Component parentElement, int count, Class<? extends PackageableElement> elementType) {
		val elements = parentElement.packagedElements.filter(elementType).toList
		parentElement.packagedElements += elements.getCopies(count)
	}
	
	private def getCopies(List<? extends PackageableElement> elements, int count) {
		val newElements = newArrayList()
		for (i : 0..<count) {
			newElements += elements.copyAll => [forEach[name = '''«name»_copy_«i»''']]
		}
		return newElements
	}
	
	private def getClassifierCopies(List<? extends Classifier> elements, int count) {
		val newElements = newArrayList()
		for (i : 0..<count) {
			newElements += elements.copyAll => [forEach[name = '''«name»_copy_«i»''']]
		}
		return newElements
	}
}
