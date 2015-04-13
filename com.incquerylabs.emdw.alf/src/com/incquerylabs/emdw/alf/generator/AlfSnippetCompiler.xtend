package com.incquerylabs.emdw.alf.generator

import org.eclipse.emf.ecore.EObject
import org.eclipse.papyrus.uml.alf.ArithmeticExpression
import org.eclipse.papyrus.uml.alf.NaturalLiteralExpression
import org.eclipse.papyrus.uml.alf.LocalNameDeclarationStatement
import org.eclipse.papyrus.uml.alf.NameExpression
import org.eclipse.papyrus.uml.alf.ExternalElementReference
import org.eclipse.uml2.uml.PrimitiveType
import org.eclipse.papyrus.uml.alf.StringLiteralExpression

class AlfSnippetCompiler {
	
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
	
    //Statements
	def dispatch String visit(LocalNameDeclarationStatement st) 
		'''
			«st.type().visit» «st.actualName» = «st.expression.visit»;
		'''
	
	//Expressions
	def dispatch String visit(ArithmeticExpression ex) 
		'''«ex.operand1.visit» «ex.operator» «ex.operand2.visit»'''
	
	def dispatch String visit(NameExpression ex)
	   '''«ex.assignment.name»'''
	
	def dispatch String visit(NaturalLiteralExpression lit) {
	    lit.image
    }
	
	def dispatch String visit(StringLiteralExpression lit) '''"«lit.image»"'''
		
}