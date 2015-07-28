package com.incquerylabs.uml.ralf.languagegenerator

import org.eclipse.xtext.xtext.ecoreInference.IXtext2EcorePostProcessor
import org.eclipse.xtext.GeneratedMetamodel
import org.eclipse.emf.ecore.EPackage
import org.eclipse.emf.ecore.EClass

@SuppressWarnings("restriction")
class RAlfEcorePostprocessor implements IXtext2EcorePostProcessor {
    
    override process(GeneratedMetamodel metamodel) {
        metamodel.EPackage.process
    }

    def process(EPackage p) {
        val classes = p.EClassifiers.filter(EClass)
        val nameDeclarationClass = classes.findFirst[name == "LocalNameDeclarationStatement"]
        val variableClass = classes.findFirst[name == "Variable"]
        nameDeclarationClass.getEStructuralFeature("variable").EType = variableClass
    }    
}