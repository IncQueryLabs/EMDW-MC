package com.incquerylabs.uml.ralf.tests

import com.google.inject.Injector
import com.incquerylabs.uml.ralf.api.impl.SnippetManagerImpl
import com.incquerylabs.uml.ralf.tests.util.ReducedAlfLanguageCustomInjectorProvider
import javax.inject.Inject
import org.eclipse.xtext.junit4.InjectWith
import org.eclipse.xtext.junit4.XtextRunner
import org.junit.FixMethodOrder
import org.junit.Test
import org.junit.runner.RunWith
import org.junit.runners.MethodSorters

import static org.junit.Assert.*

@RunWith(typeof(XtextRunner))
@FixMethodOrder(MethodSorters.NAME_ASCENDING)
@InjectWith(typeof(ReducedAlfLanguageCustomInjectorProvider))
class APITest {
	
	@Inject
	Injector injector;
	
	@Test
	def apiTest() {	

		val manager = new SnippetManagerImpl;
		injector.injectMembers(manager);
		manager.getSnippet("1+1;")
		fail("");
	}
}

