package com.incquerylabs.uml.ralf;

import com.google.common.base.Objects;
import com.google.inject.Inject;
import com.google.inject.Provider;
import com.incquerylabs.uml.ralf.reducedAlfLanguage.ArithmeticExpression;
import com.incquerylabs.uml.ralf.reducedAlfLanguage.AssignmentExpression;
import com.incquerylabs.uml.ralf.reducedAlfLanguage.AssociationAccessExpression;
import com.incquerylabs.uml.ralf.reducedAlfLanguage.BooleanLiteralExpression;
import com.incquerylabs.uml.ralf.reducedAlfLanguage.BooleanUnaryExpression;
import com.incquerylabs.uml.ralf.reducedAlfLanguage.CollectionType;
import com.incquerylabs.uml.ralf.reducedAlfLanguage.ConditionalLogicalExpression;
import com.incquerylabs.uml.ralf.reducedAlfLanguage.ConditionalTestExpression;
import com.incquerylabs.uml.ralf.reducedAlfLanguage.DoStatement;
import com.incquerylabs.uml.ralf.reducedAlfLanguage.ElementCollectionExpression;
import com.incquerylabs.uml.ralf.reducedAlfLanguage.EqualityExpression;
import com.incquerylabs.uml.ralf.reducedAlfLanguage.Expression;
import com.incquerylabs.uml.ralf.reducedAlfLanguage.ExpressionList;
import com.incquerylabs.uml.ralf.reducedAlfLanguage.FeatureInvocationExpression;
import com.incquerylabs.uml.ralf.reducedAlfLanguage.FeatureLeftHandSide;
import com.incquerylabs.uml.ralf.reducedAlfLanguage.FilterExpression;
import com.incquerylabs.uml.ralf.reducedAlfLanguage.FilterVariable;
import com.incquerylabs.uml.ralf.reducedAlfLanguage.ForEachStatement;
import com.incquerylabs.uml.ralf.reducedAlfLanguage.ForStatement;
import com.incquerylabs.uml.ralf.reducedAlfLanguage.InstanceCreationExpression;
import com.incquerylabs.uml.ralf.reducedAlfLanguage.InstanceDeletionExpression;
import com.incquerylabs.uml.ralf.reducedAlfLanguage.LeftHandSide;
import com.incquerylabs.uml.ralf.reducedAlfLanguage.LinkOperation;
import com.incquerylabs.uml.ralf.reducedAlfLanguage.LinkOperationExpression;
import com.incquerylabs.uml.ralf.reducedAlfLanguage.LocalNameDeclarationStatement;
import com.incquerylabs.uml.ralf.reducedAlfLanguage.LogicalExpression;
import com.incquerylabs.uml.ralf.reducedAlfLanguage.LoopVariable;
import com.incquerylabs.uml.ralf.reducedAlfLanguage.NameExpression;
import com.incquerylabs.uml.ralf.reducedAlfLanguage.NameLeftHandSide;
import com.incquerylabs.uml.ralf.reducedAlfLanguage.NamedTuple;
import com.incquerylabs.uml.ralf.reducedAlfLanguage.NaturalLiteralExpression;
import com.incquerylabs.uml.ralf.reducedAlfLanguage.NonFinalClause;
import com.incquerylabs.uml.ralf.reducedAlfLanguage.NullExpression;
import com.incquerylabs.uml.ralf.reducedAlfLanguage.NumericUnaryExpression;
import com.incquerylabs.uml.ralf.reducedAlfLanguage.PostfixExpression;
import com.incquerylabs.uml.ralf.reducedAlfLanguage.PrefixExpression;
import com.incquerylabs.uml.ralf.reducedAlfLanguage.PropertyAccessExpression;
import com.incquerylabs.uml.ralf.reducedAlfLanguage.RealLiteralExpression;
import com.incquerylabs.uml.ralf.reducedAlfLanguage.RelationalExpression;
import com.incquerylabs.uml.ralf.reducedAlfLanguage.ReturnStatement;
import com.incquerylabs.uml.ralf.reducedAlfLanguage.SendSignalStatement;
import com.incquerylabs.uml.ralf.reducedAlfLanguage.ShiftExpression;
import com.incquerylabs.uml.ralf.reducedAlfLanguage.StaticFeatureInvocationExpression;
import com.incquerylabs.uml.ralf.reducedAlfLanguage.StringLiteralExpression;
import com.incquerylabs.uml.ralf.reducedAlfLanguage.SwitchClause;
import com.incquerylabs.uml.ralf.reducedAlfLanguage.SwitchStatement;
import com.incquerylabs.uml.ralf.reducedAlfLanguage.ThisExpression;
import com.incquerylabs.uml.ralf.reducedAlfLanguage.Tuple;
import com.incquerylabs.uml.ralf.reducedAlfLanguage.TypeDeclaration;
import com.incquerylabs.uml.ralf.reducedAlfLanguage.Variable;
import com.incquerylabs.uml.ralf.reducedAlfLanguage.WhileStatement;
import com.incquerylabs.uml.ralf.scoping.IUMLContextProvider;
import com.incquerylabs.uml.ralf.scoping.UMLScopeHelper;
import com.incquerylabs.uml.ralf.types.AbstractTypeReference;
import com.incquerylabs.uml.ralf.types.CollectionTypeReference;
import com.incquerylabs.uml.ralf.types.IUMLTypeReference;
import com.incquerylabs.uml.ralf.types.PrimitiveTypeReference;
import com.incquerylabs.uml.ralf.types.TypeFactory;
import com.incquerylabs.uml.ralf.types.UMLTypeReference;
import it.xsemantics.runtime.ErrorInformation;
import it.xsemantics.runtime.Result;
import it.xsemantics.runtime.RuleApplicationTrace;
import it.xsemantics.runtime.RuleEnvironment;
import it.xsemantics.runtime.RuleFailedException;
import it.xsemantics.runtime.XsemanticsRuntimeSystem;
import java.util.List;
import org.eclipse.emf.common.util.EList;
import org.eclipse.emf.ecore.EObject;
import org.eclipse.uml2.uml.Association;
import org.eclipse.uml2.uml.Classifier;
import org.eclipse.uml2.uml.NamedElement;
import org.eclipse.uml2.uml.Operation;
import org.eclipse.uml2.uml.Parameter;
import org.eclipse.uml2.uml.PrimitiveType;
import org.eclipse.uml2.uml.Property;
import org.eclipse.uml2.uml.Signal;
import org.eclipse.uml2.uml.Type;
import org.eclipse.xtext.util.PolymorphicDispatcher;
import org.eclipse.xtext.xbase.lib.Extension;

@SuppressWarnings("all")
public class ReducedAlfSystem extends XsemanticsRuntimeSystem {
  public final static String SUPERCLASSLIST = "com.incquerylabs.uml.ralf.SuperClassList";
  
  public final static String TYPEREFERENCE = "com.incquerylabs.uml.ralf.TypeReference";
  
  public final static String BOOLEANLITERAL = "com.incquerylabs.uml.ralf.BooleanLiteral";
  
  public final static String NATURALLITERAL = "com.incquerylabs.uml.ralf.NaturalLiteral";
  
  public final static String REALLITERAL = "com.incquerylabs.uml.ralf.RealLiteral";
  
  public final static String STRINGLITERAL = "com.incquerylabs.uml.ralf.StringLiteral";
  
  public final static String NULLLITERAL = "com.incquerylabs.uml.ralf.NullLiteral";
  
  public final static String TYPEDECLARATION = "com.incquerylabs.uml.ralf.TypeDeclaration";
  
  public final static String VARIABLEDECLARATION = "com.incquerylabs.uml.ralf.VariableDeclaration";
  
  public final static String LOOPVARIABLE = "com.incquerylabs.uml.ralf.LoopVariable";
  
  public final static String FILTERVARIABLE = "com.incquerylabs.uml.ralf.FilterVariable";
  
  public final static String PARAMETER = "com.incquerylabs.uml.ralf.Parameter";
  
  public final static String TYPE = "com.incquerylabs.uml.ralf.Type";
  
  public final static String NULLSUBTYPING = "com.incquerylabs.uml.ralf.NullSubtyping";
  
  public final static String ANYSUBTYPING = "com.incquerylabs.uml.ralf.AnySubtyping";
  
  public final static String GENERALREFERENCESUBTYPING = "com.incquerylabs.uml.ralf.GeneralReferenceSubtyping";
  
  public final static String SIMPLETYPEREFERENCESUBTYPING = "com.incquerylabs.uml.ralf.SimpleTypeReferenceSubtyping";
  
  public final static String COLLECTIONSUBTYPING = "com.incquerylabs.uml.ralf.CollectionSubtyping";
  
  public final static String GENERALSUBTYPING = "com.incquerylabs.uml.ralf.GeneralSubtyping";
  
  public final static String PRIMITIVESUBTYPING = "com.incquerylabs.uml.ralf.PrimitiveSubtyping";
  
  public final static String EQUALSCLASSIFIERSUBTYPING = "com.incquerylabs.uml.ralf.EqualsClassifierSubtyping";
  
  public final static String CLASSSUBTYPING = "com.incquerylabs.uml.ralf.ClassSubtyping";
  
  public final static String EXPRESSIONASSIGNABLETOTYPE = "com.incquerylabs.uml.ralf.ExpressionAssignableToType";
  
  public final static String OPERATIONTYPING = "com.incquerylabs.uml.ralf.OperationTyping";
  
  public final static String PARAMETERLISTTYPING = "com.incquerylabs.uml.ralf.ParameterListTyping";
  
  public final static String NAMEDTUPLETYPING = "com.incquerylabs.uml.ralf.NamedTupleTyping";
  
  public final static String NUMERICUNARYEXPRESSION = "com.incquerylabs.uml.ralf.NumericUnaryExpression";
  
  public final static String ARITHMETICEXPRESSION = "com.incquerylabs.uml.ralf.ArithmeticExpression";
  
  public final static String NAMEEXPRESSION = "com.incquerylabs.uml.ralf.NameExpression";
  
  public final static String FILTEREXPRESSION = "com.incquerylabs.uml.ralf.FilterExpression";
  
  public final static String ASSIGNMENTEXPRESSION = "com.incquerylabs.uml.ralf.AssignmentExpression";
  
  public final static String PREFIXEXPRESSION = "com.incquerylabs.uml.ralf.PrefixExpression";
  
  public final static String POSTFIXEXPRESSION = "com.incquerylabs.uml.ralf.PostfixExpression";
  
  public final static String SHIFTEXPRESSION = "com.incquerylabs.uml.ralf.ShiftExpression";
  
  public final static String EQUALITYEXPRESSION = "com.incquerylabs.uml.ralf.EqualityExpression";
  
  public final static String RELATIONALEXPRESSION = "com.incquerylabs.uml.ralf.RelationalExpression";
  
  public final static String LOGICALUNARYEXPRESSION = "com.incquerylabs.uml.ralf.LogicalUnaryExpression";
  
  public final static String LOGICALEXPRESSION = "com.incquerylabs.uml.ralf.LogicalExpression";
  
  public final static String CONDITIONALLOGICALEXPRESSION = "com.incquerylabs.uml.ralf.ConditionalLogicalExpression";
  
  public final static String CONDITIONALTESTEXPRESSION = "com.incquerylabs.uml.ralf.ConditionalTestExpression";
  
  public final static String INSTANCECREATIONEXPRESSION = "com.incquerylabs.uml.ralf.InstanceCreationExpression";
  
  public final static String INSTANCEDELETIONEXPRESSION = "com.incquerylabs.uml.ralf.InstanceDeletionExpression";
  
  public final static String THISEXPRESSION = "com.incquerylabs.uml.ralf.ThisExpression";
  
  public final static String PROPERTYACCESSEXPRESSION = "com.incquerylabs.uml.ralf.PropertyAccessExpression";
  
  public final static String ASSOCIATIONACCESSEXPRESSION = "com.incquerylabs.uml.ralf.AssociationAccessExpression";
  
  public final static String LINKOPERATIONEXPRESSION = "com.incquerylabs.uml.ralf.LinkOperationExpression";
  
  public final static String COLLECTIONCONSTRUCTIONEXPRESSION = "com.incquerylabs.uml.ralf.CollectionConstructionExpression";
  
  public final static String FEATUREINVOCATIONEXPRESSION = "com.incquerylabs.uml.ralf.FeatureInvocationExpression";
  
  public final static String STATICFEATUREINVOCATIONEXPRESSION = "com.incquerylabs.uml.ralf.StaticFeatureInvocationExpression";
  
  public final static String OPERATION = "com.incquerylabs.uml.ralf.Operation";
  
  public final static String FEATURELEFTHANDSIDE = "com.incquerylabs.uml.ralf.FeatureLeftHandSide";
  
  public final static String NAMELEFTHANDSIDE = "com.incquerylabs.uml.ralf.NameLeftHandSide";
  
  @Extension
  @Inject
  private IUMLContextProvider umlContext;
  
  @Extension
  @Inject
  private TypeFactory typeFactory;
  
  @Extension
  @Inject
  private UMLScopeHelper scopeHelper;
  
  private final String REAL = IUMLContextProvider.REAL_TYPE;
  
  private final String INTEGER = IUMLContextProvider.INTEGER_TYPE;
  
  private final String BOOLEAN = IUMLContextProvider.BOOLEAN_TYPE;
  
  private final String STRING = IUMLContextProvider.STRING_TYPE;
  
  private PolymorphicDispatcher<List<org.eclipse.uml2.uml.Class>> superClassListDispatcher;
  
  private PolymorphicDispatcher<IUMLTypeReference> typeReferenceDispatcher;
  
  private PolymorphicDispatcher<Result<IUMLTypeReference>> typeDispatcher;
  
  private PolymorphicDispatcher<Result<IUMLTypeReference>> operationTypeDispatcher;
  
  private PolymorphicDispatcher<Result<Boolean>> subtypeReferenceDispatcher;
  
  private PolymorphicDispatcher<Result<Boolean>> subtypeOrEqualDispatcher;
  
  private PolymorphicDispatcher<Result<Boolean>> assignableDispatcher;
  
  public ReducedAlfSystem() {
    init();
  }
  
  public void init() {
    typeDispatcher = buildPolymorphicDispatcher1(
    	"typeImpl", 3, "|-", ":");
    operationTypeDispatcher = buildPolymorphicDispatcher1(
    	"operationTypeImpl", 4, "|-", "<:", ":");
    subtypeReferenceDispatcher = buildPolymorphicDispatcher1(
    	"subtypeReferenceImpl", 4, "|-", "<:");
    subtypeOrEqualDispatcher = buildPolymorphicDispatcher1(
    	"subtypeOrEqualImpl", 4, "|-", "<~");
    assignableDispatcher = buildPolymorphicDispatcher1(
    	"assignableImpl", 4, "|-", "|>");
    superClassListDispatcher = buildPolymorphicDispatcher(
    	"superClassListImpl", 2);
    typeReferenceDispatcher = buildPolymorphicDispatcher(
    	"typeReferenceImpl", 2);
  }
  
  public IUMLContextProvider getUmlContext() {
    return this.umlContext;
  }
  
  public void setUmlContext(final IUMLContextProvider umlContext) {
    this.umlContext = umlContext;
  }
  
  public TypeFactory getTypeFactory() {
    return this.typeFactory;
  }
  
  public void setTypeFactory(final TypeFactory typeFactory) {
    this.typeFactory = typeFactory;
  }
  
  public UMLScopeHelper getScopeHelper() {
    return this.scopeHelper;
  }
  
  public void setScopeHelper(final UMLScopeHelper scopeHelper) {
    this.scopeHelper = scopeHelper;
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
  
  public List<org.eclipse.uml2.uml.Class> superClassList(final org.eclipse.uml2.uml.Class cl) throws RuleFailedException {
    return superClassList(null, cl);
  }
  
  public List<org.eclipse.uml2.uml.Class> superClassList(final RuleApplicationTrace _trace_, final org.eclipse.uml2.uml.Class cl) throws RuleFailedException {
    try {
    	return superClassListInternal(_trace_, cl);
    } catch (Exception _e_superClassList) {
    	throw extractRuleFailedException(_e_superClassList);
    }
  }
  
  public IUMLTypeReference typeReference(final TypeDeclaration decl) throws RuleFailedException {
    return typeReference(null, decl);
  }
  
  public IUMLTypeReference typeReference(final RuleApplicationTrace _trace_, final TypeDeclaration decl) throws RuleFailedException {
    try {
    	return typeReferenceInternal(_trace_, decl);
    } catch (Exception _e_typeReference) {
    	throw extractRuleFailedException(_e_typeReference);
    }
  }
  
  public Result<IUMLTypeReference> type(final EObject expression) {
    return type(new RuleEnvironment(), null, expression);
  }
  
  public Result<IUMLTypeReference> type(final RuleEnvironment _environment_, final EObject expression) {
    return type(_environment_, null, expression);
  }
  
  public Result<IUMLTypeReference> type(final RuleEnvironment _environment_, final RuleApplicationTrace _trace_, final EObject expression) {
    try {
    	return typeInternal(_environment_, _trace_, expression);
    } catch (Exception _e_type) {
    	return resultForFailure(_e_type);
    }
  }
  
  public Result<IUMLTypeReference> operationType(final Operation op, final Tuple params) {
    return operationType(new RuleEnvironment(), null, op, params);
  }
  
  public Result<IUMLTypeReference> operationType(final RuleEnvironment _environment_, final Operation op, final Tuple params) {
    return operationType(_environment_, null, op, params);
  }
  
  public Result<IUMLTypeReference> operationType(final RuleEnvironment _environment_, final RuleApplicationTrace _trace_, final Operation op, final Tuple params) {
    try {
    	return operationTypeInternal(_environment_, _trace_, op, params);
    } catch (Exception _e_operationType) {
    	return resultForFailure(_e_operationType);
    }
  }
  
  public Result<Boolean> subtypeReference(final IUMLTypeReference left, final IUMLTypeReference right) {
    return subtypeReference(new RuleEnvironment(), null, left, right);
  }
  
  public Result<Boolean> subtypeReference(final RuleEnvironment _environment_, final IUMLTypeReference left, final IUMLTypeReference right) {
    return subtypeReference(_environment_, null, left, right);
  }
  
  public Result<Boolean> subtypeReference(final RuleEnvironment _environment_, final RuleApplicationTrace _trace_, final IUMLTypeReference left, final IUMLTypeReference right) {
    try {
    	return subtypeReferenceInternal(_environment_, _trace_, left, right);
    } catch (Exception _e_subtypeReference) {
    	return resultForFailure(_e_subtypeReference);
    }
  }
  
  public Boolean subtypeReferenceSucceeded(final IUMLTypeReference left, final IUMLTypeReference right) {
    return subtypeReferenceSucceeded(new RuleEnvironment(), null, left, right);
  }
  
  public Boolean subtypeReferenceSucceeded(final RuleEnvironment _environment_, final IUMLTypeReference left, final IUMLTypeReference right) {
    return subtypeReferenceSucceeded(_environment_, null, left, right);
  }
  
  public Boolean subtypeReferenceSucceeded(final RuleEnvironment _environment_, final RuleApplicationTrace _trace_, final IUMLTypeReference left, final IUMLTypeReference right) {
    try {
    	subtypeReferenceInternal(_environment_, _trace_, left, right);
    	return true;
    } catch (Exception _e_subtypeReference) {
    	return false;
    }
  }
  
  public Result<Boolean> subtypeOrEqual(final Type left, final Type right) {
    return subtypeOrEqual(new RuleEnvironment(), null, left, right);
  }
  
  public Result<Boolean> subtypeOrEqual(final RuleEnvironment _environment_, final Type left, final Type right) {
    return subtypeOrEqual(_environment_, null, left, right);
  }
  
  public Result<Boolean> subtypeOrEqual(final RuleEnvironment _environment_, final RuleApplicationTrace _trace_, final Type left, final Type right) {
    try {
    	return subtypeOrEqualInternal(_environment_, _trace_, left, right);
    } catch (Exception _e_subtypeOrEqual) {
    	return resultForFailure(_e_subtypeOrEqual);
    }
  }
  
  public Boolean subtypeOrEqualSucceeded(final Type left, final Type right) {
    return subtypeOrEqualSucceeded(new RuleEnvironment(), null, left, right);
  }
  
  public Boolean subtypeOrEqualSucceeded(final RuleEnvironment _environment_, final Type left, final Type right) {
    return subtypeOrEqualSucceeded(_environment_, null, left, right);
  }
  
  public Boolean subtypeOrEqualSucceeded(final RuleEnvironment _environment_, final RuleApplicationTrace _trace_, final Type left, final Type right) {
    try {
    	subtypeOrEqualInternal(_environment_, _trace_, left, right);
    	return true;
    } catch (Exception _e_subtypeOrEqual) {
    	return false;
    }
  }
  
  public Result<Boolean> assignable(final Expression expression, final IUMLTypeReference target) {
    return assignable(new RuleEnvironment(), null, expression, target);
  }
  
  public Result<Boolean> assignable(final RuleEnvironment _environment_, final Expression expression, final IUMLTypeReference target) {
    return assignable(_environment_, null, expression, target);
  }
  
  public Result<Boolean> assignable(final RuleEnvironment _environment_, final RuleApplicationTrace _trace_, final Expression expression, final IUMLTypeReference target) {
    try {
    	return assignableInternal(_environment_, _trace_, expression, target);
    } catch (Exception _e_assignable) {
    	return resultForFailure(_e_assignable);
    }
  }
  
  public Boolean assignableSucceeded(final Expression expression, final IUMLTypeReference target) {
    return assignableSucceeded(new RuleEnvironment(), null, expression, target);
  }
  
  public Boolean assignableSucceeded(final RuleEnvironment _environment_, final Expression expression, final IUMLTypeReference target) {
    return assignableSucceeded(_environment_, null, expression, target);
  }
  
  public Boolean assignableSucceeded(final RuleEnvironment _environment_, final RuleApplicationTrace _trace_, final Expression expression, final IUMLTypeReference target) {
    try {
    	assignableInternal(_environment_, _trace_, expression, target);
    	return true;
    } catch (Exception _e_assignable) {
    	return false;
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
    /* empty |- ex : var IUMLTypeReference type */
    IUMLTypeReference type = null;
    Result<IUMLTypeReference> result = typeInternal(emptyEnvironment(), _trace_, ex);
    checkAssignableTo(result.getFirst(), IUMLTypeReference.class);
    type = (IUMLTypeReference) result.getFirst();
    
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
    /* empty |- ^var : var IUMLTypeReference type */
    IUMLTypeReference type = null;
    Result<IUMLTypeReference> result = typeInternal(emptyEnvironment(), _trace_, var);
    checkAssignableTo(result.getFirst(), IUMLTypeReference.class);
    type = (IUMLTypeReference) result.getFirst();
    
    return new Result<Boolean>(true);
  }
  
  public Result<Boolean> localNameDeclarationStatementType(final LocalNameDeclarationStatement st) {
    return localNameDeclarationStatementType(null, st);
  }
  
  public Result<Boolean> localNameDeclarationStatementType(final RuleApplicationTrace _trace_, final LocalNameDeclarationStatement st) {
    try {
    	return localNameDeclarationStatementTypeInternal(_trace_, st);
    } catch (Exception _e_LocalNameDeclarationStatementType) {
    	return resultForFailure(_e_LocalNameDeclarationStatementType);
    }
  }
  
  protected Result<Boolean> localNameDeclarationStatementTypeInternal(final RuleApplicationTrace _trace_, final LocalNameDeclarationStatement st) throws RuleFailedException {
    /* empty |- st.variable : var IUMLTypeReference varType */
    Variable _variable = st.getVariable();
    IUMLTypeReference varType = null;
    Result<IUMLTypeReference> result = typeInternal(emptyEnvironment(), _trace_, _variable);
    checkAssignableTo(result.getFirst(), IUMLTypeReference.class);
    varType = (IUMLTypeReference) result.getFirst();
    
    Expression _expression = st.getExpression();
    boolean _notEquals = (!Objects.equal(_expression, null));
    if (_notEquals) {
      /* empty |- st.expression : var IUMLTypeReference valueType */
      Expression _expression_1 = st.getExpression();
      IUMLTypeReference valueType = null;
      Result<IUMLTypeReference> result_1 = typeInternal(emptyEnvironment(), _trace_, _expression_1);
      checkAssignableTo(result_1.getFirst(), IUMLTypeReference.class);
      valueType = (IUMLTypeReference) result_1.getFirst();
      
      /* empty |- varType <: valueType */
      subtypeReferenceInternal(emptyEnvironment(), _trace_, varType, valueType);
    }
    return new Result<Boolean>(true);
  }
  
  public Result<Boolean> nonFinalClause(final NonFinalClause cl) {
    return nonFinalClause(null, cl);
  }
  
  public Result<Boolean> nonFinalClause(final RuleApplicationTrace _trace_, final NonFinalClause cl) {
    try {
    	return nonFinalClauseInternal(_trace_, cl);
    } catch (Exception _e_NonFinalClause) {
    	return resultForFailure(_e_NonFinalClause);
    }
  }
  
  protected Result<Boolean> nonFinalClauseInternal(final RuleApplicationTrace _trace_, final NonFinalClause cl) throws RuleFailedException {
    /* empty |- cl.^condition : var IUMLTypeReference condType */
    Expression _condition = cl.getCondition();
    IUMLTypeReference condType = null;
    Result<IUMLTypeReference> result = typeInternal(emptyEnvironment(), _trace_, _condition);
    checkAssignableTo(result.getFirst(), IUMLTypeReference.class);
    condType = (IUMLTypeReference) result.getFirst();
    
    /* empty |- condType <: BOOLEAN.primitiveTypeReference */
    PrimitiveTypeReference _primitiveTypeReference = this.typeFactory.primitiveTypeReference(this.BOOLEAN);
    subtypeReferenceInternal(emptyEnvironment(), _trace_, condType, _primitiveTypeReference);
    return new Result<Boolean>(true);
  }
  
  public Result<Boolean> forStatement(final ForStatement st) {
    return forStatement(null, st);
  }
  
  public Result<Boolean> forStatement(final RuleApplicationTrace _trace_, final ForStatement st) {
    try {
    	return forStatementInternal(_trace_, st);
    } catch (Exception _e_ForStatement) {
    	return resultForFailure(_e_ForStatement);
    }
  }
  
  protected Result<Boolean> forStatementInternal(final RuleApplicationTrace _trace_, final ForStatement st) throws RuleFailedException {
    /* empty |- st.^condition : var IUMLTypeReference condType */
    Expression _condition = st.getCondition();
    IUMLTypeReference condType = null;
    Result<IUMLTypeReference> result = typeInternal(emptyEnvironment(), _trace_, _condition);
    checkAssignableTo(result.getFirst(), IUMLTypeReference.class);
    condType = (IUMLTypeReference) result.getFirst();
    
    /* empty |- condType <: BOOLEAN.primitiveTypeReference */
    PrimitiveTypeReference _primitiveTypeReference = this.typeFactory.primitiveTypeReference(this.BOOLEAN);
    subtypeReferenceInternal(emptyEnvironment(), _trace_, condType, _primitiveTypeReference);
    return new Result<Boolean>(true);
  }
  
  public Result<Boolean> forEachStatement(final ForEachStatement st) {
    return forEachStatement(null, st);
  }
  
  public Result<Boolean> forEachStatement(final RuleApplicationTrace _trace_, final ForEachStatement st) {
    try {
    	return forEachStatementInternal(_trace_, st);
    } catch (Exception _e_ForEachStatement) {
    	return resultForFailure(_e_ForEachStatement);
    }
  }
  
  protected Result<Boolean> forEachStatementInternal(final RuleApplicationTrace _trace_, final ForEachStatement st) throws RuleFailedException {
    /* empty |- st.expression : var IUMLTypeReference exType */
    Expression _expression = st.getExpression();
    IUMLTypeReference exType = null;
    Result<IUMLTypeReference> result = typeInternal(emptyEnvironment(), _trace_, _expression);
    checkAssignableTo(result.getFirst(), IUMLTypeReference.class);
    exType = (IUMLTypeReference) result.getFirst();
    
    /* empty |- st.variableDefinition : var IUMLTypeReference defType */
    Variable _variableDefinition = st.getVariableDefinition();
    IUMLTypeReference defType = null;
    Result<IUMLTypeReference> result_1 = typeInternal(emptyEnvironment(), _trace_, _variableDefinition);
    checkAssignableTo(result_1.getFirst(), IUMLTypeReference.class);
    defType = (IUMLTypeReference) result_1.getFirst();
    
    if ((exType instanceof CollectionTypeReference)) {
      /* empty |- exType.valueType <: defType */
      IUMLTypeReference _valueType = ((CollectionTypeReference)exType).getValueType();
      subtypeReferenceInternal(emptyEnvironment(), _trace_, _valueType, defType);
    } else {
      /* fail error "Invalid collection type " */
      String error = "Invalid collection type ";
      throwForExplicitFail(error, new ErrorInformation(null, null));
    }
    return new Result<Boolean>(true);
  }
  
  public Result<Boolean> whileStatement(final WhileStatement st) {
    return whileStatement(null, st);
  }
  
  public Result<Boolean> whileStatement(final RuleApplicationTrace _trace_, final WhileStatement st) {
    try {
    	return whileStatementInternal(_trace_, st);
    } catch (Exception _e_WhileStatement) {
    	return resultForFailure(_e_WhileStatement);
    }
  }
  
  protected Result<Boolean> whileStatementInternal(final RuleApplicationTrace _trace_, final WhileStatement st) throws RuleFailedException {
    /* empty |- st.^condition : var IUMLTypeReference condType */
    Expression _condition = st.getCondition();
    IUMLTypeReference condType = null;
    Result<IUMLTypeReference> result = typeInternal(emptyEnvironment(), _trace_, _condition);
    checkAssignableTo(result.getFirst(), IUMLTypeReference.class);
    condType = (IUMLTypeReference) result.getFirst();
    
    /* empty |- condType <: BOOLEAN.primitiveTypeReference */
    PrimitiveTypeReference _primitiveTypeReference = this.typeFactory.primitiveTypeReference(this.BOOLEAN);
    subtypeReferenceInternal(emptyEnvironment(), _trace_, condType, _primitiveTypeReference);
    return new Result<Boolean>(true);
  }
  
  public Result<Boolean> doStatement(final DoStatement st) {
    return doStatement(null, st);
  }
  
  public Result<Boolean> doStatement(final RuleApplicationTrace _trace_, final DoStatement st) {
    try {
    	return doStatementInternal(_trace_, st);
    } catch (Exception _e_DoStatement) {
    	return resultForFailure(_e_DoStatement);
    }
  }
  
  protected Result<Boolean> doStatementInternal(final RuleApplicationTrace _trace_, final DoStatement st) throws RuleFailedException {
    /* empty |- st.^condition : var IUMLTypeReference condType */
    Expression _condition = st.getCondition();
    IUMLTypeReference condType = null;
    Result<IUMLTypeReference> result = typeInternal(emptyEnvironment(), _trace_, _condition);
    checkAssignableTo(result.getFirst(), IUMLTypeReference.class);
    condType = (IUMLTypeReference) result.getFirst();
    
    /* empty |- condType <: BOOLEAN.primitiveTypeReference */
    PrimitiveTypeReference _primitiveTypeReference = this.typeFactory.primitiveTypeReference(this.BOOLEAN);
    subtypeReferenceInternal(emptyEnvironment(), _trace_, condType, _primitiveTypeReference);
    return new Result<Boolean>(true);
  }
  
  public Result<Boolean> switchStatement_(final SwitchStatement st) {
    return switchStatement_(null, st);
  }
  
  public Result<Boolean> switchStatement_(final RuleApplicationTrace _trace_, final SwitchStatement st) {
    try {
    	return switchStatement_Internal(_trace_, st);
    } catch (Exception _e_SwitchStatement_) {
    	return resultForFailure(_e_SwitchStatement_);
    }
  }
  
  protected Result<Boolean> switchStatement_Internal(final RuleApplicationTrace _trace_, final SwitchStatement st) throws RuleFailedException {
    /* empty |- st.expression : var IUMLTypeReference eType */
    Expression _expression = st.getExpression();
    IUMLTypeReference eType = null;
    Result<IUMLTypeReference> result = typeInternal(emptyEnvironment(), _trace_, _expression);
    checkAssignableTo(result.getFirst(), IUMLTypeReference.class);
    eType = (IUMLTypeReference) result.getFirst();
    
    /* { INTEGER.primitiveTypeReference == eType } or { STRING.primitiveTypeReference == eType } */
    {
      RuleFailedException previousFailure = null;
      try {
        PrimitiveTypeReference _primitiveTypeReference = this.typeFactory.primitiveTypeReference(this.INTEGER);
        /* INTEGER.primitiveTypeReference == eType */
        if (!Objects.equal(_primitiveTypeReference, eType)) {
          sneakyThrowRuleFailedException("INTEGER.primitiveTypeReference == eType");
        }
      } catch (Exception e) {
        previousFailure = extractRuleFailedException(e);
        PrimitiveTypeReference _primitiveTypeReference_1 = this.typeFactory.primitiveTypeReference(this.STRING);
        /* STRING.primitiveTypeReference == eType */
        if (!Objects.equal(_primitiveTypeReference_1, eType)) {
          sneakyThrowRuleFailedException("STRING.primitiveTypeReference == eType");
        }
      }
    }
    EList<SwitchClause> _nonDefaultClause = st.getNonDefaultClause();
    for (final SwitchClause cl : _nonDefaultClause) {
      EList<Expression> _case = cl.getCase();
      for (final Expression ex : _case) {
        /* empty |- ex : var IUMLTypeReference caseType */
        IUMLTypeReference caseType = null;
        Result<IUMLTypeReference> result_1 = typeInternal(emptyEnvironment(), _trace_, ex);
        checkAssignableTo(result_1.getFirst(), IUMLTypeReference.class);
        caseType = (IUMLTypeReference) result_1.getFirst();
        
        /* empty |- st.expression |> caseType */
        Expression _expression_1 = st.getExpression();
        assignableInternal(emptyEnvironment(), _trace_, _expression_1, caseType);
      }
    }
    return new Result<Boolean>(true);
  }
  
  public Result<Boolean> sendSignalStatement(final SendSignalStatement st) {
    return sendSignalStatement(null, st);
  }
  
  public Result<Boolean> sendSignalStatement(final RuleApplicationTrace _trace_, final SendSignalStatement st) {
    try {
    	return sendSignalStatementInternal(_trace_, st);
    } catch (Exception _e_SendSignalStatement) {
    	return resultForFailure(_e_SendSignalStatement);
    }
  }
  
  protected Result<Boolean> sendSignalStatementInternal(final RuleApplicationTrace _trace_, final SendSignalStatement st) throws RuleFailedException {
    /* empty |- st.signal : var UMLTypeReference signalType */
    Expression _signal = st.getSignal();
    UMLTypeReference signalType = null;
    Result<IUMLTypeReference> result = typeInternal(emptyEnvironment(), _trace_, _signal);
    checkAssignableTo(result.getFirst(), UMLTypeReference.class);
    signalType = (UMLTypeReference) result.getFirst();
    
    /* empty |- st.target : var UMLTypeReference targetType */
    Expression _target = st.getTarget();
    UMLTypeReference targetType = null;
    Result<IUMLTypeReference> result_1 = typeInternal(emptyEnvironment(), _trace_, _target);
    checkAssignableTo(result_1.getFirst(), UMLTypeReference.class);
    targetType = (UMLTypeReference) result_1.getFirst();
    
    Type _umlType = signalType.getUmlType();
    if ((!(_umlType instanceof Signal))) {
      /* fail error "Invalid signal type " + signalType.umlType.name */
      Type _umlType_1 = signalType.getUmlType();
      String _name = _umlType_1.getName();
      String _plus = ("Invalid signal type " + _name);
      String error = _plus;
      throwForExplicitFail(error, new ErrorInformation(null, null));
    }
    Type _umlType_2 = targetType.getUmlType();
    if ((!(_umlType_2 instanceof org.eclipse.uml2.uml.Class))) {
      /* fail error "Invalid signal target " + targetType.umlType.name */
      Type _umlType_3 = targetType.getUmlType();
      String _name_1 = _umlType_3.getName();
      String _plus_1 = ("Invalid signal target " + _name_1);
      String error_1 = _plus_1;
      throwForExplicitFail(error_1, new ErrorInformation(null, null));
    }
    return new Result<Boolean>(true);
  }
  
  public Result<Boolean> returnStatement(final ReturnStatement st) {
    return returnStatement(null, st);
  }
  
  public Result<Boolean> returnStatement(final RuleApplicationTrace _trace_, final ReturnStatement st) {
    try {
    	return returnStatementInternal(_trace_, st);
    } catch (Exception _e_ReturnStatement) {
    	return resultForFailure(_e_ReturnStatement);
    }
  }
  
  protected Result<Boolean> returnStatementInternal(final RuleApplicationTrace _trace_, final ReturnStatement st) throws RuleFailedException {
    Operation _definedOperation = this.umlContext.getDefinedOperation();
    final Parameter returnValue = this.scopeHelper.getReturnParameter(_definedOperation);
    /* { returnValue == null st.expression == null } or { returnValue != null st.expression != null empty |- st.expression : var IUMLTypeReference exprType val returnType = returnValue.type.typeReference empty |- returnType <: exprType } or { returnValue == null st.expression != null fail error "Unexpected return value " + st.expression.stringRep source st.expression } */
    {
      RuleFailedException previousFailure = null;
      try {
        boolean _equals = Objects.equal(returnValue, null);
        /* returnValue == null */
        if (!_equals) {
          sneakyThrowRuleFailedException("returnValue == null");
        }
        Expression _expression = st.getExpression();
        /* st.expression == null */
        if (!Objects.equal(_expression, null)) {
          sneakyThrowRuleFailedException("st.expression == null");
        }
      } catch (Exception e) {
        previousFailure = extractRuleFailedException(e);
        /* { returnValue != null st.expression != null empty |- st.expression : var IUMLTypeReference exprType val returnType = returnValue.type.typeReference empty |- returnType <: exprType } or { returnValue == null st.expression != null fail error "Unexpected return value " + st.expression.stringRep source st.expression } */
        {
          try {
            boolean _notEquals = (!Objects.equal(returnValue, null));
            /* returnValue != null */
            if (!_notEquals) {
              sneakyThrowRuleFailedException("returnValue != null");
            }
            Expression _expression_1 = st.getExpression();
            boolean _notEquals_1 = (!Objects.equal(_expression_1, null));
            /* st.expression != null */
            if (!_notEquals_1) {
              sneakyThrowRuleFailedException("st.expression != null");
            }
            /* empty |- st.expression : var IUMLTypeReference exprType */
            Expression _expression_2 = st.getExpression();
            IUMLTypeReference exprType = null;
            Result<IUMLTypeReference> result = typeInternal(emptyEnvironment(), _trace_, _expression_2);
            checkAssignableTo(result.getFirst(), IUMLTypeReference.class);
            exprType = (IUMLTypeReference) result.getFirst();
            
            Type _type = returnValue.getType();
            final IUMLTypeReference returnType = this.typeFactory.typeReference(_type);
            /* empty |- returnType <: exprType */
            subtypeReferenceInternal(emptyEnvironment(), _trace_, returnType, exprType);
          } catch (Exception e_1) {
            previousFailure = extractRuleFailedException(e_1);
            boolean _equals_1 = Objects.equal(returnValue, null);
            /* returnValue == null */
            if (!_equals_1) {
              sneakyThrowRuleFailedException("returnValue == null");
            }
            Expression _expression_3 = st.getExpression();
            boolean _notEquals_2 = (!Objects.equal(_expression_3, null));
            /* st.expression != null */
            if (!_notEquals_2) {
              sneakyThrowRuleFailedException("st.expression != null");
            }
            /* fail error "Unexpected return value " + st.expression.stringRep source st.expression */
            Expression _expression_4 = st.getExpression();
            String _stringRep = this.stringRep(_expression_4);
            String _plus = ("Unexpected return value " + _stringRep);
            String error = _plus;
            Expression _expression_5 = st.getExpression();
            EObject source = _expression_5;
            throwForExplicitFail(error, new ErrorInformation(source, null));
          }
        }
      }
    }
    return new Result<Boolean>(true);
  }
  
  public Result<Boolean> operationParameters(final FeatureInvocationExpression ex) {
    return operationParameters(null, ex);
  }
  
  public Result<Boolean> operationParameters(final RuleApplicationTrace _trace_, final FeatureInvocationExpression ex) {
    try {
    	return operationParametersInternal(_trace_, ex);
    } catch (Exception _e_OperationParameters) {
    	return resultForFailure(_e_OperationParameters);
    }
  }
  
  protected Result<Boolean> operationParametersInternal(final RuleApplicationTrace _trace_, final FeatureInvocationExpression ex) throws RuleFailedException {
    return new Result<Boolean>(true);
  }
  
  protected List<org.eclipse.uml2.uml.Class> superClassListInternal(final RuleApplicationTrace _trace_, final org.eclipse.uml2.uml.Class cl) {
    try {
    	checkParamsNotNull(cl);
    	return superClassListDispatcher.invoke(_trace_, cl);
    } catch (Exception _e_superClassList) {
    	sneakyThrowRuleFailedException(_e_superClassList);
    	return null;
    }
  }
  
  protected void superClassListThrowException(final String _error, final String _issue, final Exception _ex, final org.eclipse.uml2.uml.Class cl, final ErrorInformation[] _errorInformations) throws RuleFailedException {
    throwRuleFailedException(_error, _issue, _ex, _errorInformations);
  }
  
  protected IUMLTypeReference typeReferenceInternal(final RuleApplicationTrace _trace_, final TypeDeclaration decl) {
    try {
    	checkParamsNotNull(decl);
    	return typeReferenceDispatcher.invoke(_trace_, decl);
    } catch (Exception _e_typeReference) {
    	sneakyThrowRuleFailedException(_e_typeReference);
    	return null;
    }
  }
  
  protected void typeReferenceThrowException(final String _error, final String _issue, final Exception _ex, final TypeDeclaration decl, final ErrorInformation[] _errorInformations) throws RuleFailedException {
    throwRuleFailedException(_error, _issue, _ex, _errorInformations);
  }
  
  protected Result<IUMLTypeReference> typeInternal(final RuleEnvironment _environment_, final RuleApplicationTrace _trace_, final EObject expression) {
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
  
  protected Result<IUMLTypeReference> operationTypeInternal(final RuleEnvironment _environment_, final RuleApplicationTrace _trace_, final Operation op, final Tuple params) {
    try {
    	checkParamsNotNull(op, params);
    	return operationTypeDispatcher.invoke(_environment_, _trace_, op, params);
    } catch (Exception _e_operationType) {
    	sneakyThrowRuleFailedException(_e_operationType);
    	return null;
    }
  }
  
  protected void operationTypeThrowException(final String _error, final String _issue, final Exception _ex, final Operation op, final Tuple params, final ErrorInformation[] _errorInformations) throws RuleFailedException {
    String _stringRep = this.stringRep(op);
    String _plus = ("Invalid parameter types " + _stringRep);
    String error = _plus;
    EObject source = op;
    throwRuleFailedException(error,
    	_issue, _ex, new ErrorInformation(source, null));
  }
  
  protected Result<Boolean> subtypeReferenceInternal(final RuleEnvironment _environment_, final RuleApplicationTrace _trace_, final IUMLTypeReference left, final IUMLTypeReference right) {
    try {
    	checkParamsNotNull(left, right);
    	return subtypeReferenceDispatcher.invoke(_environment_, _trace_, left, right);
    } catch (Exception _e_subtypeReference) {
    	sneakyThrowRuleFailedException(_e_subtypeReference);
    	return null;
    }
  }
  
  protected void subtypeReferenceThrowException(final String _error, final String _issue, final Exception _ex, final IUMLTypeReference left, final IUMLTypeReference right, final ErrorInformation[] _errorInformations) throws RuleFailedException {
    String _stringRep = this.stringRep(left);
    String _plus = (_stringRep + " is not a subtype of  ");
    String _stringRep_1 = this.stringRep(right);
    String _plus_1 = (_plus + _stringRep_1);
    String error = _plus_1;
    throwRuleFailedException(error,
    	_issue, _ex, new ErrorInformation(null, null));
  }
  
  protected Result<Boolean> subtypeOrEqualInternal(final RuleEnvironment _environment_, final RuleApplicationTrace _trace_, final Type left, final Type right) {
    try {
    	checkParamsNotNull(left, right);
    	return subtypeOrEqualDispatcher.invoke(_environment_, _trace_, left, right);
    } catch (Exception _e_subtypeOrEqual) {
    	sneakyThrowRuleFailedException(_e_subtypeOrEqual);
    	return null;
    }
  }
  
  protected void subtypeOrEqualThrowException(final String _error, final String _issue, final Exception _ex, final Type left, final Type right, final ErrorInformation[] _errorInformations) throws RuleFailedException {
    String _stringRep = this.stringRep(left);
    String _plus = (_stringRep + " is not a subtype of  ");
    String _stringRep_1 = this.stringRep(right);
    String _plus_1 = (_plus + _stringRep_1);
    String error = _plus_1;
    throwRuleFailedException(error,
    	_issue, _ex, new ErrorInformation(null, null));
  }
  
  protected Result<Boolean> assignableInternal(final RuleEnvironment _environment_, final RuleApplicationTrace _trace_, final Expression expression, final IUMLTypeReference target) {
    try {
    	checkParamsNotNull(expression, target);
    	return assignableDispatcher.invoke(_environment_, _trace_, expression, target);
    } catch (Exception _e_assignable) {
    	sneakyThrowRuleFailedException(_e_assignable);
    	return null;
    }
  }
  
  protected void assignableThrowException(final String _error, final String _issue, final Exception _ex, final Expression expression, final IUMLTypeReference target, final ErrorInformation[] _errorInformations) throws RuleFailedException {
    String _stringRep = this.stringRep(expression);
    String _plus = (_stringRep + " is not assignable for type ");
    String _stringRep_1 = this.stringRep(target);
    String _plus_1 = (_plus + _stringRep_1);
    String error = _plus_1;
    EObject source = expression;
    throwRuleFailedException(error,
    	_issue, _ex, new ErrorInformation(source, null));
  }
  
  protected List<org.eclipse.uml2.uml.Class> superClassListImpl(final RuleApplicationTrace _trace_, final org.eclipse.uml2.uml.Class cl) throws RuleFailedException {
    try {
    	final RuleApplicationTrace _subtrace_ = newTrace(_trace_);
    	final List<org.eclipse.uml2.uml.Class> _result_ = applyAuxFunSuperClassList(_subtrace_, cl);
    	addToTrace(_trace_, new Provider<Object>() {
    		public Object get() {
    			return auxFunName("superClassList") + "(" + stringRep(cl)+ ")" + " = " + stringRep(_result_);
    		}
    	});
    	addAsSubtrace(_trace_, _subtrace_);
    	return _result_;
    } catch (Exception e_applyAuxFunSuperClassList) {
    	superClassListThrowException(auxFunName("superClassList") + "(" + stringRep(cl)+ ")",
    		SUPERCLASSLIST,
    		e_applyAuxFunSuperClassList, cl, new ErrorInformation[] {new ErrorInformation(cl)});
    	return null;
    }
  }
  
  protected List<org.eclipse.uml2.uml.Class> applyAuxFunSuperClassList(final RuleApplicationTrace _trace_, final org.eclipse.uml2.uml.Class cl) throws RuleFailedException {
    return cl.getSuperClasses();
  }
  
  protected IUMLTypeReference typeReferenceImpl(final RuleApplicationTrace _trace_, final TypeDeclaration decl) throws RuleFailedException {
    try {
    	final RuleApplicationTrace _subtrace_ = newTrace(_trace_);
    	final IUMLTypeReference _result_ = applyAuxFunTypeReference(_subtrace_, decl);
    	addToTrace(_trace_, new Provider<Object>() {
    		public Object get() {
    			return auxFunName("typeReference") + "(" + stringRep(decl)+ ")" + " = " + stringRep(_result_);
    		}
    	});
    	addAsSubtrace(_trace_, _subtrace_);
    	return _result_;
    } catch (Exception e_applyAuxFunTypeReference) {
    	typeReferenceThrowException(auxFunName("typeReference") + "(" + stringRep(decl)+ ")",
    		TYPEREFERENCE,
    		e_applyAuxFunTypeReference, decl, new ErrorInformation[] {new ErrorInformation(decl)});
    	return null;
    }
  }
  
  protected IUMLTypeReference applyAuxFunTypeReference(final RuleApplicationTrace _trace_, final TypeDeclaration decl) throws RuleFailedException {
    Type _type = decl.getType();
    return this.typeFactory.typeReference(_type);
  }
  
  protected Result<IUMLTypeReference> typeImpl(final RuleEnvironment G, final RuleApplicationTrace _trace_, final BooleanLiteralExpression bool) throws RuleFailedException {
    try {
    	final RuleApplicationTrace _subtrace_ = newTrace(_trace_);
    	final Result<IUMLTypeReference> _result_ = applyRuleBooleanLiteral(G, _subtrace_, bool);
    	addToTrace(_trace_, new Provider<Object>() {
    		public Object get() {
    			return ruleName("BooleanLiteral") + stringRepForEnv(G) + " |- " + stringRep(bool) + " : " + stringRep(_result_.getFirst());
    		}
    	});
    	addAsSubtrace(_trace_, _subtrace_);
    	return _result_;
    } catch (Exception e_applyRuleBooleanLiteral) {
    	typeThrowException(ruleName("BooleanLiteral") + stringRepForEnv(G) + " |- " + stringRep(bool) + " : " + "PrimitiveTypeReference",
    		BOOLEANLITERAL,
    		e_applyRuleBooleanLiteral, bool, new ErrorInformation[] {new ErrorInformation(bool)});
    	return null;
    }
  }
  
  protected Result<IUMLTypeReference> applyRuleBooleanLiteral(final RuleEnvironment G, final RuleApplicationTrace _trace_, final BooleanLiteralExpression bool) throws RuleFailedException {
    
    return new Result<IUMLTypeReference>(_applyRuleBooleanLiteral_1(G, bool));
  }
  
  private PrimitiveTypeReference _applyRuleBooleanLiteral_1(final RuleEnvironment G, final BooleanLiteralExpression bool) throws RuleFailedException {
    PrimitiveTypeReference _primitiveTypeReference = this.typeFactory.primitiveTypeReference(this.BOOLEAN);
    return _primitiveTypeReference;
  }
  
  protected Result<IUMLTypeReference> typeImpl(final RuleEnvironment G, final RuleApplicationTrace _trace_, final NaturalLiteralExpression natural) throws RuleFailedException {
    try {
    	final RuleApplicationTrace _subtrace_ = newTrace(_trace_);
    	final Result<IUMLTypeReference> _result_ = applyRuleNaturalLiteral(G, _subtrace_, natural);
    	addToTrace(_trace_, new Provider<Object>() {
    		public Object get() {
    			return ruleName("NaturalLiteral") + stringRepForEnv(G) + " |- " + stringRep(natural) + " : " + stringRep(_result_.getFirst());
    		}
    	});
    	addAsSubtrace(_trace_, _subtrace_);
    	return _result_;
    } catch (Exception e_applyRuleNaturalLiteral) {
    	typeThrowException(ruleName("NaturalLiteral") + stringRepForEnv(G) + " |- " + stringRep(natural) + " : " + "PrimitiveTypeReference",
    		NATURALLITERAL,
    		e_applyRuleNaturalLiteral, natural, new ErrorInformation[] {new ErrorInformation(natural)});
    	return null;
    }
  }
  
  protected Result<IUMLTypeReference> applyRuleNaturalLiteral(final RuleEnvironment G, final RuleApplicationTrace _trace_, final NaturalLiteralExpression natural) throws RuleFailedException {
    
    return new Result<IUMLTypeReference>(_applyRuleNaturalLiteral_1(G, natural));
  }
  
  private PrimitiveTypeReference _applyRuleNaturalLiteral_1(final RuleEnvironment G, final NaturalLiteralExpression natural) throws RuleFailedException {
    PrimitiveTypeReference _primitiveTypeReference = this.typeFactory.primitiveTypeReference(this.INTEGER);
    return _primitiveTypeReference;
  }
  
  protected Result<IUMLTypeReference> typeImpl(final RuleEnvironment G, final RuleApplicationTrace _trace_, final RealLiteralExpression real) throws RuleFailedException {
    try {
    	final RuleApplicationTrace _subtrace_ = newTrace(_trace_);
    	final Result<IUMLTypeReference> _result_ = applyRuleRealLiteral(G, _subtrace_, real);
    	addToTrace(_trace_, new Provider<Object>() {
    		public Object get() {
    			return ruleName("RealLiteral") + stringRepForEnv(G) + " |- " + stringRep(real) + " : " + stringRep(_result_.getFirst());
    		}
    	});
    	addAsSubtrace(_trace_, _subtrace_);
    	return _result_;
    } catch (Exception e_applyRuleRealLiteral) {
    	typeThrowException(ruleName("RealLiteral") + stringRepForEnv(G) + " |- " + stringRep(real) + " : " + "PrimitiveTypeReference",
    		REALLITERAL,
    		e_applyRuleRealLiteral, real, new ErrorInformation[] {new ErrorInformation(real)});
    	return null;
    }
  }
  
  protected Result<IUMLTypeReference> applyRuleRealLiteral(final RuleEnvironment G, final RuleApplicationTrace _trace_, final RealLiteralExpression real) throws RuleFailedException {
    
    return new Result<IUMLTypeReference>(_applyRuleRealLiteral_1(G, real));
  }
  
  private PrimitiveTypeReference _applyRuleRealLiteral_1(final RuleEnvironment G, final RealLiteralExpression real) throws RuleFailedException {
    PrimitiveTypeReference _primitiveTypeReference = this.typeFactory.primitiveTypeReference(this.REAL);
    return _primitiveTypeReference;
  }
  
  protected Result<IUMLTypeReference> typeImpl(final RuleEnvironment G, final RuleApplicationTrace _trace_, final StringLiteralExpression string) throws RuleFailedException {
    try {
    	final RuleApplicationTrace _subtrace_ = newTrace(_trace_);
    	final Result<IUMLTypeReference> _result_ = applyRuleStringLiteral(G, _subtrace_, string);
    	addToTrace(_trace_, new Provider<Object>() {
    		public Object get() {
    			return ruleName("StringLiteral") + stringRepForEnv(G) + " |- " + stringRep(string) + " : " + stringRep(_result_.getFirst());
    		}
    	});
    	addAsSubtrace(_trace_, _subtrace_);
    	return _result_;
    } catch (Exception e_applyRuleStringLiteral) {
    	typeThrowException(ruleName("StringLiteral") + stringRepForEnv(G) + " |- " + stringRep(string) + " : " + "PrimitiveTypeReference",
    		STRINGLITERAL,
    		e_applyRuleStringLiteral, string, new ErrorInformation[] {new ErrorInformation(string)});
    	return null;
    }
  }
  
  protected Result<IUMLTypeReference> applyRuleStringLiteral(final RuleEnvironment G, final RuleApplicationTrace _trace_, final StringLiteralExpression string) throws RuleFailedException {
    
    return new Result<IUMLTypeReference>(_applyRuleStringLiteral_1(G, string));
  }
  
  private PrimitiveTypeReference _applyRuleStringLiteral_1(final RuleEnvironment G, final StringLiteralExpression string) throws RuleFailedException {
    PrimitiveTypeReference _primitiveTypeReference = this.typeFactory.primitiveTypeReference(this.STRING);
    return _primitiveTypeReference;
  }
  
  protected Result<IUMLTypeReference> typeImpl(final RuleEnvironment G, final RuleApplicationTrace _trace_, final NullExpression ex) throws RuleFailedException {
    try {
    	final RuleApplicationTrace _subtrace_ = newTrace(_trace_);
    	final Result<IUMLTypeReference> _result_ = applyRuleNullLiteral(G, _subtrace_, ex);
    	addToTrace(_trace_, new Provider<Object>() {
    		public Object get() {
    			return ruleName("NullLiteral") + stringRepForEnv(G) + " |- " + stringRep(ex) + " : " + stringRep(_result_.getFirst());
    		}
    	});
    	addAsSubtrace(_trace_, _subtrace_);
    	return _result_;
    } catch (Exception e_applyRuleNullLiteral) {
    	typeThrowException(ruleName("NullLiteral") + stringRepForEnv(G) + " |- " + stringRep(ex) + " : " + "NullTypeReference",
    		NULLLITERAL,
    		e_applyRuleNullLiteral, ex, new ErrorInformation[] {new ErrorInformation(ex)});
    	return null;
    }
  }
  
  protected Result<IUMLTypeReference> applyRuleNullLiteral(final RuleEnvironment G, final RuleApplicationTrace _trace_, final NullExpression ex) throws RuleFailedException {
    
    return new Result<IUMLTypeReference>(_applyRuleNullLiteral_1(G, ex));
  }
  
  private IUMLTypeReference.NullTypeReference _applyRuleNullLiteral_1(final RuleEnvironment G, final NullExpression ex) throws RuleFailedException {
    IUMLTypeReference.NullTypeReference _nullType = this.typeFactory.nullType();
    return _nullType;
  }
  
  protected Result<IUMLTypeReference> typeImpl(final RuleEnvironment G, final RuleApplicationTrace _trace_, final TypeDeclaration typeDecl) throws RuleFailedException {
    try {
    	final RuleApplicationTrace _subtrace_ = newTrace(_trace_);
    	final Result<IUMLTypeReference> _result_ = applyRuleTypeDeclaration(G, _subtrace_, typeDecl);
    	addToTrace(_trace_, new Provider<Object>() {
    		public Object get() {
    			return ruleName("TypeDeclaration") + stringRepForEnv(G) + " |- " + stringRep(typeDecl) + " : " + stringRep(_result_.getFirst());
    		}
    	});
    	addAsSubtrace(_trace_, _subtrace_);
    	return _result_;
    } catch (Exception e_applyRuleTypeDeclaration) {
    	typeThrowException(ruleName("TypeDeclaration") + stringRepForEnv(G) + " |- " + stringRep(typeDecl) + " : " + "IUMLTypeReference",
    		TYPEDECLARATION,
    		e_applyRuleTypeDeclaration, typeDecl, new ErrorInformation[] {new ErrorInformation(typeDecl)});
    	return null;
    }
  }
  
  protected Result<IUMLTypeReference> applyRuleTypeDeclaration(final RuleEnvironment G, final RuleApplicationTrace _trace_, final TypeDeclaration typeDecl) throws RuleFailedException {
    IUMLTypeReference result = null; // output parameter
    IUMLTypeReference _typeReference = this.typeReferenceInternal(_trace_, typeDecl);
    result = _typeReference;
    return new Result<IUMLTypeReference>(result);
  }
  
  protected Result<IUMLTypeReference> typeImpl(final RuleEnvironment G, final RuleApplicationTrace _trace_, final Variable variable) throws RuleFailedException {
    try {
    	final RuleApplicationTrace _subtrace_ = newTrace(_trace_);
    	final Result<IUMLTypeReference> _result_ = applyRuleVariableDeclaration(G, _subtrace_, variable);
    	addToTrace(_trace_, new Provider<Object>() {
    		public Object get() {
    			return ruleName("VariableDeclaration") + stringRepForEnv(G) + " |- " + stringRep(variable) + " : " + stringRep(_result_.getFirst());
    		}
    	});
    	addAsSubtrace(_trace_, _subtrace_);
    	return _result_;
    } catch (Exception e_applyRuleVariableDeclaration) {
    	typeThrowException(ruleName("VariableDeclaration") + stringRepForEnv(G) + " |- " + stringRep(variable) + " : " + "IUMLTypeReference",
    		VARIABLEDECLARATION,
    		e_applyRuleVariableDeclaration, variable, new ErrorInformation[] {new ErrorInformation(variable)});
    	return null;
    }
  }
  
  protected Result<IUMLTypeReference> applyRuleVariableDeclaration(final RuleEnvironment G, final RuleApplicationTrace _trace_, final Variable variable) throws RuleFailedException {
    IUMLTypeReference result = null; // output parameter
    TypeDeclaration _type = variable.getType();
    IUMLTypeReference _typeReference = this.typeReferenceInternal(_trace_, _type);
    result = _typeReference;
    return new Result<IUMLTypeReference>(result);
  }
  
  protected Result<IUMLTypeReference> typeImpl(final RuleEnvironment G, final RuleApplicationTrace _trace_, final LoopVariable variable) throws RuleFailedException {
    try {
    	final RuleApplicationTrace _subtrace_ = newTrace(_trace_);
    	final Result<IUMLTypeReference> _result_ = applyRuleLoopVariable(G, _subtrace_, variable);
    	addToTrace(_trace_, new Provider<Object>() {
    		public Object get() {
    			return ruleName("LoopVariable") + stringRepForEnv(G) + " |- " + stringRep(variable) + " : " + stringRep(_result_.getFirst());
    		}
    	});
    	addAsSubtrace(_trace_, _subtrace_);
    	return _result_;
    } catch (Exception e_applyRuleLoopVariable) {
    	typeThrowException(ruleName("LoopVariable") + stringRepForEnv(G) + " |- " + stringRep(variable) + " : " + "IUMLTypeReference",
    		LOOPVARIABLE,
    		e_applyRuleLoopVariable, variable, new ErrorInformation[] {new ErrorInformation(variable)});
    	return null;
    }
  }
  
  protected Result<IUMLTypeReference> applyRuleLoopVariable(final RuleEnvironment G, final RuleApplicationTrace _trace_, final LoopVariable variable) throws RuleFailedException {
    IUMLTypeReference result = null; // output parameter
    TypeDeclaration _type = variable.getType();
    boolean _notEquals = (!Objects.equal(_type, null));
    if (_notEquals) {
      TypeDeclaration _type_1 = variable.getType();
      IUMLTypeReference _typeReference = this.typeReferenceInternal(_trace_, _type_1);
      result = _typeReference;
    }
    return new Result<IUMLTypeReference>(result);
  }
  
  protected Result<IUMLTypeReference> typeImpl(final RuleEnvironment G, final RuleApplicationTrace _trace_, final FilterVariable variable) throws RuleFailedException {
    try {
    	final RuleApplicationTrace _subtrace_ = newTrace(_trace_);
    	final Result<IUMLTypeReference> _result_ = applyRuleFilterVariable(G, _subtrace_, variable);
    	addToTrace(_trace_, new Provider<Object>() {
    		public Object get() {
    			return ruleName("FilterVariable") + stringRepForEnv(G) + " |- " + stringRep(variable) + " : " + stringRep(_result_.getFirst());
    		}
    	});
    	addAsSubtrace(_trace_, _subtrace_);
    	return _result_;
    } catch (Exception e_applyRuleFilterVariable) {
    	typeThrowException(ruleName("FilterVariable") + stringRepForEnv(G) + " |- " + stringRep(variable) + " : " + "IUMLTypeReference",
    		FILTERVARIABLE,
    		e_applyRuleFilterVariable, variable, new ErrorInformation[] {new ErrorInformation(variable)});
    	return null;
    }
  }
  
  protected Result<IUMLTypeReference> applyRuleFilterVariable(final RuleEnvironment G, final RuleApplicationTrace _trace_, final FilterVariable variable) throws RuleFailedException {
    IUMLTypeReference result = null; // output parameter
    TypeDeclaration _type = variable.getType();
    boolean _notEquals = (!Objects.equal(_type, null));
    if (_notEquals) {
      TypeDeclaration _type_1 = variable.getType();
      IUMLTypeReference _typeReference = this.typeReferenceInternal(_trace_, _type_1);
      result = _typeReference;
    } else {
      EObject _eContainer = variable.eContainer();
      FilterExpression filterExp = ((FilterExpression) _eContainer);
      /* G |- filterExp.context : var CollectionTypeReference contextType */
      Expression _context = filterExp.getContext();
      CollectionTypeReference contextType = null;
      Result<IUMLTypeReference> result_1 = typeInternal(G, _trace_, _context);
      checkAssignableTo(result_1.getFirst(), CollectionTypeReference.class);
      contextType = (CollectionTypeReference) result_1.getFirst();
      
      IUMLTypeReference _valueType = contextType.getValueType();
      result = _valueType;
    }
    return new Result<IUMLTypeReference>(result);
  }
  
  protected Result<IUMLTypeReference> typeImpl(final RuleEnvironment G, final RuleApplicationTrace _trace_, final Parameter parameter) throws RuleFailedException {
    try {
    	final RuleApplicationTrace _subtrace_ = newTrace(_trace_);
    	final Result<IUMLTypeReference> _result_ = applyRuleParameter(G, _subtrace_, parameter);
    	addToTrace(_trace_, new Provider<Object>() {
    		public Object get() {
    			return ruleName("Parameter") + stringRepForEnv(G) + " |- " + stringRep(parameter) + " : " + stringRep(_result_.getFirst());
    		}
    	});
    	addAsSubtrace(_trace_, _subtrace_);
    	return _result_;
    } catch (Exception e_applyRuleParameter) {
    	typeThrowException(ruleName("Parameter") + stringRepForEnv(G) + " |- " + stringRep(parameter) + " : " + "IUMLTypeReference",
    		PARAMETER,
    		e_applyRuleParameter, parameter, new ErrorInformation[] {new ErrorInformation(parameter)});
    	return null;
    }
  }
  
  protected Result<IUMLTypeReference> applyRuleParameter(final RuleEnvironment G, final RuleApplicationTrace _trace_, final Parameter parameter) throws RuleFailedException {
    IUMLTypeReference result = null; // output parameter
    Type _type = parameter.getType();
    IUMLTypeReference _typeReference = this.typeFactory.typeReference(_type);
    result = _typeReference;
    return new Result<IUMLTypeReference>(result);
  }
  
  protected Result<IUMLTypeReference> typeImpl(final RuleEnvironment G, final RuleApplicationTrace _trace_, final Type type) throws RuleFailedException {
    try {
    	final RuleApplicationTrace _subtrace_ = newTrace(_trace_);
    	final Result<IUMLTypeReference> _result_ = applyRuleType(G, _subtrace_, type);
    	addToTrace(_trace_, new Provider<Object>() {
    		public Object get() {
    			return ruleName("Type") + stringRepForEnv(G) + " |- " + stringRep(type) + " : " + stringRep(_result_.getFirst());
    		}
    	});
    	addAsSubtrace(_trace_, _subtrace_);
    	return _result_;
    } catch (Exception e_applyRuleType) {
    	typeThrowException(ruleName("Type") + stringRepForEnv(G) + " |- " + stringRep(type) + " : " + "IUMLTypeReference",
    		TYPE,
    		e_applyRuleType, type, new ErrorInformation[] {new ErrorInformation(type)});
    	return null;
    }
  }
  
  protected Result<IUMLTypeReference> applyRuleType(final RuleEnvironment G, final RuleApplicationTrace _trace_, final Type type) throws RuleFailedException {
    IUMLTypeReference result = null; // output parameter
    IUMLTypeReference _typeReference = this.typeFactory.typeReference(type);
    result = _typeReference;
    return new Result<IUMLTypeReference>(result);
  }
  
  protected Result<Boolean> subtypeReferenceImpl(final RuleEnvironment G, final RuleApplicationTrace _trace_, final UMLTypeReference left, final IUMLTypeReference.NullTypeReference right) throws RuleFailedException {
    try {
    	final RuleApplicationTrace _subtrace_ = newTrace(_trace_);
    	final Result<Boolean> _result_ = applyRuleNullSubtyping(G, _subtrace_, left, right);
    	addToTrace(_trace_, new Provider<Object>() {
    		public Object get() {
    			return ruleName("NullSubtyping") + stringRepForEnv(G) + " |- " + stringRep(left) + " <: " + stringRep(right);
    		}
    	});
    	addAsSubtrace(_trace_, _subtrace_);
    	return _result_;
    } catch (Exception e_applyRuleNullSubtyping) {
    	subtypeReferenceThrowException(ruleName("NullSubtyping") + stringRepForEnv(G) + " |- " + stringRep(left) + " <: " + stringRep(right),
    		NULLSUBTYPING,
    		e_applyRuleNullSubtyping, left, right, new ErrorInformation[] {});
    	return null;
    }
  }
  
  protected Result<Boolean> applyRuleNullSubtyping(final RuleEnvironment G, final RuleApplicationTrace _trace_, final UMLTypeReference left, final IUMLTypeReference.NullTypeReference right) throws RuleFailedException {
    
    return new Result<Boolean>(true);
  }
  
  protected Result<Boolean> subtypeReferenceImpl(final RuleEnvironment G, final RuleApplicationTrace _trace_, final IUMLTypeReference.AnyTypeReference left, final IUMLTypeReference right) throws RuleFailedException {
    try {
    	final RuleApplicationTrace _subtrace_ = newTrace(_trace_);
    	final Result<Boolean> _result_ = applyRuleAnySubtyping(G, _subtrace_, left, right);
    	addToTrace(_trace_, new Provider<Object>() {
    		public Object get() {
    			return ruleName("AnySubtyping") + stringRepForEnv(G) + " |- " + stringRep(left) + " <: " + stringRep(right);
    		}
    	});
    	addAsSubtrace(_trace_, _subtrace_);
    	return _result_;
    } catch (Exception e_applyRuleAnySubtyping) {
    	subtypeReferenceThrowException(ruleName("AnySubtyping") + stringRepForEnv(G) + " |- " + stringRep(left) + " <: " + stringRep(right),
    		ANYSUBTYPING,
    		e_applyRuleAnySubtyping, left, right, new ErrorInformation[] {});
    	return null;
    }
  }
  
  protected Result<Boolean> applyRuleAnySubtyping(final RuleEnvironment G, final RuleApplicationTrace _trace_, final IUMLTypeReference.AnyTypeReference left, final IUMLTypeReference right) throws RuleFailedException {
    
    return new Result<Boolean>(true);
  }
  
  protected Result<Boolean> subtypeReferenceImpl(final RuleEnvironment G, final RuleApplicationTrace _trace_, final IUMLTypeReference left, final IUMLTypeReference right) throws RuleFailedException {
    try {
    	final RuleApplicationTrace _subtrace_ = newTrace(_trace_);
    	final Result<Boolean> _result_ = applyRuleGeneralReferenceSubtyping(G, _subtrace_, left, right);
    	addToTrace(_trace_, new Provider<Object>() {
    		public Object get() {
    			return ruleName("GeneralReferenceSubtyping") + stringRepForEnv(G) + " |- " + stringRep(left) + " <: " + stringRep(right);
    		}
    	});
    	addAsSubtrace(_trace_, _subtrace_);
    	return _result_;
    } catch (Exception e_applyRuleGeneralReferenceSubtyping) {
    	generalReferenceSubtypingThrowException(e_applyRuleGeneralReferenceSubtyping, left, right);
    	return null;
    }
  }
  
  protected Result<Boolean> applyRuleGeneralReferenceSubtyping(final RuleEnvironment G, final RuleApplicationTrace _trace_, final IUMLTypeReference left, final IUMLTypeReference right) throws RuleFailedException {
    /* fail */
    throwForExplicitFail();
    return new Result<Boolean>(true);
  }
  
  private void generalReferenceSubtypingThrowException(final Exception e_applyRuleGeneralReferenceSubtyping, final IUMLTypeReference left, final IUMLTypeReference right) throws RuleFailedException {
    String _stringRep = this.stringRep(left);
    String _plus = ("The type " + _stringRep);
    String _plus_1 = (_plus + " is not compatible with the type ");
    String _stringRep_1 = this.stringRep(right);
    String _plus_2 = (_plus_1 + _stringRep_1);
    String error = _plus_2;
    throwRuleFailedException(error,
    	GENERALREFERENCESUBTYPING, e_applyRuleGeneralReferenceSubtyping, new ErrorInformation(null, null));
  }
  
  protected Result<Boolean> subtypeReferenceImpl(final RuleEnvironment G, final RuleApplicationTrace _trace_, final AbstractTypeReference left, final AbstractTypeReference right) throws RuleFailedException {
    try {
    	final RuleApplicationTrace _subtrace_ = newTrace(_trace_);
    	final Result<Boolean> _result_ = applyRuleSimpleTypeReferenceSubtyping(G, _subtrace_, left, right);
    	addToTrace(_trace_, new Provider<Object>() {
    		public Object get() {
    			return ruleName("SimpleTypeReferenceSubtyping") + stringRepForEnv(G) + " |- " + stringRep(left) + " <: " + stringRep(right);
    		}
    	});
    	addAsSubtrace(_trace_, _subtrace_);
    	return _result_;
    } catch (Exception e_applyRuleSimpleTypeReferenceSubtyping) {
    	subtypeReferenceThrowException(ruleName("SimpleTypeReferenceSubtyping") + stringRepForEnv(G) + " |- " + stringRep(left) + " <: " + stringRep(right),
    		SIMPLETYPEREFERENCESUBTYPING,
    		e_applyRuleSimpleTypeReferenceSubtyping, left, right, new ErrorInformation[] {});
    	return null;
    }
  }
  
  protected Result<Boolean> applyRuleSimpleTypeReferenceSubtyping(final RuleEnvironment G, final RuleApplicationTrace _trace_, final AbstractTypeReference left, final AbstractTypeReference right) throws RuleFailedException {
    /* G |- left.umlType <~ right.umlType */
    Type _umlType = left.getUmlType();
    Type _umlType_1 = right.getUmlType();
    subtypeOrEqualInternal(G, _trace_, _umlType, _umlType_1);
    return new Result<Boolean>(true);
  }
  
  protected Result<Boolean> subtypeReferenceImpl(final RuleEnvironment G, final RuleApplicationTrace _trace_, final CollectionTypeReference left, final CollectionTypeReference right) throws RuleFailedException {
    try {
    	final RuleApplicationTrace _subtrace_ = newTrace(_trace_);
    	final Result<Boolean> _result_ = applyRuleCollectionSubtyping(G, _subtrace_, left, right);
    	addToTrace(_trace_, new Provider<Object>() {
    		public Object get() {
    			return ruleName("CollectionSubtyping") + stringRepForEnv(G) + " |- " + stringRep(left) + " <: " + stringRep(right);
    		}
    	});
    	addAsSubtrace(_trace_, _subtrace_);
    	return _result_;
    } catch (Exception e_applyRuleCollectionSubtyping) {
    	subtypeReferenceThrowException(ruleName("CollectionSubtyping") + stringRepForEnv(G) + " |- " + stringRep(left) + " <: " + stringRep(right),
    		COLLECTIONSUBTYPING,
    		e_applyRuleCollectionSubtyping, left, right, new ErrorInformation[] {});
    	return null;
    }
  }
  
  protected Result<Boolean> applyRuleCollectionSubtyping(final RuleEnvironment G, final RuleApplicationTrace _trace_, final CollectionTypeReference left, final CollectionTypeReference right) throws RuleFailedException {
    CollectionType _type = left.getType();
    CollectionType _type_1 = right.getType();
    boolean _equals = Objects.equal(_type, _type_1);
    /* left.type == right.type */
    if (!_equals) {
      sneakyThrowRuleFailedException("left.type == right.type");
    }
    IUMLTypeReference _valueType = left.getValueType();
    IUMLTypeReference _valueType_1 = right.getValueType();
    /* left.valueType == right.valueType */
    if (!Objects.equal(_valueType, _valueType_1)) {
      sneakyThrowRuleFailedException("left.valueType == right.valueType");
    }
    return new Result<Boolean>(true);
  }
  
  protected Result<Boolean> subtypeOrEqualImpl(final RuleEnvironment G, final RuleApplicationTrace _trace_, final Type left, final Type right) throws RuleFailedException {
    try {
    	final RuleApplicationTrace _subtrace_ = newTrace(_trace_);
    	final Result<Boolean> _result_ = applyRuleGeneralSubtyping(G, _subtrace_, left, right);
    	addToTrace(_trace_, new Provider<Object>() {
    		public Object get() {
    			return ruleName("GeneralSubtyping") + stringRepForEnv(G) + " |- " + stringRep(left) + " <~ " + stringRep(right);
    		}
    	});
    	addAsSubtrace(_trace_, _subtrace_);
    	return _result_;
    } catch (Exception e_applyRuleGeneralSubtyping) {
    	generalSubtypingThrowException(e_applyRuleGeneralSubtyping, left, right);
    	return null;
    }
  }
  
  protected Result<Boolean> applyRuleGeneralSubtyping(final RuleEnvironment G, final RuleApplicationTrace _trace_, final Type left, final Type right) throws RuleFailedException {
    /* fail */
    throwForExplicitFail();
    return new Result<Boolean>(true);
  }
  
  private void generalSubtypingThrowException(final Exception e_applyRuleGeneralSubtyping, final Type left, final Type right) throws RuleFailedException {
    String _stringRep = this.stringRep(left);
    String _plus = ("The type " + _stringRep);
    String _plus_1 = (_plus + " is not compatible with the type ");
    String _stringRep_1 = this.stringRep(right);
    String _plus_2 = (_plus_1 + _stringRep_1);
    String error = _plus_2;
    throwRuleFailedException(error,
    	GENERALSUBTYPING, e_applyRuleGeneralSubtyping, new ErrorInformation(null, null));
  }
  
  protected Result<Boolean> subtypeOrEqualImpl(final RuleEnvironment G, final RuleApplicationTrace _trace_, final PrimitiveType left, final PrimitiveType right) throws RuleFailedException {
    try {
    	final RuleApplicationTrace _subtrace_ = newTrace(_trace_);
    	final Result<Boolean> _result_ = applyRulePrimitiveSubtyping(G, _subtrace_, left, right);
    	addToTrace(_trace_, new Provider<Object>() {
    		public Object get() {
    			return ruleName("PrimitiveSubtyping") + stringRepForEnv(G) + " |- " + stringRep(left) + " <~ " + stringRep(right);
    		}
    	});
    	addAsSubtrace(_trace_, _subtrace_);
    	return _result_;
    } catch (Exception e_applyRulePrimitiveSubtyping) {
    	subtypeOrEqualThrowException(ruleName("PrimitiveSubtyping") + stringRepForEnv(G) + " |- " + stringRep(left) + " <~ " + stringRep(right),
    		PRIMITIVESUBTYPING,
    		e_applyRulePrimitiveSubtyping, left, right, new ErrorInformation[] {new ErrorInformation(left), new ErrorInformation(right)});
    	return null;
    }
  }
  
  protected Result<Boolean> applyRulePrimitiveSubtyping(final RuleEnvironment G, final RuleApplicationTrace _trace_, final PrimitiveType left, final PrimitiveType right) throws RuleFailedException {
    /* { left == right } or { left == REAL.primitiveType right == INTEGER.primitiveType } */
    {
      RuleFailedException previousFailure = null;
      try {
        /* left == right */
        if (!Objects.equal(left, right)) {
          sneakyThrowRuleFailedException("left == right");
        }
      } catch (Exception e) {
        previousFailure = extractRuleFailedException(e);
        Type _primitiveType = this.umlContext.getPrimitiveType(this.REAL);
        boolean _equals = Objects.equal(left, _primitiveType);
        /* left == REAL.primitiveType */
        if (!_equals) {
          sneakyThrowRuleFailedException("left == REAL.primitiveType");
        }
        Type _primitiveType_1 = this.umlContext.getPrimitiveType(this.INTEGER);
        /* right == INTEGER.primitiveType */
        if (!Objects.equal(right, _primitiveType_1)) {
          sneakyThrowRuleFailedException("right == INTEGER.primitiveType");
        }
      }
    }
    return new Result<Boolean>(true);
  }
  
  protected Result<Boolean> subtypeOrEqualImpl(final RuleEnvironment G, final RuleApplicationTrace _trace_, final Classifier left, final Classifier right) throws RuleFailedException {
    try {
    	final RuleApplicationTrace _subtrace_ = newTrace(_trace_);
    	final Result<Boolean> _result_ = applyRuleEqualsClassifierSubtyping(G, _subtrace_, left, right);
    	addToTrace(_trace_, new Provider<Object>() {
    		public Object get() {
    			return ruleName("EqualsClassifierSubtyping") + stringRepForEnv(G) + " |- " + stringRep(left) + " <~ " + stringRep(right);
    		}
    	});
    	addAsSubtrace(_trace_, _subtrace_);
    	return _result_;
    } catch (Exception e_applyRuleEqualsClassifierSubtyping) {
    	subtypeOrEqualThrowException(ruleName("EqualsClassifierSubtyping") + stringRepForEnv(G) + " |- " + stringRep(left) + " <~ " + stringRep(right),
    		EQUALSCLASSIFIERSUBTYPING,
    		e_applyRuleEqualsClassifierSubtyping, left, right, new ErrorInformation[] {new ErrorInformation(left), new ErrorInformation(right)});
    	return null;
    }
  }
  
  protected Result<Boolean> applyRuleEqualsClassifierSubtyping(final RuleEnvironment G, final RuleApplicationTrace _trace_, final Classifier left, final Classifier right) throws RuleFailedException {
    /* left == right */
    if (!Objects.equal(left, right)) {
      sneakyThrowRuleFailedException("left == right");
    }
    return new Result<Boolean>(true);
  }
  
  protected Result<Boolean> subtypeOrEqualImpl(final RuleEnvironment G, final RuleApplicationTrace _trace_, final org.eclipse.uml2.uml.Class left, final org.eclipse.uml2.uml.Class right) throws RuleFailedException {
    try {
    	final RuleApplicationTrace _subtrace_ = newTrace(_trace_);
    	final Result<Boolean> _result_ = applyRuleClassSubtyping(G, _subtrace_, left, right);
    	addToTrace(_trace_, new Provider<Object>() {
    		public Object get() {
    			return ruleName("ClassSubtyping") + stringRepForEnv(G) + " |- " + stringRep(left) + " <~ " + stringRep(right);
    		}
    	});
    	addAsSubtrace(_trace_, _subtrace_);
    	return _result_;
    } catch (Exception e_applyRuleClassSubtyping) {
    	subtypeOrEqualThrowException(ruleName("ClassSubtyping") + stringRepForEnv(G) + " |- " + stringRep(left) + " <~ " + stringRep(right),
    		CLASSSUBTYPING,
    		e_applyRuleClassSubtyping, left, right, new ErrorInformation[] {new ErrorInformation(left), new ErrorInformation(right)});
    	return null;
    }
  }
  
  protected Result<Boolean> applyRuleClassSubtyping(final RuleEnvironment G, final RuleApplicationTrace _trace_, final org.eclipse.uml2.uml.Class left, final org.eclipse.uml2.uml.Class right) throws RuleFailedException {
    /* left == right or right.name == "Object" or superClassList(left).contains(right) */
    {
      RuleFailedException previousFailure = null;
      try {
        boolean _equals = Objects.equal(left, right);
        /* left == right */
        if (!_equals) {
          sneakyThrowRuleFailedException("left == right");
        }
      } catch (Exception e) {
        previousFailure = extractRuleFailedException(e);
        /* right.name == "Object" or superClassList(left).contains(right) */
        {
          try {
            String _name = right.getName();
            boolean _equals_1 = Objects.equal(_name, "Object");
            /* right.name == "Object" */
            if (!_equals_1) {
              sneakyThrowRuleFailedException("right.name == \"Object\"");
            }
          } catch (Exception e_1) {
            previousFailure = extractRuleFailedException(e_1);
            List<org.eclipse.uml2.uml.Class> _superClassList = this.superClassListInternal(_trace_, left);
            boolean _contains = _superClassList.contains(right);
            /* superClassList(left).contains(right) */
            if (!_contains) {
              sneakyThrowRuleFailedException("superClassList(left).contains(right)");
            }
          }
        }
      }
    }
    return new Result<Boolean>(true);
  }
  
  protected Result<Boolean> assignableImpl(final RuleEnvironment G, final RuleApplicationTrace _trace_, final Expression ex, final IUMLTypeReference target) throws RuleFailedException {
    try {
    	final RuleApplicationTrace _subtrace_ = newTrace(_trace_);
    	final Result<Boolean> _result_ = applyRuleExpressionAssignableToType(G, _subtrace_, ex, target);
    	addToTrace(_trace_, new Provider<Object>() {
    		public Object get() {
    			return ruleName("ExpressionAssignableToType") + stringRepForEnv(G) + " |- " + stringRep(ex) + " |> " + stringRep(target);
    		}
    	});
    	addAsSubtrace(_trace_, _subtrace_);
    	return _result_;
    } catch (Exception e_applyRuleExpressionAssignableToType) {
    	assignableThrowException(ruleName("ExpressionAssignableToType") + stringRepForEnv(G) + " |- " + stringRep(ex) + " |> " + stringRep(target),
    		EXPRESSIONASSIGNABLETOTYPE,
    		e_applyRuleExpressionAssignableToType, ex, target, new ErrorInformation[] {new ErrorInformation(ex)});
    	return null;
    }
  }
  
  protected Result<Boolean> applyRuleExpressionAssignableToType(final RuleEnvironment G, final RuleApplicationTrace _trace_, final Expression ex, final IUMLTypeReference target) throws RuleFailedException {
    /* G |- ex : var IUMLTypeReference expressionType */
    IUMLTypeReference expressionType = null;
    Result<IUMLTypeReference> result = typeInternal(G, _trace_, ex);
    checkAssignableTo(result.getFirst(), IUMLTypeReference.class);
    expressionType = (IUMLTypeReference) result.getFirst();
    
    /* G |- expressionType <: target */
    subtypeReferenceInternal(G, _trace_, expressionType, target);
    return new Result<Boolean>(true);
  }
  
  protected Result<IUMLTypeReference> operationTypeImpl(final RuleEnvironment G, final RuleApplicationTrace _trace_, final Operation op, final Tuple params) throws RuleFailedException {
    try {
    	final RuleApplicationTrace _subtrace_ = newTrace(_trace_);
    	final Result<IUMLTypeReference> _result_ = applyRuleOperationTyping(G, _subtrace_, op, params);
    	addToTrace(_trace_, new Provider<Object>() {
    		public Object get() {
    			return ruleName("OperationTyping") + stringRepForEnv(G) + " |- " + stringRep(op) + " <: " + stringRep(params) + " : " + stringRep(_result_.getFirst());
    		}
    	});
    	addAsSubtrace(_trace_, _subtrace_);
    	return _result_;
    } catch (Exception e_applyRuleOperationTyping) {
    	operationTypeThrowException(ruleName("OperationTyping") + stringRepForEnv(G) + " |- " + stringRep(op) + " <: " + stringRep(params) + " : " + "IUMLTypeReference",
    		OPERATIONTYPING,
    		e_applyRuleOperationTyping, op, params, new ErrorInformation[] {new ErrorInformation(op), new ErrorInformation(params)});
    	return null;
    }
  }
  
  protected Result<IUMLTypeReference> applyRuleOperationTyping(final RuleEnvironment G, final RuleApplicationTrace _trace_, final Operation op, final Tuple params) throws RuleFailedException {
    IUMLTypeReference result = null; // output parameter
    /* fail */
    throwForExplicitFail();
    return new Result<IUMLTypeReference>(result);
  }
  
  protected Result<IUMLTypeReference> operationTypeImpl(final RuleEnvironment G, final RuleApplicationTrace _trace_, final Operation op, final ExpressionList params) throws RuleFailedException {
    try {
    	final RuleApplicationTrace _subtrace_ = newTrace(_trace_);
    	final Result<IUMLTypeReference> _result_ = applyRuleParameterListTyping(G, _subtrace_, op, params);
    	addToTrace(_trace_, new Provider<Object>() {
    		public Object get() {
    			return ruleName("ParameterListTyping") + stringRepForEnv(G) + " |- " + stringRep(op) + " <: " + stringRep(params) + " : " + stringRep(_result_.getFirst());
    		}
    	});
    	addAsSubtrace(_trace_, _subtrace_);
    	return _result_;
    } catch (Exception e_applyRuleParameterListTyping) {
    	operationTypeThrowException(ruleName("ParameterListTyping") + stringRepForEnv(G) + " |- " + stringRep(op) + " <: " + stringRep(params) + " : " + "IUMLTypeReference",
    		PARAMETERLISTTYPING,
    		e_applyRuleParameterListTyping, op, params, new ErrorInformation[] {new ErrorInformation(op), new ErrorInformation(params)});
    	return null;
    }
  }
  
  protected Result<IUMLTypeReference> applyRuleParameterListTyping(final RuleEnvironment G, final RuleApplicationTrace _trace_, final Operation op, final ExpressionList params) throws RuleFailedException {
    IUMLTypeReference result = null; // output parameter
    EList<Parameter> _ownedParameters = op.getOwnedParameters();
    final int opParamLength = _ownedParameters.size();
    EList<Expression> _expressions = params.getExpressions();
    final int paramLength = _expressions.size();
    /* opParamLength == paramLength */
    if (!(opParamLength == paramLength)) {
      sneakyThrowRuleFailedException("opParamLength == paramLength");
    }
    for (int i = 0; (i < paramLength); i++) {
      EList<Parameter> _ownedParameters_1 = op.getOwnedParameters();
      Parameter _get = _ownedParameters_1.get(i);
      Type _type = _get.getType();
      final IUMLTypeReference declaredType = this.typeFactory.typeReference(_type);
      /* G |- params.expressions.get(i) |> declaredType */
      EList<Expression> _expressions_1 = params.getExpressions();
      Expression _get_1 = _expressions_1.get(i);
      assignableInternal(G, _trace_, _get_1, declaredType);
    }
    /* G |- op : result */
    Result<IUMLTypeReference> result_1 = typeInternal(G, _trace_, op);
    checkAssignableTo(result_1.getFirst(), IUMLTypeReference.class);
    result = (IUMLTypeReference) result_1.getFirst();
    
    return new Result<IUMLTypeReference>(result);
  }
  
  protected Result<IUMLTypeReference> operationTypeImpl(final RuleEnvironment G, final RuleApplicationTrace _trace_, final Operation op, final NamedTuple params) throws RuleFailedException {
    try {
    	final RuleApplicationTrace _subtrace_ = newTrace(_trace_);
    	final Result<IUMLTypeReference> _result_ = applyRuleNamedTupleTyping(G, _subtrace_, op, params);
    	addToTrace(_trace_, new Provider<Object>() {
    		public Object get() {
    			return ruleName("NamedTupleTyping") + stringRepForEnv(G) + " |- " + stringRep(op) + " <: " + stringRep(params) + " : " + stringRep(_result_.getFirst());
    		}
    	});
    	addAsSubtrace(_trace_, _subtrace_);
    	return _result_;
    } catch (Exception e_applyRuleNamedTupleTyping) {
    	operationTypeThrowException(ruleName("NamedTupleTyping") + stringRepForEnv(G) + " |- " + stringRep(op) + " <: " + stringRep(params) + " : " + "IUMLTypeReference",
    		NAMEDTUPLETYPING,
    		e_applyRuleNamedTupleTyping, op, params, new ErrorInformation[] {new ErrorInformation(op), new ErrorInformation(params)});
    	return null;
    }
  }
  
  protected Result<IUMLTypeReference> applyRuleNamedTupleTyping(final RuleEnvironment G, final RuleApplicationTrace _trace_, final Operation op, final NamedTuple params) throws RuleFailedException {
    IUMLTypeReference result = null; // output parameter
    Parameter _returnParameter = this.scopeHelper.getReturnParameter(op);
    Type _type = _returnParameter.getType();
    IUMLTypeReference _typeReference = this.typeFactory.typeReference(_type);
    result = _typeReference;
    return new Result<IUMLTypeReference>(result);
  }
  
  protected Result<IUMLTypeReference> typeImpl(final RuleEnvironment G, final RuleApplicationTrace _trace_, final NumericUnaryExpression ex) throws RuleFailedException {
    try {
    	final RuleApplicationTrace _subtrace_ = newTrace(_trace_);
    	final Result<IUMLTypeReference> _result_ = applyRuleNumericUnaryExpression(G, _subtrace_, ex);
    	addToTrace(_trace_, new Provider<Object>() {
    		public Object get() {
    			return ruleName("NumericUnaryExpression") + stringRepForEnv(G) + " |- " + stringRep(ex) + " : " + stringRep(_result_.getFirst());
    		}
    	});
    	addAsSubtrace(_trace_, _subtrace_);
    	return _result_;
    } catch (Exception e_applyRuleNumericUnaryExpression) {
    	typeThrowException(ruleName("NumericUnaryExpression") + stringRepForEnv(G) + " |- " + stringRep(ex) + " : " + "IUMLTypeReference",
    		NUMERICUNARYEXPRESSION,
    		e_applyRuleNumericUnaryExpression, ex, new ErrorInformation[] {new ErrorInformation(ex)});
    	return null;
    }
  }
  
  protected Result<IUMLTypeReference> applyRuleNumericUnaryExpression(final RuleEnvironment G, final RuleApplicationTrace _trace_, final NumericUnaryExpression ex) throws RuleFailedException {
    IUMLTypeReference result = null; // output parameter
    /* { ex.operand.type.value == INTEGER.primitiveTypeReference result = INTEGER.primitiveTypeReference } or { ex.operand.type.value == REAL.primitiveTypeReference result = REAL.primitiveTypeReference } */
    {
      RuleFailedException previousFailure = null;
      try {
        Expression _operand = ex.getOperand();
        Result<IUMLTypeReference> _type = this.type(_operand);
        IUMLTypeReference _value = _type.getValue();
        PrimitiveTypeReference _primitiveTypeReference = this.typeFactory.primitiveTypeReference(this.INTEGER);
        boolean _equals = Objects.equal(_value, _primitiveTypeReference);
        /* ex.operand.type.value == INTEGER.primitiveTypeReference */
        if (!_equals) {
          sneakyThrowRuleFailedException("ex.operand.type.value == INTEGER.primitiveTypeReference");
        }
        PrimitiveTypeReference _primitiveTypeReference_1 = this.typeFactory.primitiveTypeReference(this.INTEGER);
        result = _primitiveTypeReference_1;
      } catch (Exception e) {
        previousFailure = extractRuleFailedException(e);
        Expression _operand_1 = ex.getOperand();
        Result<IUMLTypeReference> _type_1 = this.type(_operand_1);
        IUMLTypeReference _value_1 = _type_1.getValue();
        PrimitiveTypeReference _primitiveTypeReference_2 = this.typeFactory.primitiveTypeReference(this.REAL);
        boolean _equals_1 = Objects.equal(_value_1, _primitiveTypeReference_2);
        /* ex.operand.type.value == REAL.primitiveTypeReference */
        if (!_equals_1) {
          sneakyThrowRuleFailedException("ex.operand.type.value == REAL.primitiveTypeReference");
        }
        PrimitiveTypeReference _primitiveTypeReference_3 = this.typeFactory.primitiveTypeReference(this.REAL);
        result = _primitiveTypeReference_3;
      }
    }
    return new Result<IUMLTypeReference>(result);
  }
  
  protected Result<IUMLTypeReference> typeImpl(final RuleEnvironment G, final RuleApplicationTrace _trace_, final ArithmeticExpression ex) throws RuleFailedException {
    try {
    	final RuleApplicationTrace _subtrace_ = newTrace(_trace_);
    	final Result<IUMLTypeReference> _result_ = applyRuleArithmeticExpression(G, _subtrace_, ex);
    	addToTrace(_trace_, new Provider<Object>() {
    		public Object get() {
    			return ruleName("ArithmeticExpression") + stringRepForEnv(G) + " |- " + stringRep(ex) + " : " + stringRep(_result_.getFirst());
    		}
    	});
    	addAsSubtrace(_trace_, _subtrace_);
    	return _result_;
    } catch (Exception e_applyRuleArithmeticExpression) {
    	typeThrowException(ruleName("ArithmeticExpression") + stringRepForEnv(G) + " |- " + stringRep(ex) + " : " + "IUMLTypeReference",
    		ARITHMETICEXPRESSION,
    		e_applyRuleArithmeticExpression, ex, new ErrorInformation[] {new ErrorInformation(ex)});
    	return null;
    }
  }
  
  protected Result<IUMLTypeReference> applyRuleArithmeticExpression(final RuleEnvironment G, final RuleApplicationTrace _trace_, final ArithmeticExpression ex) throws RuleFailedException {
    IUMLTypeReference result = null; // output parameter
    /* G |- ex.operand1 : var IUMLTypeReference type1 */
    Expression _operand1 = ex.getOperand1();
    IUMLTypeReference type1 = null;
    Result<IUMLTypeReference> result_1 = typeInternal(G, _trace_, _operand1);
    checkAssignableTo(result_1.getFirst(), IUMLTypeReference.class);
    type1 = (IUMLTypeReference) result_1.getFirst();
    
    /* G |- ex.operand2 : var IUMLTypeReference type2 */
    Expression _operand2 = ex.getOperand2();
    IUMLTypeReference type2 = null;
    Result<IUMLTypeReference> result_2 = typeInternal(G, _trace_, _operand2);
    checkAssignableTo(result_2.getFirst(), IUMLTypeReference.class);
    type2 = (IUMLTypeReference) result_2.getFirst();
    
    /* { ex.operator == "+" type1 == STRING.primitiveTypeReference type2 == STRING.primitiveTypeReference result = STRING.primitiveTypeReference } or { ex.operator == "+" type1 == REAL.primitiveTypeReference type2 == REAL.primitiveTypeReference || type2 == INTEGER.primitiveTypeReference result = REAL.primitiveTypeReference } or { ex.operator == "+" type1 == REAL.primitiveTypeReference || type1 == INTEGER.primitiveTypeReference type2 == REAL.primitiveTypeReference result = REAL.primitiveTypeReference } or { type1 == REAL.primitiveTypeReference type2 == INTEGER.primitiveTypeReference || type2 == REAL.primitiveTypeReference result = REAL.primitiveTypeReference } or { type1 == INTEGER.primitiveTypeReference || type1 == REAL.primitiveTypeReference type2 == REAL.primitiveTypeReference result = REAL.primitiveTypeReference } or { type1 == INTEGER.primitiveTypeReference type2 == INTEGER.primitiveTypeReference result = INTEGER.primitiveTypeReference } */
    {
      RuleFailedException previousFailure = null;
      try {
        String _operator = ex.getOperator();
        boolean _equals = Objects.equal(_operator, "+");
        /* ex.operator == "+" */
        if (!_equals) {
          sneakyThrowRuleFailedException("ex.operator == \"+\"");
        }
        PrimitiveTypeReference _primitiveTypeReference = this.typeFactory.primitiveTypeReference(this.STRING);
        boolean _equals_1 = Objects.equal(type1, _primitiveTypeReference);
        /* type1 == STRING.primitiveTypeReference */
        if (!_equals_1) {
          sneakyThrowRuleFailedException("type1 == STRING.primitiveTypeReference");
        }
        PrimitiveTypeReference _primitiveTypeReference_1 = this.typeFactory.primitiveTypeReference(this.STRING);
        boolean _equals_2 = Objects.equal(type2, _primitiveTypeReference_1);
        /* type2 == STRING.primitiveTypeReference */
        if (!_equals_2) {
          sneakyThrowRuleFailedException("type2 == STRING.primitiveTypeReference");
        }
        PrimitiveTypeReference _primitiveTypeReference_2 = this.typeFactory.primitiveTypeReference(this.STRING);
        result = _primitiveTypeReference_2;
      } catch (Exception e) {
        previousFailure = extractRuleFailedException(e);
        /* { ex.operator == "+" type1 == REAL.primitiveTypeReference type2 == REAL.primitiveTypeReference || type2 == INTEGER.primitiveTypeReference result = REAL.primitiveTypeReference } or { ex.operator == "+" type1 == REAL.primitiveTypeReference || type1 == INTEGER.primitiveTypeReference type2 == REAL.primitiveTypeReference result = REAL.primitiveTypeReference } or { type1 == REAL.primitiveTypeReference type2 == INTEGER.primitiveTypeReference || type2 == REAL.primitiveTypeReference result = REAL.primitiveTypeReference } or { type1 == INTEGER.primitiveTypeReference || type1 == REAL.primitiveTypeReference type2 == REAL.primitiveTypeReference result = REAL.primitiveTypeReference } or { type1 == INTEGER.primitiveTypeReference type2 == INTEGER.primitiveTypeReference result = INTEGER.primitiveTypeReference } */
        {
          try {
            String _operator_1 = ex.getOperator();
            boolean _equals_3 = Objects.equal(_operator_1, "+");
            /* ex.operator == "+" */
            if (!_equals_3) {
              sneakyThrowRuleFailedException("ex.operator == \"+\"");
            }
            PrimitiveTypeReference _primitiveTypeReference_3 = this.typeFactory.primitiveTypeReference(this.REAL);
            boolean _equals_4 = Objects.equal(type1, _primitiveTypeReference_3);
            /* type1 == REAL.primitiveTypeReference */
            if (!_equals_4) {
              sneakyThrowRuleFailedException("type1 == REAL.primitiveTypeReference");
            }
            boolean _or = false;
            PrimitiveTypeReference _primitiveTypeReference_4 = this.typeFactory.primitiveTypeReference(this.REAL);
            boolean _equals_5 = Objects.equal(type2, _primitiveTypeReference_4);
            if (_equals_5) {
              _or = true;
            } else {
              PrimitiveTypeReference _primitiveTypeReference_5 = this.typeFactory.primitiveTypeReference(this.INTEGER);
              boolean _equals_6 = Objects.equal(type2, _primitiveTypeReference_5);
              _or = _equals_6;
            }
            /* type2 == REAL.primitiveTypeReference || type2 == INTEGER.primitiveTypeReference */
            if (!_or) {
              sneakyThrowRuleFailedException("type2 == REAL.primitiveTypeReference || type2 == INTEGER.primitiveTypeReference");
            }
            PrimitiveTypeReference _primitiveTypeReference_6 = this.typeFactory.primitiveTypeReference(this.REAL);
            result = _primitiveTypeReference_6;
          } catch (Exception e_1) {
            previousFailure = extractRuleFailedException(e_1);
            /* { ex.operator == "+" type1 == REAL.primitiveTypeReference || type1 == INTEGER.primitiveTypeReference type2 == REAL.primitiveTypeReference result = REAL.primitiveTypeReference } or { type1 == REAL.primitiveTypeReference type2 == INTEGER.primitiveTypeReference || type2 == REAL.primitiveTypeReference result = REAL.primitiveTypeReference } or { type1 == INTEGER.primitiveTypeReference || type1 == REAL.primitiveTypeReference type2 == REAL.primitiveTypeReference result = REAL.primitiveTypeReference } or { type1 == INTEGER.primitiveTypeReference type2 == INTEGER.primitiveTypeReference result = INTEGER.primitiveTypeReference } */
            {
              try {
                String _operator_2 = ex.getOperator();
                boolean _equals_7 = Objects.equal(_operator_2, "+");
                /* ex.operator == "+" */
                if (!_equals_7) {
                  sneakyThrowRuleFailedException("ex.operator == \"+\"");
                }
                boolean _or_1 = false;
                PrimitiveTypeReference _primitiveTypeReference_7 = this.typeFactory.primitiveTypeReference(this.REAL);
                boolean _equals_8 = Objects.equal(type1, _primitiveTypeReference_7);
                if (_equals_8) {
                  _or_1 = true;
                } else {
                  PrimitiveTypeReference _primitiveTypeReference_8 = this.typeFactory.primitiveTypeReference(this.INTEGER);
                  boolean _equals_9 = Objects.equal(type1, _primitiveTypeReference_8);
                  _or_1 = _equals_9;
                }
                /* type1 == REAL.primitiveTypeReference || type1 == INTEGER.primitiveTypeReference */
                if (!_or_1) {
                  sneakyThrowRuleFailedException("type1 == REAL.primitiveTypeReference || type1 == INTEGER.primitiveTypeReference");
                }
                PrimitiveTypeReference _primitiveTypeReference_9 = this.typeFactory.primitiveTypeReference(this.REAL);
                boolean _equals_10 = Objects.equal(type2, _primitiveTypeReference_9);
                /* type2 == REAL.primitiveTypeReference */
                if (!_equals_10) {
                  sneakyThrowRuleFailedException("type2 == REAL.primitiveTypeReference");
                }
                PrimitiveTypeReference _primitiveTypeReference_10 = this.typeFactory.primitiveTypeReference(this.REAL);
                result = _primitiveTypeReference_10;
              } catch (Exception e_2) {
                previousFailure = extractRuleFailedException(e_2);
                /* { type1 == REAL.primitiveTypeReference type2 == INTEGER.primitiveTypeReference || type2 == REAL.primitiveTypeReference result = REAL.primitiveTypeReference } or { type1 == INTEGER.primitiveTypeReference || type1 == REAL.primitiveTypeReference type2 == REAL.primitiveTypeReference result = REAL.primitiveTypeReference } or { type1 == INTEGER.primitiveTypeReference type2 == INTEGER.primitiveTypeReference result = INTEGER.primitiveTypeReference } */
                {
                  try {
                    PrimitiveTypeReference _primitiveTypeReference_11 = this.typeFactory.primitiveTypeReference(this.REAL);
                    boolean _equals_11 = Objects.equal(type1, _primitiveTypeReference_11);
                    /* type1 == REAL.primitiveTypeReference */
                    if (!_equals_11) {
                      sneakyThrowRuleFailedException("type1 == REAL.primitiveTypeReference");
                    }
                    boolean _or_2 = false;
                    PrimitiveTypeReference _primitiveTypeReference_12 = this.typeFactory.primitiveTypeReference(this.INTEGER);
                    boolean _equals_12 = Objects.equal(type2, _primitiveTypeReference_12);
                    if (_equals_12) {
                      _or_2 = true;
                    } else {
                      PrimitiveTypeReference _primitiveTypeReference_13 = this.typeFactory.primitiveTypeReference(this.REAL);
                      boolean _equals_13 = Objects.equal(type2, _primitiveTypeReference_13);
                      _or_2 = _equals_13;
                    }
                    /* type2 == INTEGER.primitiveTypeReference || type2 == REAL.primitiveTypeReference */
                    if (!_or_2) {
                      sneakyThrowRuleFailedException("type2 == INTEGER.primitiveTypeReference || type2 == REAL.primitiveTypeReference");
                    }
                    PrimitiveTypeReference _primitiveTypeReference_14 = this.typeFactory.primitiveTypeReference(this.REAL);
                    result = _primitiveTypeReference_14;
                  } catch (Exception e_3) {
                    previousFailure = extractRuleFailedException(e_3);
                    /* { type1 == INTEGER.primitiveTypeReference || type1 == REAL.primitiveTypeReference type2 == REAL.primitiveTypeReference result = REAL.primitiveTypeReference } or { type1 == INTEGER.primitiveTypeReference type2 == INTEGER.primitiveTypeReference result = INTEGER.primitiveTypeReference } */
                    {
                      try {
                        boolean _or_3 = false;
                        PrimitiveTypeReference _primitiveTypeReference_15 = this.typeFactory.primitiveTypeReference(this.INTEGER);
                        boolean _equals_14 = Objects.equal(type1, _primitiveTypeReference_15);
                        if (_equals_14) {
                          _or_3 = true;
                        } else {
                          PrimitiveTypeReference _primitiveTypeReference_16 = this.typeFactory.primitiveTypeReference(this.REAL);
                          boolean _equals_15 = Objects.equal(type1, _primitiveTypeReference_16);
                          _or_3 = _equals_15;
                        }
                        /* type1 == INTEGER.primitiveTypeReference || type1 == REAL.primitiveTypeReference */
                        if (!_or_3) {
                          sneakyThrowRuleFailedException("type1 == INTEGER.primitiveTypeReference || type1 == REAL.primitiveTypeReference");
                        }
                        PrimitiveTypeReference _primitiveTypeReference_17 = this.typeFactory.primitiveTypeReference(this.REAL);
                        boolean _equals_16 = Objects.equal(type2, _primitiveTypeReference_17);
                        /* type2 == REAL.primitiveTypeReference */
                        if (!_equals_16) {
                          sneakyThrowRuleFailedException("type2 == REAL.primitiveTypeReference");
                        }
                        PrimitiveTypeReference _primitiveTypeReference_18 = this.typeFactory.primitiveTypeReference(this.REAL);
                        result = _primitiveTypeReference_18;
                      } catch (Exception e_4) {
                        previousFailure = extractRuleFailedException(e_4);
                        PrimitiveTypeReference _primitiveTypeReference_19 = this.typeFactory.primitiveTypeReference(this.INTEGER);
                        boolean _equals_17 = Objects.equal(type1, _primitiveTypeReference_19);
                        /* type1 == INTEGER.primitiveTypeReference */
                        if (!_equals_17) {
                          sneakyThrowRuleFailedException("type1 == INTEGER.primitiveTypeReference");
                        }
                        PrimitiveTypeReference _primitiveTypeReference_20 = this.typeFactory.primitiveTypeReference(this.INTEGER);
                        boolean _equals_18 = Objects.equal(type2, _primitiveTypeReference_20);
                        /* type2 == INTEGER.primitiveTypeReference */
                        if (!_equals_18) {
                          sneakyThrowRuleFailedException("type2 == INTEGER.primitiveTypeReference");
                        }
                        PrimitiveTypeReference _primitiveTypeReference_21 = this.typeFactory.primitiveTypeReference(this.INTEGER);
                        result = _primitiveTypeReference_21;
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
    return new Result<IUMLTypeReference>(result);
  }
  
  protected Result<IUMLTypeReference> typeImpl(final RuleEnvironment G, final RuleApplicationTrace _trace_, final NameExpression ex) throws RuleFailedException {
    try {
    	final RuleApplicationTrace _subtrace_ = newTrace(_trace_);
    	final Result<IUMLTypeReference> _result_ = applyRuleNameExpression(G, _subtrace_, ex);
    	addToTrace(_trace_, new Provider<Object>() {
    		public Object get() {
    			return ruleName("NameExpression") + stringRepForEnv(G) + " |- " + stringRep(ex) + " : " + stringRep(_result_.getFirst());
    		}
    	});
    	addAsSubtrace(_trace_, _subtrace_);
    	return _result_;
    } catch (Exception e_applyRuleNameExpression) {
    	typeThrowException(ruleName("NameExpression") + stringRepForEnv(G) + " |- " + stringRep(ex) + " : " + "IUMLTypeReference",
    		NAMEEXPRESSION,
    		e_applyRuleNameExpression, ex, new ErrorInformation[] {new ErrorInformation(ex)});
    	return null;
    }
  }
  
  protected Result<IUMLTypeReference> applyRuleNameExpression(final RuleEnvironment G, final RuleApplicationTrace _trace_, final NameExpression ex) throws RuleFailedException {
    IUMLTypeReference result = null; // output parameter
    /* G |- ex.reference : var IUMLTypeReference varType */
    NamedElement _reference = ex.getReference();
    IUMLTypeReference varType = null;
    Result<IUMLTypeReference> result_1 = typeInternal(G, _trace_, _reference);
    checkAssignableTo(result_1.getFirst(), IUMLTypeReference.class);
    varType = (IUMLTypeReference) result_1.getFirst();
    
    result = varType;
    return new Result<IUMLTypeReference>(result);
  }
  
  protected Result<IUMLTypeReference> typeImpl(final RuleEnvironment G, final RuleApplicationTrace _trace_, final FilterExpression ex) throws RuleFailedException {
    try {
    	final RuleApplicationTrace _subtrace_ = newTrace(_trace_);
    	final Result<IUMLTypeReference> _result_ = applyRuleFilterExpression(G, _subtrace_, ex);
    	addToTrace(_trace_, new Provider<Object>() {
    		public Object get() {
    			return ruleName("FilterExpression") + stringRepForEnv(G) + " |- " + stringRep(ex) + " : " + stringRep(_result_.getFirst());
    		}
    	});
    	addAsSubtrace(_trace_, _subtrace_);
    	return _result_;
    } catch (Exception e_applyRuleFilterExpression) {
    	typeThrowException(ruleName("FilterExpression") + stringRepForEnv(G) + " |- " + stringRep(ex) + " : " + "IUMLTypeReference",
    		FILTEREXPRESSION,
    		e_applyRuleFilterExpression, ex, new ErrorInformation[] {new ErrorInformation(ex)});
    	return null;
    }
  }
  
  protected Result<IUMLTypeReference> applyRuleFilterExpression(final RuleEnvironment G, final RuleApplicationTrace _trace_, final FilterExpression ex) throws RuleFailedException {
    IUMLTypeReference result = null; // output parameter
    /* G |- ex.declaration : var IUMLTypeReference declarationType */
    Variable _declaration = ex.getDeclaration();
    IUMLTypeReference declarationType = null;
    Result<IUMLTypeReference> result_1 = typeInternal(G, _trace_, _declaration);
    checkAssignableTo(result_1.getFirst(), IUMLTypeReference.class);
    declarationType = (IUMLTypeReference) result_1.getFirst();
    
    /* G |- ex.expression : var IUMLTypeReference expType */
    Expression _expression = ex.getExpression();
    IUMLTypeReference expType = null;
    Result<IUMLTypeReference> result_2 = typeInternal(G, _trace_, _expression);
    checkAssignableTo(result_2.getFirst(), IUMLTypeReference.class);
    expType = (IUMLTypeReference) result_2.getFirst();
    
    /* G |- ex.context : var CollectionTypeReference contextType */
    Expression _context = ex.getContext();
    CollectionTypeReference contextType = null;
    Result<IUMLTypeReference> result_3 = typeInternal(G, _trace_, _context);
    checkAssignableTo(result_3.getFirst(), CollectionTypeReference.class);
    contextType = (CollectionTypeReference) result_3.getFirst();
    
    /* G |- contextType.valueType <: declarationType */
    IUMLTypeReference _valueType = contextType.getValueType();
    subtypeReferenceInternal(G, _trace_, _valueType, declarationType);
    PrimitiveTypeReference _primitiveTypeReference = this.typeFactory.primitiveTypeReference(this.BOOLEAN);
    boolean _equals = Objects.equal(expType, _primitiveTypeReference);
    /* expType == BOOLEAN.primitiveTypeReference */
    if (!_equals) {
      sneakyThrowRuleFailedException("expType == BOOLEAN.primitiveTypeReference");
    }
    result = contextType;
    return new Result<IUMLTypeReference>(result);
  }
  
  protected Result<IUMLTypeReference> typeImpl(final RuleEnvironment G, final RuleApplicationTrace _trace_, final AssignmentExpression ex) throws RuleFailedException {
    try {
    	final RuleApplicationTrace _subtrace_ = newTrace(_trace_);
    	final Result<IUMLTypeReference> _result_ = applyRuleAssignmentExpression(G, _subtrace_, ex);
    	addToTrace(_trace_, new Provider<Object>() {
    		public Object get() {
    			return ruleName("AssignmentExpression") + stringRepForEnv(G) + " |- " + stringRep(ex) + " : " + stringRep(_result_.getFirst());
    		}
    	});
    	addAsSubtrace(_trace_, _subtrace_);
    	return _result_;
    } catch (Exception e_applyRuleAssignmentExpression) {
    	typeThrowException(ruleName("AssignmentExpression") + stringRepForEnv(G) + " |- " + stringRep(ex) + " : " + "IUMLTypeReference",
    		ASSIGNMENTEXPRESSION,
    		e_applyRuleAssignmentExpression, ex, new ErrorInformation[] {new ErrorInformation(ex)});
    	return null;
    }
  }
  
  protected Result<IUMLTypeReference> applyRuleAssignmentExpression(final RuleEnvironment G, final RuleApplicationTrace _trace_, final AssignmentExpression ex) throws RuleFailedException {
    IUMLTypeReference result = null; // output parameter
    /* G |- ex.leftHandSide : var IUMLTypeReference leftType */
    LeftHandSide _leftHandSide = ex.getLeftHandSide();
    IUMLTypeReference leftType = null;
    Result<IUMLTypeReference> result_1 = typeInternal(G, _trace_, _leftHandSide);
    checkAssignableTo(result_1.getFirst(), IUMLTypeReference.class);
    leftType = (IUMLTypeReference) result_1.getFirst();
    
    /* G |- ex.rightHandSide : var IUMLTypeReference rightType */
    Expression _rightHandSide = ex.getRightHandSide();
    IUMLTypeReference rightType = null;
    Result<IUMLTypeReference> result_2 = typeInternal(G, _trace_, _rightHandSide);
    checkAssignableTo(result_2.getFirst(), IUMLTypeReference.class);
    rightType = (IUMLTypeReference) result_2.getFirst();
    
    /* G |- leftType <: rightType */
    subtypeReferenceInternal(G, _trace_, leftType, rightType);
    result = rightType;
    return new Result<IUMLTypeReference>(result);
  }
  
  protected Result<IUMLTypeReference> typeImpl(final RuleEnvironment G, final RuleApplicationTrace _trace_, final PrefixExpression ex) throws RuleFailedException {
    try {
    	final RuleApplicationTrace _subtrace_ = newTrace(_trace_);
    	final Result<IUMLTypeReference> _result_ = applyRulePrefixExpression(G, _subtrace_, ex);
    	addToTrace(_trace_, new Provider<Object>() {
    		public Object get() {
    			return ruleName("PrefixExpression") + stringRepForEnv(G) + " |- " + stringRep(ex) + " : " + stringRep(_result_.getFirst());
    		}
    	});
    	addAsSubtrace(_trace_, _subtrace_);
    	return _result_;
    } catch (Exception e_applyRulePrefixExpression) {
    	typeThrowException(ruleName("PrefixExpression") + stringRepForEnv(G) + " |- " + stringRep(ex) + " : " + "IUMLTypeReference",
    		PREFIXEXPRESSION,
    		e_applyRulePrefixExpression, ex, new ErrorInformation[] {new ErrorInformation(ex)});
    	return null;
    }
  }
  
  protected Result<IUMLTypeReference> applyRulePrefixExpression(final RuleEnvironment G, final RuleApplicationTrace _trace_, final PrefixExpression ex) throws RuleFailedException {
    IUMLTypeReference result = null; // output parameter
    /* G |- ex.operand : var IUMLTypeReference opType */
    LeftHandSide _operand = ex.getOperand();
    IUMLTypeReference opType = null;
    Result<IUMLTypeReference> result_1 = typeInternal(G, _trace_, _operand);
    checkAssignableTo(result_1.getFirst(), IUMLTypeReference.class);
    opType = (IUMLTypeReference) result_1.getFirst();
    
    PrimitiveTypeReference _primitiveTypeReference = this.typeFactory.primitiveTypeReference(this.INTEGER);
    boolean _equals = Objects.equal(opType, _primitiveTypeReference);
    /* opType == INTEGER.primitiveTypeReference */
    if (!_equals) {
      sneakyThrowRuleFailedException("opType == INTEGER.primitiveTypeReference");
    }
    PrimitiveTypeReference _primitiveTypeReference_1 = this.typeFactory.primitiveTypeReference(this.INTEGER);
    result = _primitiveTypeReference_1;
    return new Result<IUMLTypeReference>(result);
  }
  
  protected Result<IUMLTypeReference> typeImpl(final RuleEnvironment G, final RuleApplicationTrace _trace_, final PostfixExpression ex) throws RuleFailedException {
    try {
    	final RuleApplicationTrace _subtrace_ = newTrace(_trace_);
    	final Result<IUMLTypeReference> _result_ = applyRulePostfixExpression(G, _subtrace_, ex);
    	addToTrace(_trace_, new Provider<Object>() {
    		public Object get() {
    			return ruleName("PostfixExpression") + stringRepForEnv(G) + " |- " + stringRep(ex) + " : " + stringRep(_result_.getFirst());
    		}
    	});
    	addAsSubtrace(_trace_, _subtrace_);
    	return _result_;
    } catch (Exception e_applyRulePostfixExpression) {
    	typeThrowException(ruleName("PostfixExpression") + stringRepForEnv(G) + " |- " + stringRep(ex) + " : " + "IUMLTypeReference",
    		POSTFIXEXPRESSION,
    		e_applyRulePostfixExpression, ex, new ErrorInformation[] {new ErrorInformation(ex)});
    	return null;
    }
  }
  
  protected Result<IUMLTypeReference> applyRulePostfixExpression(final RuleEnvironment G, final RuleApplicationTrace _trace_, final PostfixExpression ex) throws RuleFailedException {
    IUMLTypeReference result = null; // output parameter
    /* G |- ex.operand : var IUMLTypeReference opType */
    LeftHandSide _operand = ex.getOperand();
    IUMLTypeReference opType = null;
    Result<IUMLTypeReference> result_1 = typeInternal(G, _trace_, _operand);
    checkAssignableTo(result_1.getFirst(), IUMLTypeReference.class);
    opType = (IUMLTypeReference) result_1.getFirst();
    
    PrimitiveTypeReference _primitiveTypeReference = this.typeFactory.primitiveTypeReference(this.INTEGER);
    boolean _equals = Objects.equal(opType, _primitiveTypeReference);
    /* opType == INTEGER.primitiveTypeReference */
    if (!_equals) {
      sneakyThrowRuleFailedException("opType == INTEGER.primitiveTypeReference");
    }
    PrimitiveTypeReference _primitiveTypeReference_1 = this.typeFactory.primitiveTypeReference(this.INTEGER);
    result = _primitiveTypeReference_1;
    return new Result<IUMLTypeReference>(result);
  }
  
  protected Result<IUMLTypeReference> typeImpl(final RuleEnvironment G, final RuleApplicationTrace _trace_, final ShiftExpression ex) throws RuleFailedException {
    try {
    	final RuleApplicationTrace _subtrace_ = newTrace(_trace_);
    	final Result<IUMLTypeReference> _result_ = applyRuleShiftExpression(G, _subtrace_, ex);
    	addToTrace(_trace_, new Provider<Object>() {
    		public Object get() {
    			return ruleName("ShiftExpression") + stringRepForEnv(G) + " |- " + stringRep(ex) + " : " + stringRep(_result_.getFirst());
    		}
    	});
    	addAsSubtrace(_trace_, _subtrace_);
    	return _result_;
    } catch (Exception e_applyRuleShiftExpression) {
    	typeThrowException(ruleName("ShiftExpression") + stringRepForEnv(G) + " |- " + stringRep(ex) + " : " + "IUMLTypeReference",
    		SHIFTEXPRESSION,
    		e_applyRuleShiftExpression, ex, new ErrorInformation[] {new ErrorInformation(ex)});
    	return null;
    }
  }
  
  protected Result<IUMLTypeReference> applyRuleShiftExpression(final RuleEnvironment G, final RuleApplicationTrace _trace_, final ShiftExpression ex) throws RuleFailedException {
    IUMLTypeReference result = null; // output parameter
    /* G |- ex.operand1 : var IUMLTypeReference op1Type */
    Expression _operand1 = ex.getOperand1();
    IUMLTypeReference op1Type = null;
    Result<IUMLTypeReference> result_1 = typeInternal(G, _trace_, _operand1);
    checkAssignableTo(result_1.getFirst(), IUMLTypeReference.class);
    op1Type = (IUMLTypeReference) result_1.getFirst();
    
    /* G |- ex.operand2 : var IUMLTypeReference op2Type */
    Expression _operand2 = ex.getOperand2();
    IUMLTypeReference op2Type = null;
    Result<IUMLTypeReference> result_2 = typeInternal(G, _trace_, _operand2);
    checkAssignableTo(result_2.getFirst(), IUMLTypeReference.class);
    op2Type = (IUMLTypeReference) result_2.getFirst();
    
    PrimitiveTypeReference _primitiveTypeReference = this.typeFactory.primitiveTypeReference(this.INTEGER);
    boolean _equals = Objects.equal(op1Type, _primitiveTypeReference);
    /* op1Type == INTEGER.primitiveTypeReference */
    if (!_equals) {
      sneakyThrowRuleFailedException("op1Type == INTEGER.primitiveTypeReference");
    }
    PrimitiveTypeReference _primitiveTypeReference_1 = this.typeFactory.primitiveTypeReference(this.INTEGER);
    boolean _equals_1 = Objects.equal(op2Type, _primitiveTypeReference_1);
    /* op2Type == INTEGER.primitiveTypeReference */
    if (!_equals_1) {
      sneakyThrowRuleFailedException("op2Type == INTEGER.primitiveTypeReference");
    }
    PrimitiveTypeReference _primitiveTypeReference_2 = this.typeFactory.primitiveTypeReference(this.INTEGER);
    result = _primitiveTypeReference_2;
    return new Result<IUMLTypeReference>(result);
  }
  
  protected Result<IUMLTypeReference> typeImpl(final RuleEnvironment G, final RuleApplicationTrace _trace_, final EqualityExpression ex) throws RuleFailedException {
    try {
    	final RuleApplicationTrace _subtrace_ = newTrace(_trace_);
    	final Result<IUMLTypeReference> _result_ = applyRuleEqualityExpression(G, _subtrace_, ex);
    	addToTrace(_trace_, new Provider<Object>() {
    		public Object get() {
    			return ruleName("EqualityExpression") + stringRepForEnv(G) + " |- " + stringRep(ex) + " : " + stringRep(_result_.getFirst());
    		}
    	});
    	addAsSubtrace(_trace_, _subtrace_);
    	return _result_;
    } catch (Exception e_applyRuleEqualityExpression) {
    	typeThrowException(ruleName("EqualityExpression") + stringRepForEnv(G) + " |- " + stringRep(ex) + " : " + "IUMLTypeReference",
    		EQUALITYEXPRESSION,
    		e_applyRuleEqualityExpression, ex, new ErrorInformation[] {new ErrorInformation(ex)});
    	return null;
    }
  }
  
  protected Result<IUMLTypeReference> applyRuleEqualityExpression(final RuleEnvironment G, final RuleApplicationTrace _trace_, final EqualityExpression ex) throws RuleFailedException {
    IUMLTypeReference result = null; // output parameter
    /* G |- ex.operand1 : var IUMLTypeReference op1Type */
    Expression _operand1 = ex.getOperand1();
    IUMLTypeReference op1Type = null;
    Result<IUMLTypeReference> result_1 = typeInternal(G, _trace_, _operand1);
    checkAssignableTo(result_1.getFirst(), IUMLTypeReference.class);
    op1Type = (IUMLTypeReference) result_1.getFirst();
    
    /* G |- ex.operand2 : var IUMLTypeReference op2Type */
    Expression _operand2 = ex.getOperand2();
    IUMLTypeReference op2Type = null;
    Result<IUMLTypeReference> result_2 = typeInternal(G, _trace_, _operand2);
    checkAssignableTo(result_2.getFirst(), IUMLTypeReference.class);
    op2Type = (IUMLTypeReference) result_2.getFirst();
    
    /* G |- op1Type <: op2Type or G |- op2Type <: op1Type */
    {
      RuleFailedException previousFailure = null;
      try {
        /* G |- op1Type <: op2Type */
        subtypeReferenceInternal(G, _trace_, op1Type, op2Type);
      } catch (Exception e) {
        previousFailure = extractRuleFailedException(e);
        /* G |- op2Type <: op1Type */
        subtypeReferenceInternal(G, _trace_, op2Type, op1Type);
      }
    }
    PrimitiveTypeReference _primitiveTypeReference = this.typeFactory.primitiveTypeReference(this.BOOLEAN);
    result = _primitiveTypeReference;
    return new Result<IUMLTypeReference>(result);
  }
  
  protected Result<IUMLTypeReference> typeImpl(final RuleEnvironment G, final RuleApplicationTrace _trace_, final RelationalExpression ex) throws RuleFailedException {
    try {
    	final RuleApplicationTrace _subtrace_ = newTrace(_trace_);
    	final Result<IUMLTypeReference> _result_ = applyRuleRelationalExpression(G, _subtrace_, ex);
    	addToTrace(_trace_, new Provider<Object>() {
    		public Object get() {
    			return ruleName("RelationalExpression") + stringRepForEnv(G) + " |- " + stringRep(ex) + " : " + stringRep(_result_.getFirst());
    		}
    	});
    	addAsSubtrace(_trace_, _subtrace_);
    	return _result_;
    } catch (Exception e_applyRuleRelationalExpression) {
    	typeThrowException(ruleName("RelationalExpression") + stringRepForEnv(G) + " |- " + stringRep(ex) + " : " + "IUMLTypeReference",
    		RELATIONALEXPRESSION,
    		e_applyRuleRelationalExpression, ex, new ErrorInformation[] {new ErrorInformation(ex)});
    	return null;
    }
  }
  
  protected Result<IUMLTypeReference> applyRuleRelationalExpression(final RuleEnvironment G, final RuleApplicationTrace _trace_, final RelationalExpression ex) throws RuleFailedException {
    IUMLTypeReference result = null; // output parameter
    /* G |- ex.operand1 : var IUMLTypeReference op1Type */
    Expression _operand1 = ex.getOperand1();
    IUMLTypeReference op1Type = null;
    Result<IUMLTypeReference> result_1 = typeInternal(G, _trace_, _operand1);
    checkAssignableTo(result_1.getFirst(), IUMLTypeReference.class);
    op1Type = (IUMLTypeReference) result_1.getFirst();
    
    /* G |- ex.operand2 : var IUMLTypeReference op2Type */
    Expression _operand2 = ex.getOperand2();
    IUMLTypeReference op2Type = null;
    Result<IUMLTypeReference> result_2 = typeInternal(G, _trace_, _operand2);
    checkAssignableTo(result_2.getFirst(), IUMLTypeReference.class);
    op2Type = (IUMLTypeReference) result_2.getFirst();
    
    boolean _or = false;
    PrimitiveTypeReference _primitiveTypeReference = this.typeFactory.primitiveTypeReference(this.INTEGER);
    boolean _equals = Objects.equal(op1Type, _primitiveTypeReference);
    if (_equals) {
      _or = true;
    } else {
      PrimitiveTypeReference _primitiveTypeReference_1 = this.typeFactory.primitiveTypeReference(this.REAL);
      boolean _equals_1 = Objects.equal(op1Type, _primitiveTypeReference_1);
      _or = _equals_1;
    }
    /* op1Type == INTEGER.primitiveTypeReference || op1Type == REAL.primitiveTypeReference */
    if (!_or) {
      sneakyThrowRuleFailedException("op1Type == INTEGER.primitiveTypeReference || op1Type == REAL.primitiveTypeReference");
    }
    boolean _or_1 = false;
    PrimitiveTypeReference _primitiveTypeReference_2 = this.typeFactory.primitiveTypeReference(this.INTEGER);
    boolean _equals_2 = Objects.equal(op2Type, _primitiveTypeReference_2);
    if (_equals_2) {
      _or_1 = true;
    } else {
      PrimitiveTypeReference _primitiveTypeReference_3 = this.typeFactory.primitiveTypeReference(this.REAL);
      boolean _equals_3 = Objects.equal(op2Type, _primitiveTypeReference_3);
      _or_1 = _equals_3;
    }
    /* op2Type == INTEGER.primitiveTypeReference || op2Type == REAL.primitiveTypeReference */
    if (!_or_1) {
      sneakyThrowRuleFailedException("op2Type == INTEGER.primitiveTypeReference || op2Type == REAL.primitiveTypeReference");
    }
    PrimitiveTypeReference _primitiveTypeReference_4 = this.typeFactory.primitiveTypeReference(this.BOOLEAN);
    result = _primitiveTypeReference_4;
    return new Result<IUMLTypeReference>(result);
  }
  
  protected Result<IUMLTypeReference> typeImpl(final RuleEnvironment G, final RuleApplicationTrace _trace_, final BooleanUnaryExpression ex) throws RuleFailedException {
    try {
    	final RuleApplicationTrace _subtrace_ = newTrace(_trace_);
    	final Result<IUMLTypeReference> _result_ = applyRuleLogicalUnaryExpression(G, _subtrace_, ex);
    	addToTrace(_trace_, new Provider<Object>() {
    		public Object get() {
    			return ruleName("LogicalUnaryExpression") + stringRepForEnv(G) + " |- " + stringRep(ex) + " : " + stringRep(_result_.getFirst());
    		}
    	});
    	addAsSubtrace(_trace_, _subtrace_);
    	return _result_;
    } catch (Exception e_applyRuleLogicalUnaryExpression) {
    	typeThrowException(ruleName("LogicalUnaryExpression") + stringRepForEnv(G) + " |- " + stringRep(ex) + " : " + "IUMLTypeReference",
    		LOGICALUNARYEXPRESSION,
    		e_applyRuleLogicalUnaryExpression, ex, new ErrorInformation[] {new ErrorInformation(ex)});
    	return null;
    }
  }
  
  protected Result<IUMLTypeReference> applyRuleLogicalUnaryExpression(final RuleEnvironment G, final RuleApplicationTrace _trace_, final BooleanUnaryExpression ex) throws RuleFailedException {
    IUMLTypeReference result = null; // output parameter
    /* G |- ex.operand : var IUMLTypeReference opType */
    Expression _operand = ex.getOperand();
    IUMLTypeReference opType = null;
    Result<IUMLTypeReference> result_1 = typeInternal(G, _trace_, _operand);
    checkAssignableTo(result_1.getFirst(), IUMLTypeReference.class);
    opType = (IUMLTypeReference) result_1.getFirst();
    
    PrimitiveTypeReference _primitiveTypeReference = this.typeFactory.primitiveTypeReference(this.BOOLEAN);
    boolean _equals = Objects.equal(opType, _primitiveTypeReference);
    /* opType == BOOLEAN.primitiveTypeReference */
    if (!_equals) {
      sneakyThrowRuleFailedException("opType == BOOLEAN.primitiveTypeReference");
    }
    PrimitiveTypeReference _primitiveTypeReference_1 = this.typeFactory.primitiveTypeReference(this.BOOLEAN);
    result = _primitiveTypeReference_1;
    return new Result<IUMLTypeReference>(result);
  }
  
  protected Result<IUMLTypeReference> typeImpl(final RuleEnvironment G, final RuleApplicationTrace _trace_, final LogicalExpression ex) throws RuleFailedException {
    try {
    	final RuleApplicationTrace _subtrace_ = newTrace(_trace_);
    	final Result<IUMLTypeReference> _result_ = applyRuleLogicalExpression(G, _subtrace_, ex);
    	addToTrace(_trace_, new Provider<Object>() {
    		public Object get() {
    			return ruleName("LogicalExpression") + stringRepForEnv(G) + " |- " + stringRep(ex) + " : " + stringRep(_result_.getFirst());
    		}
    	});
    	addAsSubtrace(_trace_, _subtrace_);
    	return _result_;
    } catch (Exception e_applyRuleLogicalExpression) {
    	typeThrowException(ruleName("LogicalExpression") + stringRepForEnv(G) + " |- " + stringRep(ex) + " : " + "IUMLTypeReference",
    		LOGICALEXPRESSION,
    		e_applyRuleLogicalExpression, ex, new ErrorInformation[] {new ErrorInformation(ex)});
    	return null;
    }
  }
  
  protected Result<IUMLTypeReference> applyRuleLogicalExpression(final RuleEnvironment G, final RuleApplicationTrace _trace_, final LogicalExpression ex) throws RuleFailedException {
    IUMLTypeReference result = null; // output parameter
    /* G |- ex.operand1 : var IUMLTypeReference op1Type */
    Expression _operand1 = ex.getOperand1();
    IUMLTypeReference op1Type = null;
    Result<IUMLTypeReference> result_1 = typeInternal(G, _trace_, _operand1);
    checkAssignableTo(result_1.getFirst(), IUMLTypeReference.class);
    op1Type = (IUMLTypeReference) result_1.getFirst();
    
    /* G |- ex.operand2 : var IUMLTypeReference op2Type */
    Expression _operand2 = ex.getOperand2();
    IUMLTypeReference op2Type = null;
    Result<IUMLTypeReference> result_2 = typeInternal(G, _trace_, _operand2);
    checkAssignableTo(result_2.getFirst(), IUMLTypeReference.class);
    op2Type = (IUMLTypeReference) result_2.getFirst();
    
    /* { op1Type == BOOLEAN.primitiveTypeReference op2Type == BOOLEAN.primitiveTypeReference result = BOOLEAN.primitiveTypeReference } or { op1Type == INTEGER.primitiveTypeReference op2Type == INTEGER.primitiveTypeReference result = INTEGER.primitiveTypeReference } */
    {
      RuleFailedException previousFailure = null;
      try {
        PrimitiveTypeReference _primitiveTypeReference = this.typeFactory.primitiveTypeReference(this.BOOLEAN);
        boolean _equals = Objects.equal(op1Type, _primitiveTypeReference);
        /* op1Type == BOOLEAN.primitiveTypeReference */
        if (!_equals) {
          sneakyThrowRuleFailedException("op1Type == BOOLEAN.primitiveTypeReference");
        }
        PrimitiveTypeReference _primitiveTypeReference_1 = this.typeFactory.primitiveTypeReference(this.BOOLEAN);
        boolean _equals_1 = Objects.equal(op2Type, _primitiveTypeReference_1);
        /* op2Type == BOOLEAN.primitiveTypeReference */
        if (!_equals_1) {
          sneakyThrowRuleFailedException("op2Type == BOOLEAN.primitiveTypeReference");
        }
        PrimitiveTypeReference _primitiveTypeReference_2 = this.typeFactory.primitiveTypeReference(this.BOOLEAN);
        result = _primitiveTypeReference_2;
      } catch (Exception e) {
        previousFailure = extractRuleFailedException(e);
        PrimitiveTypeReference _primitiveTypeReference_3 = this.typeFactory.primitiveTypeReference(this.INTEGER);
        boolean _equals_2 = Objects.equal(op1Type, _primitiveTypeReference_3);
        /* op1Type == INTEGER.primitiveTypeReference */
        if (!_equals_2) {
          sneakyThrowRuleFailedException("op1Type == INTEGER.primitiveTypeReference");
        }
        PrimitiveTypeReference _primitiveTypeReference_4 = this.typeFactory.primitiveTypeReference(this.INTEGER);
        boolean _equals_3 = Objects.equal(op2Type, _primitiveTypeReference_4);
        /* op2Type == INTEGER.primitiveTypeReference */
        if (!_equals_3) {
          sneakyThrowRuleFailedException("op2Type == INTEGER.primitiveTypeReference");
        }
        PrimitiveTypeReference _primitiveTypeReference_5 = this.typeFactory.primitiveTypeReference(this.INTEGER);
        result = _primitiveTypeReference_5;
      }
    }
    return new Result<IUMLTypeReference>(result);
  }
  
  protected Result<IUMLTypeReference> typeImpl(final RuleEnvironment G, final RuleApplicationTrace _trace_, final ConditionalLogicalExpression ex) throws RuleFailedException {
    try {
    	final RuleApplicationTrace _subtrace_ = newTrace(_trace_);
    	final Result<IUMLTypeReference> _result_ = applyRuleConditionalLogicalExpression(G, _subtrace_, ex);
    	addToTrace(_trace_, new Provider<Object>() {
    		public Object get() {
    			return ruleName("ConditionalLogicalExpression") + stringRepForEnv(G) + " |- " + stringRep(ex) + " : " + stringRep(_result_.getFirst());
    		}
    	});
    	addAsSubtrace(_trace_, _subtrace_);
    	return _result_;
    } catch (Exception e_applyRuleConditionalLogicalExpression) {
    	typeThrowException(ruleName("ConditionalLogicalExpression") + stringRepForEnv(G) + " |- " + stringRep(ex) + " : " + "IUMLTypeReference",
    		CONDITIONALLOGICALEXPRESSION,
    		e_applyRuleConditionalLogicalExpression, ex, new ErrorInformation[] {new ErrorInformation(ex)});
    	return null;
    }
  }
  
  protected Result<IUMLTypeReference> applyRuleConditionalLogicalExpression(final RuleEnvironment G, final RuleApplicationTrace _trace_, final ConditionalLogicalExpression ex) throws RuleFailedException {
    IUMLTypeReference result = null; // output parameter
    /* G |- ex.operand1 : var IUMLTypeReference op1Type */
    Expression _operand1 = ex.getOperand1();
    IUMLTypeReference op1Type = null;
    Result<IUMLTypeReference> result_1 = typeInternal(G, _trace_, _operand1);
    checkAssignableTo(result_1.getFirst(), IUMLTypeReference.class);
    op1Type = (IUMLTypeReference) result_1.getFirst();
    
    /* G |- ex.operand2 : var IUMLTypeReference op2Type */
    Expression _operand2 = ex.getOperand2();
    IUMLTypeReference op2Type = null;
    Result<IUMLTypeReference> result_2 = typeInternal(G, _trace_, _operand2);
    checkAssignableTo(result_2.getFirst(), IUMLTypeReference.class);
    op2Type = (IUMLTypeReference) result_2.getFirst();
    
    PrimitiveTypeReference _primitiveTypeReference = this.typeFactory.primitiveTypeReference(this.BOOLEAN);
    boolean _equals = Objects.equal(op1Type, _primitiveTypeReference);
    /* op1Type == BOOLEAN.primitiveTypeReference */
    if (!_equals) {
      sneakyThrowRuleFailedException("op1Type == BOOLEAN.primitiveTypeReference");
    }
    PrimitiveTypeReference _primitiveTypeReference_1 = this.typeFactory.primitiveTypeReference(this.BOOLEAN);
    boolean _equals_1 = Objects.equal(op2Type, _primitiveTypeReference_1);
    /* op2Type == BOOLEAN.primitiveTypeReference */
    if (!_equals_1) {
      sneakyThrowRuleFailedException("op2Type == BOOLEAN.primitiveTypeReference");
    }
    PrimitiveTypeReference _primitiveTypeReference_2 = this.typeFactory.primitiveTypeReference(this.BOOLEAN);
    result = _primitiveTypeReference_2;
    return new Result<IUMLTypeReference>(result);
  }
  
  protected Result<IUMLTypeReference> typeImpl(final RuleEnvironment G, final RuleApplicationTrace _trace_, final ConditionalTestExpression ex) throws RuleFailedException {
    try {
    	final RuleApplicationTrace _subtrace_ = newTrace(_trace_);
    	final Result<IUMLTypeReference> _result_ = applyRuleConditionalTestExpression(G, _subtrace_, ex);
    	addToTrace(_trace_, new Provider<Object>() {
    		public Object get() {
    			return ruleName("ConditionalTestExpression") + stringRepForEnv(G) + " |- " + stringRep(ex) + " : " + stringRep(_result_.getFirst());
    		}
    	});
    	addAsSubtrace(_trace_, _subtrace_);
    	return _result_;
    } catch (Exception e_applyRuleConditionalTestExpression) {
    	typeThrowException(ruleName("ConditionalTestExpression") + stringRepForEnv(G) + " |- " + stringRep(ex) + " : " + "IUMLTypeReference",
    		CONDITIONALTESTEXPRESSION,
    		e_applyRuleConditionalTestExpression, ex, new ErrorInformation[] {new ErrorInformation(ex)});
    	return null;
    }
  }
  
  protected Result<IUMLTypeReference> applyRuleConditionalTestExpression(final RuleEnvironment G, final RuleApplicationTrace _trace_, final ConditionalTestExpression ex) throws RuleFailedException {
    IUMLTypeReference result = null; // output parameter
    /* G |- ex.operand1 : var IUMLTypeReference condType */
    Expression _operand1 = ex.getOperand1();
    IUMLTypeReference condType = null;
    Result<IUMLTypeReference> result_1 = typeInternal(G, _trace_, _operand1);
    checkAssignableTo(result_1.getFirst(), IUMLTypeReference.class);
    condType = (IUMLTypeReference) result_1.getFirst();
    
    /* G |- ex.operand2 : var IUMLTypeReference trueType */
    Expression _operand2 = ex.getOperand2();
    IUMLTypeReference trueType = null;
    Result<IUMLTypeReference> result_2 = typeInternal(G, _trace_, _operand2);
    checkAssignableTo(result_2.getFirst(), IUMLTypeReference.class);
    trueType = (IUMLTypeReference) result_2.getFirst();
    
    /* G |- ex.operand3 : var IUMLTypeReference falseType */
    Expression _operand3 = ex.getOperand3();
    IUMLTypeReference falseType = null;
    Result<IUMLTypeReference> result_3 = typeInternal(G, _trace_, _operand3);
    checkAssignableTo(result_3.getFirst(), IUMLTypeReference.class);
    falseType = (IUMLTypeReference) result_3.getFirst();
    
    /* G |- trueType <: falseType */
    subtypeReferenceInternal(G, _trace_, trueType, falseType);
    PrimitiveTypeReference _primitiveTypeReference = this.typeFactory.primitiveTypeReference(this.BOOLEAN);
    boolean _equals = Objects.equal(condType, _primitiveTypeReference);
    /* condType == BOOLEAN.primitiveTypeReference */
    if (!_equals) {
      sneakyThrowRuleFailedException("condType == BOOLEAN.primitiveTypeReference");
    }
    result = trueType;
    return new Result<IUMLTypeReference>(result);
  }
  
  protected Result<IUMLTypeReference> typeImpl(final RuleEnvironment G, final RuleApplicationTrace _trace_, final InstanceCreationExpression ex) throws RuleFailedException {
    try {
    	final RuleApplicationTrace _subtrace_ = newTrace(_trace_);
    	final Result<IUMLTypeReference> _result_ = applyRuleInstanceCreationExpression(G, _subtrace_, ex);
    	addToTrace(_trace_, new Provider<Object>() {
    		public Object get() {
    			return ruleName("InstanceCreationExpression") + stringRepForEnv(G) + " |- " + stringRep(ex) + " : " + stringRep(_result_.getFirst());
    		}
    	});
    	addAsSubtrace(_trace_, _subtrace_);
    	return _result_;
    } catch (Exception e_applyRuleInstanceCreationExpression) {
    	typeThrowException(ruleName("InstanceCreationExpression") + stringRepForEnv(G) + " |- " + stringRep(ex) + " : " + "IUMLTypeReference",
    		INSTANCECREATIONEXPRESSION,
    		e_applyRuleInstanceCreationExpression, ex, new ErrorInformation[] {new ErrorInformation(ex)});
    	return null;
    }
  }
  
  protected Result<IUMLTypeReference> applyRuleInstanceCreationExpression(final RuleEnvironment G, final RuleApplicationTrace _trace_, final InstanceCreationExpression ex) throws RuleFailedException {
    IUMLTypeReference result = null; // output parameter
    Classifier _instance = ex.getInstance();
    /* !(ex.instance instanceof PrimitiveType) */
    if (!(!(_instance instanceof PrimitiveType))) {
      sneakyThrowRuleFailedException("!(ex.instance instanceof PrimitiveType)");
    }
    ex.getTuple();
    Classifier _instance_1 = ex.getInstance();
    IUMLTypeReference _typeReference = this.typeFactory.typeReference(_instance_1);
    result = _typeReference;
    return new Result<IUMLTypeReference>(result);
  }
  
  protected Result<IUMLTypeReference> typeImpl(final RuleEnvironment G, final RuleApplicationTrace _trace_, final InstanceDeletionExpression ex) throws RuleFailedException {
    try {
    	final RuleApplicationTrace _subtrace_ = newTrace(_trace_);
    	final Result<IUMLTypeReference> _result_ = applyRuleInstanceDeletionExpression(G, _subtrace_, ex);
    	addToTrace(_trace_, new Provider<Object>() {
    		public Object get() {
    			return ruleName("InstanceDeletionExpression") + stringRepForEnv(G) + " |- " + stringRep(ex) + " : " + stringRep(_result_.getFirst());
    		}
    	});
    	addAsSubtrace(_trace_, _subtrace_);
    	return _result_;
    } catch (Exception e_applyRuleInstanceDeletionExpression) {
    	typeThrowException(ruleName("InstanceDeletionExpression") + stringRepForEnv(G) + " |- " + stringRep(ex) + " : " + "IUMLTypeReference",
    		INSTANCEDELETIONEXPRESSION,
    		e_applyRuleInstanceDeletionExpression, ex, new ErrorInformation[] {new ErrorInformation(ex)});
    	return null;
    }
  }
  
  protected Result<IUMLTypeReference> applyRuleInstanceDeletionExpression(final RuleEnvironment G, final RuleApplicationTrace _trace_, final InstanceDeletionExpression ex) throws RuleFailedException {
    IUMLTypeReference result = null; // output parameter
    /* G |- ex.reference : var UMLTypeReference refType */
    Expression _reference = ex.getReference();
    UMLTypeReference refType = null;
    Result<IUMLTypeReference> result_1 = typeInternal(G, _trace_, _reference);
    checkAssignableTo(result_1.getFirst(), UMLTypeReference.class);
    refType = (UMLTypeReference) result_1.getFirst();
    
    Type _umlType = refType.getUmlType();
    /* !(refType.umlType instanceof PrimitiveType) */
    if (!(!(_umlType instanceof PrimitiveType))) {
      sneakyThrowRuleFailedException("!(refType.umlType instanceof PrimitiveType)");
    }
    IUMLTypeReference.VoidTypeReference _voidType = this.typeFactory.voidType();
    result = _voidType;
    return new Result<IUMLTypeReference>(result);
  }
  
  protected Result<IUMLTypeReference> typeImpl(final RuleEnvironment G, final RuleApplicationTrace _trace_, final ThisExpression ex) throws RuleFailedException {
    try {
    	final RuleApplicationTrace _subtrace_ = newTrace(_trace_);
    	final Result<IUMLTypeReference> _result_ = applyRuleThisExpression(G, _subtrace_, ex);
    	addToTrace(_trace_, new Provider<Object>() {
    		public Object get() {
    			return ruleName("ThisExpression") + stringRepForEnv(G) + " |- " + stringRep(ex) + " : " + stringRep(_result_.getFirst());
    		}
    	});
    	addAsSubtrace(_trace_, _subtrace_);
    	return _result_;
    } catch (Exception e_applyRuleThisExpression) {
    	typeThrowException(ruleName("ThisExpression") + stringRepForEnv(G) + " |- " + stringRep(ex) + " : " + "IUMLTypeReference",
    		THISEXPRESSION,
    		e_applyRuleThisExpression, ex, new ErrorInformation[] {new ErrorInformation(ex)});
    	return null;
    }
  }
  
  protected Result<IUMLTypeReference> applyRuleThisExpression(final RuleEnvironment G, final RuleApplicationTrace _trace_, final ThisExpression ex) throws RuleFailedException {
    IUMLTypeReference result = null; // output parameter
    org.eclipse.uml2.uml.Class _thisType = this.umlContext.getThisType();
    boolean _equals = Objects.equal(_thisType, null);
    if (_equals) {
      IUMLTypeReference.AnyTypeReference _anyType = this.typeFactory.anyType();
      result = _anyType;
    } else {
      org.eclipse.uml2.uml.Class _thisType_1 = this.umlContext.getThisType();
      IUMLTypeReference _typeReference = this.typeFactory.typeReference(_thisType_1);
      result = _typeReference;
    }
    return new Result<IUMLTypeReference>(result);
  }
  
  protected Result<IUMLTypeReference> typeImpl(final RuleEnvironment G, final RuleApplicationTrace _trace_, final PropertyAccessExpression ex) throws RuleFailedException {
    try {
    	final RuleApplicationTrace _subtrace_ = newTrace(_trace_);
    	final Result<IUMLTypeReference> _result_ = applyRulePropertyAccessExpression(G, _subtrace_, ex);
    	addToTrace(_trace_, new Provider<Object>() {
    		public Object get() {
    			return ruleName("PropertyAccessExpression") + stringRepForEnv(G) + " |- " + stringRep(ex) + " : " + stringRep(_result_.getFirst());
    		}
    	});
    	addAsSubtrace(_trace_, _subtrace_);
    	return _result_;
    } catch (Exception e_applyRulePropertyAccessExpression) {
    	typeThrowException(ruleName("PropertyAccessExpression") + stringRepForEnv(G) + " |- " + stringRep(ex) + " : " + "IUMLTypeReference",
    		PROPERTYACCESSEXPRESSION,
    		e_applyRulePropertyAccessExpression, ex, new ErrorInformation[] {new ErrorInformation(ex)});
    	return null;
    }
  }
  
  protected Result<IUMLTypeReference> applyRulePropertyAccessExpression(final RuleEnvironment G, final RuleApplicationTrace _trace_, final PropertyAccessExpression ex) throws RuleFailedException {
    IUMLTypeReference result = null; // output parameter
    /* { !ex.property.multivalued result = ex.property.type.typeReference } or { ex.property.multivalued && ex.property.ordered result = ex.property.type.sequenceOf } or { ex.property.multivalued && !ex.property.ordered && ex.property.unique result = ex.property.type.setOf } or { ex.property.multivalued && !ex.property.ordered && !ex.property.unique result = ex.property.type.bagOf } */
    {
      RuleFailedException previousFailure = null;
      try {
        Property _property = ex.getProperty();
        boolean _isMultivalued = _property.isMultivalued();
        boolean _not = (!_isMultivalued);
        /* !ex.property.multivalued */
        if (!_not) {
          sneakyThrowRuleFailedException("!ex.property.multivalued");
        }
        Property _property_1 = ex.getProperty();
        Type _type = _property_1.getType();
        IUMLTypeReference _typeReference = this.typeFactory.typeReference(_type);
        result = _typeReference;
      } catch (Exception e) {
        previousFailure = extractRuleFailedException(e);
        /* { ex.property.multivalued && ex.property.ordered result = ex.property.type.sequenceOf } or { ex.property.multivalued && !ex.property.ordered && ex.property.unique result = ex.property.type.setOf } or { ex.property.multivalued && !ex.property.ordered && !ex.property.unique result = ex.property.type.bagOf } */
        {
          try {
            boolean _and = false;
            Property _property_2 = ex.getProperty();
            boolean _isMultivalued_1 = _property_2.isMultivalued();
            if (!_isMultivalued_1) {
              _and = false;
            } else {
              Property _property_3 = ex.getProperty();
              boolean _isOrdered = _property_3.isOrdered();
              _and = _isOrdered;
            }
            /* ex.property.multivalued && ex.property.ordered */
            if (!_and) {
              sneakyThrowRuleFailedException("ex.property.multivalued && ex.property.ordered");
            }
            Property _property_4 = ex.getProperty();
            Type _type_1 = _property_4.getType();
            CollectionTypeReference _sequenceOf = this.typeFactory.sequenceOf(_type_1);
            result = _sequenceOf;
          } catch (Exception e_1) {
            previousFailure = extractRuleFailedException(e_1);
            /* { ex.property.multivalued && !ex.property.ordered && ex.property.unique result = ex.property.type.setOf } or { ex.property.multivalued && !ex.property.ordered && !ex.property.unique result = ex.property.type.bagOf } */
            {
              try {
                boolean _and_1 = false;
                boolean _and_2 = false;
                Property _property_5 = ex.getProperty();
                boolean _isMultivalued_2 = _property_5.isMultivalued();
                if (!_isMultivalued_2) {
                  _and_2 = false;
                } else {
                  Property _property_6 = ex.getProperty();
                  boolean _isOrdered_1 = _property_6.isOrdered();
                  boolean _not_1 = (!_isOrdered_1);
                  _and_2 = _not_1;
                }
                if (!_and_2) {
                  _and_1 = false;
                } else {
                  Property _property_7 = ex.getProperty();
                  boolean _isUnique = _property_7.isUnique();
                  _and_1 = _isUnique;
                }
                /* ex.property.multivalued && !ex.property.ordered && ex.property.unique */
                if (!_and_1) {
                  sneakyThrowRuleFailedException("ex.property.multivalued && !ex.property.ordered && ex.property.unique");
                }
                Property _property_8 = ex.getProperty();
                Type _type_2 = _property_8.getType();
                CollectionTypeReference _setOf = this.typeFactory.setOf(_type_2);
                result = _setOf;
              } catch (Exception e_2) {
                previousFailure = extractRuleFailedException(e_2);
                boolean _and_3 = false;
                boolean _and_4 = false;
                Property _property_9 = ex.getProperty();
                boolean _isMultivalued_3 = _property_9.isMultivalued();
                if (!_isMultivalued_3) {
                  _and_4 = false;
                } else {
                  Property _property_10 = ex.getProperty();
                  boolean _isOrdered_2 = _property_10.isOrdered();
                  boolean _not_2 = (!_isOrdered_2);
                  _and_4 = _not_2;
                }
                if (!_and_4) {
                  _and_3 = false;
                } else {
                  Property _property_11 = ex.getProperty();
                  boolean _isUnique_1 = _property_11.isUnique();
                  boolean _not_3 = (!_isUnique_1);
                  _and_3 = _not_3;
                }
                /* ex.property.multivalued && !ex.property.ordered && !ex.property.unique */
                if (!_and_3) {
                  sneakyThrowRuleFailedException("ex.property.multivalued && !ex.property.ordered && !ex.property.unique");
                }
                Property _property_12 = ex.getProperty();
                Type _type_3 = _property_12.getType();
                CollectionTypeReference _bagOf = this.typeFactory.bagOf(_type_3);
                result = _bagOf;
              }
            }
          }
        }
      }
    }
    return new Result<IUMLTypeReference>(result);
  }
  
  protected Result<IUMLTypeReference> typeImpl(final RuleEnvironment G, final RuleApplicationTrace _trace_, final AssociationAccessExpression ex) throws RuleFailedException {
    try {
    	final RuleApplicationTrace _subtrace_ = newTrace(_trace_);
    	final Result<IUMLTypeReference> _result_ = applyRuleAssociationAccessExpression(G, _subtrace_, ex);
    	addToTrace(_trace_, new Provider<Object>() {
    		public Object get() {
    			return ruleName("AssociationAccessExpression") + stringRepForEnv(G) + " |- " + stringRep(ex) + " : " + stringRep(_result_.getFirst());
    		}
    	});
    	addAsSubtrace(_trace_, _subtrace_);
    	return _result_;
    } catch (Exception e_applyRuleAssociationAccessExpression) {
    	typeThrowException(ruleName("AssociationAccessExpression") + stringRepForEnv(G) + " |- " + stringRep(ex) + " : " + "IUMLTypeReference",
    		ASSOCIATIONACCESSEXPRESSION,
    		e_applyRuleAssociationAccessExpression, ex, new ErrorInformation[] {new ErrorInformation(ex)});
    	return null;
    }
  }
  
  protected Result<IUMLTypeReference> applyRuleAssociationAccessExpression(final RuleEnvironment G, final RuleApplicationTrace _trace_, final AssociationAccessExpression ex) throws RuleFailedException {
    IUMLTypeReference result = null; // output parameter
    Property _association = ex.getAssociation();
    Type _type = _association.getType();
    IUMLTypeReference _typeReference = this.typeFactory.typeReference(_type);
    result = _typeReference;
    return new Result<IUMLTypeReference>(result);
  }
  
  protected Result<IUMLTypeReference> typeImpl(final RuleEnvironment G, final RuleApplicationTrace _trace_, final LinkOperationExpression ex) throws RuleFailedException {
    try {
    	final RuleApplicationTrace _subtrace_ = newTrace(_trace_);
    	final Result<IUMLTypeReference> _result_ = applyRuleLinkOperationExpression(G, _subtrace_, ex);
    	addToTrace(_trace_, new Provider<Object>() {
    		public Object get() {
    			return ruleName("LinkOperationExpression") + stringRepForEnv(G) + " |- " + stringRep(ex) + " : " + stringRep(_result_.getFirst());
    		}
    	});
    	addAsSubtrace(_trace_, _subtrace_);
    	return _result_;
    } catch (Exception e_applyRuleLinkOperationExpression) {
    	typeThrowException(ruleName("LinkOperationExpression") + stringRepForEnv(G) + " |- " + stringRep(ex) + " : " + "IUMLTypeReference",
    		LINKOPERATIONEXPRESSION,
    		e_applyRuleLinkOperationExpression, ex, new ErrorInformation[] {new ErrorInformation(ex)});
    	return null;
    }
  }
  
  protected Result<IUMLTypeReference> applyRuleLinkOperationExpression(final RuleEnvironment G, final RuleApplicationTrace _trace_, final LinkOperationExpression ex) throws RuleFailedException {
    IUMLTypeReference result = null; // output parameter
    /* { ex.operation == LinkOperation.LINK result = ex.association.typeReference } or { result = null } */
    {
      RuleFailedException previousFailure = null;
      try {
        LinkOperation _operation = ex.getOperation();
        boolean _equals = Objects.equal(_operation, LinkOperation.LINK);
        /* ex.operation == LinkOperation.LINK */
        if (!_equals) {
          sneakyThrowRuleFailedException("ex.operation == LinkOperation.LINK");
        }
        Association _association = ex.getAssociation();
        IUMLTypeReference _typeReference = this.typeFactory.typeReference(_association);
        result = _typeReference;
      } catch (Exception e) {
        previousFailure = extractRuleFailedException(e);
        result = null;
      }
    }
    return new Result<IUMLTypeReference>(result);
  }
  
  protected Result<IUMLTypeReference> typeImpl(final RuleEnvironment G, final RuleApplicationTrace _trace_, final ElementCollectionExpression ex) throws RuleFailedException {
    try {
    	final RuleApplicationTrace _subtrace_ = newTrace(_trace_);
    	final Result<IUMLTypeReference> _result_ = applyRuleCollectionConstructionExpression(G, _subtrace_, ex);
    	addToTrace(_trace_, new Provider<Object>() {
    		public Object get() {
    			return ruleName("CollectionConstructionExpression") + stringRepForEnv(G) + " |- " + stringRep(ex) + " : " + stringRep(_result_.getFirst());
    		}
    	});
    	addAsSubtrace(_trace_, _subtrace_);
    	return _result_;
    } catch (Exception e_applyRuleCollectionConstructionExpression) {
    	typeThrowException(ruleName("CollectionConstructionExpression") + stringRepForEnv(G) + " |- " + stringRep(ex) + " : " + "IUMLTypeReference",
    		COLLECTIONCONSTRUCTIONEXPRESSION,
    		e_applyRuleCollectionConstructionExpression, ex, new ErrorInformation[] {new ErrorInformation(ex)});
    	return null;
    }
  }
  
  protected Result<IUMLTypeReference> applyRuleCollectionConstructionExpression(final RuleEnvironment G, final RuleApplicationTrace _trace_, final ElementCollectionExpression ex) throws RuleFailedException {
    IUMLTypeReference result = null; // output parameter
    IUMLTypeReference _xifexpression = null;
    TypeDeclaration _typeDeclaration = ex.getTypeDeclaration();
    boolean _notEquals = (!Objects.equal(_typeDeclaration, null));
    if (_notEquals) {
      TypeDeclaration _typeDeclaration_1 = ex.getTypeDeclaration();
      _xifexpression = this.typeReferenceInternal(_trace_, _typeDeclaration_1);
    } else {
      _xifexpression = this.typeFactory.anyType();
    }
    final IUMLTypeReference valueType = _xifexpression;
    ExpressionList _elements = ex.getElements();
    EList<Expression> _expressions = _elements.getExpressions();
    for (final Expression element : _expressions) {
      /* G |- element : var IUMLTypeReference elType */
      IUMLTypeReference elType = null;
      Result<IUMLTypeReference> result_1 = typeInternal(G, _trace_, element);
      checkAssignableTo(result_1.getFirst(), IUMLTypeReference.class);
      elType = (IUMLTypeReference) result_1.getFirst();
      
      /* G |- valueType <: elType */
      subtypeReferenceInternal(G, _trace_, valueType, elType);
    }
    CollectionType _collectionType = ex.getCollectionType();
    boolean _notEquals_1 = (!Objects.equal(_collectionType, null));
    if (_notEquals_1) {
      CollectionType _collectionType_1 = ex.getCollectionType();
      CollectionTypeReference _collectionOf = this.typeFactory.collectionOf(valueType, _collectionType_1);
      result = _collectionOf;
    } else {
      CollectionTypeReference _sequenceOf = this.typeFactory.sequenceOf(valueType);
      result = _sequenceOf;
    }
    return new Result<IUMLTypeReference>(result);
  }
  
  protected Result<IUMLTypeReference> typeImpl(final RuleEnvironment G, final RuleApplicationTrace _trace_, final FeatureInvocationExpression ex) throws RuleFailedException {
    try {
    	final RuleApplicationTrace _subtrace_ = newTrace(_trace_);
    	final Result<IUMLTypeReference> _result_ = applyRuleFeatureInvocationExpression(G, _subtrace_, ex);
    	addToTrace(_trace_, new Provider<Object>() {
    		public Object get() {
    			return ruleName("FeatureInvocationExpression") + stringRepForEnv(G) + " |- " + stringRep(ex) + " : " + stringRep(_result_.getFirst());
    		}
    	});
    	addAsSubtrace(_trace_, _subtrace_);
    	return _result_;
    } catch (Exception e_applyRuleFeatureInvocationExpression) {
    	typeThrowException(ruleName("FeatureInvocationExpression") + stringRepForEnv(G) + " |- " + stringRep(ex) + " : " + "IUMLTypeReference",
    		FEATUREINVOCATIONEXPRESSION,
    		e_applyRuleFeatureInvocationExpression, ex, new ErrorInformation[] {new ErrorInformation(ex)});
    	return null;
    }
  }
  
  protected Result<IUMLTypeReference> applyRuleFeatureInvocationExpression(final RuleEnvironment G, final RuleApplicationTrace _trace_, final FeatureInvocationExpression ex) throws RuleFailedException {
    IUMLTypeReference result = null; // output parameter
    /* G |- ex.operation : result */
    Operation _operation = ex.getOperation();
    Result<IUMLTypeReference> result_1 = typeInternal(G, _trace_, _operation);
    checkAssignableTo(result_1.getFirst(), IUMLTypeReference.class);
    result = (IUMLTypeReference) result_1.getFirst();
    
    return new Result<IUMLTypeReference>(result);
  }
  
  protected Result<IUMLTypeReference> typeImpl(final RuleEnvironment G, final RuleApplicationTrace _trace_, final StaticFeatureInvocationExpression ex) throws RuleFailedException {
    try {
    	final RuleApplicationTrace _subtrace_ = newTrace(_trace_);
    	final Result<IUMLTypeReference> _result_ = applyRuleStaticFeatureInvocationExpression(G, _subtrace_, ex);
    	addToTrace(_trace_, new Provider<Object>() {
    		public Object get() {
    			return ruleName("StaticFeatureInvocationExpression") + stringRepForEnv(G) + " |- " + stringRep(ex) + " : " + stringRep(_result_.getFirst());
    		}
    	});
    	addAsSubtrace(_trace_, _subtrace_);
    	return _result_;
    } catch (Exception e_applyRuleStaticFeatureInvocationExpression) {
    	typeThrowException(ruleName("StaticFeatureInvocationExpression") + stringRepForEnv(G) + " |- " + stringRep(ex) + " : " + "IUMLTypeReference",
    		STATICFEATUREINVOCATIONEXPRESSION,
    		e_applyRuleStaticFeatureInvocationExpression, ex, new ErrorInformation[] {new ErrorInformation(ex)});
    	return null;
    }
  }
  
  protected Result<IUMLTypeReference> applyRuleStaticFeatureInvocationExpression(final RuleEnvironment G, final RuleApplicationTrace _trace_, final StaticFeatureInvocationExpression ex) throws RuleFailedException {
    IUMLTypeReference result = null; // output parameter
    /* G |- ex.operation : result */
    Operation _operation = ex.getOperation();
    Result<IUMLTypeReference> result_1 = typeInternal(G, _trace_, _operation);
    checkAssignableTo(result_1.getFirst(), IUMLTypeReference.class);
    result = (IUMLTypeReference) result_1.getFirst();
    
    return new Result<IUMLTypeReference>(result);
  }
  
  protected Result<IUMLTypeReference> typeImpl(final RuleEnvironment G, final RuleApplicationTrace _trace_, final Operation op) throws RuleFailedException {
    try {
    	final RuleApplicationTrace _subtrace_ = newTrace(_trace_);
    	final Result<IUMLTypeReference> _result_ = applyRuleOperation(G, _subtrace_, op);
    	addToTrace(_trace_, new Provider<Object>() {
    		public Object get() {
    			return ruleName("Operation") + stringRepForEnv(G) + " |- " + stringRep(op) + " : " + stringRep(_result_.getFirst());
    		}
    	});
    	addAsSubtrace(_trace_, _subtrace_);
    	return _result_;
    } catch (Exception e_applyRuleOperation) {
    	typeThrowException(ruleName("Operation") + stringRepForEnv(G) + " |- " + stringRep(op) + " : " + "IUMLTypeReference",
    		OPERATION,
    		e_applyRuleOperation, op, new ErrorInformation[] {new ErrorInformation(op)});
    	return null;
    }
  }
  
  protected Result<IUMLTypeReference> applyRuleOperation(final RuleEnvironment G, final RuleApplicationTrace _trace_, final Operation op) throws RuleFailedException {
    IUMLTypeReference result = null; // output parameter
    /* { op.getType == null result = voidType } or { result = op.getType.typeReference } */
    {
      RuleFailedException previousFailure = null;
      try {
        Type _type = op.getType();
        boolean _equals = Objects.equal(_type, null);
        /* op.getType == null */
        if (!_equals) {
          sneakyThrowRuleFailedException("op.getType == null");
        }
        IUMLTypeReference.VoidTypeReference _voidType = this.typeFactory.voidType();
        result = _voidType;
      } catch (Exception e) {
        previousFailure = extractRuleFailedException(e);
        Type _type_1 = op.getType();
        IUMLTypeReference _typeReference = this.typeFactory.typeReference(_type_1);
        result = _typeReference;
      }
    }
    return new Result<IUMLTypeReference>(result);
  }
  
  protected Result<IUMLTypeReference> typeImpl(final RuleEnvironment G, final RuleApplicationTrace _trace_, final FeatureLeftHandSide lhs) throws RuleFailedException {
    try {
    	final RuleApplicationTrace _subtrace_ = newTrace(_trace_);
    	final Result<IUMLTypeReference> _result_ = applyRuleFeatureLeftHandSide(G, _subtrace_, lhs);
    	addToTrace(_trace_, new Provider<Object>() {
    		public Object get() {
    			return ruleName("FeatureLeftHandSide") + stringRepForEnv(G) + " |- " + stringRep(lhs) + " : " + stringRep(_result_.getFirst());
    		}
    	});
    	addAsSubtrace(_trace_, _subtrace_);
    	return _result_;
    } catch (Exception e_applyRuleFeatureLeftHandSide) {
    	typeThrowException(ruleName("FeatureLeftHandSide") + stringRepForEnv(G) + " |- " + stringRep(lhs) + " : " + "IUMLTypeReference",
    		FEATURELEFTHANDSIDE,
    		e_applyRuleFeatureLeftHandSide, lhs, new ErrorInformation[] {new ErrorInformation(lhs)});
    	return null;
    }
  }
  
  protected Result<IUMLTypeReference> applyRuleFeatureLeftHandSide(final RuleEnvironment G, final RuleApplicationTrace _trace_, final FeatureLeftHandSide lhs) throws RuleFailedException {
    IUMLTypeReference result = null; // output parameter
    /* G |- lhs.expression : var IUMLTypeReference exType */
    PropertyAccessExpression _expression = lhs.getExpression();
    IUMLTypeReference exType = null;
    Result<IUMLTypeReference> result_1 = typeInternal(G, _trace_, _expression);
    checkAssignableTo(result_1.getFirst(), IUMLTypeReference.class);
    exType = (IUMLTypeReference) result_1.getFirst();
    
    result = exType;
    return new Result<IUMLTypeReference>(result);
  }
  
  protected Result<IUMLTypeReference> typeImpl(final RuleEnvironment G, final RuleApplicationTrace _trace_, final NameLeftHandSide lhs) throws RuleFailedException {
    try {
    	final RuleApplicationTrace _subtrace_ = newTrace(_trace_);
    	final Result<IUMLTypeReference> _result_ = applyRuleNameLeftHandSide(G, _subtrace_, lhs);
    	addToTrace(_trace_, new Provider<Object>() {
    		public Object get() {
    			return ruleName("NameLeftHandSide") + stringRepForEnv(G) + " |- " + stringRep(lhs) + " : " + stringRep(_result_.getFirst());
    		}
    	});
    	addAsSubtrace(_trace_, _subtrace_);
    	return _result_;
    } catch (Exception e_applyRuleNameLeftHandSide) {
    	typeThrowException(ruleName("NameLeftHandSide") + stringRepForEnv(G) + " |- " + stringRep(lhs) + " : " + "IUMLTypeReference",
    		NAMELEFTHANDSIDE,
    		e_applyRuleNameLeftHandSide, lhs, new ErrorInformation[] {new ErrorInformation(lhs)});
    	return null;
    }
  }
  
  protected Result<IUMLTypeReference> applyRuleNameLeftHandSide(final RuleEnvironment G, final RuleApplicationTrace _trace_, final NameLeftHandSide lhs) throws RuleFailedException {
    IUMLTypeReference result = null; // output parameter
    /* { lhs.index == null G |- lhs.expression : var IUMLTypeReference varType result = varType } or { G |- lhs.expression : var AbstractTypeReference varType result = varType.umlType.bagOf } */
    {
      RuleFailedException previousFailure = null;
      try {
        Expression _index = lhs.getIndex();
        boolean _equals = Objects.equal(_index, null);
        /* lhs.index == null */
        if (!_equals) {
          sneakyThrowRuleFailedException("lhs.index == null");
        }
        /* G |- lhs.expression : var IUMLTypeReference varType */
        NameExpression _expression = lhs.getExpression();
        IUMLTypeReference varType = null;
        Result<IUMLTypeReference> result_1 = typeInternal(G, _trace_, _expression);
        checkAssignableTo(result_1.getFirst(), IUMLTypeReference.class);
        varType = (IUMLTypeReference) result_1.getFirst();
        
        result = varType;
      } catch (Exception e) {
        previousFailure = extractRuleFailedException(e);
        /* G |- lhs.expression : var AbstractTypeReference varType */
        NameExpression _expression_1 = lhs.getExpression();
        AbstractTypeReference varType_1 = null;
        Result<IUMLTypeReference> result_2 = typeInternal(G, _trace_, _expression_1);
        checkAssignableTo(result_2.getFirst(), AbstractTypeReference.class);
        varType_1 = (AbstractTypeReference) result_2.getFirst();
        
        Type _umlType = varType_1.getUmlType();
        CollectionTypeReference _bagOf = this.typeFactory.bagOf(_umlType);
        result = _bagOf;
      }
    }
    return new Result<IUMLTypeReference>(result);
  }
}
