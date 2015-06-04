package com.incquerylabs.uml.ralf.ui;

import org.eclipse.emf.ecore.EObject;
import org.eclipse.emf.edit.command.SetCommand;
import org.eclipse.emf.transaction.TransactionalEditingDomain;
import org.eclipse.emf.transaction.util.TransactionUtil;
import org.eclipse.gmf.runtime.common.core.command.ICommand;
import org.eclipse.papyrus.commands.wrappers.EMFtoGMFCommandWrapper;
import org.eclipse.papyrus.uml.xtext.integration.DefaultXtextDirectEditorConfiguration;
import org.eclipse.uml2.uml.BodyOwner;
import org.eclipse.uml2.uml.OpaqueBehavior;
import org.eclipse.uml2.uml.UMLPackage;
import org.eclipse.xtext.nodemodel.ICompositeNode;
import org.eclipse.xtext.nodemodel.util.NodeModelUtils;

import com.google.inject.Injector;
import com.incquerylabs.uml.ralf.ui.internal.ReducedAlfLanguageActivator;

public class ReducedAlfDirectEditorConfiguration extends DefaultXtextDirectEditorConfiguration {

	@Override
	public Injector getInjector() {
		return ReducedAlfLanguageActivator.getInstance()
				.getInjector(ReducedAlfLanguageActivator.COM_INCQUERYLABS_UML_RALF_REDUCEDALFLANGUAGE);
	}

	@Override
	protected ICommand getParseCommand(EObject umlObject, EObject xtextObject) {
		if (umlObject instanceof OpaqueBehavior) {
			OpaqueBehavior context = (OpaqueBehavior) umlObject;
			int index = context.getLanguages().indexOf("rALF");
			TransactionalEditingDomain editingDomain = TransactionUtil.getEditingDomain(umlObject);
			
			ICompositeNode node = NodeModelUtils.getNode(xtextObject);
			String text = (node == null) ? "" : node.getText(); 
			
			return EMFtoGMFCommandWrapper.wrap(SetCommand.create(editingDomain, context, UMLPackage.Literals.OPAQUE_BEHAVIOR__BODY, text, index));			
		}
		return null;
	}

}
