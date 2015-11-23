package com.incquerylabs.emdw.toolchain.mwe2integration.messages

import com.incquerylabs.emdw.toolchain.mwe2integration.CppComponentTransformationStep
import java.security.InvalidParameterException
import java.util.Set
import org.eclipse.papyrusrt.xtumlrt.xtuml.XTComponent
import org.eclipse.viatra.emf.mwe2integration.IMessage
import org.eclipse.viatra.emf.mwe2integration.IMessageProcessor
import org.eclipse.viatra.emf.mwe2integration.ITransformationStep

class DirtyComponentsMessageProcessor implements IMessageProcessor<Set<XTComponent>, DirtyComponentsMessage> {
	protected ITransformationStep parent

	override ITransformationStep getParent() {
		return parent
	}

	override void setParent(ITransformationStep parent) {
		this.parent = parent
	}

	override void processMessage(IMessage<? extends Object> message) throws InvalidParameterException {
		if (message instanceof DirtyComponentsMessage) {
			var DirtyComponentsMessage event = (message as DirtyComponentsMessage)
			
			
			//Register dirty components
			if (parent instanceof CppComponentTransformationStep) {
				var m2tparent = (parent as CppComponentTransformationStep)
				m2tparent.dirtyComponents = event.parameter
			}
		}
	}
}
