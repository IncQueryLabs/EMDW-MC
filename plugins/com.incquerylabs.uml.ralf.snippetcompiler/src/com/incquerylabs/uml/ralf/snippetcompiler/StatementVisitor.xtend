package com.incquerylabs.uml.ralf.snippetcompiler

import com.incquerylabs.uml.ralf.reducedAlfLanguage.Block
import com.incquerylabs.uml.ralf.reducedAlfLanguage.BreakStatement
import com.incquerylabs.uml.ralf.reducedAlfLanguage.DoStatement
import com.incquerylabs.uml.ralf.reducedAlfLanguage.EmptyStatement
import com.incquerylabs.uml.ralf.reducedAlfLanguage.ExpressionStatement
import com.incquerylabs.uml.ralf.reducedAlfLanguage.ForStatement
import com.incquerylabs.uml.ralf.reducedAlfLanguage.IfClause
import com.incquerylabs.uml.ralf.reducedAlfLanguage.IfStatement
import com.incquerylabs.uml.ralf.reducedAlfLanguage.LocalNameDeclarationStatement
import com.incquerylabs.uml.ralf.reducedAlfLanguage.ReturnStatement
import com.incquerylabs.uml.ralf.reducedAlfLanguage.SendSignalStatement
import com.incquerylabs.uml.ralf.reducedAlfLanguage.SwitchClause
import com.incquerylabs.uml.ralf.reducedAlfLanguage.SwitchStatement
import com.incquerylabs.uml.ralf.reducedAlfLanguage.WhileStatement
import snippetTemplate.CompositeSnippet
import snippetTemplate.Snippet
import snippetTemplate.SnippetTemplateFactory

class StatementVisitor {
	extension SnippetTemplateFactory factory = SnippetTemplateFactory.eINSTANCE
	extension ReducedAlfSnippetTemplateCompiler compiler
	extension SnippetTemplateCompilerUtil util
	extension ExpressionVisitor expressionVisitor
	
	new(ReducedAlfSnippetTemplateCompiler compiler, SnippetTemplateCompilerUtil util, ExpressionVisitor expressionVisitor){
		this.compiler = compiler
		this.expressionVisitor = expressionVisitor
		this.util = util
	}
	
	def dispatch Snippet visit(EmptyStatement st){
		createStringSnippet => [value = ''';''']
	}
	
	def dispatch Snippet visit(ExpressionStatement st){
		val composite = createCompositeSnippet
		val expressionsnippet = st.expression.visit(composite)
		composite.snippet.add(expressionsnippet)
		composite.snippet.add(createStringSnippet => [value = ''';'''	])
		composite		
	} 
	
	def dispatch Snippet visit(Block block){
		val parent = util.descriptorFactory
		util.descriptorFactory = parent.createChild
		val snippet = createCompositeSnippet => [ f | 
				f.snippet.add = createStringSnippet => [value = '''{''']
				f.snippet.add = createStringSnippet => [value = '\n']
				block.statement.forEach[ st |
					f.snippet.add = st.visit
    				f.snippet.add(createStringSnippet => [value = '\n'])
    			]
    			f.snippet.remove(f.snippet.size-1)
    			f.snippet.add(createStringSnippet => [value = '\n'])
				f.snippet.add = createStringSnippet => [value = '''}''']
		]
		util.descriptorFactory = parent
		snippet
	} 
	
	def dispatch Snippet visit(BreakStatement st){
		createStringSnippet => [value = '''break;''']
	} 
	
	def dispatch Snippet visit(ReturnStatement st){
		val composite = createCompositeSnippet
		val expressionsnippet = st.expression.visit(composite)
		composite.snippet.add(createStringSnippet => [value = '''return '''])
		composite.snippet.add(expressionsnippet)
		composite.snippet.add(createStringSnippet => [value = ''';'''])
		composite
	} 
	
	def dispatch Snippet visit(LocalNameDeclarationStatement st){		
		val composite = createCompositeSnippet
		val descriptor = getDescriptor(st)
		var Snippet expressionsnippet
		
		if(st.expression != null){
			expressionsnippet = st.expression.visit(composite)
		} else{
			expressionsnippet = createStringSnippet
		}
		
		val snippetData = new StringBuilder("")
		
		snippetData.append(descriptor.fullType)
		snippetData.append(''' ''')
		snippetData.append(descriptor.stringRepresentation)
		
		if(st.expression != null){
			snippetData.append(''' = ''')
		} 
		
		composite.snippet.add(createStringSnippet => [value = snippetData.toString])
		composite.snippet.add(expressionsnippet)
		composite.snippet.add(createStringSnippet => [value = ''';'''])
		composite		
	}
	
	def dispatch Snippet visit(IfStatement st){
		val composite = createCompositeSnippet
		val ifSnippets = createCompositeSnippet
		st.clauses.forEach[ clause |
			if(st.clauses.indexOf(clause) == 0){
				ifSnippets.snippet.add(createStringSnippet => [value = '''if '''])
				ifSnippets.snippet.add(clause.visitClause(composite))
			} else if (clause == st.clauses.last) {
				ifSnippets.snippet.add(createStringSnippet => [value = ''' else '''])
				ifSnippets.snippet.add(clause.visitClause(composite))	
			} else {
				ifSnippets.snippet.add(createStringSnippet => [value = ''' else if '''])
				ifSnippets.snippet.add(clause.visitClause(composite))
			}
		]
		composite.snippet.add(ifSnippets)
		composite
	}
	
	def dispatch Snippet visit(SendSignalStatement st){
		val composite = createCompositeSnippet
		val targetSnippet = st.target.visit(composite) 		
		val signalSnippet = st.signal.visit(composite) 
		
		composite.snippet.add(targetSnippet)
		composite.snippet.add(createStringSnippet => [value = '''->generate_event('''])
		composite.snippet.add(signalSnippet)
		composite.snippet.add(createStringSnippet => [value = ''');'''])
		composite
	}
	
	def dispatch Snippet visit(SwitchStatement st){
		val composite = createCompositeSnippet
		val expressionSnippet = st.expression.visit(composite)
		val clausesSnippet = createCompositeSnippet
		st.nonDefaultClause.forEach[cl |
			clausesSnippet.snippet.add(cl.visitClause(composite))
			clausesSnippet.snippet.add(createStringSnippet => [value = '\n'])
		]

		composite.snippet.add = createStringSnippet => [value = '''switch (''']
		composite.snippet.add = expressionSnippet
		composite.snippet.add = createStringSnippet => [value = ''') {'''+'\n']
		composite.snippet.add = clausesSnippet
		if(st.defaultClause != null){
			composite.snippet.add = createStringSnippet => [value = '''default : ''']
			composite.snippet.add(st.defaultClause.visit)
			composite.snippet.add(createStringSnippet => [value = '\n'])
		}
		composite.snippet.add = createStringSnippet => [value = '''}''']
		composite
	} 
	
	def dispatch Snippet visit(WhileStatement st){
		val composite = createCompositeSnippet
		val conditionSnippet = st.condition.visit(composite)
		
		val parent = util.descriptorFactory
		
		composite.snippet.add = createStringSnippet => [value = '''while (''']
		composite.snippet.add(conditionSnippet)
		composite.snippet.add = createStringSnippet => [value = ''') ''']
		util.descriptorFactory = parent.createChild
		composite.snippet.add(createStringSnippet => [value = '''{'''])
		composite.snippet.add = createStringSnippet => [value = '\n']
		if(st.body instanceof Block){
			val block = st.body as Block
			
			block.statement.forEach[ statement |
				composite.snippet.add = statement.visit
				composite.snippet.add(createStringSnippet => [value = '\n'])
	    	]
	    	val blockConditionSnippet = st.condition.visit(composite)
			composite.snippet.add = createStringSnippet => [value = '\n']
			composite.snippet.add(conditionSnippet)
			composite.snippet.add(createStringSnippet => [value = ''' = '''])
			composite.snippet.add(blockConditionSnippet)
			composite.snippet.add = createStringSnippet => [value = ''';''']
			
		}else{	
			composite.snippet.add(st.body.visit)
			val blockConditionSnippet = st.condition.visit(composite)
			composite.snippet.add = createStringSnippet => [value = '\n']
			composite.snippet.add(conditionSnippet)
			composite.snippet.add(createStringSnippet => [value = ''' = '''])
			composite.snippet.add(blockConditionSnippet)
			composite.snippet.add = createStringSnippet => [value = ''';''']
			
		}
		composite.snippet.add = createStringSnippet => [value = '\n']
		composite.snippet.add(createStringSnippet => [value = '''}'''])
		util.descriptorFactory = parent
		composite				
	} 

	def dispatch Snippet visit(DoStatement st){
		val composite = createCompositeSnippet
		val conditionSnippet = st.condition.visit(composite)
		
		val parent = util.descriptorFactory
		
		composite.snippet.add = createStringSnippet => [value = '''do ''']
		
		util.descriptorFactory = parent.createChild
		composite.snippet.add(createStringSnippet => [value = '''{'''])
		composite.snippet.add = createStringSnippet => [value = '\n']
		if(st.body instanceof Block){
			val block = st.body as Block
			
			block.statement.forEach[ statement |
				composite.snippet.add = statement.visit
				composite.snippet.add(createStringSnippet => [value = '\n'])
	    	]
	    	val blockConditionSnippet = st.condition.visit(composite)
			composite.snippet.add = createStringSnippet => [value = '\n']
			composite.snippet.add(conditionSnippet)
			composite.snippet.add(createStringSnippet => [value = ''' = '''])
			composite.snippet.add(blockConditionSnippet)
			composite.snippet.add = createStringSnippet => [value = ''';''']
			
		}else{	
			composite.snippet.add(st.body.visit)
			val blockConditionSnippet = st.condition.visit(composite)
			composite.snippet.add = createStringSnippet => [value = '\n']
			composite.snippet.add(conditionSnippet)
			composite.snippet.add(createStringSnippet => [value = ''' = '''])
			composite.snippet.add(blockConditionSnippet)
			composite.snippet.add = createStringSnippet => [value = ''';''']
			
		}
		composite.snippet.add = createStringSnippet => [value = '\n']
		composite.snippet.add(createStringSnippet => [value = '''}'''])
		util.descriptorFactory = parent
		
		composite.snippet.add = createStringSnippet => [value = '''while (''']
		composite.snippet.add(conditionSnippet)
		composite.snippet.add = createStringSnippet => [value = ''');''']
		
		composite
	} 
	
	def dispatch Snippet visit(ForStatement st){
		val forSnippet = createCompositeSnippet
		
		val parent = util.descriptorFactory
		util.descriptorFactory = parent.createChild
		
		forSnippet.snippet.add = createStringSnippet => [value = '''{'''+'\n']
		forSnippet.snippet.add = st.initialization.visit
		val conditionSnippet = st.condition.visit(forSnippet)
		
		forSnippet.snippet.add = createStringSnippet => [value = '''while (''']
		forSnippet.snippet.add(conditionSnippet)
		forSnippet.snippet.add = createStringSnippet => [value = ''') {'''+'\n']
		if(st.body instanceof Block){
			val block = st.body as Block
			
			block.statement.forEach[ statement |
				forSnippet.snippet.add = statement.visit
				forSnippet.snippet.add(createStringSnippet => [value = '\n'])
	    	]
	    	forSnippet.snippet.add(st.update.visit)
			forSnippet.snippet.add = createStringSnippet => [value = '\n']
	    	val blockConditionSnippet = st.condition.visit(forSnippet)
			forSnippet.snippet.add = createStringSnippet => [value = '\n']
			forSnippet.snippet.add(conditionSnippet)
			forSnippet.snippet.add(createStringSnippet => [value = ''' = '''])
			forSnippet.snippet.add(blockConditionSnippet)
			forSnippet.snippet.add = createStringSnippet => [value = ''';''']
			
		}else{	
			forSnippet.snippet.add(st.body.visit)
			forSnippet.snippet.add(st.update.visit)
			forSnippet.snippet.add = createStringSnippet => [value = '\n']
			val blockConditionSnippet = st.condition.visit(forSnippet)
			forSnippet.snippet.add = createStringSnippet => [value = '\n']
			forSnippet.snippet.add(conditionSnippet)
			forSnippet.snippet.add(createStringSnippet => [value = ''' = '''])
			forSnippet.snippet.add(blockConditionSnippet)
			forSnippet.snippet.add = createStringSnippet => [value = ''';''']
			
		}
		forSnippet.snippet.add = createStringSnippet => [value = '\n'+'''}''']
		forSnippet.snippet.add(createStringSnippet => [value = '\n'+'''}'''])

		util.descriptorFactory = parent
		forSnippet
	}
	
	private def dispatch Snippet visitClause(IfClause nfc, CompositeSnippet composite){
		val clauseSnippet = createCompositeSnippet
		val conditionSnippet = nfc.condition.visit(composite)
		
		clauseSnippet.snippet.add(createStringSnippet => [value = '''('''])
		clauseSnippet.snippet.add(conditionSnippet)
		clauseSnippet.snippet.add(createStringSnippet => [value = ''') '''])
		clauseSnippet.snippet.add(nfc.body.visit)
		clauseSnippet
	} 
	
	private def dispatch Snippet visitClause(SwitchClause st, CompositeSnippet composite){
		val casesSnippet = createCompositeSnippet
		val clauseSnippet = createCompositeSnippet
		st.^case.forEach[ expr |
    		casesSnippet.snippet.add(expr.visit(composite))
    	]
		clauseSnippet.snippet.add = createStringSnippet => [value = '''case ''']
		clauseSnippet.snippet.add = casesSnippet
		clauseSnippet.snippet.add = createStringSnippet => [value = ''' : ''']
		clauseSnippet.snippet.add = st.block.visit
		clauseSnippet	
	}
}