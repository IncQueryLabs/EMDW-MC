package com.incquerylabs.uml.ralf.papyrus.ui;

import org.eclipse.papyrus.uml.properties.widgets.BodyEditor;
import org.eclipse.papyrus.uml.properties.widgets.NaturalLanguageEditor;
import org.eclipse.papyrus.views.properties.modelelement.ModelElement;
import org.eclipse.swt.widgets.Composite;
import org.eclipse.swt.widgets.Listener;
import org.eclipse.xtext.ui.editor.embedded.EmbeddedEditor;
import org.eclipse.xtext.ui.editor.embedded.EmbeddedEditorFactory;
import org.eclipse.xtext.ui.editor.embedded.IEditedResourceProvider;

import com.google.inject.Injector;
import com.incquerylabs.uml.ralf.ui.internal.ReducedAlfLanguageActivator;

public class RAlfBodyEditor implements BodyEditor {

	String input;
	
	@Override
	public void createWidget(Composite parent, int style) {
		Injector injector = ReducedAlfLanguageActivator.getInstance().getInjector(ReducedAlfLanguageActivator.COM_INCQUERYLABS_UML_RALF_REDUCEDALFLANGUAGE);
		
		EmbeddedEditorFactory factory = injector.getInstance(EmbeddedEditorFactory.class);
//		injector.getInstance(IEditedResourceProvider.class)
//		EmbeddedEditor editor = factory.newEditor(resourceProvider);
//		builder.withParent(parent).createPartialEditor("", "", "", true);
	}

	@Override
	public void setInput(String value) {
		this.input = value;
	}

	@Override
	public void dispose() {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void addChangeListener(Listener listener) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void removeChangeListener(Listener listener) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public String getValue() {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public void setReadOnly(boolean readOnly) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void setContext(ModelElement context) {
		// TODO Auto-generated method stub
		
	}

}
