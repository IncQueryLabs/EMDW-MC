package com.incquerylabs.uml.ralf.snippetcompiler

import com.incquerylabs.uml.ralf.reducedAlfLanguage.Block
import com.incquerylabs.uml.ralf.reducedAlfLanguage.BreakStatement
import com.incquerylabs.uml.ralf.reducedAlfLanguage.DoStatement
import com.incquerylabs.uml.ralf.reducedAlfLanguage.EmptyStatement
import com.incquerylabs.uml.ralf.reducedAlfLanguage.ExpressionStatement
import com.incquerylabs.uml.ralf.reducedAlfLanguage.ForStatement
import com.incquerylabs.uml.ralf.reducedAlfLanguage.IfStatement
import com.incquerylabs.uml.ralf.reducedAlfLanguage.LocalNameDeclarationStatement
import com.incquerylabs.uml.ralf.reducedAlfLanguage.ReturnStatement
import com.incquerylabs.uml.ralf.reducedAlfLanguage.SendSignalStatement
import com.incquerylabs.uml.ralf.reducedAlfLanguage.SwitchStatement
import com.incquerylabs.uml.ralf.reducedAlfLanguage.WhileStatement
import snippetTemplate.CompositeSnippet
import snippetTemplate.Snippet
import snippetTemplate.SnippetTemplateFactory

class StatementVisitor {
	extension SnippetTemplateFactory factory = SnippetTemplateFactory.eINSTANCE
	extension ReducedAlfSnippetTemplateCompiler compiler
	extension SnippetTemplateCompilerUtil util
	extension ReducedAlfFlattener flattener
	
	new(ReducedAlfSnippetTemplateCompiler compiler, ReducedAlfFlattener flattener){
		this.compiler = compiler
		this.flattener = flattener
		util = compiler.util
	}
	
	def dispatch Snippet visit(EmptyStatement st){
		createStringSnippet => [value = ''';''']
	}
	
	def dispatch Snippet visit(ExpressionStatement st){
		createCompositeSnippet => [
			snippet.add(st.expression.visit)
			snippet.add(createStringSnippet => [value = ''';'''	])
		]
	} 
	
	def dispatch Snippet visit(Block block){
		val parent = util.descriptorFactory
		util.descriptorFactory = parent.createChild
		val snippet = createCompositeSnippet => [ f | 
				f.snippet.add = createStringSnippet => [value = '''{''']
				f.snippet.add = createStringSnippet => [value = '\n']
				block.statement.forEach[ st |
					flattenChildStatement(st, f)	
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
		val snippet = createCompositeSnippet
		val returnVariable = flattenChildExpression(st.expression, snippet)

		snippet.snippet.add(createStringSnippet => [value = '''return '''])
		snippet.snippet.add(createStringSnippet => [value = returnVariable.descriptor.stringRepresentation])
		snippet.snippet.add(createStringSnippet => [value = ''';'''])
		snippet
	} 
	
	def dispatch Snippet visit(LocalNameDeclarationStatement st){
		val descriptor = getDescriptor(st)
		createCompositeSnippet =>[
			snippet.add(createStringSnippet => [value = descriptor.fullType])
			snippet.add(createStringSnippet => [value = ''' '''])
			snippet.add(createStringSnippet => [value = descriptor.stringRepresentation])
			snippet.add(createStringSnippet => [value = ''' = '''])
			snippet.add(st.expression.visit)
			snippet.add(createStringSnippet => [value = ''';'''])
		]
	}
	
	def dispatch Snippet visit(IfStatement st){
		createCompositeSnippet => [ f | 
				st.clauses.forEach[ clause |
					if(st.clauses.indexOf(clause) == 0){
						f.snippet.add(createStringSnippet => [value = '''if '''])
						f.snippet.add(clause.visit)
					} else if (clause == st.clauses.last) {
        				f.snippet.add(createStringSnippet => [value = ''' else '''])
        				f.snippet.add(clause.visit)	
					} else {
						f.snippet.add(createStringSnippet => [value = ''' else if '''])
						f.snippet.add(clause.visit)
					}
    			]
		]
	}
	
	def dispatch Snippet visit(SendSignalStatement st){
		val snippet = createCompositeSnippet
		val targetVariable = flattenChildExpression(st.target, snippet) 		
		val signalVariable = flattenChildExpression(st.signal, snippet) 
		
		snippet.snippet.add(createStringSnippet => [value = targetVariable.descriptor.stringRepresentation])
		snippet.snippet.add(createStringSnippet => [value = '''->generate_event('''])
		snippet.snippet.add(createStringSnippet => [value = signalVariable.descriptor.stringRepresentation])
		snippet.snippet.add(createStringSnippet => [value = ''');'''])
		snippet
	}
	
	def dispatch Snippet visit(SwitchStatement st){
		val snippet = createCompositeSnippet
		val switchVariable = flattenChildExpression(st.expression, snippet) 

		snippet.snippet.add = createStringSnippet => [value = '''switch ''']
		snippet.snippet.add = createStringSnippet => [value = '''(''']
		snippet.snippet.add(createStringSnippet => [value = switchVariable.descriptor.stringRepresentation])
		snippet.snippet.add = createStringSnippet => [value = ''') ''']
		snippet.snippet.add = createStringSnippet => [value = '''{''']
		snippet.snippet.add(createStringSnippet => [value = '\n'])
		st.nonDefaultClause.forEach[cl |
			snippet.snippet.add(cl.visit)
			snippet.snippet.add(createStringSnippet => [value = '\n'])
		]
		if(st.defaultClause != null){
			snippet.snippet.add = createStringSnippet => [value = '''default : ''']
			snippet.snippet.add(st.defaultClause.visit)
			snippet.snippet.add(createStringSnippet => [value = '\n'])
		}
		snippet.snippet.add = createStringSnippet => [value = '''}''']
		snippet
	} 
	
	def dispatch Snippet visit(WhileStatement st){
		createCompositeSnippet => [ f |
			f.snippet.add = createStringSnippet => [value = '''while ''']
			f.snippet.add = createStringSnippet => [value = '''(''']
			f.snippet.add(st.condition.visit)
			f.snippet.add = createStringSnippet => [value = ''') ''']
			f.snippet.add(st.body.visit)				
		]
	} 

	def dispatch Snippet visit(DoStatement st){
		createCompositeSnippet => [ f |
			f.snippet.add = createStringSnippet => [value = '''do ''']
			f.snippet.add(st.body.visit)
			f.snippet.add = createStringSnippet => [value = '''while ''']
			f.snippet.add = createStringSnippet => [value = '''(''']
			f.snippet.add(st.condition.visit)
			f.snippet.add = createStringSnippet => [value = ''');''']
		]
	} 
	
	def dispatch Snippet visit(ForStatement st){
		createCompositeSnippet => [ f |
			f.snippet.add = createStringSnippet => [value = '''for ''']
			f.snippet.add = createStringSnippet => [value = '''(''']
			f.snippet.add(st.initialization.visit)
			f.snippet.add = createStringSnippet => [value = ''' ''']
			f.snippet.add(st.condition.visit)
			f.snippet.add = createStringSnippet => [value = '''; ''']
			f.snippet.add(st.update.visit)
			
			val updatesnippet = f.snippet.get(f.snippet.size-1) as CompositeSnippet
			if(updatesnippet != null){
				updatesnippet.snippet.remove(updatesnippet.snippet.size-1)
			}
			
			f.snippet.add = createStringSnippet => [value = ''') ''']
			f.snippet.add(st.body.visit)
		]
	}
}