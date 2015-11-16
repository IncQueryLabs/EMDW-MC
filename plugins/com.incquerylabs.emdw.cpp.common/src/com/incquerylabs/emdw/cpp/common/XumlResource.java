package com.incquerylabs.emdw.cpp.common;

public interface XumlResource {
    String CPP_FILE_EXTENSION = "cppmodel";
    String COMMON_FILE_EXTENSION = "common";
    
    String EMDW_PATHMAP = "pathmap://EMDW/";
    String CPP_PATHMAP = EMDW_PATHMAP + "cpp/";
    String XUMLRT_PATHMAP = EMDW_PATHMAP + "xumlrt/";
    
    String CPP_BASIC_TYPES_LIBRARY_PATH = CPP_PATHMAP + "BasicTypes." + CPP_FILE_EXTENSION;
    String CPP_COLLECTIONS_LIBRARY_PATH = CPP_PATHMAP + "Collections." + CPP_FILE_EXTENSION;
    String CPP_RUNTIME_LIBRARY_PATH = CPP_PATHMAP + "Runtime." + CPP_FILE_EXTENSION;
    
    String XUMLRT_PRIMITIVE_TYPES_LIBRARY_PATH = XUMLRT_PATHMAP + "PrimitiveTypes." +COMMON_FILE_EXTENSION;
}
