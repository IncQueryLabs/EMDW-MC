/*******************************************************************************
 * Copyright (c) 2015-2016 IncQuery Labs Ltd. and Ericsson AB
 * All rights reserved. This program and the accompanying materials
 * are made available under the terms of the Eclipse Public License v1.0
 * which accompanies this distribution, and is available at
 * http://www.eclipse.org/legal/epl-v10.html
 *
 * Contributors:
 *     Akos Horvath, Abel Hegedus, Zoltan Ujhelyi, Daniel Segesdi, Tamas Borbas, Robert Doczi, Peter Lunk - initial API and implementation
 *******************************************************************************/
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
