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

import com.incquerylabs.emdw.cpp.common.descriptor.builder.IOoplSendSignalBuilder
import com.incquerylabs.emdw.cpp.common.descriptor.builder.IUmlSendSignalBuilder
import com.incquerylabs.emdw.valuedescriptor.ValueDescriptor
import org.apache.log4j.Logger

class UmlSendSignalBuilder implements IUmlSendSignalBuilder {
	extension Logger logger = Logger.getLogger(class)
	
	ValueDescriptor variable
	ValueDescriptor signal
	boolean isInternal
	IOoplSendSignalBuilder builder
	
	new() {
		builder = new CppSendSignalBuilder
	}
	
	override build() {
		trace('''Started building''')
		val ocd = (builder => [
					it.variable = variable
					it.signal = signal
					it.isInternal = isInternal
				]).build
		trace('''Finished building''')
		return ocd
	}
	
	override setVariable(ValueDescriptor variable) {
		this.variable = variable
		return this
	}
	
	override setSignal(ValueDescriptor signal) {
		this.signal = signal
		return this
	}
	
	override setIsInternal(boolean isInternal) {
		this.isInternal = isInternal
		this
	}
	
}