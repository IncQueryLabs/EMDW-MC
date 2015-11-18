package com.incquerylabs.emdw.cpp.common.util

interface IEMDWProgressMonitor  {
	def boolean isCanceled()
	def void worked(int work)
	def void setWorkRemaining(int work)
	def IEMDWProgressMonitor newChild(int totalWork)
}