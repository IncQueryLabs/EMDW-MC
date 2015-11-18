package com.incquerylabs.emdw.cpp.codegeneration.fsa;

public class FSAException extends Exception {
    private static final long serialVersionUID = -498343719125023278L;

    public FSAException(String message) {
        super(message);
    }
    
    public FSAException(Throwable exception) {
        super(exception);
    }
    
    public FSAException(String message, Throwable exception) {
      super(message, exception);
    }

}
