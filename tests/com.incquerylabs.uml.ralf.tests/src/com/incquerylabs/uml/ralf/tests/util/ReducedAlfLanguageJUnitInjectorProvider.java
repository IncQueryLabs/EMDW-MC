package com.incquerylabs.uml.ralf.tests.util;

import org.eclipse.emf.ecore.EPackage;
import org.eclipse.emf.ecore.resource.Resource;

import com.google.inject.Binder;
import com.google.inject.Guice;
import com.google.inject.Injector;
import com.google.inject.Module;
import com.incquerylabs.uml.ralf.ReducedAlfLanguageInjectorProvider;
import com.incquerylabs.uml.ralf.api.IReducedAlfGenerator;
import com.incquerylabs.uml.ralf.api.IReducedAlfParser;
import com.incquerylabs.uml.ralf.api.impl.ReducedAlfGenerator;
import com.incquerylabs.uml.ralf.api.impl.ReducedAlfParser;
import com.incquerylabs.uml.ralf.scoping.IUMLContextProvider;
import com.incquerylabs.uml.ralf.scoping.SimpleUMLContextProvider;
import com.incquerylabs.uml.ralf.snippetcompiler.ReducedAlfSnippetTemplateCompiler;

public class ReducedAlfLanguageJUnitInjectorProvider extends ReducedAlfLanguageInjectorProvider {

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
        //Create the base rALF module
        Module runtimeModule = (Module) new com.incquerylabs.uml.ralf.ReducedAlfLanguageRuntimeModule();
        //create a new module that binds the API classes
        Module customizations = new Module() {
            @Override
            public void configure(Binder binder) {
                SimpleUMLContextProvider provider = new SimpleUMLContextProvider();
                binder.bind(IUMLContextProvider.class).toInstance(provider);
                binder.bind(ReducedAlfSnippetTemplateCompiler.class).toInstance(new ReducedAlfSnippetTemplateCompiler(new DummyUmlValueDescriptorFactory(), new DummyUMLModelAccess(), provider));
                binder.bind(IReducedAlfGenerator.class).to(ReducedAlfGenerator.class);
                binder.bind(IReducedAlfParser.class).to(ReducedAlfParser.class);
            }
        };
        //create a new injector based off the modules
        return Guice.createInjector(runtimeModule, customizations);
    }

}
