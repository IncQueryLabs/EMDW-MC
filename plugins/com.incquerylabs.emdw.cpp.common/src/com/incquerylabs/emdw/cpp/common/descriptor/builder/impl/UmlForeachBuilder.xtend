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
package com.incquerylabs.emdw.cpp.common.descriptor.builder.impl

import com.incquerylabs.emdw.cpp.common.descriptor.builder.IOoplForeachBuilder
import com.incquerylabs.emdw.cpp.common.descriptor.builder.IUmlForeachBuilder
import com.incquerylabs.emdw.valuedescriptor.ValueDescriptor
import org.apache.log4j.Logger
import org.eclipse.incquery.runtime.api.AdvancedIncQueryEngine

class UmlForeachBuilder implements IUmlForeachBuilder {
	extension Logger logger = Logger.getLogger(class)
	
	private IOoplForeachBuilder builder
	
	private ValueDescriptor collection
	private ValueDescriptor variable
	
	new(AdvancedIncQueryEngine engine) {
		builder = new CppForeachBuilder(engine)
	}
	
	override build() {
		trace('''Started building''')
		val ocd = (builder => [
					it.collectionDescriptor = collection
					it.variableDescriptor = variable
				]).build
		trace('''Finished building''')
		return ocd
	}
	
	override setCollectionDescriptor(ValueDescriptor collection) {
		this.collection = collection
		return this
	}
	
	override setVariableDescriptor(ValueDescriptor variable) {
		this.variable = variable
		return this
	}
	
}