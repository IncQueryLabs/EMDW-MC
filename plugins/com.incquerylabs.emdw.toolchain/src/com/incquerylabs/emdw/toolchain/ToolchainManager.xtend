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