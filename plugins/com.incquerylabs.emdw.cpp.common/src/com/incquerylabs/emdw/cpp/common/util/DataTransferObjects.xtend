package com.incquerylabs.emdw.cpp.common.util

import com.google.common.base.Optional
import com.incquerylabs.emdw.valuedescriptor.ValueDescriptor
import java.util.List
import org.eclipse.uml2.uml.Operation
import org.eclipse.uml2.uml.Type
import org.eclipse.xtend.lib.annotations.Data

@Data
class OperationTypedValueDescriptorPair<Descriptor extends ValueDescriptor> {
	Optional<Operation> operation
	List<UmlTypedValueDescriptor<? extends Descriptor>> typedValueDescriptors
}

@Data
class UmlTypedValueDescriptor<Descriptor extends ValueDescriptor> {
	Type type;
	Descriptor descriptor;
}

@Data
class XtTypedValueDescriptor<Descriptor extends ValueDescriptor> {
	org.eclipse.papyrusrt.xtumlrt.common.Type type;
	Descriptor descriptor;
}