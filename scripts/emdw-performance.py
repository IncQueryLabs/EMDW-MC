#!/usr/bin/env python3
"""
This script can be used for running performance tests on an exported Eclipse.

Put the script in the directory that contains the "eclipse" folder of
the exported application.

@author: Tamas Borbas
"""
import subprocess
import shutil
import os
import signal
import psutil
from subprocess import TimeoutExpired
from subprocess import CalledProcessError

"""
TIMEOUT is in seconds
"""
CONST_TIMEOUT=1000

"""
RUNS determines how many times the same test is run
"""
CONST_RUNS=5

"""
CONST_CONFIG_FOLDER specifies the folder that contains the configurations
"""
CONST_CONFIG_FOLDER="config-pingpong"

"""
CONST_RELATIVE_PATH specifies the relative path that is prepended to all input model paths
"""
CONST_RELATIVE_PATH="../git/EMDW-MC/tests/com.incquerylabs.emdw.cpp.bodyconverter.test/"

def flatten(lst):
    return sum(([x] if not isinstance(x, list) else flatten(x) for x in lst), [])

def kill_children(pid):
    print("Looking for children of", pid)
    for proc in psutil.process_iter():
        parent = proc.ppid()
        if parent == pid:
            print("Found children of ", pid, ": terminating!")
            proc.kill()

def starteclipses():
    configurations = os.listdir(CONST_CONFIG_FOLDER)
    configurations.sort()
    print("Found configurations: ", configurations)
    for config in configurations:
        timeoutOrError = False
        for runIndex in range(1,CONST_RUNS+1):
            print("Clearing workspace")
            shutil.rmtree("workspace", ignore_errors=True)
            configPath = CONST_CONFIG_FOLDER+"/"+config
            print("Running test with config: ", configPath, ", RUN: ", str(runIndex))
            param = flatten([configPath ,str(runIndex), "./results/", CONST_RELATIVE_PATH])
            p = subprocess.Popen(flatten(["eclipse/eclipse", param]))
            pid = p.pid
            try:
                p.wait(timeout=CONST_TIMEOUT)
            except TimeoutExpired:
                print(" >> Timed out after ", CONST_TIMEOUT, "s, continuing with the next configuration.")
                timeoutOrError = True
                kill_children(pid)
                break

if __name__ == "__main__":
    starteclipses()
