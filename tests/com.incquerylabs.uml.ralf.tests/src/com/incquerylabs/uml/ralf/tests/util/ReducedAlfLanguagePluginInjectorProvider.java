package com.incquerylabs.uml.ralf.tests.util;

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
import com.incquerylabs.uml.ralf.snippetcompiler.ReducedAlfSnippetTemplateCompiler;

public class ReducedAlfLanguagePluginInjectorProvider extends ReducedAlfLanguageInjectorProvider {
    
    @Override
    protected Injector internalCreateInjector() {
        Module runtimeModule = (Module) new com.incquerylabs.uml.ralf.ReducedAlfLanguageRuntimeModule();
        Module customizations = new Module() {

            @Override
            public void configure(Binder binder) {
                TestModelUMLContextProvider provider = new TestModelUMLContextProvider("/com.incquerylabs.uml.ralf.tests/model/model.uml");
                binder.bind(IUMLContextProvider.class).toInstance(provider);
                binder.bind(ReducedAlfSnippetTemplateCompiler.class).toInstance(new ReducedAlfSnippetTemplateCompiler(new DummyUmlValueDescriptorFactory(), new DummyUMLModelAccess()));
                binder.bind(TestModelUMLContextProvider.class).toInstance(provider);
                binder.bind(IReducedAlfParser.class).toInstance(new ReducedAlfParser());
                binder.bind(IReducedAlfGenerator.class).to(ReducedAlfGenerator.class);
            }
        };
        return Guice.createInjector(runtimeModule, customizations);
    }

}
