package com.incquerylabs.uml.ralf.api.impl;

import java.io.IOException;
import java.io.InputStream;
import java.util.Map;

import org.eclipse.emf.common.util.URI;
import org.eclipse.emf.common.util.WrappedException;
import org.eclipse.emf.ecore.resource.Resource;
import org.eclipse.emf.ecore.resource.ResourceSet;
import org.eclipse.xtext.resource.FileExtensionProvider;
import org.eclipse.xtext.resource.IResourceFactory;
import org.eclipse.xtext.resource.XtextResourceSet;
import org.eclipse.xtext.util.LazyStringInputStream;

import com.google.common.collect.Maps;
import com.google.inject.Inject;
import com.google.inject.Provider;
import com.incquerylabs.uml.ralf.api.ISnippetManager;
import com.incquerylabs.uml.ralf.reducedAlfLanguage.Statements;

public class SnippetManagerImpl implements ISnippetManager {

    @Inject
    private Provider<XtextResourceSet> resourceSetProvider;

    @Inject
    private IResourceFactory resourceFactory;
    
    @Inject
    private FileExtensionProvider extensionProvider;
    
    private String fileExtension;
    
    private Map<String, String> snippetMap;
    
    
    public SnippetManagerImpl() {
        snippetMap = Maps.newHashMap();
    }

    @Override
    public Map<String, String> getSnippetMap() {
        return snippetMap;
    }

    @Override
    public String getSnippet(String behavior) {
        fileExtension = extensionProvider.getPrimaryFileExtension();
        try {
            return (String) parse(behavior);
        } catch (Exception e) {
            e.printStackTrace();
            return "";
        }
    }

    protected CharSequence parse(InputStream in, URI uriToUse, Map<?, ?> options, ResourceSet resourceSet) {
        Resource resource = resource(in, uriToUse, options, resourceSet);
        final Statements root = (Statements) (resource.getContents().isEmpty() ? null : resource.getContents().get(0));
        // Do snippet compiling here
        String snippet = " ";
        return snippet;
    }
    
    protected CharSequence parse(CharSequence text) throws Exception {
        return parse(text, createResourceSet());
    }
    
    protected CharSequence parse(CharSequence text, ResourceSet resourceSetToUse) throws Exception {
        return parse(getAsStream(text), computeUnusedUri(resourceSetToUse), null, resourceSetToUse);
    }

    protected CharSequence parse(CharSequence text, URI uriToUse, ResourceSet resourceSetToUse) throws Exception {
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
