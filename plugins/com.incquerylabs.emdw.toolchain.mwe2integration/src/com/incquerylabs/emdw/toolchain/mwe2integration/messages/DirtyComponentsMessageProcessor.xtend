/*******************************************************************************
 * Copyright (c) 2015-2016, IncQuery Labs Ltd. and Ericsson AB
 * All rights reserved. This program and the accompanying materials
 * are made available under the terms of the Eclipse Public License v1.0
 * which accompanies this distribution, and is available at
 * http://www.eclipse.org/legal/epl-v10.html
 *
 * Contributors:
 *   Akos Horvath, Abel Hegedus, Zoltan Ujhelyi, Peter Lunk - initial API and implementation
 *******************************************************************************/
package com.incquerylabs.emdw.toolchain.mwe2integration.messages

import com.incquerylabs.emdw.toolchain.mwe2integration.steps.CppComponentTransformationStep
import com.incquerylabs.emdw.toolchain.mwe2integration.steps.FileContentCreationStep
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
				var castparent = (parent as CppComponentTransformationStep)
				castparent.dirtyComponents = event.parameter
			}else if (parent instanceof FileContentCreationStep){
				var castparent = (parent as FileContentCreationStep)
				castparent.dirtyComponents = event.parameter
			}
		}
	}
}
