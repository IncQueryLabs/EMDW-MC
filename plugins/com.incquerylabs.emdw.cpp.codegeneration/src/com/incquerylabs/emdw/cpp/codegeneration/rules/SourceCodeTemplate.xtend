/*******************************************************************************
 * Copyright (c) 2015-2016, IncQuery Labs Ltd. and Ericsson AB
 * All rights reserved. This program and the accompanying materials
 * are made available under the terms of the Eclipse Public License v1.0
 * which accompanies this distribution, and is available at
 * http://www.eclipse.org/legal/epl-v10.html
 *
 * Contributors:
 *   Akos Horvath, Abel Hegedus, Zoltan Ujhelyi, Daniel Segesdi, Tamas Borbas, Robert Doczi, Peter Lunk, Istvan Papp - initial API and implementation
 *******************************************************************************/
package com.incquerylabs.emdw.cpp.codegeneration.rules

import java.util.Map
import org.eclipse.xtend.lib.annotations.Accessors
import org.eclipse.xtend.lib.annotations.Data

/**
 * A source code template encapsulates the source code that shall be generated for a given concept.
 * A single template may affect multiple source files at different sections, the collection of effects
 * is represented as a fragment.
 */
interface SourceCodeTemplate {
	
	/**
	 * The template shall generate a source code fragment based on a given set
	 *  of substitutions of placeholders and decisions for conditions. 
	 */
	def SourceCodeFragment generateFragment(Map<Placeholder, Substitution> substitutions, Map<Condition, Decision> decisions)
	
}

class Placeholder {
}

class Substitution {
	@Accessors Placeholder placeholder
}

class Condition {
}

class Decision {
	@Accessors Condition condition
}

@Data
class SourceCodeFragment {
	Map<FileType,SourceCodeDescriptor> descriptors
}

class FileType {
}

@Data
class SourceCodeDescriptor {
	Map<Section,SourceCodeEntry> entries
}

class Section {
}

@Data
class SourceCodeEntry {
	String source
}
