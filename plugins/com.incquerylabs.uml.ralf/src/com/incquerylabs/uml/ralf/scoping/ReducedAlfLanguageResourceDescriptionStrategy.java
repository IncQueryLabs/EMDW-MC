package com.incquerylabs.uml.ralf.scoping;

import org.eclipse.emf.ecore.EObject;
import org.eclipse.xtext.resource.IEObjectDescription;
import org.eclipse.xtext.resource.impl.DefaultResourceDescriptionStrategy;
import org.eclipse.xtext.util.IAcceptor;

import com.incquerylabs.uml.ralf.reducedAlfLanguage.Variable;

public class ReducedAlfLanguageResourceDescriptionStrategy extends DefaultResourceDescriptionStrategy {

	@Override
	public boolean createEObjectDescriptions(EObject eObject, IAcceptor<IEObjectDescription> acceptor) {
		if (eObject instanceof Variable) {
			//Disallow putting variables into the index
			return false;
		}
		return super.createEObjectDescriptions(eObject, acceptor);
	}

}
