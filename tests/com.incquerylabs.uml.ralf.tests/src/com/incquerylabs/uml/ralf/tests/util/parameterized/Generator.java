package com.incquerylabs.uml.ralf.tests.util.parameterized;

import org.junit.rules.TestRule;

public interface Generator<T> extends TestRule {
    public T value();
}
