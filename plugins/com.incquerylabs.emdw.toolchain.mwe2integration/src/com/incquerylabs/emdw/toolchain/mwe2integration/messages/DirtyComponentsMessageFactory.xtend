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

import org.eclipse.viatra.emf.mwe2integration.IMessageFactory
import org.eclipse.viatra.emf.mwe2integration.mwe2impl.exceptions.InvalidParameterTypeException
import java.util.Set
import org.eclipse.papyrusrt.xtumlrt.xtuml.XTComponent

class DirtyComponentsMessageFactory implements IMessageFactory<Set<XTComponent>, DirtyComponentsMessage> {
	override boolean isValidParameter(Object parameter) {
		if (parameter instanceof Set<?>) {
			return true
		}
		return false
	}

	override DirtyComponentsMessage createMessage(Object parameter) throws InvalidParameterTypeException {
		if (isValidParameter(parameter)) {
			return new DirtyComponentsMessage(parameter as Set<XTComponent>)
		}
		return null
	}
}
