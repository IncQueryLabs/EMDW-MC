package com.incquerylabs.uml.ralf.tests.util;

import org.eclipse.emf.ecore.EPackage;
import org.eclipse.emf.ecore.resource.Resource;

import com.google.inject.Binder;
import com.google.inject.Guice;
import com.google.inject.Injector;
import com.google.inject.Module;
import com.incquerylabs.uml.ralf.ReducedAlfLanguageInjectorProvider;
import com.incquerylabs.uml.ralf.api.IParserAPI;
import com.incquerylabs.uml.ralf.api.ISnippetCompilerAPI;
import com.incquerylabs.uml.ralf.api.impl.ParserAPI;
import com.incquerylabs.uml.ralf.api.impl.SnippetCompilerAPI;
import com.incquerylabs.uml.ralf.scoping.IUMLContextProvider;

public class ReducedAlfLanguagePluginInjectorProvider extends ReducedAlfLanguageInjectorProvider {
    private static final String LANGUAGE_NAME = "rALF";
    
    @Override
    protected Injector internalCreateInjector() {
        // register default ePackages
        if (!Resource.Factory.Registry.INSTANCE.getExtensionToFactoryMap().containsKey("ecore"))
            Resource.Factory.Registry.INSTANCE.getExtensionToFactoryMap().put("ecore",
                    new org.eclipse.emf.ecore.xmi.impl.EcoreResourceFactoryImpl());
        if (!Resource.Factory.Registry.INSTANCE.getExtensionToFactoryMap().containsKey("xmi"))
            Resource.Factory.Registry.INSTANCE.getExtensionToFactoryMap().put("xmi",
                    new org.eclipse.emf.ecore.xmi.impl.XMIResourceFactoryImpl());
        if (!Resource.Factory.Registry.INSTANCE.getExtensionToFactoryMap().containsKey("xtextbin"))
            Resource.Factory.Registry.INSTANCE.getExtensionToFactoryMap().put("xtextbin",
                    new org.eclipse.xtext.resource.impl.BinaryGrammarResourceFactoryImpl());
        if (!EPackage.Registry.INSTANCE.containsKey(org.eclipse.xtext.XtextPackage.eNS_URI))
            EPackage.Registry.INSTANCE.put(org.eclipse.xtext.XtextPackage.eNS_URI,
                    org.eclipse.xtext.XtextPackage.eINSTANCE);
        Module runtimeModule = (Module) new com.incquerylabs.uml.ralf.ReducedAlfLanguageRuntimeModule();
        Module customizations = new Module() {

            @Override
            public void configure(Binder binder) {
                TestModelUMLContextProvider provider = new TestModelUMLContextProvider("/com.incquerylabs.uml.ralf.tests/model/model.uml");
                binder.bind(IUMLContextProvider.class).toInstance(provider);
                binder.bind(TestModelUMLContextProvider.class).toInstance(provider);
                binder.bind(IParserAPI.class).toInstance(new ParserAPI(LANGUAGE_NAME));
                binder.bind(ISnippetCompilerAPI.class).to(SnippetCompilerAPI.class);
            }
        };
        return Guice.createInjector(runtimeModule, customizations);
    }

}
