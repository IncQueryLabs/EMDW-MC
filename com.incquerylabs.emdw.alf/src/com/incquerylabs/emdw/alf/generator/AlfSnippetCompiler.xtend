package com.incquerylabs.emdw.alf.generator

import org.eclipse.emf.ecore.EObject
import org.eclipse.papyrus.uml.alf.AssignedSource
import org.eclipse.papyrus.uml.alf.BinaryExpression
import org.eclipse.papyrus.uml.alf.ExpressionStatement
import org.eclipse.papyrus.uml.alf.ExternalElementReference
import org.eclipse.papyrus.uml.alf.IncrementOrDecrementExpression
import org.eclipse.papyrus.uml.alf.LocalNameDeclarationStatement
import org.eclipse.papyrus.uml.alf.NameExpression
import org.eclipse.papyrus.uml.alf.NaturalLiteralExpression
import org.eclipse.papyrus.uml.alf.StringLiteralExpression
import org.eclipse.uml2.uml.PrimitiveType
import org.eclipse.papyrus.uml.alf.ConditionalTestExpression
import org.eclipse.papyrus.uml.alf.BooleanLiteralExpression
import org.eclipse.papyrus.uml.alf.AssignmentExpression

class AlfSnippetCompiler {
	
	//TODO find a way to reuse this from parser if possible; otherwise extend this
	static val OPERATOR_PRECEDENCE = newHashMap(
	    "*"  ->  1,
	    "/"  ->  1,
	    "%"  ->  1,
	    "+"  ->  2,
	    "-"  ->  2,
	    ">>" ->  3,
	    "<<" ->  3,
	    "<"  ->  4,
	    ">"  ->  4,
	    "<=" ->  4,
	    ">=" ->  4,
	    "==" ->  5,
	    "!=" ->  5,
	    "&"  ->  6,
	    "^"  ->  7,
	    "|"  ->  8,
	    "&&" ->  6,
	    "||" ->  8,
	    "="  ->  9
	)
	
	def parenthesisRequired(BinaryExpression ex) {
	       if (ex.eContainer instanceof BinaryExpression) {
            val op = ex.operator
            val parentOp = (ex.eContainer as BinaryExpression).operator
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
	            case "Boolean": '''bool'''
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
	def dispatch String visit(AssignmentExpression ex) '''
	   «ex.leftHandSide.localName» «ex.operator» «ex.rightHandSide.visit
	   »''' //TODO different assignment operators might require different solutions
	
	def dispatch String visit(BinaryExpression ex) {
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
	
	def dispatch String visit(ConditionalTestExpression ex) 
	   '''(«ex.operand1.visit») ? («ex.operand2.visit») : («ex.operand3.visit»)'''
	
	def dispatch String visit(NameExpression ex)
	   '''«ex.assignment.name»'''
	
	def dispatch String visit(NaturalLiteralExpression lit) {
	    lit.image.replace("_", "")
    }
	
	def dispatch String visit(BooleanLiteralExpression lit) 
	   '''«lit.image»'''
	def dispatch String visit(StringLiteralExpression lit) '''"«lit.image»"'''
		
}