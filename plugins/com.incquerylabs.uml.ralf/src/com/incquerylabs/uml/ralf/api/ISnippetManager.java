package com.incquerylabs.uml.ralf.api;

import java.util.Map;

public interface ISnippetManager {

    public Map<String,String> getSnippetMap();
    public String getSnippet(String behavior);
    
}
