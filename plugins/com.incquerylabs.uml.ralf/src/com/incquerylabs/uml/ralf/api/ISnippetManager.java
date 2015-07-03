package com.incquerylabs.uml.ralf.api;

import java.util.Map;

import org.eclipse.uml2.uml.OpaqueBehavior;

public interface ISnippetManager {

    public Map<String,String> getSnippetMap();
    public String getSnippet(String behavior);
    public String getSnippet(OpaqueBehavior behavior);
    
}
