# EMDW-MC
Our own private github repo for the Ericsson project

## UML Integration

### User Guide

* Create Papyrus project with UML model and Class Diagram
* Create Class
* Create State Machine under Class
* Select Class, show the Properties view, select Advanced, set Classifier Behavior to the State Machine
* Create State Machine Diagram under State Machine
* Create initial node, states & transitions
* Save the UML model and you can see the resulting xtumlrt model

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

The integration with Papyrus is achieved with a customized [`IModelSetSnippet`](https://eclipse.googlesource.com/papyrus/org.eclipse.papyrus/+/committers/vlorenzo/kepler/locationEnhancement/plugins/infra/core/org.eclipse.papyrus.infra.core/src/org/eclipse/papyrus/infra/core/resource/IModelSetSnippet.java) which is registered for the extension point `org.eclipse.papyrus.infra.core.org.eclipse.papyrus.infra.core.model`.