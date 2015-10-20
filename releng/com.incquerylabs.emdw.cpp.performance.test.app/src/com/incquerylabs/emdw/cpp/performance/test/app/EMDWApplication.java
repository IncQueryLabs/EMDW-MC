package com.incquerylabs.emdw.cpp.performance.test.app;

import java.util.Arrays;
import java.util.List;

import org.eclipse.equinox.app.IApplication;
import org.eclipse.equinox.app.IApplicationContext;

import com.incquerylabs.emdw.cpp.performance.test.DynamicPerformanceTest;

public class EMDWApplication implements IApplication {
    public static final String DEFAULT_RESULT_FOLDER = "./results/json/";
    
    /* (non-Javadoc)
     * @see IApplication#start(org.eclipse.equinox.app.IApplicationContext)
     */
    public Object start(IApplicationContext context) throws Exception {
        List<String> args = Arrays.asList((String[])context.getArguments().get("application.args"));
        System.out.println("EMDW Performance Test App started");
        System.out.println("Arguments:");
        args.forEach( arg -> System.out.println(" * "+arg));
        if(args==null || args.size()==0) {
            System.out.println("Properties file path need to be passed!");
//          throw new IllegalArgumentException("Properties file path need to be passed!");
        } else if(args.size()==1) {
            DynamicPerformanceTest performanceTest = new DynamicPerformanceTest();
            performanceTest.run(args.get(0), DEFAULT_RESULT_FOLDER);
        } else if(args.size()==2) {
            DynamicPerformanceTest performanceTest = new DynamicPerformanceTest();
            performanceTest.run(args.get(0), args.get(1));
        } else {
            System.out.println("Too much arguments!");
//          throw new IllegalArgumentException("Too much arguments!");
        }
        System.out.println("EMDW Performance Test App finished");
        for(int i=5; i>0; i--) {
            System.out.println("App will be stopped in "+i+" seconds");
            Thread.sleep(1000);
        }
        return IApplication.EXIT_OK;
    }

    /* (non-Javadoc)
     * @see IApplication#stop()
     */
    public void stop() {
        // nothing to do
    }

}