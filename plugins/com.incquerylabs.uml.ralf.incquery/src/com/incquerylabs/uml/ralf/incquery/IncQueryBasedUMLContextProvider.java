package com.incquerylabs.uml.ralf.incquery;

import java.util.Set;

import org.eclipse.emf.ecore.EClass;
import org.eclipse.emf.ecore.EObject;
import org.eclipse.incquery.runtime.api.IncQueryEngine;
import org.eclipse.incquery.runtime.base.api.NavigationHelper;
import org.eclipse.incquery.runtime.emf.EMFScope;
import org.eclipse.incquery.runtime.exception.IncQueryException;
import org.eclipse.uml2.uml.Association;
import org.eclipse.uml2.uml.AssociationClass;
import org.eclipse.uml2.uml.Behavior;
import org.eclipse.uml2.uml.Class;
import org.eclipse.uml2.uml.Component;
import org.eclipse.uml2.uml.Element;
import org.eclipse.uml2.uml.Node;
import org.eclipse.uml2.uml.Package;
import org.eclipse.uml2.uml.Property;
import org.eclipse.uml2.uml.Signal;
import org.eclipse.uml2.uml.Stereotype;
import org.eclipse.uml2.uml.Type;
import org.eclipse.uml2.uml.UMLPackage;
import org.eclipse.xtext.EcoreUtil2;

import com.google.common.collect.Iterables;
import com.google.common.collect.Lists;
import com.incquerylabs.uml.ralf.scoping.IUMLContextProvider;

public abstract class IncQueryBasedUMLContextProvider implements IUMLContextProvider {

	private IncQueryEngine engine;
	
	protected IncQueryEngine getEngine() throws IncQueryException {
		if (engine != null) {
			engine = doGetEngine();
			UMLScopeQueries.instance().prepare(engine);			
		}
		return engine;
	}
	
	protected abstract IncQueryEngine doGetEngine();
	
	protected abstract Object getContextObject();
	protected abstract Package getPrimitivePackage();
	
	private <T extends EObject> Iterable<T> getModelElementsByType(EClass eClass, java.lang.Class<T> clazz) throws IncQueryException {
		IncQueryEngine engine = getEngine();
		NavigationHelper index = EMFScope.extractUnderlyingEMFIndex(engine);
		Set<EObject> instances = index.getAllInstances(eClass);
		return Iterables.filter(instances, clazz);
	}
	
	private boolean isRealClass(Class cls) {
		//XXX this is ugly
		return !(
				cls instanceof Behavior ||
				cls instanceof AssociationClass ||
				cls instanceof Component ||
				cls instanceof Node ||
				cls instanceof Stereotype
				);
	}
	
	@Override
	public Type getPrimitiveType(String name) {
    	return getPrimitivePackage().getOwnedType(name);
    }
	
	@Override
	public Iterable<Class> getKnownClasses() {
		try {
			XtClassMatcher matcher = XtClassMatcher.on(getEngine());
			if (matcher.countMatches() > 0) {
				return matcher.getAllValuesOfcl();
			} else {
				return getModelElementsByType(UMLPackage.Literals.CLASS, Class.class);
			}
		} catch (IncQueryException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return Lists.newArrayList();
	}

	@Override
	public Iterable<Type> getKnownTypes() {
		try {
			return getModelElementsByType(UMLPackage.Literals.TYPE, Type.class);
		} catch (IncQueryException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return Lists.newArrayList();
	}
	
	@Override
	public Iterable<Signal> getKnownSignals() {
		try {
			return getModelElementsByType(UMLPackage.Literals.SIGNAL, Signal.class);
		} catch (IncQueryException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return Lists.newArrayList();
	}
	
    @Override
	public Iterable<Association> getKnownAssociations() {
    	try {
			return getModelElementsByType(UMLPackage.Literals.ASSOCIATION, Association.class);
		} catch (IncQueryException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return Lists.newArrayList();
	}
	
	@Override
	public Class getThisType() {
		Object contextObject = getContextObject();
		if (contextObject instanceof Element) {
			Class containerClass = EcoreUtil2.getContainerOfType(((Element)contextObject), Class.class);
			while (containerClass != null && !isRealClass(containerClass)) {
				containerClass = EcoreUtil2.getContainerOfType(((Element)containerClass).eContainer(), Class.class);
			}
			return containerClass;
		}
		return null;
	}

	@Override
	public Iterable<Property> getPropertiesOfClass(Class cl) {
		AttributesOfClassMatcher matcher;
		try {
			matcher = AttributesOfClassMatcher.on(getEngine());
			return matcher.getAllValuesOfattribute(cl);
		} catch (IncQueryException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return Lists.newArrayList();
	}
	
	@Override
	public Iterable<Property> getAssociationsOfClass(Class cl) {
		AssociationsOfClassMatcher matcher;
		try {
			matcher = AssociationsOfClassMatcher.on(getEngine());
			return matcher.getAllValuesOfassociation(cl);
		} catch (IncQueryException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return Lists.newArrayList();
	}
}
