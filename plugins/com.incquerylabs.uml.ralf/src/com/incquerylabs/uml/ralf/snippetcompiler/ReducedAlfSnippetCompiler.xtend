package com.incquerylabs.uml.ralf.snippetcompiler

import com.incquerylabs.uml.ralf.reducedAlfLanguage.ArithmeticExpression
import com.incquerylabs.uml.ralf.reducedAlfLanguage.AssignmentExpression
import com.incquerylabs.uml.ralf.reducedAlfLanguage.Block
import com.incquerylabs.uml.ralf.reducedAlfLanguage.BooleanLiteralExpression
import com.incquerylabs.uml.ralf.reducedAlfLanguage.BooleanUnaryExpression
import com.incquerylabs.uml.ralf.reducedAlfLanguage.BreakStatement
import com.incquerylabs.uml.ralf.reducedAlfLanguage.ConcurrentClauses
import com.incquerylabs.uml.ralf.reducedAlfLanguage.ConditionalLogicalExpression
import com.incquerylabs.uml.ralf.reducedAlfLanguage.ConditionalTestExpression
import com.incquerylabs.uml.ralf.reducedAlfLanguage.EmptyStatement
import com.incquerylabs.uml.ralf.reducedAlfLanguage.EqualityExpression
import com.incquerylabs.uml.ralf.reducedAlfLanguage.Expression
import com.incquerylabs.uml.ralf.reducedAlfLanguage.ExpressionStatement
import com.incquerylabs.uml.ralf.reducedAlfLanguage.FeatureInvocationExpression
import com.incquerylabs.uml.ralf.reducedAlfLanguage.FeatureLeftHandSide
import com.incquerylabs.uml.ralf.reducedAlfLanguage.IfStatement
import com.incquerylabs.uml.ralf.reducedAlfLanguage.LocalNameDeclarationStatement
import com.incquerylabs.uml.ralf.reducedAlfLanguage.LogicalExpression
import com.incquerylabs.uml.ralf.reducedAlfLanguage.NameExpression
import com.incquerylabs.uml.ralf.reducedAlfLanguage.NameLeftHandSide
import com.incquerylabs.uml.ralf.reducedAlfLanguage.NaturalLiteralExpression
import com.incquerylabs.uml.ralf.reducedAlfLanguage.NonFinalClause
import com.incquerylabs.uml.ralf.reducedAlfLanguage.NumericUnaryExpression
import com.incquerylabs.uml.ralf.reducedAlfLanguage.PositionalTuple
import com.incquerylabs.uml.ralf.reducedAlfLanguage.PostfixExpression
import com.incquerylabs.uml.ralf.reducedAlfLanguage.PrefixExpression
import com.incquerylabs.uml.ralf.reducedAlfLanguage.PropertyAccessExpression
import com.incquerylabs.uml.ralf.reducedAlfLanguage.RealLiteralExpression
import com.incquerylabs.uml.ralf.reducedAlfLanguage.RelationalExpression
import com.incquerylabs.uml.ralf.reducedAlfLanguage.ReturnStatement
import com.incquerylabs.uml.ralf.reducedAlfLanguage.ShiftExpression
import com.incquerylabs.uml.ralf.reducedAlfLanguage.Statements
import com.incquerylabs.uml.ralf.reducedAlfLanguage.StringLiteralExpression
import com.incquerylabs.uml.ralf.reducedAlfLanguage.UnboundedLiteralExpression
import org.eclipse.emf.ecore.EObject
import com.incquerylabs.uml.ralf.reducedAlfLanguage.InstanceCreationExpression
import com.incquerylabs.uml.ralf.reducedAlfLanguage.NamedTuple
import com.incquerylabs.uml.ralf.reducedAlfLanguage.NamedExpression
import com.incquerylabs.uml.ralf.reducedAlfLanguage.LinkOperationExpression
import com.incquerylabs.uml.ralf.reducedAlfLanguage.SendSignalStatement
import com.incquerylabs.uml.ralf.reducedAlfLanguage.AssociationAccessExpression
import com.incquerylabs.uml.ralf.reducedAlfLanguage.ThisExpression

class ReducedAlfSnippetCompiler {

	def dispatch String visit(EObject o) 
		'''«FOR c : o.eContents»«c.visit»«ENDFOR»'''
			
	//Statements
    def dispatch String visit(Statements st){
		'''«FOR statement : st.statement SEPARATOR '\n'»«statement.visit»«ENDFOR»'''
	}
    
    def dispatch String visit(EmptyStatement st){
		''';'''
	}
	
	def dispatch String visit(ExpressionStatement st){
		'''«st.expression.visit»;'''
	} 
	
	def dispatch String visit(Block block){
		'''
		{
			«FOR statement : block.statement SEPARATOR '\n'»«statement.visit»«ENDFOR»
		}'''
	} 
	
	def dispatch String visit(BreakStatement st){
		'''break;'''
	} 
	
	def dispatch String visit(ReturnStatement st){
		'''return «st.expression.visit»;'''
	} 
	
	def dispatch String visit(LocalNameDeclarationStatement st){
		'''«st.variable.type.qualifiedName» «st.variable.name» = «st.expression.visit»;'''
	}
	
	def dispatch String visit(IfStatement st){
		'''
		«FOR clause : st.nonFinalClauses SEPARATOR '\n'»«IF st.nonFinalClauses.indexOf(clause) == 0 »if «clause.visit»«ELSE»else if «clause.visit»«ENDIF»«ENDFOR»«IF st.finalClause != null» else «st.finalClause.visit»«ENDIF»'''
	}
	
	def dispatch String visit(ConcurrentClauses cc){
		'''«FOR clause : cc.clause SEPARATOR '\n'»«clause.visit»«ENDFOR»'''
	}
	
	def dispatch String visit(NonFinalClause nfc){
		'''(«nfc.condition.visit») «nfc.body.visit»'''
	}  	
	
	def dispatch String visit(SendSignalStatement st){
		'''«st.target.visit»->generate_event(«st.signal.visit»);'''
	}
		
	//Expressions
	def dispatch String visit(InstanceCreationExpression ex){
		'''new «ex.instance.qualifiedName»«ex.tuple.visit»'''
	}
	
	def dispatch String visit(ThisExpression ex){
		'''this'''
	}
	
	def dispatch String visit(LinkOperationExpression ex){
		'''«ex.association.name».«ex.operation»«ex.tuple.visit»'''
	}
	
	def dispatch String visit(PropertyAccessExpression ex){
		'''«ex.context.visit».«ex.property.name»'''
	}
	
	def dispatch String visit(AssociationAccessExpression ex){
		'''«ex.context.visit»->«ex.association.name»'''
	}
	
	def dispatch String visit(FeatureInvocationExpression ex){
		'''«ex.context.visit».«ex.operation.name»«ex.parameters.visit»'''
	}
	
	def dispatch String visit(PositionalTuple tuple){
		'''(«FOR expression : tuple.expression SEPARATOR ', '»«expression.visit»«ENDFOR»)'''
	}
	
	def dispatch String visit(NamedTuple tuple){
		'''(«FOR expression : tuple.namedExpression SEPARATOR ', '»«expression.visit»«ENDFOR»)'''
	}
	
	
	
	def dispatch String visit(AssignmentExpression ex){
		'''«ex.leftHandSide.visit» «ex.operator» «ex.rightHandSide.visit»''' 
		//TODO different assignment operators might require different solutions
	}

	def dispatch String visit(ArithmeticExpression ex) {
	    val parenOpen = if (ex.parenthesisRequired) "(" else ""  
	    val parenClose = if (ex.parenthesisRequired) ")" else ""  
		'''«parenOpen»«ex.operand1.visit» «ex.operator» «ex.operand2.visit»«parenClose»'''
	}
	
	def dispatch String visit(ShiftExpression ex) {
	    val parenOpen = if (ex.parenthesisRequired) "(" else ""  
	    val parenClose = if (ex.parenthesisRequired) ")" else ""  
		'''«parenOpen»«ex.operand1.visit» «ex.operator» «ex.operand2.visit»«parenClose»'''
	}
	
	def dispatch String visit(RelationalExpression ex) {
		val parenOpen = if (ex.parenthesisRequired) "(" else ""  
	    val parenClose = if (ex.parenthesisRequired) ")" else ""  
		'''«parenOpen»«ex.operand1.visit» «ex.operator» «ex.operand2.visit»«parenClose»'''
	}
	
	def dispatch String visit(EqualityExpression ex) {
		val parenOpen = if (ex.parenthesisRequired) "(" else ""  
	    val parenClose = if (ex.parenthesisRequired) ")" else ""  
		'''«parenOpen»«ex.operand1.visit» «ex.operator» «ex.operand2.visit»«parenClose»'''
	}
	
	def dispatch String visit(LogicalExpression ex) {
		val parenOpen = if (ex.parenthesisRequired) "(" else ""  
	    val parenClose = if (ex.parenthesisRequired) ")" else ""  
		'''«parenOpen»«ex.operand1.visit» «ex.operator» «ex.operand2.visit»«parenClose»'''
	}
	
	def dispatch String visit(ConditionalLogicalExpression ex) {
		val parenOpen = if (ex.parenthesisRequired) "(" else ""  
	    val parenClose = if (ex.parenthesisRequired) ")" else ""  
		'''«parenOpen»«ex.operand1.visit» «ex.operator» «ex.operand2.visit»«parenClose»'''
	}

		
	def dispatch String visit(NameLeftHandSide lhs){
		'''«lhs.expression.visit»«IF lhs.index != null»[«lhs.index.visit»]«ENDIF»'''
	}
	
	def dispatch String visit(FeatureLeftHandSide lhs){
		'''«lhs.expression.visit»'''
	}
	
	def dispatch String visit(PrefixExpression ex){
		'''«ex.operator»«ex.operand.visit»'''
	}
	
	def dispatch String visit(PostfixExpression ex){
		'''«ex.operand.visit»«ex.operator»'''
	}

	
	def dispatch String visit(ConditionalTestExpression ex) {
		'''(«ex.operand1.visit») ? («ex.operand2.visit») : («ex.operand3.visit»)'''
	}

	def dispatch String visit(NameExpression ex){
		'''«ex.reference.name»'''
	}
	
	def dispatch String visit(NamedExpression ex){
		'''«ex.name» => «ex.expression.visit»'''
	}
	
	def dispatch String visit(NumericUnaryExpression ex){
		'''«ex.operator»«ex.operand.visit»'''
	}
	
	def dispatch String visit(BooleanUnaryExpression ex){
		'''«ex.operator»«ex.operand.visit»'''
	}
	
	def dispatch String visit(NaturalLiteralExpression ex) {
	    ex.value.replace("_", "")
    }
    
	def dispatch String visit(RealLiteralExpression ex) {
	    '''«ex.value»'''
    }
	
	def dispatch String visit(BooleanLiteralExpression ex){
		'''«ex.value»'''
	}
	   
	def dispatch String visit(StringLiteralExpression ex){
		'''"«ex.value»"'''
	}
	
	def dispatch String visit(UnboundedLiteralExpression ex){
		'''«ex.value»'''
	}
	
	// Parentheses
	
	private def dispatch parenthesisRequired(Expression ex) {
        return false
	}
	
	private def dispatch parenthesisRequired(ArithmeticExpression ex) {
	    if (ex.eContainer instanceof NumericUnaryExpression) {
            return true
        }
	    if (ex.eContainer instanceof ArithmeticExpression) {
	    	val parent = ex.eContainer as ArithmeticExpression
	    	if(ex.operator.equals("+") || ex.operator.equals("-")){
	    		if(parent.operator.equals("*") || parent.operator.equals("/") || parent.operator.equals("%")){
	    			return true
	    		}
	    	}else{
	    		return false
	    	}
        }
        return false
	}
	
	private def dispatch parenthesisRequired(ShiftExpression ex) {
	    if (ex.eContainer instanceof NumericUnaryExpression) {
            return true
        }
	    if (ex.eContainer instanceof ArithmeticExpression) {
	    	return true
        }
        return false
	}
	
	private def dispatch parenthesisRequired(RelationalExpression ex) {
	    if (ex.eContainer instanceof BooleanUnaryExpression) {
            return true
        }
        if(ex.eContainer instanceof ConditionalLogicalExpression){
        	return true
        }
        return false
	}
	
	private def dispatch parenthesisRequired(EqualityExpression ex) {
	    if (ex.eContainer instanceof BooleanUnaryExpression) {
            return true
        }
        return false
	}
	
	private def dispatch parenthesisRequired(LogicalExpression ex) {
	    if (ex.eContainer instanceof NumericUnaryExpression) {
            return true
        }
	    if (ex.eContainer instanceof ArithmeticExpression) {
	    	return true
        }
        if (ex.eContainer instanceof ShiftExpression) {
	    	return true
        }
        if (ex.eContainer instanceof RelationalExpression) {
	    	return true
        }
        if (ex.eContainer instanceof EqualityExpression) {
	    	return true
        }
        return false
	}
	
	private def dispatch parenthesisRequired(ConditionalLogicalExpression ex) {
	    if (ex.eContainer instanceof BooleanUnaryExpression) {
            return true
        }
        if (ex.eContainer instanceof EqualityExpression) {
	    	return true
        }
        return false
	}
		
}