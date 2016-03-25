/*******************************************************************************
 * Copyright (c) 2015-2016 IncQuery Labs Ltd. and Ericsson AB
 * All rights reserved. This program and the accompanying materials
 * are made available under the terms of the Eclipse Public License v1.0
 * which accompanies this distribution, and is available at
 * http://www.eclipse.org/legal/epl-v10.html
 *
 * Contributors:
 *     Akos Horvath, Abel Hegedus, Zoltan Ujhelyi, Daniel Segesdi, Tamas Borbas, Peter Lunk - initial API and implementation
 *******************************************************************************/
package com.incquerylabs.emdw.xtuml.incquery;

import java.util.List;
import java.util.Map;
import java.util.Set;
import com.google.common.collect.ImmutableList;
import com.google.common.collect.ImmutableMap;
import com.google.common.collect.ImmutableSet;

import org.eclipse.incquery.validation.core.api.Severity;
import org.eclipse.incquery.validation.core.api.IConstraintSpecification;
import org.eclipse.incquery.runtime.api.IPatternMatch;
import org.eclipse.incquery.runtime.api.IQuerySpecification;
import org.eclipse.incquery.runtime.api.IncQueryMatcher;
import org.eclipse.incquery.runtime.exception.IncQueryException;

import com.incquerylabs.emdw.xtuml.incquery.util.TransitionTriggerWithoutSignalQuerySpecification;

public class TransitionTriggerWithoutSignalConstraint0 implements IConstraintSpecification {

    private TransitionTriggerWithoutSignalQuerySpecification querySpecification;

    public TransitionTriggerWithoutSignalConstraint0() throws IncQueryException {
        querySpecification = TransitionTriggerWithoutSignalQuerySpecification.instance();
    }

    @Override
    public String getMessageFormat() {
        return "Transition $transition$ has a trigger $trigger$ without signal";
    }


    @Override
    public Map<String,Object> getKeyObjects(IPatternMatch signature) {
        Map<String,Object> map = ImmutableMap.of(
            "trigger",signature.get("trigger")
        );
        return map;
    }

    @Override
    public List<String> getKeyNames() {
        List<String> keyNames = ImmutableList.of(
            "trigger"
        );
        return keyNames;
    }

    @Override
    public List<String> getPropertyNames() {
        List<String> propertyNames = ImmutableList.of(
            "transition"
        );
        return propertyNames;
    }

    @Override
    public Set<List<String>> getSymmetricPropertyNames() {
        Set<List<String>> symmetricPropertyNamesSet = ImmutableSet.<List<String>>of(
        );
        return symmetricPropertyNamesSet;
    }

    @Override
    public Set<List<String>> getSymmetricKeyNames() {
        Set<List<String>> symmetricKeyNamesSet = ImmutableSet.<List<String>>of(
        );
        return symmetricKeyNamesSet;
    }

    @Override
    public Severity getSeverity() {
        return Severity.ERROR;
    }

    @Override
    public IQuerySpecification<? extends IncQueryMatcher<? extends IPatternMatch>> getQuerySpecification() {
        return querySpecification;
    }

}
