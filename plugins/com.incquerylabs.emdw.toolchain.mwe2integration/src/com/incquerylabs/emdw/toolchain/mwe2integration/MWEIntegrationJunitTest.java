package com.incquerylabs.emdw.toolchain.mwe2integration;

import java.util.Map;

import org.eclipse.emf.common.util.URI;
import org.eclipse.emf.ecore.EStructuralFeature;
import org.eclipse.emf.ecore.resource.Resource;
import org.eclipse.emf.ecore.resource.URIConverter;
import org.eclipse.emf.ecore.xmi.impl.EcoreResourceFactoryImpl;
import org.eclipse.emf.ecore.xmi.impl.XMIResourceFactoryImpl;
import org.eclipse.incquery.querybasedfeatures.runtime.QueryBasedFeatureSettingDelegateFactory;
import org.eclipse.incquery.runtime.api.IQuerySpecification;
import org.eclipse.incquery.runtime.exception.IncQueryException;
import org.eclipse.incquery.runtime.extensibility.QuerySpecificationRegistry;
import org.eclipse.papyrusrt.xtumlrt.common.CommonPackage;
import org.eclipse.papyrusrt.xtumlrt.xtuml.XtumlPackage;
import org.eclipse.uml2.uml.UMLPackage;
import org.eclipse.uml2.uml.resource.UMLResource;
import org.junit.Test;

import com.ericsson.xtumlrt.oopl.OoplPackage;
import com.ericsson.xtumlrt.oopl.OoplQueryBasedFeatures;
import com.ericsson.xtumlrt.oopl.cppmodel.CppmodelPackage;
import com.ericsson.xtumlrt.oopl.cppmodel.derived.QueryBasedFeatures;
import com.google.common.collect.Maps;
import com.incquerylabs.emdw.cpp.common.EMDWConstants;
import com.incquerylabs.emdw.umlintegration.trace.TracePackage;
import com.incquerylabs.uml.ralf.ReducedAlfLanguageStandaloneSetup;


public class MWEIntegrationJunitTest {
    static Map<URI,URI> resourcesMap;
    static String cppBasicTypesPath = "D:\\lunk.peter\\GIT\\EMDW-MC\\plugins\\com.incquerylabs.emdw.cpp.transformation\\model\\cppBasicTypes.cppmodel";
    static String cppCollectionsPath = "D:\\lunk.peter\\GIT\\EMDW-MC\\plugins\\com.incquerylabs.emdw.cpp.transformation\\model\\defaultImplementations.cppmodel";
    static String cppRuntimePath = "D:\\lunk.peter\\GIT\\EMDW-MC\\plugins\\com.incquerylabs.emdw.cpp.codegeneration\\model\\runtime.cppmodel";
    static String xumlRTTypesPath = "D:\\lunk.peter\\GIT\\EMDW-MC\\plugins\\org.eclipse.papyrusrt.xtumlrt.common.model\\model\\umlPrimitiveTypes.common";
    static String ralfCollectionsPath = "D:\\lunk.peter\\GIT\\EMDW-Common\\plugins\\com.incquerylabs.uml.ralf\\model\\collections\\collections.uml";
    
    @Test
    public void test() {
        initializePathmaps();
        new ReducedAlfLanguageStandaloneSetup().createInjectorAndDoEMFRegistration();
        loadDefaultSettings();
        
        MWE2IntegrationRunner runner = new MWE2IntegrationRunner("src/com/incquerylabs/emdw/toolchain/mwe2integration/EMDWJavaWorkflow.mwe2");
        runner.RunPlainJava();
    }
    
    private static void initializePathmaps() {
        resourcesMap = Maps.newHashMap();
        resourcesMap.put(URI.createURI(EMDWConstants.CPP_BASIC_TYPES_LIBRARY_PATH) , URI.createFileURI(cppBasicTypesPath));
        resourcesMap.put(URI.createURI(EMDWConstants.CPP_COLLECTIONS_LIBRARY_PATH) , URI.createFileURI(cppCollectionsPath));
        resourcesMap.put(URI.createURI(EMDWConstants.CPP_RUNTIME_LIBRARY_PATH) , URI.createFileURI(cppRuntimePath));
        resourcesMap.put(URI.createURI(EMDWConstants.XUMLRT_PRIMITIVE_TYPES_LIBRARY_PATH) , URI.createFileURI(xumlRTTypesPath));
        resourcesMap.put(URI.createURI(EMDWConstants.CPP_RALF_MODELS_PATH) , URI.createFileURI(ralfCollectionsPath));
                
        for (URI uri : resourcesMap.keySet()) {
            URIConverter.URI_MAP.put(
                    uri,
                    resourcesMap.get(uri)
            );
        }
 
    }
    
    private static void loadDefaultSettings() {
        // Register resource factories
        Resource.Factory.Registry.INSTANCE.getExtensionToFactoryMap().put(UMLResource.FILE_EXTENSION, UMLResource.Factory.INSTANCE);
        Resource.Factory.Registry.INSTANCE.getExtensionToFactoryMap().put("ecore", new EcoreResourceFactoryImpl());
        Resource.Factory.Registry.INSTANCE.getExtensionToFactoryMap().put("trace", new XMIResourceFactoryImpl());
        Resource.Factory.Registry.INSTANCE.getExtensionToFactoryMap().put("xtuml", new XMIResourceFactoryImpl());
        Resource.Factory.Registry.INSTANCE.getExtensionToFactoryMap().put("cppmodel", new XMIResourceFactoryImpl());
        Resource.Factory.Registry.INSTANCE.getExtensionToFactoryMap().put("common", new XMIResourceFactoryImpl());
        
        // Initialize EMF model element types
        UMLPackage.eINSTANCE.eClass();
        TracePackage.eINSTANCE.eClass();
        CommonPackage.eINSTANCE.eClass();
        XtumlPackage.eINSTANCE.eClass();
        OoplPackage.eINSTANCE.eClass();
        CppmodelPackage.eINSTANCE.eClass();
        
        try {
            for(IQuerySpecification<?> spec : OoplQueryBasedFeatures.instance().getSpecifications()){
                QuerySpecificationRegistry.registerQuerySpecification(spec);
            }
            
            for(IQuerySpecification<?> spec : QueryBasedFeatures.instance().getSpecifications()){
                QuerySpecificationRegistry.registerQuerySpecification(spec);
            }
        } catch (IncQueryException e) {
           System.out.println("Error during initialization");
        }
        
        EStructuralFeature.Internal.SettingDelegate.Factory.Registry.INSTANCE.put("org.eclipse.incquery.querybasedfeature", new QueryBasedFeatureSettingDelegateFactory());
    } 
}