/**
 */
package com.ericsson.executablemodeling.xtuml.profile.executablemodelingprofile.impl;

import com.ericsson.executablemodeling.xtuml.profile.executablemodelingprofile.ExecutableModelingProfilePackage;
import com.ericsson.executablemodeling.xtuml.profile.executablemodelingprofile.XConstrainedType;

import com.ericsson.executablemodeling.xtuml.profile.executablemodelingprofile.util.ExecutableModelingProfileValidator;

import java.lang.reflect.InvocationTargetException;

import java.util.Map;

import org.eclipse.emf.common.notify.Notification;

import org.eclipse.emf.common.util.BasicDiagnostic;
import org.eclipse.emf.common.util.Diagnostic;
import org.eclipse.emf.common.util.DiagnosticChain;
import org.eclipse.emf.common.util.EList;

import org.eclipse.emf.ecore.EClass;
import org.eclipse.emf.ecore.InternalEObject;

import org.eclipse.emf.ecore.impl.ENotificationImpl;

import org.eclipse.emf.ecore.plugin.EcorePlugin;

import org.eclipse.emf.ecore.util.EObjectValidator;

import org.eclipse.uml2.uml.LiteralSpecification;
import org.eclipse.uml2.uml.PrimitiveType;

/**
 * <!-- begin-user-doc -->
 * An implementation of the model object '<em><b>XConstrained Type</b></em>'.
 * <!-- end-user-doc -->
 * <p>
 * The following features are implemented:
 * </p>
 * <ul>
 *   <li>{@link com.ericsson.executablemodeling.xtuml.profile.executablemodelingprofile.impl.XConstrainedTypeImpl#getBase_PrimitiveType <em>Base Primitive Type</em>}</li>
 *   <li>{@link com.ericsson.executablemodeling.xtuml.profile.executablemodelingprofile.impl.XConstrainedTypeImpl#getLowerBound <em>Lower Bound</em>}</li>
 *   <li>{@link com.ericsson.executablemodeling.xtuml.profile.executablemodelingprofile.impl.XConstrainedTypeImpl#getUpperBound <em>Upper Bound</em>}</li>
 *   <li>{@link com.ericsson.executablemodeling.xtuml.profile.executablemodelingprofile.impl.XConstrainedTypeImpl#isLowerBoundExclusive <em>Is Lower Bound Exclusive</em>}</li>
 *   <li>{@link com.ericsson.executablemodeling.xtuml.profile.executablemodelingprofile.impl.XConstrainedTypeImpl#isUpperBoundExclusive <em>Is Upper Bound Exclusive</em>}</li>
 * </ul>
 *
 * @generated
 */
public abstract class XConstrainedTypeImpl extends XClassifierImpl implements XConstrainedType {
	/**
	 * The cached value of the '{@link #getBase_PrimitiveType() <em>Base Primitive Type</em>}' reference.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @see #getBase_PrimitiveType()
	 * @generated
	 * @ordered
	 */
	protected PrimitiveType base_PrimitiveType;

	/**
	 * The cached value of the '{@link #getLowerBound() <em>Lower Bound</em>}' reference.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @see #getLowerBound()
	 * @generated
	 * @ordered
	 */
	protected LiteralSpecification lowerBound;

	/**
	 * The cached value of the '{@link #getUpperBound() <em>Upper Bound</em>}' reference.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @see #getUpperBound()
	 * @generated
	 * @ordered
	 */
	protected LiteralSpecification upperBound;

	/**
	 * The default value of the '{@link #isLowerBoundExclusive() <em>Is Lower Bound Exclusive</em>}' attribute.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @see #isLowerBoundExclusive()
	 * @generated
	 * @ordered
	 */
	protected static final boolean IS_LOWER_BOUND_EXCLUSIVE_EDEFAULT = false;

	/**
	 * The cached value of the '{@link #isLowerBoundExclusive() <em>Is Lower Bound Exclusive</em>}' attribute.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @see #isLowerBoundExclusive()
	 * @generated
	 * @ordered
	 */
	protected boolean isLowerBoundExclusive = IS_LOWER_BOUND_EXCLUSIVE_EDEFAULT;

	/**
	 * The default value of the '{@link #isUpperBoundExclusive() <em>Is Upper Bound Exclusive</em>}' attribute.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @see #isUpperBoundExclusive()
	 * @generated
	 * @ordered
	 */
	protected static final boolean IS_UPPER_BOUND_EXCLUSIVE_EDEFAULT = false;

	/**
	 * The cached value of the '{@link #isUpperBoundExclusive() <em>Is Upper Bound Exclusive</em>}' attribute.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @see #isUpperBoundExclusive()
	 * @generated
	 * @ordered
	 */
	protected boolean isUpperBoundExclusive = IS_UPPER_BOUND_EXCLUSIVE_EDEFAULT;

	/**
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 */
	protected XConstrainedTypeImpl() {
		super();
	}

	/**
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 */
	@Override
	protected EClass eStaticClass() {
		return ExecutableModelingProfilePackage.Literals.XCONSTRAINED_TYPE;
	}

	/**
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 */
	public PrimitiveType getBase_PrimitiveType() {
		if (base_PrimitiveType != null && base_PrimitiveType.eIsProxy()) {
			InternalEObject oldBase_PrimitiveType = (InternalEObject)base_PrimitiveType;
			base_PrimitiveType = (PrimitiveType)eResolveProxy(oldBase_PrimitiveType);
			if (base_PrimitiveType != oldBase_PrimitiveType) {
				if (eNotificationRequired())
					eNotify(new ENotificationImpl(this, Notification.RESOLVE, ExecutableModelingProfilePackage.XCONSTRAINED_TYPE__BASE_PRIMITIVE_TYPE, oldBase_PrimitiveType, base_PrimitiveType));
			}
		}
		return base_PrimitiveType;
	}

	/**
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 */
	public PrimitiveType basicGetBase_PrimitiveType() {
		return base_PrimitiveType;
	}

	/**
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 */
	public void setBase_PrimitiveType(PrimitiveType newBase_PrimitiveType) {
		PrimitiveType oldBase_PrimitiveType = base_PrimitiveType;
		base_PrimitiveType = newBase_PrimitiveType;
		if (eNotificationRequired())
			eNotify(new ENotificationImpl(this, Notification.SET, ExecutableModelingProfilePackage.XCONSTRAINED_TYPE__BASE_PRIMITIVE_TYPE, oldBase_PrimitiveType, base_PrimitiveType));
	}

	/**
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 */
	public LiteralSpecification getLowerBound() {
		if (lowerBound != null && lowerBound.eIsProxy()) {
			InternalEObject oldLowerBound = (InternalEObject)lowerBound;
			lowerBound = (LiteralSpecification)eResolveProxy(oldLowerBound);
			if (lowerBound != oldLowerBound) {
				if (eNotificationRequired())
					eNotify(new ENotificationImpl(this, Notification.RESOLVE, ExecutableModelingProfilePackage.XCONSTRAINED_TYPE__LOWER_BOUND, oldLowerBound, lowerBound));
			}
		}
		return lowerBound;
	}

	/**
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 */
	public LiteralSpecification basicGetLowerBound() {
		return lowerBound;
	}

	/**
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 */
	public void setLowerBound(LiteralSpecification newLowerBound) {
		LiteralSpecification oldLowerBound = lowerBound;
		lowerBound = newLowerBound;
		if (eNotificationRequired())
			eNotify(new ENotificationImpl(this, Notification.SET, ExecutableModelingProfilePackage.XCONSTRAINED_TYPE__LOWER_BOUND, oldLowerBound, lowerBound));
	}

	/**
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 */
	public LiteralSpecification getUpperBound() {
		if (upperBound != null && upperBound.eIsProxy()) {
			InternalEObject oldUpperBound = (InternalEObject)upperBound;
			upperBound = (LiteralSpecification)eResolveProxy(oldUpperBound);
			if (upperBound != oldUpperBound) {
				if (eNotificationRequired())
					eNotify(new ENotificationImpl(this, Notification.RESOLVE, ExecutableModelingProfilePackage.XCONSTRAINED_TYPE__UPPER_BOUND, oldUpperBound, upperBound));
			}
		}
		return upperBound;
	}

	/**
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 */
	public LiteralSpecification basicGetUpperBound() {
		return upperBound;
	}

	/**
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 */
	public void setUpperBound(LiteralSpecification newUpperBound) {
		LiteralSpecification oldUpperBound = upperBound;
		upperBound = newUpperBound;
		if (eNotificationRequired())
			eNotify(new ENotificationImpl(this, Notification.SET, ExecutableModelingProfilePackage.XCONSTRAINED_TYPE__UPPER_BOUND, oldUpperBound, upperBound));
	}

	/**
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 */
	public boolean isLowerBoundExclusive() {
		return isLowerBoundExclusive;
	}

	/**
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 */
	public void setIsLowerBoundExclusive(boolean newIsLowerBoundExclusive) {
		boolean oldIsLowerBoundExclusive = isLowerBoundExclusive;
		isLowerBoundExclusive = newIsLowerBoundExclusive;
		if (eNotificationRequired())
			eNotify(new ENotificationImpl(this, Notification.SET, ExecutableModelingProfilePackage.XCONSTRAINED_TYPE__IS_LOWER_BOUND_EXCLUSIVE, oldIsLowerBoundExclusive, isLowerBoundExclusive));
	}

	/**
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 */
	public boolean isUpperBoundExclusive() {
		return isUpperBoundExclusive;
	}

	/**
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 */
	public void setIsUpperBoundExclusive(boolean newIsUpperBoundExclusive) {
		boolean oldIsUpperBoundExclusive = isUpperBoundExclusive;
		isUpperBoundExclusive = newIsUpperBoundExclusive;
		if (eNotificationRequired())
			eNotify(new ENotificationImpl(this, Notification.SET, ExecutableModelingProfilePackage.XCONSTRAINED_TYPE__IS_UPPER_BOUND_EXCLUSIVE, oldIsUpperBoundExclusive, isUpperBoundExclusive));
	}

	/**
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 */
	public boolean xConstrainedTypePrimitiveType(DiagnosticChain diagnostics, Map<Object, Object> context) {
		// TODO: implement this method
		// -> specify the condition that violates the invariant
		// -> verify the details of the diagnostic, including severity and message
		// Ensure that you remove @generated or mark it @generated NOT
		if (false) {
			if (diagnostics != null) {
				diagnostics.add
					(new BasicDiagnostic
						(Diagnostic.ERROR,
						 ExecutableModelingProfileValidator.DIAGNOSTIC_SOURCE,
						 ExecutableModelingProfileValidator.XCONSTRAINED_TYPE__XCONSTRAINED_TYPE_PRIMITIVE_TYPE,
						 EcorePlugin.INSTANCE.getString("_UI_GenericInvariant_diagnostic", new Object[] { "xConstrainedTypePrimitiveType", EObjectValidator.getObjectLabel(this, context) }),
						 new Object [] { this }));
			}
			return false;
		}
		return true;
	}

	/**
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 */
	public boolean xConstrainedTypeBounds(DiagnosticChain diagnostics, Map<Object, Object> context) {
		// TODO: implement this method
		// -> specify the condition that violates the invariant
		// -> verify the details of the diagnostic, including severity and message
		// Ensure that you remove @generated or mark it @generated NOT
		if (false) {
			if (diagnostics != null) {
				diagnostics.add
					(new BasicDiagnostic
						(Diagnostic.ERROR,
						 ExecutableModelingProfileValidator.DIAGNOSTIC_SOURCE,
						 ExecutableModelingProfileValidator.XCONSTRAINED_TYPE__XCONSTRAINED_TYPE_BOUNDS,
						 EcorePlugin.INSTANCE.getString("_UI_GenericInvariant_diagnostic", new Object[] { "xConstrainedTypeBounds", EObjectValidator.getObjectLabel(this, context) }),
						 new Object [] { this }));
			}
			return false;
		}
		return true;
	}

	/**
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 */
	@Override
	public Object eGet(int featureID, boolean resolve, boolean coreType) {
		switch (featureID) {
			case ExecutableModelingProfilePackage.XCONSTRAINED_TYPE__BASE_PRIMITIVE_TYPE:
				if (resolve) return getBase_PrimitiveType();
				return basicGetBase_PrimitiveType();
			case ExecutableModelingProfilePackage.XCONSTRAINED_TYPE__LOWER_BOUND:
				if (resolve) return getLowerBound();
				return basicGetLowerBound();
			case ExecutableModelingProfilePackage.XCONSTRAINED_TYPE__UPPER_BOUND:
				if (resolve) return getUpperBound();
				return basicGetUpperBound();
			case ExecutableModelingProfilePackage.XCONSTRAINED_TYPE__IS_LOWER_BOUND_EXCLUSIVE:
				return isLowerBoundExclusive();
			case ExecutableModelingProfilePackage.XCONSTRAINED_TYPE__IS_UPPER_BOUND_EXCLUSIVE:
				return isUpperBoundExclusive();
		}
		return super.eGet(featureID, resolve, coreType);
	}

	/**
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 */
	@Override
	public void eSet(int featureID, Object newValue) {
		switch (featureID) {
			case ExecutableModelingProfilePackage.XCONSTRAINED_TYPE__BASE_PRIMITIVE_TYPE:
				setBase_PrimitiveType((PrimitiveType)newValue);
				return;
			case ExecutableModelingProfilePackage.XCONSTRAINED_TYPE__LOWER_BOUND:
				setLowerBound((LiteralSpecification)newValue);
				return;
			case ExecutableModelingProfilePackage.XCONSTRAINED_TYPE__UPPER_BOUND:
				setUpperBound((LiteralSpecification)newValue);
				return;
			case ExecutableModelingProfilePackage.XCONSTRAINED_TYPE__IS_LOWER_BOUND_EXCLUSIVE:
				setIsLowerBoundExclusive((Boolean)newValue);
				return;
			case ExecutableModelingProfilePackage.XCONSTRAINED_TYPE__IS_UPPER_BOUND_EXCLUSIVE:
				setIsUpperBoundExclusive((Boolean)newValue);
				return;
		}
		super.eSet(featureID, newValue);
	}

	/**
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 */
	@Override
	public void eUnset(int featureID) {
		switch (featureID) {
			case ExecutableModelingProfilePackage.XCONSTRAINED_TYPE__BASE_PRIMITIVE_TYPE:
				setBase_PrimitiveType((PrimitiveType)null);
				return;
			case ExecutableModelingProfilePackage.XCONSTRAINED_TYPE__LOWER_BOUND:
				setLowerBound((LiteralSpecification)null);
				return;
			case ExecutableModelingProfilePackage.XCONSTRAINED_TYPE__UPPER_BOUND:
				setUpperBound((LiteralSpecification)null);
				return;
			case ExecutableModelingProfilePackage.XCONSTRAINED_TYPE__IS_LOWER_BOUND_EXCLUSIVE:
				setIsLowerBoundExclusive(IS_LOWER_BOUND_EXCLUSIVE_EDEFAULT);
				return;
			case ExecutableModelingProfilePackage.XCONSTRAINED_TYPE__IS_UPPER_BOUND_EXCLUSIVE:
				setIsUpperBoundExclusive(IS_UPPER_BOUND_EXCLUSIVE_EDEFAULT);
				return;
		}
		super.eUnset(featureID);
	}

	/**
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 */
	@Override
	public boolean eIsSet(int featureID) {
		switch (featureID) {
			case ExecutableModelingProfilePackage.XCONSTRAINED_TYPE__BASE_PRIMITIVE_TYPE:
				return base_PrimitiveType != null;
			case ExecutableModelingProfilePackage.XCONSTRAINED_TYPE__LOWER_BOUND:
				return lowerBound != null;
			case ExecutableModelingProfilePackage.XCONSTRAINED_TYPE__UPPER_BOUND:
				return upperBound != null;
			case ExecutableModelingProfilePackage.XCONSTRAINED_TYPE__IS_LOWER_BOUND_EXCLUSIVE:
				return isLowerBoundExclusive != IS_LOWER_BOUND_EXCLUSIVE_EDEFAULT;
			case ExecutableModelingProfilePackage.XCONSTRAINED_TYPE__IS_UPPER_BOUND_EXCLUSIVE:
				return isUpperBoundExclusive != IS_UPPER_BOUND_EXCLUSIVE_EDEFAULT;
		}
		return super.eIsSet(featureID);
	}

	/**
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 */
	@Override
	@SuppressWarnings("unchecked")
	public Object eInvoke(int operationID, EList<?> arguments) throws InvocationTargetException {
		switch (operationID) {
			case ExecutableModelingProfilePackage.XCONSTRAINED_TYPE___XCONSTRAINED_TYPE_PRIMITIVE_TYPE__DIAGNOSTICCHAIN_MAP:
				return xConstrainedTypePrimitiveType((DiagnosticChain)arguments.get(0), (Map<Object, Object>)arguments.get(1));
			case ExecutableModelingProfilePackage.XCONSTRAINED_TYPE___XCONSTRAINED_TYPE_BOUNDS__DIAGNOSTICCHAIN_MAP:
				return xConstrainedTypeBounds((DiagnosticChain)arguments.get(0), (Map<Object, Object>)arguments.get(1));
		}
		return super.eInvoke(operationID, arguments);
	}

	/**
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 */
	@Override
	public String toString() {
		if (eIsProxy()) return super.toString();

		StringBuffer result = new StringBuffer(super.toString());
		result.append(" (isLowerBoundExclusive: ");
		result.append(isLowerBoundExclusive);
		result.append(", isUpperBoundExclusive: ");
		result.append(isUpperBoundExclusive);
		result.append(')');
		return result.toString();
	}

} //XConstrainedTypeImpl
