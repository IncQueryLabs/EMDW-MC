package com.incquerylabs.emdw.cpp.ui

import com.google.common.base.Stopwatch
import com.incquerylabs.emdw.cpp.codegeneration.fsa.impl.EclipseWorkspaceFileManager
import com.incquerylabs.emdw.toolchain.ToolchainManager
import com.incquerylabs.emdw.toolchain.ToolchainManagerBuilder
import com.incquerylabs.emdw.umlintegration.papyrus.EMFResourcePapyrusModel
import com.incquerylabs.uml.papyrus.IncQueryEngineService
import java.util.List
import java.util.concurrent.TimeUnit
import org.apache.log4j.Logger
import org.eclipse.core.commands.AbstractHandler
import org.eclipse.core.commands.ExecutionEvent
import org.eclipse.core.commands.ExecutionException
import org.eclipse.core.runtime.IAdaptable
import org.eclipse.incquery.runtime.api.AdvancedIncQueryEngine
import org.eclipse.jface.dialogs.MessageDialog
import org.eclipse.jface.viewers.ISelection
import org.eclipse.jface.viewers.IStructuredSelection
import org.eclipse.papyrus.infra.core.resource.ModelSet
import org.eclipse.papyrus.infra.core.resource.NotFoundException
import org.eclipse.papyrus.infra.emf.utils.ServiceUtilsForResourceSet
import org.eclipse.papyrusrt.xtumlrt.common.BaseContainer
import org.eclipse.papyrusrt.xtumlrt.common.Package
import org.eclipse.papyrusrt.xtumlrt.xtuml.XTComponent
import org.eclipse.ui.handlers.HandlerUtil
import org.eclipse.uml2.uml.Model

import static com.incquerylabs.emdw.cpp.ui.util.CMUtils.*

class UmlHandler extends AbstractHandler {
	
	override execute(ExecutionEvent event) throws ExecutionException {
		try{
			var selection = HandlerUtil.getCurrentSelection(event);
			
			val umlModel = selection.getUmlModel
			val umlResource = umlModel.eResource
			val modelUriWithoutExtension = umlResource.getURI.trimFileExtension
			val xtResourceUri = modelUriWithoutExtension.appendFileExtension("xtuml")
			
			val modelSet = umlResource.resourceSet
			if (modelSet instanceof ModelSet){
				val registry = ServiceUtilsForResourceSet.getInstance().getServiceRegistry(modelSet)
				val service = registry.getService(IncQueryEngineService)
				val engine = AdvancedIncQueryEngine.from(service.getOrCreateEngine(modelSet))
				
				val emfModel = modelSet.getModelChecked(xtResourceUri.toString)
				emfModel.saveModel()
				if(emfModel instanceof EMFResourcePapyrusModel){
					val xtumlResource = emfModel.resource
					val xtModel = xtumlResource.contents.filter(org.eclipse.papyrusrt.xtumlrt.common.Model).head
					val xtComponents = xtModel.allSubComponents
					if(xtComponents.size == 0) {
						MessageDialog.openInformation(HandlerUtil.getActiveShell(event),
							 "xUML-RT Code Generation skipped",
							'''
							Selected model does not contain any components.
							'''
						)
					} else {
						try{
							val targetFolder = GeneratorHelper.getTargetFolder(xtumlResource, false)
							val managerBuilder = new ToolchainManagerBuilder => [
								it.engine = engine
								it.xumlrtModel = xtModel
								it.xtumlChangeMonitor = getChangeMonitor(modelSet)
								it.fileManager = new EclipseWorkspaceFileManager(targetFolder)
							]
							val ToolchainManager toolchainManager = managerBuilder.buildOrGetManager()
							toolchainManager.initializeCppQrtTransformation()
							toolchainManager.initializeCppComponentTransformation()
							toolchainManager.initializeCppCodegeneration()
							toolchainManager.initializeMakefileGeneration()
							
							toolchainManager.executeCppQrtTransformation
							toolchainManager.executeDeltaCodeAndFileGeneration
							toolchainManager.startChangeMonitor()
							MessageDialog.openInformation(HandlerUtil.getActiveShell(event),
								 "xUML-RT Code Generation finished successfully",
								'''
								C++ code generated into project:
								com.ericsson.emdw.cpp.generated.code.«umlResource.URI.trimFileExtension.lastSegment»
								'''
							)
						} catch (Exception e){
							reportError(event,e, "xUML-RT Code Generation finished with error",
								'''
								Look at the Error Log for details!
								'''
							)
						}
					}
				}
			}
		} catch(NotFoundException e){
			reportError(event,e, "xUML-RT Code Generation could not be executed",
				'''
				xUML-RT model not found in Papyrus Model Set!
				Please close and reopen your UML model, it seems that you have modified
				your project natures since opening the model.
				'''
			)
		} catch(Exception e){
			reportError(event,e, "xUML-RT Code Generation could not be executed",
				'''
				Look at the Error Log for details!
				'''
			)
		}
		
		return null;
	}
	
	def reportError(ExecutionEvent event, Exception exception, String message, String details) {
		MessageDialog.openError(HandlerUtil.getActiveShell(event), message, details)
		Logger.getLogger(class).error(message,exception)
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