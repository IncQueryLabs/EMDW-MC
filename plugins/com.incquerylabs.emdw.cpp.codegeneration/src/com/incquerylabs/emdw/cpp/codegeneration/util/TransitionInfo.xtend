package com.incquerylabs.emdw.cpp.codegeneration.util

import com.ericsson.xtumlrt.oopl.cppmodel.CPPTransition
import org.eclipse.xtend.lib.annotations.Data
import org.eclipse.papyrusrt.xtumlrt.common.Transition
import com.ericsson.xtumlrt.oopl.cppmodel.CPPState

@Data
class TransitionInfo {
	CPPTransition cppTransition
	Transition transition
	CPPState cppSource
	CPPState cppTarget
}