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
