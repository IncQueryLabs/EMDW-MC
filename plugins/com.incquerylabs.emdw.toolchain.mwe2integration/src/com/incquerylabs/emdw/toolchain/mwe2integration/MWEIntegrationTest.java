package com.incquerylabs.emdw.toolchain.mwe2integration;

import org.junit.Test;

public class MWEIntegrationTest {

    @Test
    public void test() {
        MWE2IntegrationRunner runner = new MWE2IntegrationRunner();
        runner.RunHeadlessEclipse();
    }
}