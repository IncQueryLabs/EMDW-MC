package com.incquerylabs.emdw.cpp.ui

import com.incquerylabs.emdw.cpp.codegeneration.fsa.impl.EclipseWorkspaceFileManager
import com.incquerylabs.emdw.toolchain.ToolchainManager
import com.incquerylabs.emdw.toolchain.ToolchainManagerBuilder
import org.apache.log4j.Level
import org.eclipse.core.runtime.IProgressMonitor
import org.eclipse.core.runtime.Status
import org.eclipse.core.runtime.SubMonitor
import org.eclipse.core.runtime.jobs.Job
import org.eclipse.emf.ecore.resource.Resource
import org.eclipse.papyrus.infra.core.resource.ModelSet
import org.eclipse.papyrusrt.xtumlrt.common.Model
import org.eclipse.xtend.lib.annotations.Data

import static com.incquerylabs.emdw.cpp.ui.util.CMUtils.*
import org.eclipse.xtend.lib.annotations.Accessors
import org.eclipse.incquery.runtime.api.AdvancedIncQueryEngine
import com.incquerylabs.emdw.cpp.ui.util.EMDWProgressMonitor

class GeneratorJob extends Job {

	static val JOB_NAME = "EMDW Code Generation"
	
	static val TOOLCHAIN_INIT_WORK = 10
	static val CPP_QRT_INIT_WORK = 5
	static val CPP_COMPONENT_INIT_WORK = 5
	static val CPP_INIT_WORK = 5
	static val MAKEFILE_INIT_WORK = 5
	static val CPP_QRT_TRANSFORM_WORK = 10
	static val CPP_CODE_AND_FILEGEN_WORK = 65
	static val CHANGE_MONITOR_INIT_WORK = 1
	static val LOG_WORK = 1
	static val CPPMODEL_SAVE_WORK = 2
	
	

	val ModelSet modelSet
	val Resource xtumlResource
	val Model xtModel
	val AdvancedIncQueryEngine engine

	new(ModelSet modelSet, Resource xtumlResource, Model xtModel, AdvancedIncQueryEngine engine) {
		super(JOB_NAME)
		this.modelSet = modelSet
		this.xtumlResource = xtumlResource
		this.xtModel = xtModel
		this.engine = engine
	}

	override protected run(IProgressMonitor monitor) {
		val targetFolder = GeneratorHelper.getTargetFolder(xtumlResource, false)


		val tasks = newArrayList

		tasks += new GeneratorTask(CPP_QRT_INIT_WORK, "Initializing C++ QRT transformation.") [ toolchainManager, progressMonitor, progress |
			toolchainManager.initializeCppQrtTransformation
			progressMonitor.worked(progress)
		]
		tasks += new GeneratorTask(CPP_COMPONENT_INIT_WORK, "Initializing C++ component transformation.") [ toolchainManager, progressMonitor, progress |
			toolchainManager.initializeCppComponentTransformation
			progressMonitor.worked(progress)
		]
		tasks += new GeneratorTask(CPP_INIT_WORK, "Initializing C++ codegeneration.") [ toolchainManager, progressMonitor, progress |
			toolchainManager.initializeCppCodegeneration
			progressMonitor.worked(progress)
		]
		tasks += new GeneratorTask(MAKEFILE_INIT_WORK, "Initializing makefile generation") [ toolchainManager, progressMonitor, progress |
			toolchainManager.initializeMakefileGeneration
			progressMonitor.worked(progress)
		]

		tasks += new GeneratorTask(CPP_QRT_TRANSFORM_WORK, "Executing C++ QRT transformation.") [ toolchainManager, progressMonitor, progress |
			toolchainManager.executeCppQrtTransformation
			progressMonitor.worked(progress)
		]
		tasks += new GeneratorTask(CPP_CODE_AND_FILEGEN_WORK, "Executing C++ code and file generation.") [ toolchainManager, progressMonitor, progress |
			toolchainManager.executeDeltaCodeAndFileGeneration(EMDWProgressMonitor::convert(progressMonitor))
			progressMonitor.worked(progress)
		]
		tasks += new GeneratorTask(CHANGE_MONITOR_INIT_WORK, "Starting change monitor.") [ toolchainManager, progressMonitor, progress |
			toolchainManager.startChangeMonitor
			progressMonitor.worked(progress)
		]
		tasks += new GeneratorTask(CPPMODEL_SAVE_WORK, "Saving cppmodel.") [ toolchainManager, progressMonitor, progress |
			val cppModel = toolchainManager.getOrCreateCPPModel
			cppModel.eResource.save(null)
		]
		tasks += new GeneratorTask(LOG_WORK, "Logging times.") [ toolchainManager, progressMonitor, progress |
			toolchainManager.logMeasuredTimes
			progressMonitor.worked(progress)
		]

		// calculate the sum of the progresses of the tasks
		val fullProgress = tasks.map[progress].fold(0)[$0 + $1]
		val subMonitor = SubMonitor::convert(monitor, JOB_NAME, fullProgress + TOOLCHAIN_INIT_WORK)
		
		subMonitor.taskName = "Initializing toolchain."
		val managerBuilder = new ToolchainManagerBuilder => [
			it.engine = engine
			it.xumlrtModel = xtModel
			it.xtumlChangeMonitor = getChangeMonitor(modelSet)
			it.fileManager = new EclipseWorkspaceFileManager(targetFolder)
		]
		val toolchainManager = managerBuilder.buildOrGetManager() => [
			clearMeasuredTimes
			logLevel = Level.DEBUG
		]
		subMonitor.worked(TOOLCHAIN_INIT_WORK)

		try {
			val taskIterator = tasks.iterator
			while (taskIterator.hasNext) {
				if (subMonitor.canceled)
					return Status::CANCEL_STATUS
				val nextTask = taskIterator.next
				nextTask.run(toolchainManager, subMonitor.newChild(nextTask.progress))
			}
		} catch (Exception e) {
			// initialize error status since there is no static version of it
			// TODO use proper plugin id and code
			return new Status(Status::ERROR, "unknown", 1, "xUML-RT Code Generation finished with error", e);
		}

		return Status::OK_STATUS
	}

}

@Data
class GeneratorTask {

	val int progress
	val String taskName
	
	// def void execute(ToolchainManager tm, SubMonitor sm, Integer i)
	@Accessors(NONE) val (ToolchainManager, SubMonitor, Integer)=>void task

	def run(ToolchainManager toolchainManager, SubMonitor monitor) {
		monitor.taskName = taskName
		task.apply(toolchainManager, monitor, progress)
	}
}