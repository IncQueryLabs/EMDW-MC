package com.incquerylabs.emdw.cpp.performance.test.app

import org.eclipse.equinox.app.IApplication
import org.eclipse.equinox.app.IApplicationContext
import com.incquerylabs.emdw.cpp.performance.test.DynamicPerformanceTest

/** 
 * This class controls all aspects of the application's execution
 */
class EMDWApplication implements IApplication {
	public static final String DEFAULT_RESULT_FOLDER = "./results/json/"
	
	/* (non-Javadoc)
	 * @see IApplication#start(org.eclipse.equinox.app.IApplicationContext)
	 */
	override Object start(IApplicationContext context) throws Exception {
		val args = context.getArguments().get("application.args") as String[]
		if(args==null || args.length==0) {
			throw new IllegalArgumentException("Properties file path need to be passed!")
		} else if(args.length==1) {
			val performanceTest = new DynamicPerformanceTest
			performanceTest.run(args.get(0), DEFAULT_RESULT_FOLDER)
		} else if(args.length==2) {
			val performanceTest = new DynamicPerformanceTest
			performanceTest.run(args.get(0), args.get(1))
		} else {
			throw new IllegalArgumentException("Too much arguments!")
		}
		return IApplication.EXIT_OK
	}

	/* (non-Javadoc)
	 * @see IApplication#stop()
	 */
	override void stop() {
		// nothing to do
	}

}
