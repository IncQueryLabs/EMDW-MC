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
import com.incquerylabs.uml.ralf.reducedAlfLanguage.NameExpression
import com.incquerylabs.uml.ralf.reducedAlfLanguage.NamedExpression
import com.incquerylabs.uml.ralf.reducedAlfLanguage.NamedTuple
import com.incquerylabs.uml.ralf.reducedAlfLanguage.Statement
import com.incquerylabs.uml.ralf.reducedAlfLanguage.Statements
import com.incquerylabs.uml.ralf.reducedAlfLanguage.SwitchClause
import com.incquerylabs.uml.ralf.reducedAlfLanguage.ThisExpression
import com.incquerylabs.uml.ralf.reducedAlfLanguage.Variable
import com.incquerylabs.uml.ralf.scoping.IUMLContextProvider
import com.incquerylabs.uml.ralf.snippetcompiler.ReducedAlfFlattener.FlattenedVariable
import java.util.List
import org.eclipse.emf.ecore.EObject
import org.eclipse.uml2.uml.Operation
import org.eclipse.uml2.uml.Type
import snippetTemplate.Snippet
import snippetTemplate.SnippetTemplateFactory

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
				
				if(statement instanceof LocalNameDeclarationStatement){
						val descriptor = getDescriptor(statement)
						
						if(statement.expression == null ){
							f.snippet.add = createCompositeSnippet =>[
								snippet.add(createStringSnippet => [value = descriptor.fullType])
								snippet.add(createStringSnippet => [value = ''' '''])
								snippet.add(createStringSnippet => [value = descriptor.stringRepresentation])
								snippet.add(createStringSnippet => [value = ''';'''])
							]
						}else if(statement.expression.flatteningNotNeeded ){
							f.snippet.add = createCompositeSnippet =>[
								snippet.add(createStringSnippet => [value = descriptor.fullType])
								snippet.add(createStringSnippet => [value = ''' '''])
								snippet.add(createStringSnippet => [value = descriptor.stringRepresentation])
								snippet.add(createStringSnippet => [value = ''' = '''])
								snippet.add(statement.expression.visit)
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
									var FlattenedVariable lhsVariable 
									if(assignment.leftHandSide.flatteningNotNeeded){
										var Type type
										if(assignment.leftHandSide instanceof ThisExpression){
											type = context.thisType
										}else{
											val variable = (assignment.leftHandSide as NameExpression).reference as Variable
											type =  variable.type.type
										}
										lhsVariable = new FlattenedVariable(getDescriptor(assignment.leftHandSide), type)
									}else{
										lhsVariable = flatten(assignment.leftHandSide, f)
									}
									
									var FlattenedVariable rhsVariable 
									if(assignment.rightHandSide.flatteningNotNeeded){
										var Type type
										if(assignment.rightHandSide instanceof ThisExpression){
											type = context.thisType
										}else{
											val variable = (assignment.rightHandSide as NameExpression).reference as Variable
											type =  variable.type.type
										}
										rhsVariable = new FlattenedVariable(getDescriptor(assignment.rightHandSide), type)
									}else{
										rhsVariable = flatten(assignment.rightHandSide, f)
									}
									
									val lhsDescriptor = lhsVariable.descriptor
									val rhsDdescriptor = rhsVariable.descriptor
									
									//If assignment has no property on the left hand side
									f.snippet.add = createCompositeSnippet =>[
										snippet.add(createStringSnippet => [value = lhsDescriptor.stringRepresentation])
										snippet.add(createStringSnippet => [value = ''' '''	])
										snippet.add(createStringSnippet => [value = assignment.operator.literal])
										snippet.add(createStringSnippet => [value = ''' '''	])
										snippet.add(createStringSnippet => [value = rhsDdescriptor.stringRepresentation])
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
							
							if(ex.rightHandSide.flatteningNotNeeded){
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
								var FlattenedVariable contextVariable
								if(ex.context.flatteningNotNeeded){
									var Type type
									if(ex.context instanceof ThisExpression){
										type = context.thisType
									}else{
										val variable = (ex.context as NameExpression).reference as Variable
										type =  variable.type.type
									}
									contextVariable = new FlattenedVariable(getDescriptor(ex.context), type)
								}else{
									contextVariable = flatten(ex.context, f)
								}
									
								val List<FlattenedVariable> flattenedParameters = Lists.newArrayList
								if(ex.parameters instanceof ExpressionList){
									val parameters = ex.parameters as ExpressionList
									parameters.expressions.forEach[ expr |
										if(expr.flatteningNotNeeded){
											var Type type
											if(expr instanceof ThisExpression){
												type = context.thisType
											}else{
												val variable = (expr as NameExpression).reference as Variable
												type =  variable.type.type
											}
											flattenedParameters.add(new FlattenedVariable(getDescriptor(expr), type))
										}else{
											flattenedParameters.add(flatten(expr, f))
										}
									]
								}else if(ex.parameters instanceof NamedExpression){
									val parameters = ex.parameters as NamedExpression
									if(parameters.expression.flatteningNotNeeded){
											var Type type
											if(parameters.expression instanceof ThisExpression){
												type = context.thisType
											}else{
												val variable = (parameters.expression as NameExpression).reference as Variable
												type =  variable.type.type
											}
											flattenedParameters.add(new FlattenedVariable(getDescriptor(parameters.expression), type))
										}else{
											flattenedParameters.add(flatten(parameters.expression, f))
										}
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
	
//	def dispatch Snippet visit(NameLeftHandSide lhs){
//		createCompositeSnippet =>[
//			snippet.add(lhs.expression.visit)
//			if(lhs.index != null){
//				snippet.add(createStringSnippet => [
//					value = '''['''
//				])
//				snippet.add(lhs.index.visit)
//				snippet.add(createStringSnippet => [
//					value = ''']'''
//				])
//			}
//		]
//	}
	
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
		
}