package com.incquerylabs.emdw.testing.common.utils

import org.apache.log4j.Logger
import com.incquerylabs.emdw.cpp.common.XumlResource

abstract class ModelUtil {

	protected static extension val Logger logger = Logger.getLogger(
		ModelUtil
	)

	public static final String PATH_COMMON_TYPES = XumlResource.XUMLRT_PRIMITIVE_TYPES_LIBRARY_PATH
	public static final String PATH_CPP_COLLECTIONS = XumlResource.CPP_COLLECTIONS_LIBRARY_PATH
	public static final String PATH_CPP_TYPES = XumlResource.CPP_BASIC_TYPES_LIBRARY_PATH
	public static final String PATH_RALF_COLLECTIONS = "pathmap://RALF/library.uml"

	public static final String URI_DUMMY_UML = "dummyUmlUri.uml"
	public static final String URI_DUMMY_XTUML = "dummyXtUmlUri.xtuml"
	public static final String URI_DUMMY_TRACE = "dummyTraceUri.trace"
	public static final String URI_DUMMY_CPP = "dummyCppUri.cppmodel"

	public static final String NAME_DEFAULT_COMPONENT = "component"
	public static final String NAME_DEFAULT_PACKAGE = "package"
	public static final String NAME_DEFAULT_CLASS = "class"
	public static final String NAME_DEFAULT_SOURCE_STATE = "source"
	public static final String NAME_DEFAULT_TARGET_STATE = "target"
	public static final String NAME_DEFAULT_TRANSITION = "transition"
	public static final String NAME_DEFAULT_PARAMETER = "param"
	public static final String NAME_DESTRUCTOR = "destroy"

	public static final String CPP_LANGUAGE = "C++"
	public static final String TEST_SIDE_EFFECT_1 = '''cout << "foo";'''
	public static final String TEST_SIDE_EFFECT_2 = '''cout << "bar";'''
	public static final String TEST_EXPRESSION = "true"
}