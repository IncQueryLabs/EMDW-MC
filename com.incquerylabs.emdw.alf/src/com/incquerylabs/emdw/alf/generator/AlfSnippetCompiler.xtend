package com.incquerylabs.emdw.alf.generator

import org.eclipse.emf.ecore.EObject
import org.eclipse.papyrus.uml.alf.ArithmeticExpression
import org.eclipse.papyrus.uml.alf.NaturalLiteralExpression
import org.eclipse.papyrus.uml.alf.LocalNameDeclarationStatement
import org.eclipse.papyrus.uml.alf.NameExpression
import org.eclipse.papyrus.uml.alf.ExternalElementReference
import org.eclipse.uml2.uml.PrimitiveType
import org.eclipse.papyrus.uml.alf.StringLiteralExpression
import org.eclipse.papyrus.uml.alf.IncrementOrDecrementExpression
import org.eclipse.papyrus.uml.alf.AssignmentExpression
import org.eclipse.papyrus.uml.alf.AssignedSource
import org.eclipse.papyrus.uml.alf.ExpressionStatement

class AlfSnippetCompiler {
	
	//TODO find a way to reuse this from parser if possible; otherwise extend this
	static val OPERATOR_PRECEDENCE = newHashMap(
	    "*" -> "4",
	    "/" -> "4",
	    "+" -> "5",
	    "-" -> "5"
	)
	
	def parenthesisRequired(ArithmeticExpression ex) {
	    if (ex.eContainer instanceof ArithmeticExpression) {
	        val op = ex.operator
	        val parentOp = (ex.eContainer as ArithmeticExpression).operator
	        return OPERATOR_PRECEDENCE.get(op) > OPERATOR_PRECEDENCE.get(parentOp) 
	    }
	    return false
	}
	
	def dispatch String visit(EObject o) 
		'''«FOR c : o.eContents»«c.visit»«ENDFOR»'''
	
	def dispatch String visit(ExternalElementReference ref) {
	    if (ref.asUml instanceof PrimitiveType) {
	        switch ((ref.asUml as PrimitiveType).name) {
	            case "Integer": '''int'''
	            case "String": '''std::string'''
	            default: throw new UnsupportedOperationException('''Unsupport primitive type «(ref.asUml as PrimitiveType).name» encountered.''') 
	        }
	    }
	}
	
	def dispatch String visit(AssignedSource src) '''«src.name»'''
	
    //Statements
	def dispatch String visit(LocalNameDeclarationStatement st) 
		'''
			«st.type().visit» «st.actualName» = «st.expression.visit»;
		'''
	
	def dispatch String visit(ExpressionStatement st) '''
	   «st.expression.visit»;
	'''
	
	//Expressions
	def dispatch String visit(ArithmeticExpression ex) {
	    val parenOpen = if (ex.parenthesisRequired) "(" else ""  
	    val parenClose = if (ex.parenthesisRequired) ")" else ""  
		'''«parenOpen»«ex.operand1.visit» «ex.operator» «ex.operand2.visit»«parenClose»'''
	
	}
	
	def dispatch String visit(IncrementOrDecrementExpression ex) '''
	   «IF ex.isIsPrefix»
	       «ex.operator»«ex.assignment.visit
	   »«ELSE»
	       «ex.assignment.visit»«ex.operator
	   »«ENDIF
	   »'''
	
	def dispatch String visit(NameExpression ex)
	   '''«ex.assignment.name»'''
	
	def dispatch String visit(NaturalLiteralExpression lit) {
	    lit.image.replace("_", "")
    }
	
	def dispatch String visit(StringLiteralExpression lit) '''"«lit.image»"'''
		
}