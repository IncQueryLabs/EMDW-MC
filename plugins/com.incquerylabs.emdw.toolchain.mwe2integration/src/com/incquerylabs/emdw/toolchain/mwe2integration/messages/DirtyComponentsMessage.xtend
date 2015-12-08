package com.incquerylabs.emdw.toolchain.mwe2integration.messages

import org.eclipse.viatra.emf.mwe2integration.IMessage
import java.util.Set
import org.eclipse.papyrusrt.xtumlrt.xtuml.XTComponent

class DirtyComponentsMessage implements IMessage<Set<XTComponent>> {
	Set<XTComponent> parameter

	new(Set<XTComponent> parameter) {
		super()
		this.parameter = parameter
	}

	override Set<XTComponent> getParameter() {
		return parameter
	}

	override void setParameter(Set<XTComponent> parameter) {
		this.parameter = parameter
	}

}
