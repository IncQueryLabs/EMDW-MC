package com.incquerylabs.emdw.cpp.common.util

import com.incquerylabs.emdw.cpp.common.util.IEMDWProgressMonitor

class EMDWNullProgressMonitor implements IEMDWProgressMonitor {
	
	override isCanceled() {
		return false
	}
	
	override worked(int work) {
		return
	}
	
	override setWorkRemaining(int work) {
		return
	}
	
	override newChild(int totalWork) {
		new EMDWNullProgressMonitor()
	}
	
}