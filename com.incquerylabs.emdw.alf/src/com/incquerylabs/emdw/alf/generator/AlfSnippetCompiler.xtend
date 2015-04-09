package com.incquerylabs.emdw.alf.generator

import org.eclipse.emf.ecore.EObject
import org.eclipse.papyrus.uml.alf.ArithmeticExpression
import org.eclipse.papyrus.uml.alf.NaturalLiteralExpression
import org.eclipse.papyrus.uml.alf.LocalNameDeclarationStatement
import org.eclipse.papyrus.uml.alf.ElementReference

class AlfSnippetCompiler {
	
	def dispatch String visit(EObject o) 
		'''«FOR c : o.eContents»«c.visit»«ENDFOR»'''

	def dispatch String visit(ElementReference ref)
		'''«ref.name»'''

	def dispatch String visit(LocalNameDeclarationStatement st) 
		'''«st.type().visit» «st.actualName» ;'''
	
	def dispatch String visit(ArithmeticExpression ex) 
		'''«ex.operand1.visit» «ex.operator» «ex.operand2.visit»'''
	
	def dispatch String visit(NaturalLiteralExpression lit) '''«lit.image»'''
		
}