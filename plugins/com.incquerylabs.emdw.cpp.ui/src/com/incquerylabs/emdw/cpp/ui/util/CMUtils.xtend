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
package com.incquerylabs.emdw.cpp.ui.util

import com.incquerylabs.emdw.cpp.transformation.monitor.XtumlModelChangeMonitor
import com.incquerylabs.uml.papyrus.IncQueryEngineService
import java.util.HashMap
import org.eclipse.incquery.runtime.api.AdvancedIncQueryEngine
import org.eclipse.papyrus.infra.core.resource.ModelSet
import org.eclipse.papyrus.infra.emf.utils.ServiceUtilsForResourceSet

class CMUtils {
	
	private static HashMap<ModelSet, XtumlModelChangeMonitor> changeMonitors = <ModelSet, XtumlModelChangeMonitor>newHashMap()
	
	static def getChangeMonitor(ModelSet set) {
		var cm = changeMonitors.get(set)
		if(cm == null) {
			val engine = getIncQueryEngine(set)
			cm = new XtumlModelChangeMonitor(engine as AdvancedIncQueryEngine)
			changeMonitors.put(set, cm)
		}
		cm
	}
	
	static def getIncQueryEngine(ModelSet set) {
		return ServiceUtilsForResourceSet.instance.getServiceRegistry(set)?.getService(IncQueryEngineService)?.getEngine(set);
	}
}