package com.incquerylabs.uml.papyrus;

import java.util.Map;

import org.eclipse.incquery.runtime.api.AdvancedIncQueryEngine;
import org.eclipse.incquery.runtime.api.IncQueryEngine;
import org.eclipse.incquery.runtime.emf.EMFScope;
import org.eclipse.incquery.runtime.exception.IncQueryException;
import org.eclipse.papyrus.infra.core.resource.ModelSet;
import org.eclipse.papyrus.infra.core.services.IService;
import org.eclipse.papyrus.infra.core.services.ServiceException;
import org.eclipse.papyrus.infra.core.services.ServicesRegistry;

import com.google.common.base.Preconditions;
import com.google.common.collect.Maps;

public class IncQueryEngineService implements IService {

	private Map<ModelSet, IncQueryEngine> engines = Maps.newHashMap();
	
	
	@Override
	public void init(ServicesRegistry servicesRegistry) throws ServiceException {}

	@Override
	public void startService() throws ServiceException {}

	@Override
	public void disposeService() throws ServiceException {}

	public IncQueryEngine initializeEngine(ModelSet set) throws IncQueryException {
		Preconditions.checkArgument(!engines.containsKey(set), "IncQueryEngine already initialized for model " + set.getURIWithoutExtension().toString());
		EMFScope scope = new EMFScope(set);
		AdvancedIncQueryEngine engine = AdvancedIncQueryEngine.createUnmanagedEngine(scope);
		engines.put(set, engine);
		return engine;
	}
	
	public boolean hasEngine(ModelSet set) {
		return engines.containsKey(set);
	}
	
	public IncQueryEngine getEngine(ModelSet set) {
		return engines.get(set);
	}
	
	public IncQueryEngine getOrCreateEngine(ModelSet set) throws IncQueryException {
		if (hasEngine(set)) {
			return getEngine(set);
		} else {
			return initializeEngine(set);
		}
	}
	
	public void disposeEngine(ModelSet set) {
		engines.remove(set);
	}
}
