package com.incquerylabs.emdw.cpp.transformation.test.dynamicbehavior

import com.ericsson.xtumlrt.oopl.cppmodel.CPPAttribute
import com.ericsson.xtumlrt.oopl.cppmodel.CPPClass
import com.ericsson.xtumlrt.oopl.cppmodel.CPPComponent
import com.ericsson.xtumlrt.oopl.cppmodel.CPPDirectory
import com.ericsson.xtumlrt.oopl.cppmodel.CPPEvent
import com.ericsson.xtumlrt.oopl.cppmodel.CPPModel
import com.ericsson.xtumlrt.oopl.cppmodel.CPPOperation
import com.ericsson.xtumlrt.oopl.cppmodel.CPPPackage
import com.ericsson.xtumlrt.oopl.cppmodel.CPPPort
import com.ericsson.xtumlrt.oopl.cppmodel.CPPProtocol
import com.ericsson.xtumlrt.oopl.cppmodel.CPPSignal
import com.ericsson.xtumlrt.oopl.cppmodel.CPPState
import com.ericsson.xtumlrt.oopl.cppmodel.CPPTransition
import com.incquerylabs.emdw.cpp.transformation.test.TransformationTest
import com.incquerylabs.emdw.cpp.transformation.test.wrappers.TransformationWrapper
import org.eclipse.papyrusrt.xtumlrt.common.Model
import org.eclipse.papyrusrt.xtumlrt.xtuml.XTClass
import org.eclipse.papyrusrt.xtumlrt.xtuml.XTComponent
import org.eclipse.papyrusrt.xtumlrt.xtuml.XTPackage

import static extension com.incquerylabs.emdw.cpp.transformation.test.TransformationTestUtil.*
import static extension org.junit.Assert.*

abstract class DynamicBehaviorBaseTest extends TransformationTest<XTPackage, CPPDirectory> {
	protected var ROOTCPPPACKAGES =0
	protected var CPPPROTOCOLS = 0
	protected var CPPSIGNALS = 0
	protected var CPPCLASSINPACK = 0
	protected var CPPCOMPONENTS = 0
	protected var CPPPORTS = 0
	protected var CPPDIR = 0
	protected var CPPHEADER = 0
	protected var CPPBODY = 0
	
	new(TransformationWrapper wrapper, String wrapperType) {
		super(wrapper, wrapperType)
	}
	
	override protected prepareXtUmlModel(Model xtModel) {
		throw new UnsupportedOperationException("TODO: auto-generated method stub")
	}
	
	override protected prepareCppModel(CPPModel cppModel) {
		val res = cppModel.eResource
		val rootcppdir = res.createCPPDirectory
		val xtmodel = cppModel.commonModel
		val xtPackage = xtmodel.rootPackages.head as XTPackage
		val cppPackage = createCPPPackage(cppModel, xtPackage)
		val xtComponent = xtPackage.entities.head as XTComponent
		val cppComponent = createCPPComponent(cppPackage, xtComponent, null, null, null, null)
		val xtClass = xtComponent.ownedClasses.head as XTClass
		createCPPClass(cppComponent, xtClass, null, null)

		rootcppdir
	}
	
	override protected assertResult(Model input, CPPModel result, XTPackage xtObject, CPPDirectory cppObject) {
		val rootCppPackages = result.subElements.filter(CPPPackage)
		assertEquals(ROOTCPPPACKAGES, rootCppPackages.size)

		// check cpp packages
		rootCppPackages.forEach [ pack |
			val cppProtocols = pack.subElements.filter(CPPProtocol)
			assertEquals(CPPPROTOCOLS, cppProtocols.size)

			// check protocols
			cppProtocols.forEach [ prot |
				val cppSignals = prot.subElements.filter(CPPSignal)
				assertEquals(CPPSIGNALS, cppSignals.size)
				cppSignals.forEach [ signal |
					signal.assertNotNull
					signal.commonSignal.assertNotNull
				]
				prot.assertNotNull
				prot.xtProtocol.assertNotNull
				prot.headerFile.assertNotNull
			]

			// Classes in root package
			val CPPClassesinPack = pack.subElements.filter(CPPClass)
			assertEquals(CPPCLASSINPACK, CPPClassesinPack.size)
			CPPClassesinPack.forEach [ cppClass |
				cppClass.assertNotNull
				val xtClass = cppClass.xtClass
				xtClass.assertNotNull

				// check class attributes
				val xtAttributes = xtClass.attributes
				val cppAttributes = cppClass.subElements.filter(CPPAttribute)
				assertEquals(xtAttributes.size, cppAttributes.size)
				cppAttributes.forEach [ attr |
					attr.assertNotNull
					attr.commonAttribute.assertNotNull
				]

				// check class operations
				val xtOperations = xtClass.operations
				val cppOperations = cppClass.subElements.filter(CPPOperation)
				assertEquals(xtOperations.size, cppOperations.size)
				cppOperations.forEach [ op |
					op.assertNotNull
					op.commonOperation.assertNotNull
				]

				// check class events
				val xtEvents = xtClass.events
				val cppEvents = cppClass.subElements.filter(CPPEvent)
				assertEquals(xtEvents.size, cppEvents.size)
				cppEvents.forEach [ event |
					event.assertNotNull
					event.xtEvent.assertNotNull
				]

				// check class states
				// NOTE Only 1 layer
				val xtStates = xtClass.behaviour?.top?.substates
				if (xtStates != null) {
					val cppStates = cppClass.subElements.filter(CPPState)
					assertEquals(xtStates.size, cppStates.size)
					cppStates.forEach [ state |
						state.assertNotNull
						state.commonState.assertNotNull
					]
				}

				// check class transitions
				// NOTE Only 1 layer
				val xtTrans = xtClass.behaviour?.top?.substates
				if (xtTrans != null) {
					val cppTrans = cppClass.subElements.filter(CPPTransition)
					assertEquals(xtTrans.size, cppTrans.size)
					cppTrans.forEach [ trans |
						trans.assertNotNull
						trans.commonTransition.assertNotNull
					]
				}

				cppClass.headerFile.assertNotNull
				cppClass.bodyFile.assertNotNull
			]

			// check components
			val cppComponents = pack.subElements.filter(CPPComponent)
			assertEquals(CPPCOMPONENTS, cppComponents.size)

			cppComponents.forEach [ comp |
				val cppClasses = comp.subElements.filter(CPPClass)
				assertEquals(comp.xtComponent.ownedClasses.size, cppClasses.size)

				// check classes
				cppClasses.forEach [ cppClass |
					cppClass.assertNotNull
					val xtClass = cppClass.xtClass
					xtClass.assertNotNull

					// check class attributes
					val xtAttributes = xtClass.attributes
					val cppAttributes = cppClass.subElements.filter(CPPAttribute)
					assertEquals(xtAttributes.size, cppAttributes.size)
					cppAttributes.forEach [ attr |
						attr.assertNotNull
						attr.commonAttribute.assertNotNull
					]

					// check class operations
					val xtOperations = xtClass.operations
					val cppOperations = cppClass.subElements.filter(CPPOperation)
					assertEquals(xtOperations.size, cppOperations.size)
					cppOperations.forEach [ op |
						op.assertNotNull
						op.commonOperation.assertNotNull
					]

					// check class events
					val xtEvents = xtClass.events
					val cppEvents = cppClass.subElements.filter(CPPEvent)
					assertEquals(xtEvents.size, cppEvents.size)
					cppEvents.forEach [ event |
						event.assertNotNull
						event.xtEvent.assertNotNull
					]

					// check class states
					// NOTE Only 1 layer
					val xtStates = xtClass.behaviour?.top?.substates
					if (xtStates != null) {
						val cppStates = cppClass.subElements.filter(CPPState)
						assertEquals(xtStates.size, cppStates.size)
						cppStates.forEach [ state |
							state.assertNotNull
							state.commonState.assertNotNull
						]
					}

					// check class transitions
					// NOTE Only 1 layer
					val xtTrans = xtClass.behaviour?.top?.substates
					if (xtTrans != null) {
						val cppTrans = cppClass.subElements.filter(CPPTransition)
						assertEquals(xtTrans.size, cppTrans.size)
						cppTrans.forEach [ trans |
							trans.assertNotNull
							trans.commonTransition.assertNotNull
						]
					}

					cppClass.headerFile.assertNotNull
					cppClass.bodyFile.assertNotNull
				]

				// check ports
				val cppPorts = comp.subElements.filter(CPPPort)
				assertEquals(CPPPORTS, cppPorts.size)
				cppPorts.forEach [ port |
					port.assertNotNull
					port.xtPort.assertNotNull
					port.headerFile.assertNotNull
					port.bodyFile.assertNotNull
				]

				comp.assertNotNull
				comp.xtComponent.assertNotNull
				comp.declHeaderFile.assertNotNull
				comp.defHeaderFile.assertNotNull
				comp.mainHeaderFile.assertNotNull
				comp.mainBodyFile.assertNotNull
			]

		]

		// Check CPP directories
		var dirNumber = cppObject.countCppDirs
		var headerNum = cppObject.countCppHeaderFiles
		var bodyNumber = cppObject.countCppBodyFiles
		assertEquals(CPPDIR, dirNumber)
		assertEquals(CPPHEADER, headerNum)
		assertEquals(CPPBODY, bodyNumber)
	}
	
}