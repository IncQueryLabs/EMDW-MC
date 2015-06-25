package com.incquerylabs.uml.ralf.tests.util.parameterized;

public class ValueContainer<T> {
    private T value = null;

    public void set(T t) {
        value = t;
    }

    public T get() {
        return value;
    }

}
