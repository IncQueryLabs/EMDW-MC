/*******************************************************************************
 * Copyright (c) 2015-2016, IncQuery Labs Ltd. and Ericsson AB
 * All rights reserved. This program and the accompanying materials
 * are made available under the terms of the Eclipse Public License v1.0
 * which accompanies this distribution, and is available at
 * http://www.eclipse.org/legal/epl-v10.html
 *
 * Contributors:
 *   Akos Horvath, Abel Hegedus, Zoltan Ujhelyi, Daniel Segesdi, Tamas Borbas, Robert Doczi, Peter Lunk - initial API and implementation
 *******************************************************************************/
package com.incquerylabs.emdw.cpp.app

import org.eclipse.equinox.app.IApplication
import org.eclipse.equinox.app.IApplicationContext
import java.util.Arrays

class EMDWEclipseApplication implements IApplication {
	EMDWApplication app

	override Object start(IApplicationContext context) throws Exception {
		app = new EMDWApplication()
		app.start(Arrays.asList(context.getArguments().get("application.args") as String[]))
		return IApplication.EXIT_OK
	}

	override void stop() {
	}

}
