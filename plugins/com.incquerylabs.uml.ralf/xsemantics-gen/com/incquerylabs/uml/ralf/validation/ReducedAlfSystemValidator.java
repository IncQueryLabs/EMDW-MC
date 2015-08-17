package com.incquerylabs.uml.ralf.validation;

import com.google.inject.Inject;
import com.incquerylabs.uml.ralf.ReducedAlfSystem;
import com.incquerylabs.uml.ralf.reducedAlfLanguage.DoStatement;
import com.incquerylabs.uml.ralf.reducedAlfLanguage.Expression;
import com.incquerylabs.uml.ralf.reducedAlfLanguage.FeatureInvocationExpression;
import com.incquerylabs.uml.ralf.reducedAlfLanguage.ForEachStatement;
import com.incquerylabs.uml.ralf.reducedAlfLanguage.ForStatement;
import com.incquerylabs.uml.ralf.reducedAlfLanguage.IfClause;
import com.incquerylabs.uml.ralf.reducedAlfLanguage.LocalNameDeclarationStatement;
import com.incquerylabs.uml.ralf.reducedAlfLanguage.ReturnStatement;
import com.incquerylabs.uml.ralf.reducedAlfLanguage.SendSignalStatement;
import com.incquerylabs.uml.ralf.reducedAlfLanguage.SwitchStatement;
import com.incquerylabs.uml.ralf.reducedAlfLanguage.Variable;
import com.incquerylabs.uml.ralf.reducedAlfLanguage.WhileStatement;
import com.incquerylabs.uml.ralf.validation.AbstractReducedAlfLanguageValidator;
import it.xsemantics.runtime.validation.XsemanticsValidatorErrorGenerator;
import org.eclipse.xtext.validation.Check;

@SuppressWarnings("all")
public class ReducedAlfSystemValidator extends AbstractReducedAlfLanguageValidator {
  @Inject
  protected XsemanticsValidatorErrorGenerator errorGenerator;
  
  @Inject
  protected ReducedAlfSystem xsemanticsSystem;
  
  protected ReducedAlfSystem getXsemanticsSystem() {
    return this.xsemanticsSystem;
  }
  
  @Check
  public void checkExpressionType(final Expression ex) {
    errorGenerator.generateErrors(this,
    	getXsemanticsSystem().checkExpressionType(ex),
    		ex);
  }
  
  @Check
  public void variableType(final Variable var) {
    errorGenerator.generateErrors(this,
    	getXsemanticsSystem().variableType(var),
    		var);
  }
  
  @Check
  public void localNameDeclarationStatementType(final LocalNameDeclarationStatement st) {
    errorGenerator.generateErrors(this,
    	getXsemanticsSystem().localNameDeclarationStatementType(st),
    		st);
  }
  
  @Check
  public void ifClause(final IfClause cl) {
    errorGenerator.generateErrors(this,
    	getXsemanticsSystem().ifClause(cl),
    		cl);
  }
  
  @Check
  public void forStatement(final ForStatement st) {
    errorGenerator.generateErrors(this,
    	getXsemanticsSystem().forStatement(st),
    		st);
  }
  
  @Check
  public void forEachStatement(final ForEachStatement st) {
    errorGenerator.generateErrors(this,
    	getXsemanticsSystem().forEachStatement(st),
    		st);
  }
  
  @Check
  public void whileStatement(final WhileStatement st) {
    errorGenerator.generateErrors(this,
    	getXsemanticsSystem().whileStatement(st),
    		st);
  }
  
  @Check
  public void doStatement(final DoStatement st) {
    errorGenerator.generateErrors(this,
    	getXsemanticsSystem().doStatement(st),
    		st);
  }
  
  @Check
  public void switchStatement_(final SwitchStatement st) {
    errorGenerator.generateErrors(this,
    	getXsemanticsSystem().switchStatement_(st),
    		st);
  }
  
  @Check
  public void sendSignalStatement(final SendSignalStatement st) {
    errorGenerator.generateErrors(this,
    	getXsemanticsSystem().sendSignalStatement(st),
    		st);
  }
  
  @Check
  public void returnStatement(final ReturnStatement st) {
    errorGenerator.generateErrors(this,
    	getXsemanticsSystem().returnStatement(st),
    		st);
  }
  
  @Check
  public void operationParameters(final FeatureInvocationExpression ex) {
    errorGenerator.generateErrors(this,
    	getXsemanticsSystem().operationParameters(ex),
    		ex);
  }
}
