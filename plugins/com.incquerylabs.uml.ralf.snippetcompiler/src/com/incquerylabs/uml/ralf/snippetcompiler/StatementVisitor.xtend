package com.incquerylabs.uml.ralf.snippetcompiler

import com.incquerylabs.uml.ralf.ReducedAlfSystem
import com.incquerylabs.uml.ralf.reducedAlfLanguage.Block
import com.incquerylabs.uml.ralf.reducedAlfLanguage.BlockStatement
import com.incquerylabs.uml.ralf.reducedAlfLanguage.BreakStatement
import com.incquerylabs.uml.ralf.reducedAlfLanguage.DoStatement
import com.incquerylabs.uml.ralf.reducedAlfLanguage.EmptyStatement
import com.incquerylabs.uml.ralf.reducedAlfLanguage.Expression
import com.incquerylabs.uml.ralf.reducedAlfLanguage.ExpressionStatement
import com.incquerylabs.uml.ralf.reducedAlfLanguage.ForStatement
import com.incquerylabs.uml.ralf.reducedAlfLanguage.IfClause
import com.incquerylabs.uml.ralf.reducedAlfLanguage.IfStatement
import com.incquerylabs.uml.ralf.reducedAlfLanguage.LiteralExpression
import com.incquerylabs.uml.ralf.reducedAlfLanguage.LocalNameDeclarationStatement
import com.incquerylabs.uml.ralf.reducedAlfLanguage.ReturnStatement
import com.incquerylabs.uml.ralf.reducedAlfLanguage.SendSignalStatement
import com.incquerylabs.uml.ralf.reducedAlfLanguage.SwitchClause
import com.incquerylabs.uml.ralf.reducedAlfLanguage.SwitchStatement
import com.incquerylabs.uml.ralf.reducedAlfLanguage.WhileStatement

class StatementVisitor {
	extension ReducedAlfSnippetTemplateCompiler compiler
	extension SnippetTemplateCompilerUtil util
	extension ExpressionVisitor expressionVisitor
	extension ReducedAlfSystem typeSystem
	
	new(ReducedAlfSnippetTemplateCompiler compiler, SnippetTemplateCompilerUtil util, ExpressionVisitor expressionVisitor, ReducedAlfSystem typeSystem){
		this.typeSystem = typeSystem
		this.compiler = compiler
		this.expressionVisitor = expressionVisitor
		this.util = util
	}
	
	def dispatch String visit(EmptyStatement st){
		''';'''
	}
	
	def dispatch String visit(ExpressionStatement st){
		val builder = new StringBuilder
		val expressionsnippet = st.expression.visit(builder)
		builder.append('''«expressionsnippet»;''')
		builder.toString
	} 
	
	def dispatch String visit(Block block){
		val parent = util.descriptorFactory
		util.descriptorFactory = parent.createChild
		
		val snippet = new StringBuilder
		snippet.append('''{'''+'\n')
		snippet.append('''«FOR st : block.statement SEPARATOR '\n'»«st.visit»«ENDFOR»'''+'\n')
		snippet.append('''}''') 
		
		util.descriptorFactory = parent
		snippet.toString
	} 
	
	def dispatch String visit(BreakStatement st){
		'''break;'''
	} 
	
	def dispatch String visit(ReturnStatement st){
		val builder = new StringBuilder
		val expressionsnippet = st.expression.visit(builder)
		builder.append('''return «expressionsnippet»;''')
		builder.toString
	} 
	
	def dispatch String visit(LocalNameDeclarationStatement st){		
		val builder = new StringBuilder
		val descriptor = getDescriptor(st)
		var String expressionsnippet
		
		if(st.expression != null){
			expressionsnippet = st.expression.visit(builder)
		} else{
			expressionsnippet = ""
		}
		builder.append('''«descriptor.fullType» «descriptor.stringRepresentation»«IF st.expression != null» = «ENDIF»«expressionsnippet»;''')

		builder.toString		
	}
	
	def dispatch String visit(IfStatement st){
		val builder = new StringBuilder
		
		val ifString = '''«FOR clause : st.clauses»«IF st.clauses.indexOf(clause) == 0»if «clause.visitClause(builder)»«ELSE»«IF clause instanceof BlockStatement» else «clause.visit»«ELSE» else if «clause.visitClause(builder)»«ENDIF»«ENDIF»«ENDFOR»'''
		
		builder.append(ifString)
		builder.toString
	}
	
	def dispatch String visit(SendSignalStatement st){
		val builder = new StringBuilder
		val targetString = st.target.visit(builder) 		
		val signalString = st.signal.visit(builder) 
		
		builder.append('''«targetString»->generate_event(«signalString»);''')
		builder.toString
	}
	
	def dispatch String visit(SwitchStatement st){
		val builder = new StringBuilder
		val expressionString = st.expression.visit(builder)
		
		val clausesString = 
		'''
		«FOR cl : st.nonDefaultClause SEPARATOR '\n'»«cl.visitClause(builder)»«ENDFOR»
		'''

		builder.append(
		'''
		switch («expressionString») {
		«clausesString»«IF st.defaultClause != null»default : «st.defaultClause.visit»
		«ENDIF»}''')
		builder.toString
	} 
	
	def dispatch String visit(WhileStatement st){
		val builder = new StringBuilder
		val conditionString = createLoopVariable(st.condition, builder, true)
		val block = st.body 
		val parent = util.descriptorFactory
		
		builder.append('''while («conditionString») ''')
		util.descriptorFactory = parent.createChild
		builder.append('''{'''+'\n')
		if(block instanceof Block){
			block.statement.forEach[ statement |
				builder.append(statement.visit+'\n')
	    	]
	    	val blockConditionString = createLoopVariable(st.condition, builder, false)
	    	builder.append('''«conditionString» = «blockConditionString»;'''+'\n')
			
		}else{	
			builder.append(st.body.visit)
			val blockConditionString = createLoopVariable(st.condition, builder, false)
			builder.append('''«conditionString» = «blockConditionString»;'''+'\n')
		}
		builder.append('''}''')
		util.descriptorFactory = parent
		builder.toString				
	} 
	
	def dispatch String visit(DoStatement st){
		val builder = new StringBuilder
		val conditionString = createLoopVariable(st.condition, builder, true)
		val block = st.body 
		val parent = util.descriptorFactory
		
		builder.append('''do ''')
		util.descriptorFactory = parent.createChild
		builder.append('''{'''+'\n')
		if(block instanceof Block){
			block.statement.forEach[ statement |
				builder.append(statement.visit+'\n')
	    	]
	    	val blockConditionString = createLoopVariable(st.condition, builder, false)
	    	builder.append('''«conditionString» = «blockConditionString»;'''+'\n')
			
		}else{	
			builder.append(st.body.visit)
			val blockConditionString = createLoopVariable(st.condition, builder, false)
			builder.append('''«conditionString» = «blockConditionString»;'''+'\n')
		}
		builder.append('''}''')
		util.descriptorFactory = parent
		builder.append('''while («conditionString»);''')
		builder.toString
	} 
	
	def dispatch String visit(ForStatement st){
		val builder = new StringBuilder
		
		val block = st.body 
		val parent = util.descriptorFactory
		
		util.descriptorFactory = parent.createChild
		
		builder.append('''
		{
		«st.initialization.visit»'''+'\n')
		val conditionString = createLoopVariable(st.condition, builder,true)
		builder.append('''while («conditionString») {'''+'\n')
		if(block instanceof Block){
			block.statement.forEach[ statement |
				builder.append(statement.visit+'\n')
	    	]
	    	builder.append('''«st.update.visit»'''+'\n')
	    	val blockConditionString = createLoopVariable(st.condition, builder, false)
	    	builder.append('''«conditionString» = «blockConditionString»;'''+'\n')
			
		}else{	
			builder.append(st.body.visit)
			builder.append('''«st.update.visit»'''+'\n')
			val blockConditionString = createLoopVariable(st.condition, builder, false)
			builder.append('''«conditionString» = «blockConditionString»;'''+'\n')
		}
		builder.append('''}'''+'\n')
		builder.append('''}''')
		
		util.descriptorFactory = parent
		builder.toString
	}
	
	private def dispatch String visitClause(IfClause nfc, StringBuilder builder){
		val conditionString = nfc.condition.visit(builder)
		val ret = '''(«conditionString») «nfc.body.visit»'''
		ret
	} 
	
	private def dispatch String visitClause(SwitchClause st, StringBuilder builder){
		val casesBuilder = new StringBuilder
		
		st.^case.forEach[ expr |
    		casesBuilder.append(expr.visit(builder))
    	]
    	'''case «casesBuilder.toString» : «st.block.visit»'''	
	}
	
	private def String createLoopVariable(Expression ex, StringBuilder builder, boolean newVariable){
		var String conditionSnippet
		if(ex instanceof LiteralExpression){
			val literalDescriptor = getDescriptor(ex)
			if(newVariable){
				val descriptor = (descriptorFactory.createSingleVariableDescriptorBuilder => [
					type = typeSystem.type(ex).value.umlType
					name = null
				]).build
				
				builder.append('''«descriptor.fullType» «descriptor.stringRepresentation» = «literalDescriptor.stringRepresentation»;'''+'\n')
				
				conditionSnippet = descriptor.stringRepresentation
			}else{
				conditionSnippet = literalDescriptor.stringRepresentation
			}
		}else{
			conditionSnippet = ex.visit(builder)
		}
	}
	

}