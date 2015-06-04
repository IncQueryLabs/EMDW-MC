package com.incquerylabs.emdw.cpp.ui

import com.incquerylabs.emdw.cpp.ui.util.CodeGenerator
import com.incquerylabs.emdw.umlintegration.papyrus.EmfModel
import org.eclipse.core.commands.AbstractHandler
import org.eclipse.core.commands.ExecutionEvent
import org.eclipse.core.commands.ExecutionException
import org.eclipse.core.runtime.IAdaptable
import org.eclipse.jface.viewers.ISelection
import org.eclipse.jface.viewers.IStructuredSelection
import org.eclipse.papyrus.infra.core.resource.ModelSet
import org.eclipse.papyrusrt.xtumlrt.xtuml.XTComponent
import org.eclipse.ui.handlers.HandlerUtil
import org.eclipse.uml2.uml.Model

class UmlHandler extends AbstractHandler {
	extension CodeGenerator codeGenerator = new CodeGenerator()
	
	override execute(ExecutionEvent event) throws ExecutionException {
		var selection = HandlerUtil.getCurrentSelection(event);
		
		val umlModel =	selection.getUmlModel
		val umlResource = umlModel.eResource
		val modelUriWithoutExtension = umlResource.getURI.trimFileExtension
		val xtResourceUri = modelUriWithoutExtension.appendFileExtension("xtuml")
		
		val modelSet = umlResource.resourceSet
		if (modelSet instanceof ModelSet){
			val emfModel = modelSet.getModel(xtResourceUri.toString)
			emfModel.saveModel()
			if(emfModel instanceof EmfModel){
				val xtumlResource = emfModel.resource
				val xtModel = xtumlResource.contents.filter(org.eclipse.papyrusrt.xtumlrt.common.Model).head
				val xtComponents = xtModel.entities.filter(XTComponent)
				generateCodeFromXtComponents(xtComponents)
			}
		}
		
		return null;
	}
	
	def getUmlModel(ISelection selection) {
		var Model model
		if (selection instanceof IStructuredSelection){
			val selectedElement = selection.toList.head; 
			if (selectedElement instanceof Model){
				model = selectedElement
			} else if (selectedElement instanceof IAdaptable){
				val adaptableElement = selectedElement as IAdaptable;
				model = adaptableElement.getAdapter(Model) as Model
			}
		}
	}
	
}