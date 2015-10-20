package com.incquerylabs.uml.ralf.snippetcompiler

import com.google.common.base.Preconditions
import com.google.common.collect.Lists
import com.incquerylabs.emdw.valuedescriptor.ValueDescriptor
import com.incquerylabs.uml.ralf.ReducedAlfSystem
import com.incquerylabs.uml.ralf.reducedAlfLanguage.ArithmeticExpression
import com.incquerylabs.uml.ralf.reducedAlfLanguage.AssignmentExpression
import com.incquerylabs.uml.ralf.reducedAlfLanguage.AssociationAccessExpression
import com.incquerylabs.uml.ralf.reducedAlfLanguage.BitStringUnaryExpression
import com.incquerylabs.uml.ralf.reducedAlfLanguage.BlockStatement
import com.incquerylabs.uml.ralf.reducedAlfLanguage.BooleanLiteralExpression
import com.incquerylabs.uml.ralf.reducedAlfLanguage.BooleanUnaryExpression
import com.incquerylabs.uml.ralf.reducedAlfLanguage.CastExpression
import com.incquerylabs.uml.ralf.reducedAlfLanguage.ClassExtentExpression
import com.incquerylabs.uml.ralf.reducedAlfLanguage.CollectionLiteralExpression
import com.incquerylabs.uml.ralf.reducedAlfLanguage.CollectionType
import com.incquerylabs.uml.ralf.reducedAlfLanguage.CollectionVariable
import com.incquerylabs.uml.ralf.reducedAlfLanguage.ConditionalLogicalExpression
import com.incquerylabs.uml.ralf.reducedAlfLanguage.ConditionalTestExpression
import com.incquerylabs.uml.ralf.reducedAlfLanguage.DoStatement
import com.incquerylabs.uml.ralf.reducedAlfLanguage.ElementCollectionExpression
import com.incquerylabs.uml.ralf.reducedAlfLanguage.EqualityExpression
import com.incquerylabs.uml.ralf.reducedAlfLanguage.Expression
import com.incquerylabs.uml.ralf.reducedAlfLanguage.ExpressionList
import com.incquerylabs.uml.ralf.reducedAlfLanguage.ExpressionStatement
import com.incquerylabs.uml.ralf.reducedAlfLanguage.FeatureInvocationExpression
import com.incquerylabs.uml.ralf.reducedAlfLanguage.FilterExpression
import com.incquerylabs.uml.ralf.reducedAlfLanguage.ForStatement
import com.incquerylabs.uml.ralf.reducedAlfLanguage.IfClause
import com.incquerylabs.uml.ralf.reducedAlfLanguage.InstanceCreationExpression
import com.incquerylabs.uml.ralf.reducedAlfLanguage.InstanceDeletionExpression
import com.incquerylabs.uml.ralf.reducedAlfLanguage.LinkOperationExpression
import com.incquerylabs.uml.ralf.reducedAlfLanguage.LiteralExpression
import com.incquerylabs.uml.ralf.reducedAlfLanguage.LocalNameDeclarationStatement
import com.incquerylabs.uml.ralf.reducedAlfLanguage.LogicalExpression
import com.incquerylabs.uml.ralf.reducedAlfLanguage.NameExpression
import com.incquerylabs.uml.ralf.reducedAlfLanguage.NamedExpression
import com.incquerylabs.uml.ralf.reducedAlfLanguage.NamedTuple
import com.incquerylabs.uml.ralf.reducedAlfLanguage.NaturalLiteralExpression
import com.incquerylabs.uml.ralf.reducedAlfLanguage.NullExpression
import com.incquerylabs.uml.ralf.reducedAlfLanguage.NumericUnaryExpression
import com.incquerylabs.uml.ralf.reducedAlfLanguage.PostfixExpression
import com.incquerylabs.uml.ralf.reducedAlfLanguage.PrefixExpression
import com.incquerylabs.uml.ralf.reducedAlfLanguage.RealLiteralExpression
import com.incquerylabs.uml.ralf.reducedAlfLanguage.RelationalExpression
import com.incquerylabs.uml.ralf.reducedAlfLanguage.SendSignalStatement
import com.incquerylabs.uml.ralf.reducedAlfLanguage.ShiftExpression
import com.incquerylabs.uml.ralf.reducedAlfLanguage.SignalDataExpression
import com.incquerylabs.uml.ralf.reducedAlfLanguage.Statements
import com.incquerylabs.uml.ralf.reducedAlfLanguage.StaticFeatureInvocationExpression
import com.incquerylabs.uml.ralf.reducedAlfLanguage.StringLiteralExpression
import com.incquerylabs.uml.ralf.reducedAlfLanguage.SuperInvocationExpression
import com.incquerylabs.uml.ralf.reducedAlfLanguage.ThisExpression
import com.incquerylabs.uml.ralf.reducedAlfLanguage.Variable
import com.incquerylabs.uml.ralf.reducedAlfLanguage.WhileStatement
import com.incquerylabs.uml.ralf.types.CollectionTypeReference
import java.util.List
import org.apache.log4j.Logger
import org.eclipse.uml2.uml.Class
import org.eclipse.uml2.uml.Operation
import org.eclipse.uml2.uml.Parameter
import org.eclipse.uml2.uml.ParameterDirectionKind
import org.eclipse.uml2.uml.Property
import org.eclipse.uml2.uml.Signal
import org.eclipse.uml2.uml.Type
import org.eclipse.xtend2.lib.StringConcatenation
import org.eclipse.emf.ecore.util.EcoreUtil

class ExpressionVisitor {
	extension NavigationVisitor navigationVisitor
	extension SnippetTemplateCompilerUtil util
	extension LoggerUtil loggerutil = new LoggerUtil
	extension ReducedAlfSystem typeSystem
	public extension Logger logger = Logger.getLogger(class)
	
	new(SnippetTemplateCompilerUtil util, ReducedAlfSystem typeSystem){
		this.typeSystem = typeSystem
		this.util = util
		this.navigationVisitor = new NavigationVisitor(this, typeSystem, util)
	}
	
	def dispatch ValueDescriptor visit(CollectionLiteralExpression ex, StringBuilder parent){
		logger.logVisitingStarted(ex)
		if(ex instanceof ElementCollectionExpression){
			val elementType = ex.typeDeclaration.type
			val collectionType = typeSystem.type(ex).value.umlType
			val List<ValueDescriptor> elements = Lists.newArrayList
			
			for(Expression e : ex.elements.expressions){
				val expressionDescriptor = e.visit(parent)
				switch(e){
					LiteralExpression: {
						elements.add((descriptorFactory.createLiteralDescriptorBuilder => [
							literal = expressionDescriptor.stringRepresentation
							type = typeSystem.type(e).value.umlType
						]).build)
					}
					default : {
						elements.add(expressionDescriptor)
					}
				}
				
			}
						
			val valueDescriptor = (descriptorFactory.createCollectionLiteralBuilder => [
				it.elementType = elementType
				it.collectionType = collectionType
				it.elements = elements
				it.stringBuilder = parent
			]).build
			
			logger.logVisitingFinished(ex, valueDescriptor.stringRepresentation)
			valueDescriptor
			
		}else{
			throw new UnsupportedOperationException("Only Element collections are supported")
		}
	}
	
	def dispatch ValueDescriptor visit(InstanceDeletionExpression ex, StringBuilder parent){
		logger.logVisitingStarted(ex)
		val valueDescriptor = ex.reference.visit(parent)
		
		val descriptor = (descriptorFactory.createDeleteBuilder => [
			variable = valueDescriptor
		]).build
		
		logger.logVisitingFinished(ex, descriptor.stringRepresentation)
		descriptor
	}
	
		
	def dispatch ValueDescriptor visit(CastExpression ex, StringBuilder parent){
		logger.logVisitingStarted(ex)
		val operandDescriptor = ex.operand.visit(parent)
		val variableType = typeSystem.type(ex).value.umlType
		
		if(ex.isFlatteningNeeded){
			
			val castDescriptor = (descriptorFactory.createCastDescriptorBuilder => [
				castingType = variableType
				it.descriptor = operandDescriptor
			]).build
			
			val descriptor = createNewVariableDescriptor(ex, variableType)
			
			parent.append('''«descriptor.fullType» «descriptor.stringRepresentation» = «castDescriptor.stringRepresentation»;
			''')
			
			logger.logVisitingFinished(ex, descriptor.stringRepresentation)		
			descriptor
		}else{
			val castDescriptor = (descriptorFactory.createCastDescriptorBuilder => [
				castingType = variableType
				it.descriptor = operandDescriptor
			]).build
			logger.logVisitingFinished(ex, castDescriptor.stringRepresentation)
			castDescriptor	
		}
	}
	
	def dispatch ValueDescriptor visit(NullExpression ex, StringBuilder parent){
		logger.logVisitingStarted(ex)
		val nullDescriptor = createExistingVariableDescriptor(ex,'''nullptr''', context.getThisType(ex))
		
		logger.logVisitingFinished(ex, nullDescriptor.stringRepresentation)
		return nullDescriptor	
	}
	
	def dispatch ValueDescriptor visit(InstanceCreationExpression ex, StringBuilder parent){
		logger.logVisitingStarted(ex)	
		val variableType = typeSystem.type(ex).value.umlType
		
		
		val operationParameters = prepareInstanceCreationTuple(ex, ex.instance, parent)
		val type = ex.instance
		
		val descriptor = (descriptorFactory.createConstructorCallBuilder => [
			type = variableType
			it.operation = operationParameters.key
			it.parameters = operationParameters.value
		]).build
		
		switch(type){
			Signal: {
				var ValueDescriptor variableDescriptor
				
				if(ex.eContainer instanceof LocalNameDeclarationStatement){
					val statement = ex.eContainer as LocalNameDeclarationStatement
					if(statement.variable instanceof CollectionVariable){
						val collection = statement.variable as CollectionVariable
						variableDescriptor = (descriptorFactory.createCollectionVariableDescriptorBuilder => [
							name = collection.name
							collectionType = context.getCollectionType(collection.collectionType)
							elementType = collection.type.type
							isExistingVariable = true
						]).build
					}else{
						variableDescriptor = (descriptorFactory.createSingleVariableDescriptorBuilder => [
							name = statement.variable.name
							type = typeSystem.type(statement.variable).value.umlType
							isExistingVariable = true
						]).build
					}
					
					initiateAttributes(ex, type, parent, variableDescriptor)
					logger.logVisitingFinished(ex, descriptor.stringRepresentation)
					return descriptor
					
				}else{
					variableDescriptor = createNewVariableDescriptor(ex, variableType)
					
					parent.append('''«variableDescriptor.fullType» «variableDescriptor.stringRepresentation» = «descriptor.stringRepresentation»;
					''')
	
					initiateAttributes(ex, type, parent, variableDescriptor)
					parent.append(StringConcatenation.DEFAULT_LINE_DELIMITER)
					logger.logVisitingFinished(ex, variableDescriptor.stringRepresentation)
					return variableDescriptor
				}
				

			}
			Class : {
				if(ex.isFlatteningNeeded){
					val variableDescriptor = createNewVariableDescriptor(ex, variableType)
					
					parent.append('''«variableDescriptor.fullType» «variableDescriptor.stringRepresentation» = «descriptor.stringRepresentation»;
					''')
					logger.logVisitingFinished(ex, variableDescriptor.stringRepresentation)
					return variableDescriptor
				}else{
					logger.logVisitingFinished(ex, descriptor.stringRepresentation)
					return descriptor	
				}
			}
		}
	}
	
	private def initiateAttributes(InstanceCreationExpression ex, Signal cl, StringBuilder builder, ValueDescriptor descriptor){
		val List<ValueDescriptor> descriptors = Lists.newArrayList
		if((ex.parameters instanceof NamedTuple && (ex.parameters as NamedTuple).expressions.size != 0) 
			|| (ex.parameters instanceof ExpressionList && (ex.parameters as ExpressionList).expressions.size != 0)
		){
			if(ex.parameters instanceof NamedTuple){
				val tuple = ex.parameters as NamedTuple
				tuple.expressions.forEach[ exp |
					
					val attribute = getAttribute(cl, exp.name, typeSystem.type(exp.expression).value.umlType)
					if(attribute!=null){
						val rhsDescriptor = exp.expression.visit(builder)
						
						val assignmentDescriptor =  (descriptorFactory.createPropertyWriteBuilder => [
							variable = descriptor
							property = attribute
							newValue = rhsDescriptor
						]).build
						
						descriptors.add(assignmentDescriptor)
					}
				]
				builder.append('''«FOR descr : descriptors SEPARATOR StringConcatenation.DEFAULT_LINE_DELIMITER»«descr.stringRepresentation»;«ENDFOR»''')
			}else{
				throw new UnsupportedOperationException("Signal creation is only supported with named tuples")
			}
		}
	}
	
	private def getAttribute(Signal cl, String name, Type type) {
		val candidates = cl.members.filter(Property).filter[attr| attr.name.equals(name) && attr.getType.equals(type)]
		if(candidates.size != 0){
			return candidates.head
		}else{
			return null
		}
	}

	def dispatch ValueDescriptor visit(ThisExpression ex, StringBuilder parent){
		logger.logVisitingStarted(ex)
		val expr = getDescriptor(ex)
		logger.logVisitingFinished(ex, expr.stringRepresentation)
		return expr	
	}
	
	def dispatch ValueDescriptor visit(ClassExtentExpression ex, StringBuilder parent){
		ex.visitClassExtent(parent)
	}
	
	def dispatch ValueDescriptor visit(FilterExpression ex, StringBuilder parent){
		ex.visitFilter(parent)
	}
	
	def dispatch ValueDescriptor visit(SignalDataExpression ex, StringBuilder parent){
		logger.logVisitingStarted(ex)
		val container = ex.eContainer
		val datatype = typeSystem.type(ex).value.umlType
		if(container instanceof SendSignalStatement){
			val sigdataDescriptor = (descriptorFactory.createSigdataDescriptorBuilder => [
				type = datatype
			]).build
			
			val variableDescriptor = createNewVariableDescriptor(ex, datatype)
			
			val cloneDescriptor = (descriptorFactory.createCopyConstructorCallBuilder => [
				type = datatype
				parameter = sigdataDescriptor
			]).build
			
			parent.append('''«variableDescriptor.fullType» «variableDescriptor.stringRepresentation» = «cloneDescriptor.stringRepresentation»;
			''')
			logger.logVisitingFinished(ex, variableDescriptor.stringRepresentation)
			variableDescriptor
			
		}else{
			val sigdataDescriptor = (descriptorFactory.createSigdataDescriptorBuilder => [
				type = datatype
			]).build
			logger.logVisitingFinished(ex, sigdataDescriptor.stringRepresentation)
			sigdataDescriptor			
		}
	}
	
	def dispatch ValueDescriptor visit(StaticFeatureInvocationExpression ex, StringBuilder parent){
		logger.logVisitingStarted(ex)
		val variableType = typeSystem.type(ex).value.umlType
		val op = ex.operation.reference as Operation
		
		val List<ValueDescriptor> descriptors = ex.prepareTuple(op, parent)
			
		var ValueDescriptor descriptor 
		if(variableType != null && !(ex.eContainer.eContainer instanceof PrefixExpression) && !(ex.eContainer.eContainer instanceof PostfixExpression)&& ex.isFlatteningNeeded){
			descriptor = createNewVariableDescriptor(ex, variableType)
		}	
				
		val invocationDescriptor = (descriptorFactory.createStaticOperationCallBuilder => [
			operation = op
			parameters = descriptors
		]).build
		
		if(variableType != null && !(ex.eContainer.eContainer instanceof PrefixExpression) && !(ex.eContainer.eContainer instanceof PostfixExpression) && ex.isFlatteningNeeded){
	    	parent.append('''«descriptor.fullType» «descriptor.stringRepresentation» = «invocationDescriptor.stringRepresentation»;
	    	''')
	    	
	    	logger.logVisitingFinished(ex, descriptor.stringRepresentation)
	    	descriptor
	    }else{
	    	logger.logVisitingFinished(ex, invocationDescriptor.stringRepresentation)
	    	invocationDescriptor
	    }
	}
	
	def dispatch ValueDescriptor visit(SuperInvocationExpression ex, StringBuilder parent){
		logger.logVisitingStarted(ex)
		
		val superInvocationDescriptor = createExistingVariableDescriptor(ex,'''***** SUPER invocations not supported yet *****''', typeSystem.type(ex).value.umlType)
		
		logger.logVisitingFinished(ex, superInvocationDescriptor.stringRepresentation)
		superInvocationDescriptor
	}
	
	def dispatch ValueDescriptor visit(LinkOperationExpression ex, StringBuilder parent){
		logger.logVisitingStarted(ex)
		val linkOperationDescriptor = ex.descriptor
		logger.logVisitingFinished(ex, linkOperationDescriptor.stringRepresentation)
		return linkOperationDescriptor
	}
	
	def dispatch ValueDescriptor visit(AssociationAccessExpression ex, StringBuilder parent){
		Preconditions.checkState(
			!((ex.context instanceof FeatureInvocationExpression) && ((ex.context as FeatureInvocationExpression).feature instanceof Property)),
			"Association access on property values is not allowed (e.g. a.prop->b)"
		)
		ex.visitAssociation(parent)
	}
	
	def dispatch ValueDescriptor visit(FeatureInvocationExpression ex, StringBuilder parent){
		logger.logVisitingStarted(ex)
		if(ex.feature instanceof Property){
			if(ex.context instanceof AssociationAccessExpression){
				return ex.visitAttribute(parent)
			}else{
				ex.visitFeatureInvocationExpression(parent)
			}
		}else if (ex.feature instanceof Operation){
			val op = ex.feature as Operation
			if(op.name.equals("one") && op.ownedParameters.filter[ param| !(param.direction==ParameterDirectionKind.RETURN_LITERAL)].size == 0){
				ex.visitOne(parent)
			}else{
				ex.visitFeatureInvocationExpression(parent)
			}
		}else {
			ex.visitFeatureInvocationExpression(parent)
		}
	}
	
	private def ValueDescriptor visitFeatureInvocationExpression(FeatureInvocationExpression ex, StringBuilder parent){
		var ValueDescriptor invocationDescriptor
		val contextDescriptor = ex.context.visit(parent)
		
		val variableType = typeSystem.type(ex).value.umlType
		
		val descriptor = createNewVariableDescriptor(ex, variableType)
		switch (ex.feature) {
	        Operation: {
	        	val op = ex.feature as Operation
				val List<ValueDescriptor> descriptors = ex.prepareTuple(op, parent)
								
				invocationDescriptor = (descriptorFactory.createOperationCallBuilder => [
					variable = contextDescriptor
					operation = op
					parameters = descriptors
				]).build
	        }
	        Property: {				
	        	invocationDescriptor = (descriptorFactory.createPropertyReadBuilder => [
					variable = contextDescriptor
					property = ex.feature as Property
				]).build
	        }
	        default: throw new UnsupportedOperationException("Invalid feature invocation")
	    }
	    
	    if((typeSystem.type(ex.context).value instanceof CollectionTypeReference)
	    	&& variableType != null
	    	&& invocationDescriptor.hasMultilineRepresentation
	    ) {
	    	val lastLine = invocationDescriptor.cutRepresentationLastLine
			parent.append(	'''
							«invocationDescriptor.stringRepresentation»
							«descriptor.fullType» «descriptor.stringRepresentation» = «lastLine»;
	    					''')
	    	logger.logVisitingFinished(ex, descriptor.stringRepresentation)
	    	descriptor
	    } else if(variableType != null && !(ex.eContainer.eContainer instanceof PrefixExpression) && !(ex.eContainer.eContainer instanceof PostfixExpression) && ex.isFlatteningNeeded && !(ex.feature instanceof Property)){
	    	parent.append('''«descriptor.fullType» «descriptor.stringRepresentation» = «invocationDescriptor.stringRepresentation»;
	    	''')
	    	logger.logVisitingFinished(ex, descriptor.stringRepresentation)
	    	descriptor
	    }else{
	    	logger.logVisitingFinished(ex, invocationDescriptor.stringRepresentation)
	    	invocationDescriptor
	    }
	}
	
	def String cutRepresentationLastLine(ValueDescriptor descriptor) {
		var penultimateLineLastCharIndex = descriptor.stringRepresentation.lastIndexOf('\n')
		val original = descriptor.stringRepresentation.toCharArray
		descriptor.stringRepresentation = ""
		var String lastLine = ""
		for(var i = 0 ; i < original.length; i++) {
			if(i < penultimateLineLastCharIndex) {
				descriptor.stringRepresentation = descriptor.stringRepresentation + original.get(i)
			} else if(i > penultimateLineLastCharIndex) {
				if(!original.get(i).equals(';')) {
					lastLine += original.get(i)
				}
			}
		}
		return lastLine
	}
	
	def boolean hasMultilineRepresentation(ValueDescriptor descriptor) {
		return descriptor.stringRepresentation.contains('\n')
	}
	
	def dispatch ValueDescriptor visit(AssignmentExpression ex, StringBuilder parent){
		logger.logVisitingStarted(ex)
	   	val variableType = typeSystem.type(ex).value.umlType
	   	if(ex.leftHandSide instanceof FeatureInvocationExpression && (ex.leftHandSide as FeatureInvocationExpression).feature instanceof Property) {
			val propAccess = ex.leftHandSide as FeatureInvocationExpression
			val rhsDescriptor = ex.rightHandSide.visit(parent)
	        val contextDescriptor = propAccess.context.visit(parent)
			
			val assignmentDescriptor =  (descriptorFactory.createPropertyWriteBuilder => [
				variable = contextDescriptor
				property = propAccess.feature as Property
				newValue = rhsDescriptor
			]).build
			
			if(ex.isFlatteningNeeded){
				val descriptor = createNewVariableDescriptor(ex, variableType)
				parent.append('''«descriptor.fullType» «descriptor.stringRepresentation» = («assignmentDescriptor.stringRepresentation»);
				''')
				logger.logVisitingFinished(ex, descriptor.stringRepresentation)
				descriptor
			}else{
				logger.logVisitingFinished(ex, assignmentDescriptor.stringRepresentation)
				assignmentDescriptor	
			}
		} else {
			val lhsDescr = ex.leftHandSide.visit(parent)
		    val rhsString = ex.rightHandSide.visit(parent).stringRepresentation
		    
		    val lhsString = ex.leftHandSide.getProperRepresentation(lhsDescr)
						
		    if(ex.isFlatteningNeeded){
		    	val descriptor = createNewVariableDescriptor(ex, variableType)
				parent.append('''«descriptor.fullType» «descriptor.stringRepresentation» = («lhsString» «ex.operator» «rhsString»);
				''')
				logger.logVisitingFinished(ex, descriptor.stringRepresentation)
				descriptor
			}else{
				val expr = createExistingVariableDescriptor(ex, '''«lhsString» «ex.operator» «rhsString»''', variableType)
				logger.logVisitingFinished(ex, expr.stringRepresentation)
				return expr	
			}
		}
	}

	def dispatch ValueDescriptor visit(ArithmeticExpression ex, StringBuilder parent) {
		logger.logVisitingStarted(ex)
		val operand1Descriptor = ex.operand1.visit(parent)
		val operand2Descriptor = ex.operand2.visit(parent)
		
		val variableType = typeSystem.type(ex).value.umlType
		
		if(ex.isFlatteningNeeded){
			val descriptor = createNewVariableDescriptor(ex, variableType)
			
			parent.append('''«descriptor.fullType» «descriptor.stringRepresentation» = «operand1Descriptor.valueRepresentation» «ex.operator» «operand2Descriptor.valueRepresentation»;
			''')
			logger.logVisitingFinished(ex, descriptor.stringRepresentation)
			descriptor
		}else{
			val expr = createExistingVariableDescriptor(ex, '''«operand1Descriptor.valueRepresentation» «ex.operator» «operand2Descriptor.valueRepresentation»''', variableType)
			logger.logVisitingFinished(ex, expr.stringRepresentation)
			return expr	
		}
	}
	
	def dispatch ValueDescriptor visit(ShiftExpression ex, StringBuilder parent) {
		logger.logVisitingStarted(ex)
		val operand1Descriptor = ex.operand1.visit(parent)
		val operand2Descriptor = ex.operand2.visit(parent)
		
		val variableType = typeSystem.type(ex).value.umlType
		
		if(ex.isFlatteningNeeded){
			val descriptor = createNewVariableDescriptor(ex, variableType)
			
			parent.append('''«descriptor.fullType» «descriptor.stringRepresentation» = «operand1Descriptor.valueRepresentation» «ex.operator» «operand2Descriptor.valueRepresentation»;
			''')
			logger.logVisitingFinished(ex, descriptor.stringRepresentation)
			descriptor
		}else{
			val expr = createExistingVariableDescriptor(ex, '''«operand1Descriptor.valueRepresentation» «ex.operator» «operand2Descriptor.valueRepresentation»''', variableType)
			logger.logVisitingFinished(ex, expr.stringRepresentation)
			return expr	
		}
	}
	
	def dispatch ValueDescriptor visit(RelationalExpression ex, StringBuilder parent) {
		logger.logVisitingStarted(ex)
		val operand1Descriptor = ex.operand1.visit(parent)
		val operand2Descriptor = ex.operand2.visit(parent)
		
		val variableType = typeSystem.type(ex).value.umlType
		
		if(ex.isFlatteningNeeded){
			val descriptor = createNewVariableDescriptor(ex, variableType)
			
			parent.append('''«descriptor.fullType» «descriptor.stringRepresentation» = «operand1Descriptor.valueRepresentation» «ex.operator» «operand2Descriptor.valueRepresentation»;
			''')
			logger.logVisitingFinished(ex, descriptor.stringRepresentation)
			descriptor
		}else{
			val expr = createExistingVariableDescriptor(ex, '''«operand1Descriptor.valueRepresentation» «ex.operator» «operand2Descriptor.valueRepresentation»''', variableType)
			logger.logVisitingFinished(ex, expr.stringRepresentation)
			return expr	
		}
	}
	
	def dispatch ValueDescriptor visit(EqualityExpression ex, StringBuilder parent) {
		logger.logVisitingStarted(ex)
		val operand1Descriptor = ex.operand1.visit(parent)
		val operand2Descriptor = ex.operand2.visit(parent)
		
		val variableType = typeSystem.type(ex).value.umlType
		
		val operand1Representation = ex.operand1.getProperRepresentation(operand1Descriptor)
		val operand2Representation = ex.operand2.getProperRepresentation(operand2Descriptor)
		
		if(ex.isFlatteningNeeded){
			val descriptor = createNewVariableDescriptor(ex, variableType)
			
			parent.append('''«descriptor.fullType» «descriptor.stringRepresentation» = «operand1Representation» «ex.operator» «operand2Representation»;
			''')
			
			logger.logVisitingFinished(ex, descriptor.stringRepresentation)
			descriptor
		}else{
			val expr = createExistingVariableDescriptor(ex, '''«operand1Representation» «ex.operator» «operand2Representation»''', variableType)
			logger.logVisitingFinished(ex, expr.stringRepresentation)
			return expr	
		}
	}
	
	def dispatch ValueDescriptor visit(LogicalExpression ex, StringBuilder parent) {
		logger.logVisitingStarted(ex)
		val operand1Descriptor = ex.operand1.visit(parent)
		val operand2Descriptor = ex.operand2.visit(parent)
		
		val variableType = typeSystem.type(ex).value.umlType
		
		if(ex.isFlatteningNeeded){
			val descriptor = createNewVariableDescriptor(ex, variableType)
			
			parent.append('''«descriptor.fullType» «descriptor.stringRepresentation» = «ex.getProperRepresentation(operand1Descriptor)» «ex.operator» «ex.getProperRepresentation(operand2Descriptor)»;
			''')
			
			logger.logVisitingFinished(ex, descriptor.stringRepresentation)
			descriptor
		}else{
			val expr = createExistingVariableDescriptor(ex, '''«ex.getProperRepresentation(operand1Descriptor)» «ex.operator» «ex.getProperRepresentation(operand2Descriptor)»''', variableType)
			logger.logVisitingFinished(ex, expr.stringRepresentation)
			return expr	
		}
	}
	
	def dispatch ValueDescriptor visit(ConditionalLogicalExpression ex, StringBuilder parent) {
		logger.logVisitingStarted(ex)
		val operand1Descriptor = ex.operand1.visit(parent)
		val operand2Descriptor = ex.operand2.visit(parent)
		
		val variableType = typeSystem.type(ex).value.umlType
		
		if(ex.isFlatteningNeeded){
			val descriptor = createNewVariableDescriptor(ex, variableType)
			
			parent.append('''«descriptor.fullType» «descriptor.stringRepresentation» = «ex.getProperRepresentation(operand1Descriptor)» «ex.operator» «ex.getProperRepresentation(operand2Descriptor)»;
			''')
			logger.logVisitingFinished(ex, descriptor.stringRepresentation)
			descriptor
		}else{
			val expr = createExistingVariableDescriptor(ex, '''«ex.getProperRepresentation(operand1Descriptor)» «ex.operator» «ex.getProperRepresentation(operand2Descriptor)»''', variableType)
			logger.logVisitingFinished(ex, expr.stringRepresentation)
			return expr	
		}
	}

	def dispatch ValueDescriptor visit(PrefixExpression ex, StringBuilder parent){
		logger.logVisitingStarted(ex)
		val operandVariable = ex.operand.expression.visit(parent)
		
		val String operandString = if(ex.operand.expression instanceof FeatureInvocationExpression) {
			operandVariable.stringRepresentation
		} else {
			operandVariable.valueRepresentation
		}  
		
		
		val variableType = typeSystem.type(ex).value.umlType
		
		if(ex.isFlatteningNeeded){
			val descriptor = createNewVariableDescriptor(ex, variableType)
			
			parent.append('''«descriptor.fullType» «descriptor.stringRepresentation» = «ex.operator.literal»«operandString»;
			''')
			
			logger.logVisitingFinished(ex, descriptor.stringRepresentation)
			descriptor
		}else{
			val expr = createExistingVariableDescriptor(ex, '''«ex.operator.literal»«operandString»''', variableType)
			logger.logVisitingFinished(ex, expr.stringRepresentation)
			return expr	
		}
	}
	
	def dispatch ValueDescriptor visit(PostfixExpression ex, StringBuilder parent){
		logger.logVisitingStarted(ex)
		val operandVariable = ex.operand.expression.visit(parent)
		
		val String operandString = if(ex.operand.expression instanceof FeatureInvocationExpression) {
			operandVariable.stringRepresentation
		} else {
			operandVariable.valueRepresentation
		}  
		
		val variableType = typeSystem.type(ex).value.umlType
		
		if(ex.isFlatteningNeeded){
			val descriptor = createNewVariableDescriptor(ex, variableType)
			
			parent.append('''«descriptor.fullType» «descriptor.stringRepresentation» = «operandString»«ex.operator.literal»;
			''')
			
			logger.logVisitingFinished(ex, descriptor.stringRepresentation)
			descriptor
		}else{
			val expr = createExistingVariableDescriptor(ex, '''«operandString»«ex.operator.literal»''', variableType)
			logger.logVisitingFinished(ex, expr.stringRepresentation)
			return expr	
		}
	}

	
	def dispatch ValueDescriptor visit(ConditionalTestExpression ex, StringBuilder parent) {
		logger.logVisitingStarted(ex)
		val operand1Variable = ex.operand1.visit(parent)
		val operand2Variable = ex.operand2.visit(parent)
		val operand3Variable = ex.operand3.visit(parent)
		
		val String operand1String = ex.operand1.getProperRepresentation(operand1Variable) 
		val String operand2String = ex.operand2.getProperRepresentation(operand2Variable) 
		val String operand3String = ex.operand3.getProperRepresentation(operand3Variable)
		
		val variableType = typeSystem.type(ex).value.umlType
		
		if(ex.isFlatteningNeeded){
			val descriptor = createNewVariableDescriptor(ex, variableType)
			
			parent.append('''«descriptor.fullType» «descriptor.stringRepresentation» = («operand1String») ? («operand2String») : («operand3String»);
			''')
		
			logger.logVisitingFinished(ex, descriptor.stringRepresentation)
			descriptor
		}else{
			val expr = createExistingVariableDescriptor(ex, '''(«operand1String») ? («operand2String») : («operand3String»)''', variableType)
			logger.logVisitingFinished(ex, expr.stringRepresentation)
			return expr	
		}
	}

	def dispatch ValueDescriptor visit(NameExpression ex, StringBuilder parent){
		logger.logVisitingStarted(ex)
		if(ex.reference instanceof Variable){
			val variable = ex.reference as Variable
			if(variable != null){
				val descriptor = getDescriptor(ex)
				logger.logVisitingFinished(ex, descriptor.stringRepresentation)
				return descriptor
			}
		}else if(ex.reference instanceof Parameter){
			val parameter = ex.reference as Parameter
			if(parameter != null){
				val descriptor = getDescriptor(ex)
				if(ex.isValueRepresentationRequired){ //if this is true, the descriptor should never describe a class or signal
					logger.logVisitingFinished(ex, descriptor.valueRepresentation)
					val copiedDescriptor = EcoreUtil.copy(descriptor)
					copiedDescriptor.stringRepresentation = descriptor.valueRepresentation
					return copiedDescriptor
				}
				logger.logVisitingFinished(ex, descriptor.stringRepresentation)
				return descriptor
			}
		}else{
			throw new UnsupportedOperationException("Only variables and parameters are supported")
		}
	}
	
	
	def dispatch ValueDescriptor visit(NumericUnaryExpression ex, StringBuilder parent){
		logger.logVisitingStarted(ex)
		val operandVariable = ex.operand.visit(parent)
		val variableType = typeSystem.type(ex).value.umlType
				
		if(ex.isFlatteningNeeded){
			val descriptor = createNewVariableDescriptor(ex, variableType)
			
			parent.append('''«descriptor.fullType» «descriptor.stringRepresentation» = «ex.operator.literal»«operandVariable.valueRepresentation»;
			''')
		
			logger.logVisitingFinished(ex, descriptor.stringRepresentation)
			descriptor
		}else{
			val expr = createExistingVariableDescriptor(ex, '''«ex.operator»«operandVariable.stringRepresentation»''', variableType)
			logger.logVisitingFinished(ex, expr.stringRepresentation)
			return expr		
		}
	}
	
	def dispatch ValueDescriptor visit(BitStringUnaryExpression ex, StringBuilder parent){
		logger.logVisitingStarted(ex)
		val operandVariable = ex.operand.visit(parent)
		val variableType = typeSystem.type(ex).value.umlType
		
		val operandString = operandVariable.valueRepresentation
		
		if(ex.isFlatteningNeeded){
			val descriptor = createNewVariableDescriptor(ex, variableType)
			
			parent.append('''«descriptor.fullType» «descriptor.stringRepresentation» = «ex.operator»«operandString»;
			''')
		
			logger.logVisitingFinished(ex, descriptor.stringRepresentation)
			descriptor
		}else{
			val expr = createExistingVariableDescriptor(ex, '''«ex.operator»«operandVariable.stringRepresentation»''', variableType)
			logger.logVisitingFinished(ex, expr.stringRepresentation)
			return expr	
		}
	}
	
	def dispatch ValueDescriptor visit(BooleanUnaryExpression ex, StringBuilder parent){
		logger.logVisitingStarted(ex)
		val operandVariable = ex.operand.visit(parent)
		val variableType = typeSystem.type(ex).value.umlType
		
		if(ex.isFlatteningNeeded){
			val descriptor = createNewVariableDescriptor(ex, variableType)
			
			parent.append('''«descriptor.fullType» «descriptor.stringRepresentation» = «ex.operator»«operandVariable.stringRepresentation»;
			''')
			
			logger.logVisitingFinished(ex, descriptor.stringRepresentation)
			descriptor
		}else{
			val expr = createExistingVariableDescriptor(ex, '''«ex.operator»«operandVariable.stringRepresentation»''', variableType)
			logger.logVisitingFinished(ex, expr.stringRepresentation)
			return expr
		}
	}
	
	def dispatch ValueDescriptor visit(NaturalLiteralExpression ex, StringBuilder parent) {
		logger.logVisitingStarted(ex)
		val expr = getDescriptor(ex)
		logger.logVisitingFinished(ex, expr.stringRepresentation)
		return expr
    }
    
	def dispatch ValueDescriptor visit(RealLiteralExpression ex, StringBuilder parent) {
		logger.logVisitingStarted(ex)
		val expr = getDescriptor(ex)
		logger.logVisitingFinished(ex, expr.stringRepresentation)
		return expr
    }
	
	def dispatch ValueDescriptor visit(BooleanLiteralExpression ex, StringBuilder parent){
		logger.logVisitingStarted(ex)
		val expr = getDescriptor(ex)
		logger.logVisitingFinished(ex, expr.stringRepresentation)
		return expr
	}
	   
	def dispatch ValueDescriptor visit(StringLiteralExpression ex, StringBuilder parent){
		logger.logVisitingStarted(ex)
		val expr = getDescriptor(ex)
		logger.logVisitingFinished(ex, expr.stringRepresentation)
		return expr
	}
	
	def boolean isFlatteningNeeded(Expression ex){
		switch(ex.eContainer){
			ExpressionStatement: {
				switch(ex.eContainer.eContainer){
					Statements: return false
					BlockStatement : return false
					ForStatement: {
						if((ex.eContainer.eContainer as ForStatement).update.equals(ex.eContainer)){
							return false	
						}else{
							return true
						}
					}
					default: return true
				}
			}
			LocalNameDeclarationStatement: {
				switch(ex.eContainer.eContainer){
					Statements: return false
					BlockStatement : return false
					default: return true
				}
			}
			AssignmentExpression: {
				return !(ex instanceof FeatureInvocationExpression)
			}
			default: {
				return true
			}
		}
	}
		
	private dispatch def Pair<Operation, ? extends List<Pair<Type, ? extends ValueDescriptor>>> prepareInstanceCreationTuple(InstanceCreationExpression ex, Signal signal, StringBuilder parent){
		return null -> newArrayList
	}
	
	private dispatch def Pair<Operation, ? extends List<Pair<Type, ? extends ValueDescriptor>>> prepareInstanceCreationTuple(InstanceCreationExpression ex, Class c, StringBuilder parent){
		val descriptors = newArrayList	
		
		var Operation op = null
		if(ex.parameters instanceof ExpressionList){
			val parameters = ex.parameters as ExpressionList
			op = getOperation(parameters, c)
			
			if(op !=null){
				parameters.expressions.forEach[ expr |
					val expressionDescriptor = expr.visit(parent)
					val descriptor = (descriptorFactory.createSingleVariableDescriptorBuilder => [
						name = expressionDescriptor.stringRepresentation
						type = typeSystem.type(expr).value.umlType
						isExistingVariable = true
					]).build
					descriptors.add(typeSystem.type(expr).value.umlType -> descriptor)				
				]
			}else{
				return op -> descriptors
			}
		}else if(ex.parameters instanceof NamedTuple){
			val parameters = ex.parameters as NamedTuple
			op = getOperation(parameters, c)
			
			if(op !=null){
				val operationParameters = op.ownedParameters

				operationParameters.forEach[operationParameter |
					parameters.expressions.forEach[ namedExpression |
						if(namedExpression.parameterEqualsExpression(operationParameter)){
							val expressionDescriptor = namedExpression.expression.visit(parent)
							val descriptor = (descriptorFactory.createSingleVariableDescriptorBuilder => [
								name = expressionDescriptor.stringRepresentation
								type = typeSystem.type(namedExpression.expression).value.umlType
								isExistingVariable = true
							]).build
							descriptors.add(new Pair<Type, ValueDescriptor>(typeSystem.type(namedExpression.expression).value.umlType, descriptor))
						}
					]
				]
			}else{
				return op -> descriptors
			}
			
		}else{
			throw new UnsupportedOperationException("Only expression list and namedTuple based tuples are supported")
		}	
		return op -> descriptors
	}
	
	private dispatch def getOperation(NamedTuple parameters, Class c){
		val candidates = c.ownedOperations.filter[op | op.name.equals(c.name)]
		val List<Operation> operations = Lists.newArrayList
		candidates.forEach[operation | 
			var valid = true
			for(NamedExpression namedExpression : parameters.expressions){
				var expressionFound = false
				for(Parameter parameter : operation.ownedParameters){
					if(namedExpression.parameterEqualsExpression(parameter)){
						expressionFound = true
					}
				}
				if(!expressionFound){
					valid = false
				}
			}
			if(valid){
				operations.add(operation)
			}
		]
		if(operations.size == 0){
			return null
		}else{
			return operations.head
		}
	}
	
	private dispatch def getOperation(ExpressionList parameters, Class c){
		val candidates = c.ownedOperations.filter[op | op.name.equals(c.name)]
		val List<Operation> operations = Lists.newArrayList
		candidates.forEach[operation | 
			var valid = true
			for(Expression expression : parameters.expressions){
				var expressionFound = false
				for(Parameter parameter : operation.ownedParameters){
					if(expression.parameterEqualsExpression(parameter)){
						expressionFound = true
					}
				}
				if(!expressionFound){
					valid = false
				}
			}
			if(valid){
				operations.add(operation)
			}
		]
		if(operations.size == 0){
			return null
		}else{
			return operations.head
		}
	}
	
	private dispatch def prepareTuple(FeatureInvocationExpression ex, Operation op, StringBuilder parent){
		val List<ValueDescriptor> descriptors = Lists.newArrayList
		if(ex.parameters instanceof ExpressionList){
			val parameters = ex.parameters as ExpressionList
			parameters.expressions.forEach[ expr |
				val descr = expr.visit(parent)
				descriptors.add(descr)
				
			]
		}else if(ex.parameters instanceof NamedTuple){
			val parameters = ex.parameters as NamedTuple
			val operationParameters = op.ownedParameters

			operationParameters.forEach[operationParameter |
				parameters.expressions.forEach[ namedExpression |
					if(namedExpression.parameterEqualsExpression(operationParameter)){
						val descr = namedExpression.expression.visit(parent)
						descriptors.add(descr)
					}
				]
			]
			
		}else{
			throw new UnsupportedOperationException("Only expression list and namedTuple based tuples are supported")
		}	
		return descriptors
	}
	
	private def parameterEqualsExpression(NamedExpression namedExpression, Parameter operationParameter){
		val expType = typeSystem.type(namedExpression.expression).value
		val paramType = typeSystem.type(operationParameter).value
		if(paramType instanceof CollectionTypeReference){
			return (expType instanceof CollectionTypeReference 
				&& paramType.type.equals((expType as CollectionTypeReference).type)
				&& paramType.umlType.equals((expType as CollectionTypeReference).umlType)
				&& namedExpression.name.equals(operationParameter.name)
			)
		}else{
			return(namedExpression.name.equals(operationParameter.name) 
				&& expType.umlType.equals(paramType.umlType)
			)
		}
	}
	
	private def parameterEqualsExpression(Expression expression, Parameter operationParameter){
		val expType = typeSystem.type(expression).value
		val paramType = typeSystem.type(operationParameter).value
		if(paramType instanceof CollectionTypeReference){
			return (expType instanceof CollectionTypeReference 
				&& paramType.type.equals((expType as CollectionTypeReference).type)
				&& paramType.umlType.equals((expType as CollectionTypeReference).umlType)
			)
		}else{
			return expType.umlType.equals(paramType.umlType
			)
		}
	}
	
	private dispatch def prepareTuple(StaticFeatureInvocationExpression ex, Operation op, StringBuilder parent){
		val List<ValueDescriptor> descriptors = Lists.newArrayList
		if(ex.parameters instanceof ExpressionList){
			val parameters = ex.parameters as ExpressionList
			parameters.expressions.forEach[ expr |
				val descr = expr.visit(parent)
				descriptors.add(descr)	
			]
		}else if(ex.parameters instanceof NamedTuple){
			val parameters = ex.parameters as NamedTuple
			val operationParameters = op.ownedParameters

			operationParameters.forEach[operationParameter |
				parameters.expressions.forEach[ namedExpression |
					if(namedExpression.parameterEqualsExpression(operationParameter)){
						val descr = namedExpression.expression.visit(parent)
						descriptors.add(descr)
					}
				]
			]
			
		}else{
			throw new UnsupportedOperationException("Only expression list and namedTuple based tuples are supported")
		}	
		return descriptors
	}
	
	private def isCollection(Type variableType){
		if(variableType == null){
			return false
		}
		if( variableType.equals(context.getCollectionType(CollectionType.SET)) ||
			variableType.equals(context.getCollectionType(CollectionType.BAG)) ||
			variableType.equals(context.getCollectionType(CollectionType.SEQUENCE))
		){
			return true
		}else{
			return false
		}
		
	}
	
	private def isValueRepresentationRequired(Expression ex) {
		switch(ex.eContainer) {
			LocalNameDeclarationStatement: true
			IfClause : true
			WhileStatement : true
			DoStatement : true
			default : false	
		}
	}
	
	public def createNewVariableDescriptor(Expression ex, Type variableType){
		if(variableType == null){
			return null
		}
		var ValueDescriptor descriptor 
		if(variableType.isCollection){
			descriptor = (descriptorFactory.createCollectionVariableDescriptorBuilder => [
				elementType = (typeSystem.type(ex).value as CollectionTypeReference).valueType.umlType
				collectionType = variableType
				name = null
			]).build
		}else{
			descriptor = (descriptorFactory.createSingleVariableDescriptorBuilder => [
				type = variableType
				name = null
			]).build
		}
	}
	
	public def createExistingVariableDescriptor(Expression ex, String name, Type variableType){
		if(variableType == null){
			return null
		}
		var ValueDescriptor descriptor 
		if(variableType.isCollection){
			descriptor = (descriptorFactory.createCollectionVariableDescriptorBuilder => [
				elementType = (typeSystem.type(ex).value as CollectionTypeReference).valueType.umlType
				collectionType = variableType
				it.name = name
				isExistingVariable = true
			]).build
		}else{
			descriptor = (descriptorFactory.createSingleVariableDescriptorBuilder => [
				type = variableType
				it.name = name
				isExistingVariable = true
			]).build
		}
	}
	
	def String getProperRepresentation(Expression ex, ValueDescriptor descr) {
		
		
		if(ex instanceof NullExpression) {
			return '''nullptr'''	
		}		
		else if(typeSystem.type(ex).value.umlType instanceof Class) {
			return descr.pointerRepresentation
		} else { 
			return descr.valueRepresentation	
		}
	}
}