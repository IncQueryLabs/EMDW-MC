package com.incquerylabs.emdw.xtumltocpp.test.mappings

import com.ericsson.xtumlrt.oopl.cppmodel.CPPClass
import com.ericsson.xtumlrt.oopl.cppmodel.CPPModel
import com.incquerylabs.emdw.xtumltocpp.test.TransformationTest
import com.incquerylabs.emdw.xtumltocpp.test.wrappers.TransformationWrapper
import java.util.Collections
import org.eclipse.emf.ecore.resource.Resource
import org.eclipse.emf.ecore.xmi.impl.XMIResourceFactoryImpl
import org.eclipse.papyrusrt.xtumlrt.common.DirectionKind
import org.eclipse.papyrusrt.xtumlrt.common.Model
import org.eclipse.papyrusrt.xtumlrt.common.VisibilityKind
import org.eclipse.papyrusrt.xtumlrt.xtuml.XTClass
import org.junit.runner.RunWith
import org.junit.runners.Parameterized

import static extension com.incquerylabs.emdw.xtumltocpp.test.TransformationTestUtil.*

@RunWith(Parameterized)
class EventClassTypeTest extends TransformationTest<XTClass, CPPClass> {

	new(TransformationWrapper wrapper, String wrapperType) {
		super(wrapper, wrapperType)
	}

	override protected prepareXtUmlModel(Model xtumlmodel) {
		
		val pack = xtumlmodel.createXtPackage("RootPackage")
		val component = pack.createXtComponent("Component")
		val xtClass = component.createXtClass("Class")
		
		val paramClass = pack.createXtClass("ParamClass")
		pack.createTypeDefinition(paramClass, "ClassTypeDef")
		
		val topState = xtClass.createStateMachine("SM").createCompositeState("top")
		val protocol = pack.createXtProtocol("Protocol")
		
		val signal = protocol.createSignal("Signal")
		signal.createParameter(paramClass, "ClassParameter", DirectionKind.IN)
		val signalevent = component.createPort(protocol,"Port", VisibilityKind.PUBLIC).createXtSignalEvent(signal, xtClass,"signalevent")
		val init = topState.createInitialPoint("init")
		val exit = topState.createExitPoint("exit")
		val s1 = topState.createSimpleState("s1")
		val s2 = topState.createSimpleState("s2")
		s1.createExitActionCode("exit", "STATE_EXIT_CODE")
		s2.createEntryActionCode("entry", "STATE_ENTRY_CODE")
		topState.createTransition(init,s1,"t1")
		topState.createTransition(s1,s2,"t2", "TRANSITION_SAMPLE_CODE").createXTEventTrigger(signalevent, "Trigger")
		topState.createTransition(s2,exit,"t3")
	
		val reg = Resource.Factory.Registry.INSTANCE
    	val m = reg.getExtensionToFactoryMap()
    	m.put("xtumlrt", new XMIResourceFactoryImpl())
		xtumlmodel.eResource.save(Collections.EMPTY_MAP)
		xtClass
	}
	
	override protected prepareCppModel(CPPModel cppModel) {
		val res = cppModel.eResource
		val rootcppdir = res.createCPPDirectory
		val packagedir = rootcppdir.createCPPSubDirectory
		
		val pack = cppModel.commonModel.createXtPackage("RootPackage")
		val cpppack = cppModel.createCPPPackage(pack)
		
		val component = pack.createXtComponent("Component")
		val componentdir = packagedir.createCPPSubDirectory
		
		val cppcomp = cpppack.createCPPComponent(component,componentdir.createCPPHeaderFile(), componentdir.createCPPBodyFile(), componentdir.createCPPHeaderFile(),componentdir.createCPPHeaderFile())
		
		val xtClass = component.createXtClass("Class")
		val classdir = componentdir.createCPPSubDirectory
		val cppclass = cppcomp.createCPPClass(xtClass, classdir.createCPPHeaderFile(), classdir.createCPPBodyFile())
		
		val paramClass = pack.createXtClass("ParamClass")
		val paramClassdir = packagedir.createCPPSubDirectory
		cppcomp.createCPPClass(xtClass, paramClassdir.createCPPHeaderFile(), paramClassdir.createCPPBodyFile())
		
		val topState = xtClass.createStateMachine("SM").createCompositeState("top")
		
		val protocol = pack.createXtProtocol("Protocol")
		val protocoldir = packagedir.createCPPSubDirectory
		val cppprotocol = cpppack.createCPPProtocol(protocol, protocoldir.createCPPHeaderFile())
		
		val signal = protocol.createSignal("Signal")
		signal.createParameter(paramClass, "ClassParameter", DirectionKind.IN)
		cppprotocol.createCPPSignal(signal)
		
		val port = component.createPort(protocol,"Port", VisibilityKind.PUBLIC)
		val portdir = componentdir.createCPPSubDirectory
		cppcomp.createCPPPort(port, portdir.createCPPHeaderFile(), portdir.createCPPBodyFile())
		
		//val classEvent = xtClass.createXtClassEvent("event")
		val signalevent = port.createXtSignalEvent(signal, xtClass,"signalevent")
		cppclass.createCPPEvent(signalevent)
		val init = topState.createInitialPoint("init")
		val s1 = topState.createSimpleState("s1")
		val s2 = topState.createSimpleState("s2")
		s1.createExitActionCode("exit", "STATE_EXIT_CODE")
		s2.createEntryActionCode("entry", "STATE_ENTRY_CODE")
		val t1 = topState.createTransition(init,s1,"t1")
		val t2 = topState.createTransition(s1,s2,"t2", "TRANSITION_SAMPLE_CODE")
		t2.createXTEventTrigger(signalevent, "Trigger")
		
		cppclass.createCPPState(s1)
		cppclass.createCPPState(s2)
		cppclass.createCPPTransition(t1)
		cppclass.createCPPTransition(t2)
		
		val reg = Resource.Factory.Registry.INSTANCE
    	val m = reg.getExtensionToFactoryMap()
    	m.put("cpp", new XMIResourceFactoryImpl())
    	m.put("xtumlrt", new XMIResourceFactoryImpl())
		
		
		res.save(Collections.EMPTY_MAP)
		cppclass
	}
	
	override protected assertResult(Model input, CPPModel result, XTClass xtObject, CPPClass cppObject) {
		throw new UnsupportedOperationException("TODO: auto-generated method stub")
	}
	
}