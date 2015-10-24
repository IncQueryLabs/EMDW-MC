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
import com.incquerylabs.uml.ralf.reducedAlfLanguage.ThisExpression

class StatementVisitor {
	extension SnippetTraceCommentUtil traceCommentUtil = new SnippetTraceCommentUtil
	extension Logger logger = Logger.getLogger(class)
	extension LoggerUtil loggerutil = new LoggerUtil
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
		logger.logVisitingStarted(st)
		val expr = ''';'''
		logger.logVisitingFinished(st,expr)
		return expr	
	}
	
	def dispatch String visit(ExpressionStatement st){
		logger.logVisitingStarted(st)
		val builder = new StringBuilder
		builder.append(st.serializeToTraceComment)
		val expressionsnippet = st.expression.visit(builder).stringRepresentation
		builder.append('''«expressionsnippet»;''')
		logger.logVisitingFinished(st,builder.toString)
		builder.toString
	} 
	
	def dispatch String visit(Block block){
		logger.logVisitingStarted(block)
		val parent = util.descriptorFactory
		util.descriptorFactory = parent.createChild
		logger.logUseChildDescrFactory
		
		val snippet = new StringBuilder
		snippet.append('''{'''+ StringConcatenation.DEFAULT_LINE_DELIMITER)
		snippet.append('''«FOR st : block.statement SEPARATOR StringConcatenation.DEFAULT_LINE_DELIMITER»«st.visit»«ENDFOR»''' + StringConcatenation.DEFAULT_LINE_DELIMITER)
		snippet.append('''}''') 
		
		util.descriptorFactory = parent
		logger.logUseParentDescrFactory
		logger.logVisitingFinished(block)
		snippet.toString
	} 
	
	def dispatch String visit(BreakStatement st){
		logger.logVisitingStarted(st)
		val expr ='''break;'''
		logger.logVisitingFinished(st,expr)
		return expr
	} 
	
	def dispatch String visit(ReturnStatement st){
		logger.logVisitingStarted(st)
		val builder = new StringBuilder
		builder.append(st.serializeToTraceComment)
		if(st.expression != null){
			val expressionsnippet = st.expression.visit(builder).stringRepresentation	
			builder.append('''return «expressionsnippet»;''')
		}else{
			builder.append('''return;''')
		}
		logger.logVisitingFinished(st, builder.toString)
		builder.toString
	} 
	
	def dispatch String visit(LocalNameDeclarationStatement st){	
		logger.logVisitingStarted(st)
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
			
			logger.logVisitingFinished(st,retVal)
			retVal
		}else{
			builder.append('''«descriptor.fullType» «descriptor.stringRepresentation»«IF st.expression != null» = «ENDIF»«expressionsnippet»;''')
			logger.logVisitingFinished(st,builder.toString)
			builder.toString
		}
				
	}
	
	def dispatch String visit(IfStatement st){
		logger.logVisitingStarted(st)
		val builder = new StringBuilder
		
		val ifString = '''
		«FOR clause : st.clauses»«IF st.clauses.indexOf(clause) == 0»«clause.serializeToTraceComment("if %s")»if «clause.visitClause(builder)»«ELSE»«IF clause instanceof BlockStatement» else «clause.visit»«ELSE»«clause.serializeToTraceComment("else if %s")» else if «clause.visitClause(builder)»«ENDIF»«ENDIF»«ENDFOR»'''
		builder.append(ifString)
		logger.logVisitingFinished(st)
		builder.toString
	}
	
	def dispatch String visit(SendSignalStatement st){
		logger.logVisitingStarted(st)
		
		val builder = new StringBuilder
		builder.append(st.serializeToTraceComment)
		val targetDescriptor = st.target.visit(builder) 		
		val signalDescriptor = st.signal.visit(builder)
		
		val isInternal = st.target instanceof ThisExpression
						
		val descriptor = (descriptorFactory.createSendSignalBuilder => [
			it.variable = targetDescriptor
			it.signal = signalDescriptor
			it.isInternal = isInternal
		]).build
		
		builder.append('''«descriptor.stringRepresentation»;''')
		logger.logVisitingFinished(st,builder.toString)
		builder.toString
	}
	
	def dispatch String visit(SwitchStatement st){
		logger.logVisitingStarted(st)
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
		logger.logVisitingFinished(st)
		builder.toString
	} 
	
	def dispatch String visit(WhileStatement st){
		logger.logVisitingStarted(st)
		val builder = new StringBuilder
		builder.append(st.serializeToTraceComment)
		val conditionString = createLoopVariable(st.condition, builder)
		val block = st.body 
		val parent = util.descriptorFactory
		
		builder.append('''while («conditionString») ''')
		util.descriptorFactory = parent.createChild
		logger.logUseChildDescrFactory
		builder.append('''{'''+StringConcatenation.DEFAULT_LINE_DELIMITER)
		if(block instanceof Block){
			block.statement.forEach[ statement |
				builder.append(statement.visit+StringConcatenation.DEFAULT_LINE_DELIMITER)
	    	]
	    	if(st.condition.isFlatteningNeeded) {
	    		val blockConditionString = updateLoopVariable(st.condition, builder)
	    		builder.append('''«conditionString» = «blockConditionString»;
	    		''')
	    	}
			
		}else{	
			builder.append(st.body.visit)
			if(st.condition.isFlatteningNeeded) {
				val blockConditionString = updateLoopVariable(st.condition, builder)
				builder.append('''«conditionString» = «blockConditionString»;
				''')
			}
		}
		builder.append('''}''')
		util.descriptorFactory = parent
		logger.logUseParentDescrFactory
		logger.logVisitingFinished(st)
		builder.toString				
	} 
	
	def dispatch String visit(DoStatement st){
		logger.logVisitingStarted(st)
		val builder = new StringBuilder
		val conditionString = createLoopVariable(st.condition, builder)
		val block = st.body 
		val parent = util.descriptorFactory
		
		builder.append(st.serializeToTraceComment)
		builder.append('''do ''')
		util.descriptorFactory = parent.createChild
		logger.logUseChildDescrFactory
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
		logger.logUseParentDescrFactory
		builder.append('''while («conditionString»);''')
		logger.logVisitingFinished(st)
		builder.toString
	} 
	
	def dispatch String visit(ForStatement st){
		logger.logVisitingStarted(st)
		val builder = new StringBuilder
		
		val block = st.body 
		val parent = util.descriptorFactory
		
		util.descriptorFactory = parent.createChild
		logger.logUseChildDescrFactory
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
		logger.logUseParentDescrFactory
		logger.logVisitingFinished(st)
		builder.toString
	}
	
	def dispatch String visit(ForEachStatement st){
		logger.logVisitingStarted(st)
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
		logger.logVisitingFinished(st)
		builder.toString
	}
	
	private def dispatch String visitClause(IfClause nfc, StringBuilder builder){
		logger.logVisitingStarted(nfc)
		builder.append(nfc.serializeToTraceComment)
		val conditionDescriptor = nfc.condition.visit(builder)
		
		val ret = '''(«conditionDescriptor.stringRepresentation») «nfc.body.visit»'''
		logger.logVisitingFinished(nfc)
		ret
	} 
	
	private def dispatch String visitClause(SwitchClause st, StringBuilder builder){
		logger.logVisitingStarted(st)
		val casesBuilder = new StringBuilder
		
		st.^case.forEach[ expr |
    		casesBuilder.append(expr.visit(builder).stringRepresentation)
    	]
    	logger.logVisitingFinished(st)
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