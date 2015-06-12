package com.incquerylabs.emdw.cpp.transformation.test.generator

import com.ericsson.xtumlrt.oopl.cppmodel.CPPClass
import com.ericsson.xtumlrt.oopl.cppmodel.CPPModel
import com.incquerylabs.emdw.cpp.transformation.test.TransformationTest
import com.incquerylabs.emdw.cpp.transformation.test.wrappers.TransformationWrapper
import java.util.Collections
import org.eclipse.emf.ecore.resource.Resource
import org.eclipse.emf.ecore.xmi.impl.XMIResourceFactoryImpl
import org.eclipse.papyrusrt.xtumlrt.common.DirectionKind
import org.eclipse.papyrusrt.xtumlrt.common.Model
import org.eclipse.papyrusrt.xtumlrt.common.VisibilityKind
import org.eclipse.papyrusrt.xtumlrt.xtuml.XTClass
import org.junit.runner.RunWith
import org.junit.runners.Parameterized

import static org.junit.Assert.*

import static extension com.incquerylabs.emdw.cpp.transformation.test.TransformationTestUtil.*
import org.junit.Ignore

/**
 * This test case generates a complex instance model, providing 
 * a reference for future transformation development
 * 
 * Contains: 
 * 	Multiple type definitions
 * 	Multiple components with classes and state machines
 * 	Multiple signal events
 * 	Complex, multi-layer state machines
 * 
 * The generated instance model can be found in the model/GenerateComplexModelTest_single/ref folder
 */
@Ignore("Enable to recreate example models")
@RunWith(Parameterized)
class GenerateComplexModelTest extends TransformationTest<XTClass, CPPClass> {

	new(TransformationWrapper wrapper, String wrapperType) {
		super(wrapper, wrapperType)
	}
		
	override protected prepareXtUmlModel(Model xtumlmodel) {
		val pack = xtumlmodel.createPackage("RootPackage")
		
		//add packages

		val typesPack = pack.createPackage("RootPackage")
	
		//add components and classes
		val component = pack.createXtComponent("Component")
		
		val component2 = pack.createXtComponent("Component2")
		
		val xtClass = component.createXtClass("Class")
		val xtClass2 = component2.createXtClass("Class")
		val paramClass = typesPack.createXtClass("ParamClass")
		
		val typedef = pack.createTypeDefinition("IntDefinition")
		val primitiveType = createPrimitiveType(typedef, "Integer")
		val typedef2 = pack.createTypeDefinition("UserTypeDefinition")
		val userDefinedType = createUserDefinedType(typedef2, "UserDefinedType")

		
		//protocols and signals
		
		val protocol = pack.createXtProtocol("Protocol")	
		
		val primitive = protocol.createSignal("PrimitiveSignal")
		primitive.createParameter(primitiveType, "PrimitiveAttr", DirectionKind.IN)
		
		val userDefined = protocol.createSignal("Signal")
		userDefined.createParameter(userDefinedType, "UserDefinedAttr", DirectionKind.IN)
	
		val classSignal = protocol.createSignal("Signal")
		classSignal.createParameter(paramClass, "ClassAttr", DirectionKind.IN)
	
		val port = component.createPort(protocol,"port", VisibilityKind.PUBLIC)
		val port2 = component2.createPort(protocol,"port", VisibilityKind.PUBLIC)
	

		//Class
		
		val e2 = port.createXtSignalEvent(userDefined, xtClass,"e2")
		val e3 = port.createXtSignalEvent(classSignal, xtClass,"e3")
		
		xtClass.createSingleAttribute(primitiveType, VisibilityKind.PUBLIC, false,"i")
		
		xtClass.createOperation(VisibilityKind.PUBLIC,false,null,"operation","Operation",
			userDefinedType.createParameter("a", DirectionKind.IN),
			paramClass.createParameter("b", DirectionKind.IN)
		)

		val topState = xtClass.createStateMachine("SM").createCompositeState("top")
	
		val init = topState.createInitialPoint("init")
		
		val s1 = topState.createSimpleState("s1")
		val s2 = topState.createSimpleState("s2")
		val s3 = topState.createCompositeState("s3")
		val s4 = topState.createSimpleState("s4")
		val s5 = topState.createSimpleState("s5")
		
		val hist = topState.createDeepHistory("hist")
		val s31 = topState.createSimpleState("s31")
		val s32 = topState.createSimpleState("s32")
		val s33 = topState.createSimpleState("s33")
		
		s1.createEntryActionCode("entry1", "//Entry behavior")
		s3.createEntryActionCode("entry2", "//Entry behavior")
		s3.createExitActionCode("exit1", "//Exit behavior")
		s4.createExitActionCode("exit2", "//Exit behavior")
		
		topState.createTransition(init,s1,"t1")
		topState.createTransition(s1,s2,"t2", "//Transition action")
		val t3 = topState.createTransition(s2,s4,"t3")
		val t4 = topState.createTransition(s4,s3,"t4", "//Transition action")
		val t5 = topState.createTransition(s4,s5,"t5", "//Transition action")
		topState.createTransition(hist,s31,"t6")
		topState.createTransition(s31,s32,"t7")
		val t8 = topState.createTransition(s31,s33,"t8")
		topState.createTransition(s32,s33,"t9")
		topState.createTransition(s1,s3,"t10")
		topState.createTransition(s33,s5,"t11")

		t3.createGuard("t3guard","[i>10]")
		t5.createGuard("t5guard","[i>15]")

		t4.createXTEventTrigger(e3, "t4Trigger")
		t5.createXTEventTrigger(e3, "t5Trigger")
		t8.createXTEventTrigger(e2, "t8Trigger")
		

		//class2
		
		val e32 = port2.createXtSignalEvent(classSignal, xtClass2,"e3")
		
		val topState2 = xtClass2.createStateMachine("SM2").createCompositeState("top2")
	
		val init2 = topState2.createInitialPoint("ini2t")
		val s6 = topState2.createSimpleState("s6")

		s6.createExitActionCode("exit3", "//Exit behavior")
		
		topState2.createTransition(init2,s6,"t12")
		val t13 = topState2.createTransition(s6,s6,"t13")

		t13.createXTEventTrigger(e32, "t13Trigger")
		

		val reg = Resource.Factory.Registry.INSTANCE
    	val m = reg.getExtensionToFactoryMap()
    	m.put("xtuml", new XMIResourceFactoryImpl())
		
		
		xtumlmodel.eResource.save(Collections.EMPTY_MAP)
		
		xtClass
	}
		
	override protected prepareCppModel(CPPModel cppModel) {
		val res = cppModel.eResource
		val rootcppdir = res.createCPPDirectory
		
		val packagedir = rootcppdir.createCPPSubDirectory
		val pack = cppModel.commonModel.createPackage("RootPackage")
		val cpppack = cppModel.createCPPPackage(pack)
		
		//add packages
		val typesdir = packagedir.createCPPSubDirectory
		val typesPack = pack.createPackage("RootPackage")
		val cpptypes = cpppack.createCPPPackage(pack)
	
		//add components and classes
		val component = pack.createXtComponent("Component")
		val componentdir = packagedir.createCPPSubDirectory
		
		val component2 = pack.createXtComponent("Component2")
		val componentdir2 = packagedir.createCPPSubDirectory
		
		val cppcomp = cpppack.createCPPComponent(component,componentdir.createCPPHeaderFile(), componentdir.createCPPBodyFile(), componentdir.createCPPHeaderFile(),componentdir.createCPPHeaderFile())
		cppcomp.bodyDirectory = componentdir
		cppcomp.headerDirectory = componentdir
		val cppcomp2 = cpppack.createCPPComponent(component2,componentdir2.createCPPHeaderFile(), componentdir2.createCPPBodyFile(), componentdir2.createCPPHeaderFile(),componentdir2.createCPPHeaderFile())
		cppcomp2.bodyDirectory = componentdir2
		cppcomp2.headerDirectory = componentdir2
		
		val xtClass = component.createXtClass("Class")
		val classdir = componentdir.createCPPSubDirectory
		val cppclass = cppcomp.createCPPClass(xtClass, classdir.createCPPHeaderFile(), classdir.createCPPBodyFile())
		
		val xtClass2 = component2.createXtClass("Class")
		val classdir2 = componentdir2.createCPPSubDirectory
		val cppclass2 = cppcomp2.createCPPClass(xtClass, classdir2.createCPPHeaderFile(), classdir2.createCPPBodyFile())
		
		val paramClass = typesPack.createXtClass("ParamClass")
		val paramClassdir = typesdir.createCPPSubDirectory
		cpptypes.createCPPClass(xtClass, paramClassdir.createCPPHeaderFile(), paramClassdir.createCPPBodyFile())
		
		val typedef = pack.createTypeDefinition("IntDefinition")
		val primitiveType = createPrimitiveType(typedef, "Integer")
		val typedef2 = pack.createTypeDefinition("UserTypeDefinition")
		val userDefinedType = createUserDefinedType(typedef2, "UserDefinedType")

		//protocols and signals
		
		val protocol = pack.createXtProtocol("Protocol")
		val protocoldir = packagedir.createCPPSubDirectory
		val cppprotocol = cpppack.createCPPProtocol(protocol, protocoldir.createCPPHeaderFile())
		
		
		val primitive = protocol.createSignal("PrimitiveSignal")
		primitive.createParameter(primitiveType, "PrimitiveAttr", DirectionKind.IN)
		cppprotocol.createCPPSignal(primitive)
		
		val userDefined = protocol.createSignal("Signal")
		userDefined.createParameter(userDefinedType, "UserDefinedAttr", DirectionKind.IN)
		cppprotocol.createCPPSignal(userDefined)
		
		val classSignal = protocol.createSignal("Signal")
		classSignal.createParameter(paramClass, "ClassAttr", DirectionKind.IN)
		cppprotocol.createCPPSignal(classSignal)
		
		val port = component.createPort(protocol,"port", VisibilityKind.PUBLIC)
		val portdir = componentdir.createCPPSubDirectory
		cppcomp.createCPPPort(port, portdir.createCPPHeaderFile(), portdir.createCPPBodyFile())
		
		val port2 = component2.createPort(protocol,"port", VisibilityKind.PUBLIC)
		val portdir2 = componentdir2.createCPPSubDirectory
		cppcomp2.createCPPPort(port2, portdir2.createCPPHeaderFile(), portdir2.createCPPBodyFile())
		
		
		
		
		//Class
		
		val e2 = port.createXtSignalEvent(userDefined, xtClass,"e2")
		cppclass.createCPPEvent(e2)
		val e3 = port.createXtSignalEvent(classSignal, xtClass,"e3")
		cppclass.createCPPEvent(e3)
		
		val attr = xtClass.createSingleAttribute(primitiveType, VisibilityKind.PUBLIC, false,"i")
		cppclass.createCPPAttribute(attr)
		
		val op = xtClass.createOperation(VisibilityKind.PUBLIC,false,null,"operation","Operation",
			userDefinedType.createParameter("a", DirectionKind.IN),
			paramClass.createParameter("b", DirectionKind.IN)
		)
		cppclass.createCPPOperation(op)

		val topState = xtClass.createStateMachine("SM").createCompositeState("top")
	
		val init = topState.createInitialPoint("init")
		
		val s1 = topState.createSimpleState("s1")
		val s2 = topState.createSimpleState("s2")
		val s3 = topState.createCompositeState("s3")
		val s4 = topState.createSimpleState("s4")
		val s5 = topState.createSimpleState("s5")
		
		val hist = s3.createDeepHistory("hist")
		val s31 = s3.createSimpleState("s31")
		val s32 = s3.createSimpleState("s32")
		val s33 = s3.createSimpleState("s33")
		
		s1.createEntryActionCode("entry1", "//Entry behavior")
		s3.createEntryActionCode("entry2", "//Entry behavior")
		s3.createExitActionCode("exit1", "//Exit behavior")
		s4.createExitActionCode("exit2", "//Exit behavior")
		
		val t1 = topState.createTransition(init,s1,"t1")
		val t2 = topState.createTransition(s1,s2,"t2", "//Transition action")
		val t3 = topState.createTransition(s2,s4,"t3")
		val t4 = topState.createTransition(s4,s3,"t4", "//Transition action")
		val t5 = topState.createTransition(s4,s5,"t5", "//Transition action")
		val t6 = topState.createTransition(hist,s31,"t6")
		val t7 = topState.createTransition(s31,s32,"t7")
		val t8 = topState.createTransition(s31,s33,"t8")
		val t9 = topState.createTransition(s32,s33,"t9")
		val t10 = topState.createTransition(s1,s3,"t10")
		val t11 = topState.createTransition(s33,s5,"t11")

		t3.createGuard("t3guard","[i>10]")
		t5.createGuard("t5guard","[i>15]")

		t4.createXTEventTrigger(e3, "t4Trigger")
		t5.createXTEventTrigger(e3, "t5Trigger")
		t8.createXTEventTrigger(e2, "t8Trigger")
		
		cppclass.createCPPState(s1)
		cppclass.createCPPState(s2)
		cppclass.createCPPState(s3)
		cppclass.createCPPState(s4)
		cppclass.createCPPState(s5)
		cppclass.createCPPState(s31)
		cppclass.createCPPState(s32)
		cppclass.createCPPState(s33)

		cppclass.createCPPTransition(t1)
		cppclass.createCPPTransition(t2)
		cppclass.createCPPTransition(t3)
		cppclass.createCPPTransition(t4)
		cppclass.createCPPTransition(t5)
		cppclass.createCPPTransition(t6)
		cppclass.createCPPTransition(t7)
		cppclass.createCPPTransition(t8)
		cppclass.createCPPTransition(t9)
		cppclass.createCPPTransition(t10)
		cppclass.createCPPTransition(t11)

		//class2
		
		val e32 = port.createXtSignalEvent(classSignal, xtClass2,"e3")
		cppclass2.createCPPEvent(e32)
		
		val topState2 = xtClass2.createStateMachine("SM2").createCompositeState("top2")
	
		val init2 = topState2.createInitialPoint("ini2t")
		val s6 = topState2.createSimpleState("s6")

		s6.createExitActionCode("exit3", "//Exit behavior")
		
		val t12 = topState2.createTransition(init2,s6,"t12")
		val t13 = topState2.createTransition(s6,s6,"t13")

		t13.createXTEventTrigger(e32, "t13Trigger")
		
		cppclass2.createCPPState(s6)

		cppclass2.createCPPTransition(t12)
		cppclass2.createCPPTransition(t13)

		
		//save
		val reg = Resource.Factory.Registry.INSTANCE
    	val m = reg.getExtensionToFactoryMap()
    	m.put("cpp", new XMIResourceFactoryImpl())
    	m.put("xtuml", new XMIResourceFactoryImpl())
		
		
		res.save(Collections.EMPTY_MAP)
		cppclass
	}
	
	override protected assertResult(Model input, CPPModel result, XTClass xtObject, CPPClass cppObject) {
		assertTrue(true)
	}

}