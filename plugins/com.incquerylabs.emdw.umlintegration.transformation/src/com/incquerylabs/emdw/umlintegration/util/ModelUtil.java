package com.incquerylabs.emdw.umlintegration.util;

import org.eclipse.emf.common.util.EList;
import org.eclipse.uml2.uml.Behavior;
import org.eclipse.uml2.uml.Constraint;
import org.eclipse.uml2.uml.OpaqueBehavior;
import org.eclipse.uml2.uml.OpaqueExpression;
import org.eclipse.uml2.uml.Operation;

public class ModelUtil {
	/**
	 * Return true if the given string represents an OpaqueBehavior's C++
	 * language code and false otherwise.
	 */
	public static boolean isCppLanguage(String lang) {
		return "C++".equals(lang) || "C/C++".equals(lang) || "C".equals(lang)
				|| "CPP".equals(lang);
	}

	/**
	 * Return the C++ code string associated with the given constraint. Returns
	 * null if there is no such code.
	 */
	public static String getCppCode(Constraint constraint) {
		String code = null;
		if (constraint.getSpecification() instanceof OpaqueExpression) {
			OpaqueExpression opaqueExpression = (OpaqueExpression) constraint
					.getSpecification();
			for (int i = 0; i < opaqueExpression.getLanguages().size(); ++i) {
				String language = opaqueExpression.getLanguages().get(i);
				if (isCppLanguage(language)) {
					if (code != null)
						throw new RuntimeException(
								"too many C++-compatible languages for "
										+ constraint.getQualifiedName());

					code = opaqueExpression.getBodies().get(i);
				}
			}
		}

		return null;
	}

	/**
	 * Return the C++ code string associated with the given behavior. Returns
	 * null if there is no such code.
	 */
	public static String getCppCode(Behavior behaviour) {
		String code = null;
		if (behaviour instanceof OpaqueBehavior) {
			OpaqueBehavior opaqueBehaviour = (OpaqueBehavior) behaviour;
			EList<String> languages = opaqueBehaviour.getLanguages();
			for (int i = 0; i < languages.size(); ++i) {
				String language = languages.get(i);
				if (isCppLanguage(language)) {
					if (code != null) {
						throw new RuntimeException(
								"too many C++-compatible languages for "
										+ behaviour.getQualifiedName());
					}
					EList<String> bodies = opaqueBehaviour.getBodies();
					if(bodies.size() > i) {
						code = bodies.get(i);
					}
				} else if("ralf".equalsIgnoreCase(language)) {
				    code = null;
				    return code;
				}
			}
		}

		return null;
	}

	/**
	 * Return the C++ code string associated with the given operation. Returns
	 * null if there is no such code.
	 */
	public static String getCppCode(Operation operation) {
		String code = null;
		for (Behavior behaviour : operation.getMethods()) {
			String cppCode = getCppCode(behaviour);
			//if (cppCode != null) {
				if (code == null)
					code = cppCode;
				else
					throw new RuntimeException(
							"too many C++-compatible behaviours for "
									+ operation.getQualifiedName());
			//}
		}

		return code;
	}
}
