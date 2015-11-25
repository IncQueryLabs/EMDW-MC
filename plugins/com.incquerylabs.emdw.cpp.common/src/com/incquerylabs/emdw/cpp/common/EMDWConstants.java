package com.incquerylabs.emdw.cpp.common;

public interface EMDWConstants {
    String CPP_FILE_EXTENSION = "cppmodel";
    String COMMON_FILE_EXTENSION = "common";
    String UML_FILE_EXTENSION = "uml";
    
    String EMDW_PATHMAP = "pathmap://EMDW/";
    String RALF_PATHMAP = "pathmap://RALF/";
    
    String CPP_PATHMAP = EMDW_PATHMAP + "cpp/";
    String XUMLRT_PATHMAP = EMDW_PATHMAP + "xumlrt/";
    
    String CPP_TRANSFORMATION_MODELS_PATH = CPP_PATHMAP + "transformation/";
    String CPP_CODEGENERATION_MODELS_PATH = CPP_PATHMAP + "codegeneration/";
    
    String CPP_RALF_MODELS_PATH = RALF_PATHMAP + "library." + UML_FILE_EXTENSION;
    
    String CPP_BASIC_TYPES_LIBRARY_PATH = CPP_TRANSFORMATION_MODELS_PATH + "cppBasicTypes." + CPP_FILE_EXTENSION;
    String CPP_COLLECTIONS_LIBRARY_PATH = CPP_TRANSFORMATION_MODELS_PATH + "defaultImplementations." + CPP_FILE_EXTENSION;
    String CPP_RUNTIME_LIBRARY_PATH = CPP_CODEGENERATION_MODELS_PATH + "runtime." + CPP_FILE_EXTENSION;
    
    String XUMLRT_PRIMITIVE_TYPES_LIBRARY_PATH = XUMLRT_PATHMAP + "umlPrimitiveTypes." + COMMON_FILE_EXTENSION;
}
