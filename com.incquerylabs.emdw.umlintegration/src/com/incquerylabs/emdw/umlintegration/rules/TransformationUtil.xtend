package com.incquerylabs.emdw.umlintegration.rules

import com.zeligsoft.umlrt.codegen.cpp.ModelUtil
import com.zeligsoft.xtumlrt.common.CommonFactory
import com.zeligsoft.xtumlrt.common.VisibilityKind
import org.eclipse.uml2.uml.State
import org.eclipse.uml2.uml.ParameterDirectionKind
import com.zeligsoft.xtumlrt.common.DirectionKind

class TransformationUtil {

	public static val VERTEX_MAPPING_PRIORITY = 1

	public static val TYPE_MAPPING_PRIORITY = Math.max(XTClassMapping.PRIORITY, XTComponentMapping.PRIORITY)

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
	
	static def transform(org.eclipse.uml2.uml.VisibilityKind kind) {
		switch kind {
			case PRIVATE_LITERAL: VisibilityKind.PRIVATE
			case PROTECTED_LITERAL: VisibilityKind.PROTECTED
			case PUBLIC_LITERAL: VisibilityKind.PUBLIC
		}
	}
	
	static def transform(ParameterDirectionKind kind) {
		switch kind {
			case IN_LITERAL: DirectionKind.IN
			case OUT_LITERAL: DirectionKind.OUT
			case INOUT_LITERAL: DirectionKind.IN_OUT
		}
	}

}