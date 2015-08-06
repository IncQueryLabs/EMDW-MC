package com.incquerylabs.emdw.cpp.ui

import com.incquerylabs.emdw.cpp.ui.util.CodeGenerator
import com.incquerylabs.emdw.umlintegration.papyrus.EMFResourcePapyrusModel
import com.incquerylabs.emdw.umlintegration.queries.Trace
import java.util.List
import org.eclipse.core.commands.AbstractHandler
import org.eclipse.core.commands.ExecutionEvent
import org.eclipse.core.commands.ExecutionException
import org.eclipse.core.runtime.IAdaptable
import org.eclipse.incquery.runtime.api.AdvancedIncQueryEngine
import org.eclipse.incquery.runtime.emf.EMFScope
import org.eclipse.jface.viewers.ISelection
import org.eclipse.jface.viewers.IStructuredSelection
import org.eclipse.papyrus.infra.core.resource.ModelSet
import org.eclipse.papyrusrt.xtumlrt.common.BaseContainer
import org.eclipse.papyrusrt.xtumlrt.common.Model
import org.eclipse.papyrusrt.xtumlrt.common.Package
import org.eclipse.papyrusrt.xtumlrt.xtuml.XTComponent
import org.eclipse.ui.handlers.HandlerUtil
import org.eclipse.uml2.uml.Component

import static com.incquerylabs.emdw.cpp.ui.util.CMUtils.*

class UmlComponentHandler extends AbstractHandler {
	extension CodeGenerator codeGenerator = new CodeGenerator()
	
	override execute(ExecutionEvent event) throws ExecutionException {
		extension val Trace tracePatterns = Trace.instance
		
		var selection = HandlerUtil.getCurrentSelection(event);
		val umlComponent = selection.getUmlComponent
		val umlResource = umlComponent.eResource
		val modelUriWithoutExtension = umlResource.getURI.trimFileExtension
		val xtResourceUri = modelUriWithoutExtension.appendFileExtension("xtuml")
		
		val modelSet = umlResource.resourceSet
		if (modelSet instanceof ModelSet){
			val emfModel = modelSet.getModel(xtResourceUri.toString)
			emfModel.saveModel()
			if(emfModel instanceof EMFResourcePapyrusModel){
				val xtumlResource = emfModel.resource
				
				val engine = AdvancedIncQueryEngine.createUnmanagedEngine(new EMFScope(xtumlResource.resourceSet))
				val selectedXtComponents = tracePatterns.getTrace(engine).getAllValuesOfxtumlrtElement(null, null, umlComponent).filter(XTComponent)
				engine.dispose
				
				generateCodeFromXtComponents(xtumlResource.resourceSet, selectedXtComponents, event, getChangeMonitor(modelSet))
			}
		}
				
		return null;
	}
	
	def getUmlComponent(ISelection selection) {
		var Component component
		if (selection instanceof IStructuredSelection){
			val selectedElement = selection.toList.head; 
			if (selectedElement instanceof Component){
				component = selectedElement
			} else if (selectedElement instanceof IAdaptable){
				val adaptableElement = selectedElement as IAdaptable;
				component = adaptableElement.getAdapter(Component) as Component
			}
		}
	}
	
	def getAllSubComponents(Model xtModel){
		val topLevelComponents = xtModel.entities.filter(XTComponent)
		val subPackages = xtModel.subPackages
		val subComponents = subPackages.map[entities].flatten.filter(XTComponent)
		val allComponents = topLevelComponents + subComponents
		return allComponents
	}
	
	def List<Package> getSubPackages(BaseContainer baseContainer) {
		val childPackages = baseContainer.packages
		val subPackages = childPackages.map[subPackages].flatten
		val result = (subPackages + childPackages.toList).toList
		return result
	}
}