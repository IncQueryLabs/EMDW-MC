package com.incquerylabs.uml.ralf.snippetcompiler

import com.incquerylabs.emdw.cpp.common.descriptor.factory.IUmlDescriptorFactory
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
	extension IUmlDescriptorFactory descriptorFactory
	
	new(ReducedAlfSnippetTemplateCompiler compiler){
		this.compiler = compiler
		descriptorFactory = compiler.util.descriptorFactory
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
		val parent = descriptorFactory
		descriptorFactory = parent.createChild
		val snippet = createCompositeSnippet => [ f | 
				f.snippet.add = createStringSnippet => [value = '''{''']
				f.snippet.add = createStringSnippet => [value = '\n']
				//f.snippet.add = createStringSnippet => [value = '\t']
				block.statement.forEach[
    				f.snippet.add(visit)
    				f.snippet.add(createStringSnippet => [value = '\n'])
    				//f.snippet.add = createStringSnippet => [value = '\t']
    			]
    			//f.snippet.remove(f.snippet.size-1)
    			f.snippet.remove(f.snippet.size-1)
    			f.snippet.add(createStringSnippet => [value = '\n'])
				f.snippet.add = createStringSnippet => [value = '''}''']
		]
		descriptorFactory = parent
		snippet
	} 
	
	def dispatch Snippet visit(BreakStatement st){
		createStringSnippet => [value = '''break;''']
	} 
	
	def dispatch Snippet visit(ReturnStatement st){
		createCompositeSnippet =>[
			snippet.add(createStringSnippet => [value = '''return '''])
			snippet.add(st.expression.visit)
			snippet.add(createStringSnippet => [value = ''';'''])
		]
	} 
	
	def dispatch Snippet visit(LocalNameDeclarationStatement st){
		val descriptor = (descriptorFactory.createSingleValueDescriptorBuilder => [
			name = st.variable.name
			type = st.variable.type.type
		]).build
		createCompositeSnippet =>[
			snippet.add(createStringSnippet => [value = descriptor.valueType])
			snippet.add(createStringSnippet => [value = ''' '''])
			snippet.add(createStringSnippet => [value = descriptor.stringRepresentation])
			snippet.add(createStringSnippet => [value = ''' = '''])
			snippet.add(st.expression.visit)
			snippet.add(createStringSnippet => [value = ''';'''])
		]
	}
	
	def dispatch Snippet visit(IfStatement st){
		createCompositeSnippet => [ f | 
				st.nonFinalClauses.forEach[ clause |
					if(st.nonFinalClauses.indexOf(clause) == 0){
						f.snippet.add(createStringSnippet => [value = '''if '''])
						f.snippet.add(clause.visit)
					}else {
						f.snippet.add(createStringSnippet => [value = ''' else if '''])
						f.snippet.add(clause.visit)
					}
    			]
    			if(st.finalClause != null){
    				f.snippet.add(createStringSnippet => [value = ''' else '''])
    				f.snippet.add(st.finalClause.visit)	
    			}
		]
	}
	
	 	
	
	def dispatch Snippet visit(SendSignalStatement st){
		createCompositeSnippet =>[
			snippet.add(st.target.visit)
			snippet.add(createStringSnippet => [value = '''->generate_event('''])
			snippet.add(st.signal.visit)
			snippet.add(createStringSnippet => [value = ''');'''])
		]
	}
	
	def dispatch Snippet visit(SwitchStatement st){
		createCompositeSnippet => [ f |
				f.snippet.add = createStringSnippet => [value = '''switch ''']
				f.snippet.add = createStringSnippet => [value = '''(''']
				f.snippet.add(st.expression.visit)
				f.snippet.add = createStringSnippet => [value = ''') ''']
				f.snippet.add = createStringSnippet => [value = '''{''']
				f.snippet.add(createStringSnippet => [value = '\n'])
				st.nonDefaultClause.forEach[cl |
					f.snippet.add(cl.visit)
					f.snippet.add(createStringSnippet => [value = '\n'])
    			]
    			if(st.defaultClause != null){
    				f.snippet.add = createStringSnippet => [value = '''default : ''']
    				f.snippet.add(st.defaultClause.visit)
    				f.snippet.add(createStringSnippet => [value = '\n'])
    			}
				f.snippet.add = createStringSnippet => [value = '''}''']
				
		]
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