package com.incquerylabs.emdw.cpp.common.descriptor.builder.impl

import com.ericsson.xtumlrt.oopl.cppmodel.CPPReturnValue
import com.google.common.base.Preconditions
import com.incquerylabs.emdw.cpp.common.descriptor.builder.IOoplStaticOperationCallBuilder
import com.incquerylabs.emdw.cpp.common.util.XtTypedValueDescriptor
import com.incquerylabs.emdw.valuedescriptor.OperationCallDescriptor
import com.incquerylabs.emdw.valuedescriptor.ValueDescriptor
import org.apache.log4j.Logger
import org.eclipse.incquery.runtime.api.AdvancedIncQueryEngine
import org.eclipse.papyrusrt.xtumlrt.common.Operation

class CppStaticOperationCallBuilder extends AbstractCppOperationCallDescriptorBuilder implements IOoplStaticOperationCallBuilder {
	private Operation operation
	private String operationName
	
	
	new(AdvancedIncQueryEngine engine) {
		super(engine)
		logger = Logger.getLogger(class)
	}
	
	override build() {
		trace('''Started building''')
		var OperationCallDescriptor ocd
		if(operation!=null) {
			ocd = prepareOperationCallDescriptor(operation) => [
				// cppOperation is calculated in prepareOperationCallDescriptor, do not move it outside
				val stringRepresentation = '''«cppOperation.cppQualifiedName»(«parameterString»)'''
			 	val otherRepresentations = stringRepresentation.createStringRepresentations(cppOperation.subElements.filter(CPPReturnValue).head)
				it.stringRepresentation = stringRepresentation
				it.valueRepresentation = otherRepresentations.valueRepresentation
				it.pointerRepresentation = otherRepresentations.pointerRepresentation
			]
		} else {
			switch(operationName) {
				case "println": {
					ocd = createOperationCallDescriptor => [
						it.baseType = "void"
						it.fullType = it.baseType
						it.stringRepresentation = '''::std::cout«FOR param : params.map[descriptor] BEFORE " << " SEPARATOR " << "»«param.stringRepresentation»«ENDFOR» << ::std::endl'''
						it.pointerRepresentation = "// No pointer representation for println"
						it.valueRepresentation = it.stringRepresentation
					]
				}
				case "toString": {
					Preconditions.checkArgument(params.size==1, '''The toString method has one parameter but «params.size» was caught.''')
					val stringType = mapper.findBasicType("string")
					ocd = createOperationCallDescriptor => [
						it.baseType = stringType.cppQualifiedName
						it.fullType = stringType.cppQualifiedName
						it.stringRepresentation = '''::xumlrt::to_string(«params.map[descriptor].head.stringRepresentation»)'''
						it.pointerRepresentation = it.stringRepresentation.createStringRepresentations(stringType).pointerRepresentation
						it.valueRepresentation = it.stringRepresentation.createStringRepresentations(stringType).valueRepresentation
					]
				}
				default: {
					trace('''Invalid operationName: «operationName»''')
					throw new IllegalArgumentException('''Invalid operationName: «operationName»''')
				}
			}
		}
		trace('''Finished building''')
		return ocd
	}
	
	override setOperation(Operation operation) {
		this.operation = operation
		return this
	}
	
	override setOperationName(String operationName) {
		this.operationName = operationName
		return this
	}
	
	override setParameters(XtTypedValueDescriptor<? extends ValueDescriptor>... params) {
		this.params = params
		return this
	}
	
}