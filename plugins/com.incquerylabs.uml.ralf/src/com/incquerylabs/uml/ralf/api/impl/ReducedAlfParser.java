package com.incquerylabs.uml.ralf.api.impl;

import org.eclipse.emf.common.util.EList;
import org.eclipse.emf.ecore.EObject;
import org.eclipse.incquery.runtime.api.IncQueryEngine;
import org.eclipse.incquery.runtime.emf.EMFScope;
import org.eclipse.incquery.runtime.exception.IncQueryException;
import org.eclipse.uml2.uml.OpaqueBehavior;

import com.google.inject.Guice;
import com.google.inject.Injector;
import com.google.inject.Module;
import com.incquerylabs.uml.ralf.ReducedAlfLanguageRuntimeModule;
import com.incquerylabs.uml.ralf.api.IReducedAlfParser;
import com.incquerylabs.uml.ralf.scoping.IUMLContextProvider;
import com.incquerylabs.uml.ralf.scoping.SimpleUMLContextProvider;
import com.incquerylabs.uml.ralf.scoping.UMLContextProvider;

public class ReducedAlfParser implements IReducedAlfParser {

    private static final String LANGUAGE_NAME = "rALF";
	
	private Injector createInjector(OpaqueBehavior behavior) {
		return createInjector(new UMLContextProvider() {
			
			@Override
			protected EObject getContextObject() {
				return behavior;
			}
			
			@Override
			protected IncQueryEngine doGetEngine() {
				try {
					return IncQueryEngine.on(new EMFScope(behavior.eResource().getResourceSet()));
				} catch (IncQueryException e) {
					throw new RuntimeException(e);
				}
			}
		});
	}
	
	private Injector createInjector(final IUMLContextProvider umlContext) {
		return createInjector(umlContext, new ReducedAlfLanguageRuntimeModule());
	}
	
	private Injector createInjector(final IUMLContextProvider umlContext, final Module module) {
        Module customizations = binder -> {
		    binder.bind(IUMLContextProvider.class).toInstance(umlContext);
		    binder.bind(IReducedAlfParser.class).toInstance(this);
		    //binder.bind(IReducedAlfGenerator.class).to(ReducedAlfGenerator.class);
		};
        return Guice.createInjector(module, customizations);
    }
	
	@Override
	public ParsingResults parse(String behavior) {
		return parse(behavior, new SimpleUMLContextProvider());
	}
	
	@Override
	public ParsingResults parse(String behavior, IUMLContextProvider contextProvider) {
		Injector injector = createInjector(contextProvider);
		InternalReducedAlfParser parser = injector.getInstance(InternalReducedAlfParser.class);
        return parser.parse(behavior);
	}

	@Override
	public ParsingResults parse(OpaqueBehavior behavior) {
		Injector injector = createInjector(behavior);
		int indexOfRALFBody = -1;
        ParsingResults result = null;
        for (int i = 0; i < behavior.getLanguages().size() && indexOfRALFBody == -1; i++) {
            if (behavior.getLanguages().get(i).equals(LANGUAGE_NAME)) {
                indexOfRALFBody = i;
            }
        }
        EList<String> bodies = behavior.getBodies();
        if (indexOfRALFBody >= 0) {
        	InternalReducedAlfParser parser = injector.getInstance(InternalReducedAlfParser.class);
            result = parser.parse(bodies.get(indexOfRALFBody));
        }
        
        return result;
	}
}
