package com.incquerylabs.uml.ralf.ui;

import org.eclipse.core.commands.ExecutionException;
import org.eclipse.core.runtime.IAdaptable;
import org.eclipse.core.runtime.IProgressMonitor;
import org.eclipse.emf.ecore.EObject;
import org.eclipse.emf.transaction.TransactionalEditingDomain;
import org.eclipse.emf.transaction.util.TransactionUtil;
import org.eclipse.gmf.runtime.common.core.command.CommandResult;
import org.eclipse.gmf.runtime.common.core.command.ICommand;
import org.eclipse.gmf.runtime.emf.commands.core.command.AbstractTransactionalCommand;
import org.eclipse.papyrus.uml.xtext.integration.DefaultXtextDirectEditorConfiguration;
import org.eclipse.uml2.uml.Class;
import org.eclipse.uml2.uml.Element;
import org.eclipse.uml2.uml.Model;
import org.eclipse.uml2.uml.OpaqueBehavior;
import org.eclipse.xtext.EcoreUtil2;
import org.eclipse.xtext.nodemodel.ICompositeNode;
import org.eclipse.xtext.nodemodel.util.NodeModelUtils;
import org.eclipse.xtext.ui.shared.SharedStateModule;
import org.eclipse.xtext.util.Modules2;

import com.google.common.collect.Lists;
import com.google.inject.Binder;
import com.google.inject.Guice;
import com.google.inject.Injector;
import com.google.inject.Module;
import com.incquerylabs.uml.ralf.ReducedAlfLanguageRuntimeModule;
import com.incquerylabs.uml.ralf.scoping.IUMLContextProvider;
import com.incquerylabs.uml.ralf.ui.internal.ReducedAlfLanguageActivator;

public class ReducedAlfDirectEditorConfiguration extends DefaultXtextDirectEditorConfiguration {

	private static class UpdatedOpaqueBehaviorCommand extends AbstractTransactionalCommand {

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
				if (behavior.getLanguages().get(i).equals("rALF")) {
					indexOfRALFBody = i;
				}
			}
			if (indexOfRALFBody == -1) {
				behavior.getLanguages().add("rALF");
				behavior.getBodies().add(newText);
			} else if (indexOfRALFBody < behavior.getBodies().size()) { // might not be true, if body list is not synchronized with language list
				behavior.getBodies().set(indexOfRALFBody, newText);
			} else {
				behavior.getBodies().add(newText);
			}
			return CommandResult.newOKCommandResult(behavior);
		}
		
	}
	
	private class EditorContext implements IUMLContextProvider {

		public EditorContext() {
			super();
		}

		private Model getModel() {
			Object contextObject = getObjectToEdit();
			if (contextObject instanceof Element) {
				return EcoreUtil2.getContainerOfType(((Element)contextObject).eContainer(), Model.class);
			}
			return null;
		}
		
		@Override
		public Iterable<Class> getKnownClasses() {
			final Model model = getModel();
			if (model == null) {
				return Lists.newArrayList();
			}
			return EcoreUtil2.eAllOfType(model, Class.class);
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
			int index = context.getLanguages().indexOf("rALF");
			TransactionalEditingDomain editingDomain = TransactionUtil.getEditingDomain(umlObject);
			
			ICompositeNode node = NodeModelUtils.getNode(xtextObject);
			String text = (node == null) ? "" : node.getText(); 
			
			return new UpdatedOpaqueBehaviorCommand(editingDomain, context, text);
			
//			return EMFtoGMFCommandWrapper.wrap(SetCommand.create(editingDomain, context, UMLPackage.Literals.OPAQUE_BEHAVIOR__BODY, text, index));			
		}
		return null;
	}

}
