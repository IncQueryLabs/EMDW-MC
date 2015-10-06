package com.incquerylabs.uml.ralf.snippetcompiler

import org.apache.log4j.Logger
import org.eclipse.emf.ecore.EObject

class LoggerUtil {
	def logVisitingStarted(Logger logger, EObject object){
		logger.trace('''Started visiting: «object.class.simpleName»''')
	}
	
	def logVisitingFinished(Logger logger, EObject object, String snippet){
		logger.trace('''Finished visiting: «object.class.simpleName»: «snippet»''')
	}
	
	def logVisitingFinished(Logger logger, EObject object){
		logger.trace('''Finished visiting: «object.class.simpleName»''')
	}
	
	def logUseChildDescrFactory(Logger logger){
		logger.trace('''Use child Descriptor Factory''')
	}
	
	def logUseParentDescrFactory(Logger logger){
		logger.trace('''Use parent Descriptor Factory''')
	}
}