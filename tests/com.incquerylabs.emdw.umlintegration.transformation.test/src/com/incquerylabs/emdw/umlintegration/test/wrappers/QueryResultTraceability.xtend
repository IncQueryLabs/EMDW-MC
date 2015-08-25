package com.incquerylabs.emdw.umlintegration.test.wrappers

import com.incquerylabs.emdw.umlintegration.TransformationQrt
import com.incquerylabs.emdw.umlintegration.trace.RootMapping
import org.eclipse.emf.ecore.resource.Resource
import org.eclipse.emf.ecore.resource.ResourceSet
import org.eclipse.incquery.runtime.api.AdvancedIncQueryEngine
import org.eclipse.incquery.runtime.base.api.BaseIndexOptions
import org.eclipse.incquery.runtime.base.api.filters.IBaseIndexResourceFilter
import org.eclipse.incquery.runtime.emf.EMFScope

import static com.incquerylabs.emdw.umlintegration.test.wrappers.QueryResultTraceability.*

class QueryResultTraceability extends TransformationWrapper {

	TransformationQrt xform
	AdvancedIncQueryEngine engine

	override initializeTransformation(RootMapping umlToCommon) {
		engine = initializeEngine(umlToCommon.eResource.resourceSet)
		xform = new TransformationQrt
		xform.initialize(engine)
	}
	
	public static final String PATHMAP_SCHEME = "pathmap";
	private static final String UML_LIBRARIES_AUTHORITY = "UML_LIBRARIES";
	
	def AdvancedIncQueryEngine initializeEngine(ResourceSet set) {
		val options = new BaseIndexOptions().withResourceFilterConfiguration(new IBaseIndexResourceFilter() {
			override isResourceFiltered(Resource resource) {
				val uri = resource.getURI();
				return PATHMAP_SCHEME.equals(uri.scheme()) && !uri.authority().equals(UML_LIBRARIES_AUTHORITY);
			}

		});
		val scope = new EMFScope(set, options);
		val engine = AdvancedIncQueryEngine.createUnmanagedEngine(scope);
		return engine;
	}

	override executeTransformation() {
		xform.execute
		debug("Query Result Traceability transformation is incremental")
	}

	override cleanupTransformation() {
		if (xform != null) {
			xform.dispose
		}
		if (engine != null) {
			engine.dispose
		}
	}
}
