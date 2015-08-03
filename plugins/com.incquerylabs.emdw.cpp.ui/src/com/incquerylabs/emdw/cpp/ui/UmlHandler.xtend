package com.incquerylabs.emdw.cpp.ui

import com.incquerylabs.emdw.cpp.ui.util.CodeGenerator
import com.incquerylabs.emdw.umlintegration.papyrus.EmfModel
import java.util.List
import org.eclipse.core.commands.AbstractHandler
import org.eclipse.core.commands.ExecutionEvent
import org.eclipse.core.commands.ExecutionException
import org.eclipse.core.runtime.IAdaptable
import org.eclipse.jface.viewers.ISelection
import org.eclipse.jface.viewers.IStructuredSelection
import org.eclipse.papyrus.infra.core.resource.ModelSet
import org.eclipse.papyrusrt.xtumlrt.common.BaseContainer
import org.eclipse.papyrusrt.xtumlrt.common.Package
import org.eclipse.papyrusrt.xtumlrt.xtuml.XTComponent
import org.eclipse.ui.handlers.HandlerUtil
import org.eclipse.uml2.uml.Model

import static com.incquerylabs.emdw.cpp.ui.util.CMUtils.*
import org.eclipse.jface.dialogs.MessageDialog
import org.apache.log4j.Logger

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
				val xtComponents = xtModel.allSubComponents
				try{
					generateCodeFromXtComponents(xtumlResource.resourceSet, xtComponents, event, getChangeMonitor(modelSet))
					MessageDialog.openInformation(HandlerUtil.getActiveShell(event),
						 "xUML-RT Code Generation finished successfully",
						'''
						C++ code generated into project:
						com.ericsson.emdw.cpp.generated.code.«umlResource.URI.trimFileExtension.lastSegment»
						'''
					)
				} catch (Exception e){
					MessageDialog.openError(HandlerUtil.getActiveShell(event),
						 "xUML-RT Code Generation finished with error",
						'''
						Look at the Error Log for details!
						'''
					)
					Logger.getLogger(class).error("xUML-RT Code Generation finished with error",e);
				}
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
	
	def getAllSubComponents(org.eclipse.papyrusrt.xtumlrt.common.Model xtModel){
		val topLevelComponents = xtModel.entities.filter(XTComponent)
		val subPackages = xtModel.subPackages
		val subComponents = subPackages.map[entities].flatten.filter(XTComponent)
		val allComponents = topLevelComponents + subComponents
		return allComponents
	}
	
	def List<Package> getSubPackages(BaseContainer baseContainer) {
		val childPackages = baseContainer.packages
		val subPackages = childPackages.map[subPackages].flatten
		val result = (subPackages + childPackages).toList
		return result
	}
	
}