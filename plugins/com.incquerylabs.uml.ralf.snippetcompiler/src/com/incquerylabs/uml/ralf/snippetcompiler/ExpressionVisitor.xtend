package com.incquerylabs.uml.ralf.snippetcompiler

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
import com.incquerylabs.uml.ralf.reducedAlfLanguage.ConditionalLogicalExpression
import com.incquerylabs.uml.ralf.reducedAlfLanguage.ConditionalTestExpression
import com.incquerylabs.uml.ralf.reducedAlfLanguage.EqualityExpression
import com.incquerylabs.uml.ralf.reducedAlfLanguage.Expression
import com.incquerylabs.uml.ralf.reducedAlfLanguage.ExpressionList
import com.incquerylabs.uml.ralf.reducedAlfLanguage.ExpressionStatement
import com.incquerylabs.uml.ralf.reducedAlfLanguage.FeatureInvocationExpression
import com.incquerylabs.uml.ralf.reducedAlfLanguage.FilterExpression
import com.incquerylabs.uml.ralf.reducedAlfLanguage.ForStatement
import com.incquerylabs.uml.ralf.reducedAlfLanguage.InstanceCreationExpression
import com.incquerylabs.uml.ralf.reducedAlfLanguage.LinkOperationExpression
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
import com.incquerylabs.uml.ralf.reducedAlfLanguage.ShiftExpression
import com.incquerylabs.uml.ralf.reducedAlfLanguage.SignalDataExpression
import com.incquerylabs.uml.ralf.reducedAlfLanguage.Statements
import com.incquerylabs.uml.ralf.reducedAlfLanguage.StaticFeatureInvocationExpression
import com.incquerylabs.uml.ralf.reducedAlfLanguage.StringLiteralExpression
import com.incquerylabs.uml.ralf.reducedAlfLanguage.SuperInvocationExpression
import com.incquerylabs.uml.ralf.reducedAlfLanguage.ThisExpression
import com.incquerylabs.uml.ralf.reducedAlfLanguage.Variable
import java.util.List
import org.eclipse.uml2.uml.Class
import org.eclipse.uml2.uml.Operation
import org.eclipse.uml2.uml.Parameter
import org.eclipse.uml2.uml.ParameterDirectionKind
import org.eclipse.uml2.uml.Property
import org.eclipse.uml2.uml.Signal
import org.eclipse.uml2.uml.Type
import com.incquerylabs.uml.ralf.reducedAlfLanguage.InstanceDeletionExpression
import com.incquerylabs.uml.ralf.reducedAlfLanguage.SendSignalStatement
import com.incquerylabs.uml.ralf.reducedAlfLanguage.CollectionLiteralExpression
import com.incquerylabs.uml.ralf.types.CollectionTypeReference
import com.incquerylabs.uml.ralf.reducedAlfLanguage.ElementCollectionExpression
import com.incquerylabs.uml.ralf.reducedAlfLanguage.LiteralExpression
import com.incquerylabs.uml.ralf.reducedAlfLanguage.CollectionType
import org.eclipse.xtend2.lib.StringConcatenation
import com.google.common.base.Preconditions

class ExpressionVisitor {
	extension NavigationVisitor navigationVisitor
	extension SnippetTemplateCompilerUtil util
	extension ReducedAlfSystem typeSystem
	
	new(SnippetTemplateCompilerUtil util, ReducedAlfSystem typeSystem){
		this.typeSystem = typeSystem
		this.util = util
		this.navigationVisitor = new NavigationVisitor(this, typeSystem, util)
	}
	
	def dispatch String visit(CollectionLiteralExpression ex, StringBuilder parent){
		if(ex instanceof ElementCollectionExpression){
			val elementType = ex.typeDeclaration.type
			val collectionType = typeSystem.type(ex).value.umlType
			val List<ValueDescriptor> elements = Lists.newArrayList
			
			for(Expression e : ex.elements.expressions){
				val expressionString = e.visit(parent)
				switch(e){
					LiteralExpression: {
						elements.add((descriptorFactory.createLiteralDescriptorBuilder => [
							literal = expressionString
							type = typeSystem.type(e).value.umlType
						]).build)
					}
					default : {
						elements.add(descriptorFactory.getCachedVariableDescriptor(expressionString))
					}
				}
				
			}
						
			val valueDescriptor = (descriptorFactory.createCollectionLiteralBuilder => [
				it.elementType = elementType
				it.collectionType = collectionType
				it.elements = elements
				it.stringBuilder = parent
			]).build
			
			valueDescriptor.stringRepresentation
			
		}else{
			throw new UnsupportedOperationException("Only Element collections are supported")
		}
	}
	
	def dispatch String visit(InstanceDeletionExpression ex, StringBuilder parent){
		val referenceString = ex.reference.visit(parent)
				
		val valueDescriptor = ex.reference.getCachedDescriptor(referenceString)
		
		val descriptor = (descriptorFactory.createDeleteBuilder => [
			variable = valueDescriptor
		]).build
			
		descriptor.stringRepresentation
	}
	
		
	def dispatch String visit(CastExpression ex, StringBuilder parent){
		val operandVariable = ex.operand.visit(parent)
		val variableType = typeSystem.type(ex).value.umlType
		
		if(ex.isFlatteningNeeded){
			val operandDescriptor = ex.getCachedDescriptor(operandVariable)
			
			val castDescriptor = (descriptorFactory.createCastDescriptorBuilder => [
				castingType = variableType
				it.descriptor = operandDescriptor
			]).build
			
			var ValueDescriptor descriptor 
			if(ex.isCollection){
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
			
			
			
			parent.append('''«descriptor.fullType» «descriptor.stringRepresentation» = «castDescriptor.stringRepresentation»;
			''')
					
			descriptor.stringRepresentation
		}else{
			val operandDescriptor = ex.getCachedDescriptor(operandVariable)
			val castDescriptor = (descriptorFactory.createCastDescriptorBuilder => [
				castingType = variableType
				it.descriptor = operandDescriptor
			]).build
			
			castDescriptor.stringRepresentation	
		}
	}
	
	def dispatch String visit(NullExpression ex, StringBuilder parent){
		'''0'''
	}
	
	def dispatch String visit(InstanceCreationExpression ex, StringBuilder parent){		
		val variableType = typeSystem.type(ex).value.umlType
		
		
		val parameters = prepareInstanceCreationTuple(ex, ex.instance, parent)
		val type = ex.instance
		
		val descriptor = (descriptorFactory.createConstructorCallBuilder => [
			type = variableType
			it.parameters = parameters
		]).build
		
		switch(type){
			Signal: {
				var ValueDescriptor variableDescriptor
				
				if(ex.eContainer instanceof LocalNameDeclarationStatement){
					val statement = ex.eContainer as LocalNameDeclarationStatement
					variableDescriptor = statement.descriptor
					
					initiateAttributes(ex, type, parent, variableDescriptor)
					return descriptor.stringRepresentation
					
				}else{
					variableDescriptor = (descriptorFactory.createSingleVariableDescriptorBuilder => [
						type = variableType
						name = null
					]).build
					
					parent.append('''«variableDescriptor.fullType» «variableDescriptor.stringRepresentation» = «descriptor.stringRepresentation»;
					''')
	
					initiateAttributes(ex, type, parent, variableDescriptor)
					parent.append(StringConcatenation.DEFAULT_LINE_DELIMITER)
					return variableDescriptor.stringRepresentation
				}
				

			}
			Class : {
				if(ex.isFlatteningNeeded){
					val variableDescriptor = (descriptorFactory.createSingleVariableDescriptorBuilder => [
						type = variableType
						name = null
					]).build
					
					parent.append('''«variableDescriptor.fullType» «variableDescriptor.stringRepresentation» = «descriptor.stringRepresentation»;
					''')

					return variableDescriptor.stringRepresentation
				}else{
					return descriptor.stringRepresentation	
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
						val rhsString = exp.expression.visit(builder)
						
						val rhsDescriptor = (descriptorFactory.createSingleVariableDescriptorBuilder => [
							it.name = rhsString
							it.type = typeSystem.type(exp.expression).value.umlType
							isExistingVariable = true
						]).build
						
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
		val candidates = cl.ownedAttributes.filter[attr| attr.name.equals(name) && attr.getType.equals(type)]
		if(candidates.size != 0){
			return candidates.head
		}else{
			return null
		}
	}

	def dispatch String visit(ThisExpression ex, StringBuilder parent){
		getDescriptor(ex).stringRepresentation
	}
	
	def dispatch String visit(ClassExtentExpression ex, StringBuilder parent){
		val classDescriptor = ex.descriptor
		
		val collectionType = (typeSystem.type(ex).value as CollectionTypeReference);
		val variableType = collectionType.valueType.umlType
		
		if(ex.isFlatteningNeeded){
			// only the name is needed, since the type is given by the classDescriptor
			val descriptor = (descriptorFactory.createSingleVariableDescriptorBuilder=> [
				type = variableType
				name = null
			]).build
			
			parent.append('''«classDescriptor.fullType» «descriptor.stringRepresentation» = «classDescriptor.stringRepresentation»;
			''')
			
			descriptor.stringRepresentation
		} else {
			classDescriptor.stringRepresentation
		}
	}
	
	def dispatch String visit(FilterExpression ex, StringBuilder parent){
		ex.visitFilter(parent)
	}
	
	def dispatch String visit(SignalDataExpression ex, StringBuilder parent){
		val container = ex.eContainer
		val datatype = typeSystem.type(ex).value.umlType
		if(container instanceof SendSignalStatement){
			val sigdataDescriptor = (descriptorFactory.createSigdataDescriptorBuilder => [
				type = datatype
			]).build
			
			val variableDescriptor = (descriptorFactory.createSingleVariableDescriptorBuilder => [
				type = datatype
				name = null
			]).build
			
			val cloneDescriptor = (descriptorFactory.createCopyConstructorCallBuilder => [
				type = datatype
				parameter = sigdataDescriptor
			]).build
			
			parent.append('''«variableDescriptor.fullType» «variableDescriptor.stringRepresentation» = «cloneDescriptor.stringRepresentation»;
			''')
			
			variableDescriptor.stringRepresentation
			
		}else{
			(descriptorFactory.createSigdataDescriptorBuilder => [
				type = datatype
			]).build.stringRepresentation			
		}
	}
	
	def dispatch String visit(StaticFeatureInvocationExpression ex, StringBuilder parent){
		val variableType = typeSystem.type(ex).value.umlType
		val op = ex.operation.reference as Operation
		
		val List<ValueDescriptor> descriptors = ex.prepareTuple(op, parent)
			
		var ValueDescriptor descriptor 
		if(variableType != null && !(ex.eContainer.eContainer instanceof PrefixExpression) && !(ex.eContainer.eContainer instanceof PostfixExpression)&& ex.isFlatteningNeeded){
			descriptor = (descriptorFactory.createSingleVariableDescriptorBuilder => [
				type = variableType
				name = null
			]).build
		}	
			
				
		val invocationDescriptor = (descriptorFactory.createStaticOperationCallBuilder => [
			operation = op
			parameters = descriptors
		]).build
		
		if(variableType != null && !(ex.eContainer.eContainer instanceof PrefixExpression) && !(ex.eContainer.eContainer instanceof PostfixExpression) && ex.isFlatteningNeeded){
	    	parent.append('''«descriptor.fullType» «descriptor.stringRepresentation» = «invocationDescriptor.stringRepresentation»;
	    	''')
	    	
	    	descriptor.stringRepresentation
	    }else{
	    	invocationDescriptor.stringRepresentation
	    }
	}
	
	def dispatch String visit(SuperInvocationExpression ex, StringBuilder parent){
		'''***** SUPER invocations not supported yet *****'''
	}
	
	def dispatch String visit(LinkOperationExpression ex, StringBuilder parent){
		val linkOperationDescriptor = ex.descriptor
		return linkOperationDescriptor.stringRepresentation
	}
	
	def dispatch String visit(AssociationAccessExpression ex, StringBuilder parent){
		Preconditions.checkState(
			!((ex.context instanceof FeatureInvocationExpression) && ((ex.context as FeatureInvocationExpression).feature instanceof Property)),
			"Association access on property values is not allowed (e.g. a.prop->b)"
		)
		
		ex.visitAssociation(parent)
	}
	
	def dispatch String visit(FeatureInvocationExpression ex, StringBuilder parent){
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
	
	private def visitFeatureInvocationExpression(FeatureInvocationExpression ex, StringBuilder parent){
		var ValueDescriptor invocationDescriptor
			val contextString = ex.context.visit(parent)
			
			val variableType = typeSystem.type(ex).value.umlType
			
			var ValueDescriptor descriptor 
			if(variableType != null && !(ex.eContainer.eContainer instanceof PrefixExpression) && !(ex.eContainer.eContainer instanceof PostfixExpression)&& ex.isFlatteningNeeded){
				if(ex.isCollection){
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
			
			switch (ex.feature) {
		        Operation: {
		        	val op = ex.feature as Operation
					val List<ValueDescriptor> descriptors = ex.prepareTuple(op, parent)
					
					val contextDescriptor = ex.context.getCachedDescriptor(contextString)
					invocationDescriptor = (descriptorFactory.createOperationCallBuilder => [
						variable = contextDescriptor
						operation = op
						parameters = descriptors
					]).build
		        }
		        Property: {
		        	val contextDescriptor = ex.context.getCachedDescriptor(contextString)
		        	invocationDescriptor = (descriptorFactory.createPropertyReadBuilder => [
						variable = contextDescriptor
						property = ex.feature as Property
					]).build
		        }
		        default: throw new UnsupportedOperationException("Invalid feature invocation")
		    }
		    
		    if(variableType != null && !(ex.eContainer.eContainer instanceof PrefixExpression) && !(ex.eContainer.eContainer instanceof PostfixExpression) && ex.isFlatteningNeeded){
		    	parent.append('''«descriptor.fullType» «descriptor.stringRepresentation» = «invocationDescriptor.stringRepresentation»;
		    	''')
		    	descriptor.stringRepresentation
		    }else{
		    	invocationDescriptor.stringRepresentation
		    }
	}
	
	def dispatch String visit(AssignmentExpression ex, StringBuilder parent){
	   	val variableType = typeSystem.type(ex).value.umlType
	   	if(ex.leftHandSide instanceof FeatureInvocationExpression && (ex.leftHandSide as FeatureInvocationExpression).feature instanceof Property) {
			val propAccess = ex.leftHandSide as FeatureInvocationExpression
			
			val rhsString = ex.rightHandSide.visit(parent)
			val contextString = propAccess.context.visit(parent)
			
			
					
			val rhsDescriptor = ex.rightHandSide.getCachedDescriptor(rhsString)
			
	        val contextDescriptor = propAccess.context.getCachedDescriptor(contextString)
			
			val assignmentDescriptor =  (descriptorFactory.createPropertyWriteBuilder => [
				variable = contextDescriptor
				property = propAccess.feature as Property
				newValue = rhsDescriptor
			]).build
			
			if(ex.isFlatteningNeeded){
				var ValueDescriptor descriptor 
				if(ex.isCollection){
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
				
				parent.append('''«descriptor.fullType» «descriptor.stringRepresentation» = («assignmentDescriptor.stringRepresentation»);
				''')
			
				descriptor.stringRepresentation
			}else{
				assignmentDescriptor.stringRepresentation	
			}
		} else {
			val lhsString = ex.leftHandSide.visit(parent)
		    val rhsString = ex.rightHandSide.visit(parent)
		    
		    if(ex.isFlatteningNeeded){
		    	var ValueDescriptor descriptor 
		    	
				if(ex.isCollection){
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
				
				parent.append('''«descriptor.fullType» «descriptor.stringRepresentation» = («lhsString» «ex.operator» «rhsString»);
				''')
			
				descriptor.stringRepresentation
			}else{
				'''«lhsString» «ex.operator» «rhsString»'''	
			}
		}
	}

	def dispatch String visit(ArithmeticExpression ex, StringBuilder parent) {
		val operand1Variable = ex.operand1.visit(parent)
		val operand2Variable = ex.operand2.visit(parent)
		
		val variableType = typeSystem.type(ex).value.umlType
		
		if(ex.isFlatteningNeeded){
			val descriptor = (descriptorFactory.createSingleVariableDescriptorBuilder => [
				type = variableType
				name = null
			]).build
			
			parent.append('''«descriptor.fullType» «descriptor.stringRepresentation» = «operand1Variable» «ex.operator» «operand2Variable»;
			''')
		
			descriptor.stringRepresentation
		}else{
			'''«operand1Variable» «ex.operator» «operand2Variable»'''	
		}
	}
	
	def dispatch String visit(ShiftExpression ex, StringBuilder parent) {
		val operand1Variable = ex.operand1.visit(parent)
		val operand2Variable = ex.operand2.visit(parent)
		
		val variableType = typeSystem.type(ex).value.umlType
		
		if(ex.isFlatteningNeeded){
			val descriptor = (descriptorFactory.createSingleVariableDescriptorBuilder => [
				type = variableType
				name = null
			]).build
			
			parent.append('''«descriptor.fullType» «descriptor.stringRepresentation» = «operand1Variable» «ex.operator» «operand2Variable»;
			''')
		
			descriptor.stringRepresentation
		}else{
			'''«operand1Variable» «ex.operator» «operand2Variable»'''	
		}
	}
	
	def dispatch String visit(RelationalExpression ex, StringBuilder parent) {
		val operand1Variable = ex.operand1.visit(parent)
		val operand2Variable = ex.operand2.visit(parent)
		
		val variableType = typeSystem.type(ex).value.umlType
		
		if(ex.isFlatteningNeeded){
			val descriptor = (descriptorFactory.createSingleVariableDescriptorBuilder => [
				type = variableType
				name = null
			]).build
			
			parent.append('''«descriptor.fullType» «descriptor.stringRepresentation» = «operand1Variable» «ex.operator» «operand2Variable»;
			''')
		
			descriptor.stringRepresentation
		}else{
			'''«operand1Variable» «ex.operator» «operand2Variable»'''	
		}
	}
	
	def dispatch String visit(EqualityExpression ex, StringBuilder parent) {
		val operand1Variable = ex.operand1.visit(parent)
		val operand2Variable = ex.operand2.visit(parent)
		
		val variableType = typeSystem.type(ex).value.umlType
		
		if(ex.isFlatteningNeeded){
			val descriptor = (descriptorFactory.createSingleVariableDescriptorBuilder => [
				type = variableType
				name = null
			]).build
			
			parent.append('''«descriptor.fullType» «descriptor.stringRepresentation» = «operand1Variable» «ex.operator» «operand2Variable»;
			''')
		
			descriptor.stringRepresentation
		}else{
			'''«operand1Variable» «ex.operator» «operand2Variable»'''	
		}
	}
	
	def dispatch String visit(LogicalExpression ex, StringBuilder parent) {
		val operand1Variable = ex.operand1.visit(parent)
		val operand2Variable = ex.operand2.visit(parent)
		
		val variableType = typeSystem.type(ex).value.umlType
		
		if(ex.isFlatteningNeeded){
			val descriptor = (descriptorFactory.createSingleVariableDescriptorBuilder => [
				type = variableType
				name = null
			]).build
			
			parent.append('''«descriptor.fullType» «descriptor.stringRepresentation» = «operand1Variable» «ex.operator» «operand2Variable»;
			''')
		
			descriptor.stringRepresentation
		}else{
			'''«operand1Variable» «ex.operator» «operand2Variable»'''	
		}
	}
	
	def dispatch String visit(ConditionalLogicalExpression ex, StringBuilder parent) {
		val operand1Variable = ex.operand1.visit(parent)
		val operand2Variable = ex.operand2.visit(parent)
		
		val variableType = typeSystem.type(ex).value.umlType
		
		if(ex.isFlatteningNeeded){
			val descriptor = (descriptorFactory.createSingleVariableDescriptorBuilder => [
				type = variableType
				name = null
			]).build
			
			parent.append('''«descriptor.fullType» «descriptor.stringRepresentation» = «operand1Variable» «ex.operator» «operand2Variable»;
			''')
		
			descriptor.stringRepresentation
		}else{
			'''«operand1Variable» «ex.operator» «operand2Variable»'''	
		}
	}

	def dispatch String visit(PrefixExpression ex, StringBuilder parent){
		val operandVariable = ex.operand.expression.visit(parent)
		
		val variableType = typeSystem.type(ex).value.umlType
		
		if(ex.isFlatteningNeeded){
			val descriptor = (descriptorFactory.createSingleVariableDescriptorBuilder => [
				type = variableType
				name = null
			]).build
			
			parent.append('''«descriptor.fullType» «descriptor.stringRepresentation» = «ex.operator.literal»«operandVariable»;
			''')
		
			descriptor.stringRepresentation
		}else{
			'''«ex.operator.literal»«operandVariable»'''	
		}
	}
	
	def dispatch String visit(PostfixExpression ex, StringBuilder parent){
		val operandVariable = ex.operand.expression.visit(parent)
		
		val variableType = typeSystem.type(ex).value.umlType
		
		if(ex.isFlatteningNeeded){
			val descriptor = (descriptorFactory.createSingleVariableDescriptorBuilder => [
				type = variableType
				name = null
			]).build
			
			parent.append('''«descriptor.fullType» «descriptor.stringRepresentation» = «operandVariable»«ex.operator.literal»;
			''')
		
			descriptor.stringRepresentation
		}else{
			'''«operandVariable»«ex.operator.literal»'''	
		}
	}

	
	def dispatch String visit(ConditionalTestExpression ex, StringBuilder parent) {
		val operand1Variable = ex.operand1.visit(parent)
		val operand2Variable = ex.operand2.visit(parent)
		val operand3Variable = ex.operand3.visit(parent)
		
		val variableType = typeSystem.type(ex).value.umlType
		
		if(ex.isFlatteningNeeded){
			val descriptor = (descriptorFactory.createSingleVariableDescriptorBuilder => [
				type = variableType
				name = null
			]).build
			
			parent.append('''«descriptor.fullType» «descriptor.stringRepresentation» = («operand1Variable») ? («operand2Variable») : («operand3Variable»);
			''')
		
			descriptor.stringRepresentation
		}else{
			'''(«operand1Variable») ? («operand2Variable») : («operand3Variable»)'''	
		}
	}

	def dispatch String visit(NameExpression ex, StringBuilder parent){
		if(ex.reference instanceof Variable){
			val variable = ex.reference as Variable
			if(variable != null){
				val descriptor = getDescriptor(ex)
				return descriptor.stringRepresentation
			}
		}else if(ex.reference instanceof Parameter){
			val parameter = ex.reference as Parameter
			if(parameter != null){
				val descriptor = getDescriptor(ex)
				return descriptor.stringRepresentation
			}
		}else{
			throw new UnsupportedOperationException("Only variables and parameters are supported")
		}
	}
	
	
	def dispatch String visit(NumericUnaryExpression ex, StringBuilder parent){
		val operandVariable = ex.operand.visit(parent)
		val variableType = typeSystem.type(ex).value.umlType
		
		if(ex.isFlatteningNeeded){
			val descriptor = (descriptorFactory.createSingleVariableDescriptorBuilder => [
				type = variableType
				name = null
			]).build
			
			parent.append('''«descriptor.fullType» «descriptor.stringRepresentation» = «ex.operator.literal»«operandVariable»;
			''')
		
			descriptor.stringRepresentation
		}else{
			'''«ex.operator.literal»«operandVariable»'''	
		}
	}
	
	def dispatch String visit(BitStringUnaryExpression ex, StringBuilder parent){
		val operandVariable = ex.operand.visit(parent)
		val variableType = typeSystem.type(ex).value.umlType
		
		if(ex.isFlatteningNeeded){
			val descriptor = (descriptorFactory.createSingleVariableDescriptorBuilder => [
				type = variableType
				name = null
			]).build
			
			parent.append('''«descriptor.fullType» «descriptor.stringRepresentation» = «ex.operator»«operandVariable»;
			''')
		
			descriptor.stringRepresentation
		}else{
			'''«ex.operator»«operandVariable»'''	
		}
	}
	
	def dispatch String visit(BooleanUnaryExpression ex, StringBuilder parent){
		val operandVariable = ex.operand.visit(parent)
		val variableType = typeSystem.type(ex).value.umlType
		
		if(ex.isFlatteningNeeded){
			val descriptor = (descriptorFactory.createSingleVariableDescriptorBuilder => [
				type = variableType
				name = null
			]).build
			
			parent.append('''«descriptor.fullType» «descriptor.stringRepresentation» = «ex.operator»«operandVariable»;
			''')
		
			descriptor.stringRepresentation
		}else{
			'''«ex.operator»«operandVariable»'''	
		}
	}
	
	def dispatch String visit(NaturalLiteralExpression ex, StringBuilder parent) {
		getDescriptor(ex).stringRepresentation
    }
    
	def dispatch String visit(RealLiteralExpression ex, StringBuilder parent) {
		getDescriptor(ex).stringRepresentation
    }
	
	def dispatch String visit(BooleanLiteralExpression ex, StringBuilder parent){
		getDescriptor(ex).stringRepresentation
	}
	   
	def dispatch String visit(StringLiteralExpression ex, StringBuilder parent){
		getDescriptor(ex).stringRepresentation
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
			default: {
				return true
			}
		}
	}
		
	private dispatch def prepareInstanceCreationTuple(InstanceCreationExpression ex, Signal signal, StringBuilder parent){
		val List<Pair<Type, ValueDescriptor>> descriptors = Lists.newArrayList	
		return descriptors
	}
	
	private dispatch def prepareInstanceCreationTuple(InstanceCreationExpression ex, Class c, StringBuilder parent){
		val List<Pair<Type, ValueDescriptor>> descriptors = Lists.newArrayList	
		
		if(ex.parameters instanceof ExpressionList){
			val parameters = ex.parameters as ExpressionList
			val op = getOperation(parameters, c)
			
			if(op !=null){
				parameters.expressions.forEach[ expr |
					val string = expr.visit(parent)
					val descriptor = (descriptorFactory.createSingleVariableDescriptorBuilder => [
						name = string
						type = typeSystem.type(expr).value.umlType
						isExistingVariable = true
					]).build
					descriptors.add(new Pair<Type, ValueDescriptor>(typeSystem.type(expr).value.umlType, descriptor))					
				]
			}else{
				return descriptors
			}
		}else if(ex.parameters instanceof NamedTuple){
			val parameters = ex.parameters as NamedTuple
			val op = getOperation(parameters, c)
			
			if(op !=null){
				val operationParameters = op.ownedParameters

				operationParameters.forEach[operationParameter |
					parameters.expressions.forEach[ namedExpression |
						if(namedExpression.name.equals(operationParameter.name) && typeSystem.type(namedExpression.expression).value.umlType.equals(operationParameter.getType)){
							val string = namedExpression.expression.visit(parent)
							val descriptor = (descriptorFactory.createSingleVariableDescriptorBuilder => [
								name = string
								type = typeSystem.type(namedExpression.expression).value.umlType
								isExistingVariable = true
							]).build
							descriptors.add(new Pair<Type, ValueDescriptor>(typeSystem.type(namedExpression.expression).value.umlType, descriptor))
						}
					]
				]
			}else{
				return descriptors
			}
			
		}else{
			throw new UnsupportedOperationException("Only expression list and namedTuple based tuples are supported")
		}	
		return descriptors
	}
	
	private dispatch def getOperation(NamedTuple parameters, Class c){
		val candidates = c.ownedOperations.filter[op | op.name.equals(class.name)]
		val List<Operation> operations = Lists.newArrayList
		candidates.forEach[operation | 
			var valid = true
			for(NamedExpression namedExpression : parameters.expressions){
				var expressionFound = false
				for(Parameter parameter : operation.ownedParameters){
					if(namedExpression.name.equals(parameter.name) && typeSystem.type(namedExpression.expression).value.umlType.equals(parameter.getType)){
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
		val candidates = c.ownedOperations.filter[op | op.name.equals(class.name)]
		val List<Operation> operations = Lists.newArrayList
		candidates.forEach[operation | 
			var valid = true
			for(Expression expression : parameters.expressions){
				var expressionFound = false
				for(Parameter parameter : operation.ownedParameters){
					if(typeSystem.type(expression).value.umlType.equals(parameter.getType)){
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
				val string = expr.visit(parent)
				descriptors.add((descriptorFactory.createSingleVariableDescriptorBuilder => [
					name = string
					type = typeSystem.type(expr).value.umlType
					isExistingVariable = true
				]).build)
				
			]
		}else if(ex.parameters instanceof NamedTuple){
			val parameters = ex.parameters as NamedTuple
			val operationParameters = op.ownedParameters

			operationParameters.forEach[operationParameter |
				parameters.expressions.forEach[ namedExpression |
					if(namedExpression.name.equals(operationParameter.name) && typeSystem.type(namedExpression.expression).value.umlType.equals(operationParameter.getType)){
						val string = namedExpression.expression.visit(parent)
							descriptors.add((descriptorFactory.createSingleVariableDescriptorBuilder => [
							name = string
							type = typeSystem.type(namedExpression.expression).value.umlType
							isExistingVariable = true
						]).build)
					}
				]
			]
			
		}else{
			throw new UnsupportedOperationException("Only expression list and namedTuple based tuples are supported")
		}	
		return descriptors
	}
	
	private dispatch def prepareTuple(StaticFeatureInvocationExpression ex, Operation op, StringBuilder parent){
		val List<ValueDescriptor> descriptors = Lists.newArrayList
		if(ex.parameters instanceof ExpressionList){
			val parameters = ex.parameters as ExpressionList
			parameters.expressions.forEach[ expr |
				val string = expr.visit(parent)
				descriptors.add((descriptorFactory.createSingleVariableDescriptorBuilder => [
					name = string
					type = typeSystem.type(expr).value.umlType
					isExistingVariable = true
				]).build)
				
			]
		}else if(ex.parameters instanceof NamedTuple){
			val parameters = ex.parameters as NamedTuple
			val operationParameters = op.ownedParameters

			operationParameters.forEach[operationParameter |
				parameters.expressions.forEach[ namedExpression |
					if(namedExpression.name.equals(operationParameter.name) && typeSystem.type(namedExpression.expression).value.umlType.equals(operationParameter.getType)){
						val string = namedExpression.expression.visit(parent)
							descriptors.add((descriptorFactory.createSingleVariableDescriptorBuilder => [
							name = string
							type = typeSystem.type(namedExpression.expression).value.umlType
							isExistingVariable = true
						]).build)
					}
				]
			]
			
		}else{
			throw new UnsupportedOperationException("Only expression list and namedTuple based tuples are supported")
		}	
		return descriptors
	}
	
	private def isCollection(Expression ex){
		if(typeSystem.type(ex).value.umlType.equals(context.getCollectionType(CollectionType.SET))){
			true
		}else{
			false
		}
		
	}
	
	private def ValueDescriptor getCachedDescriptor(Expression ex, String string){
		var ValueDescriptor tempDescriptor
		switch(ex){
			SignalDataExpression: {
				(descriptorFactory.createSigdataDescriptorBuilder => [
					type = typeSystem.type(ex).value.umlType
				]).build
			}
			ThisExpression: {
				ex.descriptor
			}
			LiteralExpression: {
				tempDescriptor = (descriptorFactory.createLiteralDescriptorBuilder => [
					literal = string
					type = typeSystem.type(ex).value.umlType
				]).build
			}
			default : {
				tempDescriptor = descriptorFactory.getCachedVariableDescriptor(string)
			}
		}
	}
	
}