package com.incquerylabs.emdw.cpp.transformation.test.monitor

import com.incquerylabs.emdw.cpp.transformation.test.wrappers.TransformationWrapper
import org.eclipse.papyrusrt.xtumlrt.common.ActionChain
import org.eclipse.papyrusrt.xtumlrt.common.ActionCode
import org.eclipse.papyrusrt.xtumlrt.common.Attribute
import org.eclipse.papyrusrt.xtumlrt.common.CompositeState
import org.eclipse.papyrusrt.xtumlrt.common.DirectionKind
import org.eclipse.papyrusrt.xtumlrt.common.InitialPoint
import org.eclipse.papyrusrt.xtumlrt.common.Model
import org.eclipse.papyrusrt.xtumlrt.common.Operation
import org.eclipse.papyrusrt.xtumlrt.common.Package
import org.eclipse.papyrusrt.xtumlrt.common.Parameter
import org.eclipse.papyrusrt.xtumlrt.common.PrimitiveType
import org.eclipse.papyrusrt.xtumlrt.common.SimpleState
import org.eclipse.papyrusrt.xtumlrt.common.StateMachine
import org.eclipse.papyrusrt.xtumlrt.common.Transition
import org.eclipse.papyrusrt.xtumlrt.common.VisibilityKind
import org.eclipse.papyrusrt.xtumlrt.xtuml.XTAssociation
import org.eclipse.papyrusrt.xtumlrt.xtuml.XTClass
import org.eclipse.papyrusrt.xtumlrt.xtuml.XTClassEvent
import org.eclipse.papyrusrt.xtumlrt.xtuml.XTComponent
import org.eclipse.papyrusrt.xtumlrt.xtuml.XTEventTrigger

import static extension com.incquerylabs.emdw.cpp.transformation.test.TransformationTestUtil.*

abstract class XtumlMonitorWithModelBaseTest extends XtumlMonitorBaseTest {
	
	protected PrimitiveType _type_boolean
	protected PrimitiveType _type_integer
	protected XTComponent _component_PingPong
	protected Package _package_InnerPackage
	protected XTClass _class_Ping
	protected XTAssociation _association_R1pong
	protected XTClassEvent _classevent_Pong_s
	protected XTClassEvent _classevent_Pong_s2
	protected StateMachine _statemachine_Ping_SM
	protected CompositeState _compositestate_ping
	protected InitialPoint _initialpoint_ping_Initial
	protected SimpleState _simplestate_ping_S1
	protected ActionCode _actioncode_ping_s1entry
	protected SimpleState _simplestate_ping_S2
	protected ActionCode _actioncode_ping_s2entry
	protected Transition _transition_ping_E1
	protected XTEventTrigger _eventtrigger_ping_e1
	protected Transition _transition_ping_E2
	protected XTEventTrigger _eventtrigger_ping_e2
	protected Transition _transition_ping_I
	protected XTClass _class_Pong
	protected XTAssociation _association_R1ping
	protected XTClassEvent _classevent_Ping_s
	protected StateMachine _statemachine_Pong_SM
	protected CompositeState _compositestate_pong
	protected InitialPoint _initialpoint_pong_Initial
	protected SimpleState _simplestate_pong_S1
	protected SimpleState _simplestate_pong_S2
	protected ActionCode _actioncode_pong_s2entry
	protected Transition _transition_pong_E1
	protected XTEventTrigger _eventtrigger_pong_e1
	protected Transition _transition_pong_E2
	protected XTEventTrigger _eventtrigger_pong_e2
	protected ActionChain _actionchain_pong_e2
	protected ActionCode _actioncode_pong_e2
	protected Transition _transition_pong_I
	protected XTClass _class_TableUser
	protected Attribute _attribute_isPlaying
	protected Operation _operation_setIsPlaying
	protected Parameter _parameter_isPlaying
	protected XTComponent _component_Other
	
	new(TransformationWrapper wrapper, String wrapperType) {
		super(wrapper, wrapperType)
	}
	
	/**
	 * Missing elements: Guard, redefines in class, generalization<br/>
	 * Structure:
	 * <pre>
	 * Model
	 *   ├─ PrimitiveType _type_boolean
	 *   ├─ PrimitiveType _type_integer
	 *   ├─ XTComponent _component_PingPong
	 *   │    ├─ Package _package_InnerPackage
	 *   │    │    ├─ XTClass _class_Ping
	 *   │    │    │    ├─ XTAssociation _association_R1pong
	 *   │    │    │    ├─ XTClassEvent _classevent_Pong_s
	 *   │    │    │    ├─ XTClassEvent _classevent_Pong_s2
	 *   │    │    │    └─ StateMachine _statemachine_Ping_SM
	 *   │    │    │         └─ CompositeState _compositestate_ping
	 *   │    │    │              ├─ InitialPoint _initialpoint_ping_Initial
	 *   │    │    │              ├─ SimpleState _simplestate_ping_S1
	 *   │    │    │              │    └─ ActionCode _actioncode_ping_s1entry
	 *   │    │    │              ├─ SimpleState _simplestate_ping_S2
	 *   │    │    │              │    └─ ActionCode _actioncode_ping_s2entry
	 *   │    │    │              ├─ Transition _transition_ping_E1
	 *   │    │    │              │    └─ XTEventTrigger _eventtrigger_ping_e1
	 *   │    │    │              ├─ Transition _transition_ping_E2
	 *   │    │    │              │    └─ XTEventTrigger _eventtrigger_ping_e2
	 *   │    │    │              └─ Transition _transition_ping_I
	 *   │    │    └─ XTClass _class_Pong
	 *   │    │         ├─ XTAssociation _association_R1ping
	 *   │    │         ├─ XTClassEvent _classevent_Ping_s
	 *   │    │         └─ StateMachine _statemachine_Pong_SM
	 *   │    │              └─ CompositeState _compositestate_pong
	 *   │    │                   ├─ InitialPoint _initialpoint_pong_Initial
	 *   │    │                   ├─ SimpleState _simplestate_pong_S1
	 *   │    │                   ├─ SimpleState _simplestate_pong_S2
	 *   │    │                   │    └─ ActionCode _actioncode_pong_s2entry
	 *   │    │                   ├─ Transition _transition_pong_E1
	 *   │    │                   │    └─ XTEventTrigger _eventtrigger_pong_e1
	 *   │    │                   ├─ Transition _transition_pong_E2
	 *   │    │                   │    ├─ XTEventTrigger _eventtrigger_pong_e2
	 *   │    │                   │    └─ ActionChain _actionchain_pong_e2
	 *   │    │                   │         └─ ActionCode _actioncode_pong_e2
	 *   │    │                   └─ Transition _transition_pong_I
	 *   │    └─ XTClass _class_TableUser
	 *   │         ├─ Attribute _attribute_isPlaying
	 *   │         └─ Operation _operation_setIsPlaying : boolean
	 *   │              └─ Parameter _parameter_isPlaying
	 *   └─ Component _component_Other
	 * </re>
	 */
	override protected prepareXtUmlModel(Model model) {
		_component_PingPong = model.createXtComponent("PingPongComponent")
		_type_boolean = model.createPrimitiveType("Boolean")
		_type_integer = model.createPrimitiveType("Integer")
		_package_InnerPackage = _component_PingPong.createPackage("InnerPackage")
		
		_class_Ping = _package_InnerPackage.createXtClass("Ping")
		_classevent_Pong_s = _class_Ping.createXtClassEvent("pong_s")
		_classevent_Pong_s = _class_Ping.createXtClassEvent("pong_s2")
		_statemachine_Ping_SM = _class_Ping.createStateMachine("Ping_SM")
		_compositestate_ping = _statemachine_Ping_SM.createCompositeState("")
		_initialpoint_ping_Initial = _compositestate_ping.createInitialPoint("initial")
		_simplestate_ping_S1 = _compositestate_ping.createSimpleState("s1")
		_actioncode_ping_s1entry = _simplestate_ping_S1.createEntryActionCode("sendPing", "R1_pong->generate_event(new Pong::ping_s_event(false));")
		_simplestate_ping_S2 = _compositestate_ping.createSimpleState("s2")
		_actioncode_ping_s2entry = _simplestate_ping_S2.createEntryActionCode("sendPing", "R1_pong->generate_event(new Pong::ping_s_event(false));")
		_transition_ping_E1 = _compositestate_ping.createTransition(_simplestate_ping_S1, _simplestate_ping_S2, "e1")
		_eventtrigger_ping_e1 = _transition_ping_E1.createXTEventTrigger(_classevent_Pong_s, "pong_t")
		_transition_ping_E2 = _compositestate_ping.createTransition(_simplestate_ping_S2, _simplestate_ping_S1, "e2")
		_eventtrigger_ping_e2 = _transition_ping_E2.createXTEventTrigger(_classevent_Pong_s, "pong_t")
		_transition_ping_I = _compositestate_ping.createTransition(_initialpoint_ping_Initial, _simplestate_ping_S1, "i")
		
		_class_Pong = _package_InnerPackage.createXtClass("Pong")
		_classevent_Ping_s = _class_Pong.createXtClassEvent("pong_s")
		_statemachine_Pong_SM = _class_Pong.createStateMachine("Pong_SM")
		_compositestate_pong = _statemachine_Pong_SM.createCompositeState("")
		_initialpoint_pong_Initial = _compositestate_ping.createInitialPoint("initial")
		_simplestate_pong_S1 = _compositestate_ping.createSimpleState("s1")
		_simplestate_pong_S2 = _compositestate_ping.createSimpleState("s2")
		_actioncode_pong_s2entry = _simplestate_pong_S2.createEntryActionCode("sendPong", "R1_ping->generate_event(new Ping::pong_s_event(false));")
		_transition_pong_E1 = _compositestate_ping.createTransition(_simplestate_pong_S1, _simplestate_pong_S2, "e1")
		_eventtrigger_pong_e1 = _transition_pong_E1.createXTEventTrigger(_classevent_Pong_s, "ping_t")
		_transition_pong_E2 = _compositestate_ping.createTransition(_simplestate_pong_S2, _simplestate_pong_S1, "e2")
		_eventtrigger_pong_e2 = _transition_pong_E2.createXTEventTrigger(_classevent_Pong_s, "ping_t")
		_actionchain_pong_e2 = _transition_pong_E2.createActionChain("sendPong")
		_actioncode_pong_e2 = _actionchain_pong_e2.createActionCode("sendPong", "R1_ping->generate_event(new Ping::pong_s_event(false));")
		_transition_pong_I = _compositestate_ping.createTransition(_initialpoint_pong_Initial, _simplestate_pong_S1, "i")
		
		_association_R1pong = _class_Ping.createXtAssociation(_class_Pong, "R1_pong", true, false, 1, 1)
		_association_R1ping = _class_Pong.createXtAssociation(_class_Ping, "R1_ping", true, false, 1, 1) => [
			it.opposite = _association_R1pong
		]
		_association_R1pong.opposite = _association_R1ping
		
		_class_TableUser = _component_PingPong.createXtClass("TableUser")
		_attribute_isPlaying = _class_TableUser.createSingleAttribute(_type_boolean, VisibilityKind.PRIVATE, false, "isInUse")
		_parameter_isPlaying = createParameter(_type_boolean, "isP", DirectionKind.IN)
		_operation_setIsPlaying = _class_TableUser.createOperation(VisibilityKind.PUBLIC, false, _type_boolean, "setIsInUse", '''::std::cout << "TableUser is playing"''', _parameter_isPlaying)
		
		_component_Other = model.createXtComponent("Component2")
	}
}