package com.incquerylabs.emdw.toolchain.mwe2integration;

import org.junit.Test;

public class MWEIntegrationPluginTest {

    @Test
    public void test() {
        MWE2IntegrationRunner runner = new MWE2IntegrationRunner("src/com/incquerylabs/emdw/toolchain/mwe2integration/EMDWWorkflow.mwe2");
        runner.RunHeadlessEclipse();
    }
}