package com.incquerylabs.uml.ralf.api.impl;

import org.eclipse.xtext.validation.Issue;

import com.google.common.collect.Iterables;
import com.incquerylabs.uml.ralf.reducedAlfLanguage.Statements;

public class ParsingResults {
    protected DiagnosticCollector diag;
    protected Statements model;
    
    public ParsingResults(DiagnosticCollector diag, Statements model) {
        this.model = model;
        this.diag = diag;
    }
    
    public boolean hasWarning() {
        return diag.hasWarnings();
    }
    
    public boolean hasError() {
        return diag.hasErrors();
    }
    
    public boolean validationOK() {
        return !diag.hasErrors() && !diag.hasWarnings();
    }

    public Iterable<Issue> getAllDiagnostics() {
        return Iterables.concat(diag.getErrors(), diag.getWarnings());
    }

    @Override
    public String toString() {
        StringBuffer b = new StringBuffer();
        for (Issue d : getAllDiagnostics()) {
            b.append(d.toString());
            b.append("\n");
        }
        return b.toString();
    }
    
    /**
     * In case of parsing errors, the returned contents is undefined.
     * @return
     */
    public Statements getModel() {
        return model;
    }


}

