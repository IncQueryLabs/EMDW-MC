package com.incquerylabs.emdw.cpp.transformation

import com.google.common.collect.BiMap
import com.google.common.collect.HashBiMap
import org.eclipse.incquery.runtime.api.AdvancedIncQueryEngine

class XtumlCPPTransformationQrtManager {
	val BiMap<AdvancedIncQueryEngine, XtumlCPPTransformationQrt> transformations = HashBiMap.create()
	
	def getOrCreateQrtTransformation(AdvancedIncQueryEngine engine) {
		var XtumlCPPTransformationQrt transformation
		if (transformations.containsKey(engine)){
			transformation = transformations.get(engine)
		} else {
			transformation = new XtumlCPPTransformationQrt()
			transformation.initialize(engine);
			transformations.put(engine, transformation)
			val listener = new XtumlCPPTransformationQrtLifecycleListener(this, transformation)
			engine.addLifecycleListener(listener)
			transformation.execute
		}
		
		return transformation
	}
	
	def disposeQrtTransformation(XtumlCPPTransformationQrt transformation){
		transformations.inverse.remove(transformation)
		transformation.dispose
	}
}
