package com.incquerylabs.uml.ralf.api.impl;

import java.io.ByteArrayOutputStream;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.Iterator;

import org.eclipse.emf.common.util.Diagnostic;

import com.incquerylabs.uml.ralf.reducedAlfLanguage.Statements;

public class ParsingResults {
    protected Diagnostic diag;
    protected Statements model;
    
    public ParsingResults(Diagnostic diag, Statements model) {
        this.model = model;
        this.diag = diag;
    }
    
    public boolean hasWarning() {
        return Diagnostic.WARNING == diag.getSeverity();
    }
    
    public boolean hasError() {
        return Diagnostic.ERROR == diag.getSeverity();
    }
    
    public boolean validationOK() {
        return diag.getSeverity() == Diagnostic.OK;
    }

    public Iterable<Diagnostic> getAllDiagnostics() {
        return new DiagnosticTreeIterator(diag);
    }
    
    public Diagnostic getRootDiagnostic() {
        return this.diag;
    }

    protected void printResults(StringBuffer out, String prefix, Diagnostic d) {
        final String indent = "  ";
        out.append(prefix);
        out.append(d);
        if (d.getChildren().size() > 0 || d.getException() != null) {
            out.append(" {\n");
            String prefix2 = prefix + indent;
            if (d.getException() != null) {
                out.append(prefix2);
                ByteArrayOutputStream s = new ByteArrayOutputStream();
                PrintWriter pw = new PrintWriter(s);
                d.getException().printStackTrace(pw);
                pw.flush();
                out.append(s.toString());
                out.append("\n");
            }
            for (Diagnostic c : d.getChildren())
                printResults(out, prefix2, c);
            out.append(prefix);
            out.append("}\n");
        } else
            out.append("\n");
    }

    @Override
    public String toString() {
        StringBuffer b = new StringBuffer();
        for (Diagnostic d : diag.getChildren())
            printResults(b, "", d);
        return b.toString();
    }
        
    public Statements getModel() {
        return model;
    }

    protected class DiagnosticTreeIterator implements Iterable<Diagnostic>, Iterator<Diagnostic> {

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
}

