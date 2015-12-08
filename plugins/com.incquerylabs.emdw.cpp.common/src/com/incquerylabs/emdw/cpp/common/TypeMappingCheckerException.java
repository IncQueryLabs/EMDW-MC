package com.incquerylabs.emdw.cpp.common;

public class TypeMappingCheckerException extends Exception {

    public static class Messages {
        public static final String MISSING_MODEL = "Missing model: {0}";
        public static final String EMPTY_MODEL = "Empty model: {0}";
        public static final String MISSING_COLLECTION = "Missing {0} {1}";
    }
    
    private static final long serialVersionUID = 1L;
    
    public TypeMappingCheckerException(String message) {
        super(message);
    }

}
