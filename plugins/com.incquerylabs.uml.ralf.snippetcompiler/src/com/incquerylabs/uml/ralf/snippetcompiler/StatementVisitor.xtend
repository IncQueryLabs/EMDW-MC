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
import com.incquerylabs.uml.ralf.reducedAlfLanguage.InstanceCreationExpression
import com.incquerylabs.uml.ralf.reducedAlfLanguage.LiteralExpression
import com.incquerylabs.uml.ralf.reducedAlfLanguage.LocalNameDeclarationStatement
import com.incquerylabs.uml.ralf.reducedAlfLanguage.ReturnStatement
import com.incquerylabs.uml.ralf.reducedAlfLanguage.SendSignalStatement
import com.incquerylabs.uml.ralf.reducedAlfLanguage.SwitchClause
import com.incquerylabs.uml.ralf.reducedAlfLanguage.SwitchStatement
import com.incquerylabs.uml.ralf.reducedAlfLanguage.WhileStatement
import org.eclipse.uml2.uml.Signal
import org.eclipse.xtend2.lib.StringConcatenation
import com.incquerylabs.uml.ralf.reducedAlfLanguage.ForEachStatement

class StatementVisitor {
	extension SnippetTraceCommentUtil traceCommentUtil = new SnippetTraceCommentUtil
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
		builder.append(st.serializeToTraceComment)
		val expressionsnippet = st.expression.visit(builder)
		builder.append('''«expressionsnippet»;''')
		builder.toString
	} 
	
	def dispatch String visit(Block block){
		val parent = util.descriptorFactory
		util.descriptorFactory = parent.createChild
		
		val snippet = new StringBuilder
		snippet.append('''{'''+ StringConcatenation.DEFAULT_LINE_DELIMITER)
		snippet.append('''«FOR st : block.statement SEPARATOR StringConcatenation.DEFAULT_LINE_DELIMITER»«st.visit»«ENDFOR»''' + StringConcatenation.DEFAULT_LINE_DELIMITER)
		snippet.append('''}''') 
		
		util.descriptorFactory = parent
		snippet.toString
	} 
	
	def dispatch String visit(BreakStatement st){
		'''break;'''
	} 
	
	def dispatch String visit(ReturnStatement st){
		val builder = new StringBuilder
		builder.append(st.serializeToTraceComment)
		if(st.expression != null){
			val expressionsnippet = st.expression.visit(builder)	
			builder.append('''return «expressionsnippet»;''')
		}else{
			builder.append('''return;''')
		}
		builder.toString
	} 
	
	def dispatch String visit(LocalNameDeclarationStatement st){		
		val builder = new StringBuilder
		builder.append(st.serializeToTraceComment)
		val descriptor = getDescriptor(st)
		var String expressionsnippet
		
		if(st.expression != null){
			expressionsnippet = st.expression.visit(builder)
		} else{
			expressionsnippet = ""
		}
		
		
		if(st.expression instanceof InstanceCreationExpression && (st.expression as InstanceCreationExpression).instance instanceof Signal){
			'''«descriptor.fullType» «descriptor.stringRepresentation» = «expressionsnippet»;'''+StringConcatenation.DEFAULT_LINE_DELIMITER+builder.toString
		}else{
			builder.append('''«descriptor.fullType» «descriptor.stringRepresentation»«IF st.expression != null» = «ENDIF»«expressionsnippet»;''')
			builder.toString
		}		
	}
	
	def dispatch String visit(IfStatement st){
		val builder = new StringBuilder
		
		val ifString = '''
		«FOR clause : st.clauses»«IF st.clauses.indexOf(clause) == 0»«clause.serializeToTraceComment("if %s")»if «clause.visitClause(builder)»«ELSE»«IF clause instanceof BlockStatement» else «clause.visit»«ELSE»«clause.serializeToTraceComment("else if %s")» else if «clause.visitClause(builder)»«ENDIF»«ENDIF»«ENDFOR»'''
		builder.append(ifString)
		builder.toString
	}
	
	def dispatch String visit(SendSignalStatement st){
		val targetType = typeSystem.type(st.target).value.umlType
		val signalType = typeSystem.type(st.signal).value.umlType
		
		val builder = new StringBuilder
		builder.append(st.serializeToTraceComment)
		val targetString = st.target.visit(builder) 		
		val signalString = st.signal.visit(builder) 
		
		val targetDescriptor = (descriptorFactory.createSingleVariableDescriptorBuilder => [
			type = targetType
			name = targetString
			isExistingVariable = true
		]).build
		
		val signalDescriptor = (descriptorFactory.createSingleVariableDescriptorBuilder => [
			type = signalType
			name = signalString
			isExistingVariable = true
		]).build
		
		val descriptor = (descriptorFactory.createSendSignalBuilder => [
			variable = targetDescriptor
			signal = signalDescriptor
		]).build
		
		//builder.append('''«targetString»->generate_event(«signalString»);''')
		builder.append('''«descriptor.stringRepresentation»;''')
		builder.toString
	}
	
	def dispatch String visit(SwitchStatement st){
		val builder = new StringBuilder
		builder.append(st.serializeToTraceComment)
		val expressionString = st.expression.visit(builder)
		
		val clausesString = 
		'''
		«FOR cl : st.nonDefaultClause SEPARATOR StringConcatenation.DEFAULT_LINE_DELIMITER»«cl.serializeToTraceComment»«cl.visitClause(builder)»«ENDFOR»
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
		builder.append(st.serializeToTraceComment)
		val conditionString = createLoopVariable(st.condition, builder)
		val block = st.body 
		val parent = util.descriptorFactory
		
		builder.append('''while («conditionString») ''')
		util.descriptorFactory = parent.createChild
		builder.append('''{'''+StringConcatenation.DEFAULT_LINE_DELIMITER)
		if(block instanceof Block){
			block.statement.forEach[ statement |
				builder.append(statement.visit+StringConcatenation.DEFAULT_LINE_DELIMITER)
	    	]
	    	val blockConditionString = updateLoopVariable(st.condition, builder)
	    	builder.append('''«conditionString» = «blockConditionString»;
	    	''')
			
		}else{	
			builder.append(st.body.visit)
			val blockConditionString = updateLoopVariable(st.condition, builder)
			builder.append('''«conditionString» = «blockConditionString»;
			''')
		}
		builder.append('''}''')
		util.descriptorFactory = parent
		builder.toString				
	} 
	
	def dispatch String visit(DoStatement st){
		val builder = new StringBuilder
		val conditionString = createLoopVariable(st.condition, builder)
		val block = st.body 
		val parent = util.descriptorFactory
		
		builder.append(st.serializeToTraceComment)
		builder.append('''do ''')
		util.descriptorFactory = parent.createChild
		builder.append('''{
			''')
		if(block instanceof Block){
			block.statement.forEach[ statement |
				builder.append(statement.visit+StringConcatenation.DEFAULT_LINE_DELIMITER)
	    	]
	    	val blockConditionString = updateLoopVariable(st.condition, builder)
	    	builder.append('''«conditionString» = «blockConditionString»;
	    	''')
			
		}else{	
			builder.append(st.body.visit)
			val blockConditionString = updateLoopVariable(st.condition, builder)
			builder.append('''«conditionString» = «blockConditionString»;
			''')
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
		builder.append(st.serializeToTraceComment)
		builder.append('''
		{
		«st.initialization.visit»
		''')
		val conditionString = createLoopVariable(st.condition, builder)
		builder.append('''while («conditionString») {
			''')
		if(block instanceof Block){
			block.statement.forEach[ statement |
				builder.append(statement.visit + StringConcatenation.DEFAULT_LINE_DELIMITER)
	    	]
	    	builder.append(st.update.visit + StringConcatenation.DEFAULT_LINE_DELIMITER)
	    	val blockConditionString = updateLoopVariable(st.condition, builder)
	    	builder.append('''«conditionString» = «blockConditionString»;
	    	''')
			
		}else{	
			builder.append(st.body.visit)
			builder.append(st.update.visit + StringConcatenation.DEFAULT_LINE_DELIMITER)
			val blockConditionString = updateLoopVariable(st.condition, builder)
			builder.append('''«conditionString» = «blockConditionString»;
			''')
		}
		builder.append('''}''' + StringConcatenation.DEFAULT_LINE_DELIMITER)
		builder.append('''}''')
		
		util.descriptorFactory = parent
		builder.toString
	}
	
	def dispatch String visit(ForEachStatement st){
		val builder = new StringBuilder
		builder.append(st.serializeToTraceComment)
		val variableType = st.variableDefinition.getType.type
		val variableName = st.variableDefinition.name
		val collectionString = st.expression.visit(builder)
		
		val collectionDescriptor = descriptorFactory.getCachedVariableDescriptor(collectionString)
		val descriptor = (descriptorFactory.createSingleVariableDescriptorBuilder => [
			type = variableType
			name = variableName
		]).build
		
		val foreachDescriptor = (descriptorFactory.createForeachBuilder => [
			it.variableDescriptor = descriptor
			it.collectionDescriptor = collectionDescriptor
		]).build
		
		builder.append('''
		«foreachDescriptor.stringRepresentation» «st.body.visit»''')
		builder.toString
	}
	
	private def dispatch String visitClause(IfClause nfc, StringBuilder builder){
		builder.append(nfc.serializeToTraceComment)
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
	
	private def String createLoopVariable(Expression ex, StringBuilder builder){
		var String conditionSnippet
		if(ex instanceof LiteralExpression){
			val literalDescriptor = getDescriptor(ex)
			val descriptor = (descriptorFactory.createSingleVariableDescriptorBuilder => [
				type = typeSystem.type(ex).value.umlType
				name = null
			]).build
			
			builder.append('''«descriptor.fullType» «descriptor.stringRepresentation» = «literalDescriptor.stringRepresentation»;
			''')
			
			conditionSnippet = descriptor.stringRepresentation
		}else{
			conditionSnippet = ex.visit(builder)
		}
	}
	
	private def String updateLoopVariable(Expression ex, StringBuilder builder){
		var String conditionSnippet
		if(ex instanceof LiteralExpression){
			conditionSnippet = getDescriptor(ex).stringRepresentation
		}else{
			conditionSnippet = ex.visit(builder)
		}
	}
	

}