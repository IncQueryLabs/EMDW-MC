package com.incquerylabs.emdw.umlintegration

import com.incquerylabs.emdw.umlintegration.rules.AbstractMapping
import java.util.Set
import org.eclipse.emf.ecore.resource.Resource
import org.eclipse.incquery.runtime.api.IncQueryEngine

interface UmlIntegrationExtension {
	def void initialize(Resource resource);
	def Set<AbstractMapping<?>> getRules(IncQueryEngine engine);
}
