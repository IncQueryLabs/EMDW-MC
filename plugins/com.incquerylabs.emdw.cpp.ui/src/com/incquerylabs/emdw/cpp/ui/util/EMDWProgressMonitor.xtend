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