package com.incquerylabs.uml.ralf.tests.validator;

import org.junit.runner.RunWith;
import org.junit.runners.Suite;
import org.junit.runners.Suite.SuiteClasses;

import com.incquerylabs.uml.ralf.tests.validator.expressions.AdditiveExpressionValidatorTest;
import com.incquerylabs.uml.ralf.tests.validator.expressions.AffixExpressionValidatorTest;
import com.incquerylabs.uml.ralf.tests.validator.expressions.AssignmentExpressionValidatorTest;
import com.incquerylabs.uml.ralf.tests.validator.expressions.AuxiliaryExpressionValidatorTest;
import com.incquerylabs.uml.ralf.tests.validator.expressions.CollectionValidatorTest;
import com.incquerylabs.uml.ralf.tests.validator.expressions.ConditionalValidatorTest;
import com.incquerylabs.uml.ralf.tests.validator.expressions.EqualityExpressionValidatorTest;
import com.incquerylabs.uml.ralf.tests.validator.expressions.FilterExpressionValidator;
import com.incquerylabs.uml.ralf.tests.validator.expressions.LiteralExpressionValidatorTest;
import com.incquerylabs.uml.ralf.tests.validator.expressions.MultiplicativeExpressionValidatorTest;
import com.incquerylabs.uml.ralf.tests.validator.expressions.PostfixExpressionValidatorTest;
import com.incquerylabs.uml.ralf.tests.validator.expressions.RelationalExpressionValidatorTest;
import com.incquerylabs.uml.ralf.tests.validator.expressions.ShiftExpressionValidatorTest;
import com.incquerylabs.uml.ralf.tests.validator.statements.BlockStatementValidatorTest;
import com.incquerylabs.uml.ralf.tests.validator.statements.ForStatementValidatorTest;
import com.incquerylabs.uml.ralf.tests.validator.statements.ForStatementValidatorTestIgnored;
import com.incquerylabs.uml.ralf.tests.validator.statements.IfStatementValidatorTest;
import com.incquerylabs.uml.ralf.tests.validator.statements.ReturnStatementValidatorTest;
import com.incquerylabs.uml.ralf.tests.validator.statements.SimpleStatementsValidatorTest;
import com.incquerylabs.uml.ralf.tests.validator.statements.SwitchStatementValidatorTest;
import com.incquerylabs.uml.ralf.tests.validator.statements.VariableDeclarationValidatorTest;
import com.incquerylabs.uml.ralf.tests.validator.statements.WhileStatementValidatorTest;

@RunWith(Suite.class)
@SuiteClasses({ 
    AdditiveExpressionValidatorTest.class, 
    AffixExpressionValidatorTest.class,
    AssignmentExpressionValidatorTest.class,
    AuxiliaryExpressionValidatorTest.class,
    CollectionValidatorTest.class,
    ConditionalValidatorTest.class,
    EqualityExpressionValidatorTest.class,
    FilterExpressionValidator.class,
    LiteralExpressionValidatorTest.class,
    MultiplicativeExpressionValidatorTest.class,
    PostfixExpressionValidatorTest.class,
    RelationalExpressionValidatorTest.class,
    ShiftExpressionValidatorTest.class,
    BlockStatementValidatorTest.class,
    ForStatementValidatorTest.class,
    ForStatementValidatorTestIgnored.class,
    IfStatementValidatorTest.class,
    SimpleStatementsValidatorTest.class,
    SwitchStatementValidatorTest.class,
    ReturnStatementValidatorTest.class,
    VariableDeclarationValidatorTest.class,
    WhileStatementValidatorTest.class})
public class RalfValidatorTestSuite {}
