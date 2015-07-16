package com.ericsson.xtumlrt.oopl.cppmodel;

import com.google.common.collect.ImmutableMap;
import com.google.common.collect.ImmutableMap.Builder;

public class CPPSequenceImplementationTemplateReplacer extends BaseContainerImplementationTemplateReplacer {
    
    /**************************************************
     * 
     * CPPSequenceImplementation templates
     * 
     **************************************************/
    
    public static String generateElementAtIndex(CPPSequenceImplementation impl, String collection, String index) {
        String template = impl.getElementAtIndexTemplate();
        Builder<String, String> map = ImmutableMap.builder();
        map.put("$collection$", collection);
        map.put("$index$", index);
        return generateTemplate(template, map.build());
    }
    
    public static String generateInsertElementAtIndex(CPPSequenceImplementation impl, String collection, String value, String index) {
        String template = impl.getInsertElementAtIndexTemplate();
        Builder<String, String> map = ImmutableMap.builder();
        map.put("$collection$", collection);
        map.put("$value$", value);
        map.put("$index$", index);
        return generateTemplate(template, map.build());
    }
    
    public static String generateReplaceElementAtIndex(CPPSequenceImplementation impl, String collection, String value, String index) {
        String template = impl.getReplaceElementAtIndexTemplate();
        Builder<String, String> map = ImmutableMap.builder();
        map.put("$collection$", collection);
        map.put("$value$", value);
        map.put("$index$", index);
        return generateTemplate(template, map.build());
    }

    public static String generateCountOf(CPPSequenceImplementation impl, String collection, String value) {
        String template = impl.getCountOfTemplate();
        Builder<String, String> map = ImmutableMap.builder();
        map.put("$collection$", collection);
        map.put("$value$", value);
        return generateTemplate(template, map.build());
    }
    
    public static String generateAny(CPPSequenceImplementation impl, String collection) {
        String template = impl.getAnyTemplate();
        Builder<String, String> map = ImmutableMap.builder();
        map.put("$collection$", collection);
        return generateTemplate(template, map.build());
    }
}
