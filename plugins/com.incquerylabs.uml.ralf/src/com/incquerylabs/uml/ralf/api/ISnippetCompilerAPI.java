package com.incquerylabs.uml.ralf.api;

import java.util.Map;

import org.eclipse.emf.ecore.EObject;
import org.eclipse.uml2.uml.OpaqueBehavior;

public interface ISnippetCompilerAPI {

    public Map<String,String> getSnippetMap();
    public String createSnippet(String behavior, IParserAPI parser);
    public String createSnippet(OpaqueBehavior behavior, IParserAPI parser);
    public String createSnippet(EObject actionCode);  
}
