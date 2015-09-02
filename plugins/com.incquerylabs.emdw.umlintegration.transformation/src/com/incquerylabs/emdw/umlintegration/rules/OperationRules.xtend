package com.incquerylabs.emdw.umlintegration.rules

import com.incquerylabs.emdw.umlintegration.queries.ConstructorOperationMatch
import com.incquerylabs.emdw.umlintegration.queries.DestructorOperationMatch
import com.incquerylabs.emdw.umlintegration.queries.RegularOperationMatch
import com.incquerylabs.emdw.umlintegration.util.ModelUtil
import com.incquerylabs.emdw.umlintegration.util.TransformationUtil
import java.util.Set
import org.eclipse.incquery.runtime.api.IncQueryEngine
import org.eclipse.papyrusrt.xtumlrt.common.Entity
import org.eclipse.papyrusrt.xtumlrt.common.Operation
import org.eclipse.papyrusrt.xtumlrt.common.Parameter
import java.util.Comparator
import org.eclipse.emf.common.util.ECollections
import com.google.common.collect.Ordering
import org.eclipse.papyrusrt.xtumlrt.common.ActionCode

class OperationRules{
	static def Set<AbstractMapping<?>> getRules(IncQueryEngine engine) {
		#{
			new OperationMapping(engine),
			new ConstructorMapping(engine),
			new DestructorMapping(engine)
		}
	}
}

/**
 * Transforms Operations which are a Class's or Component's owned operations and not named 'ClassName' or '~ClassName'
 * to the transformed Entity's operations. Transformed fields: body, static, visibility.
 */
class OperationMapping extends AbstractObjectMapping<RegularOperationMatch, org.eclipse.uml2.uml.Operation, Operation> {

	new(IncQueryEngine engine) {
		super(engine)
	}

	override getXtumlrtClass() {
		Operation
	}
	
	public static val PRIORITY = CommonPriorities.OPERATION_MAPPING_PRIORITY

	override getRulePriority() {
		PRIORITY
	}

	override getQuerySpecification() {
		regularOperation
	}

	override getUmlObject(RegularOperationMatch match) {
		match.operation
	}

	override createXtumlrtObject() {
		commonFactory.createOperation => [
			body = commonFactory.createActionCode
		]
	}

	override updateXtumlrtObject(Operation xtumlrtObject, RegularOperationMatch match) {
		val umlObject = match.umlObject;
		(xtumlrtObject.body as ActionCode).source = ModelUtil.getCppCode(umlObject)
		xtumlrtObject.static = umlObject.static
		xtumlrtObject.visibility = TransformationUtil.transform(umlObject.visibility)
		
		val umlParams = umlObject.ownedParameters
		val xtumlParams = xtumlrtObject.parameters
		// restore parameter ordering
		val ordering = Ordering.natural.onResultOf[parameter | 
			val umlParam = umlParams.findFirst[findXtumlrtObject(Parameter) == parameter]
			umlParams.indexOf(umlParam)
		]
		ECollections.sort(xtumlParams, ordering)
	}
	
	
	
	def getXtumlrtContainer(RegularOperationMatch match) {
		match.umlClass.findXtumlrtObject(Entity)
	}

	override protected insertXtumlrtObject(Operation xtumlrtObject, RegularOperationMatch match) {
		match.xtumlrtContainer.operations += xtumlrtObject
	}

}

/**
 * Transforms Operations which are a Class's or Component's owned operations named 'ClassName' with the Create stereotype 
 * to the transformed Entity's operations. Transformed fields: body, static, visibility.
 */
class ConstructorMapping extends AbstractObjectMapping<ConstructorOperationMatch, org.eclipse.uml2.uml.Operation, Operation> {

	new(IncQueryEngine engine) {
		super(engine)
	}

	override getXtumlrtClass() {
		Operation
	}
	
	public static val PRIORITY = CommonPriorities.OPERATION_MAPPING_PRIORITY

	override getRulePriority() {
		PRIORITY
	}

	override getQuerySpecification() {
		constructorOperation
	}

	override getUmlObject(ConstructorOperationMatch match) {
		match.operation
	}

	override createXtumlrtObject() {
		commonFactory.createOperation => [
			body = commonFactory.createActionCode
		]
	}

	override updateXtumlrtObject(Operation xtumlrtObject, ConstructorOperationMatch match) {
		val umlObject = match.umlObject;
		(xtumlrtObject.body as ActionCode).source = ModelUtil.getCppCode(umlObject)
		xtumlrtObject.static = umlObject.static
		xtumlrtObject.visibility = TransformationUtil.transform(umlObject.visibility)
	}
	
	def getXtumlrtContainer(ConstructorOperationMatch match) {
		match.umlClass.findXtumlrtObject(Entity)
	}

	override protected insertXtumlrtObject(Operation xtumlrtObject, ConstructorOperationMatch match) {
		match.xtumlrtContainer.operations += xtumlrtObject
	}

}

/**
 * Transforms Operations which are a Class's or Component's owned operations named '~ClassName' with the Destroy stereotype 
 * to the transformed Entity's operations. Transformed fields: body, static, visibility.
 */
class DestructorMapping extends AbstractObjectMapping<DestructorOperationMatch, org.eclipse.uml2.uml.Operation, Operation> {

	new(IncQueryEngine engine) {
		super(engine)
	}

	override getXtumlrtClass() {
		Operation
	}
	
	public static val PRIORITY = CommonPriorities.OPERATION_MAPPING_PRIORITY

	override getRulePriority() {
		PRIORITY
	}

	override getQuerySpecification() {
		destructorOperation
	}

	override getUmlObject(DestructorOperationMatch match) {
		match.operation
	}

	override createXtumlrtObject() {
		commonFactory.createOperation => [
			body = commonFactory.createActionCode
		]
	}

	override updateXtumlrtObject(Operation xtumlrtObject, DestructorOperationMatch match) {
		val umlObject = match.umlObject;
		(xtumlrtObject.body as ActionCode).source = ModelUtil.getCppCode(umlObject)
		xtumlrtObject.static = umlObject.static
		xtumlrtObject.visibility = TransformationUtil.transform(umlObject.visibility)
	}
	
	def getXtumlrtContainer(DestructorOperationMatch match) {
		match.umlClass.findXtumlrtObject(Entity)
	}

	override protected insertXtumlrtObject(Operation xtumlrtObject, DestructorOperationMatch match) {
		match.xtumlrtContainer.operations += xtumlrtObject
	}
}
