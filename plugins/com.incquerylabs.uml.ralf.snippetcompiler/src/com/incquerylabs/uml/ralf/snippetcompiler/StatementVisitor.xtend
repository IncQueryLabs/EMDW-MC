package com.incquerylabs.uml.ralf.snippetcompiler

import com.incquerylabs.uml.ralf.ReducedAlfSystem
import com.incquerylabs.uml.ralf.reducedAlfLanguage.Block
import com.incquerylabs.uml.ralf.reducedAlfLanguage.BlockStatement
import com.incquerylabs.uml.ralf.reducedAlfLanguage.BreakStatement
import com.incquerylabs.uml.ralf.reducedAlfLanguage.DoStatement
import com.incquerylabs.uml.ralf.reducedAlfLanguage.EmptyStatement
import com.incquerylabs.uml.ralf.reducedAlfLanguage.Expression
import com.incquerylabs.uml.ralf.reducedAlfLanguage.ExpressionStatement
import com.incquerylabs.uml.ralf.reducedAlfLanguage.ForEachStatement
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
import org.apache.log4j.Logger
import org.eclipse.uml2.uml.Signal
import org.eclipse.xtend2.lib.StringConcatenation

class StatementVisitor {
	extension SnippetTraceCommentUtil traceCommentUtil = new SnippetTraceCommentUtil
	extension Logger logger = Logger.getLogger(class)
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
		trace('''Started visiting: «st.class.simpleName»''')
		val expr = ''';'''
		trace('''Finished visiting: «st.class.simpleName»: «expr»''')
		return expr	
	}
	
	def dispatch String visit(ExpressionStatement st){
		trace('''Started visiting: «st.class.simpleName»''')
		val builder = new StringBuilder
		builder.append(st.serializeToTraceComment)
		val expressionsnippet = st.expression.visit(builder).stringRepresentation
		builder.append('''«expressionsnippet»;''')
		trace('''Finished visiting: «st.class.simpleName»: «builder.toString»''')
		builder.toString
	} 
	
	def dispatch String visit(Block block){
		trace('''Started visiting: «block.class.simpleName»''')
		val parent = util.descriptorFactory
		util.descriptorFactory = parent.createChild
		trace('''Use child Descriptor Factory''')
		
		val snippet = new StringBuilder
		snippet.append('''{'''+ StringConcatenation.DEFAULT_LINE_DELIMITER)
		snippet.append('''«FOR st : block.statement SEPARATOR StringConcatenation.DEFAULT_LINE_DELIMITER»«st.visit»«ENDFOR»''' + StringConcatenation.DEFAULT_LINE_DELIMITER)
		snippet.append('''}''') 
		
		util.descriptorFactory = parent
		trace('''Use parent Descriptor Factory''')
		trace('''Started visiting: «block.class.simpleName»''')
		snippet.toString
	} 
	
	def dispatch String visit(BreakStatement st){
		trace('''Started visiting: «st.class.simpleName»''')
		val expr ='''break;'''
		trace('''Finished visiting: «st.class.simpleName»: «expr»''')
		return expr
	} 
	
	def dispatch String visit(ReturnStatement st){
		trace('''Started visiting: «st.class.simpleName»''')
		val builder = new StringBuilder
		builder.append(st.serializeToTraceComment)
		if(st.expression != null){
			val expressionsnippet = st.expression.visit(builder).stringRepresentation	
			builder.append('''return «expressionsnippet»;''')
		}else{
			builder.append('''return;''')
		}
		trace('''Finished visiting: «st.class.simpleName»: «builder.toString»''')
		builder.toString
	} 
	
	def dispatch String visit(LocalNameDeclarationStatement st){	
		trace('''Started visiting: «st.class.simpleName»''')
		val builder = new StringBuilder
		builder.append(st.serializeToTraceComment)
		val descriptor = getDescriptor(st)
		var String expressionsnippet
		
		if(st.expression != null){
			expressionsnippet = st.expression.visit(builder).stringRepresentation
		} else{
			expressionsnippet = ""
		}
		
		
		if(st.expression instanceof InstanceCreationExpression && (st.expression as InstanceCreationExpression).instance instanceof Signal){
			val retVal = '''«descriptor.fullType» «descriptor.stringRepresentation» = «expressionsnippet»;'''+StringConcatenation.DEFAULT_LINE_DELIMITER+builder.toString
			
			trace('''Finished visiting: «st.class.simpleName»: «retVal»''')
			retVal
		}else{
			builder.append('''«descriptor.fullType» «descriptor.stringRepresentation»«IF st.expression != null» = «ENDIF»«expressionsnippet»;''')
			trace('''Finished visiting: «st.class.simpleName»: «builder.toString»''')
			builder.toString
		}
				
	}
	
	def dispatch String visit(IfStatement st){
		trace('''Started visiting: «st.class.simpleName»''')
		val builder = new StringBuilder
		
		val ifString = '''
		«FOR clause : st.clauses»«IF st.clauses.indexOf(clause) == 0»«clause.serializeToTraceComment("if %s")»if «clause.visitClause(builder)»«ELSE»«IF clause instanceof BlockStatement» else «clause.visit»«ELSE»«clause.serializeToTraceComment("else if %s")» else if «clause.visitClause(builder)»«ENDIF»«ENDIF»«ENDFOR»'''
		builder.append(ifString)
		trace('''Finished visiting: «st.class.simpleName»''')
		builder.toString
	}
	
	def dispatch String visit(SendSignalStatement st){
		trace('''Started visiting: Send Signal Statement''')
		
		val builder = new StringBuilder
		builder.append(st.serializeToTraceComment)
		val targetDescriptor = st.target.visit(builder) 		
		val signalDescriptor = st.signal.visit(builder) 
				
		val descriptor = (descriptorFactory.createSendSignalBuilder => [
			variable = targetDescriptor
			signal = signalDescriptor
		]).build
		
		//builder.append('''«targetString»->generate_event(«signalString»);''')
		builder.append('''«descriptor.stringRepresentation»;''')
		trace('''Finished visiting: «st.class.simpleName»: «builder.toString»''')
		builder.toString
	}
	
	def dispatch String visit(SwitchStatement st){
		trace('''Started visiting: «st.class.simpleName»''')
		val builder = new StringBuilder
		builder.append(st.serializeToTraceComment)
		val expressionString = st.expression.visit(builder).stringRepresentation
		
		val clausesString = 
		'''
		«FOR cl : st.nonDefaultClause SEPARATOR StringConcatenation.DEFAULT_LINE_DELIMITER»«cl.serializeToTraceComment»«cl.visitClause(builder)»«ENDFOR»
		'''

		builder.append(
		'''
		switch («expressionString») {
		«clausesString»«IF st.defaultClause != null»default : «st.defaultClause.visit»
		«ENDIF»}''')
		trace('''Finished visiting: «st.class.simpleName»''')
		builder.toString
	} 
	
	def dispatch String visit(WhileStatement st){
		trace('''Started visiting: «st.class.simpleName»''')
		val builder = new StringBuilder
		builder.append(st.serializeToTraceComment)
		val conditionString = createLoopVariable(st.condition, builder)
		val block = st.body 
		val parent = util.descriptorFactory
		
		builder.append('''while («conditionString») ''')
		util.descriptorFactory = parent.createChild
		trace('''Use child Descriptor Factory''')
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
		trace('''Use parent Descriptor Factory''')
		trace('''Finished visiting: «st.class.simpleName»''')
		builder.toString				
	} 
	
	def dispatch String visit(DoStatement st){
		trace('''Started visiting: «st.class.simpleName»''')
		val builder = new StringBuilder
		val conditionString = createLoopVariable(st.condition, builder)
		val block = st.body 
		val parent = util.descriptorFactory
		
		builder.append(st.serializeToTraceComment)
		builder.append('''do ''')
		util.descriptorFactory = parent.createChild
		trace('''Use child Descriptor Factory''')
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
		trace('''Use parent Descriptor Factory''')
		builder.append('''while («conditionString»);''')
		trace('''Finished visiting: «st.class.simpleName»''')
		builder.toString
	} 
	
	def dispatch String visit(ForStatement st){
		trace('''Started visiting: «st.class.simpleName»''')
		val builder = new StringBuilder
		
		val block = st.body 
		val parent = util.descriptorFactory
		
		util.descriptorFactory = parent.createChild
		trace('''Use child Descriptor Factory''')
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
		trace('''Use parent Descriptor Factory''')
		trace('''Finished visiting: «st.class.simpleName»''')
		builder.toString
	}
	
	def dispatch String visit(ForEachStatement st){
		trace('''Started visiting: «st.class.simpleName»''')
		val builder = new StringBuilder
		builder.append(st.serializeToTraceComment)
		val variableType = st.variableDefinition.getType.type
		val variableName = st.variableDefinition.name
		val collectionDescriptor = st.expression.visit(builder)
		
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
		trace('''Finished visiting: «st.class.simpleName»''')
		builder.toString
	}
	
	private def dispatch String visitClause(IfClause nfc, StringBuilder builder){
		trace('''Started visiting: «nfc.class.simpleName»''')
		builder.append(nfc.serializeToTraceComment)
		val conditionDescriptor = nfc.condition.visit(builder)
		
		val ret = '''(«conditionDescriptor.stringRepresentation») «nfc.body.visit»'''
		trace('''Finished visiting: «nfc.class.simpleName»''')
		ret
	} 
	
	private def dispatch String visitClause(SwitchClause st, StringBuilder builder){
		trace('''Started visiting: «st.class.simpleName»''')
		val casesBuilder = new StringBuilder
		
		st.^case.forEach[ expr |
    		casesBuilder.append(expr.visit(builder).stringRepresentation)
    	]
    	trace('''Finished visiting: «st.class.simpleName»''')
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
			conditionSnippet = ex.visit(builder).stringRepresentation
		}
	}
	
	private def String updateLoopVariable(Expression ex, StringBuilder builder){
		var String conditionSnippet
		if(ex instanceof LiteralExpression){
			conditionSnippet = getDescriptor(ex).stringRepresentation
		}else{
			conditionSnippet = ex.visit(builder).stringRepresentation
		}
	}
	

}