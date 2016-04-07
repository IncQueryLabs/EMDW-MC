/*******************************************************************************
 * Copyright (c) 2015-2016 IncQuery Labs Ltd. and Ericsson AB
 * All rights reserved. This program and the accompanying materials
 * are made available under the terms of the Eclipse Public License v1.0
 * which accompanies this distribution, and is available at
 * http://www.eclipse.org/legal/epl-v10.html
 *
 * Contributors:
 *     Akos Horvath, Abel Hegedus, Zoltan Ujhelyi, Daniel Segesdi, Tamas Borbas, Robert Doczi, Peter Lunk, Adam Balogh - initial API and implementation
 *******************************************************************************/
package com.ericsson.xtumlrt.oopl.cppmodel.derived;

import java.util.regex.Pattern;

public class CPPNamePurifier {
	
	/**
	 * \d			A digit: [0-9]
	 * \s			A whitespace character: [ \t\n\x0B\f\r]
	 * \p{Punct}	Punctuation: One of !"#$%&'()*+,-./:;<=>?@[\]^_`{|}~
	 * 
	 * See {@link Pattern} for details
	 */
	static String remove_pattern = "^\\d|[\\s\\p{Punct}]"; 

	/**
	 * C++ name conventions: <br>
	 * 
	 *  - invalid characters: ' " ` & ? | \ . , : ; ~ = / * - + < > ( ) [ ] { } ^ % # @ space <br>
	 * 
	 *  - cannot start with a number
	 */
	public static String purifyName(String original) {
		return original.replaceAll(remove_pattern,"_");
	}
	
}