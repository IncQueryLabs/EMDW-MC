package com.incquerylabs.emdw.cpp.performance.test.utils

import java.io.IOException
import java.io.InputStream
import java.util.Properties
import org.apache.log4j.Level
import org.apache.log4j.Logger
import com.incquerylabs.emdw.cpp.performance.test.config.ModificationType

class PropertiesUtil {
	
	protected static Logger logger = Logger.getLogger("emdw.PropertyUtil")
	public static String configPath
	
	public static val INPUT_MODEL_PATH_PROP_KEY = "input.model.path"
	public static val MULTIPLICATION_COMPONENTINSIDE_PROP_KEY = "multiplication.componentinside"
	public static val MULTIPLICATION_COMPONENTS_PROP_KEY = "multiplication.components"
	public static val MODIFICATION_TYPE_PROP_KEY = "modification.type"
	public static val MODIFICATION_TIMES_PROP_KEY = "modification.times"
	
	public static val INCQUERY_LOGLEVEL_PROP_KEY = "org.eclipse.incquery.loglevel"
	public static val BENCHMARK_RESULT_LOGLEVEL = "emdw.mondosam.loglevel"
	public static val STATS_CSV_LOGLEVEL = "emdw.stats.loglevel"
	
	public def static getProperties() {
		val properties = new Properties()
		var InputStream inputStream = null
		try {
			//load a properties file
			inputStream = PropertiesUtil.classLoader.getResourceAsStream(configPath)
			if(inputStream != null){
				properties.load(inputStream);
			} else {
				logger.debug('''Could not find properties at «configPath»''')
			}
		} catch (IOException ex) {
			logger.debug('''Could not load properties at «configPath»''')
		} finally {
			if (inputStream != null) {
				try {
					inputStream.close()
				} catch (IOException e) {
					logger.fatal("Should never happen!",e)
				}
			}
		}
		properties
	}
	
	def static getPropertyValue(String propertyKey, String defaultValue) {
		if(properties != null){
			properties.getProperty(propertyKey, defaultValue)
		}
	}
	
	
	def static getIncQueryLogLevel(){
		getLogLevel(INCQUERY_LOGLEVEL_PROP_KEY, "WARN")
	}
	
	def static getBenchmarkLogLevel(){
		getLogLevel(BENCHMARK_RESULT_LOGLEVEL, "WARN")
	}
	
	def static getStatsLogLevel(){
		getLogLevel(STATS_CSV_LOGLEVEL, "WARN")
	}
	
	def static getInputModelPath() {
		return getPropertyValue(INPUT_MODEL_PATH_PROP_KEY, "")
	}
	
	def static getMultiplicationComponentinside() {
		val multiplication = getPropertyValue(MULTIPLICATION_COMPONENTINSIDE_PROP_KEY, "1")
		return Integer.valueOf(multiplication)
	}
	def static getMultiplicationComponents() {
		val multiplication = getPropertyValue(MULTIPLICATION_COMPONENTS_PROP_KEY, "1")
		return Integer.valueOf(multiplication)
	}
	def static getModificationType() {
		val modificationType = getPropertyValue(MODIFICATION_TYPE_PROP_KEY, "NONE")
		return ModificationType.valueOf(modificationType)
	}
	
	def static getModificationTimes() {
		val modificationTimes = getPropertyValue(MODIFICATION_TIMES_PROP_KEY, "0")
		return Integer.valueOf(modificationTimes)
	}
	
	def static getLogLevel(String key, String defaultLevel) {
		val level = getPropertyValue(key, defaultLevel)
		Level.toLevel(level, Level.WARN)
	}
}