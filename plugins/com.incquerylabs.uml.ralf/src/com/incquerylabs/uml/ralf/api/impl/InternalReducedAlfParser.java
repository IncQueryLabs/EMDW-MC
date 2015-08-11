package com.incquerylabs.uml.ralf.api.impl;

import java.io.IOException;
import java.io.InputStream;
import java.util.ArrayList;
import java.util.Iterator;
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
import org.eclipse.xtext.diagnostics.Severity;
import org.eclipse.xtext.resource.FileExtensionProvider;
import org.eclipse.xtext.resource.IResourceFactory;
import org.eclipse.xtext.resource.XtextResourceSet;
import org.eclipse.xtext.util.LazyStringInputStream;
import org.eclipse.xtext.validation.IDiagnosticConverter;

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
    
    @Inject
    private IDiagnosticConverter converter;

    private String fileExtension; 

    private static class DiagnosticTreeIterator implements Iterable<Diagnostic>, Iterator<Diagnostic> {

        private ArrayList<Iterator<Diagnostic>> iteratorStack = new ArrayList<Iterator<Diagnostic>>();

        public DiagnosticTreeIterator(Diagnostic root) {
            super();
            iteratorStack.add(root.getChildren().iterator());
        }

        @Override
        public boolean hasNext() {
            while (iteratorStack.size() > 0 && !iteratorStack.get(iteratorStack.size() - 1).hasNext())
                iteratorStack.remove(iteratorStack.size() - 1);
            return iteratorStack.size() != 0;
        }

        @Override
        public Iterator<Diagnostic> iterator() {
            return this;
        }

        @Override
        public Diagnostic next() {
            Diagnostic d = iteratorStack.get(iteratorStack.size() - 1).next();
            if (d.getChildren().size() > 0)
                iteratorStack.add(d.getChildren().iterator());
            return d;
        }

        @Override
        public void remove() {
            throw new RuntimeException("operation not supported");
        }
    }
    
    public ParsingResults parse(String text) {
        fileExtension = extensionProvider.getPrimaryFileExtension();
        return parse(text, createResourceSet());
    }

    protected ParsingResults parse(InputStream in, URI uriToUse, Map<?, ?> options, ResourceSet resourceSet) {
        Resource resource = resource(in, uriToUse, options, resourceSet);
        EList<EObject> contents = resource.getContents();
        DiagnosticCollector collector = new DiagnosticCollector();
        
        for (org.eclipse.emf.ecore.resource.Resource.Diagnostic diagnostic : resource.getErrors()) {
			converter.convertResourceDiagnostic(diagnostic, Severity.ERROR, collector);
		}
        if (contents.isEmpty()) {
            return new ParsingResults(collector, ReducedAlfLanguageFactory.eINSTANCE.createStatements());
        } else {
            Statements st = (Statements) contents.get(0);
            BasicDiagnostic diagnosticChain = new BasicDiagnostic();
            diagnostician.validate(st, diagnosticChain);
            for (Diagnostic diag : new DiagnosticTreeIterator(diagnosticChain)) {
            	converter.convertValidatorDiagnostic(diag, collector);
            }
            return new ParsingResults(collector, st);
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