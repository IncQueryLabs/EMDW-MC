package com.incquerylabs.emdw.cpp.common.util

import com.incquerylabs.emdw.cpp.common.util.IEMDWProgressMonitor

class EMDWNullProgressMonitor implements IEMDWProgressMonitor {
	
	override isCanceled() {
		return false
	}
	
	override worked(int work) {
		return
	}
	
}