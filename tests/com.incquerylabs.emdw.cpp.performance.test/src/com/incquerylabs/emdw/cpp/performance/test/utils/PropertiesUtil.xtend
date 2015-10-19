package com.incquerylabs.emdw.cpp.performance.test.utils

import java.io.IOException
import java.io.InputStream
import java.util.Properties
import org.apache.log4j.Level
import org.apache.log4j.Logger
import com.incquerylabs.emdw.cpp.performance.test.config.ModificationType
import java.io.FileInputStream

class PropertiesUtil {
	
	protected static Logger logger = Logger.getLogger("emdw.PropertyUtil")
	private final String configPath
	public final Properties properties
	
	public static final val INPUT_MODEL_PATH_PROP_KEY = "input.model.path"
	public static final val RANDOM_SEED_PROP_KEY = "random.seed"
	public static final val MULTIPLICATION_COMPONENTINSIDE_PROP_KEY = "multiplication.componentinside"
	public static final val MULTIPLICATION_COMPONENTS_PROP_KEY = "multiplication.components"
	public static final val MODIFICATION_TIMES_PROP_KEY = "modification.times"
	public static final val MODIFICATION_SCOPE_PROP_KEY = "modification.scope"
	public static final val MODIFICATION_LL_B_ATIONCODE_PROP_KEY = "modification.lowlevel.behavioral.actioncode"
	public static final val MODIFICATION_LL_S_ATTR_ADD_PROP_KEY = "modification.lowlevel.structural.attribute.add"
	public static final val MODIFICATION_LL_S_ATTR_REMOVE_PROP_KEY = "modification.lowlevel.structural.attribute.remove"
	public static final val MODIFICATION_LL_S_TRANS_ADD_PROP_KEY = "modification.lowlevel.structural.transition.add"
	public static final val MODIFICATION_LL_S_TRANS_REMOVE_PROP_KEY = "modification.lowlevel.structural.transition.remove"
	public static final val MODIFICATION_HL_COMP_ADD_PROP_KEY = "modification.highlevel.component.add"
	public static final val MODIFICATION_HL_COMP_REMOVE_PROP_KEY = "modification.highlevel.component.remove"
	public static final val MODIFICATION_HL_PACK_ADD_PROP_KEY = "modification.highlevel.package.add"
	public static final val MODIFICATION_HL_PACK_MOVE_PROP_KEY = "modification.highlevel.package.move"
	public static final val MODIFICATION_HL_PACK_REMOVE_PROP_KEY = "modification.highlevel.package.remove"
	public static final val MODIFICATION_HL_PACK_RENAME_PROP_KEY = "modification.highlevel.package.rename"
	public static final val COMPILEBODY_PROP_KEY = "compilebody"
	
	public static final val INCQUERY_LOGLEVEL_PROP_KEY = "org.eclipse.incquery.loglevel"
	public static final val BENCHMARK_RESULT_LOGLEVEL = "emdw.mondosam.loglevel"
	public static final val STATS_CSV_LOGLEVEL = "emdw.stats.loglevel"
	
	public static final val DEFAULT_MODIFICATION_TIMES = "0"
	
	new(String configPath) {
		this.configPath = configPath
		properties = loadProperties
	}
	
	public def loadProperties() {
		val properties = new Properties()
		var InputStream inputStream = null
		try {
			//load a properties file
			inputStream = new FileInputStream(configPath)
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
	
	def getPropertyValue(String propertyKey, String defaultValue) {
		if(properties != null){
			properties.getProperty(propertyKey, defaultValue)
		}
	}
	
	
	def getIncQueryLogLevel(){
		getLogLevel(INCQUERY_LOGLEVEL_PROP_KEY, "WARN")
	}
	
	def getBenchmarkLogLevel(){
		getLogLevel(BENCHMARK_RESULT_LOGLEVEL, "WARN")
	}
	
	def getStatsLogLevel(){
		getLogLevel(STATS_CSV_LOGLEVEL, "WARN")
	}
	
	def getInputModelPath() {
		return getPropertyValue(INPUT_MODEL_PATH_PROP_KEY, "")
	}
	
	def getRandomSeed() {
		val seed = getPropertyValue(RANDOM_SEED_PROP_KEY, "0")
		return Long.valueOf(seed)
	}
	
	def getMultiplicationComponentinside() {
		val multiplication = getPropertyValue(MULTIPLICATION_COMPONENTINSIDE_PROP_KEY, "0")
		return Integer.valueOf(multiplication)
	}
	
	def getMultiplicationComponents() {
		val multiplication = getPropertyValue(MULTIPLICATION_COMPONENTS_PROP_KEY, "0")
		return Integer.valueOf(multiplication)
	}
	
	def getModificationTimeOfActionCode() {
		val modificationTimes = getPropertyValue(MODIFICATION_LL_B_ATIONCODE_PROP_KEY, DEFAULT_MODIFICATION_TIMES)
		return Integer.valueOf(modificationTimes)
	}
	
	def getModificationTimes() {
		val modificationTimes = getPropertyValue(MODIFICATION_TIMES_PROP_KEY, "0")
		return Integer.valueOf(modificationTimes)
	}
	def getModificationTimeOfAttributeAddition() {
		val modificationTimes = getPropertyValue(MODIFICATION_LL_S_ATTR_ADD_PROP_KEY, DEFAULT_MODIFICATION_TIMES)
		return Integer.valueOf(modificationTimes)
	}
	
	def getModificationTimeOfAttributeRemoval() {
		val modificationTimes = getPropertyValue(MODIFICATION_LL_S_ATTR_REMOVE_PROP_KEY, DEFAULT_MODIFICATION_TIMES)
		return Integer.valueOf(modificationTimes)
	}
	
	def getModificationTimeOfTransitionAddition() {
		val modificationTimes = getPropertyValue(MODIFICATION_LL_S_TRANS_ADD_PROP_KEY, DEFAULT_MODIFICATION_TIMES)
		return Integer.valueOf(modificationTimes)
	}
	
	def getModificationTimeOfTransitionRemoval() {
		val modificationTimes = getPropertyValue(MODIFICATION_LL_S_TRANS_REMOVE_PROP_KEY, DEFAULT_MODIFICATION_TIMES)
		return Integer.valueOf(modificationTimes)
	}
	
	def getModificationTimeOfComponentAddition() {
		val modificationTimes = getPropertyValue(MODIFICATION_HL_COMP_ADD_PROP_KEY, DEFAULT_MODIFICATION_TIMES)
		return Integer.valueOf(modificationTimes)
	}
	
	def getModificationTimeOfComponentRemoval() {
		val modificationTimes = getPropertyValue(MODIFICATION_HL_COMP_REMOVE_PROP_KEY, DEFAULT_MODIFICATION_TIMES)
		return Integer.valueOf(modificationTimes)
	}
	
	def getModificationTimeOfPackageAddition() {
		val modificationTimes = getPropertyValue(MODIFICATION_HL_PACK_ADD_PROP_KEY, DEFAULT_MODIFICATION_TIMES)
		return Integer.valueOf(modificationTimes)
	}
	
	def getModificationTimeOfPackageMovement() {
		val modificationTimes = getPropertyValue(MODIFICATION_HL_PACK_MOVE_PROP_KEY, DEFAULT_MODIFICATION_TIMES)
		return Integer.valueOf(modificationTimes)
	}
	
	def getModificationTimeOfPackageRemoval() {
		val modificationTimes = getPropertyValue(MODIFICATION_HL_PACK_REMOVE_PROP_KEY, DEFAULT_MODIFICATION_TIMES)
		return Integer.valueOf(modificationTimes)
	}
	
	def getModificationTimeOfPackageRenaming() {
		val modificationTimes = getPropertyValue(MODIFICATION_HL_PACK_RENAME_PROP_KEY, DEFAULT_MODIFICATION_TIMES)
		return Integer.valueOf(modificationTimes)
	}
	
	def getModificationsMap() {
		val map = #{
			ModificationType.SMALL_BEHAVIOR__ACTION_CODE -> modificationTimeOfActionCode,
			ModificationType.SMALL_STRUCTURE__ATTRIBUTE__ADD -> modificationTimeOfAttributeAddition,
			ModificationType.SMALL_STRUCTURE__ATTRIBUTE__REMOVE -> modificationTimeOfAttributeRemoval,
			ModificationType.SMALL_STRUCTURE__TRANSITION__ADD -> modificationTimeOfTransitionAddition,
			ModificationType.SMALL_STRUCTURE__TRANSITION__REMOVE -> modificationTimeOfTransitionRemoval,
			ModificationType.HIGH_LEVEL__COMPONENT__ADD -> modificationTimeOfComponentAddition,
			ModificationType.HIGH_LEVEL__COMPONENT__REMOVE -> modificationTimeOfComponentRemoval,
			ModificationType.HIGH_LEVEL__PACKAGE__ADD -> modificationTimeOfPackageAddition,
			ModificationType.HIGH_LEVEL__PACKAGE__MOVE -> modificationTimeOfPackageMovement,
			ModificationType.HIGH_LEVEL__PACKAGE__REMOVE -> modificationTimeOfPackageRemoval,
			ModificationType.HIGH_LEVEL__PACKAGE__RENAME -> modificationTimeOfPackageRenaming
		}
		return map
	}
	
	def getModificationScope() {
		val modificationScope = getPropertyValue(MODIFICATION_SCOPE_PROP_KEY, "1")
		return Integer.valueOf(modificationScope)
	}
	
	def shouldCompileBody() {
		val compileBodyEnabled = getPropertyValue(COMPILEBODY_PROP_KEY, "true")
		return Boolean.valueOf(compileBodyEnabled)
	}
	
	def getLogLevel(String key, String defaultLevel) {
		val level = getPropertyValue(key, defaultLevel)
		Level.toLevel(level, Level.WARN)
	}
}