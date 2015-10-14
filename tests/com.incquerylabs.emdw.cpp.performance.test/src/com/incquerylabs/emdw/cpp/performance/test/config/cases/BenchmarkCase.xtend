package com.incquerylabs.emdw.cpp.performance.test.config.cases

class BenchmarkCase {
	public final int componentInsideScale
	public final int componentsScale
	public final int modificationTimes
	
	new(int componentInsideScale, int componentsScale, int modificationTimes) {
		this.componentInsideScale = componentInsideScale
		this.componentsScale = componentsScale
		this.modificationTimes = modificationTimes
	}
}