package com.incquerylabs.emdw.testing.common.utils

import org.apache.log4j.Logger

abstract class ModelUtil {

	protected static extension val Logger logger = Logger.getLogger(
		ModelUtil
	)

	public static final String PATH_COMMON_TYPES = "/org.eclipse.papyrusrt.xtumlrt.common.model/model/umlPrimitiveTypes.common"
	public static final String PATH_CPP_COLLECTIONS = "/com.incquerylabs.emdw.cpp.transformation/model/defaultImplementations.cppmodel"
	public static final String PATH_CPP_TYPES = "/com.incquerylabs.emdw.cpp.transformation/model/cppBasicTypes.cppmodel"

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

	static def <T> asSet(T object) {
		#{object}.filterNull
	}
}