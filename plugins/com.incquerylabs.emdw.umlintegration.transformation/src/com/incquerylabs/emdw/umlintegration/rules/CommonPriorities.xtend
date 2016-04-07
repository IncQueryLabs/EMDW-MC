/*******************************************************************************
 * Copyright (c) 2015-2016, IncQuery Labs Ltd. and Ericsson AB
 * All rights reserved. This program and the accompanying materials
 * are made available under the terms of the Eclipse Public License v1.0
 * which accompanies this distribution, and is available at
 * http://www.eclipse.org/legal/epl-v10.html
 *
 * Contributors:
 *   Akos Horvath, Abel Hegedus, Zoltan Ujhelyi, Daniel Segesdi, Tamas Borbas, Denes Harmath - initial API and implementation
 *******************************************************************************/
package com.incquerylabs.emdw.umlintegration.rules

class CommonPriorities {

	public static val int VERTEX_MAPPING_PRIORITY = 1
	
	public static val int CLASS_MAPPING_PRIORITY = 1
	
	public static val int EVENT_MAPPING_PRIORITY = CLASS_MAPPING_PRIORITY + 1
	
	public static val int TYPE_MAPPING_PRIORITY = Math.max(XTPackageMapping.PRIORITY, XTComponentMapping.PRIORITY)
	
	public static val int OPERATION_MAPPING_PRIORITY = TYPE_MAPPING_PRIORITY + 1
	
	public static val int OPERATION_BEHAVIOR_MAPPING_PRIORITY = OPERATION_MAPPING_PRIORITY + 1
	
	public static val int ACTION_MAPPING_PRIORITY = 2

}