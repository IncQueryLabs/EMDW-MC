package com.incquerylabs.emdw.cpp.app;

public class EMDWApplicationMain {

    public static void main(String[] args) {
        try{
            System.in.read();
            EMDWApplication.main(args);
        } catch(Exception ex) {
            ex.printStackTrace();
        }
    }

}
