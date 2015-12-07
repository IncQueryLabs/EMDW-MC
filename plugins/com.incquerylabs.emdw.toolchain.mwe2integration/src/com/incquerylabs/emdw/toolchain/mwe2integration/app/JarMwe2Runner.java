package com.incquerylabs.emdw.toolchain.mwe2integration.app;

import java.util.Map;

import org.eclipse.emf.common.util.URI;
import org.eclipse.emf.ecore.EObject;
import org.eclipse.emf.ecore.resource.Resource;
import org.eclipse.emf.ecore.resource.ResourceSet;
import org.eclipse.emf.mwe2.language.mwe2.Module;
import org.eclipse.emf.mwe2.launch.runtime.Mwe2Runner;
import org.eclipse.emf.mwe2.runtime.workflow.IWorkflowContext;

import com.google.inject.Guice;
import com.google.inject.Injector;

public class JarMwe2Runner extends Mwe2Runner {
    
    @Override
    public void run(URI createURI, Map<String, String> params, IWorkflowContext ctx) {
        ResourceSet resourceSet = getConfiguredResourceSet();
        
        Injector injector = Guice.createInjector(new org.eclipse.emf.mwe2.language.Mwe2RuntimeModule());
        
        org.eclipse.xtext.resource.IResourceFactory resourceFactory = injector.getInstance(org.eclipse.xtext.resource.IResourceFactory.class);
        
        resourceSet.getResourceFactoryRegistry().getExtensionToFactoryMap().put("mwe2", resourceFactory);
        
        Resource resource = resourceSet.getResource(createURI, true);
        if (resource != null) {
            if (!resource.getContents().isEmpty()) {
                EObject eObject = resource.getContents().get(0);
                if (eObject instanceof Module) {
                    run(((Module) eObject), params, ctx);
                    return;
                }
            }
        }
        throw new IllegalArgumentException("Couldn't load module from URI " + createURI);
    }

}
