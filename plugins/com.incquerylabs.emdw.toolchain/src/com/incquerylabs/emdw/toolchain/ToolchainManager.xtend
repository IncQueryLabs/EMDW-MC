/*******************************************************************************
 * Copyright (c) 2015-2016, IncQuery Labs Ltd. and Ericsson AB
 * All rights reserved. This program and the accompanying materials
 * are made available under the terms of the Eclipse Public License v1.0
 * which accompanies this distribution, and is available at
 * http://www.eclipse.org/legal/epl-v10.html
 *
 * Contributors:
 *   Akos Horvath, Abel Hegedus, Zoltan Ujhelyi, Daniel Segesdi, Tamas Borbas, Peter Lunk - initial API and implementation
 *******************************************************************************/
package com.incquerylabs.emdw.toolchain

import com.google.common.collect.BiMap
import com.google.common.collect.HashBiMap
import org.eclipse.incquery.runtime.api.AdvancedIncQueryEngine

class ToolchainManager {
	private static val BiMap<AdvancedIncQueryEngine, Toolchain> toolchains = HashBiMap.create()
	
	static def getToolchain(AdvancedIncQueryEngine engine) {
		if (toolchains.containsKey(engine)){
			return toolchains.get(engine)
		} else {
			return null
		}
	}
	
	static def addToolchain(AdvancedIncQueryEngine engine, Toolchain toolchain) {
		toolchains.put(engine, toolchain)
	}
	
	static def disposeToolchain(Toolchain toolchain){
		toolchain.dispose
		toolchains.inverse.remove(toolchain)
	}
	
	static def disposeAllToolchains() {
		toolchains.forEach[engine, toolchain|
			toolchain.dispose
		]
		toolchains.clear
	}
}