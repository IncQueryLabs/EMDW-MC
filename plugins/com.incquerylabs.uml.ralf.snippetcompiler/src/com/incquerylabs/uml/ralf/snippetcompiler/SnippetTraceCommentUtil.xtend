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
package com.incquerylabs.uml.ralf.snippetcompiler

import com.incquerylabs.uml.ralf.reducedAlfLanguage.BlockStatement
import org.eclipse.emf.ecore.EObject
import org.eclipse.xtend2.lib.StringConcatenation
import org.eclipse.xtext.nodemodel.ICompositeNode
import org.eclipse.xtext.nodemodel.INode
import org.eclipse.xtext.nodemodel.util.NodeModelUtils

class SnippetTraceCommentUtil {
	private static val NEW_LINE = StringConcatenation.DEFAULT_LINE_DELIMITER
	static boolean ADD_COMMENTS = true
	
	
	/**
	 *  Returns the original rALF code for the specified EObject as c++ comments
	 *  The code inserted into the single '%s' format parameter in the format string
	 */
	def serializeToTraceComment(EObject eObject, String format) {
		if(ADD_COMMENTS){
			val traceCommentString = eObject.serialize
			val formattedTraceComment = String.format(format, traceCommentString)
			return formattedTraceComment.toRalfTraceComment
		}
		return ""
	}
	
	/**
	 * Returns the original rALF code for the specified EObject as c++ comments
	 */
	def serializeToTraceComment(EObject eObject) {
		if(ADD_COMMENTS){
			val traceCommentString = eObject.serialize
			return traceCommentString.toRalfTraceComment
		}
		return ""
	}
	
	private def toRalfTraceComment(String string) {
		if (string.nullOrEmpty) {
			return "// RALF: Trace serialization error"
		}
		var textWithStandardNewlines = string.replace("\r\n", "\n").replace("\n", NEW_LINE)
		val lines = textWithStandardNewlines.trim.split(NEW_LINE)
		val ralfTraceInfo = lines.join("", NEW_LINE, NEW_LINE) [ line |
			"// RALF: ".concat(line.trim)
		]
		return ralfTraceInfo
	}
	
	/**
	 * Serializes EObject to a String representation. Escapes only the double qoutes.
	 */
	def private serialize(EObject eObject) {
			val eObjectNode = NodeModelUtils::getNode(eObject)
			
			val blockOffset = eObjectNode.getFirstBlockOffset
			if (eObjectNode != null) {
				return escape(eObjectNode.getText(blockOffset))
			}
		return null
	}
	
	def private int getFirstBlockOffset(INode node){
		if(node.semanticElement instanceof BlockStatement){
			return node.offset
		} else {
			if(node instanceof ICompositeNode){
				val children = node.children
				for(i : 0..<children.size){
					val result = children.get(i).getFirstBlockOffset
					if(result > 0){
						return result
					}
				}
			}
			return 0
		}
	}
	
	def getText(INode node, int blockOffset){
		if(blockOffset == 0){
			return node.text
		}
		val rootNode = node.rootNode
		if (rootNode != null) {
			val offset = node.offset
			return rootNode.text.substring(offset, blockOffset);
		}
		return null;
	}
	
	
	def private escape(String escapable) {
		if (escapable == null) return null
		// escape double quotes
		var escapedString = escapable.replaceAll("\"", "\\\\\"")
		escapedString = escapedString.replaceAll("\\*+/", "")
			.replaceAll("/*\\*", "");
		return escapedString
	}
}
