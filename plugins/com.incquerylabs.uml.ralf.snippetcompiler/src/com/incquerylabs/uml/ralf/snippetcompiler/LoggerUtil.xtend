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