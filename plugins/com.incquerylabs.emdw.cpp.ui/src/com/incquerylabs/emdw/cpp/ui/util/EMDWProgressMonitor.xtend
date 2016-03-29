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
package com.incquerylabs.emdw.cpp.ui.util

import com.incquerylabs.emdw.cpp.common.util.IEMDWProgressMonitor
import org.eclipse.core.runtime.SubMonitor

class EMDWProgressMonitor implements IEMDWProgressMonitor {
	
	val SubMonitor monitor
	
	private new(SubMonitor monitor) {
		this.monitor = monitor
	}
	
	static def convert(SubMonitor monitor) {
		return new EMDWProgressMonitor(monitor)
	}
	
	override isCanceled() {
		monitor.isCanceled
	}
	
	override worked(int work) {
		monitor.worked(work)
	}
	
	override setWorkRemaining(int work) {
		monitor.workRemaining = work
	}
	
	override newChild(int totalWork) {
		convert(monitor.newChild(totalWork))
	}
	
}