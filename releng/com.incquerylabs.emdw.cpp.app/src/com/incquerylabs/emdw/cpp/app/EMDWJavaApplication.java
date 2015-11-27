package com.incquerylabs.emdw.cpp.app;

public class EMDWJavaApplication {

    public static void main(String[] args) {
        try{
            EMDWApplication.main(args);
        } catch(Exception ex) {
            ex.printStackTrace();
        }
    }

}
