package com.incquerylabs.emdw.cpp.performance.test.app;

import java.io.IOException;
import java.util.Arrays;
import java.util.List;

import org.apache.log4j.FileAppender;
import org.apache.log4j.Level;
import org.apache.log4j.Logger;
import org.apache.log4j.PatternLayout;
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
            initLogger(args.get(0), 1);
            performanceTest.run(args.get(0), DEFAULT_RESULT_FOLDER, 1);
        } else if(args.size()==2) {
            DynamicPerformanceTest performanceTest = new DynamicPerformanceTest();
            initLogger(args.get(0), 1);
            performanceTest.run(args.get(0), DEFAULT_RESULT_FOLDER, Integer.parseInt(args.get(1)));
        } else if(args.size()==3) {
            DynamicPerformanceTest performanceTest = new DynamicPerformanceTest();
            initLogger(args.get(0), Integer.parseInt(args.get(1)));
            performanceTest.run(args.get(0), args.get(2), Integer.parseInt(args.get(1)));
        } else {
            System.out.println("Too much arguments!");
//          throw new IllegalArgumentException("Too much arguments!");
        }
        System.out.println("EMDW Performance Test App finished");
        return IApplication.EXIT_OK;
    }

    /* (non-Javadoc)
     * @see IApplication#stop()
     */
    public void stop() {
        // nothing to do
    }
    
    static String COMMON_LAYOUT = "%c{1} - %m%n";
	static String FILE_LOG_LAYOUT_PREFIX = "[%d{MMM/dd HH:mm:ss}] ";
	
    

	private void initLogger(String configFile, int runIndex) {	
		Logger.getLogger("org.eclipse.incquery").setLevel(Level.INFO);
		
		String logFilePath = "./results/log/log_"+configFile.replace("/", "_")+"_startedAt_"+System.currentTimeMillis()+".log";
		FileAppender fileAppender;
		try {
			fileAppender = new FileAppender(new PatternLayout(FILE_LOG_LAYOUT_PREFIX+COMMON_LAYOUT),logFilePath,true);
			Logger rootLogger = Logger.getRootLogger();
			rootLogger.removeAllAppenders();
			rootLogger.addAppender(fileAppender);
			rootLogger.setAdditivity(false);
			rootLogger.setLevel(Level.INFO);
		} catch (IOException e) {
			e.printStackTrace();
		}
	}

}