/*******************************************************************************
 * Copyright (c) 2015-2016 IncQuery Labs Ltd. and Ericsson AB
 * All rights reserved. This program and the accompanying materials
 * are made available under the terms of the Eclipse Public License v1.0
 * which accompanies this distribution, and is available at
 * http://www.eclipse.org/legal/epl-v10.html
 *
 * Contributors:
 *     Akos Horvath, Abel Hegedus, Zoltan Ujhelyi, Daniel Segesdi, Tamas Borbas, Robert Doczi, Peter Lunk, Istvan Papp - initial API and implementation
 *******************************************************************************/
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
