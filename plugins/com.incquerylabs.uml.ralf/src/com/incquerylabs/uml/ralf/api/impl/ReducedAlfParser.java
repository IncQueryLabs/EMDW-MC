package com.incquerylabs.uml.ralf.api.impl;

import java.io.IOException;
import java.io.InputStream;
import java.util.Map;

import org.eclipse.emf.common.util.EList;
import org.eclipse.emf.common.util.URI;
import org.eclipse.emf.common.util.WrappedException;
import org.eclipse.emf.ecore.resource.Resource;
import org.eclipse.emf.ecore.resource.ResourceSet;
import org.eclipse.uml2.uml.OpaqueBehavior;
import org.eclipse.xtext.resource.FileExtensionProvider;
import org.eclipse.xtext.resource.IResourceFactory;
import org.eclipse.xtext.resource.XtextResourceSet;
import org.eclipse.xtext.util.LazyStringInputStream;

import com.google.inject.Inject;
import com.google.inject.Provider;
import com.incquerylabs.uml.ralf.api.IReducedAlfParser;
import com.incquerylabs.uml.ralf.reducedAlfLanguage.Statements;

public class ReducedAlfParser implements IReducedAlfParser {

    @Inject
    private Provider<XtextResourceSet> resourceSetProvider;

    @Inject
    private IResourceFactory resourceFactory;
    
    @Inject
    private FileExtensionProvider extensionProvider;

    private String fileExtension; 
    private String LANGUAGE_NAME;
    
    @Inject
    public ReducedAlfParser(String langName) {
        LANGUAGE_NAME = langName;
    }

    @Override
    public Statements parse(OpaqueBehavior behavior) {
        int indexOfRALFBody = -1;
        Statements result = null;
        for (int i = 0; i < behavior.getLanguages().size() && indexOfRALFBody == -1; i++) {
            if (behavior.getLanguages().get(i).equals(LANGUAGE_NAME)) {
                indexOfRALFBody = i;
            }
        }
        EList<String> bodies = behavior.getBodies();
        if (indexOfRALFBody >= 0) {
            result = parse(bodies.get(indexOfRALFBody));
        }
        return result;
    }
    
    @Override
    public Statements parse(String text) {
        fileExtension = extensionProvider.getPrimaryFileExtension();
        return parse(text, createResourceSet());
    }

    protected Statements parse(InputStream in, URI uriToUse, Map<?, ?> options, ResourceSet resourceSet) {
        Resource resource = resource(in, uriToUse, options, resourceSet);
        return (Statements) (resource.getContents().isEmpty() ? null : resource.getContents().get(0));
    }
   

    
    protected Statements parse(String text, ResourceSet resourceSetToUse){
        return parse(getAsStream(text), computeUnusedUri(resourceSetToUse), null, resourceSetToUse);
    }

    protected Statements parse(String text, URI uriToUse, ResourceSet resourceSetToUse){
        return parse(getAsStream(text), uriToUse, null, resourceSetToUse);
    }
    
    protected URI computeUnusedUri(ResourceSet resourceSet) {
        String name = "__synthetic";
        for (int i = 0; i < Integer.MAX_VALUE; i++) {
            URI syntheticUri = URI.createURI(name + i + "." + fileExtension);
            if (resourceSet.getResource(syntheticUri, false) == null)
                return syntheticUri;
        }
        throw new IllegalStateException();
    }

    protected InputStream getAsStream(CharSequence text) {
        return new LazyStringInputStream(text == null ? "" : text.toString());
    }
    
    protected XtextResourceSet createResourceSet() {
        return resourceSetProvider.get();
    }
    
    protected Resource resource(InputStream in, URI uriToUse, Map<?, ?> options, ResourceSet resourceSet) {
        Resource resource = resourceFactory.createResource(uriToUse);
        resourceSet.getResources().add(resource);
        try {
            resource.load(in, options);
            return resource;
        } catch (IOException e) {
            throw new WrappedException(e);
        }
    }
}
