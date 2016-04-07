/*******************************************************************************
 * Copyright (c) 2015-2016, IncQuery Labs Ltd. and Ericsson AB
 * All rights reserved. This program and the accompanying materials
 * are made available under the terms of the Eclipse Public License v1.0
 * which accompanies this distribution, and is available at
 * http://www.eclipse.org/legal/epl-v10.html
 *
 * Contributors:
 *   Akos Horvath, Abel Hegedus, Zoltan Ujhelyi, Daniel Segesdi, Tamas Borbas, Robert Doczi, Peter Lunk, Istvan Papp - initial API and implementation
 *******************************************************************************/
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