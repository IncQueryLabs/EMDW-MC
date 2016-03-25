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
package com.incquerylabs.emdw.cpp.performance.test.config;

public enum ModificationType {
    SMALL_STRUCTURE__ATTRIBUTE__ADD,
    SMALL_STRUCTURE__ATTRIBUTE__REMOVE,
    SMALL_STRUCTURE__TRANSITION__ADD,
    SMALL_STRUCTURE__TRANSITION__REMOVE,
    SMALL_BEHAVIOR__ACTION_CODE,
    HIGH_LEVEL__COMPONENT__ADD,
    HIGH_LEVEL__COMPONENT__REMOVE,
    HIGH_LEVEL__PACKAGE__ADD,
    HIGH_LEVEL__PACKAGE__MOVE,
    HIGH_LEVEL__PACKAGE__REMOVE,
    HIGH_LEVEL__PACKAGE__RENAME,
    NONE
}
