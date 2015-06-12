package com.incquerylabs.emdw.cpp.ui

import com.incquerylabs.emdw.cpp.ui.util.CodeGenerator
import org.eclipse.core.commands.AbstractHandler
import org.eclipse.core.commands.ExecutionEvent
import org.eclipse.core.commands.ExecutionException
import org.eclipse.jface.viewers.IStructuredSelection
import org.eclipse.papyrusrt.xtumlrt.xtuml.XTComponent
import org.eclipse.ui.handlers.HandlerUtil

class CPPHandler extends AbstractHandler {
	extension CodeGenerator codeGenerator = new CodeGenerator()
	
	override execute(ExecutionEvent event) throws ExecutionException {
		val selection = HandlerUtil.getCurrentSelection(event);

        if (selection instanceof IStructuredSelection) {
            val xtComponents = selection.toList.filter(XTComponent)          
            generateCodeFromXtComponents(xtComponents)
       	}
       	
       	return null
	}
	
	
	
}