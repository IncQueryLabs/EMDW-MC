package com.incquerylabs.emdw.cpp.common.descriptor.builder.impl

import com.ericsson.xtumlrt.oopl.cppmodel.CPPClass
import com.incquerylabs.emdw.cpp.common.descriptor.builder.IOoplConstructorCallBuilder
import com.incquerylabs.emdw.cpp.common.util.XtTypedValueDescriptor
import com.incquerylabs.emdw.valuedescriptor.ValueDescriptor
import com.incquerylabs.emdw.valuedescriptor.ValuedescriptorFactory
import org.apache.log4j.Logger
import org.eclipse.incquery.runtime.api.AdvancedIncQueryEngine
import org.eclipse.papyrusrt.xtumlrt.common.Operation
import org.eclipse.papyrusrt.xtumlrt.common.RedefinableElement
import org.eclipse.papyrusrt.xtumlrt.common.Type
import org.eclipse.papyrusrt.xtumlrt.xtuml.XTClassEvent

class CppConstructorCallBuilder extends AbstractCppOperationCallDescriptorBuilder implements IOoplConstructorCallBuilder {
	protected static extension ValuedescriptorFactory factory = ValuedescriptorFactory.eINSTANCE
	
	private RedefinableElement re
	private Operation xtOperation
	
	
	new(AdvancedIncQueryEngine engine) {
		super(engine)
		logger = Logger.getLogger(class)
	}
	
	override build() {
		trace('''Started building''')
		val ocd = prepareOperationCallDescriptor(xtOperation, false) => [
			if(re instanceof XTClassEvent) {
				val cppEvent = mapper.convertEvent(re)
				trace('''Resolved event: «cppEvent.cppQualifiedName»''')
				it.baseType = cppEvent.convertToType
				it.fullType = it.baseType
				it.stringRepresentation = '''new «cppEvent.convertToQualifiedName»()'''
			} else {
				val cppClass = mapper.convertType(re as Type) as CPPClass
				trace('''Resolved class: «cppClass.cppQualifiedName»''')
				it.baseType = cppClass.convertToType
				it.fullType = it.baseType
				it.stringRepresentation = '''new «cppClass.convertToQualifiedName»(«IF xtOperation != null»«parameterString»«ENDIF»)'''
			}
		]
		trace('''Finished building''')
		return ocd
	}
	
	override setRedefinableElement(RedefinableElement re) {
		this.re = re
		return this
	}
	
	override setParameters(XtTypedValueDescriptor<? extends ValueDescriptor>... params) {
		this.params = params
		return this
	}
	
	override setOperation(Operation xtOperation) {
		this.xtOperation = xtOperation
		this
	}
	
}