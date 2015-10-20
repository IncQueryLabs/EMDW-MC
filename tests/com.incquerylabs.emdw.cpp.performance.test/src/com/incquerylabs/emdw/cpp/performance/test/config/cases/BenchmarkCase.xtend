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