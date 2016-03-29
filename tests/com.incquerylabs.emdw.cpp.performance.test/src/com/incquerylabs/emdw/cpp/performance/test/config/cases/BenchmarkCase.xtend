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
package com.incquerylabs.emdw.cpp.performance.test.config.cases

class BenchmarkCase {
	public final String modelName
	public final int componentInsideScale
	public final int componentsScale
	public final int modificationTimes
	
	new(String modelName, int componentInsideScale, int componentsScale, int modificationTimes) {
		this.modelName = modelName
		this.componentInsideScale = componentInsideScale
		this.componentsScale = componentsScale
		this.modificationTimes = modificationTimes
	}
}