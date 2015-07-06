package com.incquerylabs.uml.ralf.api;

import java.util.Map;

import org.eclipse.emf.ecore.EObject;
import org.eclipse.uml2.uml.OpaqueBehavior;

public interface IReducedAlfGenerator {

    public Map<String,String> getSnippetMap();
    public String createSnippet(String behavior, IReducedAlfParser parser);
    public String createSnippet(OpaqueBehavior behavior, IReducedAlfParser parser);
    public String createSnippet(EObject actionCode);  
}
