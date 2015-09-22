package com.incquerylabs.uml.ralf.snippetcompiler

import com.incquerylabs.uml.ralf.reducedAlfLanguage.BlockStatement
import java.util.regex.Matcher
import java.util.regex.Pattern
import org.eclipse.emf.ecore.EObject
import org.eclipse.xtext.nodemodel.ICompositeNode
import org.eclipse.xtext.nodemodel.INode
import org.eclipse.xtext.nodemodel.util.NodeModelUtils
import org.eclipse.xtend2.lib.StringConcatenation

class SnippetTraceCommentUtil {
	private static val NEW_LINE = StringConcatenation.DEFAULT_LINE_DELIMITER
	static boolean ADD_COMMENTS = true
	
	def appendTraceComment(StringBuilder builder, EObject eObject) {
		if(ADD_COMMENTS){
			builder.append(eObject.serializeToTraceComment)
		}
	}
	
	def serializeToTraceComment(EObject eObject) {
		if(ADD_COMMENTS){
			var traceCommentString = eObject.serialize
			return traceCommentString.toRalfTraceComment
		}
		return ""
	}
	
	private def toRalfTraceComment(String string) {
		if (string.nullOrEmpty) {
			return "// RALF: Trace serialization error"
		}
		var ralfTraceInfo = string.replace("\r\n", "\n").replace("\n", NEW_LINE)
		ralfTraceInfo = NEW_LINE + ralfTraceInfo.trim
		ralfTraceInfo = ralfTraceInfo.replaceAll(Pattern::quote(NEW_LINE),Matcher::quoteReplacement('''«NEW_LINE»// RALF: '''))
		return ralfTraceInfo.trim + NEW_LINE
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
