package com.incquerylabs.uml.ralf.incquery;

import java.util.Set;

import org.eclipse.emf.ecore.EClass;
import org.eclipse.emf.ecore.EObject;
import org.eclipse.incquery.runtime.api.GenericPatternGroup;
import org.eclipse.incquery.runtime.api.IQueryGroup;
import org.eclipse.incquery.runtime.api.IncQueryEngine;
import org.eclipse.incquery.runtime.base.api.NavigationHelper;
import org.eclipse.incquery.runtime.emf.EMFScope;
import org.eclipse.incquery.runtime.exception.IncQueryException;
import org.eclipse.uml2.uml.Association;
import org.eclipse.uml2.uml.Class;
import org.eclipse.uml2.uml.Element;
import org.eclipse.uml2.uml.Package;
import org.eclipse.uml2.uml.Property;
import org.eclipse.uml2.uml.Signal;
import org.eclipse.uml2.uml.Type;
import org.eclipse.uml2.uml.UMLPackage;
import org.eclipse.xtext.EcoreUtil2;

import com.google.common.collect.Iterables;
import com.google.common.collect.Sets;
import com.incquerylabs.emdw.umlintegration.queries.AssociationsOfClassMatcher;
import com.incquerylabs.emdw.umlintegration.queries.AttributesOfClassMatcher;
import com.incquerylabs.emdw.umlintegration.queries.SignalsMatcher;
import com.incquerylabs.emdw.umlintegration.queries.XtClassMatcher;
import com.incquerylabs.uml.ralf.scoping.IUMLContextProvider;

public abstract class IncQueryBasedUMLContextProvider implements IUMLContextProvider {
	
	private IncQueryEngine engine;
	protected IncQueryEngine getEngine() throws IncQueryException {
		if (engine == null) {
			engine = doGetEngine();
			IQueryGroup queries = GenericPatternGroup.of(
					XtClassMatcher.querySpecification(),
					AssociationsOfClassMatcher.querySpecification(),
					AttributesOfClassMatcher.querySpecification(),
					SignalsMatcher.querySpecification()
					);
			queries.prepare(engine);			
		}
		return engine;
	}
	
	protected abstract IncQueryEngine doGetEngine();
	
	protected abstract Object getContextObject();
	protected abstract Package getPrimitivePackage();
	
	private <T extends EObject> Set<T> getModelElementsByType(EClass eClass, java.lang.Class<T> clazz) throws IncQueryException {
		IncQueryEngine engine = getEngine();
		NavigationHelper index = EMFScope.extractUnderlyingEMFIndex(engine);
		Set<EObject> instances = index.getAllInstances(eClass);
		return Sets.newHashSet(Iterables.filter(instances, clazz));
	}
	
	@Override
	public Type getPrimitiveType(String name) {
    	return getPrimitivePackage().getOwnedType(name);
    }
	
	@Override
	public Set<Class> getKnownClasses() {
		try {
			XtClassMatcher matcher = XtClassMatcher.on(getEngine());
			return matcher.getAllValuesOfumlClass();
		} catch (IncQueryException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return Sets.newHashSet();
	}

	@Override
	public Set<Type> getKnownTypes() {
		try {
			return getModelElementsByType(UMLPackage.Literals.TYPE, Type.class);
		} catch (IncQueryException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return Sets.newHashSet();
	}
	
	@Override
	public Set<Signal> getKnownSignals() {
		SignalsMatcher matcher;
		try {
			matcher = SignalsMatcher.on(getEngine());
			return matcher.getAllValuesOfsig();
		} catch (IncQueryException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return Sets.newHashSet();
	}
	
    @Override
	public Set<Association> getKnownAssociations() {
    	try {
			return getModelElementsByType(UMLPackage.Literals.ASSOCIATION, Association.class);
		} catch (IncQueryException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return Sets.newHashSet();
	}
	
	@Override
	public Class getThisType() {
		Object contextObject = getContextObject();
		Set<Class> umlClasses = getKnownClasses();
		if (contextObject instanceof Element) {
			Class containerClass = EcoreUtil2.getContainerOfType(((Element)contextObject), Class.class);
			while (containerClass != null && !umlClasses.contains(containerClass)) {
				containerClass = EcoreUtil2.getContainerOfType(((Element)containerClass).eContainer(), Class.class);
			}
			return containerClass;
		}
		return null;
	}

	@Override
	public Set<Property> getPropertiesOfClass(Class cl) {
		AttributesOfClassMatcher matcher;
		try {
			matcher = AttributesOfClassMatcher.on(getEngine());
			return matcher.getAllValuesOfattribute(cl);
		} catch (IncQueryException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return Sets.newHashSet();
	}
	
	@Override
	public Set<Property> getAssociationsOfClass(Class cl) {
		AssociationsOfClassMatcher matcher;
		try {
			matcher = AssociationsOfClassMatcher.on(getEngine());
			return matcher.getAllValuesOfassociation(cl);
		} catch (IncQueryException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return Sets.newHashSet();
	}
}
