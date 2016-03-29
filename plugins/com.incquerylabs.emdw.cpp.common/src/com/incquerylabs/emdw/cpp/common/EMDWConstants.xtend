/*******************************************************************************
 * Copyright (c) 2015-2016, IncQuery Labs Ltd. and Ericsson AB
 * All rights reserved. This program and the accompanying materials
 * are made available under the terms of the Eclipse Public License v1.0
 * which accompanies this distribution, and is available at
 * http://www.eclipse.org/legal/epl-v10.html
 *
 * Contributors:
 *   Akos Horvath, Abel Hegedus, Zoltan Ujhelyi, Daniel Segesdi, Tamas Borbas, Robert Doczi, Peter Lunk - initial API and implementation
 *******************************************************************************/
package com.incquerylabs.emdw.cpp.common

import com.ericsson.xtumlrt.oopl.AssociativeCollectionKind
import com.ericsson.xtumlrt.oopl.SequenceOrderednessKind
import com.ericsson.xtumlrt.oopl.SequenceUniquenessKind
import com.ericsson.xtumlrt.oopl.SimpleCollectionKind

interface EMDWConstants {
	String CPP_FILE_EXTENSION = "cppmodel"
	String COMMON_FILE_EXTENSION = "common"
	String UML_FILE_EXTENSION = "uml"
	String EMDW_PATHMAP = "pathmap://EMDW/"
	String RALF_PATHMAP = "pathmap://RALF/"
	String XUMLRT_PROFILE_PATHMAP = "pathmap://XUMLRT_PROFILE/";
	String CPP_PATHMAP = EMDW_PATHMAP + "cpp/"
	String XUMLRT_PATHMAP = EMDW_PATHMAP + "xumlrt/"
	String CPP_TRANSFORMATION_MODELS_PATH = CPP_PATHMAP + "transformation/"
	String CPP_CODEGENERATION_MODELS_PATH = CPP_PATHMAP + "codegeneration/"
	String CPP_RALF_MODELS_PATH = RALF_PATHMAP + "collections/" + "collections." + UML_FILE_EXTENSION
	String CPP_BASIC_TYPES_LIBRARY_PATH = CPP_TRANSFORMATION_MODELS_PATH + "cppBasicTypes." + CPP_FILE_EXTENSION
	String CPP_COLLECTIONS_LIBRARY_PATH = CPP_TRANSFORMATION_MODELS_PATH + "defaultImplementations." +
		CPP_FILE_EXTENSION
	String CPP_RUNTIME_LIBRARY_PATH = CPP_CODEGENERATION_MODELS_PATH + "runtime." + CPP_FILE_EXTENSION
	String XUMLRT_PRIMITIVE_TYPES_LIBRARY_PATH = XUMLRT_PATHMAP + "umlPrimitiveTypes." + COMMON_FILE_EXTENSION
	
	public static val SUPPORTED_UML_PRIMITIVE_TYPES = #{
		"PrimitiveTypes::Boolean",
		"PrimitiveTypes::Integer",
		"PrimitiveTypes::Real",
		"PrimitiveTypes::String"
	}
	public static val SUPPORTED_OOPL_SEQUENCES = #[
		SequenceOrderednessKind.ORDERED -> SequenceUniquenessKind.UNIQUE,
		SequenceOrderednessKind.ORDERED -> SequenceUniquenessKind.NON_UNIQUE,
		SequenceOrderednessKind.UNORDERED -> SequenceUniquenessKind.UNIQUE,
		SequenceOrderednessKind.UNORDERED -> SequenceUniquenessKind.NON_UNIQUE
	]
	public static val SUPPORTED_OOPL_ASSOC_COLLECTIONS = #{
		AssociativeCollectionKind.ORDERED_SET,
		AssociativeCollectionKind.UNORDERED_MULTISET
	}
	public static val SUPPORTED_OOPL_SIMPLE_COLLECTION = #{
		SimpleCollectionKind.DOUBLE_ENDED_QUEUE,
		SimpleCollectionKind.DOUBLY_LINKED_LIST,
		SimpleCollectionKind.SIMPLY_LINKED_LIST
	}
}
