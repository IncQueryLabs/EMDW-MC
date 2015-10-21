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
    public static final String ARGS_HELP = "We need these arguments:\n" +
                                           " * first arg: properties file path\n" +
                                           " * second arg: run index (integer)\n" +
                                           " * third arg: target folder for result json and log\n" +
                                           " * fourth arg (optional): relative path root for the uml model";
    
    public static final String DEFAULT_RESULT_FOLDER = "./results/json/";
    
    /* (non-Javadoc)
     * @see IApplication#start(org.eclipse.equinox.app.IApplicationContext)
     */
    public Object start(IApplicationContext context) throws Exception {
        List<String> args = Arrays.asList((String[])context.getArguments().get("application.args"));
        System.out.println("EMDW Performance Test App started");
        System.out.println("Arguments:");
        args.forEach( arg -> System.out.println(" * "+arg));
        if(args==null || args.size()>4 || args.size()<3) {
            System.out.println(ARGS_HELP);
        } else {
            String configFilePath = getConfigFilePath(args);
            int runIndex = getRunIndex(args);
            String targetFolderPath = getTargetFolderPath(args);
            String relativePathRoot = getRelativePathRoot(args);
            DynamicPerformanceTest performanceTest = new DynamicPerformanceTest();
            initLogger(targetFolderPath, configFilePath, runIndex);
            
            performanceTest.setRelativePathRoot(relativePathRoot);
            performanceTest.setConfigFilePath(configFilePath);
            performanceTest.setTargetFolder(targetFolderPath);
            performanceTest.setRunIndex(runIndex);
            performanceTest.run();
        }
        System.out.println("EMDW Performance Test App finished");
//        boolean exit = false;
//        while(!exit) {
//            Thread.sleep(10000);
//        }
        return IApplication.EXIT_OK;
    }

    private String getConfigFilePath(List<String> args) {
        return args.get(0);
    }

    private int getRunIndex(List<String> args) {
        return Integer.parseInt(args.get(1));
    }

    private String getTargetFolderPath(List<String> args) {
        return checkFolderEnding(args.get(2));
    }

    private String getRelativePathRoot(List<String> args) {
        if(args.size()==4) {
            return checkFolderEnding(args.get(3));
        } else {
            return "";
        }
    }

    private String checkFolderEnding(String folderPath) {
        if(folderPath.endsWith("/")) {
            return folderPath;
        } else {
            return folderPath+"/";
        }
    }

    /* (non-Javadoc)
     * @see IApplication#stop()
     */
    public void stop() {
        // nothing to do
    }
    
    static String COMMON_LAYOUT = "%30.30c - %m%n";
	static String FILE_LOG_LAYOUT_PREFIX = "[%d{MMM/dd HH:mm:ss}] ";
	
	private void initLogger(String targetFolder, String configFile, int runIndex) {	
		Logger.getLogger("org.eclipse.incquery").setLevel(Level.INFO);
		
		String logFilePath = targetFolder + "./log/log_" + configFile.replace("/", "_").replace(':', '_') + "_startedAt_" + System.currentTimeMillis() + ".log";
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