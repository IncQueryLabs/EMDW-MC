# EMDW-MC
Our own private github repo for the Ericsson project

## UML Integration

Install:

* [Eclipse Luna](https://www.eclipse.org/downloads/)
* [Papyrus 1.0](http://download.eclipse.org/modeling/mdt/papyrus/updates/releases/luna)
* [IncQuery 1.0](https://hudson.eclipse.org/incquery/job/incquery-master/lastSuccessfulBuild/artifact/update-site/)
* [Xtend 2.7](http://download.eclipse.org/modeling/tmf/xtext/updates/composite/releases/)

Clone & import:

* [xtumlrt metamodel](https://github.com/IncQueryLabs/EMDW-Mirror-Metamodels)
* [UML-RT Code Generator](https://umlrt.zeligsoft.com/gerrit/#/admin/projects/umlrt.code-generator)
* this repo

Use:

* Create Papyrus project with UML model and Class Diagram
* Create Class
* Create State Machine under Class
* Select Class, show the Properties view, select Advanced, set Classifier Behavior to the State Machine
* Create State Machine Diagram under State Machine
* Create initial node, states & transitions