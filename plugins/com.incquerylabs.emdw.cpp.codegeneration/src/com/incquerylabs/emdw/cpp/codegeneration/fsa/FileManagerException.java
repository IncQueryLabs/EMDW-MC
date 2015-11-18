package com.incquerylabs.emdw.cpp.codegeneration.fsa;

public class FileManagerException extends Exception {
    private static final long serialVersionUID = -498343719125023278L;

    public FileManagerException(String message) {
        super(message);
    }
    
    public FileManagerException(Throwable exception) {
        super(exception);
    }
    
    public FileManagerException(String message, Throwable exception) {
      super(message, exception);
    }

}
