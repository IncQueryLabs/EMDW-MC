package com.incquerylabs.emdw.cpp.bodyconverter.test.multiple

import com.ericsson.xtumlrt.oopl.cppmodel.CPPExternalBridge
import com.ericsson.xtumlrt.oopl.cppmodel.CPPOperation
import com.ericsson.xtumlrt.oopl.cppmodel.CppmodelPackage
import com.incquerylabs.emdw.cpp.bodyconverter.test.AbstractConversionTest
import com.incquerylabs.emdw.cpp.bodyconverter.transformation.impl.BodyConverter
import java.util.HashMap
import java.util.List
import org.eclipse.incquery.runtime.emf.EMFScope
import org.eclipse.papyrusrt.xtumlrt.common.CommonPackage
import org.eclipse.uml2.uml.BodyOwner
import org.eclipse.uml2.uml.NamedElement
import org.eclipse.uml2.uml.OpaqueBehavior
import org.eclipse.uml2.uml.OpaqueExpression
import org.eclipse.uml2.uml.Operation
import org.eclipse.uml2.uml.State
import org.eclipse.uml2.uml.Transition
import org.junit.AfterClass
import org.junit.Test
import org.junit.runner.RunWith
import org.junit.runners.Parameterized
import org.junit.runners.Parameterized.Parameter

import static org.junit.Assert.*

@RunWith(Parameterized)
abstract class AbstractMultipleConversionTest extends AbstractConversionTest {
	
	public static var codes = <CharSequence>newArrayList
	public static String wikiTable = '''
									Status |UML fully qualified name and rALF code | Exception / C++ code
									------ | ------------------------------------- | --------------------
									'''
	public static val sums = new HashMap<ConversionType, Integer>()
	
	public static val oks = new HashMap<ConversionType, Integer>()
	
	public def initCounters(){
		sums.put(ConversionType.Operation,0)
		sums.put(ConversionType.StateEntry,0)
		sums.put(ConversionType.StateExit,0)
		sums.put(ConversionType.Transition,0)
		sums.put(ConversionType.TransitionGuard,0)
		
		oks.put(ConversionType.Operation,0)
		oks.put(ConversionType.StateEntry,0)
		oks.put(ConversionType.StateExit,0)
		oks.put(ConversionType.Transition,0)
		oks.put(ConversionType.TransitionGuard,0)
	}
	
	@Parameter(0)
	public String name
	
	@Parameter(1)
	public String modelPath
	
	@Parameter(2)
	public List<ConversionType> conversionTypes
	
	@Test
	def void test_multipleConversion() {
		initCounters()
		initTrafos(modelPath)
		
		// *******************************************************************************
		// Initialize body converter
		// *******************************************************************************
		bodyConverter = new BodyConverter
		bodyConverter.initialize(engine, context)
		
		// Start test
		executeTrafos()
		
		val exceptions = <Exception>newArrayList
		
		conversionTypes.forEach[ conversionType |
			val elements = conversionType.getElements
			elements.forEach[ element |
				sums.increment(conversionType)
				val umlElement = element.umlElement
				val ralfCode = umlElement.ralfCode(conversionType)
				try {
					val snippet = element.getBody(conversionType)
					val cppBody = snippet.serialize
					
					// In some cases error messages starting with five * is generated
					// in case of errors instead of throwing exceptions
					// This way we generate c++ code for the rALF code after errors
					if(cppBody.contains("*****")){
						throw new UnsupportedOperationException(cppBody)
					}
					
					oks.increment(conversionType)
					codes += getResultString(element, ralfCode, cppBody, conversionType, false)
					wikiTable = 
					'''
					«wikiTable»
«««					:white_check_mark: | **«element.qualifiedName»**  <br /><br /> <i>«ralfCode.markdownBody»<i /> | <i>«cppBody.markdownBody»<i />
					:white_check_mark: | **«element.qualifiedName»** | 
					'''
				} catch (Exception ex) {
					exceptions += ex
					codes += getResultString(element, ralfCode, ex.message, conversionType, true)
					var message = ex.message.markdownBody
					if (message.isNullOrEmpty){
						message = ex.stackTrace.toString.markdownBody
					}
					wikiTable = 
					'''
					«wikiTable»
					:x: | **«element.qualifiedName»** <br /><br /> <i>«ralfCode.markdownBody»<i /> | «message»
					'''
				}
			]
		]
		
		assertEquals("Should not be any exception", 0, exceptions.size)
	}
	
	@AfterClass
	static def void printCodes() {
		println(
			'''
			«codes»
			
			'''
		)
		println(
			'''
			Action code type | Ok/Sum
			---------------- | ------
			Operation | «oks.get(ConversionType.Operation)»/«sums.get(ConversionType.Operation)»
			State entry | «oks.get(ConversionType.StateEntry)»/«sums.get(ConversionType.StateEntry)»
			State exit | «oks.get(ConversionType.StateExit)»/«sums.get(ConversionType.StateExit)»
			Transition | «oks.get(ConversionType.Transition)»/«sums.get(ConversionType.Transition)»
			Transition guard | «oks.get(ConversionType.TransitionGuard)»/«sums.get(ConversionType.TransitionGuard)»
			__SUM__ | __«oks.sum»__/__«sums.sum»__
			
			«wikiTable»
			
			'''
		)
	}
	
	def void increment(HashMap<ConversionType, Integer> map, ConversionType key){
		map.replace(key, map.get(key)+1)
	}
	
	static def int getSum(HashMap<?, Integer> map) {
		val result = map.values.reduce[a, b| a + b]
		if(result != null){
			return result
		}
		return 0
	}
	
	def getElements(ConversionType conversionType) {
		val navHelper = EMFScope::extractUnderlyingEMFIndex(engine)
		switch conversionType {
			// The cppModel is needed to decide if an operation is inside an external entity
			case ConversionType.Operation : {
				val allCppOperations = navHelper.getAllInstances(CppmodelPackage.Literals.CPP_OPERATION).filter(CPPOperation)
				val notExternalCppOperations = allCppOperations.filter[!(it.eContainer instanceof CPPExternalBridge)]
				return notExternalCppOperations.map[commonOperation].toList.sortBy[qualifiedName]
			}
			case ConversionType.StateEntry : {
				val allCommonStates = navHelper.getAllInstances(CommonPackage.Literals.STATE).filter(org.eclipse.papyrusrt.xtumlrt.common.State)
				return allCommonStates.filter[it.entryAction!=null].toList.sortBy[qualifiedName]
			}
			case ConversionType.StateExit : {
				val allCommonStates = navHelper.getAllInstances(CommonPackage.Literals.STATE).filter(org.eclipse.papyrusrt.xtumlrt.common.State)
				return allCommonStates.filter[it.exitAction!=null].toList.sortBy[qualifiedName]
			}
			case ConversionType.Transition : {
				val allCommonTransitions = navHelper.getAllInstances(CommonPackage.Literals.TRANSITION).filter(org.eclipse.papyrusrt.xtumlrt.common.Transition)
				return allCommonTransitions.filter[it.actionChain!=null && !it.actionChain.actions.isNullOrEmpty].toList.sortBy[qualifiedName]
			}
			case ConversionType.TransitionGuard : {
				val allCommonTransitions = navHelper.getAllInstances(CommonPackage.Literals.TRANSITION).filter(org.eclipse.papyrusrt.xtumlrt.common.Transition)
				allCommonTransitions.filter[it.guard!=null].toList.sortBy[qualifiedName]
			}
		}
	}
	
	def getUmlElement(org.eclipse.papyrusrt.xtumlrt.common.NamedElement element) {
		switch element{
			org.eclipse.papyrusrt.xtumlrt.common.Operation : engine.umlOperation2CommonOperation.getAllValuesOfumlOperation(element).head as Operation
			org.eclipse.papyrusrt.xtumlrt.common.State : engine.umlState2CommonState.getAllValuesOfumlState(element).head as State
			org.eclipse.papyrusrt.xtumlrt.common.Transition : engine.umlTransition2CommonTransition.getAllValuesOfumlTransition(element).head as Transition
		}
	}
	
	def getBody(org.eclipse.papyrusrt.xtumlrt.common.NamedElement element, ConversionType conversionType) {
		switch conversionType {
			case ConversionType.Operation : bodyConverter.convertOperation(element as org.eclipse.papyrusrt.xtumlrt.common.Operation)
			case ConversionType.StateEntry : bodyConverter.convertStateEntry(element as org.eclipse.papyrusrt.xtumlrt.common.State)
			case ConversionType.StateExit : bodyConverter.convertStateExit(element as org.eclipse.papyrusrt.xtumlrt.common.State)
			case ConversionType.Transition : bodyConverter.convertTransition(element as org.eclipse.papyrusrt.xtumlrt.common.Transition)
			case ConversionType.TransitionGuard : bodyConverter.convertTransitionGuard(element as org.eclipse.papyrusrt.xtumlrt.common.Transition)
		}
	}
	
	def String getQualifiedName(org.eclipse.papyrusrt.xtumlrt.common.NamedElement xumlrtElement) {
		switch xumlrtElement {
			org.eclipse.papyrusrt.xtumlrt.common.Operation : '''Operation: <br/>«(engine.umlOperation2CommonOperation.getAllValuesOfumlOperation(xumlrtElement).head as Operation).qualifiedName.form»'''
			org.eclipse.papyrusrt.xtumlrt.common.State : '''State: <br/>«(engine.umlState2CommonState.getAllValuesOfumlState(xumlrtElement).head as State).qualifiedName.form»'''
			org.eclipse.papyrusrt.xtumlrt.common.Transition : '''Transition: <br/>«(engine.umlTransition2CommonTransition.getAllValuesOfumlTransition(xumlrtElement).head as Transition).qualifiedName.form»'''
		}
	}
	
	def form(String string) '''«string.replace("PhoneX::PhoneX::Implementation::", "")»'''
	def String markdownBody(String body) '''«body?.replace("\r\n", "<br />")?.replace("\n", "<br />")?.replace('|', "\\|")»'''
	
	def String ralfCode(NamedElement umlElement, ConversionType conversionType){
		switch conversionType{
			case ConversionType.Operation : (umlElement as Operation).methods.filter(OpaqueBehavior).head.ralfCode
			case ConversionType.StateEntry : ((umlElement as State).entry as OpaqueBehavior).ralfCode
			case ConversionType.StateExit : ((umlElement as State).exit as OpaqueBehavior).ralfCode
			case ConversionType.Transition : ((umlElement as Transition).effect as OpaqueBehavior).ralfCode
			case ConversionType.TransitionGuard : ((umlElement as Transition).guard.specification as OpaqueExpression).ralfCode
		}
	}
	
	def String getRalfCode(BodyOwner owner) {
		if(owner==null) {
			return "null"
		}
		val index = owner.languages.indexOf("rALF")
		if(index<0) {
			return "NO rALF CODE"
		}
		return owner.bodies.get(index)
		
	}
	
	def getResultString(org.eclipse.papyrusrt.xtumlrt.common.NamedElement element, String ralfCodes, String body, ConversionType conversionType, boolean isException) {
		val resultType = switch conversionType {
			case ConversionType.Operation : '''Operation'''
			case ConversionType.StateEntry : '''State Entry'''
			case ConversionType.StateExit : '''State Exit'''
			case ConversionType.Transition : '''Transition'''
			case ConversionType.TransitionGuard : '''Transition Guard'''
		}
		
		'''
		«resultType»: «element.qualifiedName»
		rALF:
			«ralfCodes»
		«IF isException»Exception:«ELSE»C++ code:«ENDIF»
			«body»
		
		'''
	}
}
