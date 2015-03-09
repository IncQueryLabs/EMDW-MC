package com.incquerylabs.emdw.umlintegration.rules

import com.zeligsoft.umlrt.codegen.cpp.ModelUtil
import org.eclipse.uml2.uml.State
import com.zeligsoft.xtumlrt.common.CommonFactory

class StateMachineUtil {

	public static val VERTEX_MAPPING_PRIORITY = 1

	static val commonFactory = CommonFactory.eINSTANCE

	static def void updateState(com.zeligsoft.xtumlrt.common.State it, State umlState) {
		if (umlState.entry != null) {
			entryAction = commonFactory.createActionCode => [
				source = ModelUtil.getCppCode(umlState.entry)
			]
		}
		if (umlState.exit != null) {
			exitAction = commonFactory.createActionCode => [
				source = ModelUtil.getCppCode(umlState.exit)
			]
		}
	}
	
}