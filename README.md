# EMDW-MC
Our own private github repo for the Ericsson project

## UML Integration

### User Guide

* Make sure you are in Papyrus perspective
* Create Papyrus project with UML model and Class Diagram
* Create Class by dragging from Palette
* Create State Machine Diagram under Class in Model Explorer view
  * Right click on class, New diagram, Create a New State Machine Diagram
* On Class Diagram select Class, show the Properties view, select Advanced, set Classifier Behavior to the State Machine
* On State Machine Diagram, Create initial node, states & transitions from Palette
* Save the UML model and you can see the resulting xtumlrt model under your Papyrus model
* You can open the xtumlrt model by right click, Open with..., Other, Sample Reflective Ecore Model Editor if the generated editor of xtUMLrt is not available

### Developer Guide

#### Setup

Install:

* [Eclipse Luna](https://www.eclipse.org/downloads/)
* [Papyrus 1.0](http://download.eclipse.org/modeling/mdt/papyrus/updates/releases/luna)
* [IncQuery 1.0](https://hudson.eclipse.org/incquery/job/incquery-master/lastSuccessfulBuild/artifact/update-site/)
* [Xtend 2.7](http://download.eclipse.org/modeling/tmf/xtext/updates/composite/releases/)

Clone & import:

* [xtumlrt metamodel](https://github.com/IncQueryLabs/EMDW-Mirror-Metamodels)
* this repo

#### Understand

The transformation from [UML](https://wiki.eclipse.org/MDT/UML2) to [xtumlrt](https://umlrt.zeligsoft.com/gerrit/#/admin/projects/xtumlrt.model) is done via the [Query Result Traceability](https://github.com/IncQueryLabs/incquery-examples-cps/wiki/Query-result-traceability-M2M-transformation) method based on [EMF-IncQuery](https://www.eclipse.org/incquery/)'s [Event-driven Virtual Machine](https://wiki.eclipse.org/EMFIncQuery/DeveloperDocumentation/EventDrivenVM). This method is also used in [IncQuery's CPS example](https://github.com/IncQueryLabs/incquery-examples-cps).

The steps of writing a new transformation rule:

1. Write an IncQuery pattern which matches the UML object to transform. It can have more parameters to store additional information.
1. Implement one or more rule classes by extending one of `AbstractRule`'s subclasses.
1. Enumerate it in `TransformationQrt.execute`.
1. Write test cases for it by extending `TransformationTest`.

The integration with Papyrus is achieved with a customized [`IModelSetSnippet`](https://eclipse.googlesource.com/papyrus/org.eclipse.papyrus/+/committers/vlorenzo/kepler/locationEnhancement/plugins/infra/core/org.eclipse.papyrus.infra.core/src/org/eclipse/papyrus/infra/core/resource/IModelSetSnippet.java) which is registered for the extension point `org.eclipse.papyrus.infra.core.org.eclipse.papyrus.infra.core.model`.
