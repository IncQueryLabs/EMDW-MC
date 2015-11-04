package com.incquerylabs.emdw.cpp.performance.test.config

import com.ericsson.xtumlrt.oopl.cppmodel.CPPSourceFile
import com.incquerylabs.emdw.toolchain.Toolchain
import eu.mondo.sam.core.DataToken
import java.util.Map
import org.eclipse.uml2.uml.Model
import org.eclipse.xtend.lib.annotations.Accessors

@Accessors
class MCDataToken implements DataToken {
	String scenarioName
	
	Toolchain toolchain
	
	String umlModelPath
	Model umlModel
	long randomSeed
	int componentInsideScale
	int componentsScale
	boolean shouldCompileBody
	int modificationTimes
	int modificationScope
	Map<ModificationType, Integer> modifications
	StringBuilder log = new StringBuilder
	val metrics = <String>newArrayList() => [
		it.add("Phase | Time | Memory")
		it.add("------|------|-------")
	]
	
	Map<CPPSourceFile, CharSequence> cppSourceFileContents
	
	def getPurifiedModificationMap() {
		return modifications.filter[type, times|times>0]
	}
	
	def void addLogLine(String logInfo) {
		log.append(logInfo+"\n")
	}
	
	def void addMetrics(String phaseName, String timerValue, String memoryValue) {
		metrics.add('''«phaseName» | «timerValue» | «memoryValue»''')
	}
	
	def void printLog() {
		println(log.toString)
	}
	
	def void printMetrics() {
		metrics.forEach[println(it)]
	}
	
	override init() {
		//throw new UnsupportedOperationException("TODO: auto-generated method stub")
	}
	
	override destroy() {
		//throw new UnsupportedOperationException("TODO: auto-generated method stub")
	}
	
}