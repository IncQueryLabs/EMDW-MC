package com.incquerylabs.uml.ralf;

import com.google.common.base.Objects;
import com.google.inject.Inject;
import com.google.inject.Provider;
import com.incquerylabs.uml.ralf.reducedAlfLanguage.ArithmeticExpression;
import com.incquerylabs.uml.ralf.reducedAlfLanguage.AssignmentExpression;
import com.incquerylabs.uml.ralf.reducedAlfLanguage.BooleanLiteralExpression;
import com.incquerylabs.uml.ralf.reducedAlfLanguage.ConditionalLogicalExpression;
import com.incquerylabs.uml.ralf.reducedAlfLanguage.ConditionalTestExpression;
import com.incquerylabs.uml.ralf.reducedAlfLanguage.EqualityExpression;
import com.incquerylabs.uml.ralf.reducedAlfLanguage.Expression;
import com.incquerylabs.uml.ralf.reducedAlfLanguage.FeatureLeftHandSide;
import com.incquerylabs.uml.ralf.reducedAlfLanguage.LeftHandSide;
import com.incquerylabs.uml.ralf.reducedAlfLanguage.LogicalExpression;
import com.incquerylabs.uml.ralf.reducedAlfLanguage.NameExpression;
import com.incquerylabs.uml.ralf.reducedAlfLanguage.NameLeftHandSide;
import com.incquerylabs.uml.ralf.reducedAlfLanguage.NaturalLiteralExpression;
import com.incquerylabs.uml.ralf.reducedAlfLanguage.NumericUnaryExpression;
import com.incquerylabs.uml.ralf.reducedAlfLanguage.PostfixExpression;
import com.incquerylabs.uml.ralf.reducedAlfLanguage.PrefixExpression;
import com.incquerylabs.uml.ralf.reducedAlfLanguage.RelationalExpression;
import com.incquerylabs.uml.ralf.reducedAlfLanguage.ShiftExpression;
import com.incquerylabs.uml.ralf.reducedAlfLanguage.StringLiteralExpression;
import com.incquerylabs.uml.ralf.reducedAlfLanguage.Variable;
import com.incquerylabs.uml.ralf.scoping.IUMLContextProvider;
import it.xsemantics.runtime.ErrorInformation;
import it.xsemantics.runtime.Result;
import it.xsemantics.runtime.RuleApplicationTrace;
import it.xsemantics.runtime.RuleEnvironment;
import it.xsemantics.runtime.RuleFailedException;
import it.xsemantics.runtime.XsemanticsRuntimeSystem;
import org.eclipse.emf.ecore.EObject;
import org.eclipse.uml2.uml.Type;
import org.eclipse.xtext.util.PolymorphicDispatcher;
import org.eclipse.xtext.xbase.lib.Extension;

@SuppressWarnings("all")
public class ReducedAlfSystem extends XsemanticsRuntimeSystem {
  public final static String BOOLEANLITERAL = "com.incquerylabs.uml.ralf.BooleanLiteral";
  
  public final static String NATURALLITERAL = "com.incquerylabs.uml.ralf.NaturalLiteral";
  
  public final static String STRINGLITERAL = "com.incquerylabs.uml.ralf.StringLiteral";
  
  public final static String VARIABLEDECLARATION = "com.incquerylabs.uml.ralf.VariableDeclaration";
  
  public final static String NUMERICUNARYEXPRESSION = "com.incquerylabs.uml.ralf.NumericUnaryExpression";
  
  public final static String ARITHMETICEXPRESSION = "com.incquerylabs.uml.ralf.ArithmeticExpression";
  
  public final static String NAMEEXPRESSION = "com.incquerylabs.uml.ralf.NameExpression";
  
  public final static String ASSIGNMENTEXPRESSION = "com.incquerylabs.uml.ralf.AssignmentExpression";
  
  public final static String PREFIXEXPRESSION = "com.incquerylabs.uml.ralf.PrefixExpression";
  
  public final static String POSTFIXEXPRESSION = "com.incquerylabs.uml.ralf.PostfixExpression";
  
  public final static String SHIFTEXPRESSION = "com.incquerylabs.uml.ralf.ShiftExpression";
  
  public final static String EQUALITYEXPRESSION = "com.incquerylabs.uml.ralf.EqualityExpression";
  
  public final static String RELATIONALEXPRESSION = "com.incquerylabs.uml.ralf.RelationalExpression";
  
  public final static String LOGICALEXPRESSION = "com.incquerylabs.uml.ralf.LogicalExpression";
  
  public final static String CONDITIONALLOGICALEXPRESSION = "com.incquerylabs.uml.ralf.ConditionalLogicalExpression";
  
  public final static String CONDITIONALTESTEXPRESSION = "com.incquerylabs.uml.ralf.ConditionalTestExpression";
  
  public final static String FEATURELEFTHANDSIDE = "com.incquerylabs.uml.ralf.FeatureLeftHandSide";
  
  public final static String NAMELEFTHANDSIDE = "com.incquerylabs.uml.ralf.NameLeftHandSide";
  
  @Extension
  @Inject
  private IUMLContextProvider umlContext;
  
  private final String REAL = IUMLContextProvider.REAL_TYPE;
  
  private final String INTEGER = IUMLContextProvider.INTEGER_TYPE;
  
  private final String BOOLEAN = IUMLContextProvider.BOOLEAN_TYPE;
  
  private final String STRING = IUMLContextProvider.STRING_TYPE;
  
  private PolymorphicDispatcher<Result<Type>> typeDispatcher;
  
  public ReducedAlfSystem() {
    init();
  }
  
  public void init() {
    typeDispatcher = buildPolymorphicDispatcher1(
    	"typeImpl", 3, "|-", ":");
  }
  
  public IUMLContextProvider getUmlContext() {
    return this.umlContext;
  }
  
  public void setUmlContext(final IUMLContextProvider umlContext) {
    this.umlContext = umlContext;
  }
  
  public Object getREAL() {
    return this.REAL;
  }
  
  public Object getINTEGER() {
    return this.INTEGER;
  }
  
  public Object getBOOLEAN() {
    return this.BOOLEAN;
  }
  
  public Object getSTRING() {
    return this.STRING;
  }
  
  public Result<Type> type(final EObject expression) {
    return type(new RuleEnvironment(), null, expression);
  }
  
  public Result<Type> type(final RuleEnvironment _environment_, final EObject expression) {
    return type(_environment_, null, expression);
  }
  
  public Result<Type> type(final RuleEnvironment _environment_, final RuleApplicationTrace _trace_, final EObject expression) {
    try {
    	return typeInternal(_environment_, _trace_, expression);
    } catch (Exception _e_type) {
    	return resultForFailure(_e_type);
    }
  }
  
  public Result<Boolean> checkExpressionType(final Expression ex) {
    return checkExpressionType(null, ex);
  }
  
  public Result<Boolean> checkExpressionType(final RuleApplicationTrace _trace_, final Expression ex) {
    try {
    	return checkExpressionTypeInternal(_trace_, ex);
    } catch (Exception _e_CheckExpressionType) {
    	return resultForFailure(_e_CheckExpressionType);
    }
  }
  
  protected Result<Boolean> checkExpressionTypeInternal(final RuleApplicationTrace _trace_, final Expression ex) throws RuleFailedException {
    /* empty |- ex : var Type type */
    Type type = null;
    Result<Type> result = typeInternal(emptyEnvironment(), _trace_, ex);
    checkAssignableTo(result.getFirst(), Type.class);
    type = (Type) result.getFirst();
    
    return new Result<Boolean>(true);
  }
  
  public Result<Boolean> variableType(final Variable var) {
    return variableType(null, var);
  }
  
  public Result<Boolean> variableType(final RuleApplicationTrace _trace_, final Variable var) {
    try {
    	return variableTypeInternal(_trace_, var);
    } catch (Exception _e_VariableType) {
    	return resultForFailure(_e_VariableType);
    }
  }
  
  protected Result<Boolean> variableTypeInternal(final RuleApplicationTrace _trace_, final Variable var) throws RuleFailedException {
    /* empty |- ^var : var Type type */
    Type type = null;
    Result<Type> result = typeInternal(emptyEnvironment(), _trace_, var);
    checkAssignableTo(result.getFirst(), Type.class);
    type = (Type) result.getFirst();
    
    return new Result<Boolean>(true);
  }
  
  protected Result<Type> typeInternal(final RuleEnvironment _environment_, final RuleApplicationTrace _trace_, final EObject expression) {
    try {
    	checkParamsNotNull(expression);
    	return typeDispatcher.invoke(_environment_, _trace_, expression);
    } catch (Exception _e_type) {
    	sneakyThrowRuleFailedException(_e_type);
    	return null;
    }
  }
  
  protected void typeThrowException(final String _error, final String _issue, final Exception _ex, final EObject expression, final ErrorInformation[] _errorInformations) throws RuleFailedException {
    String _stringRep = this.stringRep(expression);
    String _plus = ("Cannot type " + _stringRep);
    String error = _plus;
    EObject source = expression;
    throwRuleFailedException(error,
    	_issue, _ex, new ErrorInformation(source, null));
  }
  
  protected Result<Type> typeImpl(final RuleEnvironment G, final RuleApplicationTrace _trace_, final BooleanLiteralExpression bool) throws RuleFailedException {
    try {
    	final RuleApplicationTrace _subtrace_ = newTrace(_trace_);
    	final Result<Type> _result_ = applyRuleBooleanLiteral(G, _subtrace_, bool);
    	addToTrace(_trace_, new Provider<Object>() {
    		public Object get() {
    			return ruleName("BooleanLiteral") + stringRepForEnv(G) + " |- " + stringRep(bool) + " : " + stringRep(_result_.getFirst());
    		}
    	});
    	addAsSubtrace(_trace_, _subtrace_);
    	return _result_;
    } catch (Exception e_applyRuleBooleanLiteral) {
    	typeThrowException(ruleName("BooleanLiteral") + stringRepForEnv(G) + " |- " + stringRep(bool) + " : " + "Type",
    		BOOLEANLITERAL,
    		e_applyRuleBooleanLiteral, bool, new ErrorInformation[] {new ErrorInformation(bool)});
    	return null;
    }
  }
  
  protected Result<Type> applyRuleBooleanLiteral(final RuleEnvironment G, final RuleApplicationTrace _trace_, final BooleanLiteralExpression bool) throws RuleFailedException {
    
    return new Result<Type>(_applyRuleBooleanLiteral_1(G, bool));
  }
  
  private Type _applyRuleBooleanLiteral_1(final RuleEnvironment G, final BooleanLiteralExpression bool) throws RuleFailedException {
    Type _primitiveType = this.umlContext.getPrimitiveType(this.BOOLEAN);
    return _primitiveType;
  }
  
  protected Result<Type> typeImpl(final RuleEnvironment G, final RuleApplicationTrace _trace_, final NaturalLiteralExpression natural) throws RuleFailedException {
    try {
    	final RuleApplicationTrace _subtrace_ = newTrace(_trace_);
    	final Result<Type> _result_ = applyRuleNaturalLiteral(G, _subtrace_, natural);
    	addToTrace(_trace_, new Provider<Object>() {
    		public Object get() {
    			return ruleName("NaturalLiteral") + stringRepForEnv(G) + " |- " + stringRep(natural) + " : " + stringRep(_result_.getFirst());
    		}
    	});
    	addAsSubtrace(_trace_, _subtrace_);
    	return _result_;
    } catch (Exception e_applyRuleNaturalLiteral) {
    	typeThrowException(ruleName("NaturalLiteral") + stringRepForEnv(G) + " |- " + stringRep(natural) + " : " + "Type",
    		NATURALLITERAL,
    		e_applyRuleNaturalLiteral, natural, new ErrorInformation[] {new ErrorInformation(natural)});
    	return null;
    }
  }
  
  protected Result<Type> applyRuleNaturalLiteral(final RuleEnvironment G, final RuleApplicationTrace _trace_, final NaturalLiteralExpression natural) throws RuleFailedException {
    
    return new Result<Type>(_applyRuleNaturalLiteral_1(G, natural));
  }
  
  private Type _applyRuleNaturalLiteral_1(final RuleEnvironment G, final NaturalLiteralExpression natural) throws RuleFailedException {
    Type _primitiveType = this.umlContext.getPrimitiveType(this.INTEGER);
    return _primitiveType;
  }
  
  protected Result<Type> typeImpl(final RuleEnvironment G, final RuleApplicationTrace _trace_, final StringLiteralExpression string) throws RuleFailedException {
    try {
    	final RuleApplicationTrace _subtrace_ = newTrace(_trace_);
    	final Result<Type> _result_ = applyRuleStringLiteral(G, _subtrace_, string);
    	addToTrace(_trace_, new Provider<Object>() {
    		public Object get() {
    			return ruleName("StringLiteral") + stringRepForEnv(G) + " |- " + stringRep(string) + " : " + stringRep(_result_.getFirst());
    		}
    	});
    	addAsSubtrace(_trace_, _subtrace_);
    	return _result_;
    } catch (Exception e_applyRuleStringLiteral) {
    	typeThrowException(ruleName("StringLiteral") + stringRepForEnv(G) + " |- " + stringRep(string) + " : " + "Type",
    		STRINGLITERAL,
    		e_applyRuleStringLiteral, string, new ErrorInformation[] {new ErrorInformation(string)});
    	return null;
    }
  }
  
  protected Result<Type> applyRuleStringLiteral(final RuleEnvironment G, final RuleApplicationTrace _trace_, final StringLiteralExpression string) throws RuleFailedException {
    
    return new Result<Type>(_applyRuleStringLiteral_1(G, string));
  }
  
  private Type _applyRuleStringLiteral_1(final RuleEnvironment G, final StringLiteralExpression string) throws RuleFailedException {
    Type _primitiveType = this.umlContext.getPrimitiveType(this.STRING);
    return _primitiveType;
  }
  
  protected Result<Type> typeImpl(final RuleEnvironment G, final RuleApplicationTrace _trace_, final Variable variable) throws RuleFailedException {
    try {
    	final RuleApplicationTrace _subtrace_ = newTrace(_trace_);
    	final Result<Type> _result_ = applyRuleVariableDeclaration(G, _subtrace_, variable);
    	addToTrace(_trace_, new Provider<Object>() {
    		public Object get() {
    			return ruleName("VariableDeclaration") + stringRepForEnv(G) + " |- " + stringRep(variable) + " : " + stringRep(_result_.getFirst());
    		}
    	});
    	addAsSubtrace(_trace_, _subtrace_);
    	return _result_;
    } catch (Exception e_applyRuleVariableDeclaration) {
    	typeThrowException(ruleName("VariableDeclaration") + stringRepForEnv(G) + " |- " + stringRep(variable) + " : " + "Type",
    		VARIABLEDECLARATION,
    		e_applyRuleVariableDeclaration, variable, new ErrorInformation[] {new ErrorInformation(variable)});
    	return null;
    }
  }
  
  protected Result<Type> applyRuleVariableDeclaration(final RuleEnvironment G, final RuleApplicationTrace _trace_, final Variable variable) throws RuleFailedException {
    
    return new Result<Type>(_applyRuleVariableDeclaration_1(G, variable));
  }
  
  private Type _applyRuleVariableDeclaration_1(final RuleEnvironment G, final Variable variable) throws RuleFailedException {
    Type _type = variable.getType();
    return _type;
  }
  
  protected Result<Type> typeImpl(final RuleEnvironment G, final RuleApplicationTrace _trace_, final NumericUnaryExpression ex) throws RuleFailedException {
    try {
    	final RuleApplicationTrace _subtrace_ = newTrace(_trace_);
    	final Result<Type> _result_ = applyRuleNumericUnaryExpression(G, _subtrace_, ex);
    	addToTrace(_trace_, new Provider<Object>() {
    		public Object get() {
    			return ruleName("NumericUnaryExpression") + stringRepForEnv(G) + " |- " + stringRep(ex) + " : " + stringRep(_result_.getFirst());
    		}
    	});
    	addAsSubtrace(_trace_, _subtrace_);
    	return _result_;
    } catch (Exception e_applyRuleNumericUnaryExpression) {
    	typeThrowException(ruleName("NumericUnaryExpression") + stringRepForEnv(G) + " |- " + stringRep(ex) + " : " + "Type",
    		NUMERICUNARYEXPRESSION,
    		e_applyRuleNumericUnaryExpression, ex, new ErrorInformation[] {new ErrorInformation(ex)});
    	return null;
    }
  }
  
  protected Result<Type> applyRuleNumericUnaryExpression(final RuleEnvironment G, final RuleApplicationTrace _trace_, final NumericUnaryExpression ex) throws RuleFailedException {
    Type result = null; // output parameter
    Expression _operand = ex.getOperand();
    Result<Type> _type = this.type(_operand);
    Type _value = _type.getValue();
    Type _primitiveType = this.umlContext.getPrimitiveType(this.INTEGER);
    boolean _equals = Objects.equal(_value, _primitiveType);
    /* ex.operand.type.value == INTEGER.primitiveType */
    if (!_equals) {
      sneakyThrowRuleFailedException("ex.operand.type.value == INTEGER.primitiveType");
    }
    Type _primitiveType_1 = this.umlContext.getPrimitiveType(this.INTEGER);
    result = _primitiveType_1;
    return new Result<Type>(result);
  }
  
  protected Result<Type> typeImpl(final RuleEnvironment G, final RuleApplicationTrace _trace_, final ArithmeticExpression ex) throws RuleFailedException {
    try {
    	final RuleApplicationTrace _subtrace_ = newTrace(_trace_);
    	final Result<Type> _result_ = applyRuleArithmeticExpression(G, _subtrace_, ex);
    	addToTrace(_trace_, new Provider<Object>() {
    		public Object get() {
    			return ruleName("ArithmeticExpression") + stringRepForEnv(G) + " |- " + stringRep(ex) + " : " + stringRep(_result_.getFirst());
    		}
    	});
    	addAsSubtrace(_trace_, _subtrace_);
    	return _result_;
    } catch (Exception e_applyRuleArithmeticExpression) {
    	typeThrowException(ruleName("ArithmeticExpression") + stringRepForEnv(G) + " |- " + stringRep(ex) + " : " + "Type",
    		ARITHMETICEXPRESSION,
    		e_applyRuleArithmeticExpression, ex, new ErrorInformation[] {new ErrorInformation(ex)});
    	return null;
    }
  }
  
  protected Result<Type> applyRuleArithmeticExpression(final RuleEnvironment G, final RuleApplicationTrace _trace_, final ArithmeticExpression ex) throws RuleFailedException {
    Type result = null; // output parameter
    /* G |- ex.operand1 : var Type type1 */
    Expression _operand1 = ex.getOperand1();
    Type type1 = null;
    Result<Type> result_1 = typeInternal(G, _trace_, _operand1);
    checkAssignableTo(result_1.getFirst(), Type.class);
    type1 = (Type) result_1.getFirst();
    
    /* G |- ex.operand2 : var Type type2 */
    Expression _operand2 = ex.getOperand2();
    Type type2 = null;
    Result<Type> result_2 = typeInternal(G, _trace_, _operand2);
    checkAssignableTo(result_2.getFirst(), Type.class);
    type2 = (Type) result_2.getFirst();
    
    /* { ex.operator == "+" type1 == STRING.primitiveType type2 == STRING.primitiveType result = STRING.primitiveType } or { ex.operator == "+" type1 == REAL.primitiveType type2 == REAL.primitiveType || type2 == INTEGER.primitiveType result = REAL.primitiveType } or { ex.operator == "+" type1 == REAL.primitiveType type2 == REAL.primitiveType || type2 == INTEGER.primitiveType result = REAL.primitiveType } or { ex.operator == "+" type1 == REAL.primitiveType || type1 == INTEGER.primitiveType type2 == REAL.primitiveType result = REAL.primitiveType } or { type1 == REAL.primitiveType type2 == INTEGER.primitiveType || type2 == REAL.primitiveType result = REAL.primitiveType } or { type1 == INTEGER.primitiveType || type1 == REAL.primitiveType type2 == REAL.primitiveType result = REAL.primitiveType } or { type1 == INTEGER.primitiveType type2 == INTEGER.primitiveType result = INTEGER.primitiveType } */
    {
      RuleFailedException previousFailure = null;
      try {
        String _operator = ex.getOperator();
        boolean _equals = Objects.equal(_operator, "+");
        /* ex.operator == "+" */
        if (!_equals) {
          sneakyThrowRuleFailedException("ex.operator == \"+\"");
        }
        Type _primitiveType = this.umlContext.getPrimitiveType(this.STRING);
        boolean _equals_1 = Objects.equal(type1, _primitiveType);
        /* type1 == STRING.primitiveType */
        if (!_equals_1) {
          sneakyThrowRuleFailedException("type1 == STRING.primitiveType");
        }
        Type _primitiveType_1 = this.umlContext.getPrimitiveType(this.STRING);
        boolean _equals_2 = Objects.equal(type2, _primitiveType_1);
        /* type2 == STRING.primitiveType */
        if (!_equals_2) {
          sneakyThrowRuleFailedException("type2 == STRING.primitiveType");
        }
        Type _primitiveType_2 = this.umlContext.getPrimitiveType(this.STRING);
        result = _primitiveType_2;
      } catch (Exception e) {
        previousFailure = extractRuleFailedException(e);
        /* { ex.operator == "+" type1 == REAL.primitiveType type2 == REAL.primitiveType || type2 == INTEGER.primitiveType result = REAL.primitiveType } or { ex.operator == "+" type1 == REAL.primitiveType type2 == REAL.primitiveType || type2 == INTEGER.primitiveType result = REAL.primitiveType } or { ex.operator == "+" type1 == REAL.primitiveType || type1 == INTEGER.primitiveType type2 == REAL.primitiveType result = REAL.primitiveType } or { type1 == REAL.primitiveType type2 == INTEGER.primitiveType || type2 == REAL.primitiveType result = REAL.primitiveType } or { type1 == INTEGER.primitiveType || type1 == REAL.primitiveType type2 == REAL.primitiveType result = REAL.primitiveType } or { type1 == INTEGER.primitiveType type2 == INTEGER.primitiveType result = INTEGER.primitiveType } */
        {
          try {
            String _operator_1 = ex.getOperator();
            boolean _equals_3 = Objects.equal(_operator_1, "+");
            /* ex.operator == "+" */
            if (!_equals_3) {
              sneakyThrowRuleFailedException("ex.operator == \"+\"");
            }
            Type _primitiveType_3 = this.umlContext.getPrimitiveType(this.REAL);
            boolean _equals_4 = Objects.equal(type1, _primitiveType_3);
            /* type1 == REAL.primitiveType */
            if (!_equals_4) {
              sneakyThrowRuleFailedException("type1 == REAL.primitiveType");
            }
            boolean _or = false;
            Type _primitiveType_4 = this.umlContext.getPrimitiveType(this.REAL);
            boolean _equals_5 = Objects.equal(type2, _primitiveType_4);
            if (_equals_5) {
              _or = true;
            } else {
              Type _primitiveType_5 = this.umlContext.getPrimitiveType(this.INTEGER);
              boolean _equals_6 = Objects.equal(type2, _primitiveType_5);
              _or = _equals_6;
            }
            /* type2 == REAL.primitiveType || type2 == INTEGER.primitiveType */
            if (!_or) {
              sneakyThrowRuleFailedException("type2 == REAL.primitiveType || type2 == INTEGER.primitiveType");
            }
            Type _primitiveType_6 = this.umlContext.getPrimitiveType(this.REAL);
            result = _primitiveType_6;
          } catch (Exception e_1) {
            previousFailure = extractRuleFailedException(e_1);
            /* { ex.operator == "+" type1 == REAL.primitiveType type2 == REAL.primitiveType || type2 == INTEGER.primitiveType result = REAL.primitiveType } or { ex.operator == "+" type1 == REAL.primitiveType || type1 == INTEGER.primitiveType type2 == REAL.primitiveType result = REAL.primitiveType } or { type1 == REAL.primitiveType type2 == INTEGER.primitiveType || type2 == REAL.primitiveType result = REAL.primitiveType } or { type1 == INTEGER.primitiveType || type1 == REAL.primitiveType type2 == REAL.primitiveType result = REAL.primitiveType } or { type1 == INTEGER.primitiveType type2 == INTEGER.primitiveType result = INTEGER.primitiveType } */
            {
              try {
                String _operator_2 = ex.getOperator();
                boolean _equals_7 = Objects.equal(_operator_2, "+");
                /* ex.operator == "+" */
                if (!_equals_7) {
                  sneakyThrowRuleFailedException("ex.operator == \"+\"");
                }
                Type _primitiveType_7 = this.umlContext.getPrimitiveType(this.REAL);
                boolean _equals_8 = Objects.equal(type1, _primitiveType_7);
                /* type1 == REAL.primitiveType */
                if (!_equals_8) {
                  sneakyThrowRuleFailedException("type1 == REAL.primitiveType");
                }
                boolean _or_1 = false;
                Type _primitiveType_8 = this.umlContext.getPrimitiveType(this.REAL);
                boolean _equals_9 = Objects.equal(type2, _primitiveType_8);
                if (_equals_9) {
                  _or_1 = true;
                } else {
                  Type _primitiveType_9 = this.umlContext.getPrimitiveType(this.INTEGER);
                  boolean _equals_10 = Objects.equal(type2, _primitiveType_9);
                  _or_1 = _equals_10;
                }
                /* type2 == REAL.primitiveType || type2 == INTEGER.primitiveType */
                if (!_or_1) {
                  sneakyThrowRuleFailedException("type2 == REAL.primitiveType || type2 == INTEGER.primitiveType");
                }
                Type _primitiveType_10 = this.umlContext.getPrimitiveType(this.REAL);
                result = _primitiveType_10;
              } catch (Exception e_2) {
                previousFailure = extractRuleFailedException(e_2);
                /* { ex.operator == "+" type1 == REAL.primitiveType || type1 == INTEGER.primitiveType type2 == REAL.primitiveType result = REAL.primitiveType } or { type1 == REAL.primitiveType type2 == INTEGER.primitiveType || type2 == REAL.primitiveType result = REAL.primitiveType } or { type1 == INTEGER.primitiveType || type1 == REAL.primitiveType type2 == REAL.primitiveType result = REAL.primitiveType } or { type1 == INTEGER.primitiveType type2 == INTEGER.primitiveType result = INTEGER.primitiveType } */
                {
                  try {
                    String _operator_3 = ex.getOperator();
                    boolean _equals_11 = Objects.equal(_operator_3, "+");
                    /* ex.operator == "+" */
                    if (!_equals_11) {
                      sneakyThrowRuleFailedException("ex.operator == \"+\"");
                    }
                    boolean _or_2 = false;
                    Type _primitiveType_11 = this.umlContext.getPrimitiveType(this.REAL);
                    boolean _equals_12 = Objects.equal(type1, _primitiveType_11);
                    if (_equals_12) {
                      _or_2 = true;
                    } else {
                      Type _primitiveType_12 = this.umlContext.getPrimitiveType(this.INTEGER);
                      boolean _equals_13 = Objects.equal(type1, _primitiveType_12);
                      _or_2 = _equals_13;
                    }
                    /* type1 == REAL.primitiveType || type1 == INTEGER.primitiveType */
                    if (!_or_2) {
                      sneakyThrowRuleFailedException("type1 == REAL.primitiveType || type1 == INTEGER.primitiveType");
                    }
                    Type _primitiveType_13 = this.umlContext.getPrimitiveType(this.REAL);
                    boolean _equals_14 = Objects.equal(type2, _primitiveType_13);
                    /* type2 == REAL.primitiveType */
                    if (!_equals_14) {
                      sneakyThrowRuleFailedException("type2 == REAL.primitiveType");
                    }
                    Type _primitiveType_14 = this.umlContext.getPrimitiveType(this.REAL);
                    result = _primitiveType_14;
                  } catch (Exception e_3) {
                    previousFailure = extractRuleFailedException(e_3);
                    /* { type1 == REAL.primitiveType type2 == INTEGER.primitiveType || type2 == REAL.primitiveType result = REAL.primitiveType } or { type1 == INTEGER.primitiveType || type1 == REAL.primitiveType type2 == REAL.primitiveType result = REAL.primitiveType } or { type1 == INTEGER.primitiveType type2 == INTEGER.primitiveType result = INTEGER.primitiveType } */
                    {
                      try {
                        Type _primitiveType_15 = this.umlContext.getPrimitiveType(this.REAL);
                        boolean _equals_15 = Objects.equal(type1, _primitiveType_15);
                        /* type1 == REAL.primitiveType */
                        if (!_equals_15) {
                          sneakyThrowRuleFailedException("type1 == REAL.primitiveType");
                        }
                        boolean _or_3 = false;
                        Type _primitiveType_16 = this.umlContext.getPrimitiveType(this.INTEGER);
                        boolean _equals_16 = Objects.equal(type2, _primitiveType_16);
                        if (_equals_16) {
                          _or_3 = true;
                        } else {
                          Type _primitiveType_17 = this.umlContext.getPrimitiveType(this.REAL);
                          boolean _equals_17 = Objects.equal(type2, _primitiveType_17);
                          _or_3 = _equals_17;
                        }
                        /* type2 == INTEGER.primitiveType || type2 == REAL.primitiveType */
                        if (!_or_3) {
                          sneakyThrowRuleFailedException("type2 == INTEGER.primitiveType || type2 == REAL.primitiveType");
                        }
                        Type _primitiveType_18 = this.umlContext.getPrimitiveType(this.REAL);
                        result = _primitiveType_18;
                      } catch (Exception e_4) {
                        previousFailure = extractRuleFailedException(e_4);
                        /* { type1 == INTEGER.primitiveType || type1 == REAL.primitiveType type2 == REAL.primitiveType result = REAL.primitiveType } or { type1 == INTEGER.primitiveType type2 == INTEGER.primitiveType result = INTEGER.primitiveType } */
                        {
                          try {
                            boolean _or_4 = false;
                            Type _primitiveType_19 = this.umlContext.getPrimitiveType(this.INTEGER);
                            boolean _equals_18 = Objects.equal(type1, _primitiveType_19);
                            if (_equals_18) {
                              _or_4 = true;
                            } else {
                              Type _primitiveType_20 = this.umlContext.getPrimitiveType(this.REAL);
                              boolean _equals_19 = Objects.equal(type1, _primitiveType_20);
                              _or_4 = _equals_19;
                            }
                            /* type1 == INTEGER.primitiveType || type1 == REAL.primitiveType */
                            if (!_or_4) {
                              sneakyThrowRuleFailedException("type1 == INTEGER.primitiveType || type1 == REAL.primitiveType");
                            }
                            Type _primitiveType_21 = this.umlContext.getPrimitiveType(this.REAL);
                            boolean _equals_20 = Objects.equal(type2, _primitiveType_21);
                            /* type2 == REAL.primitiveType */
                            if (!_equals_20) {
                              sneakyThrowRuleFailedException("type2 == REAL.primitiveType");
                            }
                            Type _primitiveType_22 = this.umlContext.getPrimitiveType(this.REAL);
                            result = _primitiveType_22;
                          } catch (Exception e_5) {
                            previousFailure = extractRuleFailedException(e_5);
                            Type _primitiveType_23 = this.umlContext.getPrimitiveType(this.INTEGER);
                            boolean _equals_21 = Objects.equal(type1, _primitiveType_23);
                            /* type1 == INTEGER.primitiveType */
                            if (!_equals_21) {
                              sneakyThrowRuleFailedException("type1 == INTEGER.primitiveType");
                            }
                            Type _primitiveType_24 = this.umlContext.getPrimitiveType(this.INTEGER);
                            boolean _equals_22 = Objects.equal(type2, _primitiveType_24);
                            /* type2 == INTEGER.primitiveType */
                            if (!_equals_22) {
                              sneakyThrowRuleFailedException("type2 == INTEGER.primitiveType");
                            }
                            Type _primitiveType_25 = this.umlContext.getPrimitiveType(this.INTEGER);
                            result = _primitiveType_25;
                          }
                        }
                      }
                    }
                  }
                }
              }
            }
          }
        }
      }
    }
    return new Result<Type>(result);
  }
  
  protected Result<Type> typeImpl(final RuleEnvironment G, final RuleApplicationTrace _trace_, final NameExpression ex) throws RuleFailedException {
    try {
    	final RuleApplicationTrace _subtrace_ = newTrace(_trace_);
    	final Result<Type> _result_ = applyRuleNameExpression(G, _subtrace_, ex);
    	addToTrace(_trace_, new Provider<Object>() {
    		public Object get() {
    			return ruleName("NameExpression") + stringRepForEnv(G) + " |- " + stringRep(ex) + " : " + stringRep(_result_.getFirst());
    		}
    	});
    	addAsSubtrace(_trace_, _subtrace_);
    	return _result_;
    } catch (Exception e_applyRuleNameExpression) {
    	typeThrowException(ruleName("NameExpression") + stringRepForEnv(G) + " |- " + stringRep(ex) + " : " + "Type",
    		NAMEEXPRESSION,
    		e_applyRuleNameExpression, ex, new ErrorInformation[] {new ErrorInformation(ex)});
    	return null;
    }
  }
  
  protected Result<Type> applyRuleNameExpression(final RuleEnvironment G, final RuleApplicationTrace _trace_, final NameExpression ex) throws RuleFailedException {
    Type result = null; // output parameter
    /* G |- ex.reference : var Type varType */
    Variable _reference = ex.getReference();
    Type varType = null;
    Result<Type> result_1 = typeInternal(G, _trace_, _reference);
    checkAssignableTo(result_1.getFirst(), Type.class);
    varType = (Type) result_1.getFirst();
    
    result = varType;
    return new Result<Type>(result);
  }
  
  protected Result<Type> typeImpl(final RuleEnvironment G, final RuleApplicationTrace _trace_, final AssignmentExpression ex) throws RuleFailedException {
    try {
    	final RuleApplicationTrace _subtrace_ = newTrace(_trace_);
    	final Result<Type> _result_ = applyRuleAssignmentExpression(G, _subtrace_, ex);
    	addToTrace(_trace_, new Provider<Object>() {
    		public Object get() {
    			return ruleName("AssignmentExpression") + stringRepForEnv(G) + " |- " + stringRep(ex) + " : " + stringRep(_result_.getFirst());
    		}
    	});
    	addAsSubtrace(_trace_, _subtrace_);
    	return _result_;
    } catch (Exception e_applyRuleAssignmentExpression) {
    	typeThrowException(ruleName("AssignmentExpression") + stringRepForEnv(G) + " |- " + stringRep(ex) + " : " + "Type",
    		ASSIGNMENTEXPRESSION,
    		e_applyRuleAssignmentExpression, ex, new ErrorInformation[] {new ErrorInformation(ex)});
    	return null;
    }
  }
  
  protected Result<Type> applyRuleAssignmentExpression(final RuleEnvironment G, final RuleApplicationTrace _trace_, final AssignmentExpression ex) throws RuleFailedException {
    Type result = null; // output parameter
    /* G |- ex.leftHandSide : var Type leftType */
    LeftHandSide _leftHandSide = ex.getLeftHandSide();
    Type leftType = null;
    Result<Type> result_1 = typeInternal(G, _trace_, _leftHandSide);
    checkAssignableTo(result_1.getFirst(), Type.class);
    leftType = (Type) result_1.getFirst();
    
    /* G |- ex.rightHandSide : var Type rightType */
    Expression _rightHandSide = ex.getRightHandSide();
    Type rightType = null;
    Result<Type> result_2 = typeInternal(G, _trace_, _rightHandSide);
    checkAssignableTo(result_2.getFirst(), Type.class);
    rightType = (Type) result_2.getFirst();
    
    leftType = rightType;
    result = rightType;
    return new Result<Type>(result);
  }
  
  protected Result<Type> typeImpl(final RuleEnvironment G, final RuleApplicationTrace _trace_, final PrefixExpression ex) throws RuleFailedException {
    try {
    	final RuleApplicationTrace _subtrace_ = newTrace(_trace_);
    	final Result<Type> _result_ = applyRulePrefixExpression(G, _subtrace_, ex);
    	addToTrace(_trace_, new Provider<Object>() {
    		public Object get() {
    			return ruleName("PrefixExpression") + stringRepForEnv(G) + " |- " + stringRep(ex) + " : " + stringRep(_result_.getFirst());
    		}
    	});
    	addAsSubtrace(_trace_, _subtrace_);
    	return _result_;
    } catch (Exception e_applyRulePrefixExpression) {
    	typeThrowException(ruleName("PrefixExpression") + stringRepForEnv(G) + " |- " + stringRep(ex) + " : " + "Type",
    		PREFIXEXPRESSION,
    		e_applyRulePrefixExpression, ex, new ErrorInformation[] {new ErrorInformation(ex)});
    	return null;
    }
  }
  
  protected Result<Type> applyRulePrefixExpression(final RuleEnvironment G, final RuleApplicationTrace _trace_, final PrefixExpression ex) throws RuleFailedException {
    Type result = null; // output parameter
    /* G |- ex.operand : var Type opType */
    LeftHandSide _operand = ex.getOperand();
    Type opType = null;
    Result<Type> result_1 = typeInternal(G, _trace_, _operand);
    checkAssignableTo(result_1.getFirst(), Type.class);
    opType = (Type) result_1.getFirst();
    
    Type _primitiveType = this.umlContext.getPrimitiveType(this.INTEGER);
    boolean _equals = Objects.equal(opType, _primitiveType);
    /* opType == INTEGER.primitiveType */
    if (!_equals) {
      sneakyThrowRuleFailedException("opType == INTEGER.primitiveType");
    }
    Type _primitiveType_1 = this.umlContext.getPrimitiveType(this.INTEGER);
    result = _primitiveType_1;
    return new Result<Type>(result);
  }
  
  protected Result<Type> typeImpl(final RuleEnvironment G, final RuleApplicationTrace _trace_, final PostfixExpression ex) throws RuleFailedException {
    try {
    	final RuleApplicationTrace _subtrace_ = newTrace(_trace_);
    	final Result<Type> _result_ = applyRulePostfixExpression(G, _subtrace_, ex);
    	addToTrace(_trace_, new Provider<Object>() {
    		public Object get() {
    			return ruleName("PostfixExpression") + stringRepForEnv(G) + " |- " + stringRep(ex) + " : " + stringRep(_result_.getFirst());
    		}
    	});
    	addAsSubtrace(_trace_, _subtrace_);
    	return _result_;
    } catch (Exception e_applyRulePostfixExpression) {
    	typeThrowException(ruleName("PostfixExpression") + stringRepForEnv(G) + " |- " + stringRep(ex) + " : " + "Type",
    		POSTFIXEXPRESSION,
    		e_applyRulePostfixExpression, ex, new ErrorInformation[] {new ErrorInformation(ex)});
    	return null;
    }
  }
  
  protected Result<Type> applyRulePostfixExpression(final RuleEnvironment G, final RuleApplicationTrace _trace_, final PostfixExpression ex) throws RuleFailedException {
    Type result = null; // output parameter
    /* G |- ex.operand : var Type opType */
    LeftHandSide _operand = ex.getOperand();
    Type opType = null;
    Result<Type> result_1 = typeInternal(G, _trace_, _operand);
    checkAssignableTo(result_1.getFirst(), Type.class);
    opType = (Type) result_1.getFirst();
    
    Type _primitiveType = this.umlContext.getPrimitiveType(this.INTEGER);
    boolean _equals = Objects.equal(opType, _primitiveType);
    /* opType == INTEGER.primitiveType */
    if (!_equals) {
      sneakyThrowRuleFailedException("opType == INTEGER.primitiveType");
    }
    Type _primitiveType_1 = this.umlContext.getPrimitiveType(this.INTEGER);
    result = _primitiveType_1;
    return new Result<Type>(result);
  }
  
  protected Result<Type> typeImpl(final RuleEnvironment G, final RuleApplicationTrace _trace_, final ShiftExpression ex) throws RuleFailedException {
    try {
    	final RuleApplicationTrace _subtrace_ = newTrace(_trace_);
    	final Result<Type> _result_ = applyRuleShiftExpression(G, _subtrace_, ex);
    	addToTrace(_trace_, new Provider<Object>() {
    		public Object get() {
    			return ruleName("ShiftExpression") + stringRepForEnv(G) + " |- " + stringRep(ex) + " : " + stringRep(_result_.getFirst());
    		}
    	});
    	addAsSubtrace(_trace_, _subtrace_);
    	return _result_;
    } catch (Exception e_applyRuleShiftExpression) {
    	typeThrowException(ruleName("ShiftExpression") + stringRepForEnv(G) + " |- " + stringRep(ex) + " : " + "Type",
    		SHIFTEXPRESSION,
    		e_applyRuleShiftExpression, ex, new ErrorInformation[] {new ErrorInformation(ex)});
    	return null;
    }
  }
  
  protected Result<Type> applyRuleShiftExpression(final RuleEnvironment G, final RuleApplicationTrace _trace_, final ShiftExpression ex) throws RuleFailedException {
    Type result = null; // output parameter
    /* G |- ex.operand1 : var Type op1Type */
    Expression _operand1 = ex.getOperand1();
    Type op1Type = null;
    Result<Type> result_1 = typeInternal(G, _trace_, _operand1);
    checkAssignableTo(result_1.getFirst(), Type.class);
    op1Type = (Type) result_1.getFirst();
    
    /* G |- ex.operand2 : var Type op2Type */
    Expression _operand2 = ex.getOperand2();
    Type op2Type = null;
    Result<Type> result_2 = typeInternal(G, _trace_, _operand2);
    checkAssignableTo(result_2.getFirst(), Type.class);
    op2Type = (Type) result_2.getFirst();
    
    Type _primitiveType = this.umlContext.getPrimitiveType(this.INTEGER);
    boolean _equals = Objects.equal(op1Type, _primitiveType);
    /* op1Type == INTEGER.primitiveType */
    if (!_equals) {
      sneakyThrowRuleFailedException("op1Type == INTEGER.primitiveType");
    }
    Type _primitiveType_1 = this.umlContext.getPrimitiveType(this.INTEGER);
    boolean _equals_1 = Objects.equal(op2Type, _primitiveType_1);
    /* op2Type == INTEGER.primitiveType */
    if (!_equals_1) {
      sneakyThrowRuleFailedException("op2Type == INTEGER.primitiveType");
    }
    Type _primitiveType_2 = this.umlContext.getPrimitiveType(this.INTEGER);
    result = _primitiveType_2;
    return new Result<Type>(result);
  }
  
  protected Result<Type> typeImpl(final RuleEnvironment G, final RuleApplicationTrace _trace_, final EqualityExpression ex) throws RuleFailedException {
    try {
    	final RuleApplicationTrace _subtrace_ = newTrace(_trace_);
    	final Result<Type> _result_ = applyRuleEqualityExpression(G, _subtrace_, ex);
    	addToTrace(_trace_, new Provider<Object>() {
    		public Object get() {
    			return ruleName("EqualityExpression") + stringRepForEnv(G) + " |- " + stringRep(ex) + " : " + stringRep(_result_.getFirst());
    		}
    	});
    	addAsSubtrace(_trace_, _subtrace_);
    	return _result_;
    } catch (Exception e_applyRuleEqualityExpression) {
    	typeThrowException(ruleName("EqualityExpression") + stringRepForEnv(G) + " |- " + stringRep(ex) + " : " + "Type",
    		EQUALITYEXPRESSION,
    		e_applyRuleEqualityExpression, ex, new ErrorInformation[] {new ErrorInformation(ex)});
    	return null;
    }
  }
  
  protected Result<Type> applyRuleEqualityExpression(final RuleEnvironment G, final RuleApplicationTrace _trace_, final EqualityExpression ex) throws RuleFailedException {
    Type result = null; // output parameter
    /* G |- ex.operand1 : var Type op1Type */
    Expression _operand1 = ex.getOperand1();
    Type op1Type = null;
    Result<Type> result_1 = typeInternal(G, _trace_, _operand1);
    checkAssignableTo(result_1.getFirst(), Type.class);
    op1Type = (Type) result_1.getFirst();
    
    /* G |- ex.operand2 : var Type op2Type */
    Expression _operand2 = ex.getOperand2();
    Type op2Type = null;
    Result<Type> result_2 = typeInternal(G, _trace_, _operand2);
    checkAssignableTo(result_2.getFirst(), Type.class);
    op2Type = (Type) result_2.getFirst();
    
    boolean _equals = Objects.equal(op1Type, op2Type);
    /* op1Type == op2Type */
    if (!_equals) {
      sneakyThrowRuleFailedException("op1Type == op2Type");
    }
    Type _primitiveType = this.umlContext.getPrimitiveType(this.BOOLEAN);
    result = _primitiveType;
    return new Result<Type>(result);
  }
  
  protected Result<Type> typeImpl(final RuleEnvironment G, final RuleApplicationTrace _trace_, final RelationalExpression ex) throws RuleFailedException {
    try {
    	final RuleApplicationTrace _subtrace_ = newTrace(_trace_);
    	final Result<Type> _result_ = applyRuleRelationalExpression(G, _subtrace_, ex);
    	addToTrace(_trace_, new Provider<Object>() {
    		public Object get() {
    			return ruleName("RelationalExpression") + stringRepForEnv(G) + " |- " + stringRep(ex) + " : " + stringRep(_result_.getFirst());
    		}
    	});
    	addAsSubtrace(_trace_, _subtrace_);
    	return _result_;
    } catch (Exception e_applyRuleRelationalExpression) {
    	typeThrowException(ruleName("RelationalExpression") + stringRepForEnv(G) + " |- " + stringRep(ex) + " : " + "Type",
    		RELATIONALEXPRESSION,
    		e_applyRuleRelationalExpression, ex, new ErrorInformation[] {new ErrorInformation(ex)});
    	return null;
    }
  }
  
  protected Result<Type> applyRuleRelationalExpression(final RuleEnvironment G, final RuleApplicationTrace _trace_, final RelationalExpression ex) throws RuleFailedException {
    Type result = null; // output parameter
    /* G |- ex.operand1 : var Type op1Type */
    Expression _operand1 = ex.getOperand1();
    Type op1Type = null;
    Result<Type> result_1 = typeInternal(G, _trace_, _operand1);
    checkAssignableTo(result_1.getFirst(), Type.class);
    op1Type = (Type) result_1.getFirst();
    
    /* G |- ex.operand2 : var Type op2Type */
    Expression _operand2 = ex.getOperand2();
    Type op2Type = null;
    Result<Type> result_2 = typeInternal(G, _trace_, _operand2);
    checkAssignableTo(result_2.getFirst(), Type.class);
    op2Type = (Type) result_2.getFirst();
    
    boolean _or = false;
    Type _primitiveType = this.umlContext.getPrimitiveType(this.INTEGER);
    boolean _equals = Objects.equal(op1Type, _primitiveType);
    if (_equals) {
      _or = true;
    } else {
      Type _primitiveType_1 = this.umlContext.getPrimitiveType(this.REAL);
      boolean _equals_1 = Objects.equal(op1Type, _primitiveType_1);
      _or = _equals_1;
    }
    /* op1Type == INTEGER.primitiveType || op1Type == REAL.primitiveType */
    if (!_or) {
      sneakyThrowRuleFailedException("op1Type == INTEGER.primitiveType || op1Type == REAL.primitiveType");
    }
    boolean _or_1 = false;
    Type _primitiveType_2 = this.umlContext.getPrimitiveType(this.INTEGER);
    boolean _equals_2 = Objects.equal(op2Type, _primitiveType_2);
    if (_equals_2) {
      _or_1 = true;
    } else {
      Type _primitiveType_3 = this.umlContext.getPrimitiveType(this.REAL);
      boolean _equals_3 = Objects.equal(op2Type, _primitiveType_3);
      _or_1 = _equals_3;
    }
    /* op2Type == INTEGER.primitiveType || op2Type == REAL.primitiveType */
    if (!_or_1) {
      sneakyThrowRuleFailedException("op2Type == INTEGER.primitiveType || op2Type == REAL.primitiveType");
    }
    boolean _equals_4 = Objects.equal(op1Type, op2Type);
    /* op1Type == op2Type */
    if (!_equals_4) {
      sneakyThrowRuleFailedException("op1Type == op2Type");
    }
    Type _primitiveType_4 = this.umlContext.getPrimitiveType(this.BOOLEAN);
    result = _primitiveType_4;
    return new Result<Type>(result);
  }
  
  protected Result<Type> typeImpl(final RuleEnvironment G, final RuleApplicationTrace _trace_, final LogicalExpression ex) throws RuleFailedException {
    try {
    	final RuleApplicationTrace _subtrace_ = newTrace(_trace_);
    	final Result<Type> _result_ = applyRuleLogicalExpression(G, _subtrace_, ex);
    	addToTrace(_trace_, new Provider<Object>() {
    		public Object get() {
    			return ruleName("LogicalExpression") + stringRepForEnv(G) + " |- " + stringRep(ex) + " : " + stringRep(_result_.getFirst());
    		}
    	});
    	addAsSubtrace(_trace_, _subtrace_);
    	return _result_;
    } catch (Exception e_applyRuleLogicalExpression) {
    	typeThrowException(ruleName("LogicalExpression") + stringRepForEnv(G) + " |- " + stringRep(ex) + " : " + "Type",
    		LOGICALEXPRESSION,
    		e_applyRuleLogicalExpression, ex, new ErrorInformation[] {new ErrorInformation(ex)});
    	return null;
    }
  }
  
  protected Result<Type> applyRuleLogicalExpression(final RuleEnvironment G, final RuleApplicationTrace _trace_, final LogicalExpression ex) throws RuleFailedException {
    Type result = null; // output parameter
    /* G |- ex.operand1 : var Type op1Type */
    Expression _operand1 = ex.getOperand1();
    Type op1Type = null;
    Result<Type> result_1 = typeInternal(G, _trace_, _operand1);
    checkAssignableTo(result_1.getFirst(), Type.class);
    op1Type = (Type) result_1.getFirst();
    
    /* G |- ex.operand2 : var Type op2Type */
    Expression _operand2 = ex.getOperand2();
    Type op2Type = null;
    Result<Type> result_2 = typeInternal(G, _trace_, _operand2);
    checkAssignableTo(result_2.getFirst(), Type.class);
    op2Type = (Type) result_2.getFirst();
    
    /* { op1Type == BOOLEAN.primitiveType op2Type == BOOLEAN.primitiveType result = BOOLEAN.primitiveType } or { op1Type == INTEGER.primitiveType op2Type == INTEGER.primitiveType result = INTEGER.primitiveType } */
    {
      RuleFailedException previousFailure = null;
      try {
        Type _primitiveType = this.umlContext.getPrimitiveType(this.BOOLEAN);
        boolean _equals = Objects.equal(op1Type, _primitiveType);
        /* op1Type == BOOLEAN.primitiveType */
        if (!_equals) {
          sneakyThrowRuleFailedException("op1Type == BOOLEAN.primitiveType");
        }
        Type _primitiveType_1 = this.umlContext.getPrimitiveType(this.BOOLEAN);
        boolean _equals_1 = Objects.equal(op2Type, _primitiveType_1);
        /* op2Type == BOOLEAN.primitiveType */
        if (!_equals_1) {
          sneakyThrowRuleFailedException("op2Type == BOOLEAN.primitiveType");
        }
        Type _primitiveType_2 = this.umlContext.getPrimitiveType(this.BOOLEAN);
        result = _primitiveType_2;
      } catch (Exception e) {
        previousFailure = extractRuleFailedException(e);
        Type _primitiveType_3 = this.umlContext.getPrimitiveType(this.INTEGER);
        boolean _equals_2 = Objects.equal(op1Type, _primitiveType_3);
        /* op1Type == INTEGER.primitiveType */
        if (!_equals_2) {
          sneakyThrowRuleFailedException("op1Type == INTEGER.primitiveType");
        }
        Type _primitiveType_4 = this.umlContext.getPrimitiveType(this.INTEGER);
        boolean _equals_3 = Objects.equal(op2Type, _primitiveType_4);
        /* op2Type == INTEGER.primitiveType */
        if (!_equals_3) {
          sneakyThrowRuleFailedException("op2Type == INTEGER.primitiveType");
        }
        Type _primitiveType_5 = this.umlContext.getPrimitiveType(this.INTEGER);
        result = _primitiveType_5;
      }
    }
    return new Result<Type>(result);
  }
  
  protected Result<Type> typeImpl(final RuleEnvironment G, final RuleApplicationTrace _trace_, final ConditionalLogicalExpression ex) throws RuleFailedException {
    try {
    	final RuleApplicationTrace _subtrace_ = newTrace(_trace_);
    	final Result<Type> _result_ = applyRuleConditionalLogicalExpression(G, _subtrace_, ex);
    	addToTrace(_trace_, new Provider<Object>() {
    		public Object get() {
    			return ruleName("ConditionalLogicalExpression") + stringRepForEnv(G) + " |- " + stringRep(ex) + " : " + stringRep(_result_.getFirst());
    		}
    	});
    	addAsSubtrace(_trace_, _subtrace_);
    	return _result_;
    } catch (Exception e_applyRuleConditionalLogicalExpression) {
    	typeThrowException(ruleName("ConditionalLogicalExpression") + stringRepForEnv(G) + " |- " + stringRep(ex) + " : " + "Type",
    		CONDITIONALLOGICALEXPRESSION,
    		e_applyRuleConditionalLogicalExpression, ex, new ErrorInformation[] {new ErrorInformation(ex)});
    	return null;
    }
  }
  
  protected Result<Type> applyRuleConditionalLogicalExpression(final RuleEnvironment G, final RuleApplicationTrace _trace_, final ConditionalLogicalExpression ex) throws RuleFailedException {
    Type result = null; // output parameter
    /* G |- ex.operand1 : var Type op1Type */
    Expression _operand1 = ex.getOperand1();
    Type op1Type = null;
    Result<Type> result_1 = typeInternal(G, _trace_, _operand1);
    checkAssignableTo(result_1.getFirst(), Type.class);
    op1Type = (Type) result_1.getFirst();
    
    /* G |- ex.operand2 : var Type op2Type */
    Expression _operand2 = ex.getOperand2();
    Type op2Type = null;
    Result<Type> result_2 = typeInternal(G, _trace_, _operand2);
    checkAssignableTo(result_2.getFirst(), Type.class);
    op2Type = (Type) result_2.getFirst();
    
    Type _primitiveType = this.umlContext.getPrimitiveType(this.BOOLEAN);
    boolean _equals = Objects.equal(op1Type, _primitiveType);
    /* op1Type == BOOLEAN.primitiveType */
    if (!_equals) {
      sneakyThrowRuleFailedException("op1Type == BOOLEAN.primitiveType");
    }
    Type _primitiveType_1 = this.umlContext.getPrimitiveType(this.BOOLEAN);
    boolean _equals_1 = Objects.equal(op2Type, _primitiveType_1);
    /* op2Type == BOOLEAN.primitiveType */
    if (!_equals_1) {
      sneakyThrowRuleFailedException("op2Type == BOOLEAN.primitiveType");
    }
    Type _primitiveType_2 = this.umlContext.getPrimitiveType(this.BOOLEAN);
    result = _primitiveType_2;
    return new Result<Type>(result);
  }
  
  protected Result<Type> typeImpl(final RuleEnvironment G, final RuleApplicationTrace _trace_, final ConditionalTestExpression ex) throws RuleFailedException {
    try {
    	final RuleApplicationTrace _subtrace_ = newTrace(_trace_);
    	final Result<Type> _result_ = applyRuleConditionalTestExpression(G, _subtrace_, ex);
    	addToTrace(_trace_, new Provider<Object>() {
    		public Object get() {
    			return ruleName("ConditionalTestExpression") + stringRepForEnv(G) + " |- " + stringRep(ex) + " : " + stringRep(_result_.getFirst());
    		}
    	});
    	addAsSubtrace(_trace_, _subtrace_);
    	return _result_;
    } catch (Exception e_applyRuleConditionalTestExpression) {
    	typeThrowException(ruleName("ConditionalTestExpression") + stringRepForEnv(G) + " |- " + stringRep(ex) + " : " + "Type",
    		CONDITIONALTESTEXPRESSION,
    		e_applyRuleConditionalTestExpression, ex, new ErrorInformation[] {new ErrorInformation(ex)});
    	return null;
    }
  }
  
  protected Result<Type> applyRuleConditionalTestExpression(final RuleEnvironment G, final RuleApplicationTrace _trace_, final ConditionalTestExpression ex) throws RuleFailedException {
    Type result = null; // output parameter
    /* G |- ex.operand1 : var Type condType */
    Expression _operand1 = ex.getOperand1();
    Type condType = null;
    Result<Type> result_1 = typeInternal(G, _trace_, _operand1);
    checkAssignableTo(result_1.getFirst(), Type.class);
    condType = (Type) result_1.getFirst();
    
    /* G |- ex.operand2 : var Type trueType */
    Expression _operand2 = ex.getOperand2();
    Type trueType = null;
    Result<Type> result_2 = typeInternal(G, _trace_, _operand2);
    checkAssignableTo(result_2.getFirst(), Type.class);
    trueType = (Type) result_2.getFirst();
    
    /* G |- ex.operand3 : var Type falseType */
    Expression _operand3 = ex.getOperand3();
    Type falseType = null;
    Result<Type> result_3 = typeInternal(G, _trace_, _operand3);
    checkAssignableTo(result_3.getFirst(), Type.class);
    falseType = (Type) result_3.getFirst();
    
    Type _primitiveType = this.umlContext.getPrimitiveType(this.BOOLEAN);
    boolean _equals = Objects.equal(condType, _primitiveType);
    /* condType == BOOLEAN.primitiveType */
    if (!_equals) {
      sneakyThrowRuleFailedException("condType == BOOLEAN.primitiveType");
    }
    boolean _equals_1 = Objects.equal(trueType, falseType);
    /* trueType == falseType */
    if (!_equals_1) {
      sneakyThrowRuleFailedException("trueType == falseType");
    }
    result = trueType;
    return new Result<Type>(result);
  }
  
  protected Result<Type> typeImpl(final RuleEnvironment G, final RuleApplicationTrace _trace_, final FeatureLeftHandSide lhs) throws RuleFailedException {
    try {
    	final RuleApplicationTrace _subtrace_ = newTrace(_trace_);
    	final Result<Type> _result_ = applyRuleFeatureLeftHandSide(G, _subtrace_, lhs);
    	addToTrace(_trace_, new Provider<Object>() {
    		public Object get() {
    			return ruleName("FeatureLeftHandSide") + stringRepForEnv(G) + " |- " + stringRep(lhs) + " : " + stringRep(_result_.getFirst());
    		}
    	});
    	addAsSubtrace(_trace_, _subtrace_);
    	return _result_;
    } catch (Exception e_applyRuleFeatureLeftHandSide) {
    	typeThrowException(ruleName("FeatureLeftHandSide") + stringRepForEnv(G) + " |- " + stringRep(lhs) + " : " + "Type",
    		FEATURELEFTHANDSIDE,
    		e_applyRuleFeatureLeftHandSide, lhs, new ErrorInformation[] {new ErrorInformation(lhs)});
    	return null;
    }
  }
  
  protected Result<Type> applyRuleFeatureLeftHandSide(final RuleEnvironment G, final RuleApplicationTrace _trace_, final FeatureLeftHandSide lhs) throws RuleFailedException {
    Type result = null; // output parameter
    /* G |- lhs.expression : var Type exType */
    Expression _expression = lhs.getExpression();
    Type exType = null;
    Result<Type> result_1 = typeInternal(G, _trace_, _expression);
    checkAssignableTo(result_1.getFirst(), Type.class);
    exType = (Type) result_1.getFirst();
    
    result = exType;
    return new Result<Type>(result);
  }
  
  protected Result<Type> typeImpl(final RuleEnvironment G, final RuleApplicationTrace _trace_, final NameLeftHandSide lhs) throws RuleFailedException {
    try {
    	final RuleApplicationTrace _subtrace_ = newTrace(_trace_);
    	final Result<Type> _result_ = applyRuleNameLeftHandSide(G, _subtrace_, lhs);
    	addToTrace(_trace_, new Provider<Object>() {
    		public Object get() {
    			return ruleName("NameLeftHandSide") + stringRepForEnv(G) + " |- " + stringRep(lhs) + " : " + stringRep(_result_.getFirst());
    		}
    	});
    	addAsSubtrace(_trace_, _subtrace_);
    	return _result_;
    } catch (Exception e_applyRuleNameLeftHandSide) {
    	typeThrowException(ruleName("NameLeftHandSide") + stringRepForEnv(G) + " |- " + stringRep(lhs) + " : " + "Type",
    		NAMELEFTHANDSIDE,
    		e_applyRuleNameLeftHandSide, lhs, new ErrorInformation[] {new ErrorInformation(lhs)});
    	return null;
    }
  }
  
  protected Result<Type> applyRuleNameLeftHandSide(final RuleEnvironment G, final RuleApplicationTrace _trace_, final NameLeftHandSide lhs) throws RuleFailedException {
    Type result = null; // output parameter
    /* { lhs.index == null G |- lhs.target : var Type varType result = varType } or { } */
    {
      RuleFailedException previousFailure = null;
      try {
        Expression _index = lhs.getIndex();
        boolean _equals = Objects.equal(_index, null);
        /* lhs.index == null */
        if (!_equals) {
          sneakyThrowRuleFailedException("lhs.index == null");
        }
        /* G |- lhs.target : var Type varType */
        Variable _target = lhs.getTarget();
        Type varType = null;
        Result<Type> result_1 = typeInternal(G, _trace_, _target);
        checkAssignableTo(result_1.getFirst(), Type.class);
        varType = (Type) result_1.getFirst();
        
        result = varType;
      } catch (Exception e) {
        previousFailure = extractRuleFailedException(e);
      }
    }
    return new Result<Type>(result);
  }
}