/*******************************************************************************
 * Copyright (c) 2015-2016, IncQuery Labs Ltd. and Ericsson AB
 * All rights reserved. This program and the accompanying materials
 * are made available under the terms of the Eclipse Public License v1.0
 * which accompanies this distribution, and is available at
 * http://www.eclipse.org/legal/epl-v10.html
 *
 * Contributors:
 *   Akos Horvath, Abel Hegedus, Zoltan Ujhelyi, Daniel Segesdi, Tamas Borbas, Robert Doczi, Peter Lunk - initial API and implementation
 *******************************************************************************/
package com.incquerylabs.uml.ralf.snippetcompiler

import com.incquerylabs.emdw.cpp.common.descriptor.factory.IUmlDescriptorFactory
import com.incquerylabs.emdw.valuedescriptor.ValueDescriptor
import com.incquerylabs.uml.ralf.ReducedAlfSystem
import com.incquerylabs.uml.ralf.reducedAlfLanguage.AssignmentExpression
import com.incquerylabs.uml.ralf.reducedAlfLanguage.AssociationAccessExpression
import com.incquerylabs.uml.ralf.reducedAlfLanguage.BooleanLiteralExpression
import com.incquerylabs.uml.ralf.reducedAlfLanguage.CastExpression
import com.incquerylabs.uml.ralf.reducedAlfLanguage.ClassExtentExpression
import com.incquerylabs.uml.ralf.reducedAlfLanguage.CollectionVariable
import com.incquerylabs.uml.ralf.reducedAlfLanguage.LinkOperationExpression
import com.incquerylabs.uml.ralf.reducedAlfLanguage.LocalNameDeclarationStatement
import com.incquerylabs.uml.ralf.reducedAlfLanguage.NameExpression
import com.incquerylabs.uml.ralf.reducedAlfLanguage.NamedTuple
import com.incquerylabs.uml.ralf.reducedAlfLanguage.NaturalLiteralExpression
import com.incquerylabs.uml.ralf.reducedAlfLanguage.RealLiteralExpression
import com.incquerylabs.uml.ralf.reducedAlfLanguage.StringLiteralExpression
import com.incquerylabs.uml.ralf.reducedAlfLanguage.ThisExpression
import com.incquerylabs.uml.ralf.reducedAlfLanguage.Variable
import com.incquerylabs.uml.ralf.scoping.IUMLContextProvider
import org.eclipse.uml2.uml.Association
import org.eclipse.uml2.uml.Parameter
import org.eclipse.uml2.uml.Property
import org.eclipse.uml2.uml.Type
import org.eclipse.uml2.uml.EnumerationLiteral
import com.incquerylabs.uml.ralf.reducedAlfLanguage.NamedExpression
import org.eclipse.uml2.uml.Enumeration

class SnippetTemplateCompilerUtil {
	
	public IUmlDescriptorFactory descriptorFactory;
	public IUMLContextProvider context
	private val ReducedAlfSystem typeSystem
	
	new(IUmlDescriptorFactory factory, IUMLContextProvider context, ReducedAlfSystem typeSystem){
		descriptorFactory = factory
		this.context = context
		this.typeSystem = typeSystem
	}	
	//Descriptors
	//Model Access
	
	def dispatch ValueDescriptor getDescriptor(ThisExpression ex){
		return (descriptorFactory.createSingleVariableDescriptorBuilder => [
			name = "this"
			type = context.getThisType(ex)
			isExistingVariable = true
		]).build	
	}
	
		
//	def dispatch ValueDescriptor getDescriptor(FeatureInvocationExpression ex) {
//	    switch (ex.feature) {
//	        Operation: getDescriptor(ex, ex.feature as Operation)
//	        Property: getDescriptor(ex, ex.feature as Property)
//	        default: throw new UnsupportedOperationException("Invalid feature invocation")
//	    } 
//	}
	    
//	private def ValueDescriptor getDescriptor(FeatureInvocationExpression ex, Operation op){
//		val parameters = ex.parameters
//		val List<ValueDescriptor> descriptors = Lists.newArrayList
//		
//		
//		if(parameters instanceof ExpressionList){
//			for(Expression expression : parameters.expressions){
//				descriptors.add(getDescriptor(expression))
//			}
//		}	
//		
//		val descriptor = (descriptorFactory.createOperationCallBuilder => [
//			variable = getDescriptor(ex.context)
//			operation = op
//			parameters = descriptors
//		]).build
//		descriptor
//			
//	}
	
//	private def ValueDescriptor getDescriptor(FeatureInvocationExpression ex, Property prop){
//		(descriptorFactory.createPropertyReadBuilder => [
//			variable = getDescriptor(ex.context)
//			property = prop
//		]).build
//	}
	
	def dispatch ValueDescriptor getDescriptor(AssociationAccessExpression ex){
		(descriptorFactory.createPropertyReadBuilder => [
			variable = getDescriptor(ex.context)
			property = ex.association
		]).build
	}
	
	def ValueDescriptor getDescriptor(AssignmentExpression ex, Property prop){
		val lhs = ex.leftHandSide
		if (lhs != null) {
			return (descriptorFactory.createPropertyWriteBuilder => [
				variable = getDescriptor(lhs)
				property = prop
				newValue = getDescriptor(ex.rightHandSide)
			]).build
		}
		return null
	}
	 	
	//Variables
	
	def dispatch ValueDescriptor getDescriptor(CastExpression ex){
		(descriptorFactory.createSingleVariableDescriptorBuilder => [
			type = typeSystem.type(ex).value.umlType
		]).build
		
	}	
	
	def dispatch ValueDescriptor getDescriptor(LocalNameDeclarationStatement st){
		if(st.variable instanceof CollectionVariable){
			val collection = st.variable as CollectionVariable
			(descriptorFactory.createCollectionVariableDescriptorBuilder => [
				name = collection.name
				collectionType = context.getCollectionType(collection.collectionType)
				elementType = collection.type.type
			]).build
		}else{
			(descriptorFactory.createSingleVariableDescriptorBuilder => [
				name = st.variable.name
				type = typeSystem.objectType(st.variable, st).value.umlType
				// if the statement has no expression and is not an enum, then initialization is also needed
				initialize = (st.expression == null) && !(typeSystem.objectType(st.variable, st).value.umlType instanceof Enumeration)
			]).build
		}
	}
		
	def dispatch ValueDescriptor getDescriptor(NameExpression ex){
		if(ex.reference instanceof CollectionVariable){
			val collection = ex.reference as CollectionVariable
			(descriptorFactory.createCollectionVariableDescriptorBuilder => [
				name = collection.name
				collectionType = context.getCollectionType(collection.collectionType)
				elementType = collection.type.type
				isExistingVariable = true
			]).build
		}else if(ex.reference instanceof Variable){
			val variable = ex.reference as Variable
			if(variable != null){
				return (descriptorFactory.createSingleVariableDescriptorBuilder => [
					name = variable.name
					type = typeSystem.objectType(variable, ex).value.umlType
					isExistingVariable = true
				]).build	
			}
		}else if (ex.reference instanceof Parameter){
			val parameter = ex.reference as Parameter
			if(parameter != null){
				return (descriptorFactory.createParameterDescriptorBuilder => [
					it.parameter = parameter
				]).build	
			}
		}else if (ex.reference instanceof EnumerationLiteral) {
			val enumLiteral = ex.reference as EnumerationLiteral
			if(enumLiteral != null) {
				return (descriptorFactory.createEnumerationLiteralDescriptorBuilder => [
					enumerationLiteral = enumLiteral
				]).build
			}
		}else{
			throw new UnsupportedOperationException("Only single/collection variables and parameters are supported")
		}
	}
	
	def dispatch ValueDescriptor getDescriptor(NaturalLiteralExpression ex){
		(descriptorFactory.createLiteralDescriptorBuilder => [
			literal = ex.value
			type = context.getPrimitiveType(IUMLContextProvider.INTEGER_TYPE)
		]).build
	}
	
	def dispatch ValueDescriptor getDescriptor(RealLiteralExpression ex){
		(descriptorFactory.createLiteralDescriptorBuilder => [
			literal = ex.value
			type = context.getPrimitiveType(IUMLContextProvider.REAL_TYPE)
		]).build
	}
	
	def dispatch ValueDescriptor getDescriptor(StringLiteralExpression ex){
		(descriptorFactory.createLiteralDescriptorBuilder => [
			literal = "\""+ex.value+"\""
			type = context.getPrimitiveType(IUMLContextProvider.STRING_TYPE)
		]).build
	}
	
	def dispatch ValueDescriptor getDescriptor(BooleanLiteralExpression ex){
		(descriptorFactory.createLiteralDescriptorBuilder => [
			literal = ex.value
			type = context.getPrimitiveType(IUMLContextProvider.BOOLEAN_TYPE)
		]).build
	}
	
	def dispatch ValueDescriptor getDescriptor(ClassExtentExpression ex){
		val reference = ex.class_.reference
		if(reference instanceof Type){
			return (descriptorFactory.createInstancesBuilder => [
				umlClass = reference
			]).build
		} else {
			throw new UnsupportedOperationException("Only type references are supported in ClassExtentExpressions")
		}
	}
	
	def dispatch ValueDescriptor getDescriptor(LinkOperationExpression ex){
		val reference = ex.association.reference
		val parameters = ex.parameters as NamedTuple
		
		val sourceNamedExpression = parameters.expressions.get(0)
		val targetNamedExpression = parameters.expressions.get(1)
		
		val sourceDescriptor = sourceNamedExpression.expression.descriptor
		val targetDescriptor = targetNamedExpression.expression.descriptor
		
		if(reference instanceof Association){
			val sourceProperty= reference.memberEnds.findFirst[name == sourceNamedExpression.name]
			val targetProperty= reference.memberEnds.findFirst[name == targetNamedExpression.name]
			
			val isUnlink = switch ex.linkOperation {
				case UNLINK : true
				case LINK : false
			}
			return (descriptorFactory.createLinkUnlinkBuilder => [
				it.isUnlink(isUnlink)
				it.association = reference
				it.sourceProperty = sourceProperty
				it.targetProperty = targetProperty
				it.sourceDescriptor = sourceDescriptor
				it.targetDescriptor = targetDescriptor
			]).build
		} else {
			throw new UnsupportedOperationException("Only association references are supported in LinkOperationExpression")
		}
	}
	
}
