package com.incquerylabs.uml.ralf.snippetcompiler

import com.google.common.collect.Lists
import com.incquerylabs.emdw.cpp.common.descriptor.factory.IUmlDescriptorFactory
import com.incquerylabs.emdw.valuedescriptor.ValueDescriptor
import com.incquerylabs.uml.ralf.reducedAlfLanguage.AssignmentExpression
import com.incquerylabs.uml.ralf.reducedAlfLanguage.Expression
import com.incquerylabs.uml.ralf.reducedAlfLanguage.ExpressionList
import com.incquerylabs.uml.ralf.reducedAlfLanguage.ExpressionStatement
import com.incquerylabs.uml.ralf.reducedAlfLanguage.FeatureInvocationExpression
import com.incquerylabs.uml.ralf.reducedAlfLanguage.IfClause
import com.incquerylabs.uml.ralf.reducedAlfLanguage.LeftHandSide
import com.incquerylabs.uml.ralf.reducedAlfLanguage.LocalNameDeclarationStatement
import com.incquerylabs.uml.ralf.reducedAlfLanguage.NamedExpression
import com.incquerylabs.uml.ralf.reducedAlfLanguage.NamedTuple
import com.incquerylabs.uml.ralf.reducedAlfLanguage.Statement
import com.incquerylabs.uml.ralf.reducedAlfLanguage.Statements
import com.incquerylabs.uml.ralf.reducedAlfLanguage.SwitchClause
import com.incquerylabs.uml.ralf.scoping.IUMLContextProvider
import com.incquerylabs.uml.ralf.snippetcompiler.ReducedAlfFlattener.FlattenedVariable
import java.util.List
import org.eclipse.emf.ecore.EObject
import org.eclipse.uml2.uml.Operation
import snippetTemplate.CompositeSnippet
import snippetTemplate.Snippet
import snippetTemplate.SnippetTemplateFactory
import com.incquerylabs.uml.ralf.reducedAlfLanguage.InstanceCreationExpression

class ReducedAlfSnippetTemplateCompiler {
	
	public extension SnippetTemplateFactory factory = SnippetTemplateFactory.eINSTANCE
	public extension ReducedAlfFlattener flattener
		
	public extension SnippetTemplateCompilerUtil util
	public ExpressionVisitor expressionVisitor
	public StatementVisitor statementVisitor
	
	IUMLContextProvider context
		
	new(IUmlDescriptorFactory factory, IUMLContextProvider umlcontext){
		util = new SnippetTemplateCompilerUtil(factory, umlcontext)
		context = umlcontext
		flattener = new ReducedAlfFlattener(util)
		statementVisitor = new StatementVisitor(this, flattener)
		expressionVisitor = new ExpressionVisitor(this)
	}

	def dispatch Snippet visit(EObject o) {
		val fragment = createCompositeSnippet
		o.eContents.forEach[fragment.snippet.add(visit)]
		return fragment
	}

    def dispatch Snippet visit(Statements st){
		createCompositeSnippet => [ f | 
			st.statement.forEach[ statement |
				flattenChildStatement(statement,f)
				f.snippet.add(createStringSnippet => [value = '\n'])
			]
			f.snippet.remove(f.snippet.size-1)
		]
	}
	
	def dispatch Snippet visit(Statement st){
		statementVisitor.visit(st)
	}
	
	def dispatch Snippet visit(Expression ex){
		expressionVisitor.visit(ex)
	}
	
	def dispatch Snippet visit(ExpressionList tuple){
		createCompositeSnippet => [ f | 
			f.snippet.add = createStringSnippet => [value = '''(''']
			if(tuple.expressions!= null && !tuple.expressions.isEmpty){
				tuple.expressions.forEach[
					f.snippet.add(visit)
					f.snippet.add(createStringSnippet => [value = ''', '''])
				]
				f.snippet.remove(f.snippet.size-1)
			}
			f.snippet.add = createStringSnippet => [value = ''')''']
		]
	}
	

	
	def dispatch Snippet visit(NamedTuple tuple){
		createCompositeSnippet => [ f | 
				f.snippet.add = createStringSnippet => [value = '''(''']
				if(tuple.expressions!= null && !tuple.expressions.isEmpty){
					tuple.expressions.forEach[
						f.snippet.add(visit)
						f.snippet.add(createStringSnippet => [value = ''', '''])
	    			]
	    			f.snippet.remove(f.snippet.size-1)
    			}
				f.snippet.add = createStringSnippet => [value = ''')''']
		]
	}
	
	def dispatch Snippet visit(LeftHandSide lhs){
		createCompositeSnippet =>[
			snippet.add(lhs.expression.visit)
		]
	}
	
	def dispatch Snippet visit(NamedExpression ex){
		createCompositeSnippet =>[
			snippet.add(createStringSnippet => [
					value = ex.name
			])
			snippet.add(createStringSnippet => [value = ''' => '''])
			snippet.add(ex.expression.visit)
			
		]
	}
	
	def dispatch Snippet visit(IfClause nfc){
		createCompositeSnippet =>[
			snippet.add(createStringSnippet => [value = '''('''])
			snippet.add(nfc.condition.visit)
			snippet.add(createStringSnippet => [value = ''') '''])
			snippet.add(nfc.body.visit)
		]
	} 
	
	def dispatch Snippet visit(SwitchClause st){
		createCompositeSnippet => [ f |
			f.snippet.add = createStringSnippet => [value = '''case ''']
			st.^case.forEach[
    			f.snippet.add(visit)
    		]
    		f.snippet.add = createStringSnippet => [value = ''' : ''']
    		f.snippet.add(st.block.visit)	
		]
	}
	
	public def flattenChildStatement(Statement statement, CompositeSnippet f){
		//Flatten statements if necessary
		if(statement instanceof LocalNameDeclarationStatement){
				val descriptor = getDescriptor(statement)
				
				if(statement.expression == null ){
					f.snippet.add = createCompositeSnippet =>[
						snippet.add(createStringSnippet => [value = descriptor.fullType])
						snippet.add(createStringSnippet => [value = ''' '''])
						snippet.add(createStringSnippet => [value = descriptor.stringRepresentation])
						snippet.add(createStringSnippet => [value = ''';'''])
					]
				}else if(statement.expression.flatteningNotNeeded){
					f.snippet.add = createCompositeSnippet =>[
						snippet.add(createStringSnippet => [value = descriptor.fullType])
						snippet.add(createStringSnippet => [value = ''' '''])
						snippet.add(createStringSnippet => [value = descriptor.stringRepresentation])
						snippet.add(createStringSnippet => [value = ''' = '''])
						snippet.add(statement.expression.visit)
						snippet.add(createStringSnippet => [value = ''';'''])
					]
				
				}else if(statement.expression instanceof InstanceCreationExpression){
					val instance = statement.expression as InstanceCreationExpression
					val List<FlattenedVariable> flattenedParameters = Lists.newArrayList
					if(instance.parameters instanceof ExpressionList){
						val parameters = instance.parameters as ExpressionList
						parameters.expressions.forEach[ expr |
							flattenedParameters.add(flattenChildExpression(expr, f))
						]
					}else{
						throw new UnsupportedOperationException("Only expression list based tuples are supported")
					}
					
					val variableDescriptor = (descriptorFactory.createSingleVariableDescriptorBuilder => [
						type = instance.instance
						name = null
						isExistingVariable = true
					]).build
					
					
					f.snippet.add = createCompositeSnippet =>[
						snippet.add(createStringSnippet => [value = descriptor.fullType])
						snippet.add(createStringSnippet => [value = ''' '''])
						snippet.add(createStringSnippet => [value = descriptor.stringRepresentation])
						snippet.add(createStringSnippet => [value = ''' = '''])
						snippet.add(createStringSnippet => [value = '''new '''])
						snippet.add(createStringSnippet => [value = variableDescriptor.fullType])
						snippet.add(createStringSnippet => [value = '''('''])
						if(flattenedParameters!= null && !flattenedParameters.isEmpty){
							flattenedParameters.forEach[ variable |
								snippet.add(createStringSnippet => [value = variable.descriptor.stringRepresentation])
								snippet.add(createStringSnippet => [value = ''', '''])
							]
							snippet.remove(snippet.size-1)
						}
						snippet.add(createStringSnippet => [value = ''')'''])
						snippet.add(createStringSnippet => [value = ''';'''])
					]

					
				}else{
					if(statement.expression instanceof AssignmentExpression){
						val assignment = statement.expression as AssignmentExpression
						
						if(assignment.leftHandSide instanceof FeatureInvocationExpression) {
							val lhsDescriptor = getDescriptor(assignment)
							f.snippet.add = createCompositeSnippet =>[
								snippet.add(createStringSnippet => [value = lhsDescriptor.stringRepresentation])
							]
						} else {
							val lhsVariable = flattenChildExpression(assignment.leftHandSide, f) 
							val rhsVariable = flattenChildExpression(assignment.rightHandSide, f)
																
							//If assignment has no property on the left hand side
							f.snippet.add = createCompositeSnippet =>[
								snippet.add(createStringSnippet => [value = lhsVariable.descriptor.stringRepresentation])
								snippet.add(createStringSnippet => [value = ''' '''	])
								snippet.add(createStringSnippet => [value = assignment.operator.literal])
								snippet.add(createStringSnippet => [value = ''' '''	])
								snippet.add(createStringSnippet => [value = rhsVariable.descriptor.stringRepresentation])
								snippet.add(createStringSnippet => [value = ''';'''])
							]
						}
						
					}else if(statement.expression.flatteningSupported){
						val snippet = createCompositeSnippet			
						val variable = flatten(statement.expression, snippet)
						
						snippet.snippet.add(createCompositeSnippet =>[ s |
							s.snippet.add(createStringSnippet => [value = descriptor.fullType])
							s.snippet.add(createStringSnippet => [value = ''' '''])
							s.snippet.add(createStringSnippet => [value = descriptor.stringRepresentation])
							s.snippet.add(createStringSnippet => [value = ''' = '''])
							s.snippet.add(createStringSnippet => [value = variable.descriptor.stringRepresentation])
							s.snippet.add(createStringSnippet => [value = ''';'''])
						])
						f.snippet.add = snippet
					}else{
						throw new UnsupportedOperationException
					}
				}
			} else if(statement instanceof ExpressionStatement){
				val ex = statement.expression
				if(ex instanceof AssignmentExpression){
					val lhsExpression = ex.leftHandSide
					var Snippet rhsSnippet
					var Snippet lhsSnippet
					val snippet = createCompositeSnippet
					
					if(lhsExpression instanceof FeatureInvocationExpression){
						lhsSnippet = createStringSnippet => [value = getDescriptor(lhsExpression).stringRepresentation]
					}else{
						lhsSnippet = ex.leftHandSide.visit
					}
					
					
					if(ex.rightHandSide instanceof InstanceCreationExpression){
						val instance = ex.rightHandSide as InstanceCreationExpression
						val List<FlattenedVariable> flattenedParameters = Lists.newArrayList
						if(instance.parameters instanceof ExpressionList){
							val parameters = instance.parameters as ExpressionList
							parameters.expressions.forEach[ expr |
								flattenedParameters.add(flattenChildExpression(expr, f))
							]
						}else{
							throw new UnsupportedOperationException("Only expression list based tuples are supported")
						}
						
						val variableDescriptor = (descriptorFactory.createSingleVariableDescriptorBuilder => [
							type = instance.instance
							name = null
							isExistingVariable = true
						]).build
						
						
						rhsSnippet = createCompositeSnippet =>[ s |
							s.snippet.add(createStringSnippet => [value = '''new '''])
							s.snippet.add(createStringSnippet => [value = variableDescriptor.fullType])
							s.snippet.add(createStringSnippet => [value = '''('''])
							if(flattenedParameters!= null && !flattenedParameters.isEmpty){
								flattenedParameters.forEach[ variable |
									s.snippet.add(createStringSnippet => [value = variable.descriptor.stringRepresentation])
									s.snippet.add(createStringSnippet => [value = ''', '''])
								]
								s.snippet.remove(s.snippet.size-1)
							}
							s.snippet.add(createStringSnippet => [value = ''')'''])
							s.snippet.add(createStringSnippet => [value = ''';'''])
						]
	
						
					}else if(ex.rightHandSide.flatteningNotNeeded){
						rhsSnippet = ex.rightHandSide.visit
					}else{
						if(ex.rightHandSide.flatteningSupported){			
							val variable = flatten(ex.rightHandSide, snippet)
							rhsSnippet = createStringSnippet => [value = variable.descriptor.stringRepresentation]
						}else{
							throw new UnsupportedOperationException
						}
					}
					
					val rhs = rhsSnippet
					val lhs = lhsSnippet
					snippet.snippet.add(createCompositeSnippet =>[ s |
							s.snippet.add(lhs)
							s.snippet.add(createStringSnippet => [value = ''' '''	])
							s.snippet.add(createStringSnippet => [value = ex.operator.literal])
							s.snippet.add(createStringSnippet => [value = ''' '''	])
							s.snippet.add(rhs)
							s.snippet.add(createStringSnippet => [value = ''';'''])
					])
					f.snippet.add = snippet
				}else if(ex instanceof FeatureInvocationExpression){
					if(ex.feature instanceof Operation){
						val contextVariable = flattenChildExpression(ex.context, f)
						val List<FlattenedVariable> flattenedParameters = Lists.newArrayList
						
						if(ex.parameters instanceof ExpressionList){
							val parameters = ex.parameters as ExpressionList
							parameters.expressions.forEach[ expr |
								flattenedParameters.add(flattenChildExpression(expr, f))
							]
						}else{
							throw new UnsupportedOperationException("Only expression list based tuples are supported")
						}
						
						val List<ValueDescriptor> tupleDescriptors = Lists.newArrayList									
						val contextDescriptor = contextVariable.descriptor
						flattenedParameters.forEach[ p |
							tupleDescriptors.add(p.descriptor)
						]
						
						val descriptor = (descriptorFactory.createOperationCallBuilder => [
							variable = contextDescriptor
							operation = ex.feature as Operation
							parameters = tupleDescriptors
						]).build
						f.snippet.add = createCompositeSnippet => [
							snippet.add(createStringSnippet => [value = descriptor.stringRepresentation	])
							snippet.add(createStringSnippet => [value = ''';'''])
						]
					}else{
						f.snippet.add(statement.visit)
					}
				}else{
					f.snippet.add(statement.visit)
				}
			}else{
				f.snippet.add(statement.visit)
			}
	}
		
}