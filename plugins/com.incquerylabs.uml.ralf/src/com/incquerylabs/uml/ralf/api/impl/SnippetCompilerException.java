package com.incquerylabs.uml.ralf.api.impl;

public class SnippetCompilerException extends Exception{

    /**
     * 
     */
    private static final long serialVersionUID = 6732248564861289057L;
    private String message;
    
    public SnippetCompilerException(String message){
        this.message = message;
    }
    
    @Override
    public String getMessage(){
        return message;
    }

}
