package com.incquerylabs.emdw.umlintegration.papyrus;

import java.util.Set;

import org.apache.log4j.Logger;
import org.eclipse.emf.common.notify.Notifier;
import org.eclipse.emf.ecore.EObject;
import org.eclipse.emf.ecore.resource.Resource;
import org.eclipse.emf.ecore.resource.ResourceSet;
import org.eclipse.incquery.runtime.api.IncQueryEngine;
import org.eclipse.incquery.runtime.api.scope.IEngineContext;
import org.eclipse.incquery.runtime.api.scope.IIndexingErrorListener;
import org.eclipse.incquery.runtime.api.scope.IncQueryScope;
import org.eclipse.incquery.runtime.base.api.BaseIndexOptions;
import org.eclipse.incquery.runtime.emf.EMFScope;
import org.eclipse.incquery.runtime.exception.IncQueryException;

/**
 * A IncQuery scope consisting of EMF objects contained in an EMF resource set, a single resource, or a containment subtree below a given EObject.
 * 
 * <p> The scope is characterized by a root, and some options (see {@link BaseIndexOptions}) such as dynamic EMF mode, subtree filtering, etc.
 * <p>
 * The scope of pattern matching will be the given EMF model root and below (see FAQ for more precise definition).
 * @author Bergmann Gabor
 *
 */
public class MultiEMFScope extends IncQueryScope {
	
	Set<? extends Notifier> scopeRoots;
	BaseIndexOptions options;

	/**
	 * Creates an EMF scope at the given root, with default options (recommended for most users).
	 * @param scopeRoot the root of the EMF scope
	 * @throws IncQueryException if scopeRoot is not an EMF ResourceSet, Resource or EObject
	 */
	public MultiEMFScope(Set<? extends Notifier> scopeRoots) throws IncQueryException {
		this(scopeRoots, new BaseIndexOptions() );
	}
	/**
	 * Creates an EMF scope at the given root, with customizable options.
	 * <p> Most users should consider {@link #EMFScope(Notifier)} instead.
	 * @param scopeRoot the root of the EMF scope
	 * @param options 
	 * @throws IncQueryException if scopeRoot is not an EMF ResourceSet, Resource or EObject
	 */
	public MultiEMFScope(Set<? extends Notifier> scopeRoots, BaseIndexOptions options) throws IncQueryException {
		super();
		this.scopeRoots = scopeRoots;
		this.options = options.copy();
		for (Notifier scopeRoot : scopeRoots) {
			if (!(scopeRoot instanceof EObject || scopeRoot instanceof Resource || scopeRoot instanceof ResourceSet))
				throw new IncQueryException(IncQueryException.INVALID_EMFROOT
						+ (scopeRoot == null ? "(null)" : scopeRoot.getClass().getName()),
						IncQueryException.INVALID_EMFROOT_SHORT);
		}
	}

	/**
	 * @return the root element (resource set, resource or eObject) containing the model
	 */
	public Set<? extends Notifier> getScopeRoots() {
		return scopeRoots;
	}
	
	/**
	 * @return the options
	 */
	public BaseIndexOptions getOptions() {
		return options.copy();
	}
	
	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + ((options == null) ? 0 : options.hashCode());
		result = prime * result
				+ ((scopeRoots == null) ? 0 : scopeRoots.hashCode());
		return result;
	}
	@Override
	public boolean equals(Object obj) {
		if (this == obj)
			return true;
		if (obj == null)
			return false;
		if (!(obj instanceof MultiEMFScope))
			return false;
		MultiEMFScope other = (MultiEMFScope) obj;
		if (options == null) {
			if (other.options != null)
				return false;
		} else if (!options.equals(other.options))
			return false;
		if (scopeRoots == null) {
			if (other.scopeRoots != null)
				return false;
		} else if (!scopeRoots.equals(other.scopeRoots))
			return false;
		return true;
	}	
	

	@Override
	public String toString() {
		return String.format("EMFScope(%s):%s", options, scopeRoots);
	}

	@Override
	protected IEngineContext createEngineContext(IncQueryEngine engine, IIndexingErrorListener errorListener, Logger logger) {
		return new MultiEMFEngineContext(this, engine, errorListener, logger);
	}

	@Override
	public boolean isCompatibleWithQueryScope(Class<? extends IncQueryScope> queryScopeClass) {
		return queryScopeClass.isAssignableFrom(this.getClass()) || queryScopeClass == EMFScope.class;
	}

}
