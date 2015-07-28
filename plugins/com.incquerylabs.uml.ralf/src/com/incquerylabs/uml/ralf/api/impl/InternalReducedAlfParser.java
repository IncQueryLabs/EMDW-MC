package com.incquerylabs.uml.ralf.api.impl;

import java.io.IOException;
import java.io.InputStream;
import java.util.Map;

import org.eclipse.emf.common.util.BasicDiagnostic;
import org.eclipse.emf.common.util.Diagnostic;
import org.eclipse.emf.common.util.EList;
import org.eclipse.emf.common.util.URI;
import org.eclipse.emf.common.util.WrappedException;
import org.eclipse.emf.ecore.EObject;
import org.eclipse.emf.ecore.resource.Resource;
import org.eclipse.emf.ecore.resource.ResourceSet;
import org.eclipse.emf.ecore.util.Diagnostician;
import org.eclipse.xtext.resource.FileExtensionProvider;
import org.eclipse.xtext.resource.IResourceFactory;
import org.eclipse.xtext.resource.XtextResourceSet;
import org.eclipse.xtext.util.LazyStringInputStream;

import com.google.inject.Inject;
import com.google.inject.Provider;
import com.incquerylabs.uml.ralf.reducedAlfLanguage.ReducedAlfLanguageFactory;
import com.incquerylabs.uml.ralf.reducedAlfLanguage.Statements;

class InternalReducedAlfParser {
    @Inject
    private Provider<XtextResourceSet> resourceSetProvider;

    @Inject
    private IResourceFactory resourceFactory;
    
    @Inject
    private FileExtensionProvider extensionProvider;
    
    @Inject
    private Diagnostician diagnostician;

    private String fileExtension; 

    
    public ParsingResults parse(String text) {
        fileExtension = extensionProvider.getPrimaryFileExtension();
        return parse(text, createResourceSet());
    }

    protected ParsingResults parse(InputStream in, URI uriToUse, Map<?, ?> options, ResourceSet resourceSet) {
        Resource resource = resource(in, uriToUse, options, resourceSet);
        EList<EObject> contents = resource.getContents();
        if (contents.isEmpty()) {
            return new ParsingResults(new BasicDiagnostic(Diagnostic.ERROR, getClass().getName(), 1 , "Error while parsing input", new Object[0]) , ReducedAlfLanguageFactory.eINSTANCE.createStatements());
        } else {
            Statements st = (Statements) contents.get(0);
            BasicDiagnostic diagnosticChain = new BasicDiagnostic();
            diagnostician.validate(st, diagnosticChain);
            return new ParsingResults(diagnosticChain, st);
        }
    }


    
    protected ParsingResults parse(String text, ResourceSet resourceSetToUse){
        return parse(getAsStream(text), computeUnusedUri(resourceSetToUse), null, resourceSetToUse);
    }

    protected ParsingResults parse(String text, URI uriToUse, ResourceSet resourceSetToUse){
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