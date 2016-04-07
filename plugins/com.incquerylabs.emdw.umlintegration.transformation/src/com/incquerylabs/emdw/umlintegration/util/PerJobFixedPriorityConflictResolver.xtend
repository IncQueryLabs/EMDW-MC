/*******************************************************************************
 * Copyright (c) 2015-2016, IncQuery Labs Ltd. and Ericsson AB
 * All rights reserved. This program and the accompanying materials
 * are made available under the terms of the Eclipse Public License v1.0
 * which accompanies this distribution, and is available at
 * http://www.eclipse.org/legal/epl-v10.html
 *
 * Contributors:
 *   Akos Horvath, Abel Hegedus, Zoltan Ujhelyi, Daniel Segesdi, Tamas Borbas, Denes Harmath - initial API and implementation
 *******************************************************************************/
package com.incquerylabs.emdw.umlintegration.util

import java.util.Map
import org.eclipse.incquery.runtime.evm.api.Activation
import org.eclipse.incquery.runtime.evm.api.RuleSpecification
import org.eclipse.incquery.runtime.evm.specific.event.IncQueryActivationStateEnum
import org.eclipse.incquery.runtime.evm.specific.resolver.FixedPriorityConflictResolver
import org.eclipse.incquery.runtime.evm.specific.resolver.FixedPriorityConflictSet

import static com.google.common.base.Preconditions.checkArgument

class PerJobFixedPriorityConflictResolver extends FixedPriorityConflictResolver {

	override protected createReconfigurableConflictSet() {
		return new PerJobConflictSet(this, priorities)
	}

	static class PerJobConflictSet extends FixedPriorityConflictSet {

		new(FixedPriorityConflictResolver resolver, Map<RuleSpecification<?>, Integer> priorities) {
			super(resolver, priorities)
		}

		override protected getRulePriority(Activation<?> activation) {
			if (IncQueryActivationStateEnum.DISAPPEARED.equals(activation.state))
				return (-1) * super.getRulePriority(activation)
			return super.getRulePriority(activation)
		}

		override removeActivation(Activation<?> activation) {
			checkArgument(activation != null, "Activation cannot be null!")
			val rulePriority = getRulePriority(activation)
			var removed = priorityBuckets.remove(rulePriority, activation)
			val removedFromInverse = priorityBuckets.remove((-1) * rulePriority, activation)
			return removed || removedFromInverse
		}

	}
}
