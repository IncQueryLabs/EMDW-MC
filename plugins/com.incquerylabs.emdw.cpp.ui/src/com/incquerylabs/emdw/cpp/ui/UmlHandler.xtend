/*******************************************************************************
 * Copyright (c) 2015-2016, IncQuery Labs Ltd. and Ericsson AB
 * All rights reserved. This program and the accompanying materials
 * are made available under the terms of the Eclipse Public License v1.0
 * which accompanies this distribution, and is available at
 * http://www.eclipse.org/legal/epl-v10.html
 *
 * Contributors:
 *   Akos Horvath, Abel Hegedus, Zoltan Ujhelyi, Daniel Segesdi, Tamas Borbas, Robert Doczi, Peter Lunk - initial API and implementation
 *******************************************************************************/
package com.incquerylabs.emdw.cpp.ui

import com.incquerylabs.emdw.toolchain.Toolchain
import com.incquerylabs.emdw.umlintegration.papyrus.EMFResourcePapyrusModel
import com.incquerylabs.uml.papyrus.IncQueryEngineService
import java.util.List
import org.apache.log4j.Logger
import org.eclipse.core.commands.AbstractHandler
import org.eclipse.core.commands.ExecutionEvent
import org.eclipse.core.commands.ExecutionException
import org.eclipse.core.runtime.IAdaptable
import org.eclipse.core.runtime.Status
import org.eclipse.core.runtime.jobs.IJobChangeEvent
import org.eclipse.core.runtime.jobs.Job
import org.eclipse.core.runtime.jobs.JobChangeAdapter
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
import org.eclipse.swt.widgets.Shell
import org.eclipse.ui.handlers.HandlerUtil
import org.eclipse.uml2.uml.Model

class UmlHandler extends AbstractHandler {
	
	enum TransformationScope{
		AllComponents,
		DirtyComponents,
		Cancel
	}
	
	override execute(ExecutionEvent event) throws ExecutionException {
		var selection = HandlerUtil.getCurrentSelection(event);
		val shell = HandlerUtil.getActiveShellChecked(event)
		try{
			val display = shell.display
			
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
				emfModel.saveModel
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
							val generatorJob = new GeneratorJob(modelSet, xtumlResource, xtModel, engine) => [
								priority = Job.BUILD
								user = true
							]
							
							val toolchain = generatorJob.toolchain
							if(toolchain!=null) {
								// Validate xUML-RT model
								val violations = toolchain.validateXtumlModel
								val isValid = violations.isNullOrEmpty
								if(!isValid) {
									reportError(shell, null, "Invalid xtUML model",
										'''
										The following problems were found in the xtUML model, please correct and re-run code generation:
										«FOR violation : violations»
										  - «violation.message»
										«ENDFOR»
										'''
									)
									return null
								}
								
								// Run on all components or on dirty components
								val transformationScope = askForTransformationScope(generatorJob, toolchain, shell)
								if(transformationScope == TransformationScope.Cancel){
									return null
								}
								val transformAllComponents = (transformationScope == TransformationScope.AllComponents);
								generatorJob.transformAllComponents = transformAllComponents
							}
							
							generatorJob.addJobChangeListener(new JobChangeAdapter() {
								
								override done(IJobChangeEvent jobEvent) {
									val result = jobEvent.result
									if(result.severity == Status::OK) {
										display.asyncExec[
											MessageDialog.openInformation(shell,
								 				"xUML-RT Code Generation finished successfully",
												'''
												C++ code generated into project:
												com.ericsson.emdw.cpp.generated.code.«umlResource.URI.trimFileExtension.lastSegment»
												'''
											)	
										]
									} else if (result.severity == Status.ERROR) {
										display.asyncExec[reportError(shell,result.exception, "xUML-RT Code Generation finished with error",
												'''
												Look at the Error Log for details!
												'''
											)
										]
									}
								}
								
							})
							generatorJob.schedule
						} catch (Exception e) {
							reportError(shell,e, "xUML-RT Code Generation finished with error",
								'''
								Look at the Error Log for details!
								'''
							)
						}
					}
				}
			}
		} catch(NotFoundException e){
			reportError(shell,e, "xUML-RT Code Generation could not be executed",
				'''
				xUML-RT model not found in Papyrus Model Set!
				Please close and reopen your UML model, it seems that you have modified
				your project natures since opening the model.
				'''
			)
		} catch(Exception e){
			reportError(shell,e, "xUML-RT Code Generation could not be executed",
				'''
				Look at the Error Log for details!
				'''
			)
		}
		
		return null;
	}
	
	def askForTransformationScope(GeneratorJob generatorJob, Toolchain toolchain, Shell parentShell) {
		toolchain.createChangeMonitorCheckpoint
		var Iterable<XTComponent> dirtyComponents = toolchain.dirtyXtComponents
		val dialog = new MessageDialog(
			parentShell, 
			"xUML-RT Code Generation", 
			null, 
			'''
			Do you want to transform all components, or only the following modified components?
			
			«IF dirtyComponents.isNullOrEmpty»
			No modified components
			
			«ENDIF»
			«FOR component : dirtyComponents»
				* «component.name»
			«ENDFOR»
			'''
			,
			MessageDialog.QUESTION,
			#["All components", "Modified components", "Cancel"],
			1 // "Modified components" is the default
		)
		val dialogResult = dialog.open()
		return TransformationScope.values.get(dialogResult)
	}
	
	def reportError(Shell shell, Throwable exception, String message, String details) {
		MessageDialog.openError(shell, message, details)
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
