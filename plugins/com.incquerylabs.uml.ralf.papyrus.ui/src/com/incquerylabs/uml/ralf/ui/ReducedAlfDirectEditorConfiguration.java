package com.incquerylabs.uml.ralf.ui;

import org.eclipse.core.commands.ExecutionException;
import org.eclipse.core.runtime.IAdaptable;
import org.eclipse.core.runtime.IProgressMonitor;
import org.eclipse.emf.common.util.EList;
import org.eclipse.emf.common.util.URI;
import org.eclipse.emf.ecore.EObject;
import org.eclipse.emf.ecore.resource.Resource;
import org.eclipse.emf.ecore.resource.ResourceSet;
import org.eclipse.emf.ecore.util.EcoreUtil;
import org.eclipse.emf.transaction.TransactionalEditingDomain;
import org.eclipse.emf.transaction.util.TransactionUtil;
import org.eclipse.gmf.runtime.common.core.command.CommandResult;
import org.eclipse.gmf.runtime.common.core.command.ICommand;
import org.eclipse.gmf.runtime.emf.commands.core.command.AbstractTransactionalCommand;
import org.eclipse.incquery.runtime.api.IncQueryEngine;
import org.eclipse.papyrus.infra.core.resource.ModelSet;
import org.eclipse.papyrus.infra.core.services.ServiceException;
import org.eclipse.papyrus.infra.core.services.ServicesRegistry;
import org.eclipse.papyrus.infra.emf.utils.ServiceUtilsForResourceSet;
import org.eclipse.papyrus.uml.xtext.integration.DefaultXtextDirectEditorConfiguration;
import org.eclipse.uml2.uml.Behavior;
import org.eclipse.uml2.uml.Element;
import org.eclipse.uml2.uml.Model;
import org.eclipse.uml2.uml.OpaqueBehavior;
import org.eclipse.uml2.uml.Package;
import org.eclipse.uml2.uml.UMLPackage;
import org.eclipse.uml2.uml.resource.UMLResource;
import org.eclipse.xtext.EcoreUtil2;
import org.eclipse.xtext.nodemodel.ICompositeNode;
import org.eclipse.xtext.nodemodel.util.NodeModelUtils;
import org.eclipse.xtext.ui.shared.SharedStateModule;
import org.eclipse.xtext.util.Modules2;

import com.google.inject.Binder;
import com.google.inject.Guice;
import com.google.inject.Injector;
import com.google.inject.Module;
import com.incquerylabs.emdw.umlintegration.papyrus.IncQueryEngineService;
import com.incquerylabs.uml.ralf.ReducedAlfLanguageRuntimeModule;
import com.incquerylabs.uml.ralf.scoping.IUMLContextProvider;
import com.incquerylabs.uml.ralf.scoping.UMLContextProvider;
import com.incquerylabs.uml.ralf.ui.internal.ReducedAlfLanguageActivator;

public class ReducedAlfDirectEditorConfiguration extends DefaultXtextDirectEditorConfiguration {

	private static class UpdatedOpaqueBehaviorCommand extends AbstractTransactionalCommand {

		private static final String LANGUAGE_NAME = "rALF";
		private OpaqueBehavior behavior;
		private String newText;

		public UpdatedOpaqueBehaviorCommand(TransactionalEditingDomain domain, OpaqueBehavior behavior, String newText) {
			super(domain, "Opaque Behavior Update", getWorkspaceFiles(behavior));
			this.behavior = behavior;
			this.newText = newText;
		}

		@Override
		protected CommandResult doExecuteWithResult(IProgressMonitor monitor, IAdaptable info)
				throws ExecutionException {
			int indexOfRALFBody = -1;
			for (int i = 0; i < behavior.getLanguages().size() && indexOfRALFBody == -1; i++) {
				if (behavior.getLanguages().get(i).equals(LANGUAGE_NAME)) {
					indexOfRALFBody = i;
				}
			}
			EList<String> bodies = behavior.getBodies();
			if (indexOfRALFBody == -1) {
				behavior.getLanguages().add(LANGUAGE_NAME);
				bodies.add(newText);
			} else if (indexOfRALFBody < bodies.size()) { // might not be true, if body list is not synchronized with language list
				bodies.set(indexOfRALFBody, newText);
			} else {
				bodies.add(newText);
			}
			return CommandResult.newOKCommandResult(behavior);
		}
		
	}
	
	private class EditorContext extends UMLContextProvider {

		private Model model;

		private Model getModel() {
			if (model == null) {
				Object contextObject = getObjectToEdit();
				if (contextObject instanceof Element) {
					model = EcoreUtil2.getContainerOfType(((Element)contextObject).eContainer(), Model.class);
				}
			}
			return model;
		}
		
		@Override
		protected IncQueryEngine doGetEngine() {
			try {
				ModelSet modelSet = (ModelSet) getModel().eResource().getResourceSet();
				ServicesRegistry registry;
				registry = ServiceUtilsForResourceSet.getInstance().getServiceRegistry(modelSet);
				IncQueryEngineService service = registry.getService(IncQueryEngineService.class);
				return service.getEngine(modelSet);
			} catch (ServiceException e) {
				throw new RuntimeException("Error loading model: " + e.getMessage(), e);
			}
		}

		@Override
		protected EObject getContextObject() {
			return (EObject)getObjectToEdit();
		}

        @Override
		public Behavior getDefinedBehavior() {
        	if (getObjectToEdit() instanceof Behavior) {
        		return (Behavior) getObjectToEdit();
        	} else {
        		return null;
        	}
		}

		@Override
        protected Package getPrimitivePackage() {
            ResourceSet set = getModel().eResource().getResourceSet();
            Resource resource = set.getResource(URI.createURI(UMLResource.UML_PRIMITIVE_TYPES_LIBRARY_URI), true);
            return (Package)(EcoreUtil.getObjectByType(resource.getContents(), UMLPackage.Literals.PACKAGE));
        }
		
	}
	
	@Override
	public Injector getInjector() {
		Module runtimeModule = (Module) new ReducedAlfLanguageRuntimeModule();
		Module sharedModule = new SharedStateModule();
		Module uiModule = (Module) new ReducedAlfLanguageUiModule(ReducedAlfLanguageActivator.getInstance());
		Module ralfIntegrationModule = new Module() {
			
			@Override
			public void configure(Binder binder) {
				binder.bind(IUMLContextProvider.class).toInstance(new EditorContext());
			}
		};
		Module mergedModule = Modules2.mixin(runtimeModule, sharedModule, uiModule, ralfIntegrationModule);
		
		return Guice.createInjector(mergedModule);
	}

	@Override
	protected ICommand getParseCommand(EObject umlObject, EObject xtextObject) {
		if (umlObject instanceof OpaqueBehavior) {
			OpaqueBehavior context = (OpaqueBehavior) umlObject;
			TransactionalEditingDomain editingDomain = TransactionUtil.getEditingDomain(umlObject);
			
			ICompositeNode node = NodeModelUtils.getNode(xtextObject);
			String text = (node == null) ? "" : node.getText(); 
			
			return new UpdatedOpaqueBehaviorCommand(editingDomain, context, text);
		}
		return null;
	}

}
