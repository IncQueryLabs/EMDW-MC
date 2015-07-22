package com.incquerylabs.emdw.cpp.ui.util

import com.incquerylabs.emdw.cpp.transformation.monitor.XtumlModelChangeMonitor
import com.incquerylabs.emdw.umlintegration.papyrus.IncQueryEngineService
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