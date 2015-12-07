package com.incquerylabs.emdw.toolchain.mwe2integration.app

import com.ericsson.xtumlrt.oopl.OoplPackage
import com.ericsson.xtumlrt.oopl.OoplQueryBasedFeatures
import com.ericsson.xtumlrt.oopl.cppmodel.CppmodelPackage
import com.ericsson.xtumlrt.oopl.cppmodel.derived.QueryBasedFeatures
import com.incquerylabs.emdw.cpp.common.EMDWConstants
import com.incquerylabs.emdw.umlintegration.trace.TracePackage
import com.incquerylabs.uml.ralf.ReducedAlfLanguageStandaloneSetup
import hu.eltesoft.modelexecution.profile.xumlrt.XUMLRTPackage
import java.util.HashMap
import java.util.List
import java.util.Map
import org.eclipse.emf.common.util.URI
import org.eclipse.emf.ecore.EStructuralFeature
import org.eclipse.emf.ecore.resource.Resource
import org.eclipse.emf.ecore.resource.URIConverter
import org.eclipse.emf.ecore.xmi.impl.EcoreResourceFactoryImpl
import org.eclipse.emf.ecore.xmi.impl.XMIResourceFactoryImpl
import org.eclipse.emf.mwe2.language.Mwe2StandaloneSetup
import org.eclipse.emf.mwe2.runtime.workflow.WorkflowContextImpl
import org.eclipse.incquery.querybasedfeatures.runtime.QueryBasedFeatureSettingDelegateFactory
import org.eclipse.incquery.runtime.api.IPatternMatch
import org.eclipse.incquery.runtime.api.IQuerySpecification
import org.eclipse.incquery.runtime.api.IncQueryMatcher
import org.eclipse.incquery.runtime.extensibility.QuerySpecificationRegistry
import org.eclipse.papyrusrt.xtumlrt.common.CommonPackage
import org.eclipse.papyrusrt.xtumlrt.xtuml.XtumlPackage
import org.eclipse.uml2.uml.UMLPackage
import org.eclipse.uml2.uml.UMLPlugin
import org.eclipse.uml2.uml.resource.UMLResource
import org.eclipse.viatra.emf.mwe2integration.initializer.MWE2IntegrationInitializer
import org.eclipse.emf.mwe2.launch.runtime.Mwe2Runner

class MWEIntegrationApp {
	private static final String APP_NAME = "MWE2Integration App"
	private static final String ARGS_HELP = 
	'''
	We need these arguments:
	 * first arg: uml model path
	 * second arg: target folder for generated code
	 * third arg: MWE file location
	'''	

	def static void main(String[] args) {
		System.out.println('''************* «APP_NAME» started *************''')		
//		val resources = #{
//			URI::createURI(EMDWConstants::CPP_BASIC_TYPES_LIBRARY_PATH)			->	URI::createURI(MWEIntegrationApp.getResource("/model/cppBasicTypes.cppmodel").toString),
//			URI::createURI(EMDWConstants::CPP_COLLECTIONS_LIBRARY_PATH)			->	URI::createURI(MWEIntegrationApp.getResource("/model/defaultImplementations.cppmodel").toString),
//			URI::createURI(EMDWConstants::CPP_RUNTIME_LIBRARY_PATH)				->	URI::createURI(MWEIntegrationApp.getResource("/model/runtime.cppmodel").toString),
//			URI::createURI(EMDWConstants::XUMLRT_PRIMITIVE_TYPES_LIBRARY_PATH)	->	URI::createURI(MWEIntegrationApp.getResource("/model/umlPrimitiveTypes.common").toString),
//			URI::createURI(EMDWConstants::CPP_RALF_MODELS_PATH)					->	URI::createURI(MWEIntegrationApp.getResource("/model/collections/collections.uml").toString),
//			URI::createURI(EMDWConstants::XUMLRT_PROFILE_PATHMAP)				->	URI::createURI(MWEIntegrationApp.getResource("/profile/").toString)
//		}
		
		
		if(args.checkArguments) {
			val initializer = new MWE2IntegrationInitializer
			//initializePathmaps(resources);
        	new ReducedAlfLanguageStandaloneSetup().createInjectorAndDoEMFRegistration();
        	loadDefaultSettings();
        	
        	val injector = new Mwe2StandaloneSetup().createInjectorAndDoEMFRegistration()

        	
       		val mweRunner = injector.getInstance(JarMwe2Runner);
        	
        	//val  mweRunner = initializer.initializePlainJava()
			var WorkflowContextImpl context = new WorkflowContextImpl()
			
			context.put("targetFolderPath", args.get(0))
			context.put("umlModelPath", args.get(1))
			mweRunner.run(URI.createURI(args.get(2)), new HashMap<String, String>(), context)	
			
		}
		System.out.println('''************* «APP_NAME» finished *************''')
			
	}
	
	private static def boolean checkArguments(List<String> args) {
		System.out.println("Passed arguments:")
		args.forEach(arg | println(" * "+arg))
		if (args === null || args.size() != 3) {
			System.out.println(ARGS_HELP)
			return false
		}
		return true
	}
	
	def static void loadDefaultSettings() {
		// Register resource factories
		Resource.Factory.Registry.INSTANCE.extensionToFactoryMap.put(UMLResource.FILE_EXTENSION, UMLResource.Factory.INSTANCE)
		Resource.Factory.Registry.INSTANCE.getExtensionToFactoryMap().put("ecore", new EcoreResourceFactoryImpl())
		Resource.Factory.Registry.INSTANCE.getExtensionToFactoryMap().put("trace", new XMIResourceFactoryImpl())
		Resource.Factory.Registry.INSTANCE.getExtensionToFactoryMap().put("xtuml", new XMIResourceFactoryImpl())
		Resource.Factory.Registry.INSTANCE.getExtensionToFactoryMap().put("cppmodel", new XMIResourceFactoryImpl())
		Resource.Factory.Registry.INSTANCE.getExtensionToFactoryMap().put("common", new XMIResourceFactoryImpl())
		
		// Initialize EMF model element types
		UMLPackage.eINSTANCE.eClass
		XUMLRTPackage.eINSTANCE.eClass
		TracePackage.eINSTANCE.eClass
		CommonPackage.eINSTANCE.eClass
		XtumlPackage.eINSTANCE.eClass
		OoplPackage.eINSTANCE.eClass
		CppmodelPackage.eINSTANCE.eClass
		
		// register xUML-RT profile
		UMLPlugin.EPackageNsURIToProfileLocationMap.put(XUMLRTPackage.eNS_URI, URI.createURI("pathmap://XUMLRT_PROFILE/xumlrt.profile.uml#_HaqtUBDoEeWE3_d6VQejPQ"))
		
		OoplQueryBasedFeatures::instance.specifications.forEach[IQuerySpecification<? extends IncQueryMatcher<? extends IPatternMatch>> specification |
			QuerySpecificationRegistry::registerQuerySpecification(specification)
		]
		QueryBasedFeatures::instance.specifications.forEach[IQuerySpecification<? extends IncQueryMatcher<? extends IPatternMatch>> specification |
			QuerySpecificationRegistry::registerQuerySpecification(specification)
		]
		EStructuralFeature.Internal.SettingDelegate.Factory.Registry.INSTANCE.put("org.eclipse.incquery.querybasedfeature", new QueryBasedFeatureSettingDelegateFactory)
	} 
	
//	private static def void initializePathmaps(Map<URI, URI> resources) {
//		resources.forEach[pathmapPath, locationPath|
//			URIConverter.URI_MAP.put(
//				pathmapPath,
//				locationPath
//			)			
//		]
//	}
	
}
